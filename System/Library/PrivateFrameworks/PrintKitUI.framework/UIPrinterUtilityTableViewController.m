@interface UIPrinterUtilityTableViewController
- (BOOL)showIdentifyPrinterItem;
- (BOOL)showRemoveKeychainItem;
- (BOOL)suppliesCheckComplete;
- (NSArray)supplyData;
- (NSString)printerWarning;
- (NSURL)printerSuppliesInfoURL;
- (NSURL)printerWebPageURL;
- (PKPrinter)pkPrinter;
- (UIPrinterAttributesService)printerAttributesService;
- (UIPrinterUtilityTableViewController)initWithPrinter:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)printerNameAndLocationSection;
- (int64_t)printerWebPageRow;
- (int64_t)removeKeychainItemSection;
- (int64_t)suppliesSection;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadPrinterInfoViews;
- (void)setPkPrinter:(id)a3;
- (void)setPrinterAttributesService:(id)a3;
- (void)setPrinterNameAndLocationSection:(int64_t)a3;
- (void)setPrinterSuppliesInfoURL:(id)a3;
- (void)setPrinterWarning:(id)a3;
- (void)setPrinterWebPageRow:(int64_t)a3;
- (void)setPrinterWebPageURL:(id)a3;
- (void)setRemoveKeychainItemSection:(int64_t)a3;
- (void)setShowIdentifyPrinterItem:(BOOL)a3;
- (void)setShowRemoveKeychainItem:(BOOL)a3;
- (void)setSuppliesCheckComplete:(BOOL)a3;
- (void)setSuppliesSection:(int64_t)a3;
- (void)setSupplyData:(id)a3;
- (void)startPrinterWarningPoll;
- (void)stopPrinterWarningPolling;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation UIPrinterUtilityTableViewController

- (void)dealloc
{
  v3 = [(UIPrinterUtilityTableViewController *)self tableView];
  [v3 removeObserver:self forKeyPath:@"frame"];

  v4.receiver = self;
  v4.super_class = (Class)UIPrinterUtilityTableViewController;
  [(UIPrinterUtilityTableViewController *)&v4 dealloc];
}

- (UIPrinterUtilityTableViewController)initWithPrinter:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)UIPrinterUtilityTableViewController;
  v5 = [(UIPrinterUtilityTableViewController *)&v32 initWithStyle:2];
  v6 = v5;
  if (v5)
  {
    [(UIPrinterUtilityTableViewController *)v5 setPkPrinter:v4];
    [(UIPrinterUtilityTableViewController *)v6 setPrinterWebPageRow:-1];
    [(UIPrinterUtilityTableViewController *)v6 setRemoveKeychainItemSection:-1];
    [(UIPrinterUtilityTableViewController *)v6 setPrinterWarning:0];
    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"Printer Info" value:@"Printer Info" table:@"Localizable"];
    [(UIPrinterUtilityTableViewController *)v6 setTitle:v8];

    if (v4)
    {
      objc_initWeak(&location, v6);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke;
      v28[3] = &unk_1E6DA21A0;
      objc_copyWeak(&v30, &location);
      id v9 = v4;
      id v29 = v9;
      if (_UIPrinterInfoGetState(v9, v28) == 1)
      {
        v10 = _UIPrinterInfoHasInfo(v9);
        v11 = [v10 objectForKey:@"PrinterInfoURL"];
        [(UIPrinterUtilityTableViewController *)v6 setPrinterWebPageURL:v11];

        v12 = [v10 objectForKey:@"PrinterSuppliesURL"];
        [(UIPrinterUtilityTableViewController *)v6 setPrinterSuppliesInfoURL:v12];

        if (v10) {
          uint64_t v13 = [v9 hasIdentifyPrinterOp];
        }
        else {
          uint64_t v13 = 0;
        }
        [(UIPrinterUtilityTableViewController *)v6 setShowIdentifyPrinterItem:v13];
        BOOL v14 = [v9 accessState] == 1 || objc_msgSend(v9, "accessState") == 2;
        [(UIPrinterUtilityTableViewController *)v6 setShowRemoveKeychainItem:v14];
        [(UIPrinterUtilityTableViewController *)v6 reloadPrinterInfoViews];
      }
      [(UIPrinterUtilityTableViewController *)v6 setSuppliesCheckComplete:0];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_3;
      v26 = &unk_1E6DA21C8;
      v27 = v6;
      [v9 getSupplyLevels:&v23];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    v15 = [(UIPrinterUtilityTableViewController *)v6 tableView];
    [v15 addObserver:v6 forKeyPath:@"frame" options:0 context:0];

    v16 = [(UIPrinterUtilityTableViewController *)v6 tableView];
    uint64_t v17 = objc_opt_class();
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v16 registerClass:v17 forHeaderFooterViewReuseIdentifier:v19];

    double v20 = *MEMORY[0x1E4FB2F28];
    v21 = [(UIPrinterUtilityTableViewController *)v6 tableView];
    [v21 setSectionFooterHeight:v20];
  }
  return v6;
}

void __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_2;
    block[3] = &unk_1E6DA2178;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    id v7 = v5;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v9);
  }
}

void __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = [a1[4] objectForKey:@"PrinterInfoURL"];
  [WeakRetained setPrinterWebPageURL:v2];

  v3 = [a1[4] objectForKey:@"PrinterSuppliesURL"];
  [WeakRetained setPrinterSuppliesInfoURL:v3];

  if (a1[4]) {
    uint64_t v4 = [a1[5] hasIdentifyPrinterOp];
  }
  else {
    uint64_t v4 = 0;
  }
  [WeakRetained setShowIdentifyPrinterItem:v4];
  BOOL v5 = [a1[5] accessState] == 1 || objc_msgSend(a1[5], "accessState") == 2;
  [WeakRetained setShowRemoveKeychainItem:v5];
  [WeakRetained reloadPrinterInfoViews];
}

void __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_4;
  v5[3] = &unk_1E6DA14F0;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setSuppliesCheckComplete:1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setSupplyData:v3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"frame", a4, a5, a6))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__UIPrinterUtilityTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6DA1408;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __86__UIPrinterUtilityTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) tableView];
  v2 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 32), "suppliesSection"));
  [v3 reloadSections:v2 withRowAnimation:100];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPrinterUtilityTableViewController;
  [(UIPrinterUtilityTableViewController *)&v4 viewDidAppear:a3];
  [(UIPrinterUtilityTableViewController *)self startPrinterWarningPoll];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPrinterUtilityTableViewController;
  [(UIPrinterUtilityTableViewController *)&v4 viewDidDisappear:a3];
  [(UIPrinterUtilityTableViewController *)self stopPrinterWarningPolling];
  [(UIPrinterUtilityTableViewController *)self setPkPrinter:0];
}

- (void)reloadPrinterInfoViews
{
  if ([(UIPrinterUtilityTableViewController *)self isViewLoaded])
  {
    id v3 = [(UIPrinterUtilityTableViewController *)self view];
    objc_super v4 = [v3 window];

    if (v4)
    {
      id v5 = [(UIPrinterUtilityTableViewController *)self tableView];
      [v5 reloadData];
    }
  }
}

- (void)setSupplyData:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_supplyData, a3);
  if ([(UIPrinterUtilityTableViewController *)self isViewLoaded])
  {
    id v5 = [(UIPrinterUtilityTableViewController *)self view];
    id v6 = [v5 window];

    if (v6)
    {
      id v7 = [(UIPrinterUtilityTableViewController *)self tableView];
      id v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", -[UIPrinterUtilityTableViewController suppliesSection](self, "suppliesSection"));
      [v7 reloadSections:v8 withRowAnimation:100];
    }
  }
}

- (void)startPrinterWarningPoll
{
  id v3 = [(UIPrinterUtilityTableViewController *)self printerAttributesService];

  if (!v3)
  {
    objc_super v4 = +[UIPrinterAttributesService instance];
    [(UIPrinterUtilityTableViewController *)self setPrinterAttributesService:v4];
  }
  objc_initWeak(&location, self);
  id v5 = [(UIPrinterUtilityTableViewController *)self pkPrinter];
  id v6 = [v5 name];

  id v7 = [(UIPrinterUtilityTableViewController *)self printerAttributesService];
  id v8 = [(UIPrinterUtilityTableViewController *)self pkPrinter];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__UIPrinterUtilityTableViewController_startPrinterWarningPoll__block_invoke;
  v10[3] = &unk_1E6DA21F0;
  objc_copyWeak(&v13, &location);
  id v9 = v6;
  id v11 = v9;
  v12 = self;
  [v7 startPollForPrinterWarningStatus:v8 completionHandler:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __62__UIPrinterUtilityTableViewController_startPrinterWarningPoll__block_invoke(id *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v11 = v5;
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    if (WeakRetained)
    {
      if ([a1[4] isEqualToString:a1[4]])
      {
        id v7 = [WeakRetained printerWarning];
        uint64_t v8 = [v11 compare:v7];

        if (v8)
        {
          [WeakRetained setPrinterWarning:v11];
          id v9 = [a1[5] tableView];
          v10 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
          [v9 reloadSections:v10 withRowAnimation:100];
        }
      }
    }

    id v5 = v11;
  }
}

- (void)stopPrinterWarningPolling
{
  id v3 = [(UIPrinterUtilityTableViewController *)self printerAttributesService];

  if (v3)
  {
    id v4 = [(UIPrinterUtilityTableViewController *)self printerAttributesService];
    [v4 stopPrinterWarningPolling];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (![(UIPrinterUtilityTableViewController *)self showRemoveKeychainItem]) {
    return 2;
  }
  [(UIPrinterUtilityTableViewController *)self setRemoveKeychainItemSection:2];
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(UIPrinterUtilityTableViewController *)self printerNameAndLocationSection] == a4)
  {
    id v6 = [(UIPrinterUtilityTableViewController *)self printerWebPageURL];

    if (v6)
    {
      [(UIPrinterUtilityTableViewController *)self setPrinterWebPageRow:3];
      return 4;
    }
    else
    {
      return 3;
    }
  }
  else if ([(UIPrinterUtilityTableViewController *)self suppliesSection] == a4)
  {
    uint64_t v8 = [(UIPrinterUtilityTableViewController *)self supplyData];
    if (v8)
    {
      id v9 = [(UIPrinterUtilityTableViewController *)self supplyData];
      int64_t v7 = [v9 count];
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    return 1;
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == [(UIPrinterUtilityTableViewController *)self printerNameAndLocationSection])
  {
    uint64_t v9 = [v7 row];
    if (v9 == [(UIPrinterUtilityTableViewController *)self printerWebPageRow])
    {
      v10 = [v6 dequeueReusableCellWithIdentifier:@"PrinterUtilityPrinterWebPageTableViewCell"];
      if (!v10) {
        v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"PrinterUtilityPrinterWebPageTableViewCell"];
      }
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"Show Printer Web Page" value:@"Show Printer Web Page" table:@"Localizable"];
      id v13 = [v10 textLabel];
      [v13 setText:v12];

      BOOL v14 = [(UIPrinterUtilityTableViewController *)self view];
      v15 = [v14 tintColor];
      v16 = [v10 textLabel];
      [v16 setTextColor:v15];

      uint64_t v17 = [v10 textLabel];
      [v17 setNumberOfLines:0];

      v18 = [v10 textLabel];
      [v18 setLineBreakMode:0];
LABEL_19:

      [v10 setSelectionStyle:3];
      goto LABEL_42;
    }
    v10 = [v6 dequeueReusableCellWithIdentifier:@"PrinterUtilityPrinterNameTableViewCell"];
    if (!v10) {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PrinterUtilityPrinterNameTableViewCell"];
    }
    if ([v7 row])
    {
      if ([v7 row] == 1)
      {
        v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v23 = [v22 localizedStringForKey:@"Location" value:@"Location" table:@"Localizable"];
        uint64_t v24 = [v10 textLabel];
        [v24 setText:v23];

        v25 = [(UIPrinterUtilityTableViewController *)self pkPrinter];
        v26 = [v25 location];
        v27 = [v10 detailTextLabel];
        [v27 setText:v26];

        if ([(UIPrinterUtilityTableViewController *)self showIdentifyPrinterItem]) {
          [v10 setAccessoryType:4];
        }
        goto LABEL_34;
      }
      if ([v7 row] != 2)
      {
LABEL_34:
        [v10 setSelectionStyle:0];
        [v10 setHoverStyle:0];
        goto LABEL_42;
      }
      v55 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v56 = [v55 localizedStringForKey:@"Model" value:@"Model" table:@"Localizable"];
      v57 = [v10 textLabel];
      [v57 setText:v56];

      v51 = [(UIPrinterUtilityTableViewController *)self pkPrinter];
      uint64_t v52 = [v51 makeAndModel];
    }
    else
    {
      v48 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v49 = [v48 localizedStringForKey:@"Name" value:@"Name" table:@"Localizable"];
      v50 = [v10 textLabel];
      [v50 setText:v49];

      v51 = [(UIPrinterUtilityTableViewController *)self pkPrinter];
      uint64_t v52 = [v51 description];
    }
    v58 = (void *)v52;
    v59 = [v10 detailTextLabel];
    [v59 setText:v58];

LABEL_33:
    goto LABEL_34;
  }
  uint64_t v19 = [v7 section];
  if (v19 == [(UIPrinterUtilityTableViewController *)self suppliesSection])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:0];
    double v20 = [v10 textLabel];
    [v20 setNumberOfLines:0];

    v21 = [(UIPrinterUtilityTableViewController *)self supplyData];
    if (v21)
    {
    }
    else if (![v7 row])
    {
      BOOL v63 = [(UIPrinterUtilityTableViewController *)self suppliesCheckComplete];
      v64 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v65 = v64;
      if (v63)
      {
        v66 = [v64 localizedStringForKey:@"Information Not Available" value:@"Information Not Available" table:@"Localizable"];
        v67 = [v10 textLabel];
        [v67 setText:v66];

        [v10 setAccessoryView:0];
        goto LABEL_34;
      }
      v71 = [v64 localizedStringForKey:@"Gathering Supplies Information" value:@"Gathering Supplies Information" table:@"Localizable"];
      v72 = [v10 textLabel];
      [v72 setText:v71];

      v51 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v10 setAccessoryView:v51];
      [v51 startAnimating];
      goto LABEL_33;
    }
    v34 = [(UIPrinterUtilityTableViewController *)self supplyData];
    v35 = objc_msgSend(v34, "objectAtIndex:", objc_msgSend(v7, "row"));

    if (v35)
    {
      v36 = [v35 name];
      v37 = [v36 localizedCapitalizedString];
      v38 = [v10 textLabel];
      [v38 setText:v37];

      if (([v35 level] & 0x80000000) != 0)
      {
        int v60 = [v35 level];
        v61 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v47 = v61;
        if (v60 == -3) {
          v62 = @"Level is OK";
        }
        else {
          v62 = @"Level is unknown";
        }
        v68 = [(UIPrintSupplyLevelView *)v61 localizedStringForKey:v62 value:v62 table:@"Localizable"];
        v69 = [v10 detailTextLabel];
        [v69 setText:v68];
      }
      else
      {
        [v10 frame];
        double v40 = v39;
        v41 = [(UIPrinterUtilityTableViewController *)self tableView];
        [v41 frame];
        double v43 = v42 * 0.33333;

        v44 = [v35 colors];
        if ([v44 count] == 1) {
          double v45 = 20.0;
        }
        else {
          double v45 = 26.0;
        }

        [v10 frame];
        v47 = -[UIPrintSupplyLevelView initWithFrame:supplyInfo:]([UIPrintSupplyLevelView alloc], "initWithFrame:supplyInfo:", v35, v40, (v46 - v45) * 0.5, v43, v45);
        [v10 setAccessoryView:v47];
      }
    }
    else
    {
      v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v53 = [(UIPrintSupplyLevelView *)v47 localizedStringForKey:@"Information Not Available" value:@"Information Not Available" table:@"Localizable"];
      v54 = [v10 textLabel];
      [v54 setText:v53];
    }
    [v10 setSelectionStyle:0];
    [v10 setHoverStyle:0];
  }
  else
  {
    uint64_t v28 = [v7 section];
    if (v28 == [(UIPrinterUtilityTableViewController *)self removeKeychainItemSection])
    {
      v10 = [v6 dequeueReusableCellWithIdentifier:@"PrinterUtilityRemoveKeychainItemTableViewCell"];
      if (!v10) {
        v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"PrinterUtilityRemoveKeychainItemTableViewCell"];
      }
      id v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v30 = [v29 localizedStringForKey:@"Forget Username and Password" value:@"Forget Username and Password" table:@"Localizable"];
      v31 = [v10 textLabel];
      [v31 setText:v30];

      v18 = [(UIPrinterUtilityTableViewController *)self view];
      objc_super v32 = [v18 tintColor];
      v33 = [v10 textLabel];
      [v33 setTextColor:v32];

      goto LABEL_19;
    }
    v10 = 0;
  }
LABEL_42:

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(UIPrinterUtilityTableViewController *)self suppliesSection] == a4)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"Supply Levels" value:@"Supply Levels" table:@"Localizable"];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ([(UIPrinterUtilityTableViewController *)self printerNameAndLocationSection] == a4)
  {
    id v5 = [(UIPrinterUtilityTableViewController *)self printerWarning];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(UIPrinterUtilityTableViewController *)self suppliesSection] == a4)
  {
    id v7 = [(UIPrinterUtilityTableViewController *)self supplyData];

    if (v7)
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      id v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v9];

      v10 = [(UIPrinterUtilityTableViewController *)self printerSuppliesInfoURL];
      id v11 = [(UIPrinterUtilityTableViewController *)self view];
      v12 = [v11 tintColor];
      [v7 updateDisclaimerTextWithInfoURL:v10 tintColor:v12];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 section];
  if (v7 == [(UIPrinterUtilityTableViewController *)self printerNameAndLocationSection]
    && (uint64_t v8 = [v6 row],
        v8 == [(UIPrinterUtilityTableViewController *)self printerWebPageRow]))
  {
    uint64_t v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    v10 = [(UIPrinterUtilityTableViewController *)self printerWebPageURL];
    [v9 openURL:v10 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
  else
  {
    uint64_t v11 = [v6 section];
    if (v11 != [(UIPrinterUtilityTableViewController *)self removeKeychainItemSection]) {
      goto LABEL_7;
    }
    uint64_t v9 = [(UIPrinterUtilityTableViewController *)self pkPrinter];
    [v9 removeCredentialsFromKeychain];
  }

  [v12 deselectRowAtIndexPath:v6 animated:1];
LABEL_7:
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v4 = [(UIPrinterUtilityTableViewController *)self pkPrinter];
  [v4 identifySelf];
}

- (NSArray)supplyData
{
  return self->_supplyData;
}

- (PKPrinter)pkPrinter
{
  return self->_pkPrinter;
}

- (void)setPkPrinter:(id)a3
{
  self->_pkPrinter = (PKPrinter *)a3;
}

- (NSString)printerWarning
{
  return (NSString *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setPrinterWarning:(id)a3
{
}

- (UIPrinterAttributesService)printerAttributesService
{
  return (UIPrinterAttributesService *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setPrinterAttributesService:(id)a3
{
}

- (int64_t)printerNameAndLocationSection
{
  return self->_printerNameAndLocationSection;
}

- (void)setPrinterNameAndLocationSection:(int64_t)a3
{
  self->_printerNameAndLocationSection = a3;
}

- (int64_t)suppliesSection
{
  return self->_suppliesSection;
}

- (void)setSuppliesSection:(int64_t)a3
{
  self->_suppliesSection = a3;
}

- (int64_t)printerWebPageRow
{
  return self->_printerWebPageRow;
}

- (void)setPrinterWebPageRow:(int64_t)a3
{
  self->_printerWebPageRow = a3;
}

- (int64_t)removeKeychainItemSection
{
  return self->_removeKeychainItemSection;
}

- (void)setRemoveKeychainItemSection:(int64_t)a3
{
  self->_removeKeychainItemSection = a3;
}

- (BOOL)showIdentifyPrinterItem
{
  return self->_showIdentifyPrinterItem;
}

- (void)setShowIdentifyPrinterItem:(BOOL)a3
{
  self->_showIdentifyPrinterItem = a3;
}

- (BOOL)showRemoveKeychainItem
{
  return self->_showRemoveKeychainItem;
}

- (void)setShowRemoveKeychainItem:(BOOL)a3
{
  self->_showRemoveKeychainItem = a3;
}

- (NSURL)printerSuppliesInfoURL
{
  return (NSURL *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setPrinterSuppliesInfoURL:(id)a3
{
}

- (NSURL)printerWebPageURL
{
  return (NSURL *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setPrinterWebPageURL:(id)a3
{
}

- (BOOL)suppliesCheckComplete
{
  return self->_suppliesCheckComplete;
}

- (void)setSuppliesCheckComplete:(BOOL)a3
{
  self->_suppliesCheckComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerWebPageURL, 0);
  objc_storeStrong((id *)&self->_printerSuppliesInfoURL, 0);
  objc_storeStrong((id *)&self->_printerAttributesService, 0);
  objc_storeStrong((id *)&self->_printerWarning, 0);
  objc_storeStrong((id *)&self->_supplyData, 0);
}

@end