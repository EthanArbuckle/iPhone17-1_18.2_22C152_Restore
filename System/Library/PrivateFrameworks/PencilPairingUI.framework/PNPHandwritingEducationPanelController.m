@interface PNPHandwritingEducationPanelController
+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6;
- (BOOL)didAdjustHeightForWidth;
- (BOOL)isAnimating;
- (CGPoint)forcedContentOffset;
- (NSLayoutConstraint)forcedHeightLayoutConstraint;
- (NSTimer)watchdogTimer;
- (PencilHandwritingEducationViewController)educationController;
- (void)buttonPressed:(id)a3;
- (void)cancelWatchdogTimer;
- (void)dealloc;
- (void)educationController:(id)a3 didChangeAnimationState:(BOOL)a4;
- (void)educationControllerRequestedDismissal:(id)a3;
- (void)scheduleWatchdogTimer;
- (void)setDidAdjustHeightForWidth:(BOOL)a3;
- (void)setEducationController:(id)a3;
- (void)setForcedContentOffset:(CGPoint)a3;
- (void)setForcedHeightLayoutConstraint:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setIsAnimating:(BOOL)a3 animated:(BOOL)a4;
- (void)setUpForIsAnimating:(BOOL)a3;
- (void)setWatchdogTimer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PNPHandwritingEducationPanelController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9 = a6;
  v10 = [PNPHandwritingEducationPanelController alloc];
  v11 = +[PencilHandwritingEducationViewController localizedTitle];
  v12 = [(PNPHandwritingEducationPanelController *)v10 initWithTitle:v11 detailText:0 icon:0 contentLayout:3];

  [(PNPWelcomeController *)v12 setControllerType:a3 buttonType:a4 deviceType:a5 delegate:v9];
  return v12;
}

- (void)dealloc
{
  [(NSTimer *)self->_watchdogTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PNPHandwritingEducationPanelController;
  [(PNPHandwritingEducationPanelController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)PNPHandwritingEducationPanelController;
  [(OBBaseWelcomeController *)&v28 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F1C550] systemBlueColor];
  v4 = [(PNPHandwritingEducationPanelController *)self view];
  [v4 setTintColor:v3];

  v5 = [(PNPHandwritingEducationPanelController *)self navigationController];
  v6 = [v5 navigationBar];
  [v6 setTintColor:v3];

  v7 = [[PencilHandwritingEducationViewController alloc] initWithNibName:0 bundle:0];
  [(PNPHandwritingEducationPanelController *)self setEducationController:v7];

  v8 = [(PNPHandwritingEducationPanelController *)self educationController];
  [v8 setDelegate:self];

  id v9 = [(PNPHandwritingEducationPanelController *)self educationController];
  [(PNPHandwritingEducationPanelController *)self addChildViewController:v9];

  v10 = [(PNPHandwritingEducationPanelController *)self educationController];
  v11 = [v10 view];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(PNPHandwritingEducationPanelController *)self contentView];
  [v12 addSubview:v11];
  v13 = [v11 leadingAnchor];
  v14 = [v12 leadingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [v11 topAnchor];
  v17 = [v12 topAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [v11 bottomAnchor];
  v20 = [v12 bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [v11 trailingAnchor];
  v23 = [v12 trailingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = [(PNPHandwritingEducationPanelController *)self educationController];
  [(PNPHandwritingEducationPanelController *)self addChildViewController:v25];

  [(PNPHandwritingEducationPanelController *)self setUpForIsAnimating:[(PNPHandwritingEducationPanelController *)self isAnimating]];
  v26 = [(PNPHandwritingEducationPanelController *)self educationController];
  v27 = [(PNPHandwritingEducationPanelController *)self buttonTray];
  [v26 updateButtonTray:v27];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PNPHandwritingEducationPanelController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(PNPHandwritingEducationPanelController *)self scheduleWatchdogTimer];
  -[PNPHandwritingEducationPanelController setForcedContentOffset:](self, "setForcedContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)viewWillDisappear:(BOOL)a3
{
  [(PNPHandwritingEducationPanelController *)self cancelWatchdogTimer];
  [(PNPHandwritingEducationPanelController *)self setUpForIsAnimating:0];
  [(PNPHandwritingEducationPanelController *)self setDidAdjustHeightForWidth:0];
  objc_super v4 = [(PNPHandwritingEducationPanelController *)self forcedHeightLayoutConstraint];
  [v4 setActive:0];

  [(PNPHandwritingEducationPanelController *)self setForcedHeightLayoutConstraint:0];
}

- (void)viewDidLayoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)PNPHandwritingEducationPanelController;
  [(OBBaseWelcomeController *)&v46 viewDidLayoutSubviews];
  objc_super v3 = [(PNPHandwritingEducationPanelController *)self educationController];
  objc_super v4 = [v3 view];
  v5 = [v4 superview];
  [v5 frame];
  if (v6 <= 0.0)
  {
  }
  else
  {
    BOOL v7 = [(PNPHandwritingEducationPanelController *)self didAdjustHeightForWidth];

    if (!v7)
    {
      [(PNPHandwritingEducationPanelController *)self setDidAdjustHeightForWidth:1];
      v8 = [(PNPHandwritingEducationPanelController *)self educationController];
      id v9 = [v8 view];
      v10 = [(PNPHandwritingEducationPanelController *)self educationController];
      v11 = [v10 view];
      [v11 bounds];
      objc_msgSend(v9, "convertRect:toView:", 0);
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      double v17 = v16;

      v18 = [(PNPHandwritingEducationPanelController *)self educationController];
      [v18 calculateFittingHeightByTemporarilyAdjustingFrameForWidth:v17];
      double v20 = v19;

      v21 = [(PNPHandwritingEducationPanelController *)self educationController];
      v22 = [v21 view];
      v23 = [v22 heightAnchor];
      v24 = [v23 constraintEqualToConstant:v20];
      [(PNPHandwritingEducationPanelController *)self setForcedHeightLayoutConstraint:v24];

      v25 = [(PNPHandwritingEducationPanelController *)self forcedHeightLayoutConstraint];
      [v25 setActive:1];

      v26 = [(PNPHandwritingEducationPanelController *)self buttonTray];
      v27 = [(PNPHandwritingEducationPanelController *)self buttonTray];
      [v27 bounds];
      objc_msgSend(v26, "convertRect:toView:", 0);
      double v29 = v28;

      v47.origin.x = v13;
      v47.origin.y = v15;
      v47.size.width = v17;
      v47.size.height = v20;
      double v30 = CGRectGetMaxY(v47) - v29;
      if (v30 > 0.0)
      {
        v31 = [(PNPHandwritingEducationPanelController *)self headerView];
        v32 = [(PNPHandwritingEducationPanelController *)self headerView];
        [v32 bounds];
        objc_msgSend(v31, "convertRect:toView:", 0);
        double v34 = v33;

        v35 = [(PNPHandwritingEducationPanelController *)self scrollView];
        v36 = [(PNPHandwritingEducationPanelController *)self scrollView];
        [v36 bounds];
        objc_msgSend(v35, "convertRect:toView:", 0);
        double v38 = v37;

        if (v34 - v38 >= v30) {
          double v39 = v30;
        }
        else {
          double v39 = v34 - v38;
        }
        -[PNPHandwritingEducationPanelController setForcedContentOffset:](self, "setForcedContentOffset:", 0.0, v39);
      }
    }
  }
  [(PNPHandwritingEducationPanelController *)self forcedContentOffset];
  if (v40 > 0.0)
  {
    [(PNPHandwritingEducationPanelController *)self forcedContentOffset];
    double v42 = v41;
    double v44 = v43;
    v45 = [(PNPHandwritingEducationPanelController *)self scrollView];
    objc_msgSend(v45, "setContentOffset:", v42, v44);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  -[PNPHandwritingEducationPanelController setForcedContentOffset:](self, "setForcedContentOffset:", a4, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(PNPHandwritingEducationPanelController *)self setDidAdjustHeightForWidth:0];
  v5 = [(PNPHandwritingEducationPanelController *)self forcedHeightLayoutConstraint];
  [v5 setActive:0];

  [(PNPHandwritingEducationPanelController *)self setForcedHeightLayoutConstraint:0];
}

- (void)scheduleWatchdogTimer
{
  [(PNPHandwritingEducationPanelController *)self cancelWatchdogTimer];
  objc_initWeak(&location, self);
  objc_super v3 = (void *)MEMORY[0x263EFFA20];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  BOOL v7 = __63__PNPHandwritingEducationPanelController_scheduleWatchdogTimer__block_invoke;
  v8 = &unk_264DA5718;
  objc_copyWeak(&v9, &location);
  objc_super v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v5 block:5.0];
  -[PNPHandwritingEducationPanelController setWatchdogTimer:](self, "setWatchdogTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__PNPHandwritingEducationPanelController_scheduleWatchdogTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsAnimating:0];
}

- (void)cancelWatchdogTimer
{
  id v2 = [(PNPHandwritingEducationPanelController *)self watchdogTimer];
  [v2 invalidate];
}

- (void)educationController:(id)a3 didChangeAnimationState:(BOOL)a4
{
}

- (void)educationControllerRequestedDismissal:(id)a3
{
  int64_t v4 = [(PNPWelcomeController *)self deviceType];
  uint64_t v5 = [(PNPWelcomeController *)self delegate];
  id v7 = +[PNPWelcomeController controllerWithType:9 buttonType:2 deviceType:v4 delegate:v5];

  uint64_t v6 = [(PNPHandwritingEducationPanelController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (void)setIsAnimating:(BOOL)a3
{
}

- (void)setIsAnimating:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __66__PNPHandwritingEducationPanelController_setIsAnimating_animated___block_invoke;
      v4[3] = &unk_264DA5740;
      v4[4] = self;
      BOOL v5 = a3;
      [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.15];
    }
    else
    {
      -[PNPHandwritingEducationPanelController setUpForIsAnimating:](self, "setUpForIsAnimating:");
    }
  }
}

uint64_t __66__PNPHandwritingEducationPanelController_setIsAnimating_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUpForIsAnimating:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setUpForIsAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    double v5 = 0.4;
  }
  else {
    double v5 = 1.0;
  }
  uint64_t v6 = [(PNPWelcomeController *)self trayButton];
  [v6 setAlpha:v5];

  id v7 = [(PNPHandwritingEducationPanelController *)self navigationController];
  v8 = [v7 navigationBar];
  [v8 setAlpha:v5];

  id v9 = [(PNPHandwritingEducationPanelController *)self educationController];
  v10 = [v9 segmentedControl];
  [v10 setAlpha:v5];

  BOOL v11 = !v3;
  double v12 = [(PNPWelcomeController *)self trayButton];
  [v12 setUserInteractionEnabled:v11];

  CGFloat v13 = [(PNPHandwritingEducationPanelController *)self navigationController];
  double v14 = [v13 navigationBar];
  [v14 setUserInteractionEnabled:v11];

  id v16 = [(PNPHandwritingEducationPanelController *)self educationController];
  CGFloat v15 = [v16 segmentedControl];
  [v15 setUserInteractionEnabled:v11];
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  if (![(PNPHandwritingEducationPanelController *)self isAnimating])
  {
    double v5 = [(PNPHandwritingEducationPanelController *)self educationController];
    [v5 cancelScheduledAnimations];

    v6.receiver = self;
    v6.super_class = (Class)PNPHandwritingEducationPanelController;
    [(PNPWelcomeController *)&v6 buttonPressed:v4];
  }
}

- (PencilHandwritingEducationViewController)educationController
{
  return self->_educationController;
}

- (void)setEducationController:(id)a3
{
}

- (NSTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void)setWatchdogTimer:(id)a3
{
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)didAdjustHeightForWidth
{
  return self->_didAdjustHeightForWidth;
}

- (void)setDidAdjustHeightForWidth:(BOOL)a3
{
  self->_didAdjustHeightForWidth = a3;
}

- (CGPoint)forcedContentOffset
{
  double x = self->_forcedContentOffset.x;
  double y = self->_forcedContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setForcedContentOffset:(CGPoint)a3
{
  self->_forcedContentOffset = a3;
}

- (NSLayoutConstraint)forcedHeightLayoutConstraint
{
  return self->_forcedHeightLayoutConstraint;
}

- (void)setForcedHeightLayoutConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcedHeightLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_educationController, 0);
}

@end