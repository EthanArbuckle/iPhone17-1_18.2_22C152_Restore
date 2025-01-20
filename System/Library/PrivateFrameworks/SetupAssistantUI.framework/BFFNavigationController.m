@interface BFFNavigationController
- (BFFNavigationController)init;
- (BOOL)_canShowTextServices;
- (BOOL)_usesTransitionController;
- (BOOL)ignoreDismissals;
- (BOOL)isAnimating;
- (BOOL)prefersStatusBarHidden;
- (BOOL)pushWithoutDeferringTransitionsWhileInBackground;
- (CGSize)forcedPreferredContentSize;
- (CGSize)preferredContentSize;
- (UIColor)backgroundColor;
- (id)initIgnoringDismissals:(BOOL)a3;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_reapObservers;
- (void)addDelegateObserver:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)popToViewController:(id)a3 completion:(id)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 completion:(id)a4;
- (void)pushViewController:(id)a3 usingShieldColor:(id)a4 completion:(id)a5;
- (void)removeDelegateObserver:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForcedPreferredContentSize:(CGSize)a3;
- (void)setIgnoreDismissals:(BOOL)a3;
- (void)setPushWithoutDeferringTransitionsWhileInBackground:(BOOL)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
@end

@implementation BFFNavigationController

- (BFFNavigationController)init
{
  v9.receiver = self;
  v9.super_class = (Class)BFFNavigationController;
  v2 = [(BFFNavigationController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    appearanceHandlers = v2->_appearanceHandlers;
    v2->_appearanceHandlers = (NSMutableDictionary *)v5;

    v2->_pendingShowOperation = 0;
    v8.receiver = v2;
    v8.super_class = (Class)BFFNavigationController;
    [(BFFNavigationController *)&v8 setDelegate:v2];
  }
  return v2;
}

- (id)initIgnoringDismissals:(BOOL)a3
{
  id result = [(BFFNavigationController *)self init];
  if (result) {
    *((unsigned char *)result + 1450) = a3;
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)_usesTransitionController
{
  return 0;
}

- (BOOL)_canShowTextServices
{
  return 0;
}

- (void)setBackgroundColor:(id)a3
{
  if (self->_backgroundColor != a3)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    uint64_t v5 = [(BFFNavigationController *)self view];
    v6 = [(BFFNavigationController *)self backgroundColor];
    [v5 setBackgroundColor:v6];
  }
  MEMORY[0x270F9A758]();
}

- (UIColor)backgroundColor
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    uint64_t v3 = backgroundColor;
  }
  else
  {
    v4 = +[BFFStyle sharedStyle];
    uint64_t v3 = [v4 backgroundColor];
  }
  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  uint64_t v3 = [(BFFNavigationController *)self topViewController];
  uint64_t v4 = [v3 preferredStatusBarStyle];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(BFFNavigationController *)self topViewController];
  int64_t v6 = [v5 preferredStatusBarStyle];

  return v6;
}

- (BOOL)prefersStatusBarHidden
{
  v2 = [(BFFNavigationController *)self topViewController];
  char v3 = [v2 prefersStatusBarHidden];

  return v3;
}

- (CGSize)preferredContentSize
{
  [(BFFNavigationController *)self forcedPreferredContentSize];
  if (v4 == *MEMORY[0x263F001B0] && v3 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v8.receiver = self;
    v8.super_class = (Class)BFFNavigationController;
    [(BFFNavigationController *)&v8 preferredContentSize];
  }
  else
  {
    [(BFFNavigationController *)self forcedPreferredContentSize];
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = +[BFFStyle sharedStyle];
  objc_super v8 = [v6 navigationItem];
  [v7 applyAutomaticScrollToEdgeBehaviorOnNavigationItem:v8];

  self->_pendingShowOperation = 1;
  objc_super v9 = [(BFFNavigationController *)self backgroundColor];

  if (v9)
  {
    v10 = [v6 view];
    v11 = [(BFFNavigationController *)self backgroundColor];
    [v10 setBackgroundColor:v11];
  }
  v12 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v13 = [v12 applicationState];

  if ([(BFFNavigationController *)self pushWithoutDeferringTransitionsWhileInBackground]&& v13)
  {
    v14 = _BYLoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_log_impl(&dword_21FF9E000, v14, OS_LOG_TYPE_DEFAULT, "Will push %@ without deferring transitions (will not animate)", buf, 0xCu);
    }
    v17 = (void *)MEMORY[0x263F82E10];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __55__BFFNavigationController_pushViewController_animated___block_invoke;
    v23[3] = &unk_26454AAF0;
    id v24 = v6;
    v25 = self;
    [v17 _performWithoutDeferringTransitions:v23];
  }
  else if (v13)
  {
    v18 = _BYLoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_impl(&dword_21FF9E000, v18, OS_LOG_TYPE_DEFAULT, "Will push %@ in background (will not animate)", buf, 0xCu);
    }
    -[BFFNavigationController pushViewController:animated:](&v22, sel_pushViewController_animated_, v6, 0, v21.receiver, v21.super_class, self, BFFNavigationController);
  }
  else
  {
    -[BFFNavigationController pushViewController:animated:](&v21, sel_pushViewController_animated_, v6, v4, self, BFFNavigationController, v22.receiver, v22.super_class);
  }
}

id __55__BFFNavigationController_pushViewController_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BFFNavigationController;
  return objc_msgSendSuper2(&v3, sel_pushViewController_animated_, v1, 0);
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  self->_pendingShowOperation = 2;
  v5.receiver = self;
  v5.super_class = (Class)BFFNavigationController;
  objc_super v3 = [(BFFNavigationController *)&v5 popViewControllerAnimated:a3];
  return v3;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(BFFNavigationController *)self viewControllers];
  id v8 = [v7 lastObject];

  if (v8 != v6) {
    self->_pendingShowOperation = 2;
  }
  v11.receiver = self;
  v11.super_class = (Class)BFFNavigationController;
  objc_super v9 = [(BFFNavigationController *)&v11 popToViewController:v6 animated:v4];

  return v9;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(BFFNavigationController *)self viewControllers];
  unint64_t v6 = [v5 count];

  if (v6 >= 2) {
    self->_pendingShowOperation = 2;
  }
  v9.receiver = self;
  v9.super_class = (Class)BFFNavigationController;
  double v7 = [(BFFNavigationController *)&v9 popToRootViewControllerAnimated:v3];
  return v7;
}

- (void)pushViewController:(id)a3 completion:(id)a4
{
  id v11 = a4;
  unint64_t v6 = (void *)MEMORY[0x263F08D40];
  id v7 = a3;
  id v8 = [v6 valueWithPointer:v7];
  appearanceHandlers = self->_appearanceHandlers;
  if (v11)
  {
    v10 = (void *)MEMORY[0x223C63B60]();
    [(NSMutableDictionary *)appearanceHandlers setObject:v10 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)appearanceHandlers removeObjectForKey:v8];
  }
  [(BFFNavigationController *)self pushViewController:v7 animated:1];
}

- (void)pushViewController:(id)a3 usingShieldColor:(id)a4 completion:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v30 = a4;
  id v27 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v30;
    _os_log_impl(&dword_21FF9E000, v7, OS_LOG_TYPE_DEFAULT, "will transition to shield color %@", buf, 0xCu);
  }

  id v8 = objc_alloc_init(MEMORY[0x263F82E00]);
  objc_super v9 = [MEMORY[0x263F825C8] clearColor];
  [v8 setBackgroundColor:v9];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(BFFNavigationController *)self view];
  [v10 bounds];
  objc_msgSend(v8, "setFrame:");

  id v11 = [(BFFNavigationController *)self view];
  [v11 addSubview:v8];

  v29 = (void *)MEMORY[0x263F08938];
  v37 = [v8 topAnchor];
  v38 = [(BFFNavigationController *)self view];
  v36 = [v38 topAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v49[0] = v35;
  v33 = [v8 leftAnchor];
  v34 = [(BFFNavigationController *)self view];
  v32 = [v34 leftAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v49[1] = v31;
  v12 = [v8 widthAnchor];
  uint64_t v13 = [(BFFNavigationController *)self view];
  v14 = [v13 widthAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v49[2] = v15;
  v16 = [v8 heightAnchor];
  v17 = [(BFFNavigationController *)self view];
  v18 = [v17 heightAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v49[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
  [v29 activateConstraints:v20];

  objc_initWeak((id *)buf, self);
  objc_super v21 = (void *)MEMORY[0x263F82E00];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke;
  v46[3] = &unk_26454AAF0;
  id v22 = v8;
  id v47 = v22;
  id v48 = v30;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_2;
  v40[3] = &unk_26454AFC0;
  id v23 = v48;
  id v41 = v23;
  objc_copyWeak(&v45, (id *)buf);
  id v24 = v28;
  id v42 = v24;
  id v25 = v27;
  id v44 = v25;
  id v26 = v22;
  id v43 = v26;
  [v21 animateWithDuration:v46 animations:v40 completion:0.5];

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)buf);
}

uint64_t __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

void __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v3;
    _os_log_impl(&dword_21FF9E000, v2, OS_LOG_TYPE_DEFAULT, "did transition to shield color %@", buf, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_super v5 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(a1 + 40)];
  id v6 = WeakRetained[178];
  if (*(void *)(a1 + 56))
  {
    id v7 = (void *)MEMORY[0x223C63B60]();
    [v6 setObject:v7 forKey:v5];
  }
  else
  {
    [WeakRetained[178] removeObjectForKey:v5];
  }
  id v8 = [WeakRetained viewControllers];
  objc_super v9 = [v8 arrayByAddingObject:*(void *)(a1 + 40)];
  [WeakRetained setViewControllers:v9];

  v10 = [WeakRetained view];
  [v10 bringSubviewToFront:*(void *)(a1 + 48)];

  id v11 = (void *)MEMORY[0x263F82E00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_36;
  v15[3] = &unk_26454AAC8;
  id v16 = *(id *)(a1 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_2_37;
  v12[3] = &unk_26454AF98;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 48);
  [v11 animateWithDuration:v15 animations:v12 completion:0.5];
}

void __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_36(uint64_t a1)
{
  id v2 = [MEMORY[0x263F825C8] clearColor];
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

uint64_t __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_2_37(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21FF9E000, v2, OS_LOG_TYPE_DEFAULT, "did transition from shield color %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) removeFromSuperview];
}

- (void)popToViewController:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F08D40] valueWithPointer:v11];
  appearanceHandlers = self->_appearanceHandlers;
  if (v6)
  {
    objc_super v9 = (void *)MEMORY[0x223C63B60](v6);
    [(NSMutableDictionary *)appearanceHandlers setObject:v9 forKey:v7];
  }
  else
  {
    [(NSMutableDictionary *)self->_appearanceHandlers removeObjectForKey:v7];
  }
  id v10 = [(BFFNavigationController *)self popToViewController:v11 animated:1];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v12 = +[BFFStyle sharedStyle];
        id v13 = [v11 navigationItem];
        [v12 applyAutomaticScrollToEdgeBehaviorOnNavigationItem:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }
  id v14 = [(BFFNavigationController *)self viewControllers];
  v15 = [v6 lastObject];
  char v16 = [v14 containsObject:v15];

  if ((v16 & 1) == 0) {
    self->_pendingShowOperation = 1;
  }
  v17 = [(BFFNavigationController *)self backgroundColor];

  if (v17)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          if ([v23 isViewLoaded])
          {
            id v24 = [v23 view];
            id v25 = [(BFFNavigationController *)self backgroundColor];
            [v24 setBackgroundColor:v25];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v20);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)BFFNavigationController;
  [(BFFNavigationController *)&v26 setViewControllers:v6 animated:v4];
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(void))a4;
  if ([(BFFNavigationController *)self ignoreDismissals]
    && ([(BFFNavigationController *)self presentedViewController],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    uint64_t v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = self;
      _os_log_impl(&dword_21FF9E000, v8, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);
    }

    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BFFNavigationController;
    [(BFFNavigationController *)&v9 dismissViewControllerWithTransition:v4 completion:v6];
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(void))a4;
  if ([(BFFNavigationController *)self ignoreDismissals]
    && ([(BFFNavigationController *)self presentedViewController],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    uint64_t v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = self;
      _os_log_impl(&dword_21FF9E000, v8, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);
    }

    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BFFNavigationController;
    [(BFFNavigationController *)&v9 dismissViewControllerAnimated:v4 completion:v6];
  }
}

- (void)setDelegate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(BFFNavigationController *)self removeDelegateObserver:v4];
    [(BFFNavigationController *)self addDelegateObserver:v4];
  }
}

- (void)_reapObservers
{
  id v3 = [(NSMutableArray *)self->_observers indexesOfObjectsPassingTest:&__block_literal_global_1];
  [(NSMutableArray *)self->_observers removeObjectsAtIndexes:v3];
}

BOOL __41__BFFNavigationController__reapObservers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 observer];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)addDelegateObserver:(id)a3
{
  observers = self->_observers;
  id v4 = +[BFFNavigationObserver observerWithObserver:a3];
  [(NSMutableArray *)observers addObject:v4];
}

- (void)removeDelegateObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__BFFNavigationController_removeDelegateObserver___block_invoke;
  v8[3] = &unk_26454B008;
  id v6 = v4;
  id v9 = v6;
  uint64_t v7 = [(NSMutableArray *)observers indexOfObjectPassingTest:v8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_observers removeObjectAtIndex:v7];
  }
}

BOOL __50__BFFNavigationController_removeDelegateObserver___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 observer];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v21 = a4;
  BOOL v8 = v5;
  if (v5) {
    self->_animating = 1;
  }
  [(BFFNavigationController *)self _reapObservers];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = (id)[(NSMutableArray *)self->_observers copy];
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = [v13 observer];
        char v15 = objc_opt_respondsToSelector();

        char v16 = [v13 observer];
        v17 = v16;
        if (v15)
        {
          [v16 navigationController:self willShowViewController:v21 operation:self->_pendingShowOperation animated:v8];
        }
        else
        {
          char v18 = objc_opt_respondsToSelector();

          if ((v18 & 1) == 0) {
            continue;
          }
          v17 = [v13 observer];
          [v17 navigationController:v19 willShowViewController:v21 animated:v8];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v27 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v7 = a4;
  int64_t pendingShowOperation = self->_pendingShowOperation;
  self->_int64_t pendingShowOperation = 0;
  self->_animating = 0;
  uint64_t v8 = [MEMORY[0x263F08D40] valueWithPointer:v7];
  uint64_t v9 = [(NSMutableDictionary *)self->_appearanceHandlers objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_appearanceHandlers objectForKeyedSubscript:v8];
    v10[2]();

    [(NSMutableDictionary *)self->_appearanceHandlers removeObjectForKey:v8];
  }
  long long v23 = (void *)v8;
  [(BFFNavigationController *)self _reapObservers];
  objc_super v26 = self;
  uint64_t v11 = (void *)[(NSMutableArray *)self->_observers copy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        char v18 = [v17 observer];
        char v19 = objc_opt_respondsToSelector();

        uint64_t v20 = [v17 observer];
        id v21 = v20;
        if (v19)
        {
          [v20 navigationController:v26 didShowViewController:v7 operation:pendingShowOperation animated:v27];
        }
        else
        {
          char v22 = objc_opt_respondsToSelector();

          if ((v22 & 1) == 0) {
            continue;
          }
          id v21 = [v17 observer];
          [v21 navigationController:v24 didShowViewController:v7 animated:v27];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }
}

- (CGSize)forcedPreferredContentSize
{
  double width = self->_forcedPreferredContentSize.width;
  double height = self->_forcedPreferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setForcedPreferredContentSize:(CGSize)a3
{
  self->_forcedPreferredContentSize = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)pushWithoutDeferringTransitionsWhileInBackground
{
  return self->_pushWithoutDeferringTransitionsWhileInBackground;
}

- (void)setPushWithoutDeferringTransitionsWhileInBackground:(BOOL)a3
{
  self->_pushWithoutDeferringTransitionsWhileInBackground = a3;
}

- (BOOL)ignoreDismissals
{
  return self->_ignoreDismissals;
}

- (void)setIgnoreDismissals:(BOOL)a3
{
  self->_ignoreDismissals = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_appearanceHandlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end