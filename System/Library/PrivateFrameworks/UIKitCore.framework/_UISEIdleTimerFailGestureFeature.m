@interface _UISEIdleTimerFailGestureFeature
- (_UISEIdleTimerFailGestureFeature)initWithSettings:(id)a3;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
@end

@implementation _UISEIdleTimerFailGestureFeature

- (_UISEIdleTimerFailGestureFeature)initWithSettings:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UISEIdleTimerFailGestureFeature;
  v4 = [(_UISEIdleTimerFailGestureFeature *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_settings, a3);
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __55___UISEIdleTimerFailGestureFeature__incorporateSample___block_invoke;
  v11 = &unk_1E52DC308;
  objc_copyWeak(&v12, &location);
  v5 = _Block_copy(&v8);
  if (!a3->var0)
  {
    [(_UISEGestureFeatureSettings *)self->_settings maximumSwipeDuration];
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_after(v7, MEMORY[0x1E4F14428], v5);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

@end