@interface PXMessagesStackPresentationAnimationController
- (PXMessagesStackPresentationAnimationController)initWithStackView:(id)a3;
- (PXMessagesStackView)stackView;
- (double)transitionDuration:(id)a3;
- (id)_bestAssetReferenceForStack:(uint64_t)a1;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (void)_animateCrossfadeFallback:(void *)a3 gridViewController:;
- (void)animateTransition:(id)a3;
@end

@implementation PXMessagesStackPresentationAnimationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_transitionHelper, 0);
}

- (PXMessagesStackView)stackView
{
  return self->_stackView;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_6:
  }
    PXAssertGetLog();
  v6 = [v5 topViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  if (!v6) {
    goto LABEL_6;
  }
  v7 = [v4 containerView];
  [v4 finalFrameForViewController:v5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v5 view];
  [v7 addSubview:v16];

  v17 = [v5 view];
  objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);

  v18 = [v6 view];
  [v18 setAlpha:0.0];

  v19 = [v5 view];
  [v19 layoutIfNeeded];

  v20 = [(PXMessagesStackPresentationAnimationController *)self stackView];
  v21 = -[PXMessagesStackPresentationAnimationController _bestAssetReferenceForStack:]((uint64_t)self, v20);
  objc_initWeak(location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__PXMessagesStackPresentationAnimationController_animateTransition___block_invoke;
  v24[3] = &unk_1E5DD2448;
  objc_copyWeak(&v28, location);
  id v25 = v4;
  id v22 = v6;
  id v26 = v22;
  id v23 = v21;
  id v27 = v23;
  [v22 scrollToCenterAssetReference:v23 completion:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak(location);
}

- (void)_animateCrossfadeFallback:(void *)a3 gridViewController:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = [v5 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
    double v8 = [v5 containerView];
    [v5 finalFrameForViewController:v7];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [v7 view];
    [v8 addSubview:v17];

    v18 = [v7 view];
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    v19 = [v7 view];
    [v19 setAlpha:0.0];

    v20 = *(void **)(a1 + 24);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __95__PXMessagesStackPresentationAnimationController__animateCrossfadeFallback_gridViewController___block_invoke;
    v26[3] = &unk_1E5DD36F8;
    id v27 = v7;
    id v21 = v7;
    [v20 addAnimations:v26];
    id v22 = *(void **)(a1 + 24);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __95__PXMessagesStackPresentationAnimationController__animateCrossfadeFallback_gridViewController___block_invoke_2;
    v23[3] = &unk_1E5DD2470;
    id v24 = v5;
    id v25 = v6;
    [v22 addCompletion:v23];
    [*(id *)(a1 + 24) startAnimation];
  }
}

- (id)_bestAssetReferenceForStack:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 currentAssetReference];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v8 = [v4 currentIndex];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = 0;
      goto LABEL_17;
    }
    unint64_t v9 = v8;
    double v10 = [v4 dataSourceManager];
    double v11 = [v10 dataSource];

    if ([v11 numberOfSections] >= 1)
    {
      double v12 = [v4 dataSourceManager];
      double v13 = [v12 dataSource];
      uint64_t v14 = [v13 numberOfItemsInSection:0];

      if (v9 >= v14 && v14 >= 1)
      {
        long long v17 = 0u;
        long long v18 = 0u;
        if (v11) {
          [v11 lastItemIndexPath];
        }
LABEL_14:
        v16[0] = v17;
        v16[1] = v18;
        id v7 = [v11 assetReferenceAtItemIndexPath:v16];
LABEL_16:

        goto LABEL_17;
      }
      if (v14 >= 1)
      {
        long long v17 = 0u;
        long long v18 = 0u;
        if (v11) {
          [v11 firstItemIndexPath];
        }
        goto LABEL_14;
      }
    }
    id v7 = 0;
    goto LABEL_16;
  }
  id v7 = 0;
LABEL_18:

  return v7;
}

void __68__PXMessagesStackPresentationAnimationController_animateTransition___block_invoke(uint64_t a1, int a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v3 = *(void **)(a1 + 40);
    id v4 = *(id *)(a1 + 32);
    id v5 = v3;
    if (!WeakRetained)
    {
LABEL_19:

      return;
    }
    id v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
    id v7 = [v6 topViewController];
    id v8 = [WeakRetained stackView];
    id v9 = v5;
    uint64_t v10 = -[PXMessagesStackPresentationAnimationController _bestAssetReferenceForStack:]((uint64_t)WeakRetained, v8);
    if (v10)
    {
      double v11 = (void *)v10;
      uint64_t v12 = [v8 dataSourceManager];
      double v13 = [(id)v12 dataSource];

      LOBYTE(v12) = -[PXPhotosGridStackTransitionHelper prepareForTransitionFromEndpoint:toEndpoint:withPrimaryAssetReference:dataSource:](*((void *)WeakRetained + 2), v8, v9, v11, v13);
      if (v12)
      {
        uint64_t v14 = (void *)*((void *)WeakRetained + 2);
        double v15 = [v6 view];
        double v16 = [v7 view];
        long long v17 = -[PXPhotosGridStackTransitionHelper setInitialTransitionStateInContainerView:aboveView:](v14, v15, v16);

        long long v18 = [v9 hiddenAssetReferences];
        v34 = v17;
        if ([v18 count])
        {
          id v19 = [v17 setByAddingObjectsFromSet:v18];
        }
        else
        {
          id v19 = v17;
        }
        v33 = v19;
        [v9 setHiddenAssetReferences:v19];
        char v32 = [v8 isHidden];
        [v8 setHidden:1];
        uint64_t v26 = *((void *)WeakRetained + 2);
        id v27 = (void *)*((void *)WeakRetained + 3);
        id v28 = [v6 view];
        -[PXPhotosGridStackTransitionHelper addTransitionAnimationsToAnimator:inContainerView:](v26, v27, v28);

        v29 = (void *)*((void *)WeakRetained + 3);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __88__PXMessagesStackPresentationAnimationController__animateTransition_gridViewController___block_invoke;
        v36[3] = &unk_1E5DD36F8;
        id v37 = v7;
        [v29 addAnimations:v36];
        -[PXPhotosGridStackTransitionHelper addTransitionCompletionsToAnimator:](*((void *)WeakRetained + 2), *((void **)WeakRetained + 3));
        v30 = (void *)*((void *)WeakRetained + 3);
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v39 = __88__PXMessagesStackPresentationAnimationController__animateTransition_gridViewController___block_invoke_2;
        v40 = &unk_1E5DD2498;
        id v41 = v9;
        id v42 = v18;
        id v43 = v8;
        char v45 = v32;
        id v44 = v4;
        id v31 = v18;
        [v30 addCompletion:&buf];
        [*((id *)WeakRetained + 3) startAnimation];

LABEL_18:
        goto LABEL_19;
      }
    }
    else
    {
      id v23 = PLUIGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "The stack doesn't have a current asset for transitioning", (uint8_t *)&buf, 2u);
      }
    }
    id v24 = PLUIGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_ERROR, "Failed to prepare for stack transition. Falling back to cross fade", (uint8_t *)&buf, 2u);
    }

    id v25 = [v7 view];
    [v25 setAlpha:1.0];

    -[PXMessagesStackPresentationAnimationController _animateCrossfadeFallback:gridViewController:]((uint64_t)WeakRetained, v4, v9);
    goto LABEL_18;
  }
  v20 = PLUIGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = *(void *)(a1 + 48);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v21;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "Cross fading due to failure to scroll to asset reference for transition: %@", (uint8_t *)&buf, 0xCu);
  }

  id v22 = objc_loadWeakRetained((id *)(a1 + 56));
  -[PXMessagesStackPresentationAnimationController _animateCrossfadeFallback:gridViewController:]((uint64_t)v22, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

void __88__PXMessagesStackPresentationAnimationController__animateTransition_gridViewController___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __88__PXMessagesStackPresentationAnimationController__animateTransition_gridViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHiddenAssetReferences:*(void *)(a1 + 40) animationType:2];
  [*(id *)(a1 + 48) setHidden:*(unsigned __int8 *)(a1 + 64)];
  objc_msgSend(*(id *)(a1 + 56), "completeTransition:", objc_msgSend(*(id *)(a1 + 56), "transitionWasCancelled") ^ 1);
  v2 = *(void **)(a1 + 32);
  return [v2 ensureSwipeDismissalInteraction];
}

void __95__PXMessagesStackPresentationAnimationController__animateCrossfadeFallback_gridViewController___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __95__PXMessagesStackPresentationAnimationController__animateCrossfadeFallback_gridViewController___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  v2 = *(void **)(a1 + 40);
  return [v2 ensureSwipeDismissalInteraction];
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  return self->_propertyAnimator;
}

- (double)transitionDuration:(id)a3
{
  return self->_transitionDuration;
}

- (PXMessagesStackPresentationAnimationController)initWithStackView:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXMessagesStackPresentationAnimationController;
  id v6 = [(PXMessagesStackPresentationAnimationController *)&v19 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stackView, a3);
    id v8 = +[PXMessagesUISettings sharedInstance];
    [v8 transitionDuration];
    v7->_transitionDuration = v9;
    [v8 transitionSpringDamping];
    double v11 = v10;
    [v8 transitionSpringVelocity];
    double v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithDampingRatio:initialVelocity:", v11, v12, v12);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v13 timingParameters:v7->_transitionDuration];
    propertyAnimator = v7->_propertyAnimator;
    v7->_propertyAnimator = (UIViewPropertyAnimator *)v14;

    double v16 = (PXPhotosGridStackTransitionHelper *)-[PXPhotosGridStackTransitionHelper initWithStackItemsCount:]([PXPhotosGridStackTransitionHelper alloc], [v8 transitionItemsCount]);
    transitionHelper = v7->_transitionHelper;
    v7->_transitionHelper = v16;
  }
  return v7;
}

@end