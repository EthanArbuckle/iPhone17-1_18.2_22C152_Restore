@interface PUPhotosSharingTransition
- (PUPhotosSharingTransitionContext)photosSharingTransitionContext;
- (PUPhotosSharingTransitionDelegate)delegate;
- (PUPhotosSharingTransitionViewController)sharingTransitionViewController;
- (UICollectionViewLayout)_transitionLayout;
- (void)_setTransitionLayout:(id)a3;
- (void)animateDismissTransition;
- (void)animatePresentTransition;
- (void)setDelegate:(id)a3;
- (void)setPhotosSharingTransitionContext:(id)a3;
- (void)setSharingTransitionViewController:(id)a3;
@end

@implementation PUPhotosSharingTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__transitionLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photosSharingTransitionContext, 0);
  objc_storeStrong((id *)&self->_sharingTransitionViewController, 0);
}

- (void)_setTransitionLayout:(id)a3
{
}

- (UICollectionViewLayout)_transitionLayout
{
  return self->__transitionLayout;
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotosSharingTransitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotosSharingTransitionDelegate *)WeakRetained;
}

- (void)setPhotosSharingTransitionContext:(id)a3
{
}

- (PUPhotosSharingTransitionContext)photosSharingTransitionContext
{
  return self->_photosSharingTransitionContext;
}

- (void)setSharingTransitionViewController:(id)a3
{
}

- (PUPhotosSharingTransitionViewController)sharingTransitionViewController
{
  return self->_sharingTransitionViewController;
}

- (void)animateDismissTransition
{
  v50 = [(PUViewControllerTransition *)self toViewController];
  v3 = [v50 view];
  v4 = [(PUPhotosSharingTransition *)self sharingTransitionViewController];
  v5 = [v4 view];
  v49 = [(PUViewControllerTransition *)self fromViewController];
  v6 = [v49 view];
  v51 = [(PUViewControllerTransition *)self containerView];
  [(PUViewControllerTransition *)self finalToViewFrame];
  v48 = v3;
  objc_msgSend(v3, "setFrame:");
  [v51 insertSubview:v3 belowSubview:v6];
  [v3 layoutIfNeeded];
  v7 = [(PUPhotosSharingTransition *)self photosSharingTransitionContext];
  v42 = [v7 keyAssetIndexPath];
  v46 = v7;
  v8 = [v7 assetCollectionsDataSource];
  v43 = [v5 superview];
  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v44 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v43 insertSubview:v44 aboveSubview:v5];
  v10 = [(PUPhotosSharingTransition *)self delegate];
  v47 = [v10 photosSharingTransition:self viewForTransitionWithAssetCollectionsDataSource:v8];

  [v47 insertSubview:v5 aboveSubview:v6];
  v11 = [v4 transitionCollectionView];
  v12 = [MEMORY[0x1E4FB1618] clearColor];
  [v11 setBackgroundColor:v12];

  v13 = [v6 layer];
  [v13 setAllowsGroupOpacity:0];

  v14 = [(PUPhotosSharingTransition *)self delegate];
  uint64_t v15 = [v14 photosSharingTransition:self layoutForKeyAssetIndexPath:v42 inAssetCollectionsDataSource:v8];

  v45 = (void *)v15;
  [(PUPhotosSharingTransition *)self _setTransitionLayout:v15];
  [v4 setPhotosSharingTransitionContext:v7];
  v16 = [v4 embeddedActivityView];
  [v4 embeddedActivityViewFrameWhenShowing:0];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  [v51 addSubview:v16];
  v25 = [(PUPhotosSharingTransition *)self delegate];
  [v25 photosSharingTransition:self setVisibility:0 forKeyAssetIndexPath:v42 inAssetCollectionsDataSource:v8];

  [v4 setPhotosSharingTransitionLayout:v15 animated:1];
  v26 = [v8 assetCollectionsFetchResult];
  v27 = [v26 photoLibrary];

  v28 = objc_msgSend(v27, "px_beginPausingChangesWithTimeout:identifier:", @"PUPhotosSharingTransition-Dismiss", *MEMORY[0x1E4F90FC8]);
  v41 = (void *)MEMORY[0x1E4FB1EB0];
  [(PUViewControllerTransition *)self duration];
  double v30 = v29;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __53__PUPhotosSharingTransition_animateDismissTransition__block_invoke;
  v62[3] = &unk_1E5F2AB50;
  v62[4] = self;
  id v63 = v6;
  id v64 = v16;
  uint64_t v65 = v18;
  uint64_t v66 = v20;
  uint64_t v67 = v22;
  uint64_t v68 = v24;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __53__PUPhotosSharingTransition_animateDismissTransition__block_invoke_2;
  v52[3] = &unk_1E5F2ABA0;
  v52[4] = self;
  id v53 = v42;
  id v54 = v8;
  id v55 = v43;
  id v56 = v5;
  id v57 = v44;
  id v58 = v64;
  id v59 = v4;
  id v60 = v27;
  id v61 = v28;
  id v31 = v28;
  id v32 = v27;
  id v33 = v4;
  id v34 = v64;
  id v35 = v44;
  id v36 = v5;
  id v37 = v43;
  id v38 = v8;
  id v39 = v42;
  id v40 = v6;
  [v41 animateWithDuration:v62 animations:v52 completion:v30];
}

uint64_t __53__PUPhotosSharingTransition_animateDismissTransition__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 photosSharingTransition:*(void *)(a1 + 32) willAnimatePresent:0];

  [*(id *)(a1 + 40) setAlpha:0.0];
  v3 = *(void **)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  double v7 = *(double *)(a1 + 80);
  return objc_msgSend(v3, "setFrame:", v4, v5, v6, v7);
}

uint64_t __53__PUPhotosSharingTransition_animateDismissTransition__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 photosSharingTransition:*(void *)(a1 + 32) setVisibility:1 forKeyAssetIndexPath:*(void *)(a1 + 40) inAssetCollectionsDataSource:*(void *)(a1 + 48)];

  [*(id *)(a1 + 56) insertSubview:*(void *)(a1 + 64) aboveSubview:*(void *)(a1 + 72)];
  [*(id *)(a1 + 72) removeFromSuperview];
  [*(id *)(a1 + 64) addSubview:*(void *)(a1 + 80)];
  [*(id *)(a1 + 88) setPhotosSharingTransitionContext:0];
  objc_msgSend(*(id *)(a1 + 96), "px_endPausingChanges:", *(void *)(a1 + 104));
  v3 = [*(id *)(a1 + 32) transitionContext];
  uint64_t v4 = [v3 transitionWasCancelled] ^ 1;

  double v5 = *(void **)(a1 + 32);
  return [v5 completeTransition:v4];
}

- (void)animatePresentTransition
{
  uint64_t v65 = [(PUViewControllerTransition *)self toViewController];
  v3 = [v65 view];
  uint64_t v4 = [(PUPhotosSharingTransition *)self sharingTransitionViewController];
  double v5 = [v4 view];
  id v64 = [(PUViewControllerTransition *)self fromViewController];
  id v59 = [v64 view];
  double v6 = [(PUViewControllerTransition *)self containerView];
  [(PUViewControllerTransition *)self finalToViewFrame];
  objc_msgSend(v3, "setFrame:");
  id v56 = v6;
  [v6 insertSubview:v3 aboveSubview:v59];
  double v7 = [v3 layer];
  char v57 = [v7 allowsGroupOpacity];

  v8 = [v3 layer];
  [v8 setAllowsGroupOpacity:0];

  [v3 setAlpha:0.0];
  id v9 = [(PUPhotosSharingTransition *)self photosSharingTransitionContext];
  v10 = [v9 keyAssetIndexPath];
  id v63 = v9;
  v11 = [v9 assetCollectionsDataSource];
  v12 = [(PUPhotosSharingTransition *)self delegate];
  v62 = [v12 photosSharingTransition:self layoutForKeyAssetIndexPath:v10 inAssetCollectionsDataSource:v11];

  [(PUPhotosSharingTransition *)self _setTransitionLayout:v62];
  [v4 setPhotosSharingTransitionContext:v9];
  [v4 setPhotosSharingTransitionLayout:v62 animated:0];
  v13 = [(PUPhotosSharingTransition *)self delegate];
  [v13 photosSharingTransition:self contentOffsetForKeyAssetIndexPath:v10 inAssetCollectionsDataSource:v11];
  double v15 = v14;
  double v17 = v16;

  uint64_t v18 = [v4 transitionCollectionView];
  objc_msgSend(v18, "setContentOffset:", v15, v17);

  [v3 layoutIfNeeded];
  uint64_t v19 = [v5 superview];
  id v20 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v54 = v5;
  id v55 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v21 = v19;
  [v19 insertSubview:v55 aboveSubview:v5];
  uint64_t v22 = [(PUPhotosSharingTransition *)self delegate];
  id v61 = [v22 photosSharingTransition:self viewForTransitionWithAssetCollectionsDataSource:v11];

  [v61 addSubview:v5];
  uint64_t v23 = [v4 transitionCollectionView];
  v52 = [v23 backgroundColor];

  uint64_t v24 = [v4 transitionCollectionView];
  v25 = [MEMORY[0x1E4FB1618] clearColor];
  [v24 setBackgroundColor:v25];

  v26 = [v4 embeddedActivityView];
  [v4 embeddedActivityViewFrameWhenShowing:0];
  objc_msgSend(v26, "setFrame:");
  [v4 embeddedActivityViewFrameWhenShowing:1];
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  [v6 addSubview:v26];
  id v35 = [(PUPhotosSharingTransition *)self delegate];
  [v35 photosSharingTransition:self setVisibility:0 forKeyAssetIndexPath:v10 inAssetCollectionsDataSource:v11];

  [v4 setPhotosSharingTransitionLayout:0 animated:1];
  v49 = v11;
  id v36 = [v11 assetCollectionsFetchResult];
  id v37 = [v36 photoLibrary];

  id v38 = objc_msgSend(v37, "px_beginPausingChangesWithTimeout:identifier:", @"PUPhotosSharingTransition-Present", *MEMORY[0x1E4F90FC8]);
  v50 = (void *)MEMORY[0x1E4FB1EB0];
  [(PUViewControllerTransition *)self duration];
  double v40 = v39;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __53__PUPhotosSharingTransition_animatePresentTransition__block_invoke;
  v80[3] = &unk_1E5F2AB50;
  v80[4] = self;
  id v81 = v3;
  id v82 = v26;
  uint64_t v83 = v28;
  uint64_t v84 = v30;
  uint64_t v85 = v32;
  uint64_t v86 = v34;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __53__PUPhotosSharingTransition_animatePresentTransition__block_invoke_2;
  v66[3] = &unk_1E5F2AB78;
  v66[4] = self;
  id v67 = v10;
  id v68 = v11;
  id v69 = v81;
  char v79 = v57;
  id v70 = v21;
  id v71 = v54;
  id v72 = v55;
  id v73 = v82;
  id v74 = v4;
  id v75 = v52;
  id v76 = v59;
  id v77 = v37;
  id v78 = v38;
  id v58 = v38;
  id v51 = v37;
  id v60 = v59;
  id v41 = v52;
  id v53 = v4;
  id v42 = v82;
  id v43 = v55;
  id v44 = v54;
  id v45 = v21;
  id v46 = v81;
  id v47 = v49;
  id v48 = v10;
  [v50 animateWithDuration:v80 animations:v66 completion:v40];
}

uint64_t __53__PUPhotosSharingTransition_animatePresentTransition__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 photosSharingTransition:*(void *)(a1 + 32) willAnimatePresent:1];

  [*(id *)(a1 + 40) setAlpha:1.0];
  v3 = *(void **)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  double v7 = *(double *)(a1 + 80);
  return objc_msgSend(v3, "setFrame:", v4, v5, v6, v7);
}

uint64_t __53__PUPhotosSharingTransition_animatePresentTransition__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 photosSharingTransition:*(void *)(a1 + 32) setVisibility:1 forKeyAssetIndexPath:*(void *)(a1 + 40) inAssetCollectionsDataSource:*(void *)(a1 + 48)];

  v3 = [*(id *)(a1 + 56) layer];
  [v3 setAllowsGroupOpacity:*(unsigned __int8 *)(a1 + 136)];

  [*(id *)(a1 + 64) insertSubview:*(void *)(a1 + 72) aboveSubview:*(void *)(a1 + 80)];
  [*(id *)(a1 + 80) removeFromSuperview];
  [*(id *)(a1 + 72) addSubview:*(void *)(a1 + 88)];
  double v4 = [*(id *)(a1 + 96) transitionCollectionView];
  [v4 setBackgroundColor:*(void *)(a1 + 104)];

  [*(id *)(a1 + 112) removeFromSuperview];
  [*(id *)(a1 + 96) setPhotosSharingTransitionContext:0];
  objc_msgSend(*(id *)(a1 + 120), "px_endPausingChanges:", *(void *)(a1 + 128));
  double v5 = [*(id *)(a1 + 32) transitionContext];
  uint64_t v6 = [v5 transitionWasCancelled] ^ 1;

  double v7 = *(void **)(a1 + 32);
  return [v7 completeTransition:v6];
}

@end