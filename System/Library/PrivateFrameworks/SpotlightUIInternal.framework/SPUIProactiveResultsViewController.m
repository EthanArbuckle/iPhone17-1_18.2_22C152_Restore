@interface SPUIProactiveResultsViewController
- (BOOL)searchAgentHasWindow:(id)a3;
- (NSTimer)footerTransitionTimer;
- (SPUIProactiveResultsViewController)initWithSearchModel:(id)a3 searchEntity:(id)a4;
- (unint64_t)refreshResultsWithContext:(id)a3 allowPartialUpdates:(BOOL)a4;
- (void)fadeInFooterView;
- (void)searchAgentUpdatedResults:(id)a3;
- (void)setFooterTransitionTimer:(id)a3;
- (void)setFooterView:(id)a3;
- (void)updateWithResultSections:(id)a3 resetScrollPoint:(BOOL)a4 animated:(BOOL)a5;
@end

@implementation SPUIProactiveResultsViewController

- (void)updateWithResultSections:(id)a3 resetScrollPoint:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 count]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v5;
  }
  v10.receiver = self;
  v10.super_class = (Class)SPUIProactiveResultsViewController;
  [(SearchUIResultsViewController *)&v10 updateWithResultSections:v8 resetScrollPoint:v6 animated:v9];
}

- (unint64_t)refreshResultsWithContext:(id)a3 allowPartialUpdates:(BOOL)a4
{
  id v6 = a3;
  v7 = [(SPUIResultsViewController *)self model];

  if (v7)
  {
    id v8 = [(SPUIResultsViewController *)self model];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v10 = [(SPUIResultsViewController *)self model];
      if (a4
        || ([(SearchUIResultsViewController *)self sections],
            v11 = objc_claimAutoreleasedReturnValue(),
            uint64_t v12 = [v11 count],
            v11,
            !v12))
      {
        uint64_t v21 = MEMORY[0x263F79148];
        v22 = *(NSObject **)(MEMORY[0x263F79148] + 40);
        if (!v22)
        {
          SPUIInitLogging();
          v22 = *(NSObject **)(v21 + 40);
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23D2E6000, v22, OS_LOG_TYPE_DEFAULT, "Fetching full proactive results.", buf, 2u);
        }
        [v10 updateWithQueryContext:v6];
      }
      else
      {
        uint64_t v13 = MEMORY[0x263F79148];
        v14 = *(NSObject **)(MEMORY[0x263F79148] + 40);
        if (!v14)
        {
          SPUIInitLogging();
          v14 = *(NSObject **)(v13 + 40);
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl(&dword_23D2E6000, v14, OS_LOG_TYPE_DEFAULT, "Refreshing proactive results.", v26, 2u);
        }
        [v10 refreshWithQueryContext:v6];
      }
      v23 = [v10 queryTask];
      v24 = [v23 query];
      unint64_t v17 = [v24 queryIdent];
    }
    else
    {
      uint64_t v18 = MEMORY[0x263F79148];
      v19 = *(NSObject **)(MEMORY[0x263F79148] + 40);
      if (!v19)
      {
        SPUIInitLogging();
        v19 = *(NSObject **)(v18 + 40);
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SPUIProactiveResultsViewController refreshResultsWithContext:allowPartialUpdates:](v19);
      }
      v20 = [(SPUIResultsViewController *)self model];
      [v20 updateWithQueryContext:v6];

      unint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v15 = MEMORY[0x263F79148];
    v16 = *(NSObject **)(MEMORY[0x263F79148] + 40);
    if (!v16)
    {
      SPUIInitLogging();
      v16 = *(NSObject **)(v15 + 40);
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SPUIProactiveResultsViewController refreshResultsWithContext:allowPartialUpdates:](v16);
    }
    unint64_t v17 = -1;
  }

  return v17;
}

void __54__SPUIProactiveResultsViewController_fadeInFooterView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x263F67C78];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SPUIProactiveResultsViewController_fadeInFooterView__block_invoke_2;
  v5[3] = &unk_264E90800;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  [v4 performAnimatableChanges:v5];
  [v3 invalidate];
  objc_destroyWeak(&v6);
}

- (SPUIProactiveResultsViewController)initWithSearchModel:(id)a3 searchEntity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SPUIProactiveResultsViewController;
  return [(SPUIResultsViewController *)&v5 initWithSearchModel:a3 searchEntity:a4];
}

void __54__SPUIProactiveResultsViewController_fadeInFooterView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained footerView];
  [v1 setAlpha:1.0];
}

- (void)searchAgentUpdatedResults:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SearchUIResultsViewController *)self sections];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [(SearchUIResultsViewController *)self footerView];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [(SearchUIResultsViewController *)self sections];
    unint64_t v10 = [v9 count];
    v11 = [v4 sections];
    unint64_t v12 = [v11 count];

    if (v10 < v12)
    {
      uint64_t v13 = [(SearchUIResultsViewController *)self footerView];
      [v13 setAlpha:0.0];
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SPUIProactiveResultsViewController;
  [(SPUIResultsViewController *)&v17 searchAgentUpdatedResults:v4];
  if ([v4 queryPartiallyComplete])
  {
    v14 = [v4 sections];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      if (!v6)
      {
        v16 = [(SPUIProactiveResultsViewController *)self view];
        [v16 layoutBelowIfNeeded];
      }
    }
  }
  [(SPUIProactiveResultsViewController *)self fadeInFooterView];
}

- (void)setFooterView:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SPUIProactiveResultsViewController *)self footerTransitionTimer];
  int v6 = [v5 isValid];

  if (v6) {
    [v4 setAlpha:0.0];
  }
  uint64_t v7 = [(SearchUIResultsViewController *)self sections];
  uint64_t v8 = [v7 count];

  if (!v8) {
    [v4 setAlpha:0.0];
  }
  v11.receiver = self;
  v11.super_class = (Class)SPUIProactiveResultsViewController;
  [(SearchUIResultsViewController *)&v11 setFooterView:v4];
  uint64_t v9 = [(SearchUIResultsViewController *)self sections];
  uint64_t v10 = [v9 count];

  if (!v10) {
    [(SPUIProactiveResultsViewController *)self fadeInFooterView];
  }
}

- (void)fadeInFooterView
{
  id v3 = [(SearchUIResultsViewController *)self footerView];
  [v3 alpha];
  double v5 = v4;

  if (v5 < 1.0)
  {
    int v6 = [(SPUIProactiveResultsViewController *)self footerTransitionTimer];
    [v6 invalidate];

    objc_initWeak(&location, self);
    uint64_t v7 = (void *)MEMORY[0x263EFFA20];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    objc_super v11 = __54__SPUIProactiveResultsViewController_fadeInFooterView__block_invoke;
    unint64_t v12 = &unk_264E90850;
    objc_copyWeak(&v13, &location);
    uint64_t v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:&v9 block:0.5];
    -[SPUIProactiveResultsViewController setFooterTransitionTimer:](self, "setFooterTransitionTimer:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (NSTimer)footerTransitionTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setFooterTransitionTimer:(id)a3
{
}

- (BOOL)searchAgentHasWindow:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  BOOL v4 = [v3 applicationState] == 0;

  return v4;
}

- (void).cxx_destruct
{
}

- (void)refreshResultsWithContext:(os_log_t)log allowPartialUpdates:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D2E6000, log, OS_LOG_TYPE_ERROR, "Warning: proactive model of value 'nil' cannot be refreshed!", v1, 2u);
}

- (void)refreshResultsWithContext:(os_log_t)log allowPartialUpdates:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D2E6000, log, OS_LOG_TYPE_ERROR, "Warning: proactive model of type other than SPUISearchModelZKW is not supported!", v1, 2u);
}

@end