@interface _SBHUDHostViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isHUDBeingDismissed:(void *)a1;
- (BOOL)isHUDBeingPresented:(void *)a1;
- (NSString)description;
- (id)HUDController;
- (id)_buildTransitionContextToPresentHUD:(id)a3 dismissHUD:(id)a4 animated:(BOOL)a5 delegate:(id)a6 containerView:(id)a7 completion:(id)a8;
- (id)_transitionContextMatchingHUD:(id)a3 withinContainer:(id)a4;
- (id)delegate;
- (id)knownHUDForIdentifier:(id *)a1;
- (id)setDelegate:(id *)result;
- (uint64_t)numberOfActiveTransitions;
- (uint64_t)presentedHUDs;
- (uint64_t)presentingHUDs;
- (unint64_t)supportedInterfaceOrientations;
- (void)_executeDismissHUD:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_executePresentNewHUD:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_executeViewControllerTransitionContext:(id)a3;
- (void)dismissHUD:(uint64_t)a3 animated:(void *)a4 completion:;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)initWithHUDController:(void *)a1;
- (void)presentHUD:(uint64_t)a3 animated:(void *)a4 completion:;
- (void)reverseHUDDismissal:(id *)a1;
- (void)reverseHUDPresentation:(id *)a1;
- (void)transitionDidFinish:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _SBHUDHostViewController

- (uint64_t)presentedHUDs
{
  if (result) {
    return *(void *)(result + 984);
  }
  return result;
}

- (uint64_t)presentingHUDs
{
  if (result) {
    return *(void *)(result + 992);
  }
  return result;
}

- (BOOL)isHUDBeingDismissed:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v2 = [a1 _transitionContextMatchingHUD:a2 withinContainer:a1[127]];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)reverseHUDDismissal:(id *)a1
{
  if (a1)
  {
    id v4 = [a1 _transitionContextMatchingHUD:a2 withinContainer:a1[127]];
    BOOL v3 = [v4 animator];
    if ([a1[127] containsObject:v4])
    {
      [a1[127] removeObject:v4];
      [a1[126] addObject:v4];
      [v3 reverseAnimation];
    }
  }
}

- (void)presentHUD:(uint64_t)a3 animated:(void *)a4 completion:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    if (!v7)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:sel_presentHUD_animated_completion_, a1, @"SBHUDController.m", 843, @"Invalid parameter not satisfying: %@", @"HUD" object file lineNumber description];
    }
    v9 = SBLogHUD();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1D948C7A0](v8);
      *(_DWORD *)buf = 138412802;
      id v17 = v7;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "presentHUD:%@ animated:%{BOOL}d completion:%@", buf, 0x1Cu);
    }
    v11 = [a1 _transitionContextMatchingHUD:v7 withinContainer:a1[127]];
    if (v11)
    {
      v12 = SBLogHUD();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v7;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Reversing dismissal for HUD %@", buf, 0xCu);
      }

      -[_SBHUDHostViewController reverseHUDDismissal:]((id *)a1, (uint64_t)v7);
    }
    else
    {
      v13 = [a1 _transitionContextMatchingHUD:v7 withinContainer:a1[126]];
      if (v13)
      {
        v14 = SBLogHUD();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v7;
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Already presenting HUD %@; doing nothing.",
            buf,
            0xCu);
        }
      }
      else
      {
        [a1 _executePresentNewHUD:v7 animated:a3 completion:v8];
      }
    }
  }
}

- (BOOL)isHUDBeingPresented:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v2 = [a1 _transitionContextMatchingHUD:a2 withinContainer:a1[126]];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)reverseHUDPresentation:(id *)a1
{
  if (a1)
  {
    id v4 = [a1 _transitionContextMatchingHUD:a2 withinContainer:a1[126]];
    BOOL v3 = [v4 animator];
    if ([a1[126] containsObject:v4])
    {
      [a1[127] addObject:v4];
      [a1[126] removeObject:v4];
      [v3 reverseAnimation];
    }
  }
}

- (void)dismissHUD:(uint64_t)a3 animated:(void *)a4 completion:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    if (!v7)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel_dismissHUD_animated_completion_, a1, @"SBHUDController.m", 864, @"Invalid parameter not satisfying: %@", @"HUD" object file lineNumber description];
    }
    v9 = SBLogHUD();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1D948C7A0](v8);
      *(_DWORD *)buf = 138412802;
      id v22 = v7;
      __int16 v23 = 1024;
      int v24 = a3;
      __int16 v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "dismissHUD:%@ animated:%{BOOL}d completion:%@", buf, 0x1Cu);
    }
    v11 = [a1 _transitionContextMatchingHUD:v7 withinContainer:a1[127]];
    if (v11)
    {
      v12 = SBLogHUD();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v7;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Already dismissing HUD %@; doing nothing.", buf, 0xCu);
      }
    }
    else
    {
      v12 = [a1 _transitionContextMatchingHUD:v7 withinContainer:a1[126]];
      if (v12)
      {
        v13 = SBLogHUD();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v7;
          _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "HUD %@ is presenting; reversing presenting...",
            buf,
            0xCu);
        }

        -[_SBHUDHostViewController reverseHUDPresentation:]((id *)a1, (uint64_t)v7);
      }
      else
      {
        v14 = [v7 HUDViewController];
        v15 = v14;
        if (a3 && [v14 definesAnimatedDismissal])
        {
          v16 = SBLogHUD();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v22 = v7;
            _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "HUD %@ is defines its own animated dismissal; executing and cleaning up state.",
              buf,
              0xCu);
          }

          objc_initWeak((id *)buf, v7);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __59___SBHUDHostViewController_dismissHUD_animated_completion___block_invoke;
          v18[3] = &unk_1E6AF4CE8;
          objc_copyWeak(&v20, (id *)buf);
          v18[4] = a1;
          id v19 = v8;
          [v15 dismissAnimatedWithCompletion:v18];

          objc_destroyWeak(&v20);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          [a1 _executeDismissHUD:v7 animated:a3 completion:v8];
        }
      }
    }
  }
}

- (void)initWithHUDController:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:sel_initWithHUDController_, a1, @"SBHUDController.m", 748, @"Invalid parameter not satisfying: %@", @"HUDController" object file lineNumber description];
    }
    v20.receiver = a1;
    v20.super_class = (Class)_SBHUDHostViewController;
    id v5 = objc_msgSendSuper2(&v20, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeWeak((id *)v5 + 128, v4);
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v7 = (void *)a1[123];
      a1[123] = v6;

      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v9 = (void *)a1[124];
      a1[124] = v8;

      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v11 = (void *)a1[125];
      a1[125] = v10;

      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v13 = (void *)a1[122];
      a1[122] = v12;

      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v15 = (void *)a1[126];
      a1[126] = v14;

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v17 = (void *)a1[127];
      a1[127] = v16;
    }
  }

  return a1;
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 129, a2);
  }
  return result;
}

- (uint64_t)numberOfActiveTransitions
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 1008) count];
    return [*(id *)(v1 + 1016) count] + v2;
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)_SBHUDHostViewController;
  id v7 = a4;
  -[_SBHUDHostViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79___SBHUDHostViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6B003A8;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  [v7 animateAlongsideTransition:v8 completion:&__block_literal_global_333];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3) {
    a3->var6 = 0;
  }
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_presentedHUDs withName:@"presentedHUDs"];
  id v5 = (id)[v3 appendObject:self->_presentingHUDs withName:@"presentingHUDs"];
  id v6 = (id)[v3 appendObject:self->_executingDismissalHUDs withName:@"executingDismissalHUDs"];
  id v7 = (id)[v3 appendObject:self->_activeTransitionContexts withName:@"activeTransitionContexts"];
  id v8 = (id)[v3 appendObject:self->_presentingHUDsTransitionContexts withName:@"presentingHUDsTransitionContexts"];
  id v9 = (id)[v3 appendObject:self->_dismissingHUDsTransitionContexts withName:@"dismissingHUDsTransitionContexts"];
  id v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_dismissingHUDsTransitionContexts, "count")+ -[NSMutableSet count](self->_presentingHUDsTransitionContexts, "count"), @"numberOfActiveTransitions");
  v11 = [v3 build];

  return (NSString *)v11;
}

- (id)knownHUDForIdentifier:(id *)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1) {
    goto LABEL_31;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = a1[123];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          a1 = v9;
          goto LABEL_30;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v12 = (void *)MEMORY[0x1E4F28F60];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __50___SBHUDHostViewController_knownHUDForIdentifier___block_invoke;
  v31[3] = &unk_1E6B003F0;
  id v32 = v3;
  v13 = [v12 predicateWithBlock:v31];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = a1[126];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
LABEL_12:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v28 != v17) {
        objc_enumerationMutation(v14);
      }
      id v19 = *(void **)(*((void *)&v27 + 1) + 8 * v18);
      if ([v13 evaluateWithObject:v19]) {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v38 count:16];
        if (v16) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = a1[127];
    a1 = (id *)[v14 countByEnumeratingWithState:&v23 objects:v37 count:16];
    if (!a1) {
      goto LABEL_29;
    }
    uint64_t v20 = *(void *)v24;
LABEL_20:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v24 != v20) {
        objc_enumerationMutation(v14);
      }
      id v19 = *(void **)(*((void *)&v23 + 1) + 8 * v21);
      if (objc_msgSend(v13, "evaluateWithObject:", v19, (void)v23)) {
        break;
      }
      if (a1 == (id *)++v21)
      {
        a1 = (id *)[v14 countByEnumeratingWithState:&v23 objects:v37 count:16];
        if (a1) {
          goto LABEL_20;
        }
        goto LABEL_29;
      }
    }
  }
  a1 = [v19 userInfo];
LABEL_29:

  id v4 = v32;
LABEL_30:

LABEL_31:
  return a1;
}

- (void)transitionDidFinish:(id)a3
{
  p_presentingHUDsTransitionContexts = &self->_presentingHUDsTransitionContexts;
  id v5 = a3;
  if ((-[NSMutableSet containsObject:](*p_presentingHUDsTransitionContexts, "containsObject:") & 1) != 0
    || (p_presentingHUDsTransitionContexts = &self->_dismissingHUDsTransitionContexts,
        [(NSMutableSet *)self->_dismissingHUDsTransitionContexts containsObject:v5]))
  {
    [(NSMutableSet *)*p_presentingHUDsTransitionContexts removeObject:v5];
  }
  [(NSMutableArray *)self->_activeTransitionContexts removeObject:v5];
}

- (id)_transitionContextMatchingHUD:(id)a3 withinContainer:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "userInfo", (void)v13);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v5)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_buildTransitionContextToPresentHUD:(id)a3 dismissHUD:(id)a4 animated:(BOOL)a5 delegate:(id)a6 containerView:(id)a7 completion:(id)a8
{
  BOOL v11 = a5;
  id v15 = a3;
  id v16 = a4;
  id v40 = a6;
  id v17 = a7;
  id v39 = a8;
  uint64_t v18 = v15;
  if ((v15 != 0) != (v16 != 0))
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"SBHUDController.m", 962, @"Invalid parameter not satisfying: %@", @"(dismissalHUD && !presentationHUD) || (!dismissalHUD && presentationHUD)" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"SBHUDController.m", 963, @"Invalid parameter not satisfying: %@", @"containerView" object file lineNumber description];

LABEL_3:
  id v19 = objc_opt_new();
  [v19 setContainerView:v17];
  [v19 setWantsAnimation:v11];
  v44 = v16;
  uint64_t v20 = [v16 HUDViewController];
  uint64_t v21 = v18;
  id v22 = [v18 HUDViewController];
  long long v23 = -[_SBHUDHostViewController HUDController]((id *)&self->super.super.super.super.isa);
  long long v24 = [v20 transitioningDelegate];
  long long v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    -[_SBHUDHostViewController HUDController]((id *)&self->super.super.super.super.isa);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v42 = v26;

  long long v27 = [v22 transitioningDelegate];
  long long v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    -[_SBHUDHostViewController HUDController]((id *)&self->super.super.super.super.isa);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v41 = v29;

  if (v20)
  {
    v43 = [v42 animationControllerForDismissedController:v20];
    if (!v43)
    {
      v43 = [v23 animationControllerForDismissedController:v20];
    }
  }
  else
  {
    v43 = 0;
  }
  v38 = v23;
  if (v22
    && (([v41 animationControllerForPresentedController:v22 presentingController:self sourceController:self], (long long v30 = objc_claimAutoreleasedReturnValue()) != 0)|| (objc_msgSend(v23, "animationControllerForPresentedController:presentingController:sourceController:", v22, self, self), (long long v30 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v31 = self;
    id v32 = SBSafeCast((uint64_t)v31, v30);

    uint64_t v21 = v18;
  }
  else
  {
    long long v30 = self;
    id v32 = SBSafeCast((uint64_t)v30, v43);
  }

  [v19 setWantsAnimation:v11];
  if (v20)
  {
    long long v33 = [v20 view];
    [v19 setView:v33 forKey:*MEMORY[0x1E4F43EB8]];

    [v19 setViewController:v20 forKey:*MEMORY[0x1E4F43EB0]];
    [v17 bounds];
    objc_msgSend(v19, "setInitialFrame:forViewController:", v20);
    [v17 bounds];
    objc_msgSend(v19, "setFinalFrame:forViewController:", v20);
    [v20 willMoveToParentViewController:0];
    if (objc_opt_respondsToSelector()) {
      [v40 hudViewController:self willDismissHUD:v44];
    }
  }
  if (v22)
  {
    [(_SBHUDHostViewController *)self addChildViewController:v22];
    long long v34 = [v22 view];
    [v19 setView:v34 forKey:*MEMORY[0x1E4F43EC8]];

    [v19 setViewController:v22 forKey:*MEMORY[0x1E4F43EC0]];
    [v17 bounds];
    objc_msgSend(v19, "setInitialFrame:forViewController:", v22);
    [v17 bounds];
    objc_msgSend(v19, "setFinalFrame:forViewController:", v22);
    [v22 didMoveToParentViewController:self];
    if (objc_opt_respondsToSelector()) {
      [v40 hudViewController:self willPresentHUD:v21];
    }
  }
  if (v20)
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __118___SBHUDHostViewController__buildTransitionContextToPresentHUD_dismissHUD_animated_delegate_containerView_completion___block_invoke;
    v50[3] = &unk_1E6B00418;
    id v51 = v20;
    id v52 = v40;
    v53 = self;
    id v54 = v44;
    [v32 addCompletion:v50];
  }
  if (v22)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __118___SBHUDHostViewController__buildTransitionContextToPresentHUD_dismissHUD_animated_delegate_containerView_completion___block_invoke_2;
    v45[3] = &unk_1E6B00418;
    id v46 = v22;
    v47 = self;
    id v48 = v40;
    id v49 = v21;
    [v32 addCompletion:v45];
  }
  [v32 addCompletion:v39];
  [v19 setAnimator:v32];

  return v19;
}

- (id)HUDController
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 128);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_executePresentNewHUD:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = -[_SBHUDHostViewController delegate]((id *)&self->super.super.super.super.isa);
  BOOL v11 = [(_SBHUDHostViewController *)self view];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70___SBHUDHostViewController__executePresentNewHUD_animated_completion___block_invoke;
  v21[3] = &unk_1E6B00440;
  v21[4] = self;
  id v12 = v8;
  id v22 = v12;
  id v13 = v9;
  id v23 = v13;
  long long v14 = (void (**)(void, void))MEMORY[0x1D948C7A0](v21);
  if (a4)
  {
    [(NSMutableSet *)self->_presentingHUDs addObject:v12];
    id v15 = [(_SBHUDHostViewController *)self _buildTransitionContextToPresentHUD:v12 dismissHUD:0 animated:1 delegate:v10 containerView:v11 completion:v14];
    [v15 setUserInfo:v12];
    [(NSMutableSet *)self->_presentingHUDsTransitionContexts addObject:v15];
    [(_SBHUDHostViewController *)self _executeViewControllerTransitionContext:v15];
  }
  else
  {
    id v16 = [v12 HUDViewController];
    if (objc_opt_respondsToSelector()) {
      [v10 hudViewController:self willPresentHUD:v12];
    }
    [v16 willMoveToParentViewController:self];
    [(_SBHUDHostViewController *)self addChildViewController:v16];
    id v17 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70___SBHUDHostViewController__executePresentNewHUD_animated_completion___block_invoke_2;
    v18[3] = &unk_1E6AF5290;
    id v15 = v16;
    id v19 = v15;
    uint64_t v20 = self;
    [v17 performWithoutAnimation:v18];
    [v15 didMoveToParentViewController:self];
    if (objc_opt_respondsToSelector()) {
      [v10 hudViewController:self didPresentHUD:v12];
    }
    v14[2](v14, 0);
  }
}

- (id)delegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 129);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_executeDismissHUD:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = -[_SBHUDHostViewController delegate]((id *)&self->super.super.super.super.isa);
  BOOL v11 = [(_SBHUDHostViewController *)self view];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67___SBHUDHostViewController__executeDismissHUD_animated_completion___block_invoke;
  v23[3] = &unk_1E6B00440;
  v23[4] = self;
  id v12 = v8;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  long long v14 = (void (**)(void, void))MEMORY[0x1D948C7A0](v23);
  if (a4)
  {
    id v15 = [(_SBHUDHostViewController *)self _buildTransitionContextToPresentHUD:0 dismissHUD:v12 animated:1 delegate:v10 containerView:v11 completion:v14];
    [v15 setUserInfo:v12];
    [(NSMutableSet *)self->_dismissingHUDsTransitionContexts addObject:v15];
    [(_SBHUDHostViewController *)self _executeViewControllerTransitionContext:v15];
LABEL_9:

    goto LABEL_10;
  }
  if (([(NSMutableSet *)self->_executingDismissalHUDs containsObject:v12] & 1) == 0)
  {
    [(NSMutableSet *)self->_executingDismissalHUDs addObject:v12];
    id v16 = [v12 HUDViewController];
    if (objc_opt_respondsToSelector()) {
      [v10 hudViewController:self willDismissHUD:v12];
    }
    objc_msgSend(v16, "bs_beginAppearanceTransition:animated:", 0, 0);
    [v16 willMoveToParentViewController:0];
    id v17 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __67___SBHUDHostViewController__executeDismissHUD_animated_completion___block_invoke_2;
    uint64_t v21 = &unk_1E6AF4AC0;
    id v15 = v16;
    id v22 = v15;
    [v17 performWithoutAnimation:&v18];
    -[_SBHUDHostViewController removeChildViewController:](self, "removeChildViewController:", v15, v18, v19, v20, v21);
    [v15 didMoveToParentViewController:0];
    objc_msgSend(v15, "bs_endAppearanceTransition");
    if (objc_opt_respondsToSelector()) {
      [v10 hudViewController:self didDismissHUD:v12];
    }
    v14[2](v14, 0);
    [(NSMutableSet *)self->_executingDismissalHUDs removeObject:v12];

    goto LABEL_9;
  }
LABEL_10:
}

- (void)_executeViewControllerTransitionContext:(id)a3
{
  activeTransitionContexts = self->_activeTransitionContexts;
  id v5 = a3;
  [(NSMutableArray *)activeTransitionContexts addObject:v5];
  [v5 setDelegate:self];
  [v5 startTransition];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_HUDController);
  objc_storeStrong((id *)&self->_dismissingHUDsTransitionContexts, 0);
  objc_storeStrong((id *)&self->_presentingHUDsTransitionContexts, 0);
  objc_storeStrong((id *)&self->_executingDismissalHUDs, 0);
  objc_storeStrong((id *)&self->_presentingHUDs, 0);
  objc_storeStrong((id *)&self->_presentedHUDs, 0);
  objc_storeStrong((id *)&self->_activeTransitionContexts, 0);
}

@end