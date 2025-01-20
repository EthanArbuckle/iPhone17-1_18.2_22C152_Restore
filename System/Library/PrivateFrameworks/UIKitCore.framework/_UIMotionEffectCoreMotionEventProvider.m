@interface _UIMotionEffectCoreMotionEventProvider
- (BOOL)shouldLogEvents;
- (_UIMotionEffectCoreMotionEventProvider)init;
- (double)fastUpdateIntervalForLogs;
- (double)slowUpdateIntervalForLogs;
- (id)currentEvent;
- (void)dealloc;
- (void)setSlowUpdatesEnabled:(BOOL)a3;
- (void)startGeneratingEvents;
- (void)stopGeneratingEvents;
@end

@implementation _UIMotionEffectCoreMotionEventProvider

- (void)stopGeneratingEvents
{
  [(NSOperationQueue *)self->_motionEventQueue cancelAllOperations];
  motionEventQueue = self->_motionEventQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62___UIMotionEffectCoreMotionEventProvider_stopGeneratingEvents__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(NSOperationQueue *)motionEventQueue addOperationWithBlock:v4];
}

- (void)startGeneratingEvents
{
  if ([(CMMotionManager *)self->_motionManager isDeviceMotionAvailable])
  {
    [(CMMotionManager *)self->_motionManager setNotificationCallback:_HandleMotionManagerNotification info:self];
    [(NSOperationQueue *)self->_motionEventQueue cancelAllOperations];
    motionEventQueue = self->_motionEventQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63___UIMotionEffectCoreMotionEventProvider_startGeneratingEvents__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    [(NSOperationQueue *)motionEventQueue addOperationWithBlock:v4];
  }
}

- (id)currentEvent
{
  v2 = [(CMMotionManager *)self->_motionManager deviceMotion];
  if (v2)
  {
    v3 = [_UIMotionEffectAttitudeEvent alloc];
    [v2 timestamp];
    double v5 = v4;
    v6 = [v2 attitude];
    [v6 quaternion];
    v11 = -[_UIMotionEffectAttitudeEvent initWithTimestamp:attitude:](v3, "initWithTimestamp:attitude:", v5, v7, v8, v9, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (_UIMotionEffectCoreMotionEventProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UIMotionEffectCoreMotionEventProvider;
  v2 = [(_UIMotionEffectCoreMotionEventProvider *)&v10 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    motionEventQueue = v2->_motionEventQueue;
    v2->_motionEventQueue = v3;

    [(NSOperationQueue *)v2->_motionEventQueue setMaxConcurrentOperationCount:1];
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    double v5 = (void *)_MergedGlobals_9_3;
    uint64_t v15 = _MergedGlobals_9_3;
    if (!_MergedGlobals_9_3)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getCMMotionManagerClass_block_invoke_0;
      v11[3] = &unk_1E52D9900;
      v11[4] = &v12;
      __getCMMotionManagerClass_block_invoke_0((uint64_t)v11);
      double v5 = (void *)v13[3];
    }
    v6 = v5;
    _Block_object_dispose(&v12, 8);
    uint64_t v7 = [[v6 alloc] initUsingGyroOnlySensorFusion];
    motionManager = v2->_motionManager;
    v2->_motionManager = (CMMotionManager *)v7;

    [(CMMotionManager *)v2->_motionManager setPowerConservationMode:1];
    [(CMMotionManager *)v2->_motionManager setDeviceMotionUpdateInterval:1.0 / _UIGetUIMotionEffectMotionUpdateFrequency()];
  }
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_motionEventQueue cancelAllOperations];
  [(NSOperationQueue *)self->_motionEventQueue waitUntilAllOperationsAreFinished];
  v3.receiver = self;
  v3.super_class = (Class)_UIMotionEffectCoreMotionEventProvider;
  [(_UIMotionEffectCoreMotionEventProvider *)&v3 dealloc];
}

- (void)setSlowUpdatesEnabled:(BOOL)a3
{
  if (a3)
  {
    int v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIMotionEffectMotionUpdateSlowFrequency, @"UIMotionEffectMotionUpdateSlowFrequency");
    double updated = *(double *)&qword_1E8FD5390;
    if (v4) {
      double updated = 5.0;
    }
  }
  else
  {
    double updated = _UIGetUIMotionEffectMotionUpdateFrequency();
  }
  motionManager = self->_motionManager;
  double v7 = 1.0 / updated;
  [(CMMotionManager *)motionManager setDeviceMotionCallback:_HandleNewDeviceMotion info:self interval:0 fsync:v7];
}

- (BOOL)shouldLogEvents
{
  return 1;
}

- (double)fastUpdateIntervalForLogs
{
  return 1.0 / _UIGetUIMotionEffectMotionUpdateFrequency();
}

- (double)slowUpdateIntervalForLogs
{
  int v2 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIMotionEffectMotionUpdateSlowFrequency, @"UIMotionEffectMotionUpdateSlowFrequency");
  double result = 1.0 / *(double *)&qword_1E8FD5390;
  if (v2) {
    return 0.2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionEventQueue, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end