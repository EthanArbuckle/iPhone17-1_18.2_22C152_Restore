@interface PUOneUpPhotosSharingTransition
- (PUOneUpAssetTransitionViewController)presentingViewController;
- (PUOneUpPhotosSharingTransitionContext)oneUpPhotosSharingTransitionContext;
- (PUOneUpPhotosSharingTransitionDelegate)delegate;
- (PUOneUpPhotosSharingTransitionViewController)sharingTransitionViewController;
- (UICollectionViewLayout)_transitionLayout;
- (void)_setTransitionLayout:(id)a3;
- (void)animateDismissTransition;
- (void)animatePresentTransition;
- (void)setDelegate:(id)a3;
- (void)setOneUpPhotosSharingTransitionContext:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSharingTransitionViewController:(id)a3;
@end

@implementation PUOneUpPhotosSharingTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__transitionLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_oneUpPhotosSharingTransitionContext, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_sharingTransitionViewController);
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

- (PUOneUpPhotosSharingTransitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUOneUpPhotosSharingTransitionDelegate *)WeakRetained;
}

- (void)setOneUpPhotosSharingTransitionContext:(id)a3
{
}

- (PUOneUpPhotosSharingTransitionContext)oneUpPhotosSharingTransitionContext
{
  return self->_oneUpPhotosSharingTransitionContext;
}

- (void)setPresentingViewController:(id)a3
{
}

- (PUOneUpAssetTransitionViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (PUOneUpAssetTransitionViewController *)WeakRetained;
}

- (void)setSharingTransitionViewController:(id)a3
{
}

- (PUOneUpPhotosSharingTransitionViewController)sharingTransitionViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sharingTransitionViewController);
  return (PUOneUpPhotosSharingTransitionViewController *)WeakRetained;
}

- (void)animateDismissTransition
{
  v30 = [(PUViewControllerTransition *)self toViewController];
  v3 = [v30 view];
  v4 = [(PUOneUpPhotosSharingTransition *)self sharingTransitionViewController];
  v5 = [v4 view];
  v29 = [(PUViewControllerTransition *)self fromViewController];
  v6 = [v29 view];
  v28 = [(PUViewControllerTransition *)self containerView];
  v7 = [(PUOneUpPhotosSharingTransition *)self presentingViewController];
  [v3 layoutIfNeeded];
  [(PUViewControllerTransition *)self finalToViewFrame];
  objc_msgSend(v3, "setFrame:");
  [v28 insertSubview:v3 aboveSubview:v6];
  v8 = [v6 backgroundColor];
  [v28 setBackgroundColor:v8];

  v9 = [(PUOneUpPhotosSharingTransition *)self oneUpPhotosSharingTransitionContext];
  v10 = [v9 currentAssetReference];
  v11 = [v4 transitionCollectionView];
  v12 = [MEMORY[0x1E4FB1618] clearColor];
  [v11 setBackgroundColor:v12];

  v13 = [v6 layer];
  [v13 setAllowsGroupOpacity:0];

  v14 = [(PUOneUpPhotosSharingTransition *)self delegate];
  v15 = [v14 photosSharingTransition:self layoutForAssetReference:v10];

  [(PUOneUpPhotosSharingTransition *)self _setTransitionLayout:v15];
  [v4 setOneUpPhotosSharingTransitionContext:v9];
  v16 = [v4 embeddedActivityView];
  [v4 embeddedActivityViewFrameWhenShowing:0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke;
  v31[3] = &unk_1E5F27CB0;
  v31[4] = self;
  id v32 = v16;
  uint64_t v39 = v17;
  uint64_t v40 = v18;
  uint64_t v41 = v19;
  uint64_t v42 = v20;
  id v33 = v4;
  id v34 = v15;
  id v35 = v10;
  id v36 = v6;
  id v37 = v7;
  id v38 = v5;
  id v21 = v5;
  id v22 = v7;
  id v23 = v6;
  id v24 = v10;
  id v25 = v15;
  id v26 = v4;
  id v27 = v16;
  [v26 oneUpAssetTransition:self requestTransitionContextWithCompletion:v31];
}

void __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 containerView];
  v6 = [v4 oneUpTransitionContextWithContextWithContainerView:v5];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_2;
  v40[3] = &unk_1E5F2E058;
  id v41 = *(id *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 112);
  long long v42 = *(_OWORD *)(a1 + 96);
  long long v43 = v7;
  v8 = [v6 oneUpTransitionContextWithAnimationBlock:v40];

  [*(id *)(a1 + 48) setPhotosSharingTransitionLayout:*(void *)(a1 + 56) animated:1];
  v9 = _PhotoLibraryForAssetReference(*(void **)(a1 + 64));
  v10 = objc_msgSend(v9, "px_beginPausingChangesWithTimeout:identifier:", @"PUOneUpPhotosSharingTransition-Dismiss", *MEMORY[0x1E4F90FC8]);
  v11 = [*(id *)(a1 + 32) delegate];
  v12 = [v11 viewToHideWhilePresentingWithTransition:*(void *)(a1 + 32)];

  [v12 setAlpha:0.0];
  v13 = (void *)MEMORY[0x1E4FB1EB0];
  [*(id *)(a1 + 32) duration];
  double v15 = v14 * 0.5;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_3;
  v38[3] = &unk_1E5F2ED10;
  id v39 = *(id *)(a1 + 72);
  [v13 animateWithDuration:v38 animations:v15];
  v16 = (void *)MEMORY[0x1E4FB1EB0];
  [*(id *)(a1 + 32) duration];
  double v18 = v17 * 0.5;
  [*(id *)(a1 + 32) duration];
  double v20 = v19 * 0.5;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_4;
  v36[3] = &unk_1E5F2ED10;
  id v37 = v12;
  id v21 = v12;
  [v16 animateWithDuration:0 delay:v36 options:0 animations:v18 completion:v20];
  id v22 = *(void **)(a1 + 80);
  id v23 = *(void **)(a1 + 32);
  [v23 duration];
  double v25 = v24;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_5;
  v29[3] = &unk_1E5F27C88;
  id v30 = *(id *)(a1 + 88);
  id v31 = *(id *)(a1 + 40);
  id v32 = *(id *)(a1 + 48);
  id v33 = v9;
  uint64_t v26 = *(void *)(a1 + 32);
  id v34 = v10;
  uint64_t v35 = v26;
  id v27 = v10;
  id v28 = v9;
  [v22 oneUpAssetTransition:v23 animateTransitionWithContext:v8 duration:v29 completion:v25];
}

uint64_t __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setOneUpPhotosSharingTransitionContext:0];
  objc_msgSend(*(id *)(a1 + 56), "px_endPausingChanges:", *(void *)(a1 + 64));
  v2 = [*(id *)(a1 + 72) transitionContext];
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  id v4 = *(void **)(a1 + 72);
  return [v4 completeTransition:v3];
}

- (void)animatePresentTransition
{
  id v4 = [(PUOneUpPhotosSharingTransition *)self presentingViewController];
  v5 = [(PUViewControllerTransition *)self fromViewController];
  v6 = [(PUOneUpPhotosSharingTransition *)self sharingTransitionViewController];
  long long v7 = [(PUViewControllerTransition *)self toViewController];
  if (([v4 conformsToProtocol:&unk_1F08030E0] & 1) == 0)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"PUOneUpPhotosSharingTransition.m", 50, @"%@ (fromViewController) isn't conforming to PUOneUpAssetTransitionViewController", v5 object file lineNumber description];
  }
  if (([v6 conformsToProtocol:&unk_1F08030E0] & 1) == 0)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"PUOneUpPhotosSharingTransition.m", 51, @"%@ (toViewController) isn't conforming to PUOneUpAssetTransitionViewController", v7 object file lineNumber description];
  }
  v8 = [v7 view];
  v9 = [v6 view];
  v63 = [v5 view];
  v72 = [(PUViewControllerTransition *)self containerView];
  [(PUViewControllerTransition *)self finalToViewFrame];
  objc_msgSend(v8, "setFrame:");
  [v72 insertSubview:v8 aboveSubview:v63];
  v10 = [v8 layer];
  char v61 = [v10 allowsGroupOpacity];

  v11 = [v8 layer];
  [v11 setAllowsGroupOpacity:0];

  [v8 setAlpha:0.0];
  v69 = [(PUOneUpPhotosSharingTransition *)self oneUpPhotosSharingTransitionContext];
  [v69 currentAssetReference];
  v12 = v70 = v5;
  v13 = [(PUOneUpPhotosSharingTransition *)self delegate];
  v68 = [v13 photosSharingTransition:self layoutForAssetReference:v12];

  [(PUOneUpPhotosSharingTransition *)self _setTransitionLayout:v68];
  [v6 setOneUpPhotosSharingTransitionContext:v69];
  [v6 setPhotosSharingTransitionLayout:v68 animated:0];
  double v14 = [(PUOneUpPhotosSharingTransition *)self delegate];
  [v14 photosSharingTransition:self contentOffsetForAssetReference:v12];
  double v16 = v15;
  double v18 = v17;

  double v19 = [v6 transitionCollectionView];
  objc_msgSend(v19, "setContentOffset:", v16, v18);

  v67 = [v4 createAssetTransitionInfo];
  [v6 setOneUpPhotosSharingTransitionInfo:v67];
  [v8 layoutIfNeeded];
  v59 = [v9 superview];
  id v20 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v66 = v7;
  v57 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v71 = v9;
  [v59 insertSubview:v57 aboveSubview:v9];
  id v21 = [(PUOneUpPhotosSharingTransition *)self delegate];
  v65 = [v21 photosSharingTransitionTransitioningView:self];

  [v65 addSubview:v9];
  id v22 = [v6 transitionCollectionView];
  v55 = [v22 backgroundColor];

  id v23 = [v6 transitionCollectionView];
  double v24 = [MEMORY[0x1E4FB1618] clearColor];
  [v23 setBackgroundColor:v24];

  double v25 = [v6 embeddedActivityView];
  [v6 embeddedActivityViewFrameWhenShowing:0];
  objc_msgSend(v25, "setFrame:");
  [v6 embeddedActivityViewFrameWhenShowing:1];
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  id v34 = v25;
  v52 = v25;
  [v72 addSubview:v25];
  uint64_t v35 = [(PUOneUpPhotosSharingTransition *)self delegate];
  id v36 = v12;
  [v35 photosSharingTransition:self setVisibility:0 forAssetReference:v12];

  id v37 = _PhotoLibraryForAssetReference(v12);
  objc_msgSend(v37, "px_beginPausingChangesWithTimeout:identifier:", @"PUOneUpPhotosSharingTransition-Present", *MEMORY[0x1E4F90FC8]);
  id v38 = v4;
  id v39 = v53 = v4;
  [v6 setPhotosSharingTransitionLayout:0 animated:1];
  uint64_t v40 = [(PUOneUpPhotosSharingTransition *)self delegate];
  id v41 = [v40 viewToHideWhilePresentingWithTransition:self];

  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke;
  v73[3] = &unk_1E5F27C60;
  id v74 = v72;
  id v75 = v38;
  id v76 = v6;
  v77 = self;
  id v78 = v8;
  id v79 = v71;
  id v80 = v41;
  id v81 = v34;
  uint64_t v89 = v27;
  uint64_t v90 = v29;
  uint64_t v91 = v31;
  uint64_t v92 = v33;
  char v93 = v61;
  id v82 = v36;
  id v83 = v59;
  id v84 = v57;
  id v85 = v55;
  id v86 = v63;
  id v87 = v37;
  id v88 = v39;
  id v62 = v39;
  id v54 = v37;
  id v64 = v63;
  id v56 = v55;
  id v42 = v57;
  id v60 = v59;
  id v58 = v36;
  id v43 = v52;
  id v44 = v41;
  id v45 = v71;
  id v46 = v78;
  id v47 = v6;
  id v48 = v53;
  id v49 = v72;
  [v48 oneUpAssetTransition:self requestTransitionContextWithCompletion:v73];
}

void __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 snapshotView];
  id v4 = *(void **)(a1 + 32);
  [v3 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [*(id *)(a1 + 40) view];
  objc_msgSend(v4, "convertRect:fromView:", v13, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  objc_msgSend(v3, "setFrame:", v15, v17, v19, v21);
  [*(id *)(a1 + 32) addSubview:v3];
  [*(id *)(a1 + 48) oneUpAssetTransitionAssetFinalFrame:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 64), "convertRect:fromView:", *(void *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromView:", *(void *)(a1 + 64));
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v30 = (void *)MEMORY[0x1E4FB1EB0];
  [*(id *)(a1 + 56) duration];
  double v32 = v31 * 0.5;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_2;
  v68[3] = &unk_1E5F2ED10;
  id v69 = *(id *)(a1 + 80);
  [v30 animateWithDuration:v68 animations:v32];
  uint64_t v33 = (void *)MEMORY[0x1E4FB1EB0];
  [*(id *)(a1 + 56) duration];
  double v35 = v34 * 0.5;
  [*(id *)(a1 + 56) duration];
  double v37 = v36 * 0.5;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_3;
  v66[3] = &unk_1E5F2ED10;
  id v67 = *(id *)(a1 + 64);
  [v33 animateWithDuration:0 delay:v66 options:0 animations:v35 completion:v37];
  id v38 = (void *)MEMORY[0x1E4FB1EB0];
  [*(id *)(a1 + 56) duration];
  double v40 = v39;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_4;
  v57[3] = &unk_1E5F27C10;
  v57[4] = *(void *)(a1 + 56);
  id v58 = *(id *)(a1 + 88);
  long long v60 = *(_OWORD *)(a1 + 152);
  long long v61 = *(_OWORD *)(a1 + 168);
  id v59 = v3;
  uint64_t v62 = v23;
  uint64_t v63 = v25;
  uint64_t v64 = v27;
  uint64_t v65 = v29;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_5;
  v42[3] = &unk_1E5F27C38;
  v42[4] = *(void *)(a1 + 56);
  id v43 = *(id *)(a1 + 96);
  id v44 = *(id *)(a1 + 80);
  id v45 = *(id *)(a1 + 64);
  char v56 = *(unsigned char *)(a1 + 184);
  id v46 = *(id *)(a1 + 104);
  id v47 = *(id *)(a1 + 72);
  id v48 = *(id *)(a1 + 112);
  id v49 = *(id *)(a1 + 88);
  id v50 = *(id *)(a1 + 48);
  id v51 = *(id *)(a1 + 120);
  id v52 = v59;
  id v53 = *(id *)(a1 + 128);
  id v54 = *(id *)(a1 + 136);
  id v55 = *(id *)(a1 + 144);
  id v41 = v59;
  [v38 animateWithDuration:v57 animations:v42 completion:v40];
}

uint64_t __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 photosSharingTransitionWillAnimatePresentation:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  uint64_t v3 = *(void **)(a1 + 48);
  return [v3 setAlpha:0.0];
}

void __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 photosSharingTransition:*(void *)(a1 + 32) setVisibility:1 forAssetReference:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) setAlpha:1.0];
  uint64_t v3 = [*(id *)(a1 + 56) layer];
  [v3 setAllowsGroupOpacity:*(unsigned __int8 *)(a1 + 144)];

  id v4 = +[PUInterfaceManager currentTheme];
  id v8 = [v4 photoCollectionViewBackgroundColor];

  [*(id *)(a1 + 56) setBackgroundColor:v8];
  [*(id *)(a1 + 64) insertSubview:*(void *)(a1 + 72) aboveSubview:*(void *)(a1 + 80)];
  [*(id *)(a1 + 80) removeFromSuperview];
  [*(id *)(a1 + 72) addSubview:*(void *)(a1 + 88)];
  double v5 = [*(id *)(a1 + 96) transitionCollectionView];
  [v5 setBackgroundColor:*(void *)(a1 + 104)];

  [*(id *)(a1 + 112) removeFromSuperview];
  [*(id *)(a1 + 120) removeFromSuperview];
  [*(id *)(a1 + 96) setOneUpPhotosSharingTransitionContext:0];
  objc_msgSend(*(id *)(a1 + 128), "px_endPausingChanges:", *(void *)(a1 + 136));
  double v6 = [*(id *)(a1 + 32) transitionContext];
  uint64_t v7 = [v6 transitionWasCancelled] ^ 1;

  [*(id *)(a1 + 32) completeTransition:v7];
}

@end