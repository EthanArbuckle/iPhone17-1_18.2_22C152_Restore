@interface UIPrinterBrowserViewController
- (BOOL)loaded;
- (BOOL)searchingViewConstraintsSet;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldFilterPrinters;
- (NSMutableArray)availablePrinters;
- (NSMutableArray)filteredOutPrinters;
- (NSMutableArray)iCloudPrinters;
- (PKPrinter)lockedPrinter;
- (PKPrinterBrowser)printerBrowser;
- (UIBarButtonItem)iCloudPrintersButton;
- (UIPrintInfo)printInfoForBrowser;
- (UIPrinterBrowserOwner)ownerPanelViewController;
- (UIPrinterBrowserViewController)initWithOwnerViewController:(id)a3 printInfo:(id)a4;
- (UIPrinterSearchingView)searchingView;
- (double)maximumPopoverHeight;
- (id)discoveredPrinterWithUUID:(id)a3;
- (id)printerAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)addPrinter:(id)a3 moreComing:(BOOL)a4;
- (void)adjustPopoverSize;
- (void)dealloc;
- (void)didChangePreferredContentSize;
- (void)iCloudPrintersListChanged;
- (void)loadView;
- (void)printerInfoButtonTapped:(id)a3;
- (void)removePrinter:(id)a3 moreGoing:(BOOL)a4;
- (void)selectPrinter:(id)a3;
- (void)setAvailablePrinters:(id)a3;
- (void)setFilteredOutPrinters:(id)a3;
- (void)setICloudPrinters:(id)a3;
- (void)setICloudPrintersButton:(id)a3;
- (void)setLoaded:(BOOL)a3;
- (void)setLockedPrinter:(id)a3;
- (void)setMaximumPopoverHeight:(double)a3;
- (void)setOwnerPanelViewController:(id)a3;
- (void)setPrintInfoForBrowser:(id)a3;
- (void)setPrinterBrowser:(id)a3;
- (void)setSearchingView:(id)a3;
- (void)setSearchingViewConstraintsSet:(BOOL)a3;
- (void)setShouldFilterPrinters:(BOOL)a3;
- (void)showCancelButton;
- (void)startPrinterBrowser;
- (void)stopPrinterBrowser;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearching;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)willEnterForeground;
@end

@implementation UIPrinterBrowserViewController

- (UIPrinterBrowserViewController)initWithOwnerViewController:(id)a3 printInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIPrinterBrowserViewController;
  v8 = [(UIPrinterBrowserViewController *)&v19 initWithStyle:2];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"Printer" value:@"Printer" table:@"Localizable"];
    [(UIPrinterBrowserViewController *)v8 setTitle:v10];

    double v11 = *MEMORY[0x1E4FB2F28];
    v12 = [(UIPrinterBrowserViewController *)v8 tableView];
    [v12 setRowHeight:v11];

    [(UIPrinterBrowserViewController *)v8 setOwnerPanelViewController:v6];
    v13 = (void *)[v7 copy];
    [(UIPrinterBrowserViewController *)v8 setPrintInfoForBrowser:v13];

    v14 = [MEMORY[0x1E4F1CA48] array];
    [(UIPrinterBrowserViewController *)v8 setICloudPrinters:v14];

    v15 = [MEMORY[0x1E4F1CA48] array];
    [(UIPrinterBrowserViewController *)v8 setAvailablePrinters:v15];

    v16 = [MEMORY[0x1E4F1CA48] array];
    [(UIPrinterBrowserViewController *)v8 setFilteredOutPrinters:v16];

    -[UIPrinterBrowserViewController setShouldFilterPrinters:](v8, "setShouldFilterPrinters:", [v6 filtersPrinters]);
    [(UIPrinterBrowserViewController *)v8 setMaximumPopoverHeight:1.79769313e308];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v8 selector:sel_stopPrinterBrowser name:*MEMORY[0x1E4FB2640] object:0];
    [v17 addObserver:v8 selector:sel_willEnterForeground name:*MEMORY[0x1E4FB2730] object:0];
    [v17 addObserver:v8 selector:sel_didChangePreferredContentSize name:*MEMORY[0x1E4FB27A8] object:0];
    [v17 addObserver:v8 selector:sel_iCloudPrintersListChanged name:@"com.apple.printkit.iCloudPrintersChanged.notification" object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(UIPrinterBrowserViewController *)self printerBrowser];

  if (v4)
  {
    v5 = [(UIPrinterBrowserViewController *)self printerBrowser];
    [v5 setDelegate:0];

    [(UIPrinterBrowserViewController *)self setPrinterBrowser:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)UIPrinterBrowserViewController;
  [(UIPrinterBrowserViewController *)&v6 dealloc];
}

- (void)selectPrinter:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPrinterBrowserViewController *)self ownerPanelViewController];
  [v5 setPrinter:v4];
}

- (void)printerInfoButtonTapped:(id)a3
{
  id v6 = [a3 printer];
  id v4 = [[UIPrinterUtilityTableViewController alloc] initWithPrinter:v6];
  id v5 = [(UIPrinterBrowserViewController *)self navigationController];
  [v5 pushViewController:v4 animated:1];
}

- (void)adjustPopoverSize
{
  v3 = [(UIPrinterBrowserViewController *)self popoverPresentationController];

  if (v3)
  {
    id v4 = [(UIPrinterBrowserViewController *)self tableView];
    if ([v4 numberOfSections] <= 0)
    {
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      id v5 = [(UIPrinterBrowserViewController *)self tableView];
      id v6 = [(UIPrinterBrowserViewController *)self tableView];
      objc_msgSend(v5, "rectForSection:", objc_msgSend(v6, "numberOfSections") - 1);
      double v8 = v7;
    }
    v9 = [(UIPrinterBrowserViewController *)self navigationController];
    id v20 = [v9 viewControllers];

    if ((unint64_t)[v20 count] < 2)
    {
      double v17 = 320.0;
    }
    else
    {
      v10 = objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v20, "count") - 2);
      double v11 = [v10 view];
      [v11 frame];
      double v13 = v12;

      if (v8 < v13) {
        double v8 = v13;
      }
      v14 = [v10 view];
      [v14 frame];
      double v16 = v15;

      double v17 = fmax(v16, 320.0);
    }
    [(UIPrinterBrowserViewController *)self maximumPopoverHeight];
    if (v8 < v18) {
      double v18 = v8;
    }
    double v19 = 161.0;
    if (v18 >= 161.0) {
      double v19 = v18;
    }
    -[UIPrinterBrowserViewController setPreferredContentSize:](self, "setPreferredContentSize:", v17, v19);
  }
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)UIPrinterBrowserViewController;
  [(UIPrinterBrowserViewController *)&v3 loadView];
  [(UIPrinterBrowserViewController *)self adjustPopoverSize];
}

- (void)updateViewConstraints
{
  uint64_t v3 = [(UIPrinterBrowserViewController *)self searchingView];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [(UIPrinterBrowserViewController *)self searchingViewConstraintsSet];

    if (!v5)
    {
      id v6 = [(UIPrinterBrowserViewController *)self view];
      double v7 = (void *)MEMORY[0x1E4F28DC8];
      double v8 = [(UIPrinterBrowserViewController *)self searchingView];
      v9 = [(UIPrinterBrowserViewController *)self view];
      v10 = [v7 constraintWithItem:v8 attribute:8 relatedBy:0 toItem:v9 attribute:8 multiplier:1.0 constant:0.0];
      [v6 addConstraint:v10];

      double v11 = [(UIPrinterBrowserViewController *)self view];
      double v12 = (void *)MEMORY[0x1E4F28DC8];
      double v13 = [(UIPrinterBrowserViewController *)self searchingView];
      v14 = [(UIPrinterBrowserViewController *)self view];
      double v15 = [v12 constraintWithItem:v13 attribute:7 relatedBy:0 toItem:v14 attribute:7 multiplier:1.0 constant:0.0];
      [v11 addConstraint:v15];

      double v16 = [(UIPrinterBrowserViewController *)self view];
      double v17 = (void *)MEMORY[0x1E4F28DC8];
      double v18 = [(UIPrinterBrowserViewController *)self searchingView];
      double v19 = [(UIPrinterBrowserViewController *)self view];
      id v20 = [v17 constraintWithItem:v18 attribute:9 relatedBy:0 toItem:v19 attribute:9 multiplier:1.0 constant:0.0];
      [v16 addConstraint:v20];

      v21 = [(UIPrinterBrowserViewController *)self view];
      v22 = (void *)MEMORY[0x1E4F28DC8];
      v23 = [(UIPrinterBrowserViewController *)self searchingView];
      v24 = [(UIPrinterBrowserViewController *)self view];
      v25 = [v22 constraintWithItem:v23 attribute:10 relatedBy:0 toItem:v24 attribute:10 multiplier:1.0 constant:0.0];
      [v21 addConstraint:v25];

      [(UIPrinterBrowserViewController *)self setSearchingViewConstraintsSet:1];
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)UIPrinterBrowserViewController;
  [(UIPrinterBrowserViewController *)&v26 updateViewConstraints];
}

- (void)startPrinterBrowser
{
  uint64_t v3 = [(UIPrinterBrowserViewController *)self printerBrowser];

  if (!v3)
  {
    id v4 = [(UIPrinterBrowserViewController *)self printInfoForBrowser];
    BOOL v5 = [v4 dictionaryRepresentation];

    id v6 = [MEMORY[0x1E4F93300] browserWithDelegate:self infoDictionary:v5];
    [(UIPrinterBrowserViewController *)self setPrinterBrowser:v6];
  }
  double v7 = [MEMORY[0x1E4F932E0] iCloudPrinters];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__UIPrinterBrowserViewController_startPrinterBrowser__block_invoke;
  v8[3] = &unk_1E6DA1458;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __53__UIPrinterBrowserViewController_startPrinterBrowser__block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__UIPrinterBrowserViewController_startPrinterBrowser__block_invoke_2;
  v3[3] = &unk_1E6DA1430;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F932F8] printerWithiCloudPrinter:a2 discoveryTime:v3 completionHandler:5.0];
}

uint64_t __53__UIPrinterBrowserViewController_startPrinterBrowser__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addPrinter:a2 moreComing:0];
  }
  return result;
}

- (void)stopPrinterBrowser
{
  uint64_t v3 = [(UIPrinterBrowserViewController *)self printerBrowser];

  if (v3)
  {
    id v4 = [(UIPrinterBrowserViewController *)self printerBrowser];
    [v4 setDelegate:0];

    [(UIPrinterBrowserViewController *)self setPrinterBrowser:0];
    BOOL v5 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
    [v5 removeAllObjects];

    id v6 = [(UIPrinterBrowserViewController *)self availablePrinters];
    [v6 removeAllObjects];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__UIPrinterBrowserViewController_stopPrinterBrowser__block_invoke;
    block[3] = &unk_1E6DA1408;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__UIPrinterBrowserViewController_stopPrinterBrowser__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setLoaded:0];
}

- (void)didChangePreferredContentSize
{
  id v2 = [(UIPrinterBrowserViewController *)self searchingView];
  [v2 updateFont];
}

- (void)iCloudPrintersListChanged
{
  [(UIPrinterBrowserViewController *)self stopPrinterBrowser];
  [(UIPrinterBrowserViewController *)self startPrinterBrowser];
}

- (void)updateSearching
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__UIPrinterBrowserViewController_updateSearching__block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__UIPrinterBrowserViewController_updateSearching__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iCloudPrinters];
  uint64_t v3 = [v2 count];
  BOOL v4 = v3 == 0;
  if (v3) {
    goto LABEL_2;
  }
  BOOL v5 = [*(id *)(a1 + 32) availablePrinters];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    BOOL v4 = 0;
  }
  else
  {
    double v7 = [*(id *)(a1 + 32) searchingView];

    if (!v7)
    {
      v9 = [UIPrinterSearchingView alloc];
      v10 = [*(id *)(a1 + 32) view];
      [v10 bounds];
      double v11 = -[UIPrinterSearchingView initWithFrame:](v9, "initWithFrame:");
      [*(id *)(a1 + 32) setSearchingView:v11];

      double v12 = [*(id *)(a1 + 32) view];
      double v13 = [*(id *)(a1 + 32) searchingView];
      [v12 addSubview:v13];

      id v2 = [*(id *)(a1 + 32) view];
      [v2 setNeedsUpdateConstraints];
LABEL_2:

      goto LABEL_7;
    }
    BOOL v4 = 1;
  }
LABEL_7:
  double v8 = [*(id *)(a1 + 32) tableView];
  [v8 setBounces:v4 ^ 1];

  id v14 = [*(id *)(a1 + 32) searchingView];
  [v14 setSearching:v4];
}

- (void)willEnterForeground
{
  [(UIPrinterBrowserViewController *)self startPrinterBrowser];
  uint64_t v3 = [(UIPrinterBrowserViewController *)self tableView];
  [v3 reloadData];

  [(UIPrinterBrowserViewController *)self updateSearching];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIPrinterBrowserViewController;
  [(UIPrinterBrowserViewController *)&v5 viewDidAppear:a3];
  BOOL v4 = [(UIPrinterBrowserViewController *)self tableView];
  [v4 reloadData];

  [(UIPrinterBrowserViewController *)self startPrinterBrowser];
  [(UIPrinterBrowserViewController *)self updateSearching];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIPrinterBrowserViewController;
  [(UIPrinterBrowserViewController *)&v7 viewDidDisappear:a3];
  BOOL v4 = [(UIPrinterBrowserViewController *)self lockedPrinter];

  if (v4)
  {
    objc_super v5 = [(UIPrinterBrowserViewController *)self lockedPrinter];
    [v5 cancelUnlock];

    [(UIPrinterBrowserViewController *)self setLockedPrinter:0];
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateSearching object:0];
  [(UIPrinterBrowserViewController *)self stopPrinterBrowser];
  uint64_t v6 = [(UIPrinterBrowserViewController *)self ownerPanelViewController];
  [v6 printerBrowserViewDidDisappear];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  BOOL v4 = [(UIPrinterBrowserViewController *)self ownerPanelViewController];
  LOBYTE(a3) = [v4 shouldAutorotateToInterfaceOrientation:a3];

  return a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = [(UIPrinterBrowserViewController *)self ownerPanelViewController];
  unint64_t v3 = [v2 supportedInterfaceOrientations];

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v4 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
  uint64_t v5 = [v4 count];

  uint64_t v6 = [(UIPrinterBrowserViewController *)self availablePrinters];
  uint64_t v7 = [v6 count];

  unint64_t v8 = v5 != 0;
  uint64_t v9 = 1;
  if (v5) {
    uint64_t v9 = 2;
  }
  if (v7) {
    unint64_t v8 = v9;
  }
  if (v8 <= 1) {
    return 1;
  }
  else {
    return v8;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v7 = a3;
  if (!a4)
  {
    BOOL v4 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
    if ([v4 count])
    {
      v10 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
      int64_t v9 = [v10 count];

LABEL_6:
      goto LABEL_7;
    }
  }
  unint64_t v8 = [(UIPrinterBrowserViewController *)self availablePrinters];
  int64_t v9 = [v8 count];

  if (!a4) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v8 = v7;
    if (a4) {
      int64_t v9 = @"Other Printers";
    }
    else {
      int64_t v9 = @"Known Printers";
    }
    v10 = [v7 localizedStringForKey:v9 value:v9 table:@"Localizable"];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)printerAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 row];
  if ([v4 section]
    || ([(UIPrinterBrowserViewController *)self iCloudPrinters],
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        !v9))
  {
    uint64_t v6 = [(UIPrinterBrowserViewController *)self availablePrinters];
    if (v5 < [v6 count])
    {
      id v7 = [(UIPrinterBrowserViewController *)self availablePrinters];
LABEL_7:
      v10 = v7;
      double v11 = [v7 objectAtIndexedSubscript:v5];

      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
    if (v5 < [v6 count])
    {
      id v7 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
      goto LABEL_7;
    }
  }
  double v11 = 0;
LABEL_9:

  if (!v11)
  {
    uint64_t v12 = [v4 section];
    uint64_t v13 = [v4 row];
    id v14 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
    uint64_t v15 = [v14 count];
    double v16 = [(UIPrinterBrowserViewController *)self availablePrinters];
    NSLog(&cfstr_InvalidPrinter.isa, v12, v13, v15, [v16 count]);
  }
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"PrinterBrowserTableViewCell"];
  if (!v7) {
    id v7 = [[UIPrinterTableViewCell alloc] initWithStyle:3 reuseIdentifier:@"PrinterBrowserTableViewCell"];
  }
  unint64_t v8 = [(UIPrinterBrowserViewController *)self ownerPanelViewController];
  uint64_t v9 = [v8 printer];

  v10 = [(UIPrinterBrowserViewController *)self printerAtIndexPath:v6];

  [(UIPrinterTableViewCell *)v7 setPrinter:v10];
  double v11 = [v10 name];
  uint64_t v12 = [v9 name];
  if ([v11 isEqualToString:v12])
  {
    [(UIPrinterTableViewCell *)v7 setChecked:1];
  }
  else
  {
    uint64_t v13 = [v10 uuid];
    id v14 = [v9 uuid];
    -[UIPrinterTableViewCell setChecked:](v7, "setChecked:", [v13 isEqualToString:v14]);
  }
  [(UIPrinterTableViewCell *)v7 setDelegate:self];
  uint64_t v15 = [(UIPrinterBrowserViewController *)self lockedPrinter];

  if (v15)
  {
    uint64_t v16 = 4;
  }
  else
  {
    unint64_t v17 = [v10 accessState] - 1;
    if (v17 > 2) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = dword_1E15540E8[v17];
    }
  }
  [(UIPrinterTableViewCell *)v7 setPrinterState:v16];
  [(UIPrinterTableViewCell *)v7 layoutIfNeeded];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(UIPrinterBrowserViewController *)self printerAtIndexPath:v7];
  uint64_t v9 = [(UIPrinterBrowserViewController *)self ownerPanelViewController];
  if ([v8 accessState] == 1)
  {
    [(UIPrinterBrowserViewController *)self setLockedPrinter:v8];
    v10 = [v6 cellForRowAtIndexPath:v7];
    [v10 setPrinterState:4];
    double v11 = [(UIPrinterBrowserViewController *)self lockedPrinter];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__UIPrinterBrowserViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v22[3] = &unk_1E6DA1480;
    v22[4] = self;
    id v23 = v9;
    id v24 = v10;
    id v25 = v6;
    id v12 = v10;
    [v11 unlockWithCompletionHandler:v22];

LABEL_3:
    goto LABEL_12;
  }
  if (![v8 accessState] || objc_msgSend(v8, "accessState") == 2)
  {
    [v9 setPrinter:v8];
    if (objc_opt_respondsToSelector()) {
      [v9 setUserSelectedPrinter:1];
    }
    uint64_t v13 = [(UIPrinterBrowserViewController *)self navigationController];
    id v14 = [v13 viewControllers];
    uint64_t v15 = [v14 objectAtIndexedSubscript:0];

    if (v15 == self)
    {
      [v9 dismissAnimated:1];
      goto LABEL_12;
    }
    uint64_t v16 = [(UIPrinterBrowserViewController *)self navigationController];
    unint64_t v17 = [v16 viewControllers];
    double v18 = [(UIPrinterBrowserViewController *)self navigationController];
    double v19 = [v18 viewControllers];
    objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v19, "count") - 1);
    id v20 = (UIPrinterBrowserViewController *)objc_claimAutoreleasedReturnValue();

    if (v20 == self)
    {
      id v12 = [(UIPrinterBrowserViewController *)self navigationController];
      id v21 = (id)[v12 popViewControllerAnimated:1];
      goto LABEL_3;
    }
  }
LABEL_12:
}

void __68__UIPrinterBrowserViewController_tableView_didSelectRowAtIndexPath___block_invoke(id *a1, uint64_t a2)
{
  id v4 = [a1[4] lockedPrinter];

  if (v4)
  {
    if (a2 == 2)
    {
      unint64_t v5 = [a1[4] lockedPrinter];
      [a1[5] setPrinter:v5];

      [a1[6] setPrinterState:2];
      if (objc_opt_respondsToSelector()) {
        [a1[5] setUserSelectedPrinter:1];
      }
      id v6 = [a1[4] navigationController];
      id v7 = [v6 viewControllers];
      id v8 = [v7 objectAtIndexedSubscript:0];
      id v9 = a1[4];

      if (v8 == v9)
      {
        [a1[5] dismissAnimated:1];
      }
      else
      {
        v10 = [a1[4] navigationController];
        double v11 = [v10 viewControllers];
        id v12 = [a1[4] navigationController];
        uint64_t v13 = [v12 viewControllers];
        objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 1);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        id v15 = a1[4];

        if (v14 == v15)
        {
          uint64_t v16 = [a1[4] navigationController];
          id v17 = (id)[v16 popViewControllerAnimated:1];
        }
      }
    }
    else
    {
      [a1[6] setPrinterState:1];
      [a1[7] _deselectAllNonMultiSelectRowsAnimated:1 notifyDelegate:0];
    }
    id v18 = a1[4];
    [v18 setLockedPrinter:0];
  }
}

- (void)addPrinter:(id)a3 moreComing:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__UIPrinterBrowserViewController_addPrinter_moreComing___block_invoke;
  block[3] = &unk_1E6DA14C8;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__UIPrinterBrowserViewController_addPrinter_moreComing___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [v2 discoveredPrinterWithUUID:v3];

  if (v4) {
    return;
  }
  id v39 = [*(id *)(a1 + 32) ownerPanelViewController];
  if (![*(id *)(a1 + 32) shouldFilterPrinters]
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v39 shouldShowPrinter:*(void *)(a1 + 40)] & 1) != 0)
  {
    int v5 = [*(id *)(a1 + 40) isiCloudPrinter];
    id v6 = *(void **)(a1 + 32);
    if (v5)
    {
      id v7 = [v6 iCloudPrinters];
      [v7 addObject:*(void *)(a1 + 40)];

      id v8 = [*(id *)(a1 + 32) iCloudPrinters];
      uint64_t v9 = [v8 indexOfObject:*(void *)(a1 + 40)];

      BOOL v10 = [*(id *)(a1 + 32) iCloudPrinters];
      uint64_t v11 = [v10 count];

      if (v11 == 1) {
        goto LABEL_11;
      }
      id v12 = [*(id *)(a1 + 32) tableView];
      uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
      id v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:0];
      id v15 = v13;
    }
    else
    {
      uint64_t v16 = [v6 availablePrinters];
      [v16 addObject:*(void *)(a1 + 40)];

      id v17 = [*(id *)(a1 + 32) iCloudPrinters];
      uint64_t v18 = [v17 count];

      double v19 = [*(id *)(a1 + 32) availablePrinters];
      [v19 sortUsingComparator:&__block_literal_global];

      id v20 = [*(id *)(a1 + 32) availablePrinters];
      uint64_t v21 = [v20 indexOfObject:*(void *)(a1 + 40)];

      v22 = [*(id *)(a1 + 32) availablePrinters];
      uint64_t v23 = [v22 count];

      if (v23 == 1) {
        goto LABEL_11;
      }
      BOOL v24 = v18 != 0;
      id v12 = [*(id *)(a1 + 32) tableView];
      id v25 = (void *)MEMORY[0x1E4F1C978];
      id v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v21 inSection:v24];
      id v15 = v25;
    }
    objc_super v26 = [v15 arrayWithObject:v14];
    [v12 insertRowsAtIndexPaths:v26 withRowAnimation:0];

    if ([*(id *)(a1 + 32) loaded])
    {
LABEL_12:
      if (*(unsigned char *)(a1 + 48)) {
        goto LABEL_22;
      }
      [*(id *)(a1 + 32) adjustPopoverSize];
      if ([*(id *)(a1 + 32) loaded]) {
        goto LABEL_22;
      }
      v28 = [v39 printer];
      v29 = [*(id *)(a1 + 32) iCloudPrinters];
      unint64_t v30 = [v29 indexOfObject:v28];

      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v31 = [*(id *)(a1 + 32) availablePrinters];
        unint64_t v30 = [v31 indexOfObject:v28];

        v32 = [*(id *)(a1 + 32) iCloudPrinters];
        BOOL v33 = [v32 count] != 0;

        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_21:
          [*(id *)(a1 + 32) setLoaded:1];

LABEL_22:
          [*(id *)(a1 + 32) updateSearching];
          goto LABEL_23;
        }
      }
      else
      {
        BOOL v33 = 0;
      }
      v35 = [*(id *)(a1 + 32) tableView];
      unint64_t v36 = [v35 numberOfRowsInSection:v33];

      if (v30 < v36)
      {
        v37 = [*(id *)(a1 + 32) tableView];
        v38 = [MEMORY[0x1E4F28D58] indexPathForRow:v30 inSection:v33];
        [v37 scrollToRowAtIndexPath:v38 atScrollPosition:2 animated:0];
      }
      goto LABEL_21;
    }
LABEL_11:
    v27 = [*(id *)(a1 + 32) tableView];
    [v27 reloadData];

    goto LABEL_12;
  }
  v34 = [*(id *)(a1 + 32) filteredOutPrinters];
  [v34 addObject:*(void *)(a1 + 40)];

LABEL_23:
}

uint64_t __56__UIPrinterBrowserViewController_addPrinter_moreComing___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 displayName];
  id v6 = [v4 displayName];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (void)removePrinter:(id)a3 moreGoing:(BOOL)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__UIPrinterBrowserViewController_removePrinter_moreGoing___block_invoke;
  v7[3] = &unk_1E6DA14F0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __58__UIPrinterBrowserViewController_removePrinter_moreGoing___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iCloudPrinters];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 32);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v10 = [v4 iCloudPrinters];
    [v10 removeObject:*(void *)(a1 + 40)];

    uint64_t v11 = [*(id *)(a1 + 32) iCloudPrinters];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      BOOL v13 = 0;
LABEL_8:
      uint64_t v9 = [*(id *)(a1 + 32) tableView];
      uint64_t v18 = (void *)MEMORY[0x1E4F1C978];
      double v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v3 inSection:v13];
      id v20 = [v18 arrayWithObject:v19];
      [v9 deleteRowsAtIndexPaths:v20 withRowAnimation:0];

      goto LABEL_10;
    }
LABEL_9:
    uint64_t v9 = [*(id *)(a1 + 32) tableView];
    [v9 reloadData];
    goto LABEL_10;
  }
  id v5 = [v4 availablePrinters];
  uint64_t v3 = [v5 indexOfObject:*(void *)(a1 + 40)];

  id v6 = *(void **)(a1 + 32);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [v6 availablePrinters];
    [v14 removeObject:*(void *)(a1 + 40)];

    id v15 = [*(id *)(a1 + 32) iCloudPrinters];
    BOOL v13 = [v15 count] != 0;

    uint64_t v16 = [*(id *)(a1 + 32) availablePrinters];
    uint64_t v17 = [v16 count];

    if (v17) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v7 = [v6 filteredOutPrinters];
  int v8 = [v7 containsObject:*(void *)(a1 + 40)];

  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v9 = [*(id *)(a1 + 32) filteredOutPrinters];
  [v9 removeObject:*(void *)(a1 + 40)];
LABEL_10:

LABEL_11:
  uint64_t v21 = *(void **)(a1 + 32);
  return [v21 updateSearching];
}

- (void)showCancelButton
{
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v6 = [(UIPrinterBrowserViewController *)self ownerPanelViewController];
  id v4 = (void *)[v3 initWithBarButtonSystemItem:1 target:v6 action:sel_cancelPrinting];
  id v5 = [(UIPrinterBrowserViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];
}

- (id)discoveredPrinterWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__UIPrinterBrowserViewController_discoveredPrinterWithUUID___block_invoke;
  v19[3] = &unk_1E6DA1518;
  id v6 = v4;
  id v20 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v19];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = [(UIPrinterBrowserViewController *)self availablePrinters];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __60__UIPrinterBrowserViewController_discoveredPrinterWithUUID___block_invoke_2;
    uint64_t v17 = &unk_1E6DA1518;
    id v18 = v6;
    uint64_t v9 = [v8 indexOfObjectPassingTest:&v14];

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v10 = 0;
    }
    else
    {
      uint64_t v12 = [(UIPrinterBrowserViewController *)self availablePrinters];
      BOOL v10 = [v12 objectAtIndex:v9];
    }
    uint64_t v11 = v18;
  }
  else
  {
    uint64_t v11 = [(UIPrinterBrowserViewController *)self iCloudPrinters];
    BOOL v10 = [v11 objectAtIndex:v7];
  }

  return v10;
}

uint64_t __60__UIPrinterBrowserViewController_discoveredPrinterWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __60__UIPrinterBrowserViewController_discoveredPrinterWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (double)maximumPopoverHeight
{
  return self->_maximumPopoverHeight;
}

- (void)setMaximumPopoverHeight:(double)a3
{
  self->_maximumPopoverHeight = a3;
}

- (UIPrinterBrowserOwner)ownerPanelViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ownerPanelViewController);
  return (UIPrinterBrowserOwner *)WeakRetained;
}

- (void)setOwnerPanelViewController:(id)a3
{
}

- (PKPrinterBrowser)printerBrowser
{
  return self->_printerBrowser;
}

- (void)setPrinterBrowser:(id)a3
{
}

- (UIPrinterSearchingView)searchingView
{
  return self->_searchingView;
}

- (void)setSearchingView:(id)a3
{
}

- (UIPrintInfo)printInfoForBrowser
{
  return self->_printInfoForBrowser;
}

- (void)setPrintInfoForBrowser:(id)a3
{
}

- (PKPrinter)lockedPrinter
{
  return self->_lockedPrinter;
}

- (void)setLockedPrinter:(id)a3
{
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (BOOL)searchingViewConstraintsSet
{
  return self->_searchingViewConstraintsSet;
}

- (void)setSearchingViewConstraintsSet:(BOOL)a3
{
  self->_searchingViewConstraintsSet = a3;
}

- (NSMutableArray)iCloudPrinters
{
  return self->_iCloudPrinters;
}

- (void)setICloudPrinters:(id)a3
{
}

- (NSMutableArray)availablePrinters
{
  return self->_availablePrinters;
}

- (void)setAvailablePrinters:(id)a3
{
}

- (BOOL)shouldFilterPrinters
{
  return self->_shouldFilterPrinters;
}

- (void)setShouldFilterPrinters:(BOOL)a3
{
  self->_shouldFilterPrinters = a3;
}

- (NSMutableArray)filteredOutPrinters
{
  return self->_filteredOutPrinters;
}

- (void)setFilteredOutPrinters:(id)a3
{
}

- (UIBarButtonItem)iCloudPrintersButton
{
  return self->_iCloudPrintersButton;
}

- (void)setICloudPrintersButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudPrintersButton, 0);
  objc_storeStrong((id *)&self->_filteredOutPrinters, 0);
  objc_storeStrong((id *)&self->_availablePrinters, 0);
  objc_storeStrong((id *)&self->_iCloudPrinters, 0);
  objc_storeStrong((id *)&self->_lockedPrinter, 0);
  objc_storeStrong((id *)&self->_printInfoForBrowser, 0);
  objc_storeStrong((id *)&self->_searchingView, 0);
  objc_storeStrong((id *)&self->_printerBrowser, 0);
  objc_destroyWeak((id *)&self->_ownerPanelViewController);
}

@end