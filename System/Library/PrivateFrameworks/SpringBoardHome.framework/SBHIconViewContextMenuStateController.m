@interface SBHIconViewContextMenuStateController
+ (SBHIconViewContextMenuStateController)sharedInstance;
- (BOOL)areAnyIconViewContextMenusAnimating;
- (BOOL)areAnyIconViewContextMenusShowing;
- (SBHIconViewContextMenuStateController)init;
- (void)_firePendingIconAnimationBlocks;
- (void)containerViewDidScrollHiddenIconViewAway:(id)a3;
- (void)dismissAppIconForceTouchControllers:(id)a3;
- (void)earlyTerminateAnyContextMenuAnimations;
- (void)iconViewDidAnimateContextMenu:(id)a3;
- (void)iconViewWillAnimateContextMenu:(id)a3;
- (void)iconViewWillDismissContextMenu:(id)a3;
- (void)iconViewWillPresentContextMenu:(id)a3;
- (void)noteFolderControllerWillClose:(id)a3;
- (void)performAfterContextMenuAnimationsHaveCompleted:(id)a3;
- (void)registerIconView:(id)a3;
- (void)unregisterIconView:(id)a3;
@end

@implementation SBHIconViewContextMenuStateController

+ (SBHIconViewContextMenuStateController)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (SBHIconViewContextMenuStateController *)v2;
}

- (void)registerIconView:(id)a3
{
  id v4 = a3;
  iconViews = self->_iconViews;
  id v9 = v4;
  if (!iconViews)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_iconViews;
    self->_iconViews = v6;

    goto LABEL_5;
  }
  if (!-[NSHashTable containsObject:](iconViews, "containsObject:"))
  {
LABEL_5:
    [(NSHashTable *)self->_iconViews addObject:v9];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel_iconViewWillPresentContextMenu_ name:@"SBIconViewWillPresentContextMenuNotification" object:v9];
    [v8 addObserver:self selector:sel_iconViewWillDismissContextMenu_ name:@"SBIconViewWillDismissContextMenuNotification" object:v9];
    [v8 addObserver:self selector:sel_iconViewWillAnimateContextMenu_ name:@"SBIconViewWillAnimateContextMenuNotification" object:v9];
    [v8 addObserver:self selector:sel_iconViewDidAnimateContextMenu_ name:@"SBIconViewDidAnimateContextMenuNotification" object:v9];
  }
}

- (void)unregisterIconView:(id)a3
{
  iconViews = self->_iconViews;
  id v5 = a3;
  [(NSHashTable *)iconViews removeObject:v5];
  [(NSHashTable *)self->_iconViewsPresentingContextMenues removeObject:v5];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"SBIconViewWillPresentContextMenuNotification" object:v5];
  [v6 removeObserver:self name:@"SBIconViewWillDismissContextMenuNotification" object:v5];
  [v6 removeObserver:self name:@"SBIconViewWillAnimateContextMenuNotification" object:v5];
  [v6 removeObserver:self name:@"SBIconViewDidAnimateContextMenuNotification" object:v5];
}

- (BOOL)areAnyIconViewContextMenusShowing
{
  return [(NSHashTable *)self->_iconViewsPresentingContextMenues count] != 0;
}

- (void)dismissAppIconForceTouchControllers:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke;
  aBlock[3] = &unk_1E6AAD7B8;
  v45 = v46;
  aBlock[4] = self;
  id v24 = v4;
  id v44 = v24;
  v25 = _Block_copy(aBlock);
  v26 = objc_opt_new();
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(NSHashTable *)self->_iconViewsAnimatingContextMenues allObjects];
  v7 = [v5 setWithArray:v6];
  [v26 unionSet:v7];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [(NSHashTable *)self->_iconViewsPresentingContextMenues allObjects];
  v10 = [v8 setWithArray:v9];
  [v26 unionSet:v10];

  v27 = (void *)[v26 mutableCopy];
  if ([v27 count])
  {
    v11 = SBLogIcon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v26;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Starting mass dismissal of all presented icon view context menues: %{public}@", buf, 0xCu);
    }

    v12 = dispatch_group_create();
    for (uint64_t i = [v26 count]; i; --i)
      dispatch_group_enter(v12);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v14 = (void *)[v26 copy];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          v19 = SBLogIcon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v50 = v18;
            _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_DEFAULT, "Dismissing icon force touch controller for icon view: %{public}@", buf, 0xCu);
          }

          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_22;
          v36[3] = &unk_1E6AACDE0;
          v36[4] = v18;
          id v37 = v27;
          v38 = v12;
          [v18 dismissContextMenuWithCompletion:v36];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v15);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_23;
    block[3] = &unk_1E6AAD7E0;
    id v20 = v25;
    id v35 = v20;
    id v21 = v26;
    id v34 = v21;
    v22 = MEMORY[0x1E4F14428];
    dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);
    dispatch_time_t v23 = dispatch_time(0, 1000000000);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2;
    v28[3] = &unk_1E6AAD808;
    v32 = v46;
    id v29 = v27;
    id v31 = v20;
    id v30 = v21;
    dispatch_after(v23, v22, v28);
  }
  else
  {
    (*((void (**)(void *, void))v25 + 2))(v25, MEMORY[0x1E4F1CBF0]);
    v12 = SBLogIcon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v26;
      _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "No need for mass dismissal of all presented icon view context menues: %{public}@", buf, 0xCu);
    }
  }

  _Block_object_dispose(v46, 8);
}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v5 + 24))
  {
    *(unsigned char *)(v5 + 24) = 1;
    if ([v3 count])
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v19 = @"iconViews";
      v20[0] = v4;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v6 postNotificationName:@"SBHIconViewContextMenuStateControllerDidDismissAllIconForceTouchControllersNotification" object:0 userInfo:v7];
    }
    [*(id *)(a1 + 32) _firePendingIconAnimationBlocks];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "earlyTerminateContextMenuDismissAnimation", (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(void))(v13 + 16))();
    }
  }
}

- (void)_firePendingIconAnimationBlocks
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSMutableArray *)self->_pendingIconAnimationCompletionBlocks copy];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  pendingIconAnimationCompletionBlocks = self->_pendingIconAnimationCompletionBlocks;
  self->_pendingIconAnimationCompletionBlocks = v4;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v3;
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
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void __55__SBHIconViewContextMenuStateController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBHIconViewContextMenuStateController);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (SBHIconViewContextMenuStateController)init
{
  v15.receiver = self;
  v15.super_class = (Class)SBHIconViewContextMenuStateController;
  v2 = [(SBHIconViewContextMenuStateController *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    presentedWidgetsBundleIdentifiers = v2->_presentedWidgetsBundleIdentifiers;
    v2->_presentedWidgetsBundleIdentifiers = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    iconViewsPresentingContextMenues = v2->_iconViewsPresentingContextMenues;
    v2->_iconViewsPresentingContextMenues = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    iconViewsAnimatingContextMenues = v2->_iconViewsAnimatingContextMenues;
    v2->_iconViewsAnimatingContextMenues = (NSHashTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    iconViews = v2->_iconViews;
    v2->_iconViews = (NSHashTable *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    pendingIconAnimationCompletionBlocks = v2->_pendingIconAnimationCompletionBlocks;
    v2->_pendingIconAnimationCompletionBlocks = (NSMutableArray *)v11;

    long long v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel_containerViewDidScrollHiddenIconViewAway_ name:@"SBHScrollableContainerDidScrollHiddenIconViewOutsideClippingBoundsNotification" object:0];
  }
  return v2;
}

- (void)iconViewWillPresentContextMenu:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v8 = [v5 objectForKey:@"presentedWidgetBundleIdentifier"];

  [(NSMutableSet *)self->_presentedWidgetsBundleIdentifiers bs_safeAddObject:v8];
  iconViewsPresentingContextMenues = self->_iconViewsPresentingContextMenues;
  uint64_t v7 = [v4 object];

  [(NSHashTable *)iconViewsPresentingContextMenues addObject:v7];
}

- (void)iconViewWillDismissContextMenu:(id)a3
{
  id v8 = a3;
  id v4 = [v8 userInfo];
  uint64_t v5 = [v4 objectForKey:@"presentedWidgetBundleIdentifier"];

  if (v5) {
    [(NSMutableSet *)self->_presentedWidgetsBundleIdentifiers removeObject:v5];
  }
  iconViewsPresentingContextMenues = self->_iconViewsPresentingContextMenues;
  uint64_t v7 = [v8 object];
  [(NSHashTable *)iconViewsPresentingContextMenues removeObject:v7];
}

- (void)iconViewWillAnimateContextMenu:(id)a3
{
  iconViewsAnimatingContextMenues = self->_iconViewsAnimatingContextMenues;
  id v4 = [a3 object];
  [(NSHashTable *)iconViewsAnimatingContextMenues addObject:v4];
}

- (void)iconViewDidAnimateContextMenu:(id)a3
{
  iconViewsAnimatingContextMenues = self->_iconViewsAnimatingContextMenues;
  uint64_t v5 = [a3 object];
  [(NSHashTable *)iconViewsAnimatingContextMenues removeObject:v5];

  if (![(NSHashTable *)self->_iconViewsAnimatingContextMenues count])
  {
    [(SBHIconViewContextMenuStateController *)self _firePendingIconAnimationBlocks];
  }
}

- (void)containerViewDidScrollHiddenIconViewAway:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"SBHHiddenIconViewUserInfoKey"];

  if ([(NSHashTable *)self->_iconViewsAnimatingContextMenues containsObject:v5])
  {
    [v5 earlyTerminateContextMenuDismissAnimation];
  }
  else if ([(NSHashTable *)self->_iconViewsPresentingContextMenues containsObject:v5])
  {
    [(SBHIconViewContextMenuStateController *)self dismissAppIconForceTouchControllers:0];
  }
}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_22(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = SBLogIcon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed icon force touch controller for icon view: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 40) removeObject:*(void *)(a1 + 32)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_23(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) allObjects];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v2 = SBLogIcon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2_cold_1(a1, v2);
    }

    uint64_t v3 = *(void *)(a1 + 48);
    int v4 = [*(id *)(a1 + 40) allObjects];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

- (BOOL)areAnyIconViewContextMenusAnimating
{
  return [(NSHashTable *)self->_iconViewsAnimatingContextMenues count] != 0;
}

- (void)performAfterContextMenuAnimationsHaveCompleted:(id)a3
{
  aBlock = (void (**)(void))a3;
  if ([(SBHIconViewContextMenuStateController *)self areAnyIconViewContextMenusAnimating])
  {
    pendingIconAnimationCompletionBlocks = self->_pendingIconAnimationCompletionBlocks;
    uint64_t v5 = (void (**)(void))_Block_copy(aBlock);

    [(NSMutableArray *)pendingIconAnimationCompletionBlocks addObject:v5];
    aBlock = v5;
  }
  else
  {
    aBlock[2]();
  }
}

- (void)earlyTerminateAnyContextMenuAnimations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[(NSHashTable *)self->_iconViewsAnimatingContextMenues copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "earlyTerminateContextMenuDismissAnimation", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)noteFolderControllerWillClose:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__SBHIconViewContextMenuStateController_noteFolderControllerWillClose___block_invoke;
  v3[3] = &unk_1E6AAD830;
  v3[4] = self;
  [a3 enumerateDisplayedIconViewsUsingBlock:v3];
}

void __71__SBHIconViewContextMenuStateController_noteFolderControllerWillClose___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = a2;
  if (objc_msgSend(v3, "containsObject:"))
  {
    [v6 earlyTerminateContextMenuDismissAnimation];
  }
  else
  {
    int v4 = [*(id *)(*(void *)(a1 + 32) + 24) containsObject:v6];

    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      [v5 dismissAppIconForceTouchControllers:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingIconAnimationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_iconViewsAnimatingContextMenues, 0);
  objc_storeStrong((id *)&self->_iconViewsPresentingContextMenues, 0);
  objc_storeStrong((id *)&self->_presentedWidgetsBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Dismissal of icon force touch controller for icons '%{public}@' failed.", (uint8_t *)&v3, 0xCu);
}

@end