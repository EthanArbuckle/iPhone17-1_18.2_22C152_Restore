@interface SBWindowLevelAssertionManager
- (NSMapTable)windowLevelAssertionsPerScene;
- (NSString)debugDescription;
- (SBWindowLevelAssertionManager)init;
- (SBWindowLevelAssertionManagerDelegate)delegate;
- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)highestPriorityWindowLevelAssertionForWindowScene:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_notifyDelegateAssertionsDidUpdateForWindowScene:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBWindowLevelAssertionManager

- (SBWindowLevelAssertionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBWindowLevelAssertionManager;
  v2 = [(SBWindowLevelAssertionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    windowLevelAssertionsPerScene = v2->_windowLevelAssertionsPerScene;
    v2->_windowLevelAssertionsPerScene = (NSMapTable *)v3;
  }
  return v2;
}

- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v12 = [SBWindowLevelAssertion alloc];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__SBWindowLevelAssertionManager_acquireWindowLevelAssertionWithPriority_windowLevel_windowScene_reason___block_invoke;
  v23[3] = &unk_1E6B06860;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(&v25, &from);
  v13 = [(SBWindowLevelAssertion *)v12 initWithPriority:a3 windowLevel:v11 reason:v23 invalidationHandler:a4];
  v14 = [(SBWindowLevelAssertionManager *)self windowLevelAssertionsPerScene];
  v15 = [v14 objectForKey:v10];

  if (!v15)
  {
    v15 = [MEMORY[0x1E4F1CA48] array];
    v16 = [(SBWindowLevelAssertionManager *)self windowLevelAssertionsPerScene];
    [v16 setObject:v15 forKey:v10];
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v22 = [v15 count];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__SBWindowLevelAssertionManager_acquireWindowLevelAssertionWithPriority_windowLevel_windowScene_reason___block_invoke_2;
  v18[3] = &unk_1E6B06888;
  v18[4] = &v19;
  v18[5] = a3;
  [v15 enumerateObjectsUsingBlock:v18];
  [v15 insertObject:v13 atIndex:v20[3]];
  [(SBWindowLevelAssertionManager *)self _notifyDelegateAssertionsDidUpdateForWindowScene:v10];
  _Block_object_dispose(&v19, 8);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v13;
}

void __104__SBWindowLevelAssertionManager_acquireWindowLevelAssertionWithPriority_windowLevel_windowScene_reason___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    objc_super v6 = [WeakRetained windowLevelAssertionsPerScene];
    v7 = [v6 objectForKey:v5];

    if ([v7 containsObject:v9])
    {
      [v7 removeObject:v9];
      if (![v7 count])
      {
        v8 = [WeakRetained windowLevelAssertionsPerScene];
        [v8 removeObjectForKey:v5];
      }
      [WeakRetained _notifyDelegateAssertionsDidUpdateForWindowScene:v5];
    }
  }
}

uint64_t __104__SBWindowLevelAssertionManager_acquireWindowLevelAssertionWithPriority_windowLevel_windowScene_reason___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t result = [a2 priority];
  if (v7 < result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)highestPriorityWindowLevelAssertionForWindowScene:(id)a3
{
  id v4 = a3;
  v5 = [(SBWindowLevelAssertionManager *)self windowLevelAssertionsPerScene];
  objc_super v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)[(SBWindowLevelAssertionManager *)self descriptionWithMultilinePrefix:0];
}

- (void)_notifyDelegateAssertionsDidUpdateForWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWindowLevelAssertionManager *)self delegate];
  [v5 windowLevelAssertionManager:self didUpdateAssertionsForWindowScene:v4];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBWindowLevelAssertionManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  objc_super v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__SBWindowLevelAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __71__SBWindowLevelAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) windowLevelAssertionsPerScene];
  id v2 = (id)[v1 appendObject:v3 withName:@"windowLevelAssertionsPerScene"];
}

- (id)succinctDescription
{
  id v2 = [(SBWindowLevelAssertionManager *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (SBWindowLevelAssertionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBWindowLevelAssertionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMapTable)windowLevelAssertionsPerScene
{
  return self->_windowLevelAssertionsPerScene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowLevelAssertionsPerScene, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end