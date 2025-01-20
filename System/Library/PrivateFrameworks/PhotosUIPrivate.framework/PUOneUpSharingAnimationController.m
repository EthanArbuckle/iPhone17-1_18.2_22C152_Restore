@interface PUOneUpSharingAnimationController
+ (id)new;
- (PUOneUpAssetTransitionViewController)presentingViewController;
- (PUOneUpPhotosSharingTransitionContext)oneUpTransitionContext;
- (PUOneUpSharingAnimationController)init;
- (PUOneUpSharingAnimationController)initWithTransitionContext:(id)a3 presentingViewController:(id)a4;
- (PUOneUpSharingAnimationControllerDelegate)delegate;
- (double)transitionDuration:(id)a3;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (void)_configurePhotoView:(id)a3 withContentHelper:(id)a4;
- (void)_installTransitioningBadgeViewsForAssetTransitionInfo:(id)a3 inTransitioningView:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PUOneUpSharingAnimationController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_oneUpTransitionContext, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PUOneUpSharingAnimationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUOneUpSharingAnimationControllerDelegate *)WeakRetained;
}

- (PUOneUpAssetTransitionViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (PUOneUpAssetTransitionViewController *)WeakRetained;
}

- (PUOneUpPhotosSharingTransitionContext)oneUpTransitionContext
{
  return self->_oneUpTransitionContext;
}

- (void)_configurePhotoView:(id)a3 withContentHelper:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    [v6 badgeInfo];
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  v8 = [v5 contentHelper];
  v36[0] = v37;
  v36[1] = v38;
  [v8 setBadgeInfo:v36];

  uint64_t v9 = [v7 badgeStyle];
  v10 = [v5 contentHelper];
  [v10 setBadgeStyle:v9];

  [v7 customPaddingForBadgeElements];
  double v12 = v11;
  double v14 = v13;
  v15 = [v5 contentHelper];
  objc_msgSend(v15, "setCustomPaddingForBadgeElements:", v12, v14);

  v16 = [v7 photoImage];
  v17 = [v5 contentHelper];
  [v17 setPhotoImage:v16];

  v18 = [v7 placeHolderImage];
  v19 = [v5 contentHelper];
  [v19 setPlaceHolderImage:v18];

  [v7 photoSize];
  double v21 = v20;
  double v23 = v22;
  v24 = [v5 contentHelper];
  objc_msgSend(v24, "setPhotoSize:", v21, v23);

  uint64_t v25 = [v7 fillMode];
  v26 = [v5 contentHelper];
  [v26 setFillMode:v25];

  if (v7)
  {
    [v7 imageTransform];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
  }
  v27 = [v5 contentHelper];
  v32[0] = v33;
  v32[1] = v34;
  v32[2] = v35;
  [v27 setImageTransform:v32];

  v28 = [v7 photoDecoration];
  v29 = [v5 contentHelper];
  [v29 setPhotoDecoration:v28];

  uint64_t v30 = [v7 isTextBannerVisible];
  v31 = [v5 contentHelper];
  [v31 setTextBannerVisible:v30];

  [v5 layoutIfNeeded];
}

- (void)_installTransitioningBadgeViewsForAssetTransitionInfo:(id)a3 inTransitioningView:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 badgeTransitionInfos];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      uint64_t v37 = v8;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        double v12 = objc_msgSend(v11, "snapshotView", v37);
        [v6 addSubview:v12];
        [v11 frame];
        CGFloat v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        [v5 frame];
        double v22 = v21;
        double v24 = v23;
        [v6 frame];
        if (v22 == v26 && v24 == v25)
        {
          double v27 = v14;
        }
        else
        {
          char v28 = [v11 badgesCorner];
          [v11 badgesOffset];
          double v27 = v29;
          double v31 = v30;
          v32 = [MEMORY[0x1E4FB1BA8] mainScreen];
          long long v33 = [v32 traitCollection];
          BOOL v34 = [v33 layoutDirection] == 1;

          if (((v28 & 0xA) != 0) != v34)
          {
            [v6 frame];
            CGFloat v35 = CGRectGetWidth(v45) - v27;
            v46.origin.x = v14;
            v46.origin.y = v16;
            v46.size.width = v18;
            v46.size.height = v20;
            double v27 = v35 - CGRectGetWidth(v46);
          }
          if ((v28 & 0xC) != 0)
          {
            [v6 frame];
            CGFloat v36 = CGRectGetHeight(v47) - v31;
            v48.origin.x = v27;
            v48.origin.y = v16;
            v48.size.width = v18;
            v48.size.height = v20;
            double v16 = v36 - CGRectGetHeight(v48);
          }
          else
          {
            double v16 = v31;
          }
          uint64_t v8 = v37;
        }
        objc_msgSend(v12, "setFrame:", v27, v16, v18, v20);
        [v12 setAlpha:0.0];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v8);
  }
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id v5 = a3;
  v98.receiver = self;
  v98.super_class = (Class)PUOneUpSharingAnimationController;
  id v6 = [(_UISheetAnimationController *)&v98 interruptibleAnimatorForTransition:v5];
  if (!self->_interruptibleAnimatorForTransitionWasCalled)
  {
    self->_interruptibleAnimatorForTransitionWasCalled = 1;
    uint64_t v7 = [v5 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
    CGRect v46 = v6;
    uint64_t v37 = v7;
    if (_os_feature_enabled_impl())
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [v7 photosCarouselViewController];
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
          BOOL v34 = (objc_class *)objc_opt_class();
          CGFloat v35 = NSStringFromClass(v34);
          CGFloat v36 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
          [v33 handleFailureInMethod:a2, self, @"PUOneUpSharingAnimationController.m", 75, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"activityViewController.photosCarouselViewController", v35, v36, v37 object file lineNumber description];
        }
      }
    }
    long long v42 = [v5 containerView];
    v43 = [v8 view];
    uint64_t v44 = [v8 mainCollectionView];
    uint64_t v9 = [(PUOneUpSharingAnimationController *)self oneUpTransitionContext];
    uint64_t v10 = [v9 currentAssetReference];

    double v11 = [(PUOneUpSharingAnimationController *)self oneUpTransitionContext];
    [v8 setOneUpPhotosSharingTransitionContext:v11];

    double v12 = [(PUOneUpSharingAnimationController *)self delegate];
    [v12 oneUpSharingAnimationController:self setVisibility:0 forAssetReference:v10];

    double v13 = [v10 asset];
    objc_opt_class();
    long long v41 = v10;
    if (objc_opt_isKindOfClass())
    {
      CGFloat v14 = [v10 asset];
      double v15 = [v14 photoLibrary];
    }
    else
    {
      double v15 = 0;
    }
    id v38 = v5;

    long long v39 = objc_msgSend(v15, "px_beginPausingChangesWithTimeout:identifier:", @"PUOneUpSharingAnimationController", *MEMORY[0x1E4F90FC8]);
    double v16 = [(PUOneUpSharingAnimationController *)self presentingViewController];
    double v17 = [v16 navigationController];
    long long v40 = [v17 toolbar];

    v96[0] = 0;
    v96[1] = v96;
    v96[2] = 0x3032000000;
    v96[3] = __Block_byref_object_copy__36108;
    v96[4] = __Block_byref_object_dispose__36109;
    id v97 = 0;
    v94[0] = 0;
    v94[1] = v94;
    v94[2] = 0x3032000000;
    v94[3] = __Block_byref_object_copy__36108;
    v94[4] = __Block_byref_object_dispose__36109;
    id v95 = 0;
    v92[0] = 0;
    v92[1] = v92;
    v92[2] = 0x3032000000;
    v92[3] = __Block_byref_object_copy__36108;
    v92[4] = __Block_byref_object_dispose__36109;
    id v93 = 0;
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x3032000000;
    v90[3] = __Block_byref_object_copy__36108;
    v90[4] = __Block_byref_object_dispose__36109;
    id v91 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x3032000000;
    v88[3] = __Block_byref_object_copy__36108;
    v88[4] = __Block_byref_object_dispose__36109;
    id v89 = 0;
    v86[0] = 0;
    v86[1] = v86;
    v86[2] = 0x3032000000;
    v86[3] = __Block_byref_object_copy__36108;
    v86[4] = __Block_byref_object_dispose__36109;
    id v87 = [MEMORY[0x1E4F1CA48] array];
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x3032000000;
    v84[3] = __Block_byref_object_copy__36108;
    v84[4] = __Block_byref_object_dispose__36109;
    id v85 = 0;
    double v18 = (void *)MEMORY[0x1E4FB1EB0];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke;
    v72[3] = &unk_1E5F26140;
    v72[4] = self;
    id v19 = v42;
    id v73 = v19;
    v77 = v96;
    v78 = v84;
    id v20 = v8;
    id v74 = v20;
    v79 = v92;
    v80 = v90;
    v81 = v94;
    v82 = v88;
    id v21 = v43;
    id v75 = v21;
    v83 = v86;
    id v22 = v44;
    id v76 = v22;
    [v18 performWithoutAnimation:v72];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_5;
    block[3] = &unk_1E5F261D8;
    id v23 = v46;
    v67 = v86;
    v68 = v88;
    id v64 = v23;
    v65 = self;
    id v45 = v41;
    id v66 = v45;
    SEL v71 = a2;
    v69 = v94;
    v70 = v96;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_9;
    v57[3] = &unk_1E5F26200;
    id v24 = v19;
    id v58 = v24;
    v61 = v94;
    id v25 = v21;
    id v59 = v25;
    v62 = v96;
    id v26 = v40;
    id v60 = v26;
    [v23 addAnimations:v57];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_10;
    v47[3] = &unk_1E5F26278;
    id v27 = v26;
    id v48 = v27;
    id v28 = v22;
    id v49 = v28;
    v53 = v94;
    v54 = v86;
    v55 = v96;
    id v29 = v20;
    id v50 = v29;
    v56 = v88;
    id v30 = v15;
    id v51 = v30;
    id v31 = v39;
    id v52 = v31;
    [v23 addCompletion:v47];

    _Block_object_dispose(v84, 8);
    _Block_object_dispose(v86, 8);

    _Block_object_dispose(v88, 8);
    _Block_object_dispose(v90, 8);

    _Block_object_dispose(v92, 8);
    _Block_object_dispose(v94, 8);

    _Block_object_dispose(v96, 8);
    id v5 = v38;
    id v6 = v46;
  }

  return v6;
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_2;
  v60[3] = &unk_1E5F260C8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v61 = *(id *)(a1 + 40);
  long long v63 = *(_OWORD *)(a1 + 72);
  id v62 = *(id *)(a1 + 48);
  long long v64 = *(_OWORD *)(a1 + 88);
  [v2 oneUpAssetTransition:v3 requestTransitionContextWithCompletion:v60 options:3];

  uint64_t v4 = [*(id *)(a1 + 48) referenceAssetTransitionInfo];
  uint64_t v5 = *(void *)(*(void *)(a1 + 104) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) frame];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  double v15 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  double v17 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) contentHelper];
  [v15 _configurePhotoView:v16 withContentHelper:v17];

  double v18 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) contentHelper];
  id v19 = [v18 badgeContainerView];
  double v20 = 0.0;
  [v19 setAlpha:0.0];

  id v21 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) snapshotView];
  id v22 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) contentHelper];
  [v22 setTransitionSnapshotView:v21];

  [*(id *)(a1 + 32) _installTransitioningBadgeViewsForAssetTransitionInfo:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) inTransitioningView:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t v23 = [*(id *)(a1 + 48) adjacentVisibleAssetsTransitionInfos];
  uint64_t v24 = *(void *)(*(void *)(a1 + 112) + 8);
  id v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__36108;
  id v58 = __Block_byref_object_dispose__36109;
  id v59 = 0;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = __Block_byref_object_copy__36108;
  id v52 = __Block_byref_object_dispose__36109;
  id v53 = 0;
  id v26 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_3;
  v47[3] = &unk_1E5F260F0;
  v47[6] = v8;
  v47[7] = v10;
  v47[8] = v12;
  v47[9] = v14;
  void v47[4] = &v54;
  v47[5] = &v48;
  [v26 enumerateObjectsUsingBlock:v47];
  id v27 = (void *)v49[5];
  if (v27)
  {
    [v27 frame];
    double v29 = v28;
    [*(id *)(a1 + 56) bounds];
    double v20 = v30 - v29;
  }
  id v31 = (void *)v55[5];
  if (v31)
  {
    [v31 frame];
    double v34 = v32 + v33;
  }
  else
  {
    double v34 = 0.0;
  }
  CGFloat v35 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_4;
  v38[3] = &unk_1E5F26118;
  uint64_t v41 = v8;
  uint64_t v42 = v10;
  uint64_t v43 = v12;
  uint64_t v44 = v14;
  double v45 = v34;
  double v46 = v20;
  v38[4] = *(void *)(a1 + 32);
  id v36 = *(id *)(a1 + 56);
  uint64_t v37 = *(void *)(a1 + 120);
  id v39 = v36;
  uint64_t v40 = v37;
  [v35 enumerateObjectsUsingBlock:v38];
  [*(id *)(a1 + 64) setAlpha:0.0];

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_5(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 timingParameters];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_6;
  aBlock[3] = &unk_1E5F26168;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v39 = *(void *)(a1 + 64);
  aBlock[4] = v4;
  long long v32 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v32;
  long long v38 = v32;
  id v6 = _Block_copy(aBlock);
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 532.84953, 46.16707, 0.0, 0.0);
  [v3 settlingDuration];
  double v9 = v8;
  [v7 settlingDuration];
  double v11 = v9 - v10;
  if (v11 < 0.0)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v27 = *(void *)(a1 + 88);
    uint64_t v28 = *(void *)(a1 + 40);
    [v7 settlingDuration];
    uint64_t v30 = v29;
    [v3 settlingDuration];
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v27, v28, @"PUOneUpSharingAnimationController.m", 223, @"timingParametersForAdjacentAssetsAnimation settling duration:%f must be lower than the sheet settling duration:%f", v30, v31);
  }
  uint64_t v12 = (void *)MEMORY[0x1E4FB1EB0];
  [v7 settlingDuration];
  double v14 = v13;
  [v7 mass];
  double v16 = v15;
  [v7 stiffness];
  double v18 = v17;
  [v7 damping];
  [v12 _animateUsingSpringWithDuration:0 delay:v6 options:0 mass:v14 stiffness:v11 damping:v16 initialVelocity:v18 animations:v19 completion:0.0];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_7;
  v33[3] = &unk_1E5F261B0;
  long long v34 = *(_OWORD *)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 80);
  uint64_t v35 = *(void *)(a1 + 56);
  uint64_t v36 = v20;
  id v21 = _Block_copy(v33);
  [v3 settlingDuration];
  double v23 = v22 * 0.25;
  uint64_t v24 = (void *)MEMORY[0x1E4FB1EB0];
  [v3 settlingDuration];
  [v24 animateWithDuration:0 delay:v21 options:0 animations:v25 - v23 completion:v23];
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_9(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) frame];
  objc_msgSend(v2, "convertRect:fromView:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "setFrame:");
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cornerRadius];
  double v4 = v3;
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) layer];
  [v5 setCornerRadius:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setClipsToBounds:1];
  [*(id *)(a1 + 48) setAlpha:0.0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "badgeTransitionInfos", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = [v11 snapshotView];
        [v11 frame];
        objc_msgSend(v12, "setFrame:");
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:1.0];
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) asset];
  uint64_t v3 = [v2 playbackStyle];

  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 4 || v3 == 2) {
    double v5 = 0.200000003;
  }
  else {
    double v5 = 0.0;
  }
  id v6 = (void *)MEMORY[0x1E4FB1EB0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_11;
  v17[3] = &unk_1E5F26228;
  long long v18 = *(_OWORD *)(a1 + 80);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_12;
  v10[3] = &unk_1E5F26250;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 72);
  id v11 = v7;
  uint64_t v9 = *(void *)(a1 + 96);
  uint64_t v14 = v8;
  uint64_t v15 = v9;
  long long v16 = *(_OWORD *)(a1 + 80);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  [v6 animateWithDuration:v17 animations:v10 completion:v5];
}

uint64_t __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_11(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setAlpha:", 0.0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAlpha:0.0];
}

uint64_t __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_12(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setOneUpPhotosSharingTransitionContext:0];
  [*(id *)(a1 + 32) setOneUpPhotosSharingTransitionInfo:0];
  [*(id *)(a1 + 32) setTrailingAssetTransitionInfo:0];
  [*(id *)(a1 + 32) setLeadingAssetTransitionInfo:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) badgeTransitionInfos];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v18 + 1) + 8 * v6) snapshotView];
        [v7 removeFromSuperview];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) enumerateObjectsUsingBlock:&__block_literal_global_222_36114];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "removeFromSuperview", (void)v14);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) removeFromSuperview];
  return objc_msgSend(*(id *)(a1 + 40), "px_endPausingChanges:", *(void *)(a1 + 48));
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(a2, "badgeTransitionInfos", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) snapshotView];
        [v7 removeFromSuperview];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_6(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:v2];
      uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v2];
      [v3 frame];
      objc_msgSend(v4, "setFrame:");

      ++v2;
    }
    while (v2 < [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]);
  }
  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 oneUpSharingAnimationController:*(void *)(a1 + 32) setVisibility:1 forAssetReference:*(void *)(a1 + 40)];
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_7(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1[4] + 8) + 40) enumerateObjectsUsingBlock:&__block_literal_global_36120];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v2 = [*(id *)(*(void *)(a1[5] + 8) + 40) badgeTransitionInfos];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v21 + 1) + 8 * v6) snapshotView];
        [v7 setAlpha:1.0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = *(id *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "contentHelper", (void)v17);
        long long v14 = [v13 badgeContainerView];
        [v14 setAlpha:1.0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }

  long long v15 = [*(id *)(*(void *)(a1[7] + 8) + 40) contentHelper];
  long long v16 = [v15 badgeContainerView];
  [v16 setAlpha:1.0];
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v2 = objc_msgSend(a2, "badgeTransitionInfos", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) snapshotView];
        [v7 setAlpha:1.0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v35 = [v3 snapshotView];
  uint64_t v4 = *(void **)(a1 + 32);
  [v35 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [v3 fromView];
  objc_msgSend(v4, "convertRect:fromView:", v13, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  long long v22 = -[PUPhotoView initWithFrame:]([PUPhotoView alloc], "initWithFrame:", v15, v17, v19, v21);
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;

  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v25 = [v3 transitionInfo];
  uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;

  uint64_t v28 = [v3 transitionInfo];
  [*(id *)(a1 + 40) setOneUpPhotosSharingTransitionInfo:v28];

  uint64_t v29 = [v3 trailingAssetTransitionInfo];
  uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;

  uint64_t v32 = [v3 leadingAssetTransitionInfo];

  uint64_t v33 = *(void *)(*(void *)(a1 + 72) + 8);
  long long v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v32;

  [*(id *)(a1 + 40) setTrailingAssetTransitionInfo:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(a1 + 40) setLeadingAssetTransitionInfo:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_3(uint64_t a1, void *a2)
{
  id v18 = a2;
  [v18 frame];
  if (v4 >= *(double *)(a1 + 48))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void *)(v13 + 40);
    double v8 = (id *)(v13 + 40);
    if (v14)
    {
      [v18 frame];
      double v16 = v15;
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) frame];
      if (v16 >= v17) {
        goto LABEL_10;
      }
      uint64_t v5 = a1 + 32;
      goto LABEL_8;
    }
LABEL_9:
    objc_storeStrong(v8, a2);
    goto LABEL_10;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = a1 + 32;
  uint64_t v7 = *(void *)(v6 + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  double v8 = (id *)(v7 + 40);
  if (!v9) {
    goto LABEL_9;
  }
  [v18 frame];
  double v11 = v10;
  [*(id *)(*(void *)(*(void *)v5 + 8) + 40) frame];
  if (v11 > v12)
  {
LABEL_8:
    double v8 = (id *)(*(void *)(*(void *)v5 + 8) + 40);
    goto LABEL_9;
  }
LABEL_10:
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  if (v4 >= *(double *)(a1 + 56)) {
    double v8 = v4 + *(double *)(a1 + 96);
  }
  else {
    double v8 = v4 - *(double *)(a1 + 88);
  }
  double v16 = -[PUPhotoView initWithFrame:]([PUPhotoView alloc], "initWithFrame:", v8, v5, v6, v7);
  uint64_t v9 = *(void **)(a1 + 32);
  double v10 = [v3 contentHelper];
  [v9 _configurePhotoView:v16 withContentHelper:v10];

  [v3 cornerRadius];
  double v12 = v11;
  uint64_t v13 = [(PUPhotoView *)v16 layer];
  [v13 setCornerRadius:v12];

  [(PUPhotoView *)v16 setClipsToBounds:1];
  uint64_t v14 = [(PUPhotoView *)v16 contentHelper];
  double v15 = [v14 badgeContainerView];
  [v15 setAlpha:0.0];

  [*(id *)(a1 + 40) addSubview:v16];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v16];
  [*(id *)(a1 + 32) _installTransitioningBadgeViewsForAssetTransitionInfo:v3 inTransitioningView:v16];
}

- (double)transitionDuration:(id)a3
{
  BOOL v3 = (unint64_t)(objc_msgSend((id)*MEMORY[0x1E4FB2608], "activeInterfaceOrientation", a3) - 3) < 2;
  double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  double result = dbl_1AEFF7BA0[v3];
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 0.666999996;
  }
  return result;
}

- (PUOneUpSharingAnimationController)initWithTransitionContext:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUOneUpSharingAnimationController;
  uint64_t v9 = [(_UISheetAnimationController *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_oneUpTransitionContext, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (PUOneUpSharingAnimationController)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUOneUpSharingAnimationController.m", 33, @"%s is not available as initializer", "-[PUOneUpSharingAnimationController init]");

  abort();
}

+ (id)new
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PUOneUpSharingAnimationController.m", 37, @"%s is not available as initializer", "+[PUOneUpSharingAnimationController new]");

  abort();
}

@end