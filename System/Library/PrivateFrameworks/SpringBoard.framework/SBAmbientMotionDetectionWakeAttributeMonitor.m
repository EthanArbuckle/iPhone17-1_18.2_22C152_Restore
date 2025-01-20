@interface SBAmbientMotionDetectionWakeAttributeMonitor
+ (SBAmbientMotionDetectionWakeAttributeMonitor)sharedInstance;
- (BOOL)shouldEnableMotionDetectionWake;
- (SBAmbientMotionDetectionWakeAttributeMonitor)init;
- (void)_setShouldEnableMotionDetectionWake:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SBAmbientMotionDetectionWakeAttributeMonitor

+ (SBAmbientMotionDetectionWakeAttributeMonitor)sharedInstance
{
  if (sharedInstance_onceToken_58 != -1) {
    dispatch_once(&sharedInstance_onceToken_58, &__block_literal_global_410);
  }
  v2 = (void *)sharedInstance_sharedInstance_8;
  return (SBAmbientMotionDetectionWakeAttributeMonitor *)v2;
}

void __62__SBAmbientMotionDetectionWakeAttributeMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBAmbientMotionDetectionWakeAttributeMonitor);
  v1 = (void *)sharedInstance_sharedInstance_8;
  sharedInstance_sharedInstance_8 = (uint64_t)v0;
}

- (SBAmbientMotionDetectionWakeAttributeMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBAmbientMotionDetectionWakeAttributeMonitor;
  v2 = [(SBAmbientMotionDetectionWakeAttributeMonitor *)&v7 init];
  if (v2)
  {
    v3 = [(id)SBApp blshService];
    v4 = [v3 localAssertionService];

    id v5 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v4];
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    objc_super v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)_setShouldEnableMotionDetectionWake:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_shouldEnableMotionDetectionWake != a3)
  {
    self->_shouldEnableMotionDetectionWake = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) motionDetectionWakeAttributeMonitor:self didUpdateShouldEnableMotionDetectionWake:self->_shouldEnableMotionDetectionWake];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)shouldEnableMotionDetectionWake
{
  return self->_shouldEnableMotionDetectionWake;
}

- (void).cxx_destruct
{
}

@end