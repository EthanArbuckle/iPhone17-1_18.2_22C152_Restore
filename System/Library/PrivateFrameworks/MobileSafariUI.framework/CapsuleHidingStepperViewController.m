@interface CapsuleHidingStepperViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CapsuleNavigationBarViewController)capsuleViewController;
- (void)_didReceivePan:(id)a3;
- (void)_didReceiveTap:(id)a3;
- (void)setCapsuleViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CapsuleHidingStepperViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CapsuleHidingStepperViewController;
  [(StepperViewController *)&v7 viewDidLoad];
  v3 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__didReceivePan_];
  panRecognizer = self->_panRecognizer;
  self->_panRecognizer = v3;

  [(UIPanGestureRecognizer *)self->_panRecognizer setDelegate:self];
  v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__didReceiveTap_];
  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v5;

  [(UITapGestureRecognizer *)self->_tapRecognizer setDelegate:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CapsuleHidingStepperViewController;
  -[CapsuleHidingStepperViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleViewController);
  [WeakRetained beginHidingCapsuleAnimated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CapsuleHidingStepperViewController;
  [(CapsuleHidingStepperViewController *)&v6 viewDidAppear:a3];
  v4 = [(CapsuleHidingStepperViewController *)self view];
  v5 = [v4 window];

  [v5 addGestureRecognizer:self->_panRecognizer];
  [v5 addGestureRecognizer:self->_tapRecognizer];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CapsuleHidingStepperViewController;
  -[CapsuleHidingStepperViewController viewWillDisappear:](&v8, sel_viewWillDisappear_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleViewController);
  [WeakRetained endHidingCapsuleAnimated:v3];

  objc_super v6 = [(UIPanGestureRecognizer *)self->_panRecognizer view];
  [v6 removeGestureRecognizer:self->_panRecognizer];

  objc_super v7 = [(UITapGestureRecognizer *)self->_tapRecognizer view];
  [v7 removeGestureRecognizer:self->_tapRecognizer];
}

- (void)_didReceiveTap:(id)a3
{
}

- (void)_didReceivePan:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
LABEL_2:
    [(CapsuleHidingStepperViewController *)self dismissViewControllerAnimated:1 completion:0];
    goto LABEL_3;
  }
  if (v4 == 2)
  {
    v5 = [(CapsuleHidingStepperViewController *)self view];
    [v9 translationInView:v5];
    double v7 = v6;

    if (v7 < 0.0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleViewController);
      [WeakRetained transitionToState:1 animated:0 completionHandler:0];
    }
    goto LABEL_2;
  }
LABEL_3:
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_tapRecognizer == a3)
  {
    id v6 = a4;
    double v7 = [(CapsuleHidingStepperViewController *)self view];
    [v6 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    int v4 = objc_msgSend(v7, "pointInside:withEvent:", 0, v9, v11) ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (CapsuleNavigationBarViewController)capsuleViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleViewController);
  return (CapsuleNavigationBarViewController *)WeakRetained;
}

- (void)setCapsuleViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_capsuleViewController);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
}

@end