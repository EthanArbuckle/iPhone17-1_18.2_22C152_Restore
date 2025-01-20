@interface SBModalViewControllerStack
- (NSArray)viewControllers;
- (SBModalViewControllerStack)initWithPresentingViewController:(id)a3;
- (SBModalViewControllerStackDelegate)delegate;
- (UIViewController)topViewController;
- (id)_popNextPendingTransition;
- (void)_addPendingTransition:(id)a3;
- (void)_addViewController:(id)a3 completion:(id)a4;
- (void)_noteDidDismissViewController:(id)a3;
- (void)_noteDidPresentViewController:(id)a3;
- (void)_noteWillDismissViewController:(id)a3 animated:(BOOL)a4;
- (void)_noteWillPresentViewController:(id)a3;
- (void)_performPendingTransitionIfNecessary;
- (void)_queuePendingTransition:(id)a3;
- (void)_removePendingTransition:(id)a3 forSuccess:(BOOL)a4;
- (void)_removeViewController:(id)a3 completion:(id)a4;
- (void)_setCurrentTransition:(id)a3;
- (void)addViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBModalViewControllerStack

- (SBModalViewControllerStack)initWithPresentingViewController:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBModalViewControllerStack.m", 76, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)SBModalViewControllerStack;
  v7 = [(SBModalViewControllerStack *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_presentingViewController, a3);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingTransitions = v8->_pendingTransitions;
    v8->_pendingTransitions = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    viewControllerStack = v8->_viewControllerStack;
    v8->_viewControllerStack = v11;
  }
  return v8;
}

- (NSArray)viewControllers
{
  v2 = (void *)[(NSMutableArray *)self->_viewControllerStack copy];
  return (NSArray *)v2;
}

- (UIViewController)topViewController
{
  return (UIViewController *)[(NSMutableArray *)self->_viewControllerStack lastObject];
}

- (void)addViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBModalViewControllerStack.m" lineNumber:102 description:@"View controller to add to the stack must be non-nil."];
  }
  v11 = SBLogAlertItemStack();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14[0] = 67109378;
    v14[1] = v6;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Adding view controller to pending transition list for presentation (animated? %d): %@", (uint8_t *)v14, 0x12u);
  }

  v12 = +[_SBModalViewControllerStackTransition transitionForViewController:operation:animated:completion:]((uint64_t)_SBModalViewControllerStackTransition, v9, 0, v6, v10);

  [(SBModalViewControllerStack *)self _queuePendingTransition:v12];
  [(SBModalViewControllerStack *)self _performPendingTransitionIfNecessary];
}

- (void)removeViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBModalViewControllerStack.m" lineNumber:112 description:@"View controller to remove from the stack must be non-nil."];
  }
  v11 = SBLogAlertItemStack();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14[0] = 67109378;
    v14[1] = v6;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Adding view controller to pending transition list for dismissal (animated? %d): %@", (uint8_t *)v14, 0x12u);
  }

  v12 = +[_SBModalViewControllerStackTransition transitionForViewController:operation:animated:completion:]((uint64_t)_SBModalViewControllerStackTransition, v9, 1uLL, v6, v10);

  [(SBModalViewControllerStack *)self _queuePendingTransition:v12];
  [(SBModalViewControllerStack *)self _performPendingTransitionIfNecessary];
}

- (void)removeViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBModalViewControllerStack *)self topViewController];
  [(SBModalViewControllerStack *)self removeViewController:v7 animated:v4 completion:v6];
}

- (void)_addPendingTransition:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_pendingTransitions, "addObject:");
  }
}

- (void)_removePendingTransition:(id)a3 forSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = v6[4];
    id v10 = v7;
    if (v8)
    {
      (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v4);
      id v9 = (void *)v10[4];
      v10[4] = 0;
    }
    [(NSMutableArray *)self->_pendingTransitions removeObject:v10];
    id v7 = v10;
  }
}

- (id)_popNextPendingTransition
{
  v3 = [(NSMutableArray *)self->_pendingTransitions firstObject];
  if (v3) {
    [(NSMutableArray *)self->_pendingTransitions removeObjectAtIndex:0];
  }
  return v3;
}

- (void)_setCurrentTransition:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = (_SBModalViewControllerStackTransition *)a3;
  currentTransition = self->_currentTransition;
  p_currentTransition = &self->_currentTransition;
  if (currentTransition != v5)
  {
    objc_storeStrong((id *)p_currentTransition, a3);
    uint64_t v8 = SBLogAlertItemStack();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Set new current transition: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_queuePendingTransition:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    id v7 = 0;
LABEL_4:
    [(NSMutableArray *)self->_viewControllerStack removeObject:v7];
    [(NSMutableArray *)self->_viewControllerStack addObject:v7];
    goto LABEL_8;
  }
  id v7 = *((id *)v5 + 1);
  uint64_t v8 = v6[2];
  if (v8 != 1)
  {
    if (v8) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  if (([(NSMutableArray *)self->_viewControllerStack containsObject:v7] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBModalViewControllerStack.m", 168, @"View controller (%@) can't be removed from the modal stack when it doesn't already exist.", v7 object file lineNumber description];
  }
  [(NSMutableArray *)self->_viewControllerStack removeObject:v7];
LABEL_8:
  currentTransition = self->_currentTransition;
  id v10 = SBLogAlertItemStack();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!currentTransition)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "No current transition is on-going, but pending it for immediate execution.", buf, 2u);
    }

    if ([(NSMutableArray *)self->_pendingTransitions count])
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"SBModalViewControllerStack.m" lineNumber:201 description:@"We cannot have a pending transition if we have no current transition."];
    }
    goto LABEL_37;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "We have a current transition on-going; attempting to pend the next operation.",
      buf,
      2u);
  }

  if (!v6 || v6[2] != 1)
  {
LABEL_37:
    [(SBModalViewControllerStack *)self _addPendingTransition:v6];
    goto LABEL_38;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = (void *)[(NSMutableArray *)self->_pendingTransitions copy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v13)
  {

    goto LABEL_37;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v25;
  char v16 = 1;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v25 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * v17);
      if (v18) {
        uint64_t v19 = *(void *)(v18 + 8);
      }
      else {
        uint64_t v19 = 0;
      }
      if (v19 == v6[1] && (!v18 || !*(void *)(v18 + 16)))
      {
        v20 = SBLogAlertItemStack();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v29 = v18;
          __int16 v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_INFO, "Found a previously queued activation for this view controller (%@), and this is a dismissal (%@), so removing both from the pending queue.", buf, 0x16u);
        }

        [(SBModalViewControllerStack *)self _removePendingTransition:v18 forSuccess:1];
        -[_SBModalViewControllerStackTransition invokeCompletionIfNecessaryWithResult:]((uint64_t)v6);
        char v16 = 0;
      }
      ++v17;
    }
    while (v14 != v17);
    uint64_t v21 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    uint64_t v14 = v21;
  }
  while (v21);

  if (v16) {
    goto LABEL_37;
  }
LABEL_38:
}

- (void)_performPendingTransitionIfNecessary
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_currentTransition)
  {
    SBLogAlertItemStack();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, (os_log_t)v2, OS_LOG_TYPE_INFO, "Unable to consume next transition event yet due to on-going current transition.", buf, 2u);
    }
    goto LABEL_20;
  }
  BOOL v4 = [(SBModalViewControllerStack *)self _popNextPendingTransition];
  id v2 = v4;
  if (v4)
  {
    id v5 = v4;
    [(SBModalViewControllerStack *)self _setCurrentTransition:v5];
    id v6 = self;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke;
    v25[3] = &unk_1E6AF5290;
    id v7 = v6;
    long long v26 = v7;
    id v2 = v5;
    id v27 = v2;
    uint64_t v8 = (void *)MEMORY[0x1D948C7A0](v25);
    uint64_t v9 = *((void *)v2 + 2);
    if (v9 == 1)
    {
      uint64_t v15 = SBLogAlertItemStack();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v2;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "Beginning processing remove view controller: %@", buf, 0xCu);
      }

      if ([v7[3] count])
      {
        char v16 = [v7[3] lastObject];
        uint64_t v17 = +[_SBModalViewControllerStackTransition transitionForViewController:operation:animated:completion:]((uint64_t)_SBModalViewControllerStackTransition, v16, 0, *((unsigned char *)v2 + 24), 0);

        [v7 _queuePendingTransition:v17];
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke_40;
      v19[3] = &unk_1E6AF6828;
      BOOL v11 = &v20;
      id v18 = v2;
      id v20 = v18;
      uint64_t v13 = &v21;
      id v21 = v8;
      [v7 _removeViewController:v18 completion:v19];
    }
    else
    {
      if (v9)
      {
LABEL_19:

        goto LABEL_20;
      }
      id v10 = SBLogAlertItemStack();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v2;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "Beginning processing add view controller: %@", buf, 0xCu);
      }

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke_39;
      v22[3] = &unk_1E6AF6828;
      BOOL v11 = &v23;
      id v12 = v2;
      id v23 = v12;
      uint64_t v13 = &v24;
      id v24 = v8;
      [v7 _addViewController:v12 completion:v22];
    }

    goto LABEL_19;
  }
  uint64_t v14 = SBLogAlertItemStack();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Nothing to process.", buf, 2u);
  }

LABEL_20:
}

void __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = v2;
  -[_SBModalViewControllerStackTransition invokeCompletionIfNecessaryWithResult:](v3);
  [v4 _setCurrentTransition:0];
  [v4 _performPendingTransitionIfNecessary];
}

uint64_t __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke_39(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogAlertItemStack();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Finished processing add view controller: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke_40(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogAlertItemStack();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Finished processing remove view controller: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_addViewController:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  id v8 = a4;
  if (v7)
  {
    if (v7[2])
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"SBModalViewControllerStack.m" lineNumber:256 description:@"We can only add operations here."];
    }
    uint64_t v9 = self;
    id v10 = (void *)v7[1];
  }
  else
  {
    id v23 = self;
    id v10 = 0;
  }
  id v11 = v10;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60__SBModalViewControllerStack__addViewController_completion___block_invoke;
  v26[3] = &unk_1E6AF4DD8;
  id v12 = self;
  id v27 = v12;
  id v13 = v11;
  id v28 = v13;
  uint64_t v14 = v7;
  id v29 = v14;
  uint64_t v15 = (void (**)(void))v8;
  id v30 = v15;
  char v16 = (void (**)(void))MEMORY[0x1D948C7A0](v26);
  id v17 = [(UIViewController *)v12->_presentingViewController presentedViewController];
  if (v17)
  {
    id v18 = SBLogAlertItemStack();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v17 == v13)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "Current view-controller is already presented, so we have nothing to do.", buf, 2u);
      }

      if (v15) {
        v15[2](v15);
      }
    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412546;
        id v32 = v17;
        __int16 v33 = 2112;
        id v34 = v13;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "Need to dismiss current presented view controller (%@) in order to present ourself (%@)", buf, 0x16u);
      }

      id v20 = +[_SBModalViewControllerStackTransition transitionForViewController:operation:animated:completion:]((uint64_t)_SBModalViewControllerStackTransition, v17, 1uLL, 0, 0);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __60__SBModalViewControllerStack__addViewController_completion___block_invoke_45;
      v24[3] = &unk_1E6AF5300;
      long long v25 = v16;
      [(SBModalViewControllerStack *)v12 _removeViewController:v20 completion:v24];
    }
  }
  else
  {
    id v21 = SBLogAlertItemStack();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "No current presented view controller, presenting straight away.", buf, 2u);
    }

    v16[2](v16);
  }
}

void __60__SBModalViewControllerStack__addViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = SBLogAlertItemStack();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = v2[2];
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Really begin presenting view controller: %@ (presentingVC = %@)", buf, 0x16u);
  }

  [v2 _noteWillPresentViewController:*(void *)(a1 + 40)];
  uint64_t v6 = (void *)v2[2];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    BOOL v9 = *(unsigned __int8 *)(v7 + 24) != 0;
  }
  else {
    BOOL v9 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__SBModalViewControllerStack__addViewController_completion___block_invoke_44;
  v10[3] = &unk_1E6AF5FC8;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 56);
  [v6 presentViewController:v8 animated:v9 completion:v10];
}

void __60__SBModalViewControllerStack__addViewController_completion___block_invoke_44(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = SBLogAlertItemStack();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Really finished presenting view controller: %@", (uint8_t *)&v6, 0xCu);
  }

  [v2 _noteDidPresentViewController:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __60__SBModalViewControllerStack__addViewController_completion___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeViewController:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  if (v7)
  {
    if (v7[2] != 1)
    {
      __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"SBModalViewControllerStack.m" lineNumber:303 description:@"We can only remove operations here."];
    }
    BOOL v9 = (void *)v7[1];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBModalViewControllerStack.m" lineNumber:303 description:@"We can only remove operations here."];

    BOOL v9 = 0;
  }
  id v10 = v9;
  id v11 = [(UIViewController *)self->_presentingViewController presentedViewController];

  id v12 = SBLogAlertItemStack();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11 == v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "Really begin dismissing topmost view controller: %@", buf, 0xCu);
    }

    if (v7)
    {
      [(SBModalViewControllerStack *)self _noteWillDismissViewController:v10 animated:*((unsigned __int8 *)v7 + 24)];
      BOOL v14 = *((unsigned char *)v7 + 24) != 0;
    }
    else
    {
      [(SBModalViewControllerStack *)self _noteWillDismissViewController:v10 animated:0];
      BOOL v14 = 0;
    }
    presentingViewController = self->_presentingViewController;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__SBModalViewControllerStack__removeViewController_completion___block_invoke;
    v18[3] = &unk_1E6AF5FC8;
    id v19 = v10;
    id v20 = self;
    id v21 = v8;
    [(UIViewController *)presentingViewController dismissViewControllerAnimated:v14 completion:v18];
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "There is no presented view-controller to dismiss.", buf, 2u);
    }

    if (v8) {
      v8[2](v8);
    }
  }
}

uint64_t __63__SBModalViewControllerStack__removeViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id v2 = SBLogAlertItemStack();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Really finished dismissing topmost view controller: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) _noteDidDismissViewController:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_noteWillPresentViewController:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  int v5 = SBLogAlertItemStack();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Calling out to delegate for willPresent: %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained modalViewControllerStack:self willPresentViewController:v4];
  }
}

- (void)_noteDidPresentViewController:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  int v5 = SBLogAlertItemStack();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Calling out to delegate for didPresent: %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained modalViewControllerStack:self didPresentViewController:v4];
  }
}

- (void)_noteWillDismissViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssertMain();
  int v7 = SBLogAlertItemStack();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Calling out to delegate for willDismiss: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained modalViewControllerStack:self willDismissViewController:v6 animated:v4];
  }
}

- (void)_noteDidDismissViewController:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  int v5 = SBLogAlertItemStack();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Calling out to delegate for didDismiss: %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained modalViewControllerStack:self didDismissViewController:v4];
  }
}

- (SBModalViewControllerStackDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBModalViewControllerStackDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTransitions, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_viewControllerStack, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end