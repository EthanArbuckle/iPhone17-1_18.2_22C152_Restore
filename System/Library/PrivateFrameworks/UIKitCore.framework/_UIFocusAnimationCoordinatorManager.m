@interface _UIFocusAnimationCoordinatorManager
+ (id)activeCoordinatorMap;
+ (id)animationCoordinatorForContext:(id)a3;
- (NSHashTable)unfocusingItems;
- (NSMutableArray)inheritedAnimationCoordinatorActiveAnimationStack;
- (UIFocusAnimationCoordinator)activeFocusAnimationCoordinator;
- (UIFocusAnimationCoordinator)lastFocusingItemAnimationCoordinator;
- (_UIFocusAnimationCoordinatorManager)init;
- (double)lastFocusUpdateTime;
- (id)willUpdateFocusInContext:(id)a3;
- (void)_performDelayedFocusingAnimationIfNecessary;
- (void)_scheduleDelayedFocusingAnimationWithDelay:(double)a3;
- (void)didUpdateFocusInContext:(id)a3 fromItem:(id)a4;
- (void)setActiveFocusAnimationCoordinator:(id)a3;
- (void)setInheritedAnimationCoordinatorActiveAnimationStack:(id)a3;
- (void)setLastFocusUpdateTime:(double)a3;
- (void)setLastFocusingItemAnimationCoordinator:(id)a3;
@end

@implementation _UIFocusAnimationCoordinatorManager

- (_UIFocusAnimationCoordinatorManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusAnimationCoordinatorManager;
  v2 = [(_UIFocusAnimationCoordinatorManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    unfocusingItems = v2->_unfocusingItems;
    v2->_unfocusingItems = (NSHashTable *)v3;

    uint64_t v5 = objc_opt_new();
    inheritedAnimationCoordinatorActiveAnimationStack = v2->_inheritedAnimationCoordinatorActiveAnimationStack;
    v2->_inheritedAnimationCoordinatorActiveAnimationStack = (NSMutableArray *)v5;
  }
  return v2;
}

+ (id)activeCoordinatorMap
{
  if (qword_1EB2604C8 != -1) {
    dispatch_once(&qword_1EB2604C8, &__block_literal_global_199);
  }
  v2 = (void *)_MergedGlobals_1037;
  return v2;
}

+ (id)animationCoordinatorForContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 activeCoordinatorMap];
  v6 = [v5 objectForKey:v4];

  v7 = [v6 activeFocusAnimationCoordinator];

  return v7;
}

- (id)willUpdateFocusInContext:(id)a3
{
  id v5 = a3;
  v6 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:v5];

  if (v6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UIFocusAnimationCoordinatorManager.m" lineNumber:61 description:@"Unbalanced will/did update focus calls to focus animation manager."];
  }
  [(_UIFocusAnimationCoordinatorManager *)self _performDelayedFocusingAnimationIfNecessary];
  uint64_t v7 = [(_UIFocusAnimationCoordinatorManager *)self activeFocusAnimationCoordinator];
  if (v7)
  {
    id v8 = (id)v7;
    v9 = [(_UIFocusAnimationCoordinatorManager *)self inheritedAnimationCoordinatorActiveAnimationStack];
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "activeFocusAnimation"));
    [v9 addObject:v10];
  }
  else
  {
    id v8 = [[UIFocusAnimationCoordinator alloc] _initWithFocusUpdateContext:v5];
    [(_UIFocusAnimationCoordinatorManager *)self setActiveFocusAnimationCoordinator:v8];
  }
  v11 = [(id)objc_opt_class() activeCoordinatorMap];
  [v11 setObject:self forKey:v5];

  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 fromItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:v7];
  if (!v9)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"_UIFocusAnimationCoordinatorManager.m" lineNumber:81 description:@"Unbalanced will/did update focus calls to focus animation manager."];
  }
  v10 = [(_UIFocusAnimationCoordinatorManager *)self unfocusingItems];
  v11 = [v7 nextFocusedItem];
  double v12 = CACurrentMediaTime();
  [(_UIFocusAnimationCoordinatorManager *)self lastFocusUpdateTime];
  double v14 = v13;
  [(_UIFocusAnimationCoordinatorManager *)self setLastFocusUpdateTime:v12];
  [v9 _focusingAnimationDuration];
  double v16 = v15;
  v17 = [v9 _configurationForFocusAnimation:0];
  [v17 focusingDelay];
  double v19 = v18;

  v20 = [v9 _configurationForFocusAnimation:1];
  [v20 minimumFocusDuration];
  double v22 = v21;

  if (v11) {
    [v10 removeObject:v11];
  }
  [v9 _prepareForFocusAnimation:0];
  double v23 = fabs(v16);
  if (fabs(v19) < 2.22044605e-16 || v23 < 2.22044605e-16)
  {
    objc_msgSend(v9, "_animateFocusAnimation:", 0, 2.22044605e-16, v23);
    if (!v8) {
      goto LABEL_15;
    }
  }
  else
  {
    -[_UIFocusAnimationCoordinatorManager setLastFocusingItemAnimationCoordinator:](self, "setLastFocusingItemAnimationCoordinator:", v9, 2.22044605e-16, v23);
    [(_UIFocusAnimationCoordinatorManager *)self _scheduleDelayedFocusingAnimationWithDelay:v19];
    if (!v8) {
      goto LABEL_15;
    }
  }
  double v25 = v12 - v14;
  if (v25 < v22)
  {
    objc_initWeak(&location, v8);
    [v10 addObject:v8];
    dispatch_time_t v26 = dispatch_time(0, (uint64_t)((v22 - v25) * 1000000000.0));
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __72___UIFocusAnimationCoordinatorManager_didUpdateFocusInContext_fromItem___block_invoke;
    v37 = &unk_1E52EDBC8;
    id v38 = v9;
    objc_copyWeak(&v40, &location);
    id v39 = v10;
    dispatch_after(v26, MEMORY[0x1E4F14428], &v34);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }
LABEL_15:
  [v9 _prepareForFocusAnimation:1];
  [v9 _animateFocusAnimation:1];
LABEL_16:
  v27 = [(_UIFocusAnimationCoordinatorManager *)self inheritedAnimationCoordinatorActiveAnimationStack];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    v29 = [(_UIFocusAnimationCoordinatorManager *)self inheritedAnimationCoordinatorActiveAnimationStack];
    v30 = [v29 lastObject];

    objc_msgSend(v9, "_prepareForFocusAnimation:", objc_msgSend(v30, "integerValue"));
    v31 = [(_UIFocusAnimationCoordinatorManager *)self inheritedAnimationCoordinatorActiveAnimationStack];
    [v31 removeLastObject];
  }
  else
  {
    [(_UIFocusAnimationCoordinatorManager *)self setActiveFocusAnimationCoordinator:0];
  }
  v32 = [(id)objc_opt_class() activeCoordinatorMap];
  [v32 removeObjectForKey:v7];
}

- (void)_scheduleDelayedFocusingAnimationWithDelay:(double)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] cancelPreviousPerformRequestsWithTarget:self selector:sel__performDelayedFocusingAnimationIfNecessary object:0];
  v6[0] = *MEMORY[0x1E4F1C4B0];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(_UIFocusAnimationCoordinatorManager *)self performSelector:sel__performDelayedFocusingAnimationIfNecessary withObject:0 afterDelay:v5 inModes:a3];
}

- (void)_performDelayedFocusingAnimationIfNecessary
{
  [MEMORY[0x1E4F29060] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  uint64_t v3 = [(_UIFocusAnimationCoordinatorManager *)self lastFocusingItemAnimationCoordinator];
  if (v3)
  {
    id v4 = v3;
    [v3 _animateFocusAnimation:0];
    [(_UIFocusAnimationCoordinatorManager *)self setLastFocusingItemAnimationCoordinator:0];
    uint64_t v3 = v4;
  }
}

- (UIFocusAnimationCoordinator)activeFocusAnimationCoordinator
{
  return self->_activeFocusAnimationCoordinator;
}

- (void)setActiveFocusAnimationCoordinator:(id)a3
{
}

- (NSHashTable)unfocusingItems
{
  return self->_unfocusingItems;
}

- (double)lastFocusUpdateTime
{
  return self->_lastFocusUpdateTime;
}

- (void)setLastFocusUpdateTime:(double)a3
{
  self->_lastFocusUpdateTime = a3;
}

- (UIFocusAnimationCoordinator)lastFocusingItemAnimationCoordinator
{
  return self->_lastFocusingItemAnimationCoordinator;
}

- (void)setLastFocusingItemAnimationCoordinator:(id)a3
{
}

- (NSMutableArray)inheritedAnimationCoordinatorActiveAnimationStack
{
  return self->_inheritedAnimationCoordinatorActiveAnimationStack;
}

- (void)setInheritedAnimationCoordinatorActiveAnimationStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inheritedAnimationCoordinatorActiveAnimationStack, 0);
  objc_storeStrong((id *)&self->_lastFocusingItemAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->_unfocusingItems, 0);
  objc_storeStrong((id *)&self->_activeFocusAnimationCoordinator, 0);
}

@end