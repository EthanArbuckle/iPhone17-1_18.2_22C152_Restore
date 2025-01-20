@interface MNCoreMotionContextProvider
- (GEOMotionContextProviderDelegate)motionDelegate;
- (MNCoreMotionContextProvider)initWithTraceRecorder:(id)a3;
- (void)dealloc;
- (void)setMotionDelegate:(id)a3;
- (void)startMotionUpdates;
- (void)stopMotionUpdates;
@end

@implementation MNCoreMotionContextProvider

- (MNCoreMotionContextProvider)initWithTraceRecorder:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNCoreMotionContextProvider;
  v6 = [(MNCoreMotionContextProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_traceRecorder, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  [(MNCoreMotionContextProvider *)self stopMotionUpdates];
  v3.receiver = self;
  v3.super_class = (Class)MNCoreMotionContextProvider;
  [(MNCoreMotionContextProvider *)&v3 dealloc];
}

- (void)startMotionUpdates
{
  if (!self->_activityManager)
  {
    objc_super v3 = (CMActivityManager *)objc_alloc_init(MEMORY[0x1E4F22198]);
    activityManager = self->_activityManager;
    self->_activityManager = v3;
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MNCoreMotionContextProvider_startMotionUpdates__block_invoke;
  v5[3] = &unk_1E60FB2C8;
  objc_copyWeak(&v6, &location);
  [(CMActivityManager *)self->_activityManager setActivityHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __49__MNCoreMotionContextProvider_startMotionUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  objc_super v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [v11 isMoving];
  if ([v11 isWalking]) {
    v5 |= 2uLL;
  }
  if ([v11 isRunning]) {
    v5 |= 4uLL;
  }
  if ([v11 isDriving]) {
    v5 |= 0x10uLL;
  }
  if ([v11 hasExitedVehicle]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = [v11 maybeExitingVehicle];
  }
  uint64_t v7 = [v11 confidence];
  if (WeakRetained) {
    [WeakRetained[3] recordMotionUpdate:v5 exitType:v6 confidence:v7];
  }
  id v8 = objc_loadWeakRetained(v3);
  v9 = [v8 motionDelegate];
  id v10 = objc_loadWeakRetained(v3);
  [v9 motionContextProvider:v10 didUpdateMotion:v5 exitType:v6 confidence:v7];
}

- (void)stopMotionUpdates
{
  [(CMActivityManager *)self->_activityManager setActivityHandler:0];
  activityManager = self->_activityManager;
  self->_activityManager = 0;
}

- (GEOMotionContextProviderDelegate)motionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (GEOMotionContextProviderDelegate *)WeakRetained;
}

- (void)setMotionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end