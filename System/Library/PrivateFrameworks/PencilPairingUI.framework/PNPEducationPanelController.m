@interface PNPEducationPanelController
+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6;
- (BOOL)didAdjustHeightForWidth;
- (BOOL)isAnimating;
- (CGPoint)forcedContentOffset;
- (NSLayoutConstraint)forcedHeightLayoutConstraint;
- (NSTimer)watchdogTimer;
- (PencilEducationViewController)educationController;
- (void)buttonPressed:(id)a3;
- (void)cancelWatchdogTimer;
- (void)dealloc;
- (void)educationController:(id)a3 didChangeAnimationState:(BOOL)a4;
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

@implementation PNPEducationPanelController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v10 = a6;
  v11 = [a1 bundleImageNamed:@"welcome_scribble"];
  v12 = [PNPEducationPanelController alloc];
  v13 = +[PencilEducationViewController localizedTitle];
  v14 = [(PNPEducationPanelController *)v12 initWithTitle:v13 detailText:0 icon:v11];

  [(PNPWelcomeController *)v14 setControllerType:a3 buttonType:a4 deviceType:a5 delegate:v10];
  return v14;
}

- (void)dealloc
{
  [(NSTimer *)self->_watchdogTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PNPEducationPanelController;
  [(PNPEducationPanelController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)PNPEducationPanelController;
  [(OBBaseWelcomeController *)&v22 viewDidLoad];
  objc_super v3 = [[PencilEducationViewController alloc] initWithNibName:0 bundle:0];
  [(PNPEducationPanelController *)self setEducationController:v3];

  v4 = [(PNPEducationPanelController *)self educationController];
  [v4 setDelegate:self];

  v5 = [(PNPEducationPanelController *)self educationController];
  [(PNPEducationPanelController *)self addChildViewController:v5];

  v6 = [(PNPEducationPanelController *)self educationController];
  v7 = [v6 view];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(PNPEducationPanelController *)self contentView];
  [v8 addSubview:v7];
  v9 = [v7 leadingAnchor];
  id v10 = [v8 leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [v7 topAnchor];
  v13 = [v8 topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [v7 bottomAnchor];
  v16 = [v8 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [v7 trailingAnchor];
  v19 = [v8 trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  v21 = [(PNPEducationPanelController *)self educationController];
  [(PNPEducationPanelController *)self addChildViewController:v21];

  [(PNPEducationPanelController *)self setUpForIsAnimating:[(PNPEducationPanelController *)self isAnimating]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PNPEducationPanelController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(PNPEducationPanelController *)self scheduleWatchdogTimer];
  -[PNPEducationPanelController setForcedContentOffset:](self, "setForcedContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)viewWillDisappear:(BOOL)a3
{
  [(PNPEducationPanelController *)self cancelWatchdogTimer];
  [(PNPEducationPanelController *)self setUpForIsAnimating:0];
  [(PNPEducationPanelController *)self setDidAdjustHeightForWidth:0];
  objc_super v4 = [(PNPEducationPanelController *)self forcedHeightLayoutConstraint];
  [v4 setActive:0];

  [(PNPEducationPanelController *)self setForcedHeightLayoutConstraint:0];
  [(PNPEducationPanelController *)self set_shouldInlineButtontray:0];
}

- (void)viewDidLayoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)PNPEducationPanelController;
  [(OBBaseWelcomeController *)&v46 viewDidLayoutSubviews];
  objc_super v3 = [(PNPEducationPanelController *)self educationController];
  objc_super v4 = [v3 view];
  v5 = [v4 superview];
  [v5 frame];
  if (v6 <= 0.0)
  {
  }
  else
  {
    BOOL v7 = [(PNPEducationPanelController *)self didAdjustHeightForWidth];

    if (!v7)
    {
      [(PNPEducationPanelController *)self set_shouldInlineButtontray:0];
      [(PNPEducationPanelController *)self setDidAdjustHeightForWidth:1];
      v8 = [(PNPEducationPanelController *)self educationController];
      v9 = [v8 view];
      id v10 = [(PNPEducationPanelController *)self educationController];
      v11 = [v10 view];
      [v11 bounds];
      objc_msgSend(v9, "convertRect:toView:", 0);
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      double v17 = v16;

      v18 = [(PNPEducationPanelController *)self educationController];
      [v18 calculateFittingHeightByTemporarilyAdjustingFrameForWidth:v17];
      double v20 = v19;

      v21 = [(PNPEducationPanelController *)self educationController];
      objc_super v22 = [v21 view];
      v23 = [v22 heightAnchor];
      v24 = [v23 constraintEqualToConstant:v20];
      [(PNPEducationPanelController *)self setForcedHeightLayoutConstraint:v24];

      v25 = [(PNPEducationPanelController *)self forcedHeightLayoutConstraint];
      [v25 setActive:1];

      v26 = [(PNPEducationPanelController *)self buttonTray];
      v27 = [(PNPEducationPanelController *)self buttonTray];
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
        [(PNPEducationPanelController *)self set_shouldInlineButtontray:1];
        v31 = [(PNPEducationPanelController *)self headerView];
        v32 = [(PNPEducationPanelController *)self headerView];
        [v32 bounds];
        objc_msgSend(v31, "convertRect:toView:", 0);
        double v34 = v33;

        v35 = [(PNPEducationPanelController *)self scrollView];
        v36 = [(PNPEducationPanelController *)self scrollView];
        [v36 bounds];
        objc_msgSend(v35, "convertRect:toView:", 0);
        double v38 = v37;

        if (v34 - v38 >= v30) {
          double v39 = v30;
        }
        else {
          double v39 = v34 - v38;
        }
        -[PNPEducationPanelController setForcedContentOffset:](self, "setForcedContentOffset:", 0.0, v39);
      }
    }
  }
  [(PNPEducationPanelController *)self forcedContentOffset];
  if (v40 > 0.0)
  {
    [(PNPEducationPanelController *)self forcedContentOffset];
    double v42 = v41;
    double v44 = v43;
    v45 = [(PNPEducationPanelController *)self scrollView];
    objc_msgSend(v45, "setContentOffset:", v42, v44);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  -[PNPEducationPanelController setForcedContentOffset:](self, "setForcedContentOffset:", a4, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(PNPEducationPanelController *)self setDidAdjustHeightForWidth:0];
  v5 = [(PNPEducationPanelController *)self forcedHeightLayoutConstraint];
  [v5 setActive:0];

  [(PNPEducationPanelController *)self setForcedHeightLayoutConstraint:0];
  [(PNPEducationPanelController *)self set_shouldInlineButtontray:0];
}

- (void)scheduleWatchdogTimer
{
  [(PNPEducationPanelController *)self cancelWatchdogTimer];
  objc_initWeak(&location, self);
  objc_super v3 = (void *)MEMORY[0x263EFFA20];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  BOOL v7 = __52__PNPEducationPanelController_scheduleWatchdogTimer__block_invoke;
  v8 = &unk_264DA5718;
  objc_copyWeak(&v9, &location);
  objc_super v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v5 block:5.0];
  -[PNPEducationPanelController setWatchdogTimer:](self, "setWatchdogTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__PNPEducationPanelController_scheduleWatchdogTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsAnimating:0];
}

- (void)cancelWatchdogTimer
{
  id v2 = [(PNPEducationPanelController *)self watchdogTimer];
  [v2 invalidate];
}

- (void)educationController:(id)a3 didChangeAnimationState:(BOOL)a4
{
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
      v4[2] = __55__PNPEducationPanelController_setIsAnimating_animated___block_invoke;
      v4[3] = &unk_264DA5740;
      v4[4] = self;
      BOOL v5 = a3;
      [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.15];
    }
    else
    {
      -[PNPEducationPanelController setUpForIsAnimating:](self, "setUpForIsAnimating:");
    }
  }
}

uint64_t __55__PNPEducationPanelController_setIsAnimating_animated___block_invoke(uint64_t a1)
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

  BOOL v7 = [(PNPEducationPanelController *)self navigationController];
  v8 = [v7 navigationBar];
  [v8 setAlpha:v5];

  id v9 = [(PNPEducationPanelController *)self educationController];
  id v10 = [v9 segmentedControl];
  [v10 setAlpha:v5];

  BOOL v11 = !v3;
  double v12 = [(PNPWelcomeController *)self trayButton];
  [v12 setUserInteractionEnabled:v11];

  CGFloat v13 = [(PNPEducationPanelController *)self navigationController];
  double v14 = [v13 navigationBar];
  [v14 setUserInteractionEnabled:v11];

  id v16 = [(PNPEducationPanelController *)self educationController];
  CGFloat v15 = [v16 segmentedControl];
  [v15 setUserInteractionEnabled:v11];
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  if (![(PNPEducationPanelController *)self isAnimating])
  {
    double v5 = [(PNPEducationPanelController *)self educationController];
    [v5 cancelScheduledAnimations];

    v6.receiver = self;
    v6.super_class = (Class)PNPEducationPanelController;
    [(PNPWelcomeController *)&v6 buttonPressed:v4];
  }
}

- (PencilEducationViewController)educationController
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