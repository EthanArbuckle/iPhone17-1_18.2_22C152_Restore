@interface SBFluidSwitcherModifierTimelineViewController
- (BOOL)ignoreNoisyEvents;
- (void)_reset:(id)a3;
- (void)_toggleNoiseLevel:(id)a3;
- (void)_togglePause:(id)a3;
- (void)addEntry:(id)a3;
- (void)didSelectEntryView:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SBFluidSwitcherModifierTimelineViewController

- (void)loadView
{
  id v27 = objc_alloc_init(MEMORY[0x1E4FA6028]);
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  entryViews = self->_entryViews;
  self->_entryViews = v3;

  id v5 = objc_alloc(MEMORY[0x1E4FA6020]);
  v6 = (SBFTouchPassThroughScrollView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  scrollView = self->_scrollView;
  self->_scrollView = v6;

  [(SBFTouchPassThroughScrollView *)self->_scrollView setScrollEnabled:1];
  [(SBFTouchPassThroughScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [v27 addSubview:self->_scrollView];
  [v27 setClipsToBounds:0];
  [(SBFTouchPassThroughScrollView *)self->_scrollView setClipsToBounds:0];
  v8 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  clearButton = self->_clearButton;
  self->_clearButton = v8;

  [(UIButton *)self->_clearButton setTitle:@"Clear" forState:0];
  [(UIButton *)self->_clearButton addTarget:self action:sel__reset_ forControlEvents:64];
  v10 = [(UIButton *)self->_clearButton titleLabel];
  double v11 = *MEMORY[0x1E4F43908];
  v12 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0 weight:*MEMORY[0x1E4F43908]];
  [v10 setFont:v12];

  [(UIButton *)self->_clearButton sizeToFit];
  [v27 addSubview:self->_clearButton];
  self->_ignoreNoisyEvents = 1;
  v13 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  noiseLevelButton = self->_noiseLevelButton;
  self->_noiseLevelButton = v13;

  [(UIButton *)self->_noiseLevelButton setTitle:@"Show All Events" forState:0];
  [(UIButton *)self->_noiseLevelButton addTarget:self action:sel__toggleNoiseLevel_ forControlEvents:64];
  v15 = [(UIButton *)self->_noiseLevelButton titleLabel];
  v16 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0 weight:v11];
  [v15 setFont:v16];

  [(UIButton *)self->_noiseLevelButton sizeToFit];
  [v27 addSubview:self->_noiseLevelButton];
  self->_isPaused = 0;
  v17 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  pauseButton = self->_pauseButton;
  self->_pauseButton = v17;

  [(UIButton *)self->_pauseButton setTitle:@"Pause" forState:0];
  [(UIButton *)self->_pauseButton addTarget:self action:sel__togglePause_ forControlEvents:64];
  v19 = [(UIButton *)self->_pauseButton titleLabel];
  v20 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0 weight:v11];
  [v19 setFont:v20];

  [(UIButton *)self->_pauseButton sizeToFit];
  [v27 addSubview:self->_pauseButton];
  v21 = [[SBModifierTimelineDetailViewController alloc] initWithNibName:0 bundle:0];
  detailViewController = self->_detailViewController;
  self->_detailViewController = v21;

  v23 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:self->_detailViewController];
  navigationController = self->_navigationController;
  self->_navigationController = v23;

  v25 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v26 = [v25 userInterfaceIdiom];

  if ((v26 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(UINavigationController *)self->_navigationController setModalPresentationStyle:7];
  }
  [(SBFluidSwitcherModifierTimelineViewController *)self setView:v27];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherModifierTimelineViewController;
  [(SBFluidSwitcherModifierTimelineViewController *)&v8 viewDidAppear:a3];
  v4 = [(SBFluidSwitcherModifierTimelineViewController *)self view];
  id v5 = [v4 window];
  [v5 bounds];
  double v7 = v6;

  -[SBFTouchPassThroughScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 0.0, 0.0, v7 + -40.0);
}

- (void)addEntry:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_isPaused)
  {
    if ([(NSMutableArray *)self->_entryViews count] == 150)
    {
      id v5 = [(NSMutableArray *)self->_entryViews firstObject];
      [v5 removeFromSuperview];
      [(NSMutableArray *)self->_entryViews removeObject:v5];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      double v6 = self->_entryViews;
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v37;
        double v10 = 10.0;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v37 != v9) {
              objc_enumerationMutation(v6);
            }
            v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            objc_msgSend(v12, "frame", (void)v36);
            double v14 = v13;
            [v12 frame];
            double v16 = v15;
            [v12 frame];
            objc_msgSend(v12, "setFrame:", v10, v14, v16);
            [v12 frame];
            double v10 = v17 + v18 + 10.0;
          }
          uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v8);
      }
      else
      {
        double v10 = 10.0;
      }

      -[SBFTouchPassThroughScrollView setContentSize:](self->_scrollView, "setContentSize:", v10, 0.0);
      scrollView = self->_scrollView;
      [(SBFTouchPassThroughScrollView *)scrollView frame];
      -[SBFTouchPassThroughScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0, v10 - v20, 0.0);
    }
    v21 = [SBFluidSwitcherModifierTimelineEntryView alloc];
    v22 = -[SBFluidSwitcherModifierTimelineEntryView initWithFrame:entry:](v21, "initWithFrame:entry:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(SBFluidSwitcherModifierTimelineEntryView *)v22 setDelegate:self];
    [(SBFTouchPassThroughScrollView *)self->_scrollView addSubview:v22];
    [(SBFluidSwitcherModifierTimelineEntryView *)v22 setNeedsLayout];
    [(SBFluidSwitcherModifierTimelineEntryView *)v22 layoutIfNeeded];
    double v23 = 10.0;
    if ([(NSMutableArray *)self->_entryViews count])
    {
      v24 = [(NSMutableArray *)self->_entryViews lastObject];
      [v24 frame];
      double v26 = v25;
      [v24 frame];
      double v23 = v26 + v27 + 10.0;
    }
    [(SBFluidSwitcherModifierTimelineEntryView *)v22 frame];
    double v29 = v28;
    [(SBFluidSwitcherModifierTimelineEntryView *)v22 frame];
    -[SBFluidSwitcherModifierTimelineEntryView setFrame:](v22, "setFrame:", v23, 35.0, v29);
    [(NSMutableArray *)self->_entryViews addObject:v22];
    [(SBFluidSwitcherModifierTimelineEntryView *)v22 frame];
    double v30 = CGRectGetMaxX(v42) + 10.0;
    -[SBFTouchPassThroughScrollView setContentSize:](self->_scrollView, "setContentSize:", v30, 0.0);
    v31 = [(SBFluidSwitcherModifierTimelineViewController *)self view];
    [v31 frame];
    double v33 = v32;

    if (v30 > v33)
    {
      v34 = self->_scrollView;
      [(SBFTouchPassThroughScrollView *)v34 frame];
      -[SBFTouchPassThroughScrollView setContentOffset:animated:](v34, "setContentOffset:animated:", 1, v30 - v35, 0.0);
    }
  }
}

- (void)didSelectEntryView:(id)a3
{
  id v16 = a3;
  id v4 = [(UINavigationController *)self->_navigationController popToRootViewControllerAnimated:0];
  id v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v7 = [(UINavigationController *)self->_navigationController popoverPresentationController];
    [v7 setSourceView:v16];

    uint64_t v8 = [(UINavigationController *)self->_navigationController popoverPresentationController];
    [v16 frame];
    objc_msgSend(v8, "setSourceRect:", v9 * 0.5, 35.0, 1.0, 1.0);

    -[UINavigationController setPreferredContentSize:](self->_navigationController, "setPreferredContentSize:", 600.0, 1.79769313e308);
  }
  detailViewController = self->_detailViewController;
  double v11 = [v16 entry];
  [(SBModifierTimelineDetailViewController *)detailViewController setEntry:v11];

  v12 = self->_detailViewController;
  double v13 = [v16 entry];
  double v14 = [v13 eventSnapshot];
  double v15 = [v14 eventName];
  [(SBModifierTimelineDetailViewController *)v12 setTitle:v15];

  [(SBFluidSwitcherModifierTimelineViewController *)self presentViewController:self->_navigationController animated:1 completion:0];
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SBFluidSwitcherModifierTimelineViewController;
  [(SBFluidSwitcherModifierTimelineViewController *)&v19 viewWillLayoutSubviews];
  scrollView = self->_scrollView;
  id v4 = [(SBFluidSwitcherModifierTimelineViewController *)self view];
  [v4 bounds];
  -[SBFTouchPassThroughScrollView setFrame:](scrollView, "setFrame:");

  [(UIButton *)self->_clearButton frame];
  double v6 = v5;
  [(UIButton *)self->_clearButton frame];
  CGFloat v8 = v7;
  -[UIButton setFrame:](self->_clearButton, "setFrame:", 10.0, 5.0, v6);
  v20.origin.x = 10.0;
  v20.origin.y = 5.0;
  v20.size.width = v6;
  v20.size.height = v8;
  CGFloat v9 = CGRectGetMaxX(v20) + 20.0;
  v21.origin.x = 10.0;
  v21.origin.y = 5.0;
  v21.size.width = v6;
  v21.size.height = v8;
  double MinY = CGRectGetMinY(v21);
  [(UIButton *)self->_noiseLevelButton frame];
  double v12 = v11;
  [(UIButton *)self->_noiseLevelButton frame];
  CGFloat v14 = v13;
  -[UIButton setFrame:](self->_noiseLevelButton, "setFrame:", v9, MinY, v12);
  v22.origin.x = v9;
  v22.origin.y = MinY;
  v22.size.width = v12;
  v22.size.height = v14;
  CGFloat v15 = CGRectGetMaxX(v22) + 20.0;
  v23.origin.x = v9;
  v23.origin.y = MinY;
  v23.size.width = v12;
  v23.size.height = v14;
  double v16 = CGRectGetMinY(v23);
  [(UIButton *)self->_pauseButton frame];
  double v18 = v17;
  [(UIButton *)self->_pauseButton frame];
  -[UIButton setFrame:](self->_pauseButton, "setFrame:", v15, v16, v18);
}

- (void)_reset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_entryViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "removeFromSuperview", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_entryViews removeAllObjects];
  -[SBFTouchPassThroughScrollView setContentSize:](self->_scrollView, "setContentSize:", 0.0, 0.0);
  -[SBFTouchPassThroughScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, 0.0);
}

- (void)_toggleNoiseLevel:(id)a3
{
  BOOL ignoreNoisyEvents = self->_ignoreNoisyEvents;
  self->_BOOL ignoreNoisyEvents = !ignoreNoisyEvents;
  noiseLevelButton = self->_noiseLevelButton;
  if (ignoreNoisyEvents) {
    uint64_t v6 = @"Ignore Noisy Events";
  }
  else {
    uint64_t v6 = @"Show All Events";
  }
  [(UIButton *)noiseLevelButton setTitle:v6 forState:0];
  [(UIButton *)self->_noiseLevelButton sizeToFit];
  id v7 = [(SBFluidSwitcherModifierTimelineViewController *)self view];
  [v7 setNeedsLayout];
}

- (void)_togglePause:(id)a3
{
  BOOL isPaused = self->_isPaused;
  self->_BOOL isPaused = !isPaused;
  pauseButton = self->_pauseButton;
  if (isPaused) {
    uint64_t v6 = @"Pause";
  }
  else {
    uint64_t v6 = @"Resume";
  }
  [(UIButton *)pauseButton setTitle:v6 forState:0];
  [(UIButton *)self->_pauseButton sizeToFit];
  id v7 = [(SBFluidSwitcherModifierTimelineViewController *)self view];
  [v7 setNeedsLayout];
}

- (BOOL)ignoreNoisyEvents
{
  return self->_ignoreNoisyEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);
  objc_storeStrong((id *)&self->_noiseLevelButton, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_entryViews, 0);
}

@end