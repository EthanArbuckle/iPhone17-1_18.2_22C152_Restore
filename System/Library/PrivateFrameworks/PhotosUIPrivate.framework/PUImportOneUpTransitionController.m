@interface PUImportOneUpTransitionController
- (BOOL)continuousGestureRecognizerIsActive:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasInstalledDismissGestureRecognizers;
- (PUImportOneUpModalTransition)transition;
- (PUImportOneUpTransitionController)initWithPresentingViewController:(id)a3 pinchGestureRecognizer:(id)a4;
- (PUPhotoPinchGestureRecognizer)dismissPinchGestureRecognizer;
- (PUPhotoPinchGestureRecognizer)presentingPinchGestureRecognizer;
- (UIPanGestureRecognizer)dismissPanGestureRecognizer;
- (UIViewController)presentingViewController;
- (id)interactionControllerForDismissal:(id)a3;
- (id)interactionControllerForPresentation:(id)a3;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (int64_t)operation;
- (void)animationEnded:(BOOL)a3;
- (void)installDismissGestureRecognizersOnView:(id)a3;
- (void)maybeInitiateInteractiveDismiss:(id)a3;
- (void)setDismissPanGestureRecognizer:(id)a3;
- (void)setDismissPinchGestureRecognizer:(id)a3;
- (void)setHasInstalledDismissGestureRecognizers:(BOOL)a3;
- (void)setTransition:(id)a3;
- (void)startInteractiveTransition:(id)a3;
@end

@implementation PUImportOneUpTransitionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_presentingPinchGestureRecognizer, 0);
}

- (void)setTransition:(id)a3
{
}

- (PUImportOneUpModalTransition)transition
{
  return self->_transition;
}

- (int64_t)operation
{
  return self->_operation;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setDismissPanGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (void)setDismissPinchGestureRecognizer:(id)a3
{
}

- (PUPhotoPinchGestureRecognizer)dismissPinchGestureRecognizer
{
  return self->_dismissPinchGestureRecognizer;
}

- (PUPhotoPinchGestureRecognizer)presentingPinchGestureRecognizer
{
  return self->_presentingPinchGestureRecognizer;
}

- (void)setHasInstalledDismissGestureRecognizers:(BOOL)a3
{
  self->_hasInstalledDismissGestureRecognizers = a3;
}

- (BOOL)hasInstalledDismissGestureRecognizers
{
  return self->_hasInstalledDismissGestureRecognizers;
}

- (void)installDismissGestureRecognizersOnView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(PUImportOneUpTransitionController *)self dismissPinchGestureRecognizer];
    [v4 addGestureRecognizer:v5];

    v6 = [(PUImportOneUpTransitionController *)self dismissPanGestureRecognizer];
    [v4 addGestureRecognizer:v6];

    [(PUImportOneUpTransitionController *)self setHasInstalledDismissGestureRecognizers:1];
  }
}

- (BOOL)continuousGestureRecognizerIsActive:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  BOOL v5 = v3 && ([v3 state] == 1 || objc_msgSend(v4, "state") == 2);

  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportOneUpTransitionController *)self dismissPanGestureRecognizer];

  if (v5 != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    v6 = [(PUImportOneUpTransitionController *)self dismissPanGestureRecognizer];
    BOOL v7 = [(PUImportOneUpTransitionController *)self continuousGestureRecognizerIsActive:v6];

    if (!v7) {
      goto LABEL_9;
    }
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  v8 = [(PUImportOneUpTransitionController *)self presentingPinchGestureRecognizer];
  BOOL v9 = [(PUImportOneUpTransitionController *)self continuousGestureRecognizerIsActive:v8];

  if (v9) {
    goto LABEL_7;
  }
  v10 = [(PUImportOneUpTransitionController *)self dismissPinchGestureRecognizer];
  BOOL v11 = [(PUImportOneUpTransitionController *)self continuousGestureRecognizerIsActive:v10];

  if (v11) {
    goto LABEL_7;
  }
  v13 = [(PUImportOneUpTransitionController *)self transition];

  if (v13)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_10;
  }
  v15 = [(PUImportOneUpTransitionController *)self dismissPanGestureRecognizer];
  v16 = [(PUImportOneUpTransitionController *)self dismissPanGestureRecognizer];
  v17 = [v16 view];
  [v15 translationInView:v17];
  double v19 = v18;
  double v21 = v20;

  if (v21 <= 0.0) {
    goto LABEL_7;
  }
  double v22 = -v21;
  if (v21 >= 0.0) {
    double v22 = v21;
  }
  double v23 = -v19;
  if (v19 >= 0.0) {
    double v23 = v19;
  }
  BOOL v12 = v22 > v23;
LABEL_10:

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)maybeInitiateInteractiveDismiss:(id)a3
{
  if ([a3 state] == 1)
  {
    id v4 = [(PUImportOneUpTransitionController *)self transition];

    if (!v4)
    {
      [(PUViewControllerTransition *)self setStartedInteractively:1];
      id v5 = [(PUImportOneUpTransitionController *)self presentingViewController];
      objc_msgSend(v5, "pu_dismissViewControllerAnimated:interactive:completion:", 1, 1, 0);
    }
  }
}

- (void)startInteractiveTransition:(id)a3
{
  id v11 = a3;
  -[PUViewControllerTransition setTransitionContext:](self, "setTransitionContext:");
  if (![(PUImportOneUpTransitionController *)self operation])
  {
    id v4 = [v11 containerView];
    [(PUImportOneUpTransitionController *)self installDismissGestureRecognizersOnView:v4];
  }
  if ([(PUImportOneUpTransitionController *)self operation]) {
    [(PUImportOneUpTransitionController *)self dismissPinchGestureRecognizer];
  }
  else {
  id v5 = [(PUImportOneUpTransitionController *)self presentingPinchGestureRecognizer];
  }
  v6 = [PUImportOneUpModalTransition alloc];
  int64_t v7 = [(PUImportOneUpTransitionController *)self operation];
  v8 = [(PUImportOneUpTransitionController *)self dismissPanGestureRecognizer];
  BOOL v9 = [(PUImportOneUpModalTransition *)v6 initWithOperation:v7 transitionContext:v11 pinchGestureRecognizer:v5 panGestureRecognizer:v8 startsInteractive:[(PUViewControllerTransition *)self startedInteractively]];
  [(PUImportOneUpTransitionController *)self setTransition:v9];

  v10 = [(PUImportOneUpTransitionController *)self transition];
  [v10 startTransition];
}

- (id)interactionControllerForDismissal:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUImportOneUpTransitionController;
  id v4 = [(PUModalTransition *)&v6 interactionControllerForDismissal:a3];
  self->_operation = 1;
  return self;
}

- (id)interactionControllerForPresentation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUImportOneUpTransitionController;
  id v4 = [(PUModalTransition *)&v6 interactionControllerForPresentation:a3];
  self->_operation = 0;
  return self;
}

- (void)animationEnded:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpTransitionController;
  [(PUViewControllerTransition *)&v4 animationEnded:a3];
  [(PUImportOneUpTransitionController *)self setTransition:0];
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id v3 = [(PUImportOneUpTransitionController *)self transition];
  objc_super v4 = [v3 transitionAnimator];

  return v4;
}

- (PUImportOneUpTransitionController)initWithPresentingViewController:(id)a3 pinchGestureRecognizer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUImportOneUpTransitionController;
  BOOL v9 = [(PUViewControllerTransition *)&v16 initWithDuration:1.0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentingViewController, a3);
    objc_storeStrong((id *)&v10->_presentingPinchGestureRecognizer, a4);
    id v11 = [[PUPhotoPinchGestureRecognizer alloc] initWithTarget:v10 action:sel_maybeInitiateInteractiveDismiss_];
    dismissPinchGestureRecognizer = v10->_dismissPinchGestureRecognizer;
    v10->_dismissPinchGestureRecognizer = v11;

    [(PUPhotoPinchGestureRecognizer *)v10->_dismissPinchGestureRecognizer setDelegate:v10];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v10 action:sel_maybeInitiateInteractiveDismiss_];
    dismissPanGestureRecognizer = v10->_dismissPanGestureRecognizer;
    v10->_dismissPanGestureRecognizer = (UIPanGestureRecognizer *)v13;

    [(UIPanGestureRecognizer *)v10->_dismissPanGestureRecognizer setMinimumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v10->_dismissPanGestureRecognizer setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v10->_dismissPanGestureRecognizer setDelegate:v10];
  }

  return v10;
}

@end