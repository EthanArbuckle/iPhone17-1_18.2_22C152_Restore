@interface StockPlatterViewController
- (BOOL)stockChartViewIsCurrentChartView:(id)a3;
- (CGSize)preferredContentSize;
- (ChartUpdater)chartUpdater;
- (NSString)stockTicker;
- (NetPreferences)netPreferences;
- (Stock)stock;
- (StockChartView)chartView;
- (StockFetcher)stockFetcher;
- (StockManager)stockManager;
- (StockPlatterViewController)initWithStockTicker:(id)a3;
- (StockUpdateManager)stockUpdateManager;
- (StocksLayout)layout;
- (StocksStyle)style;
- (UIButton)attributionButton;
- (UILabel)exchangeStatusLabel;
- (UITableView)stocksTableView;
- (UIView)statusBarView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)chartInterval;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowDataType;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_attributionButtonPressed:(id)a3;
- (void)_cleanup;
- (void)_setupStockWithTicker:(id)a3;
- (void)_updateExchangeData;
- (void)dealloc;
- (void)setAttributionButton:(id)a3;
- (void)setChartInterval:(int64_t)a3;
- (void)setChartUpdater:(id)a3;
- (void)setChartView:(id)a3;
- (void)setExchangeStatusLabel:(id)a3;
- (void)setLayout:(id)a3;
- (void)setNetPreferences:(id)a3;
- (void)setRowDataType:(int64_t)a3;
- (void)setStatusBarView:(id)a3;
- (void)setStock:(id)a3;
- (void)setStockFetcher:(id)a3;
- (void)setStockManager:(id)a3;
- (void)setStockTicker:(id)a3;
- (void)setStockUpdateManager:(id)a3;
- (void)setStocksTableView:(id)a3;
- (void)setStyle:(id)a3;
- (void)updateChartForInterval:(int64_t)a3 completion:(id)a4;
- (void)viewDidLoad;
@end

@implementation StockPlatterViewController

- (StockPlatterViewController)initWithStockTicker:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"StockPlatterViewController.m", 61, @"Invalid parameter not satisfying: %@", @"stockTicker.length > 0" object file lineNumber description];
  }
  v43.receiver = self;
  v43.super_class = (Class)StockPlatterViewController;
  v6 = [(StockPlatterViewController *)&v43 init];
  if (v6)
  {
    v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 bounds];
    v10 = +[StocksLayout layoutForSize:](StocksLayout, "layoutForSize:", v8, v9);
    [(StockPlatterViewController *)v6 setLayout:v10];

    v11 = +[StocksPreferences sharedPreferences];
    v12 = [v11 objectForKey:@"chartInterval"];

    if (v12) {
      uint64_t v13 = [v12 unsignedIntegerValue];
    }
    else {
      uint64_t v13 = 4;
    }
    v6->_chartInterval = v13;
    v14 = +[StocksPreferences sharedPreferences];
    v15 = [v14 objectForKey:@"rowDataType"];

    if (v15) {
      uint64_t v16 = [v15 unsignedIntegerValue];
    }
    else {
      uint64_t v16 = 1;
    }
    v6->_rowDataType = v16;
    v17 = [(StockPlatterViewController *)v6 layout];
    v18 = [v17 chartDisplayMode];

    v19 = [(StockPlatterViewController *)v6 layout];
    [v19 chartViewFrame];
    double v21 = v20;
    double v23 = v22;

    [v18 intervalRowHeight];
    double v25 = v23 - v24;
    objc_msgSend(v18, "setChartRenderingInsets:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    objc_msgSend(v18, "setChartSize:", v21, v25);
    [v18 setGraphOverlapsYAxisLabels:1];
    v26 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.4];
    [v18 setXAxisKeylineColor:v26];

    v27 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.4];
    [v18 setAxisLabelsColor:v27];

    v28 = objc_opt_new();
    [(StockPlatterViewController *)v6 setStatusBarView:v28];

    id v29 = objc_alloc(MEMORY[0x263F1CA40]);
    v30 = objc_msgSend(v29, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(StockPlatterViewController *)v6 setStocksTableView:v30];

    v31 = [(StockPlatterViewController *)v6 stocksTableView];
    [v31 setDelegate:v6];

    v32 = [(StockPlatterViewController *)v6 stocksTableView];
    [v32 setDataSource:v6];

    v33 = [(StockPlatterViewController *)v6 stocksTableView];
    [v33 setSeparatorStyle:0];

    v34 = [(StockPlatterViewController *)v6 stocksTableView];
    [v34 setRowHeight:56.0];

    v35 = [(StockPlatterViewController *)v6 stocksTableView];
    [v35 registerClass:objc_opt_class() forCellReuseIdentifier:@"kStockPlatterViewControllerCellType"];

    v36 = [StockChartView alloc];
    v37 = [(StockPlatterViewController *)v6 layout];
    v38 = [v37 chartDisplayMode];
    v39 = [(StockChartView *)v36 initWithInitialDisplayMode:v38 preferredChartInterval:[(StockPlatterViewController *)v6 chartInterval] stockChartViewDelegate:v6];
    [(StockPlatterViewController *)v6 setChartView:v39];

    [(StockPlatterViewController *)v6 setStockTicker:v5];
    v40 = [(StockPlatterViewController *)v6 stockTicker];
    [(StockPlatterViewController *)v6 _setupStockWithTicker:v40];
  }
  return v6;
}

- (void)dealloc
{
  [(StockPlatterViewController *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)StockPlatterViewController;
  [(StockPlatterViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  v102.receiver = self;
  v102.super_class = (Class)StockPlatterViewController;
  [(StockPlatterViewController *)&v102 viewDidLoad];
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  [(StockPlatterViewController *)self preferredContentSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(StockPlatterViewController *)self view];
  objc_msgSend(v9, "setFrame:", v3, v4, v6, v8);

  v10 = [MEMORY[0x263F1C550] blackColor];
  v11 = [(StockPlatterViewController *)self view];
  [v11 setBackgroundColor:v10];

  [(StockPlatterViewController *)self preferredContentSize];
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(StockPlatterViewController *)self chartView];
  objc_msgSend(v16, "setFrame:", v3, v4, v13, v15);

  v17 = [(StockPlatterViewController *)self view];
  v18 = [v17 backgroundColor];
  v19 = [(StockPlatterViewController *)self statusBarView];
  [v19 setBackgroundColor:v18];

  double v20 = [(StockPlatterViewController *)self view];
  double v21 = [v20 backgroundColor];
  double v22 = [(StockPlatterViewController *)self stocksTableView];
  [v22 setBackgroundColor:v21];

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  double v23 = [(StockPlatterViewController *)self chartView];
  v111[0] = v23;
  double v24 = [(StockPlatterViewController *)self statusBarView];
  v111[1] = v24;
  double v25 = [(StockPlatterViewController *)self stocksTableView];
  v111[2] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:3];

  uint64_t v27 = [v26 countByEnumeratingWithState:&v98 objects:v112 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v99 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
        v32 = [(StockPlatterViewController *)self view];
        [v32 addSubview:v31];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v98 objects:v112 count:16];
    }
    while (v28);
  }

  v109[0] = @"chartView";
  v33 = [(StockPlatterViewController *)self chartView];
  v110[0] = v33;
  v109[1] = @"tableView";
  v34 = [(StockPlatterViewController *)self stocksTableView];
  v110[1] = v34;
  v109[2] = @"statusBarView";
  v35 = [(StockPlatterViewController *)self statusBarView];
  v110[2] = v35;
  v36 = [NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:3];

  v107[0] = @"TableViewHeight";
  v37 = [NSNumber numberWithDouble:56.0];
  v107[1] = @"StatusBarHeight";
  v108[0] = v37;
  v108[1] = &unk_26D5E8FD0;
  v38 = [NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:2];

  v39 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[tableView(TableViewHeight)][chartView][statusBarView(StatusBarHeight)]|" options:512 metrics:v38 views:v36];
  v40 = (void *)[v39 mutableCopy];

  v41 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[chartView]|" options:0 metrics:v38 views:v36];
  [v40 addObjectsFromArray:v41];

  v42 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:v38 views:v36];
  [v40 addObjectsFromArray:v42];

  objc_super v43 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[statusBarView]|" options:0 metrics:v38 views:v36];
  [v40 addObjectsFromArray:v43];

  [MEMORY[0x263F08938] activateConstraints:v40];
  v44 = [MEMORY[0x263F1C488] buttonWithType:0];
  [(StockPlatterViewController *)self setAttributionButton:v44];

  v45 = [(StockPlatterViewController *)self attributionButton];
  [v45 setExclusiveTouch:1];

  v46 = [(StockPlatterViewController *)self attributionButton];
  v47 = [(StockPlatterViewController *)self netPreferences];
  v48 = [v47 logoButtonImage];
  v49 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.5];
  v50 = [v48 _flatImageWithColor:v49];
  [v46 setImage:v50 forState:0];

  v51 = [(StockPlatterViewController *)self attributionButton];
  v52 = [(StockPlatterViewController *)self netPreferences];
  v53 = [v52 logoButtonImage];
  v54 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.2];
  v55 = [v53 _flatImageWithColor:v54];
  [v51 setImage:v55 forState:1];

  v56 = [(StockPlatterViewController *)self attributionButton];
  [v56 addTarget:self action:sel__attributionButtonPressed_ forControlEvents:64];

  v57 = [(StockPlatterViewController *)self attributionButton];
  [v57 accessibilitySetIdentification:@"YahooButton"];

  v58 = [(StockPlatterViewController *)self statusBarView];
  v59 = [(StockPlatterViewController *)self attributionButton];
  [v58 addSubview:v59];

  v60 = [(StockPlatterViewController *)self attributionButton];
  [v60 sizeToFit];

  v61 = objc_opt_new();
  [(StockPlatterViewController *)self setExchangeStatusLabel:v61];

  v62 = [(StockPlatterViewController *)self exchangeStatusLabel];
  v63 = [(StockPlatterViewController *)self style];
  v64 = [v63 lightFontOfSize:12.0];
  [v62 setFont:v64];

  v65 = [(StockPlatterViewController *)self exchangeStatusLabel];
  v66 = [MEMORY[0x263F1C550] colorWithRed:0.549019608 green:0.560784314 blue:0.576470588 alpha:1.0];
  [v65 setTextColor:v66];

  v67 = [(StockPlatterViewController *)self exchangeStatusLabel];
  v68 = [MEMORY[0x263F1C550] clearColor];
  [v67 setBackgroundColor:v68];

  v69 = [(StockPlatterViewController *)self exchangeStatusLabel];
  [v69 setTextAlignment:1];

  v70 = [(StockPlatterViewController *)self exchangeStatusLabel];
  [v70 setAdjustsFontSizeToFitWidth:1];

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v71 = [(StockPlatterViewController *)self attributionButton];
  v105[0] = v71;
  v72 = [(StockPlatterViewController *)self exchangeStatusLabel];
  v105[1] = v72;
  v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:2];

  uint64_t v74 = [v73 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v95;
    do
    {
      for (uint64_t j = 0; j != v75; ++j)
      {
        if (*(void *)v95 != v76) {
          objc_enumerationMutation(v73);
        }
        v78 = *(void **)(*((void *)&v94 + 1) + 8 * j);
        [v78 setTranslatesAutoresizingMaskIntoConstraints:0];
        v79 = [(StockPlatterViewController *)self statusBarView];
        [v79 addSubview:v78];
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v94 objects:v106 count:16];
    }
    while (v75);
  }

  v103[0] = @"attributionButton";
  v80 = [(StockPlatterViewController *)self attributionButton];
  v103[1] = @"exchangeStatusLabel";
  v104[0] = v80;
  v81 = [(StockPlatterViewController *)self exchangeStatusLabel];
  v104[1] = v81;
  v82 = [NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:2];

  v83 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-AttribButtonLeftMargin-[attributionButton]" options:1024 metrics:&unk_26D5E90E8 views:v82];
  v84 = (void *)[v83 mutableCopy];

  v85 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[attributionButton]|" options:0 metrics:&unk_26D5E90E8 views:v82];
  [v84 addObjectsFromArray:v85];

  v86 = (void *)MEMORY[0x263F08938];
  v87 = [(StockPlatterViewController *)self exchangeStatusLabel];
  v88 = [(StockPlatterViewController *)self statusBarView];
  v89 = [v86 constraintWithItem:v87 attribute:9 relatedBy:0 toItem:v88 attribute:9 multiplier:1.0 constant:0.0];
  [v84 addObject:v89];

  v90 = (void *)MEMORY[0x263F08938];
  v91 = [(StockPlatterViewController *)self exchangeStatusLabel];
  v92 = [(StockPlatterViewController *)self statusBarView];
  v93 = [v90 constraintWithItem:v91 attribute:10 relatedBy:0 toItem:v92 attribute:10 multiplier:1.0 constant:0.0];
  [v84 addObject:v93];

  [MEMORY[0x263F08938] activateConstraints:v84];
}

- (CGSize)preferredContentSize
{
  double v3 = [(StockPlatterViewController *)self layout];
  [v3 listViewFrame];
  double v5 = v4;
  double v6 = [(StockPlatterViewController *)self layout];
  [v6 chartViewFrame];
  double v8 = v7 + 56.0;
  double v9 = [(StockPlatterViewController *)self layout];
  [v9 statusViewFrame];
  double v11 = v8 + v10;

  double v12 = v5;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (NetPreferences)netPreferences
{
  netPreferences = self->_netPreferences;
  if (!netPreferences)
  {
    double v4 = +[NetPreferences sharedPreferences];
    double v5 = self->_netPreferences;
    self->_netPreferences = v4;

    netPreferences = self->_netPreferences;
  }

  return netPreferences;
}

- (StocksStyle)style
{
  style = self->_style;
  if (!style)
  {
    double v4 = (StocksStyle *)objc_opt_new();
    double v5 = self->_style;
    self->_style = v4;

    style = self->_style;
  }

  return style;
}

- (StockManager)stockManager
{
  stockManager = self->_stockManager;
  if (!stockManager)
  {
    double v4 = (StockManager *)objc_opt_new();
    double v5 = self->_stockManager;
    self->_stockManager = v4;

    stockManager = self->_stockManager;
  }

  return stockManager;
}

- (StockUpdateManager)stockUpdateManager
{
  stockUpdateManager = self->_stockUpdateManager;
  if (!stockUpdateManager)
  {
    double v4 = (StockUpdateManager *)objc_opt_new();
    double v5 = self->_stockUpdateManager;
    self->_stockUpdateManager = v4;

    stockUpdateManager = self->_stockUpdateManager;
  }

  return stockUpdateManager;
}

- (ChartUpdater)chartUpdater
{
  chartUpdater = self->_chartUpdater;
  if (!chartUpdater)
  {
    double v4 = (ChartUpdater *)objc_opt_new();
    double v5 = self->_chartUpdater;
    self->_chartUpdater = v4;

    chartUpdater = self->_chartUpdater;
  }
  double v6 = chartUpdater;

  return v6;
}

- (StockFetcher)stockFetcher
{
  stockFetcher = self->_stockFetcher;
  if (!stockFetcher)
  {
    double v4 = (StockFetcher *)objc_opt_new();
    double v5 = self->_stockFetcher;
    self->_stockFetcher = v4;

    stockFetcher = self->_stockFetcher;
  }
  double v6 = stockFetcher;

  return v6;
}

- (void)updateChartForInterval:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  double v6 = [(StockPlatterViewController *)self stock];
  double v7 = [(StockPlatterViewController *)self stocksTableView];
  double v8 = [(StockPlatterViewController *)self chartView];
  double v9 = [(StockPlatterViewController *)self chartUpdater];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke;
  v35[3] = &unk_26467DAF8;
  id v10 = v5;
  id v36 = v10;
  double v11 = (void *)MEMORY[0x223CABDA0](v35);
  double v12 = StocksLogForCategory(3);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[StockPlatterViewController updateChartForInterval:completion:]((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);
  }

  objc_initWeak(&location, self);
  v19 = [(StockPlatterViewController *)self stockUpdateManager];
  double v20 = [(StockPlatterViewController *)self stock];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_101;
  v27[3] = &unk_26467DB48;
  id v21 = v11;
  id v32 = v21;
  objc_copyWeak(v33, &location);
  v33[1] = (id)a3;
  id v22 = v8;
  id v28 = v22;
  id v23 = v6;
  id v29 = v23;
  id v24 = v7;
  id v30 = v24;
  id v25 = v9;
  id v31 = v25;
  [v19 updateStockBasicWithCompletion:v20 withCompletion:v27];

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v3)
    {
      id v5 = StocksLogForCategory(3);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_cold_1((uint64_t)v3, v5);
      }

      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_101(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 80);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained setChartInterval:v5];

    id v7 = objc_loadWeakRetained((id *)(a1 + 72));
    [v7 _updateExchangeData];

    [*(id *)(a1 + 32) setStock:*(void *)(a1 + 40)];
    double v8 = *(void **)(a1 + 48);
    double v9 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
    [v8 reloadSections:v9 withRowAnimation:0];

    id v10 = StocksLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_101_cold_1(a1 + 40, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 80);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_103;
    v22[3] = &unk_26467DB20;
    v19 = *(void **)(a1 + 56);
    id v25 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 80);
    id v24 = v20;
    uint64_t v26 = v21;
    [v19 updateChartForStock:v17 interval:v18 withCompletion:v22];
  }
}

uint64_t __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_103(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
  else
  {
    double v6 = StocksLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_103_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
    }

    if (!*(void *)(a1 + 32)) {
      NSLog(&cfstr_ChartviewIsNil.isa);
    }
    uint64_t v13 = [*(id *)(a1 + 40) chartDataForInterval:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) setChartData:v13];

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_setupStockWithTicker:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(StockPlatterViewController *)self stockFetcher];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__StockPlatterViewController__setupStockWithTicker___block_invoke;
  v6[3] = &unk_26467DB70;
  objc_copyWeak(&v7, &location);
  [v5 fetchStockWithSymbol:v4 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__StockPlatterViewController__setupStockWithTicker___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = (id *)(a1 + 32);
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained setStockFetcher:0];

    id v5 = objc_loadWeakRetained(v2);
    [v5 setStock:v3];

    [v3 setTransient:1];
    id v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "updateChartForInterval:completion:", objc_msgSend(v6, "chartInterval"), 0);
  }
}

- (void)_updateExchangeData
{
  id v3 = [(StockPlatterViewController *)self stock];
  id v6 = [v3 marketStatusDescription];

  if (v6)
  {
    id v4 = [(StockPlatterViewController *)self exchangeStatusLabel];
    [v4 setText:v6];
  }
  id v5 = [(StockPlatterViewController *)self statusBarView];
  [v5 setNeedsUpdateConstraints];
}

- (void)_cleanup
{
  +[ChartLabelInfoManager clearSharedManager];
  +[GraphRenderer clearSharedRenderer];
  +[NetPreferences clearSharedPreferences];
  +[StocksPreferences clearSharedPreferences];
  +[StockManager clearSharedManager];
  [(StockPlatterViewController *)self setNetPreferences:0];
  id v3 = [(StockPlatterViewController *)self chartUpdater];
  [v3 cancelAndInvalidate];

  [(StockPlatterViewController *)self setChartUpdater:0];
  [(StockPlatterViewController *)self setStockUpdateManager:0];

  [(StockPlatterViewController *)self setStockManager:0];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 dequeueReusableCellWithIdentifier:@"kStockPlatterViewControllerCellType"];
  objc_msgSend(v8, "setRowDataType:", -[StockPlatterViewController rowDataType](self, "rowDataType"));
  [v8 setShowsRowSeparator:0];
  uint64_t v9 = [(StockPlatterViewController *)self stock];
  [v8 setStock:v9];

  [v7 selectRowAtIndexPath:v6 animated:0 scrollPosition:0];

  return v8;
}

- (BOOL)stockChartViewIsCurrentChartView:(id)a3
{
  return 1;
}

- (void)_attributionButtonPressed:(id)a3
{
  id v4 = [(StockPlatterViewController *)self stock];

  if (v4)
  {
    id v5 = [(StockPlatterViewController *)self netPreferences];
    id v6 = [(StockPlatterViewController *)self stock];
    id v8 = [v5 fullQuoteURLOverrideForStock:v6];

    id v7 = [MEMORY[0x263F1C408] sharedApplication];
    [v7 openURL:v8 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
}

- (void)setStockFetcher:(id)a3
{
}

- (Stock)stock
{
  return self->_stock;
}

- (void)setStock:(id)a3
{
}

- (int64_t)chartInterval
{
  return self->_chartInterval;
}

- (void)setChartInterval:(int64_t)a3
{
  self->_chartInterval = a3;
}

- (UITableView)stocksTableView
{
  return self->_stocksTableView;
}

- (void)setStocksTableView:(id)a3
{
}

- (UIView)statusBarView
{
  return self->_statusBarView;
}

- (void)setStatusBarView:(id)a3
{
}

- (void)setNetPreferences:(id)a3
{
}

- (void)setStockUpdateManager:(id)a3
{
}

- (StockChartView)chartView
{
  return self->_chartView;
}

- (void)setChartView:(id)a3
{
}

- (void)setChartUpdater:(id)a3
{
}

- (void)setStyle:(id)a3
{
}

- (StocksLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (void)setStockManager:(id)a3
{
}

- (UIButton)attributionButton
{
  return self->_attributionButton;
}

- (void)setAttributionButton:(id)a3
{
}

- (UILabel)exchangeStatusLabel
{
  return self->_exchangeStatusLabel;
}

- (void)setExchangeStatusLabel:(id)a3
{
}

- (NSString)stockTicker
{
  return self->_stockTicker;
}

- (void)setStockTicker:(id)a3
{
}

- (int64_t)rowDataType
{
  return self->_rowDataType;
}

- (void)setRowDataType:(int64_t)a3
{
  self->_rowDataType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stockTicker, 0);
  objc_storeStrong((id *)&self->_exchangeStatusLabel, 0);
  objc_storeStrong((id *)&self->_attributionButton, 0);
  objc_storeStrong((id *)&self->_stockManager, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_chartUpdater, 0);
  objc_storeStrong((id *)&self->_chartView, 0);
  objc_storeStrong((id *)&self->_stockUpdateManager, 0);
  objc_storeStrong((id *)&self->_netPreferences, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_stocksTableView, 0);
  objc_storeStrong((id *)&self->_stock, 0);

  objc_storeStrong((id *)&self->_stockFetcher, 0);
}

- (void)updateChartForInterval:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222ED9000, a2, OS_LOG_TYPE_ERROR, "ERROR POPULATING PLATTER: %@", (uint8_t *)&v2, 0xCu);
}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_101_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_103_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end