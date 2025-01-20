@interface SFToastViewController
- (SFToastViewController)initWithContentViewController:(id)a3;
- (SFToastViewControllerDelegate)delegate;
- (UIViewController)contentViewController;
- (double)toastDuration;
- (unint64_t)dismissalMode;
- (void)_didReceivePan:(id)a3;
- (void)_scheduleToastTimerIfNeeded;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissalMode:(unint64_t)a3;
- (void)setToastDuration:(double)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFToastViewController

- (SFToastViewController)initWithContentViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFToastViewController;
  v6 = [(SFToastViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    v7->_dismissalMode = 0;
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v53[7] = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)SFToastViewController;
  [(SFToastViewController *)&v52 viewDidLoad];
  v3 = [(SFToastViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIViewController *)self->_contentViewController preferredContentSize];
  if (v4 == 0.0) {
    double v5 = 48.0;
  }
  else {
    double v5 = v4;
  }
  v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 300.0, v5);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v6;

  [(UIView *)self->_contentContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v9 = [v8 CGColor];
  objc_super v10 = [(UIView *)self->_contentContainerView layer];
  [v10 setShadowColor:v9];

  v11 = [(UIView *)self->_contentContainerView layer];
  LODWORD(v12) = 1042536202;
  [v11 setShadowOpacity:v12];

  v13 = [(UIView *)self->_contentContainerView layer];
  [v13 setShadowRadius:20.0];

  v14 = [(UIView *)self->_contentContainerView layer];
  objc_msgSend(v14, "setShadowOffset:", 0.0, 5.0);

  [(UIViewController *)self->_contentViewController willMoveToParentViewController:self];
  id v15 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v16 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
  v17 = (UIVisualEffectView *)[v15 initWithEffect:v16];
  backgroundVisualEffectView = self->_backgroundVisualEffectView;
  self->_backgroundVisualEffectView = v17;

  [(UIVisualEffectView *)self->_backgroundVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIVisualEffectView *)self->_backgroundVisualEffectView _setContinuousCornerRadius:v5 * 0.5];
  [(UIView *)self->_contentContainerView addSubview:self->_backgroundVisualEffectView];
  v19 = (void *)MEMORY[0x1E4F28DC8];
  v20 = objc_msgSend(MEMORY[0x1E4F28DC8], "safari_constraintsMatchingFrameOfView:withFrameOfView:", self->_backgroundVisualEffectView, self->_contentContainerView);
  [v19 activateConstraints:v20];

  v51 = [(UIViewController *)self->_contentViewController view];
  [v51 setAutoresizingMask:18];
  [(UIView *)self->_contentContainerView bounds];
  objc_msgSend(v51, "setFrame:");
  [(UIView *)self->_contentContainerView addSubview:v51];
  [(UIViewController *)self->_contentViewController didMoveToParentViewController:self];
  [v3 addSubview:self->_contentContainerView];
  v21 = [(UIView *)self->_contentContainerView widthAnchor];
  v22 = [v21 constraintEqualToConstant:300.0];
  LODWORD(v23) = 1144750080;
  objc_msgSend(v22, "sf_withPriority:", v23);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentPreferredWidthConstraint = self->_contentPreferredWidthConstraint;
  self->_contentPreferredWidthConstraint = v24;

  v26 = [(UIView *)self->_contentContainerView heightAnchor];
  v27 = [v26 constraintEqualToConstant:48.0];
  contentPreferredHeightConstraint = self->_contentPreferredHeightConstraint;
  self->_contentPreferredHeightConstraint = v27;

  v29 = [(UIView *)self->_contentContainerView topAnchor];
  v30 = [v3 topAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  contentTopConstraint = self->_contentTopConstraint;
  self->_contentTopConstraint = v31;

  v46 = (void *)MEMORY[0x1E4F28DC8];
  v33 = self->_contentPreferredHeightConstraint;
  v53[0] = self->_contentPreferredWidthConstraint;
  v53[1] = v33;
  v50 = [(UIView *)self->_contentContainerView widthAnchor];
  v49 = [v50 constraintLessThanOrEqualToConstant:300.0];
  v34 = self->_contentTopConstraint;
  v53[2] = v49;
  v53[3] = v34;
  v48 = [(UIView *)self->_contentContainerView leadingAnchor];
  v35 = v3;
  v47 = [v3 leadingAnchor];
  v36 = [v48 constraintEqualToAnchor:v47];
  v53[4] = v36;
  v37 = [(UIView *)self->_contentContainerView widthAnchor];
  v38 = [v35 widthAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  v53[5] = v39;
  v40 = [(UIView *)self->_contentContainerView heightAnchor];
  v41 = [v35 heightAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  v53[6] = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:7];
  [v46 activateConstraints:v43];

  v44 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__didReceivePan_];
  panRecognizer = self->_panRecognizer;
  self->_panRecognizer = v44;

  [v35 addGestureRecognizer:self->_panRecognizer];
}

- (void)updateViewConstraints
{
  v11.receiver = self;
  v11.super_class = (Class)SFToastViewController;
  [(SFToastViewController *)&v11 updateViewConstraints];
  v3 = [(SFToastViewController *)self view];
  [(UIViewController *)self->_contentViewController preferredContentSize];
  double v6 = v5;
  if (v4 == 0.0) {
    double v4 = 300.0;
  }
  [(NSLayoutConstraint *)self->_contentPreferredWidthConstraint setConstant:v4];
  double v7 = 48.0;
  if (v6 != 0.0) {
    double v7 = v6;
  }
  [(NSLayoutConstraint *)self->_contentPreferredHeightConstraint setConstant:v7];
  double contentOffset = self->_contentOffset;
  [v3 bounds];
  double v9 = -CGRectGetHeight(v12);
  [v3 bounds];
  double Height = CGRectGetHeight(v13);
  [(NSLayoutConstraint *)self->_contentTopConstraint setConstant:SFRubberBandOffsetForOffset(contentOffset, v9, 0.0, Height)];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFToastViewController;
  [(SFToastViewController *)&v3 viewDidLayoutSubviews];
  [(UIView *)self->_contentContainerView bounds];
  [(UIVisualEffectView *)self->_backgroundVisualEffectView _setContinuousCornerRadius:CGRectGetHeight(v4) * 0.5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFToastViewController;
  [(SFToastViewController *)&v5 viewWillAppear:a3];
  self->_double contentOffset = 0.0;
  CGRect v4 = [(SFToastViewController *)self view];
  [v4 setNeedsUpdateConstraints];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFToastViewController;
  [(SFToastViewController *)&v4 viewDidAppear:a3];
  self->_remainingToastDuration = 0.0;
  [(SFToastViewController *)self _scheduleToastTimerIfNeeded];
}

- (void)_scheduleToastTimerIfNeeded
{
  if (self->_dismissalMode != 1 && ![(NSTimer *)self->_dismissalTimer isValid])
  {
    double remainingToastDuration = self->_remainingToastDuration;
    if (remainingToastDuration == 0.0)
    {
      double remainingToastDuration = self->_toastDuration;
      if (remainingToastDuration == 0.0) {
        double remainingToastDuration = 6.0;
      }
    }
    double v4 = fmax(remainingToastDuration, 0.5);
    objc_initWeak(&location, self);
    objc_super v5 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__SFToastViewController__scheduleToastTimerIfNeeded__block_invoke;
    v8[3] = &unk_1E54E9970;
    objc_copyWeak(&v9, &location);
    double v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:v4];
    dismissalTimer = self->_dismissalTimer;
    self->_dismissalTimer = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __52__SFToastViewController__scheduleToastTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 dismissToastViewController:v3];

    id WeakRetained = v3;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFToastViewController;
  [(SFToastViewController *)&v5 viewWillDisappear:a3];
  [(NSTimer *)self->_dismissalTimer invalidate];
  dismissalTimer = self->_dismissalTimer;
  self->_dismissalTimer = 0;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFToastViewController;
  [(SFToastViewController *)&v5 preferredContentSizeDidChangeForChildContentContainer:a3];
  double v4 = [(SFToastViewController *)self view];
  [v4 setNeedsUpdateConstraints];
}

- (void)_didReceivePan:(id)a3
{
  id v4 = a3;
  if ([(NSTimer *)self->_dismissalTimer isValid])
  {
    objc_super v5 = [(NSTimer *)self->_dismissalTimer fireDate];
    [v5 timeIntervalSinceNow];
    self->_double remainingToastDuration = v6;

    [(NSTimer *)self->_dismissalTimer invalidate];
    dismissalTimer = self->_dismissalTimer;
    self->_dismissalTimer = 0;
  }
  id v8 = [(SFToastViewController *)self view];
  [v4 translationInView:v8];
  self->_double contentOffset = v9;
  [v8 setNeedsUpdateConstraints];
  if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4)
  {
    [v4 translationInView:v8];
    double v11 = v10;
    double v13 = v12;
    [v4 velocityInView:v8];
    long double v16 = SFProjectedOffsetForOffsetWithVelocity(v11, v13, v14, v15, *MEMORY[0x1E4FB2EE8], *MEMORY[0x1E4FB2EE8]);
    double v18 = v17;
    objc_msgSend(v8, "bounds", (double)v16);
    double v19 = CGRectGetHeight(v26) * -0.5;
    double v20 = 0.0;
    if (v18 < v19)
    {
      objc_msgSend(v8, "bounds", 0.0);
      double v20 = fmin(v18 + CGRectGetHeight(v27), 0.0);
    }
    self->_double contentOffset = v20;
    v21 = (void *)MEMORY[0x1E4FB1EB0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __40__SFToastViewController__didReceivePan___block_invoke;
    v24[3] = &unk_1E54E9858;
    id v25 = v8;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __40__SFToastViewController__didReceivePan___block_invoke_2;
    v23[3] = &unk_1E54E9998;
    v23[4] = self;
    [v21 animateWithDuration:v24 animations:v23 completion:0.5];
    if (v18 < v19)
    {
      v22 = [(SFToastViewController *)self delegate];
      [v22 dismissToastViewController:self];
    }
  }
}

uint64_t __40__SFToastViewController__didReceivePan___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __40__SFToastViewController__didReceivePan___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleToastTimerIfNeeded];
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (SFToastViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFToastViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)dismissalMode
{
  return self->_dismissalMode;
}

- (void)setDismissalMode:(unint64_t)a3
{
  self->_dismissalMode = a3;
}

- (double)toastDuration
{
  return self->_toastDuration;
}

- (void)setToastDuration:(double)a3
{
  self->_toastDuration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_contentTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentPreferredHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentPreferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);

  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end