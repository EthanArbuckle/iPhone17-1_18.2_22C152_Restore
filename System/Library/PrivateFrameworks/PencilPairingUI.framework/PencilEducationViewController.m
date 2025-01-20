@interface PencilEducationViewController
+ (id)localizedTitle;
- (BOOL)_canShowWhileLocked;
- (BOOL)didDisappear;
- (BOOL)didRunInitialAppearActions;
- (BOOL)isAnimating;
- (BOOL)setupComplete;
- (BOOL)shouldBeginAnimationForElementController:(id)a3;
- (NSDate)appearDate;
- (NSMutableArray)viewControllers;
- (PencilEducationElementViewController)displayedController;
- (PencilEducationViewControllerDelegate)delegate;
- (UISegmentedControl)segmentedControl;
- (UIView)containerView;
- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3;
- (id)traitCollection;
- (unint64_t)animationBeginRequestIndex;
- (unint64_t)pendingTransitionIndex;
- (void)_configureViewControllersIfNecessary;
- (void)addControllerToContainer:(id)a3;
- (void)beginAnimationIfNecessaryForElementController:(id)a3 delay:(double)a4;
- (void)cancelScheduledAnimations;
- (void)dealloc;
- (void)doneButtonPressed:(id)a3;
- (void)elementControllerDidAppear:(id)a3;
- (void)elementControllerWillReplay:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)segmentedControlDidChange:(id)a3;
- (void)setAnimationBeginRequestIndex:(unint64_t)a3;
- (void)setAppearDate:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDisappear:(BOOL)a3;
- (void)setDidRunInitialAppearActions:(BOOL)a3;
- (void)setDisplayedController:(id)a3;
- (void)setPendingTransitionIndex:(unint64_t)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSetupComplete:(BOOL)a3;
- (void)setViewControllers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PencilEducationViewController

+ (id)localizedTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:a1];
  v3 = [v2 localizedStringForKey:@"EDUCATION_PANEL_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];

  return v3;
}

- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [(PencilEducationViewController *)self viewControllers];
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

  v12 = [(PencilEducationViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  v15 = [(PencilEducationViewController *)self containerView];
  [v15 bounds];
  double v17 = v16;

  return v9 + v14 - v17;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(PencilEducationViewController *)self removeObserver:self forKeyPath:@"displayedController.animationInProgress"];
  v4.receiver = self;
  v4.super_class = (Class)PencilEducationViewController;
  [(PencilEducationViewController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PencilEducationViewController;
  [(PencilEducationViewController *)&v7 viewDidAppear:a3];
  if (![(PencilEducationViewController *)self didRunInitialAppearActions]
    || [(PencilEducationViewController *)self didDisappear])
  {
    objc_super v4 = [MEMORY[0x263EFF910] date];
    [(PencilEducationViewController *)self setAppearDate:v4];

    [(PencilEducationViewController *)self setDidRunInitialAppearActions:1];
    [(PencilEducationViewController *)self setDidDisappear:0];
    v5 = [(PencilEducationViewController *)self displayedController];
    [(PencilEducationViewController *)self beginAnimationIfNecessaryForElementController:v5 delay:0.5];
  }
  uint64_t v6 = [MEMORY[0x263F14BF0] sharedSettings];
  [v6 setForceUserTextInputSettingEnabled:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PencilEducationViewController;
  [(PencilEducationViewController *)&v11 viewDidDisappear:a3];
  objc_super v4 = [(PencilEducationViewController *)self appearDate];

  if (v4)
  {
    v5 = [MEMORY[0x263EFF910] date];
    uint64_t v6 = [(PencilEducationViewController *)self appearDate];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    double v9 = +[PencilSettingsStatisticsManager sharedInstance];
    [v9 recordEducationPencilDidShow:v8];
  }
  [(PencilEducationViewController *)self setDidDisappear:1];
  v10 = [MEMORY[0x263F14BF0] sharedSettings];
  [v10 setForceUserTextInputSettingEnabled:0];
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)PencilEducationViewController;
  [(PencilEducationViewController *)&v38 viewDidLoad];
  [(PencilEducationViewController *)self _configureViewControllersIfNecessary];
  v3 = [(PencilEducationViewController *)self view];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = objc_alloc_init(MEMORY[0x263F1C968]);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = [v4 localizedStringForKey:@"HANDWRITE_SEGMENT_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  [v5 addSegmentWithTitle:v6];

  double v7 = [v4 localizedStringForKey:@"DELETE_SEGMENT_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  [v5 addSegmentWithTitle:v7];

  double v8 = [v4 localizedStringForKey:@"SELECT_SEGMENT_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  [v5 addSegmentWithTitle:v8];

  double v9 = [v4 localizedStringForKey:@"INSERT_SEGMENT_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  [v5 addSegmentWithTitle:v9];

  v10 = [v4 localizedStringForKey:@"JOIN_SEGMENT_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  [v5 addSegmentWithTitle:v10];

  [v5 setApportionsSegmentWidthsByContent:1];
  [v5 _setAutosizeText:1];
  [v5 selectSegment:0];
  [v5 addTarget:self action:sel_segmentedControlDidChange_ forControlEvents:4096];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = [v5 centerXAnchor];
  double v13 = [v3 centerXAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  [v11 addObject:v14];

  v15 = [v5 topAnchor];
  double v16 = [v3 safeAreaLayoutGuide];
  double v17 = [v16 topAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:0.0];
  [v11 addObject:v18];

  long long v19 = [v5 widthAnchor];
  long long v20 = [v19 constraintEqualToConstant:448.0];
  [v11 addObject:v20];

  id v21 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v22 = [v21 widthAnchor];
  v23 = [v22 constraintEqualToConstant:448.0];
  [v11 addObject:v23];

  uint64_t v24 = [v21 centerXAnchor];
  v25 = [v3 centerXAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v11 addObject:v26];

  v27 = [v21 topAnchor];
  v28 = [v5 bottomAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v11 addObject:v29];

  v30 = [v21 bottomAnchor];
  v31 = [v3 safeAreaLayoutGuide];
  v32 = [v31 bottomAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v11 addObject:v33];

  [v3 addSubview:v21];
  [v3 addSubview:v5];
  [MEMORY[0x263F08938] activateConstraints:v11];
  [(PencilEducationViewController *)self setContainerView:v21];
  [(PencilEducationViewController *)self setSegmentedControl:v5];
  v34 = [(PencilEducationViewController *)self segmentedControl];
  [v34 setSelectedSegment:0];

  v35 = [(PencilEducationViewController *)self segmentedControl];
  [(PencilEducationViewController *)self segmentedControlDidChange:v35];

  id v36 = objc_alloc_init(MEMORY[0x263F14BA0]);
  [v36 setDelegate:self];
  v37 = [(PencilEducationViewController *)self view];
  [v37 addInteraction:v36];

  [(PencilEducationViewController *)self addObserver:self forKeyPath:@"displayedController.animationInProgress" options:0 context:0];
  [(PencilEducationViewController *)self setSetupComplete:1];
}

- (id)traitCollection
{
  v10[2] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)PencilEducationViewController;
  v2 = [(PencilEducationViewController *)&v9 traitCollection];
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
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    uint64_t v7 = [v4 traitCollectionWithTraitsFromCollections:v6];

    v2 = (void *)v7;
  }

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"displayedController.animationInProgress", a4, a5, a6))
  {
    id v7 = [(PencilEducationViewController *)self delegate];
    objc_msgSend(v7, "educationController:didChangeAnimationState:", self, -[PencilEducationViewController isAnimating](self, "isAnimating"));
  }
}

- (void)segmentedControlDidChange:(id)a3
{
  uint64_t v4 = [a3 selectedSegment];
  id v5 = [(PencilEducationViewController *)self viewControllers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:v4];
  [(PencilEducationViewController *)self setDisplayedController:v6];

  if ([(PencilEducationViewController *)self setupComplete])
  {
    id v7 = +[PencilSettingsStatisticsManager sharedInstance];
    [v7 recordEducationPanelChanged:v4];
  }
}

- (void)doneButtonPressed:(id)a3
{
}

- (void)setDisplayedController:(id)a3
{
  id v5 = (PencilEducationElementViewController *)a3;
  displayedController = self->_displayedController;
  if (displayedController != v5)
  {
    if (displayedController)
    {
      id v7 = displayedController;
      objc_storeStrong((id *)&self->_displayedController, a3);
      double v8 = [(PencilEducationElementViewController *)v5 view];
      [v8 setAlpha:0.0];

      [(PencilEducationViewController *)self addControllerToContainer:v5];
      objc_super v9 = (void *)MEMORY[0x263F1CB60];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __56__PencilEducationViewController_setDisplayedController___block_invoke;
      v16[3] = &unk_264DA5830;
      double v17 = v7;
      v18 = v5;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __56__PencilEducationViewController_setDisplayedController___block_invoke_2;
      v13[3] = &unk_264DA5858;
      double v14 = v17;
      v15 = self;
      v10 = v17;
      [v9 animateWithDuration:v16 animations:v13 completion:0.25];
    }
    else
    {
      objc_storeStrong((id *)&self->_displayedController, a3);
      [(PencilEducationViewController *)self addControllerToContainer:self->_displayedController];
      id v11 = [(PencilEducationViewController *)self displayedController];
      [(PencilEducationViewController *)self beginAnimationIfNecessaryForElementController:v11 delay:0.5];

      v12 = [(PencilEducationViewController *)self delegate];
      [v12 educationControllerDidChangePanel:self];
    }
  }
}

void __56__PencilEducationViewController_setDisplayedController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 40) view];
  [v3 setAlpha:1.0];
}

void __56__PencilEducationViewController_setDisplayedController___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 40) removeChildViewController:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 displayedController];
  [v3 beginAnimationIfNecessaryForElementController:v4 delay:0.5];

  id v5 = [*(id *)(a1 + 40) delegate];
  [v5 educationControllerDidChangePanel:*(void *)(a1 + 40)];
}

- (void)addControllerToContainer:(id)a3
{
  id v4 = a3;
  [(PencilEducationViewController *)self addChildViewController:v4];
  id v18 = [v4 view];

  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(PencilEducationViewController *)self containerView];
  [v5 addSubview:v18];
  uint64_t v6 = [v5 leadingAnchor];
  id v7 = [v18 leadingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  objc_super v9 = [v5 trailingAnchor];
  v10 = [v18 trailingAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
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

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isAnimating
{
  v2 = [(PencilEducationViewController *)self displayedController];
  char v3 = [v2 animationInProgress];

  return v3;
}

- (void)_configureViewControllersIfNecessary
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v3 = [(PencilEducationViewController *)self viewControllers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(PencilEducationViewController *)self setViewControllers:v5];

    uint64_t v6 = [MEMORY[0x263F14BF0] sharedSettings];
    id v7 = [v6 recognitionLocaleIdentifier];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [&unk_26ECE7A98 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
            objc_enumerationMutation(&unk_26ECE7A98);
          }
          v12 = +[PencilEducationElementData elementDataForType:languageID:](PencilEducationElementData, "elementDataForType:languageID:", [*(id *)(*((void *)&v15 + 1) + 8 * v11) integerValue], v7);
          double v13 = [[PencilEducationElementViewController alloc] initWithElementData:v12];
          [(PencilEducationElementViewController *)v13 setDelegate:self];
          double v14 = [(PencilEducationViewController *)self viewControllers];
          [v14 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [&unk_26ECE7A98 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)beginAnimationIfNecessaryForElementController:(id)a3 delay:(double)a4
{
  id v6 = a3;
  id v7 = (void *)([(PencilEducationViewController *)self animationBeginRequestIndex] + 1);
  [(PencilEducationViewController *)self setAnimationBeginRequestIndex:v7];
  objc_initWeak(&location, self);
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__PencilEducationViewController_beginAnimationIfNecessaryForElementController_delay___block_invoke;
  void v10[3] = &unk_264DA5940;
  objc_copyWeak(v12, &location);
  v12[1] = v7;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v8, MEMORY[0x263EF83A0], v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __85__PencilEducationViewController_beginAnimationIfNecessaryForElementController_delay___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained animationBeginRequestIndex];
  uint64_t v5 = *(void *)(a1 + 48);

  if (v4 == v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    int v7 = [v6 shouldBeginAnimationForElementController:*(void *)(a1 + 32)];

    if (v7)
    {
      dispatch_time_t v8 = *(void **)(a1 + 32);
      [v8 beginAnimation];
    }
  }
}

- (BOOL)shouldBeginAnimationForElementController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PencilEducationViewController *)self view];
  id v6 = [v5 window];
  if (v6
    && ![(PencilEducationViewController *)self isAnimating]
    && [v4 hasRemainingAnimation])
  {
    int v7 = [v4 _appearState];

    if (v7 != 2)
    {
      BOOL v16 = 0;
      goto LABEL_8;
    }
    uint64_t v5 = [(PencilEducationViewController *)self view];
    [v5 bounds];
    objc_msgSend(v5, "convertRect:toView:", 0);
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    id v6 = [v5 window];
    [v6 bounds];
    v19.origin.x = v9;
    v19.origin.y = v11;
    v19.size.width = v13;
    v19.size.height = v15;
    BOOL v16 = CGRectContainsRect(v18, v19);
  }
  else
  {
    BOOL v16 = 0;
  }

LABEL_8:
  return v16;
}

- (void)cancelScheduledAnimations
{
  id v2 = [(PencilEducationViewController *)self displayedController];
  [v2 cancelScheduledAnimations];
}

- (void)elementControllerWillReplay:(id)a3
{
  id v4 = [(PencilEducationViewController *)self delegate];
  [v4 educationControllerWillReplay:self];
}

- (void)elementControllerDidAppear:(id)a3
{
  id v4 = [(PencilEducationViewController *)self displayedController];
  [(PencilEducationViewController *)self beginAnimationIfNecessaryForElementController:v4 delay:0.5];
}

- (PencilEducationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PencilEducationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (PencilEducationElementViewController)displayedController
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

- (unint64_t)pendingTransitionIndex
{
  return self->_pendingTransitionIndex;
}

- (void)setPendingTransitionIndex:(unint64_t)a3
{
  self->_pendingTransitionIndex = a3;
}

- (unint64_t)animationBeginRequestIndex
{
  return self->_animationBeginRequestIndex;
}

- (void)setAnimationBeginRequestIndex:(unint64_t)a3
{
  self->_animationBeginRequestIndex = a3;
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