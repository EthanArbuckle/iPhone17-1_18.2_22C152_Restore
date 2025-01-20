@interface RMMediaSessionObserver
- (RMRelativeMotionManager)manager;
- (void)setManager:(id)a3;
- (void)startSessionStatusUpdatesForClientMode:(int64_t)a3 toQueue:(id)a4 withHandler:(id)a5;
- (void)stopSessionStatusUpdates;
@end

@implementation RMMediaSessionObserver

- (void)startSessionStatusUpdatesForClientMode:(int64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  v17[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = [(RMMediaSessionObserver *)self manager];

  if (!v10)
  {
    v11 = [[RMRelativeMotionManager alloc] initWithQueue:v8];
    [(RMMediaSessionObserver *)self setManager:v11];

    v16[0] = *MEMORY[0x263F017E0];
    v12 = [NSNumber numberWithInteger:a3];
    v16[1] = *MEMORY[0x263F017E8];
    v17[0] = v12;
    v17[1] = &unk_26E9B06A0;
    v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    v14 = [(RMMediaSessionObserver *)self manager];
    [v14 setAudioListenerPoseOptions:v13];

    v15 = [(RMMediaSessionObserver *)self manager];
    [v15 startReceivingAudioListenerPoseWithStatusCallback:v9];
  }
}

- (void)stopSessionStatusUpdates
{
  v3 = [(RMMediaSessionObserver *)self manager];

  if (v3)
  {
    v4 = [(RMMediaSessionObserver *)self manager];
    [v4 stopReceivingAudioListenerPose];

    [(RMMediaSessionObserver *)self setManager:0];
  }
}

- (RMRelativeMotionManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end