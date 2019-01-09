# Start python server

require "./gym_client"

remote_base = "http://127.0.0.1:5000"
client = Client.new(remote_base)

# Create environment
env_id = "MountainCar-v0"
instance_id = client.env_create(env_id)

# Check properties
all_envs = client.env_list_all
pp! all_envs
action_info = client.env_action_space_info(instance_id)
pp! action_info

# obs_info = client.env_observation_space_info(instance_id)
# pp! obs_info

# Run a single step
client.env_monitor_start(instance_id, directory="tmp", force=true, video_callable=true)

init_obs = client.env_reset(instance_id)
pp! init_obs

pp! client.env_step(instance_id, 1, render: true)

arr = client.env_step(instance_id, 1, true)
client.env_monitor_close(instance_id)

# # API Key required
# client.upload(training_dir="tmp")
