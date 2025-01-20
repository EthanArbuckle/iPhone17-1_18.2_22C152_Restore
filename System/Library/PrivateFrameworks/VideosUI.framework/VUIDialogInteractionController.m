@interface VUIDialogInteractionController
- (BOOL)interactionController:(id)a3 shouldInteractionControllerBeginForIndexPath:(id)a4;
- (BOOL)isPresenting;
- (NSIndexPath)currentIndexPath;
- (UIViewController)presentedViewController;
- (UIViewController)presentingViewController;
- (VUIDialogInteractionController)initWithPresentingViewController:(id)a3 collectionView:(id)a4 controllerToPresent:(id)a5;
- (VUIDialogInteractionControllerDelegate)delegate;
- (VUIPreviewInteractionController)interactionController;
- (double)transitionDuration:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_cleanup;
- (void)animateTransition:(id)a3;
- (void)dismissConfirmation;
- (void)interactionController:(id)a3 didBeginForIndexPath:(id)a4;
- (void)longPressGestureRecognizerPressed:(id)a3;
- (void)presentViewController:(id)a3;
- (void)setCurrentIndexPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInteractionController:(id)a3;
- (void)setIsPresenting:(BOOL)a3;
@end

@implementation VUIDialogInteractionController

- (VUIDialogInteractionController)initWithPresentingViewController:(id)a3 collectionView:(id)a4 controllerToPresent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)VUIDialogInteractionController;
  v12 = [(VUIDialogInteractionController *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collectionView, a4);
    objc_storeStrong((id *)&v13->_presentingViewController, a3);
    objc_storeStrong((id *)&v13->_presentedViewController, a5);
    v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v15 = [v14 traitCollection];
    uint64_t v16 = [v15 forceTouchCapability];

    if (v16 == 2)
    {
      v17 = [[VUIPreviewInteractionController alloc] initWithPresentingViewController:v13->_presentingViewController collectionView:v13->_collectionView controllerToPresent:v13->_presentedViewController];
      interactionController = v13->_interactionController;
      v13->_interactionController = v17;

      [(VUIPreviewInteractionController *)v13->_interactionController setDelegate:v13];
    }
    else
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v13 action:sel_longPressGestureRecognizerPressed_];
      longPressGestureRecognizer = v13->_longPressGestureRecognizer;
      v13->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v19;

      [(UILongPressGestureRecognizer *)v13->_longPressGestureRecognizer setDelegate:v13];
      [(UILongPressGestureRecognizer *)v13->_longPressGestureRecognizer setDelaysTouchesBegan:1];
      [(UICollectionView *)v13->_collectionView addGestureRecognizer:v13->_longPressGestureRecognizer];
    }
  }

  return v13;
}

- (void)dismissConfirmation
{
  if (self->_wrapperViewController)
  {
    v3 = (void *)MEMORY[0x1E4FB1EC0];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __53__VUIDialogInteractionController_dismissConfirmation__block_invoke;
    v14 = &unk_1E6DF3D58;
    v15 = self;
    v4 = &v11;
LABEL_3:
    objc_msgSend(v3, "_performWithoutDeferringTransitions:", v4, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
    return;
  }
  interactionController = self->_interactionController;
  if (interactionController)
  {
    [(VUIPreviewInteractionController *)interactionController dismissConfirmation];
    [(VUIDialogInteractionController *)self _cleanup];
  }
  else if (self->_presentingViewController)
  {
    v3 = (void *)MEMORY[0x1E4FB1EC0];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_3;
    id v9 = &unk_1E6DF3D58;
    id v10 = self;
    v4 = &v6;
    goto LABEL_3;
  }
}

uint64_t __53__VUIDialogInteractionController_dismissConfirmation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_2;
  v4[3] = &unk_1E6DF3D58;
  v4[4] = v1;
  return [v2 dismissViewControllerAnimated:0 completion:v4];
}

uint64_t __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanup];
}

uint64_t __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_4;
  v4[3] = &unk_1E6DF3D58;
  v4[4] = v1;
  return [v2 dismissViewControllerAnimated:0 completion:v4];
}

uint64_t __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanup];
}

- (void)longPressGestureRecognizerPressed:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 1 && !self->_isPresenting)
  {
    [v5 locationInView:self->_collectionView];
    v4 = -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
    if (v4) {
      [(VUIDialogInteractionController *)self performSelector:sel_presentViewController_ withObject:v4 afterDelay:0.2];
    }
  }
}

- (void)presentViewController:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained dialogInteractionController:self shouldBeginInteractionForIndexPath:v5])
  {
    objc_storeStrong((id *)&self->_currentIndexPath, a3);
    self->_isPresenting = 1;
    uint64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v8 = [v7 traitCollection];
    if ([v8 userInterfaceIdiom])
    {
      id v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
      id v10 = [v9 traitCollection];
      if ([v10 userInterfaceIdiom] == 1)
      {
        uint64_t v11 = [(UIViewController *)self->_presentingViewController traitCollection];
        if ([v11 horizontalSizeClass] == 1)
        {
          uint64_t v12 = [(UIViewController *)self->_presentingViewController traitCollection];
          uint64_t v13 = [v12 verticalSizeClass];

          if (v13 != 2) {
            goto LABEL_14;
          }
LABEL_8:
          v14 = objc_alloc_init(VUIPresentationContainerViewController);
          wrapperViewController = self->_wrapperViewController;
          self->_wrapperViewController = v14;

          [(VUIPresentationContainerViewController *)self->_wrapperViewController setModalPresentationStyle:4];
          [(VUIPresentationContainerViewController *)self->_wrapperViewController setTransitioningDelegate:self];
          uint64_t v16 = [(VUIPresentationContainerViewController *)self->_wrapperViewController view];
          v17 = [(UIViewController *)self->_presentedViewController view];
          [v16 addSubview:v17];

          [(VUIPresentationContainerViewController *)self->_wrapperViewController addChildViewController:self->_presentedViewController];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __56__VUIDialogInteractionController_presentViewController___block_invoke;
          v42[3] = &unk_1E6DF3D58;
          v42[4] = self;
          [MEMORY[0x1E4FB1EC0] _performWithoutDeferringTransitions:v42];
          v18 = [(VUIPresentationContainerViewController *)self->_wrapperViewController presentationController];
          uint64_t v19 = [v18 containerView];
          [v19 bounds];
          double Width = CGRectGetWidth(v43);
          [v19 safeAreaInsets];
          double v22 = Width - v21;
          [v19 safeAreaInsets];
          double v24 = v22 - v23 + -33.0;
          [v19 bounds];
          CGFloat x = v44.origin.x;
          CGFloat y = v44.origin.y;
          double v27 = v44.size.width;
          double height = v44.size.height;
          double v29 = CGRectGetWidth(v44) + -33.0;
          v45.origin.CGFloat x = x;
          v45.origin.CGFloat y = y;
          v45.size.width = v27;
          v45.size.double height = height;
          double v30 = CGRectGetHeight(v45) + -33.0;
          if (v29 >= v24) {
            double v31 = v24;
          }
          else {
            double v31 = v29;
          }
          double v32 = fmin(v30, 56.0);
          objc_msgSend(v18, "setModalSize:", v31, v32);
          -[UIViewController setPreferredContentSize:](self->_presentedViewController, "setPreferredContentSize:", v31, v32);
          v33 = [v18 presentedView];
          objc_msgSend(v33, "setFrame:", (v27 - v31) * 0.5, (height - v32) * 0.5, v31, v32);
          v34 = [v18 backdropView];
          v35 = +[VUIConfirmationBlurEffect effectWithStyle:1];
          [v34 setEffect:v35];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __56__VUIDialogInteractionController_presentViewController___block_invoke_2;
          v39[3] = &unk_1E6DF3F68;
          id v40 = v33;
          id v41 = v34;
          id v36 = v34;
          id v37 = v33;
          [v18 setCompletedAnimationBlock:v39];

          goto LABEL_15;
        }
      }
LABEL_14:
      [(UIViewController *)self->_presentedViewController setModalPresentationStyle:7];
      [(UIViewController *)self->_presentingViewController presentViewController:self->_presentedViewController animated:1 completion:0];
      v18 = [(UIViewController *)self->_presentedViewController popoverPresentationController];
      uint64_t v19 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v5];
      [v18 setSourceView:v19];
      [v19 bounds];
      objc_msgSend(v18, "setSourceRect:");
      v38 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
      [v18 setBackgroundColor:v38];

      [v18 setPermittedArrowDirections:15];
LABEL_15:

      [WeakRetained dialogInteractionController:self interactionDidBeginForIndexPath:v5];
      goto LABEL_16;
    }

    goto LABEL_8;
  }
LABEL_16:
}

void __56__VUIDialogInteractionController_presentViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 presentViewController:*(void *)(*(void *)(a1 + 32) + 24) animated:0 completion:0];
}

uint64_t __56__VUIDialogInteractionController_presentViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setEffect:0];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  dialogPresentationController = self->_dialogPresentationController;
  if (!dialogPresentationController)
  {
    id v8 = a4;
    id v9 = a3;
    id v10 = [[VUIDialogPresentationController alloc] initWithPresentedViewController:v9 presentingViewController:v8];

    uint64_t v11 = self->_dialogPresentationController;
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
  [(VUIDialogInteractionController *)self transitionDuration:v4];
  double v6 = v5;
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__VUIDialogInteractionController_animateTransition___block_invoke;
  v12[3] = &unk_1E6DF3D58;
  v12[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__VUIDialogInteractionController_animateTransition___block_invoke_2;
  v9[3] = &unk_1E6DF4F18;
  id v10 = v4;
  uint64_t v11 = self;
  id v8 = v4;
  [v7 animateWithDuration:0 delay:v12 usingSpringWithDamping:v9 initialSpringVelocity:v6 options:0.0 animations:1.0 completion:0.0];
}

void __52__VUIDialogInteractionController_animateTransition___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) completedAnimationBlock];

  if (v2)
  {
    v3 = [*(id *)(*(void *)(a1 + 32) + 32) completedAnimationBlock];
    v3[2]();
  }
}

uint64_t __52__VUIDialogInteractionController_animateTransition___block_invoke_2(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    int v4 = [v3 transitionWasCancelled];
    char v5 = v4;
    uint64_t result = [*(id *)(a1 + 32) completeTransition:v4 ^ 1u];
    if ((v5 & 1) == 0)
    {
      uint64_t v7 = *(void **)(a1 + 40);
      return [v7 _cleanup];
    }
  }
  else
  {
    return [v3 completeTransition:0];
  }
  return result;
}

- (BOOL)interactionController:(id)a3 shouldInteractionControllerBeginForIndexPath:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v8 = [WeakRetained dialogInteractionController:self shouldBeginInteractionForIndexPath:v6];

  if (v8) {
    objc_storeStrong((id *)&self->_currentIndexPath, a4);
  }

  return v8;
}

- (void)interactionController:(id)a3 didBeginForIndexPath:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained dialogInteractionController:self interactionDidBeginForIndexPath:v6];
}

- (void)_cleanup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dialogInteractionController:self interactionDidEndForIndexPath:self->_currentIndexPath];

  wrapperViewController = self->_wrapperViewController;
  self->_wrapperViewController = 0;

  dialogPresentationController = self->_dialogPresentationController;
  self->_dialogPresentationController = 0;

  self->_isPresenting = 0;
}

- (VUIDialogInteractionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIDialogInteractionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSIndexPath)currentIndexPath
{
  return self->_currentIndexPath;
}

- (void)setCurrentIndexPath:(id)a3
{
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (VUIPreviewInteractionController)interactionController
{
  return self->_interactionController;
}

- (void)setInteractionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionController, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_currentIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dialogPresentationController, 0);
  objc_storeStrong((id *)&self->_wrapperViewController, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end