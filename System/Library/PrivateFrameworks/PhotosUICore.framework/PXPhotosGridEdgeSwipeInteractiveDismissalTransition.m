@interface PXPhotosGridEdgeSwipeInteractiveDismissalTransition
- (BOOL)_shouldCompleteTransition;
- (PXPhotosGridEdgeSwipeInteractiveDismissalDelegate)delegate;
- (PXPhotosGridEdgeSwipeInteractiveDismissalTransition)initWithEdgeSwipeGesture:(id)a3 viewController:(id)a4;
- (UIScreenEdgePanGestureRecognizer)edgeSwipeGesture;
- (UIViewController)viewController;
- (void)_handleEdgeSwipeGesture:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startInteractiveTransition:(id)a3;
@end

@implementation PXPhotosGridEdgeSwipeInteractiveDismissalTransition

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_edgeSwipeGesture, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosGridEdgeSwipeInteractiveDismissalDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosGridEdgeSwipeInteractiveDismissalDelegate *)WeakRetained;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UIScreenEdgePanGestureRecognizer)edgeSwipeGesture
{
  return self->_edgeSwipeGesture;
}

- (BOOL)_shouldCompleteTransition
{
  v3 = [(PXPhotosGridEdgeSwipeInteractiveDismissalTransition *)self edgeSwipeGesture];
  v4 = [v3 view];
  [v3 velocityInView:v4];
  double v6 = v5;

  if (self->isRTL) {
    BOOL v7 = v6 < 0.0;
  }
  else {
    BOOL v7 = v6 > 0.0;
  }
  BOOL v8 = fabs(v6) > 1000.0 && v7;
  [(UIPercentDrivenInteractiveTransition *)self percentComplete];
  BOOL v10 = v9 > 0.33 || v8;

  return v10;
}

- (void)_handleEdgeSwipeGesture:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  [v5 bounds];

  double v6 = [v4 view];
  [v4 translationInView:v6];

  uint64_t v7 = [v4 state];
  switch(v7)
  {
    case 1:
      [(UIPercentDrivenInteractiveTransition *)self setWantsInteractiveStart:1];
      id v9 = [(PXPhotosGridEdgeSwipeInteractiveDismissalTransition *)self viewController];
      BOOL v8 = [v9 presentingViewController];
      [v8 dismissViewControllerAnimated:1 completion:0];

      return;
    case 2:
      PXClamp();
    case 3:
      [(UIPercentDrivenInteractiveTransition *)self setWantsInteractiveStart:0];
      if (![(PXPhotosGridEdgeSwipeInteractiveDismissalTransition *)self _shouldCompleteTransition])goto LABEL_2; {
      [(UIPercentDrivenInteractiveTransition *)self finishInteractiveTransition];
      }
      break;
    case 4:
    case 5:
LABEL_2:
      [(UIPercentDrivenInteractiveTransition *)self cancelInteractiveTransition];
      break;
    default:
      return;
  }
}

- (void)startInteractiveTransition:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXPhotosGridEdgeSwipeInteractiveDismissalTransition;
  id v4 = a3;
  [(UIPercentDrivenInteractiveTransition *)&v6 startInteractiveTransition:v4];
  double v5 = [(PXPhotosGridEdgeSwipeInteractiveDismissalTransition *)self delegate];
  [v5 runTransitionAnimation:v4];
}

- (PXPhotosGridEdgeSwipeInteractiveDismissalTransition)initWithEdgeSwipeGesture:(id)a3 viewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosGridEdgeSwipeInteractiveDismissalTransition;
  id v9 = [(UIPercentDrivenInteractiveTransition *)&v13 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_edgeSwipeGesture, a3);
    [v7 addTarget:v10 action:sel__handleEdgeSwipeGesture_];
    objc_storeStrong((id *)&v10->_viewController, a4);
    [(UIPercentDrivenInteractiveTransition *)v10 setWantsInteractiveStart:0];
    v11 = [v7 view];
    v10->isRTL = [v11 effectiveUserInterfaceLayoutDirection] == 1;
  }
  return v10;
}

@end