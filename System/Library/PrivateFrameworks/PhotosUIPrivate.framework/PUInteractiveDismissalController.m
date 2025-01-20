@interface PUInteractiveDismissalController
- (BOOL)_needsUpdateGestureRecognizers;
- (BOOL)canBeginDismissalAtLocationFromProvider:(id)a3;
- (BOOL)isHandlingDismissalInteraction;
- (PUInteractiveDismissalControllerDelegate)delegate;
- (PUInterruptibleViewControllerTransition)_interruptibleViewControllerTransition;
- (PUTileController)designatedTileController;
- (PUTilingView)tilingView;
- (PUTilingViewControllerTransition)tilingViewControllerTransition;
- (UIView)_viewHostingGestureRecognizers;
- (UIViewController)_viewController;
- (double)dismissalInteractionProgress;
- (int64_t)_preferredDismissalTransitionType;
- (void)_invalidateGestureRecognizers;
- (void)_invalidateInterruptibleViewControllerTransition;
- (void)_invalidateViewController;
- (void)_invalidateViewHostingGestureRecognizers;
- (void)_setInterruptibleViewControllerTransition:(id)a3;
- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3;
- (void)_setViewController:(id)a3;
- (void)_setViewHostingGestureRecognizers:(id)a3;
- (void)_updateGestureRecognizersIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateInterruptibleViewControllerTransitionIfNeeded;
- (void)_updateViewControllerIfNeeded;
- (void)_updateViewHostingGestureRecognizersIfNeeded;
- (void)beginDismissal;
- (void)endDismissal:(BOOL)a3;
- (void)invalidateDelegateData;
- (void)setDelegate:(id)a3;
- (void)setDismissalInteractionProgress:(double)a3;
- (void)setIsHandlingDismissalInteraction:(BOOL)a3;
- (void)updateDismissalWithInteractionProgress:(double)a3 interactionWillFinish:(BOOL)a4;
- (void)viewControllerWillAppear;
@end

@implementation PUInteractiveDismissalController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__interruptibleViewControllerTransition, 0);
  objc_storeStrong((id *)&self->__viewHostingGestureRecognizers, 0);
  objc_destroyWeak((id *)&self->__viewController);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3
{
  self->__needsUpdateGestureRecognizers = a3;
}

- (BOOL)_needsUpdateGestureRecognizers
{
  return self->__needsUpdateGestureRecognizers;
}

- (void)_setInterruptibleViewControllerTransition:(id)a3
{
}

- (PUInterruptibleViewControllerTransition)_interruptibleViewControllerTransition
{
  return self->__interruptibleViewControllerTransition;
}

- (void)_setViewHostingGestureRecognizers:(id)a3
{
}

- (UIView)_viewHostingGestureRecognizers
{
  return self->__viewHostingGestureRecognizers;
}

- (void)_setViewController:(id)a3
{
}

- (UIViewController)_viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__viewController);
  return (UIViewController *)WeakRetained;
}

- (double)dismissalInteractionProgress
{
  return self->_dismissalInteractionProgress;
}

- (BOOL)isHandlingDismissalInteraction
{
  return self->_isHandlingDismissalInteraction;
}

- (PUInteractiveDismissalControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUInteractiveDismissalControllerDelegate *)WeakRetained;
}

- (void)_updateInterruptibleViewControllerTransitionIfNeeded
{
  v3 = [(PUInteractiveDismissalController *)self _interruptibleViewControllerTransition];

  if (!v3)
  {
    id v7 = [(PUInteractiveDismissalController *)self _viewController];
    v4 = objc_msgSend(v7, "pu_navigationTransition");
    if (!v4)
    {
      v4 = objc_msgSend(v7, "pu_modalTransition");
      if (!v4)
      {
        v5 = [v7 navigationController];
        v4 = objc_msgSend(v5, "pu_modalTransition");
      }
    }
    if ([v4 conformsToProtocol:&unk_1F08AD6E8]) {
      v6 = v4;
    }
    else {
      v6 = 0;
    }
    [(PUInteractiveDismissalController *)self _setInterruptibleViewControllerTransition:v6];
  }
}

- (void)_invalidateInterruptibleViewControllerTransition
{
}

- (void)_updateGestureRecognizersIfNeeded
{
  if ([(PUInteractiveDismissalController *)self _needsUpdateGestureRecognizers])
  {
    [(PUInteractiveDismissalController *)self _setNeedsUpdateGestureRecognizers:0];
    id v3 = [(PUInteractiveDismissalController *)self _viewHostingGestureRecognizers];
    [(PUInteractiveDismissalController *)self updateGestureRecognizersWithHostingView:v3];
  }
}

- (void)_invalidateGestureRecognizers
{
}

- (void)_updateViewHostingGestureRecognizersIfNeeded
{
  id v3 = [(PUInteractiveDismissalController *)self _viewHostingGestureRecognizers];

  if (!v3)
  {
    v4 = [(PUInteractiveDismissalController *)self delegate];
    id v5 = [v4 interactiveDismissalControllerViewHostingGestureRecognizers:self];

    [(PUInteractiveDismissalController *)self _setViewHostingGestureRecognizers:v5];
  }
}

- (void)_invalidateViewHostingGestureRecognizers
{
  [(PUInteractiveDismissalController *)self _setViewHostingGestureRecognizers:0];
  [(PUInteractiveDismissalController *)self _invalidateGestureRecognizers];
}

- (void)_updateViewControllerIfNeeded
{
  id v3 = [(PUInteractiveDismissalController *)self _viewController];

  if (!v3)
  {
    v4 = [(PUInteractiveDismissalController *)self delegate];
    id v5 = [v4 interactiveDismissalControllerViewController:self];

    [(PUInteractiveDismissalController *)self _setViewController:v5];
  }
}

- (void)_invalidateViewController
{
  [(PUInteractiveDismissalController *)self _setViewController:0];
  [(PUInteractiveDismissalController *)self _invalidateInterruptibleViewControllerTransition];
}

- (void)setDismissalInteractionProgress:(double)a3
{
  if (self->_dismissalInteractionProgress != a3)
  {
    self->_dismissalInteractionProgress = a3;
    id v4 = [(PUInteractiveDismissalController *)self delegate];
    [v4 interactiveDismissalControllerChangedDismissalInteractionProgress:self];
  }
}

- (void)setIsHandlingDismissalInteraction:(BOOL)a3
{
  if (self->_isHandlingDismissalInteraction != a3)
  {
    self->_isHandlingDismissalInteraction = a3;
    id v4 = [(PUInteractiveDismissalController *)self delegate];
    [v4 interactiveDismissalControllerChangedIsHandlingDismissalInteraction:self];
  }
}

- (void)endDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUInteractiveDismissalController *)self setIsHandlingDismissalInteraction:0];
  v6 = [(PUInteractiveDismissalController *)self _interruptibleViewControllerTransition];
  id v8 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUInteractiveDismissalController.m", 195, @"Invalid parameter not satisfying: %@", @"interruptibleViewControllerTransition != nil" object file lineNumber description];

    v6 = 0;
  }
  [v6 resumeTransition:v3];
  [(PUInteractiveDismissalController *)self setDismissalInteractionProgress:(double)v3];
  [(PUInteractiveDismissalController *)self _invalidateGestureRecognizers];
  [(PUInteractiveDismissalController *)self _updateIfNeeded];
}

- (void)updateDismissalWithInteractionProgress:(double)a3 interactionWillFinish:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = +[PUTilingViewSettings sharedInstance];
  uint64_t v9 = [v8 transitionProgressBehavior];

  if (v9 == 2)
  {
    double v10 = 1.0;
  }
  else
  {
    double v10 = a3;
    if (v9 == 1)
    {
      if (v4) {
        double v10 = 1.0;
      }
      else {
        double v10 = 0.0;
      }
    }
  }
  [(PUInteractiveDismissalController *)self setDismissalInteractionProgress:v10];
  v11 = [(PUInteractiveDismissalController *)self _interruptibleViewControllerTransition];
  id v13 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUInteractiveDismissalController.m", 188, @"Invalid parameter not satisfying: %@", @"interruptibleViewControllerTransition != nil" object file lineNumber description];

    v11 = 0;
  }
  [v11 updatePausedTransitionWithProgress:v10 interactionProgress:a3];
}

- (void)beginDismissal
{
  [(PUInteractiveDismissalController *)self setIsHandlingDismissalInteraction:1];
  int64_t v4 = [(PUInteractiveDismissalController *)self _preferredDismissalTransitionType];
  id v5 = [(PUInteractiveDismissalController *)self _viewController];
  id v14 = v5;
  if (v4 == 2)
  {
    v6 = [v5 presentingViewController];
    if (!v6)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PUInteractiveDismissalController.m", 143, @"Invalid parameter not satisfying: %@", @"presentingViewController" object file lineNumber description];
    }
    objc_msgSend(v6, "pu_dismissViewControllerAnimated:interactive:completion:", 1, 1, 0);
  }
  else if (v4 == 1)
  {
    v6 = [v5 navigationController];
    if (!v6)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PUInteractiveDismissalController.m", 136, @"Invalid parameter not satisfying: %@", @"navigationController != nil" object file lineNumber description];
    }
    objc_msgSend(v6, "pu_popViewControllerAnimated:interactive:", 1, 1);
  }
  else
  {
    if (v4) {
      goto LABEL_12;
    }
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUInteractiveDismissalController.m" lineNumber:130 description:@"undefined transition type"];
  }

LABEL_12:
  id v7 = [(PUInteractiveDismissalController *)self _interruptibleViewControllerTransition];
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUInteractiveDismissalController.m", 150, @"Invalid parameter not satisfying: %@", @"interruptibleViewControllerTransition != nil" object file lineNumber description];
  }
  if ([v7 conformsToProtocol:&unk_1F08AD778])
  {
    id v8 = v7;
    uint64_t v9 = +[PUTilingViewSettings sharedInstance];
    uint64_t v10 = [v9 transitionProgressBehavior];

    [v8 pauseTransitionWithOptions:(unint64_t)(v10 - 1) < 2];
  }
  else
  {
    [v7 pauseTransition];
  }
}

- (int64_t)_preferredDismissalTransitionType
{
  v2 = [(PUInteractiveDismissalController *)self _viewController];
  BOOL v3 = [v2 navigationController];
  int64_t v4 = [v3 topViewController];
  uint64_t v5 = objc_msgSend(v3, "pu_currentNavigationTransition");
  v6 = (void *)v5;
  BOOL v7 = 0;
  if (v3 && v2 == v4 && !v5)
  {
    id v8 = [v3 viewControllers];
    BOOL v7 = (unint64_t)[v8 count] > 1;
  }
  uint64_t v9 = [v2 presentingViewController];
  if (v7) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = 2 * (v9 != 0);
  }

  return v10;
}

- (BOOL)canBeginDismissalAtLocationFromProvider:(id)a3
{
  id v4 = a3;
  if ([(PUInteractiveDismissalController *)self _preferredDismissalTransitionType]
    && ([(PUInteractiveDismissalController *)self _interruptibleViewControllerTransition], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = [(PUInteractiveDismissalController *)self delegate];
    char v7 = [v6 interactiveDismissalController:self canBeginDismissalAtLocationFromProvider:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (PUTilingViewControllerTransition)tilingViewControllerTransition
{
  v2 = [(PUInteractiveDismissalController *)self _interruptibleViewControllerTransition];
  if (([v2 conformsToProtocol:&unk_1F08AD778] & 1) == 0)
  {

    v2 = 0;
  }
  return (PUTilingViewControllerTransition *)v2;
}

- (PUTileController)designatedTileController
{
  BOOL v3 = [(PUInteractiveDismissalController *)self delegate];
  id v4 = [v3 interactiveDismissalControllerDesignatedTileController:self];

  return (PUTileController *)v4;
}

- (PUTilingView)tilingView
{
  BOOL v3 = [(PUInteractiveDismissalController *)self delegate];
  id v4 = [v3 interactiveDismissalControllerTilingView:self];

  return (PUTilingView *)v4;
}

- (void)_updateIfNeeded
{
  [(PUInteractiveDismissalController *)self _updateViewControllerIfNeeded];
  [(PUInteractiveDismissalController *)self _updateViewHostingGestureRecognizersIfNeeded];
  [(PUInteractiveDismissalController *)self _updateGestureRecognizersIfNeeded];
  [(PUInteractiveDismissalController *)self _updateInterruptibleViewControllerTransitionIfNeeded];
}

- (void)invalidateDelegateData
{
  [(PUInteractiveDismissalController *)self _invalidateViewController];
  [(PUInteractiveDismissalController *)self _invalidateViewHostingGestureRecognizers];
  [(PUInteractiveDismissalController *)self _updateIfNeeded];
}

- (void)viewControllerWillAppear
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(PUInteractiveDismissalController *)self _invalidateViewController];
    [(PUInteractiveDismissalController *)self _invalidateViewHostingGestureRecognizers];
    uint64_t v5 = obj;
  }
}

@end