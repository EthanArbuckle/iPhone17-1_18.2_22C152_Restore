@interface SBDeviceMotionDetector
- (SBDeviceMotionDetector)init;
- (SBDeviceMotionVector)gravity;
- (SBDeviceMotionVector)rotationRate;
- (id)_initWithGravity:(id)a3 rotationRate:(id)a4;
- (void)startWithTimeout:(double)a3;
- (void)stop;
@end

@implementation SBDeviceMotionDetector

- (SBDeviceMotionDetector)init
{
  v3 = objc_alloc_init(SBDeviceMotionVector);
  v4 = objc_alloc_init(SBDeviceMotionVector);
  v5 = [(SBDeviceMotionDetector *)self _initWithGravity:v3 rotationRate:v4];

  return v5;
}

- (id)_initWithGravity:(id)a3 rotationRate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBDeviceMotionDetector;
  v9 = [(SBDeviceMotionDetector *)&v13 init];
  if (v9)
  {
    v10 = (CMMotionManager *)objc_alloc_init(MEMORY[0x1E4F22230]);
    motionManager = v9->_motionManager;
    v9->_motionManager = v10;

    objc_storeStrong((id *)&v9->_gravity, a3);
    objc_storeStrong((id *)&v9->_rotationRate, a4);
  }

  return v9;
}

- (void)startWithTimeout:(double)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_started)
  {
    [(CMMotionManager *)v4->_motionManager startDeviceMotionUpdates];
    v4->_started = 1;
  }
  if (a3 != 0.0)
  {
    [(NSTimer *)v4->_stopTimer invalidate];
    objc_initWeak(&location, v4);
    v5 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__SBDeviceMotionDetector_startWithTimeout___block_invoke;
    v8[3] = &unk_1E6AF61A0;
    objc_copyWeak(&v9, &location);
    uint64_t v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:a3];
    stopTimer = v4->_stopTimer;
    v4->_stopTimer = (NSTimer *)v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v4);
}

void __43__SBDeviceMotionDetector_startWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stop];
}

- (void)stop
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_started)
  {
    [(NSTimer *)obj->_stopTimer invalidate];
    stopTimer = obj->_stopTimer;
    obj->_stopTimer = 0;

    [(CMMotionManager *)obj->_motionManager stopDeviceMotionUpdates];
    obj->_started = 0;
  }
  objc_sync_exit(obj);
}

- (SBDeviceMotionVector)gravity
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(CMMotionManager *)v2->_motionManager deviceMotion];
  [v3 gravity];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  v10 = [[SBDeviceMotionVector alloc] initWithX:v5 y:v7 z:v9];
  gravity = v2->_gravity;
  v2->_gravity = v10;

  objc_sync_exit(v2);
  v12 = v2->_gravity;
  return v12;
}

- (SBDeviceMotionVector)rotationRate
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(CMMotionManager *)v2->_motionManager deviceMotion];
  [v3 rotationRate];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  v10 = [[SBDeviceMotionVector alloc] initWithX:v5 y:v7 z:v9];
  rotationRate = v2->_rotationRate;
  v2->_rotationRate = v10;

  objc_sync_exit(v2);
  v12 = v2->_rotationRate;
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopTimer, 0);
  objc_storeStrong((id *)&self->_rotationRate, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end