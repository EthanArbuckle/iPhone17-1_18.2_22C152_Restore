@interface SBAssistantGestureConfiguration
- (BOOL)shouldDismissForSwipesOutsideContent;
- (BOOL)shouldDismissForTapsOutsideContent;
- (BOOL)shouldPassTouchesThroughToSpringBoard;
- (BOOL)shouldShareHomeGesture;
- (BOOL)siriWantsToShowHomeAffordance;
- (NSHashTable)observers;
- (SBAssistantGestureConfiguration)initWithSiriPresentationViewController:(id)a3;
- (SiriPresentationSpringBoardMainScreenViewController)siriPresentationViewController;
- (int64_t)siriWantsHomeAffordanceSuppression;
- (void)_makeObserversPerformBlock:(id)a3;
- (void)addObserver:(id)a3;
- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeAffordanceSuppression:(int64_t)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeGestureSharing:(BOOL)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForSwipesOutsideContent:(BOOL)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForTapsOutsideContent:(BOOL)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldPassTouchesThroughToSpringBoard:(BOOL)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldShowHomeAffordance:(BOOL)a4;
- (void)notifyPanBeganAtPoint:(CGPoint)a3;
- (void)notifyTapAtPoint:(CGPoint)a3;
- (void)removeObserver:(id)a3;
- (void)setSiriWantsHomeAffordanceSuppression:(int64_t)a3;
- (void)setSiriWantsToShowHomeAffordance:(BOOL)a3;
- (void)shouldDismissForGestureAtLocation:(CGPoint)a3 completion:(id)a4;
@end

@implementation SBAssistantGestureConfiguration

- (SBAssistantGestureConfiguration)initWithSiriPresentationViewController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAssistantGestureConfiguration;
  v6 = [(SBAssistantGestureConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_siriPresentationViewController, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;
  }
  return v7;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v7;
    if (!v5)
    {
      v6 = [(SBAssistantGestureConfiguration *)self observers];
      [v6 addObject:v7];

      id v4 = v7;
    }
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBAssistantGestureConfiguration *)self observers];
    [v5 removeObject:v4];
  }
}

- (void)_makeObserversPerformBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(SBAssistantGestureConfiguration *)self observers];
  v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)shouldDismissForSwipesOutsideContent
{
  v2 = [(SBAssistantGestureConfiguration *)self siriPresentationViewController];
  char v3 = [v2 shouldDismissForSwipesOutsideContent];

  return v3;
}

- (BOOL)shouldDismissForTapsOutsideContent
{
  v2 = [(SBAssistantGestureConfiguration *)self siriPresentationViewController];
  char v3 = [v2 shouldDismissForTapsOutsideContent];

  return v3;
}

- (BOOL)shouldShareHomeGesture
{
  v2 = [(SBAssistantGestureConfiguration *)self siriPresentationViewController];
  char v3 = [v2 shareHomeGesture];

  return v3;
}

- (BOOL)shouldPassTouchesThroughToSpringBoard
{
  v2 = [(SBAssistantGestureConfiguration *)self siriPresentationViewController];
  char v3 = [v2 shouldPassTouchesThroughToSpringBoard];

  return v3;
}

- (void)shouldDismissForGestureAtLocation:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(SBAssistantGestureConfiguration *)self siriPresentationViewController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SBAssistantGestureConfiguration_shouldDismissForGestureAtLocation_completion___block_invoke;
  v10[3] = &unk_1E6AF5A50;
  id v11 = v7;
  id v9 = v7;
  objc_msgSend(v8, "hasContentAtPoint:completion:", v10, x, y);
}

void __80__SBAssistantGestureConfiguration_shouldDismissForGestureAtLocation_completion___block_invoke(uint64_t a1, char a2)
{
  char v2 = a2 ^ 1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__SBAssistantGestureConfiguration_shouldDismissForGestureAtLocation_completion___block_invoke_2;
  v3[3] = &unk_1E6AF7218;
  id v4 = *(id *)(a1 + 32);
  char v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __80__SBAssistantGestureConfiguration_shouldDismissForGestureAtLocation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)notifyPanBeganAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(SBAssistantGestureConfiguration *)self siriPresentationViewController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SBAssistantGestureConfiguration *)self siriPresentationViewController];
    objc_msgSend(v8, "notePanBeganAtPoint:", x, y);
  }
}

- (void)notifyTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(SBAssistantGestureConfiguration *)self siriPresentationViewController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SBAssistantGestureConfiguration *)self siriPresentationViewController];
    objc_msgSend(v8, "noteTapAtPoint:", x, y);
  }
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeGestureSharing:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543618;
    long long v12 = v7;
    __int16 v13 = 2114;
    long long v14 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateHomeGestureSharing___block_invoke;
  v9[3] = &unk_1E6AFC4A8;
  v9[4] = self;
  BOOL v10 = a4;
  [(SBAssistantGestureConfiguration *)self _makeObserversPerformBlock:v9];
}

uint64_t __93__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateHomeGestureSharing___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assistantGestureConfiguration:*(void *)(a1 + 32) didUpdateHomeGestureSharing:*(unsigned __int8 *)(a1 + 40)];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForTapsOutsideContent:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543618;
    long long v12 = v7;
    __int16 v13 = 2114;
    long long v14 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldDismissForTapsOutsideContent___block_invoke;
  v9[3] = &unk_1E6AFC4A8;
  v9[4] = self;
  BOOL v10 = a4;
  [(SBAssistantGestureConfiguration *)self _makeObserversPerformBlock:v9];
}

uint64_t __109__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldDismissForTapsOutsideContent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assistantGestureConfiguration:*(void *)(a1 + 32) didUpdateShouldDismissForTapsOutsideContent:*(unsigned __int8 *)(a1 + 40)];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForSwipesOutsideContent:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543618;
    long long v12 = v7;
    __int16 v13 = 2114;
    long long v14 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __111__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldDismissForSwipesOutsideContent___block_invoke;
  v9[3] = &unk_1E6AFC4A8;
  v9[4] = self;
  BOOL v10 = a4;
  [(SBAssistantGestureConfiguration *)self _makeObserversPerformBlock:v9];
}

uint64_t __111__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldDismissForSwipesOutsideContent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assistantGestureConfiguration:*(void *)(a1 + 32) didUpdateShouldDismissForSwipesOutsideContent:*(unsigned __int8 *)(a1 + 40)];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldPassTouchesThroughToSpringBoard:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543618;
    long long v12 = v7;
    __int16 v13 = 2114;
    long long v14 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldPassTouchesThroughToSpringBoard___block_invoke;
  v9[3] = &unk_1E6AFC4A8;
  v9[4] = self;
  BOOL v10 = a4;
  [(SBAssistantGestureConfiguration *)self _makeObserversPerformBlock:v9];
}

uint64_t __112__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldPassTouchesThroughToSpringBoard___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assistantGestureConfiguration:*(void *)(a1 + 32) didUpdateShouldPassTouchesThroughToSpringBoard:*(unsigned __int8 *)(a1 + 40)];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldShowHomeAffordance:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543618;
    long long v12 = v7;
    __int16 v13 = 2114;
    long long v14 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  [(SBAssistantGestureConfiguration *)self setSiriWantsToShowHomeAffordance:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldShowHomeAffordance___block_invoke;
  v9[3] = &unk_1E6AFC4A8;
  v9[4] = self;
  BOOL v10 = v4;
  [(SBAssistantGestureConfiguration *)self _makeObserversPerformBlock:v9];
}

uint64_t __99__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldShowHomeAffordance___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assistantGestureConfiguration:*(void *)(a1 + 32) didUpdateShouldShowHomeAffordance:*(unsigned __int8 *)(a1 + 40)];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeAffordanceSuppression:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = _SBFLoggingMethodProem();
    id v8 = [NSString stringWithSiriHomeAffordanceSuppression:a4];
    *(_DWORD *)buf = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  if ((unint64_t)a4 <= 2) {
    [(SBAssistantGestureConfiguration *)self setSiriWantsToShowHomeAffordance:(a4 & 1) == 0];
  }
  [(SBAssistantGestureConfiguration *)self setSiriWantsHomeAffordanceSuppression:a4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateHomeAffordanceSuppression___block_invoke;
  v9[3] = &unk_1E6AFC4D0;
  v9[4] = self;
  void v9[5] = a4;
  [(SBAssistantGestureConfiguration *)self _makeObserversPerformBlock:v9];
}

uint64_t __100__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateHomeAffordanceSuppression___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assistantGestureConfiguration:*(void *)(a1 + 32) didUpdateHomeAffordanceSuppression:*(void *)(a1 + 40)];
}

- (SiriPresentationSpringBoardMainScreenViewController)siriPresentationViewController
{
  return self->_siriPresentationViewController;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BOOL)siriWantsToShowHomeAffordance
{
  return self->_siriWantsToShowHomeAffordance;
}

- (void)setSiriWantsToShowHomeAffordance:(BOOL)a3
{
  self->_siriWantsToShowHomeAffordance = a3;
}

- (int64_t)siriWantsHomeAffordanceSuppression
{
  return self->_siriWantsHomeAffordanceSuppression;
}

- (void)setSiriWantsHomeAffordanceSuppression:(int64_t)a3
{
  self->_siriWantsHomeAffordanceSuppression = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriPresentationViewController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end