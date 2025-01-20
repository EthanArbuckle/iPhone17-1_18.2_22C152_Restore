@interface VUIPreviewInteractionController
- (BOOL)previewInteractionShouldBegin:(id)a3;
- (NSIndexPath)currentIndexPath;
- (UIViewController)presentedViewController;
- (UIViewController)presentingViewController;
- (VUIPreviewInteractionController)initWithPresentingViewController:(id)a3 collectionView:(id)a4 controllerToPresent:(id)a5;
- (VUIPreviewInteractionControllerDelegate)delegate;
- (double)transitionDuration:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_cleanupPreviewInteraction;
- (void)animateTransition:(id)a3;
- (void)dealloc;
- (void)dismissConfirmation;
- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5;
- (void)previewInteractionDidCancel:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation VUIPreviewInteractionController

- (VUIPreviewInteractionController)initWithPresentingViewController:(id)a3 collectionView:(id)a4 controllerToPresent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VUIPreviewInteractionController;
  v11 = [(VUIPreviewInteractionController *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionView, a4);
    objc_storeWeak((id *)&v12->_presentingViewController, v8);
    objc_storeStrong((id *)&v12->_presentedViewController, a5);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1B20]) initWithView:v12->_collectionView];
    previewInteraction = v12->_previewInteraction;
    v12->_previewInteraction = (UIPreviewInteraction *)v13;

    [(UIPreviewInteraction *)v12->_previewInteraction setDelegate:v12];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v12 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
  }
  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];

  v4.receiver = self;
  v4.super_class = (Class)VUIPreviewInteractionController;
  [(VUIPreviewInteractionController *)&v4 dealloc];
}

- (void)dismissConfirmation
{
  if (self->_wrapperViewController)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __54__VUIPreviewInteractionController_dismissConfirmation__block_invoke;
    v2[3] = &unk_1E6DF3D58;
    v2[4] = self;
    [MEMORY[0x1E4FB1EC0] _performWithoutDeferringTransitions:v2];
  }
}

uint64_t __54__VUIPreviewInteractionController_dismissConfirmation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) dismissViewControllerAnimated:0 completion:0];
  v2 = *(void **)(a1 + 32);
  return [v2 _cleanupPreviewInteraction];
}

- (BOOL)previewInteractionShouldBegin:(id)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  [a3 locationInCoordinateSpace:0];
  objc_super v4 = -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
  v5 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v4];
  stashedCell = self->_stashedCell;
  self->_stashedCell = v5;

  v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = self->_collectionView;
  if (v8)
  {
    id v9 = v8;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if ([v10 isDragging])
        {

          goto LABEL_25;
        }
        [v7 addObject:v10];
      }
      uint64_t v11 = [v9 superview];

      id v9 = (void *)v11;
    }
    while (v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  uint64_t v13 = [WeakRetained navigationController];

  if (v13)
  {
    v14 = [(VUIPreviewInteractionController *)self delegate];
    id v10 = v14;
    if (v14
      && ![v14 interactionController:self shouldInteractionControllerBeginForIndexPath:v4])
    {
LABEL_25:
      BOOL v38 = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_currentIndexPath, v4);
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v15 = v7;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v108 objects:v112 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v109;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v109 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v108 + 1) + 8 * i);
            v21 = [v20 panGestureRecognizer];
            [v21 setEnabled:0];

            v22 = [v20 panGestureRecognizer];
            [v22 setEnabled:1];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v108 objects:v112 count:16];
        }
        while (v17);
      }

      v23 = [(UICollectionViewCell *)self->_stashedCell snapshotViewAfterScreenUpdates:1];
      if (!self->_wrapperViewController)
      {
        v24 = objc_alloc_init(VUIPresentationContainerViewController);
        wrapperViewController = self->_wrapperViewController;
        self->_wrapperViewController = v24;

        [(VUIPresentationContainerViewController *)self->_wrapperViewController setTransitioningDelegate:self];
        [(VUIPresentationContainerViewController *)self->_wrapperViewController setModalPresentationStyle:4];
        v26 = [(VUIPresentationContainerViewController *)self->_wrapperViewController view];
        v27 = [(UIViewController *)self->_presentedViewController view];
        [v26 addSubview:v27];

        [(VUIPresentationContainerViewController *)self->_wrapperViewController addChildViewController:self->_presentedViewController];
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke;
        v107[3] = &unk_1E6DF3D58;
        v107[4] = self;
        [MEMORY[0x1E4FB1EC0] _performWithoutDeferringTransitions:v107];
        v28 = [(VUIPresentationContainerViewController *)self->_wrapperViewController presentationController];
        v29 = [v28 containerView];
        v30 = [v28 presentedView];
        [v29 insertSubview:v23 belowSubview:v30];
        [v29 bounds];
        double Width = CGRectGetWidth(v114);
        [v29 safeAreaInsets];
        double v33 = Width - v32;
        [v29 safeAreaInsets];
        double v35 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        double v36 = 56.0;
        if (*MEMORY[0x1E4F1DB30] == v33 - v34 + -33.0 && v35 == 56.0)
        {
          objc_msgSend(v29, "bounds", 56.0, v35);
          double v36 = CGRectGetWidth(v115) + -33.0;
          double v83 = v36;
          double v84 = 544.0;
        }
        else
        {
          double v84 = 56.0;
          double v83 = v33 - v34 + -33.0;
        }
        v39 = [(VUIPreviewInteractionController *)self presentingViewController];
        v40 = [v39 view];

        collectionView = self->_collectionView;
        [(UICollectionViewCell *)self->_stashedCell frame];
        v91 = v40;
        -[UICollectionView convertRect:toView:](collectionView, "convertRect:toView:", v40);
        objc_msgSend(v40, "convertRect:toView:", v29);
        CGFloat v85 = v43;
        CGFloat v87 = v42;
        CGFloat v45 = v44;
        CGFloat v47 = v46;
        objc_msgSend(v23, "setFrame:");
        [(UICollectionViewCell *)self->_stashedCell setHidden:1];
        [v29 bounds];
        CGFloat x = v116.origin.x;
        CGFloat y = v116.origin.y;
        CGFloat v50 = v116.size.width;
        double v89 = v116.size.width;
        CGFloat height = v116.size.height;
        double v92 = v116.size.height;
        double v52 = CGRectGetWidth(v116) + -33.0;
        v117.origin.CGFloat x = x;
        v117.origin.CGFloat y = y;
        v117.size.width = v50;
        v117.size.CGFloat height = height;
        double v53 = CGRectGetHeight(v117) + -33.0;
        if (v52 >= v83) {
          double v54 = v83;
        }
        else {
          double v54 = v52;
        }
        if (v53 >= v84) {
          double v55 = v84;
        }
        else {
          double v55 = v53;
        }
        objc_msgSend(v28, "setModalSize:", v54, v55);
        [v30 setAlpha:0.0];
        v118.origin.CGFloat x = v87;
        v118.origin.CGFloat y = v85;
        v118.size.width = v45;
        v118.size.CGFloat height = v47;
        double MidX = CGRectGetMidX(v118);
        v119.origin.CGFloat x = v87;
        v119.origin.CGFloat y = v85;
        v119.size.width = v45;
        v119.size.CGFloat height = v47;
        double MidY = CGRectGetMidY(v119);
        [v29 bounds];
        CGFloat v59 = (v58 - v54) * 0.5;
        CGFloat v61 = (v60 - v55) * 0.5;
        v120.origin.CGFloat x = v59;
        v120.origin.CGFloat y = v61;
        v120.size.width = v54;
        v120.size.CGFloat height = v55;
        double v62 = CGRectGetMidX(v120);
        v121.origin.CGFloat x = v59;
        v121.origin.CGFloat y = v61;
        v121.size.width = v54;
        v121.size.CGFloat height = v55;
        double v63 = CGRectGetMidY(v121);
        [v23 frame];
        double v65 = fmax(v64 / v54, 0.5);
        [v23 frame];
        double v67 = fmax(v66 / v55, 0.5);
        if (v65 >= v67) {
          double v65 = v67;
        }
        objc_msgSend(v30, "setFrame:", (v89 - v54) * 0.5, (v92 - v55) * 0.5, v54, v55);
        v90 = v29;
        memset(&v106, 0, sizeof(v106));
        CGAffineTransformMakeTranslation(&v106, MidX - v62, MidY - v63);
        CGAffineTransform v104 = v106;
        CGAffineTransformScale(&v105, &v104, v65, v65);
        CGAffineTransform v106 = v105;
        [v30 setTransform:&v105];
        v68 = [v28 backdropView];
        +[VUIConfirmationBlurEffect effectWithStyle:1];
        v69 = v86 = v28;
        id v70 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        v100[0] = MEMORY[0x1E4F143A8];
        v100[1] = 3221225472;
        v100[2] = __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_2;
        v100[3] = &unk_1E6DF45D8;
        v71 = v30;
        id v72 = v68;
        id v101 = v72;
        id v102 = v69;
        id v73 = v23;
        id v103 = v73;
        id v88 = v69;
        v74 = (UIViewPropertyAnimator *)[v70 initWithDuration:3 curve:v100 animations:1.0];
        previewPropertyAnimator = self->_previewPropertyAnimator;
        self->_previewPropertyAnimator = v74;

        v96[0] = MEMORY[0x1E4F143A8];
        v96[1] = 3221225472;
        v96[2] = __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_3;
        v96[3] = &unk_1E6DF8D48;
        id v76 = v71;
        CGAffineTransform v99 = v106;
        id v97 = v76;
        id v98 = v72;
        id v77 = v72;
        [v86 setCompletedAnimationBlock:v96];
        id v78 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_4;
        v93[3] = &unk_1E6DF3F68;
        id v94 = v73;
        id v95 = v76;
        id v79 = v76;
        v80 = (UIViewPropertyAnimator *)[v78 initWithDuration:v93 dampingRatio:0.4 animations:1.0];
        commitPropertyAnimator = self->_commitPropertyAnimator;
        self->_commitPropertyAnimator = v80;
      }
      if (v10) {
        [v10 interactionController:self didBeginForIndexPath:v4];
      }

      BOOL v38 = 1;
    }
  }
  else
  {
    BOOL v38 = 0;
  }

  return v38;
}

void __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 presentViewController:*(void *)(*(void *)(a1 + 32) + 24) animated:0 completion:0];
}

uint64_t __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEffect:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 48);
  CGAffineTransformMakeScale(&v4, 1.08, 1.08);
  return [v2 setTransform:&v4];
}

uint64_t __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 80);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 40) setEffect:0];
}

uint64_t __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v8 = *MEMORY[0x1E4F1DAB8];
  long long v6 = v8;
  long long v9 = v7;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v5 = v10;
  [v2 setTransform:&v8];
  [*(id *)(a1 + 40) setAlpha:1.0];
  long long v3 = *(void **)(a1 + 40);
  long long v8 = v6;
  long long v9 = v7;
  long long v10 = v5;
  return [v3 setTransform:&v8];
}

- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  double v8 = a4 * a4;
  if (a4 * a4 != 0.0 && v8 <= 1.0) {
    [(UIViewPropertyAnimator *)self->_previewPropertyAnimator setFractionComplete:v8];
  }
  self->_previewTransitionEnded = v5;
  if (v5)
  {
    [(UICollectionViewCell *)self->_stashedCell setHidden:0];
    [(UIViewPropertyAnimator *)self->_commitPropertyAnimator startAnimation];
    [(UIViewPropertyAnimator *)self->_previewPropertyAnimator pauseAnimation];
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1C58]) initWithDampingRatio:1.0];
    [(UIViewPropertyAnimator *)self->_previewPropertyAnimator continueAnimationWithTimingParameters:v10 durationFactor:0.4];
  }
}

- (void)previewInteractionDidCancel:(id)a3
{
  [(UICollectionViewCell *)self->_stashedCell setHidden:0];
  if (!self->_previewTransitionEnded)
  {
    wrapperViewController = self->_wrapperViewController;
    if (wrapperViewController)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __63__VUIPreviewInteractionController_previewInteractionDidCancel___block_invoke;
      _OWORD v5[3] = &unk_1E6DF3D58;
      v5[4] = self;
      [(VUIPresentationContainerViewController *)wrapperViewController dismissViewControllerAnimated:1 completion:v5];
    }
  }
}

uint64_t __63__VUIPreviewInteractionController_previewInteractionDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupPreviewInteraction];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  dialogPresentationController = self->_dialogPresentationController;
  if (!dialogPresentationController)
  {
    id v8 = a4;
    id v9 = a3;
    long long v10 = [[VUIDialogPresentationController alloc] initWithPresentedViewController:v9 presentingViewController:v8];

    id v11 = self->_dialogPresentationController;
    self->_dialogPresentationController = v10;

    dialogPresentationController = self->_dialogPresentationController;
  }
  return dialogPresentationController;
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  [(VUIPreviewInteractionController *)self transitionDuration:v4];
  double v6 = v5;
  long long v7 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__VUIPreviewInteractionController_animateTransition___block_invoke;
  v12[3] = &unk_1E6DF3D58;
  v12[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__VUIPreviewInteractionController_animateTransition___block_invoke_2;
  v9[3] = &unk_1E6DF4F18;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  [v7 animateWithDuration:0 delay:v12 usingSpringWithDamping:v9 initialSpringVelocity:v6 options:0.0 animations:1.0 completion:0.0];
}

void __53__VUIPreviewInteractionController_animateTransition___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) completedAnimationBlock];

  if (v2)
  {
    long long v3 = [*(id *)(*(void *)(a1 + 32) + 32) completedAnimationBlock];
    v3[2]();
  }
}

uint64_t __53__VUIPreviewInteractionController_animateTransition___block_invoke_2(uint64_t a1, int a2)
{
  long long v3 = *(void **)(a1 + 32);
  if (a2)
  {
    int v4 = [v3 transitionWasCancelled];
    char v5 = v4;
    uint64_t result = [*(id *)(a1 + 32) completeTransition:v4 ^ 1u];
    if ((v5 & 1) == 0)
    {
      long long v7 = *(void **)(a1 + 40);
      return [v7 _cleanupPreviewInteraction];
    }
  }
  else
  {
    return [v3 completeTransition:0];
  }
  return result;
}

- (void)_cleanupPreviewInteraction
{
  long long v3 = [(VUIPreviewInteractionController *)self delegate];
  [v3 interactionController:self didEndForIndexPath:self->_currentIndexPath];

  [(UICollectionViewCell *)self->_stashedCell setHidden:0];
  stashedCell = self->_stashedCell;
  self->_stashedCell = 0;

  [(UIViewPropertyAnimator *)self->_previewPropertyAnimator stopAnimation:1];
  previewPropertyAnimator = self->_previewPropertyAnimator;
  self->_previewPropertyAnimator = 0;

  wrapperViewController = self->_wrapperViewController;
  self->_wrapperViewController = 0;

  dialogPresentationController = self->_dialogPresentationController;
  self->_dialogPresentationController = 0;
}

- (VUIPreviewInteractionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIPreviewInteractionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (NSIndexPath)currentIndexPath
{
  return self->_currentIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentIndexPath, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stashedCell, 0);
  objc_storeStrong((id *)&self->_commitPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_previewPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_dialogPresentationController, 0);
  objc_storeStrong((id *)&self->_wrapperViewController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_previewInteraction, 0);
}

@end