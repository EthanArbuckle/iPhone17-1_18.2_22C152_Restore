@interface UIAccelerometer
+ (UIAccelerometer)sharedAccelerometer;
- (NSTimeInterval)updateInterval;
- (UIAccelerometer)init;
- (id)_motionManager;
- (id)delegate;
- (void)_acceleratedInX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6;
- (void)_startAccelerometerIfNecessary;
- (void)_stopAccelerometer;
- (void)dealloc;
- (void)setDelegate:(id)delegate;
- (void)setUpdateInterval:(NSTimeInterval)updateInterval;
@end

@implementation UIAccelerometer

+ (UIAccelerometer)sharedAccelerometer
{
  v3 = (void *)sharedAccelerometer_sharedAccelerometer;
  if (!sharedAccelerometer_sharedAccelerometer)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedAccelerometer_sharedAccelerometer;
    sharedAccelerometer_sharedAccelerometer = (uint64_t)v4;

    v3 = (void *)sharedAccelerometer_sharedAccelerometer;
  }
  return (UIAccelerometer *)v3;
}

- (UIAccelerometer)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIAccelerometer;
  v2 = [(UIAccelerometer *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__willResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v3 addObserver:v2 selector:sel__didSuspend_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [(UIAccelerometer *)v2 setUpdateInterval:0.1];
    id v4 = v2;
  }
  return v2;
}

- (void)dealloc
{
  [(CMMotionManager *)self->_motionManager stopAccelerometerUpdates];
  v3.receiver = self;
  v3.super_class = (Class)UIAccelerometer;
  [(UIAccelerometer *)&v3 dealloc];
}

- (void)setUpdateInterval:(NSTimeInterval)updateInterval
{
  self->_updateInterval = updateInterval;
  if (*(unsigned char *)&self->_accelerometerFlags)
  {
    id v4 = [(UIAccelerometer *)self _motionManager];
    v5 = v4;
    double v6 = self->_updateInterval;
    if (v6 <= 0.0) {
      double v6 = 0.1;
    }
    [v4 setAccelerometerUpdateInterval:v6];

    [(UIAccelerometer *)self _startAccelerometerIfNecessary];
  }
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj)
    {
      char v6 = objc_opt_respondsToSelector();
      self->_accelerometerFlags = ($9F6B055BE7F852DF8026941A3CCB1866)(*(_DWORD *)&self->_accelerometerFlags & 0xFFFFFFFE | v6 & 1);
      if (v6)
      {
        [(UIAccelerometer *)self _startAccelerometerIfNecessary];
LABEL_8:
        v5 = obj;
        goto LABEL_9;
      }
    }
    else
    {
      *(_DWORD *)&self->_accelerometerFlags &= ~1u;
    }
    [(UIAccelerometer *)self _stopAccelerometer];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_acceleratedInX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6
{
  if (*(unsigned char *)&self->_accelerometerFlags)
  {
    id v12 = (id)objc_opt_new();
    [v12 setTimestamp:a6];
    [v12 setX:a3];
    [v12 setY:a4];
    [v12 setZ:a5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained accelerometer:self didAccelerate:v12];
  }
}

- (id)_motionManager
{
  motionManager = self->_motionManager;
  if (!motionManager)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2050000000;
    id v4 = (void *)_MergedGlobals_1096;
    uint64_t v14 = _MergedGlobals_1096;
    if (!_MergedGlobals_1096)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getCMMotionManagerClass_block_invoke;
      v10[3] = &unk_1E52D9900;
      v10[4] = &v11;
      __getCMMotionManagerClass_block_invoke((uint64_t)v10);
      id v4 = (void *)v12[3];
    }
    v5 = v4;
    _Block_object_dispose(&v11, 8);
    char v6 = (CMMotionManager *)objc_alloc_init(v5);
    v7 = self->_motionManager;
    self->_motionManager = v6;

    BOOL v8 = [(CMMotionManager *)self->_motionManager isAccelerometerAvailable];
    motionManager = self->_motionManager;
    if (!v8)
    {
      self->_motionManager = 0;

      motionManager = self->_motionManager;
    }
  }
  return motionManager;
}

- (void)_startAccelerometerIfNecessary
{
  id v4 = [(UIAccelerometer *)self _motionManager];
  if (([v4 isAccelerometerActive] & 1) == 0)
  {
    $9F6B055BE7F852DF8026941A3CCB1866 accelerometerFlags = self->_accelerometerFlags;

    if ((*(unsigned char *)&accelerometerFlags & 1) == 0) {
      return;
    }
    id v4 = [(UIAccelerometer *)self _motionManager];
    [v4 setAccelerometerDataCallback:accelCallback info:self interval:self->_updateInterval];
  }
}

- (void)_stopAccelerometer
{
  objc_super v3 = [(UIAccelerometer *)self _motionManager];
  int v4 = [v3 isAccelerometerActive];

  if (v4)
  {
    id v5 = [(UIAccelerometer *)self _motionManager];
    [v5 stopAccelerometerUpdates];
  }
}

- (NSTimeInterval)updateInterval
{
  return self->_updateInterval;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end