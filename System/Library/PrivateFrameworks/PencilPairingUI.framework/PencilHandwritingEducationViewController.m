@interface PencilHandwritingEducationViewController
+ (id)localizedTitle;
- (BOOL)_canShowWhileLocked;
- (BOOL)didDisappear;
- (BOOL)didRunInitialAppearActions;
- (BOOL)isAnimating;
- (BOOL)setupComplete;
- (BOOL)shouldBeginAnimationForElementController:(id)a3;
- (NSDate)appearDate;
- (NSMutableArray)viewControllers;
- (PencilHandwritingEducationElementViewController)displayedController;
- (PencilHandwritingEducationViewControllerDelegate)delegate;
- (UISegmentedControl)segmentedControl;
- (UIView)containerView;
- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3;
- (id)traitCollection;
- (void)_configureViewControllersIfNecessary;
- (void)addControllerToContainer:(id)a3;
- (void)dealloc;
- (void)doneButtonPressed:(id)a3;
- (void)elementControllerShouldDismiss:(id)a3;
- (void)setAppearDate:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDisappear:(BOOL)a3;
- (void)setDidRunInitialAppearActions:(BOOL)a3;
- (void)setDisplayedController:(id)a3;
- (void)setSetupComplete:(BOOL)a3;
- (void)setViewControllers:(id)a3;
- (void)updateButtonTray:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PencilHandwritingEducationViewController

+ (id)localizedTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:a1];
  v3 = [v2 localizedStringForKey:@"HANDWRITING_EDUCATION_PANEL_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];

  return v3;
}

- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [(PencilHandwritingEducationViewController *)self viewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) calculateFittingHeightByTemporarilyAdjustingFrameForWidth:a3];
        if (v9 < v11) {
          double v9 = v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  v12 = [(PencilHandwritingEducationViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  v15 = [(PencilHandwritingEducationViewController *)self containerView];
  [v15 bounds];
  double v17 = v16;

  return v9 + v14 - v17;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PencilHandwritingEducationViewController;
  [(PencilHandwritingEducationViewController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PencilHandwritingEducationViewController;
  [(PencilHandwritingEducationViewController *)&v6 viewDidAppear:a3];
  if (![(PencilHandwritingEducationViewController *)self didRunInitialAppearActions]
    || [(PencilHandwritingEducationViewController *)self didDisappear])
  {
    objc_super v4 = [MEMORY[0x263EFF910] date];
    [(PencilHandwritingEducationViewController *)self setAppearDate:v4];

    [(PencilHandwritingEducationViewController *)self setDidRunInitialAppearActions:1];
    [(PencilHandwritingEducationViewController *)self setDidDisappear:0];
    v5 = [(PencilHandwritingEducationViewController *)self displayedController];
    [(PencilHandwritingEducationViewController *)self beginAnimationIfNecessaryForElementController:v5 delay:0.5];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PencilHandwritingEducationViewController;
  [(PencilHandwritingEducationViewController *)&v10 viewDidDisappear:a3];
  objc_super v4 = [(PencilHandwritingEducationViewController *)self appearDate];

  if (v4)
  {
    v5 = [MEMORY[0x263EFF910] date];
    objc_super v6 = [(PencilHandwritingEducationViewController *)self appearDate];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    double v9 = +[PencilSettingsStatisticsManager sharedInstance];
    [v9 recordEducationPencilDidShow:v8];
  }
  [(PencilHandwritingEducationViewController *)self setDidDisappear:1];
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)PencilHandwritingEducationViewController;
  [(PencilHandwritingEducationViewController *)&v22 viewDidLoad];
  [(PencilHandwritingEducationViewController *)self _configureViewControllersIfNecessary];
  v3 = [(PencilHandwritingEducationViewController *)self view];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v7 = [v6 widthAnchor];
  double v8 = [v7 constraintEqualToConstant:448.0];
  [v5 addObject:v8];

  double v9 = [v6 centerXAnchor];
  objc_super v10 = [v3 centerXAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10];
  [v5 addObject:v11];

  v12 = [v6 topAnchor];
  double v13 = [v3 safeAreaLayoutGuide];
  double v14 = [v13 topAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v5 addObject:v15];

  double v16 = [v6 bottomAnchor];
  double v17 = [v3 safeAreaLayoutGuide];
  v18 = [v17 bottomAnchor];
  long long v19 = [v16 constraintEqualToAnchor:v18];
  [v5 addObject:v19];

  [v3 addSubview:v6];
  [MEMORY[0x263F08938] activateConstraints:v5];
  [(PencilHandwritingEducationViewController *)self setContainerView:v6];
  long long v20 = [(PencilHandwritingEducationViewController *)self viewControllers];
  long long v21 = [v20 objectAtIndexedSubscript:0];
  [(PencilHandwritingEducationViewController *)self setDisplayedController:v21];

  [(PencilHandwritingEducationViewController *)self setSetupComplete:1];
}

- (id)traitCollection
{
  v10[2] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)PencilHandwritingEducationViewController;
  v2 = [(PencilHandwritingEducationViewController *)&v9 traitCollection];
  v3 = [v2 preferredContentSizeCategory];
  if (([v3 isEqualToString:*MEMORY[0x263F1D148]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F1D140]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F1D138]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x263F1D130]])
  {
    objc_super v4 = (void *)MEMORY[0x263F1CB00];
    v10[0] = v2;
    id v5 = [MEMORY[0x263F1CB00] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F1D168]];
    v10[1] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    uint64_t v7 = [v4 traitCollectionWithTraitsFromCollections:v6];

    v2 = (void *)v7;
  }

  return v2;
}

- (void)doneButtonPressed:(id)a3
{
}

- (void)setDisplayedController:(id)a3
{
  id v5 = (PencilHandwritingEducationElementViewController *)a3;
  displayedController = self->_displayedController;
  if (displayedController != v5)
  {
    if (displayedController)
    {
      uint64_t v7 = displayedController;
      objc_storeStrong((id *)&self->_displayedController, a3);
      double v8 = [(PencilHandwritingEducationElementViewController *)v5 view];
      [v8 setAlpha:0.0];

      objc_super v9 = [(PencilHandwritingEducationViewController *)self displayedController];
      objc_super v10 = [(PencilHandwritingEducationViewController *)self delegate];
      double v11 = [v10 educationControllerButtonTray:self];
      [v9 updateButtonTray:v11];

      [(PencilHandwritingEducationViewController *)self addControllerToContainer:v5];
      v12 = (void *)MEMORY[0x263F1CB60];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __67__PencilHandwritingEducationViewController_setDisplayedController___block_invoke;
      v19[3] = &unk_264DA5830;
      long long v20 = v7;
      long long v21 = v5;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __67__PencilHandwritingEducationViewController_setDisplayedController___block_invoke_2;
      v16[3] = &unk_264DA5858;
      double v17 = v20;
      v18 = self;
      double v13 = v20;
      [v12 animateWithDuration:v19 animations:v16 completion:0.25];
    }
    else
    {
      objc_storeStrong((id *)&self->_displayedController, a3);
      [(PencilHandwritingEducationViewController *)self addControllerToContainer:self->_displayedController];
      double v14 = [(PencilHandwritingEducationViewController *)self displayedController];
      [(PencilHandwritingEducationViewController *)self beginAnimationIfNecessaryForElementController:v14 delay:0.5];

      v15 = [(PencilHandwritingEducationViewController *)self delegate];
      [v15 educationControllerDidChangePanel:self];
    }
  }
}

void __67__PencilHandwritingEducationViewController_setDisplayedController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 40) view];
  [v3 setAlpha:1.0];
}

void __67__PencilHandwritingEducationViewController_setDisplayedController___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 40) removeChildViewController:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  objc_super v4 = [v3 displayedController];
  [v3 beginAnimationIfNecessaryForElementController:v4 delay:0.5];

  id v5 = [*(id *)(a1 + 40) delegate];
  [v5 educationControllerDidChangePanel:*(void *)(a1 + 40)];
}

- (void)addControllerToContainer:(id)a3
{
  id v4 = a3;
  [(PencilHandwritingEducationViewController *)self addChildViewController:v4];
  id v18 = [v4 view];

  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(PencilHandwritingEducationViewController *)self containerView];
  [v5 addSubview:v18];
  id v6 = [v5 leadingAnchor];
  uint64_t v7 = [v18 leadingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  objc_super v9 = [v5 trailingAnchor];
  objc_super v10 = [v18 trailingAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [v5 topAnchor];
  double v13 = [v18 topAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [v5 bottomAnchor];
  double v16 = [v18 bottomAnchor];
  double v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];
}

- (void)updateButtonTray:(id)a3
{
  id v4 = a3;
  id v5 = [(PencilHandwritingEducationViewController *)self displayedController];
  [v5 updateButtonTray:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isAnimating
{
  v2 = [(PencilHandwritingEducationViewController *)self displayedController];
  char v3 = [v2 animationInProgress];

  return v3;
}

- (void)_configureViewControllersIfNecessary
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v3 = [(PencilHandwritingEducationViewController *)self viewControllers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(PencilHandwritingEducationViewController *)self setViewControllers:v5];

    id v6 = [MEMORY[0x263F14BF0] sharedSettings];
    uint64_t v7 = [v6 recognitionLocaleIdentifier];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [&unk_26ECE79C0 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(&unk_26ECE79C0);
          }
          v12 = +[PencilHandwritingEducationElementData elementDataForType:languageID:](PencilHandwritingEducationElementData, "elementDataForType:languageID:", [*(id *)(*((void *)&v15 + 1) + 8 * v11) integerValue], v7);
          double v13 = [[PencilHandwritingEducationElementViewController alloc] initWithElementData:v12];
          [(PencilHandwritingEducationElementViewController *)v13 setDelegate:self];
          double v14 = [(PencilHandwritingEducationViewController *)self viewControllers];
          [v14 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [&unk_26ECE79C0 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)shouldBeginAnimationForElementController:(id)a3
{
  return 0;
}

- (void)elementControllerShouldDismiss:(id)a3
{
  id v4 = [(PencilHandwritingEducationViewController *)self delegate];
  [v4 educationControllerRequestedDismissal:self];
}

- (PencilHandwritingEducationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PencilHandwritingEducationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (PencilHandwritingEducationElementViewController)displayedController
{
  return self->_displayedController;
}

- (NSMutableArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (BOOL)setupComplete
{
  return self->_setupComplete;
}

- (void)setSetupComplete:(BOOL)a3
{
  self->_setupComplete = a3;
}

- (NSDate)appearDate
{
  return self->_appearDate;
}

- (void)setAppearDate:(id)a3
{
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (void)setDidDisappear:(BOOL)a3
{
  self->_didDisappear = a3;
}

- (BOOL)didRunInitialAppearActions
{
  return self->_didRunInitialAppearActions;
}

- (void)setDidRunInitialAppearActions:(BOOL)a3
{
  self->_didRunInitialAppearActions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearDate, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_displayedController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end