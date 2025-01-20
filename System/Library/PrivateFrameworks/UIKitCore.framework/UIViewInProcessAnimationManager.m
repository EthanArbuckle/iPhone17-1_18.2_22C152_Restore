@interface UIViewInProcessAnimationManager
+ (id)sharedManager;
+ (void)_setExternalAnimationDriver:(id)a3;
- (BOOL)_isInvalidated;
- (BOOL)usesMainThreadExecution;
- (void)_advanceWithTime:(double)a3;
- (void)_applicationBecameActive;
- (void)_applicationDidEnterBackground;
- (void)_cancelAllAnimationsImmediately;
- (void)_setCurrentMediaTime:(double)a3;
- (void)setAdvancingOnCommitDisabled:(BOOL)a3;
- (void)setUsesMainThreadExecution:(BOOL)a3;
@end

@implementation UIViewInProcessAnimationManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UIViewInProcessAnimationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB264F48 != -1) {
    dispatch_once(&qword_1EB264F48, block);
  }
  v2 = (void *)_MergedGlobals_1316;
  return v2;
}

void __48__UIViewInProcessAnimationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1316;
  _MergedGlobals_1316 = (uint64_t)v1;
}

- (void)setUsesMainThreadExecution:(BOOL)a3
{
}

- (BOOL)usesMainThreadExecution
{
  return +[_UIViewInProcessAnimationManager usesMainThreadExecution];
}

- (void)_cancelAllAnimationsImmediately
{
}

+ (void)_setExternalAnimationDriver:(id)a3
{
}

- (void)_advanceWithTime:(double)a3
{
}

- (void)_setCurrentMediaTime:(double)a3
{
}

- (BOOL)_isInvalidated
{
  return +[_UIViewInProcessAnimationManager _isInvalidated];
}

- (void)_applicationDidEnterBackground
{
}

- (void)_applicationBecameActive
{
}

- (void)setAdvancingOnCommitDisabled:(BOOL)a3
{
}

@end