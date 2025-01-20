@interface _SBUISystemApertureElementSourceAnimationContext
- (BOOL)canSkipRemoteSceneResizeActions;
- (BOOL)hasPendingCoordinatedAnimations;
- (BOOL)hasTransientLocalResizeAction;
- (void)addPendingAnimation:(id)a3;
- (void)addSceneResizeAction:(id)a3;
- (void)disableSkippingSceneResizeActions;
- (void)noteIsExpectingRemoteSceneResizeAction;
- (void)performPendingCoordinatedAnimations;
- (void)removeSceneResizeAction:(id)a3;
@end

@implementation _SBUISystemApertureElementSourceAnimationContext

- (BOOL)hasTransientLocalResizeAction
{
  return [(NSMutableSet *)self->_sceneResizeActions bs_containsObjectPassingTest:&__block_literal_global_35];
}

- (void)addSceneResizeAction:(id)a3
{
  id v4 = a3;
  sceneResizeActions = self->_sceneResizeActions;
  id v8 = v4;
  if (!sceneResizeActions)
  {
    v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = self->_sceneResizeActions;
    self->_sceneResizeActions = v6;

    id v4 = v8;
    sceneResizeActions = self->_sceneResizeActions;
  }
  [(NSMutableSet *)sceneResizeActions addObject:v4];
}

- (void)removeSceneResizeAction:(id)a3
{
  id v5 = a3;
  -[NSMutableSet removeObject:](self->_sceneResizeActions, "removeObject:");
  if (![(NSMutableSet *)self->_sceneResizeActions count])
  {
    sceneResizeActions = self->_sceneResizeActions;
    self->_sceneResizeActions = 0;
  }
  if (([v5 isTransientLocal] & 1) == 0) {
    [(_SBUISystemApertureElementSourceAnimationContext *)self disableSkippingSceneResizeActions];
  }
}

- (void)noteIsExpectingRemoteSceneResizeAction
{
  self->_canSkipRemoteSceneResizeActions = 1;
}

- (void)disableSkippingSceneResizeActions
{
  self->_canSkipRemoteSceneResizeActions = 0;
}

- (BOOL)hasPendingCoordinatedAnimations
{
  return [(NSMutableArray *)self->_pendingCoordinatedAnimations count] != 0;
}

- (void)addPendingAnimation:(id)a3
{
  id v4 = a3;
  pendingCoordinatedAnimations = self->_pendingCoordinatedAnimations;
  id v9 = v4;
  if (!pendingCoordinatedAnimations)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_pendingCoordinatedAnimations;
    self->_pendingCoordinatedAnimations = v6;

    pendingCoordinatedAnimations = self->_pendingCoordinatedAnimations;
  }
  id v8 = (void *)MEMORY[0x1AD0CF1C0]();
  [(NSMutableArray *)pendingCoordinatedAnimations addObject:v8];
}

- (void)performPendingCoordinatedAnimations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_pendingCoordinatedAnimations copy];
  if ([v3 count])
  {
    pendingCoordinatedAnimations = self->_pendingCoordinatedAnimations;
    self->_pendingCoordinatedAnimations = 0;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)canSkipRemoteSceneResizeActions
{
  return self->_canSkipRemoteSceneResizeActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCoordinatedAnimations, 0);
  objc_storeStrong((id *)&self->_sceneResizeActions, 0);
}

@end