@interface UIPrintOptionsTableViewController
- (BOOL)canDismissPrintOptions;
- (BOOL)keyboardShowing;
- (BOOL)showingGatheringPrinterInfo;
- (NSArray)printOptionSections;
- (NSString)printerWarnings;
- (UIPrintAppOptionsProtocol)appOptionsViewController;
- (UIPrintAppOptionsSection)appOptionsSection;
- (UIPrintFinishingOptionsSection)finishingOptionsSection;
- (UIPrintInfo)printInfo;
- (UIPrintLayoutSection)layoutSection;
- (UIPrintMediaQualitySection)mediaQualitySection;
- (UIPrintMoreOptionsSection)moreOptionsSection;
- (UIPrintOptionsTableViewController)initWithTableView:(id)a3 printInfo:(id)a4 printPanelViewController:(id)a5;
- (UIPrintPanelViewController)printPanelViewController;
- (UIPrintScalingSection)scalingSection;
- (UIPrintStandardOptionsSection)standardOptionsSection;
- (UIPrinter)currentPrinter;
- (UIPrinterAttributesService)printerAttributesService;
- (id)printOptionAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)appOptionsSectionNum;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)printOptionsSectionNum;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)dismissKeyboard;
- (void)hideGatheringPrinterInfo;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppOptionsSection:(id)a3;
- (void)setAppOptionsSectionNum:(int64_t)a3;
- (void)setAppOptionsViewController:(id)a3;
- (void)setCurrentPrinter:(id)a3;
- (void)setFinishingOptionsSection:(id)a3;
- (void)setLayoutSection:(id)a3;
- (void)setMediaQualitySection:(id)a3;
- (void)setMoreOptionsSection:(id)a3;
- (void)setPrintInfo:(id)a3;
- (void)setPrintOptionSections:(id)a3;
- (void)setPrintOptionsSectionNum:(int64_t)a3;
- (void)setPrintPanelViewController:(id)a3;
- (void)setPrinterAttributesService:(id)a3;
- (void)setPrinterWarnings:(id)a3;
- (void)setScalingSection:(id)a3;
- (void)setShowContactingPrinter:(BOOL)a3;
- (void)setShowingGatheringPrinterInfo:(BOOL)a3;
- (void)setStandardOptionsSection:(id)a3;
- (void)showGatheringPrinterInfo;
- (void)startPrinterWarningPoll;
- (void)stopPrinterWarningPolling;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updatePrintSectionList;
- (void)updateWarnings:(id)a3 forPrinter:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIPrintOptionsTableViewController

- (UIPrintOptionsTableViewController)initWithTableView:(id)a3 printInfo:(id)a4 printPanelViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v44.receiver = self;
  v44.super_class = (Class)UIPrintOptionsTableViewController;
  v11 = [(UIPrintOptionsTableViewController *)&v44 initWithStyle:2];
  v12 = v11;
  if (v11)
  {
    [(UIPrintOptionsTableViewController *)v11 setPrintPanelViewController:v10];
    v13 = [v10 printInteractionController];
    v14 = [v13 appOptionsViewController];
    [(UIPrintOptionsTableViewController *)v12 setAppOptionsViewController:v14];

    [(UIPrintOptionsTableViewController *)v12 setPrintInfo:v9];
    [(UIPrintOptionsTableViewController *)v12 setTableView:v8];
    [v8 setDelegate:v12];
    [v8 setDataSource:v12];
    v15 = [UIPrintStandardOptionsSection alloc];
    v16 = [(UIPrintOptionsTableViewController *)v12 printInfo];
    v17 = [(UIPrintStandardOptionsSection *)v15 initWithPrintInfo:v16 printPanelViewController:v10];
    [(UIPrintOptionsTableViewController *)v12 setStandardOptionsSection:v17];

    v18 = [UIPrintMoreOptionsSection alloc];
    v19 = [(UIPrintOptionsTableViewController *)v12 printInfo];
    v20 = [(UIPrintMoreOptionsSection *)v18 initWithPrintInfo:v19 printPanelViewController:v10];
    [(UIPrintOptionsTableViewController *)v12 setMoreOptionsSection:v20];

    v21 = [UIPrintMediaQualitySection alloc];
    v22 = [(UIPrintOptionsTableViewController *)v12 printInfo];
    v23 = [(UIPrintMediaQualitySection *)v21 initWithPrintInfo:v22 printPanelViewController:v10];
    [(UIPrintOptionsTableViewController *)v12 setMediaQualitySection:v23];

    v24 = [UIPrintLayoutSection alloc];
    v25 = [(UIPrintOptionsTableViewController *)v12 printInfo];
    v26 = [(UIPrintLayoutSection *)v24 initWithPrintInfo:v25 printPanelViewController:v10];
    [(UIPrintOptionsTableViewController *)v12 setLayoutSection:v26];

    v27 = [UIPrintScalingSection alloc];
    v28 = [(UIPrintOptionsTableViewController *)v12 printInfo];
    v29 = [(UIPrintScalingSection *)v27 initWithPrintInfo:v28 printPanelViewController:v10];
    [(UIPrintOptionsTableViewController *)v12 setScalingSection:v29];

    v30 = [UIPrintFinishingOptionsSection alloc];
    v31 = [(UIPrintOptionsTableViewController *)v12 printInfo];
    v32 = [(UIPrintFinishingOptionsSection *)v30 initWithPrintInfo:v31 printPanelViewController:v10];
    [(UIPrintOptionsTableViewController *)v12 setFinishingOptionsSection:v32];

    v33 = [(UIPrintOptionsTableViewController *)v12 appOptionsViewController];

    if (v33)
    {
      v34 = [UIPrintAppOptionsSection alloc];
      v35 = [(UIPrintOptionsTableViewController *)v12 printInfo];
      v36 = [(UIPrintOptionsTableViewController *)v12 appOptionsViewController];
      v37 = [(UIPrintAppOptionsSection *)v34 initWithPrintInfo:v35 printPanelViewController:v10 appOptionsViewController:v36];
      [(UIPrintOptionsTableViewController *)v12 setAppOptionsSection:v37];
    }
    [(UIPrintOptionsTableViewController *)v12 updatePrintSectionList];
    [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"UIPrintOptionCell"];
    [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"UIPrintOptionListCell"];
    [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"UIPrintOptionViewCell"];
    uint64_t v38 = objc_opt_class();
    v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    [v8 registerClass:v38 forHeaderFooterViewReuseIdentifier:v40];

    [v8 setSectionFooterHeight:*MEMORY[0x1E4FB2F28]];
    [v8 setEstimatedSectionFooterHeight:10.0];
    v41 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v12 action:sel_dismissKeyboard];
    [v41 setCancelsTouchesInView:0];
    v42 = [(UIPrintOptionsTableViewController *)v12 view];
    [v42 addGestureRecognizer:v41];
  }
  return v12;
}

- (void)dealloc
{
  v3 = [(UIPrintOptionsTableViewController *)self currentPrinter];
  [v3 removeObserver:self forKeyPath:0x1F3C9EE98];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintOptionsTableViewController;
  [(UIPrintOptionsTableViewController *)&v4 dealloc];
}

- (BOOL)keyboardShowing
{
  v2 = [(UIPrintOptionsTableViewController *)self moreOptionsSection];
  char v3 = [v2 keyboardShowing];

  return v3;
}

- (void)dismissKeyboard
{
  id v2 = [(UIPrintOptionsTableViewController *)self moreOptionsSection];
  [v2 dismissKeyboard];
}

- (void)updatePrintSectionList
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__UIPrintOptionsTableViewController_updatePrintSectionList__block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__UIPrintOptionsTableViewController_updatePrintSectionList__block_invoke(uint64_t a1)
{
  id v35 = [MEMORY[0x1E4F1CA48] array];
  id v2 = [*(id *)(a1 + 32) standardOptionsSection];
  int v34 = [v2 updatePrintOptionsList];

  char v3 = [*(id *)(a1 + 32) moreOptionsSection];
  int v4 = [v3 updatePrintOptionsList];

  v5 = [*(id *)(a1 + 32) appOptionsSection];

  v6 = [*(id *)(a1 + 32) printOptionSections];
  v7 = [*(id *)(a1 + 32) mediaQualitySection];
  uint64_t v8 = [v6 indexOfObject:v7];
  BOOL v9 = v8 == 0x7FFFFFFFFFFFFFFFLL;

  id v10 = [*(id *)(a1 + 32) mediaQualitySection];
  LODWORD(v7) = [v10 shouldShow];

  if (v7)
  {
    v11 = [*(id *)(a1 + 32) mediaQualitySection];
    [v35 addObject:v11];
  }
  else
  {
    BOOL v9 = v8 != 0x7FFFFFFFFFFFFFFFLL;
  }
  v12 = [*(id *)(a1 + 32) printOptionSections];
  v13 = [*(id *)(a1 + 32) layoutSection];
  uint64_t v14 = [v12 indexOfObject:v13];
  BOOL v15 = v14 == 0x7FFFFFFFFFFFFFFFLL;

  v16 = [*(id *)(a1 + 32) layoutSection];
  LODWORD(v13) = [v16 shouldShow];

  if (v13)
  {
    v17 = [*(id *)(a1 + 32) layoutSection];
    [v35 addObject:v17];
  }
  else
  {
    BOOL v15 = v14 != 0x7FFFFFFFFFFFFFFFLL;
  }
  v18 = [*(id *)(a1 + 32) printOptionSections];
  v19 = [*(id *)(a1 + 32) scalingSection];
  uint64_t v20 = [v18 indexOfObject:v19];
  BOOL v21 = v20 == 0x7FFFFFFFFFFFFFFFLL;

  v22 = [*(id *)(a1 + 32) scalingSection];
  LODWORD(v19) = [v22 shouldShow];

  if (v19)
  {
    v23 = [*(id *)(a1 + 32) scalingSection];
    [v35 addObject:v23];
  }
  else
  {
    BOOL v21 = v20 != 0x7FFFFFFFFFFFFFFFLL;
  }
  int v24 = v21 || v15 || v9;
  if (v5) {
    int v24 = 1;
  }
  int v25 = v24 | v4 | v34;
  v26 = [*(id *)(a1 + 32) printOptionSections];
  v27 = [*(id *)(a1 + 32) finishingOptionsSection];
  uint64_t v28 = [v26 indexOfObject:v27];

  v29 = [*(id *)(a1 + 32) finishingOptionsSection];
  LODWORD(v27) = [v29 shouldShow];

  if (v27)
  {
    v30 = [*(id *)(a1 + 32) finishingOptionsSection];
    [v35 addObject:v30];

    if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
      char v31 = 1;
    }
    else {
      char v31 = v25;
    }
    [*(id *)(a1 + 32) setPrintOptionSections:v35];
    if ((v31 & 1) == 0) {
      goto LABEL_23;
    }
  }
  else
  {
    if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
      int v32 = v25;
    }
    else {
      int v32 = 1;
    }
    [*(id *)(a1 + 32) setPrintOptionSections:v35];
    if (v32 != 1) {
      goto LABEL_23;
    }
  }
  v33 = [*(id *)(a1 + 32) tableView];
  [v33 reloadData];

LABEL_23:
}

- (BOOL)canDismissPrintOptions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [(UIPrintOptionsTableViewController *)self standardOptionsSection];
  int v4 = [v3 canDismiss];

  if (!v4) {
    return 0;
  }
  v5 = [(UIPrintOptionsTableViewController *)self moreOptionsSection];
  int v6 = [v5 canDismiss];

  if (!v6) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = [(UIPrintOptionsTableViewController *)self printOptionSections];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (![*(id *)(*((void *)&v14 + 1) + 8 * i) canDismiss])
        {
          BOOL v12 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (void)setCurrentPrinter:(id)a3
{
  int v4 = (UIPrinter *)a3;
  [(UIPrinter *)self->_currentPrinter removeObserver:self forKeyPath:0x1F3C9EE98];
  currentPrinter = self->_currentPrinter;
  self->_currentPrinter = v4;
  int v6 = v4;

  [(UIPrinter *)self->_currentPrinter addObserver:self forKeyPath:0x1F3C9EE98 options:0 context:0];
  [(UIPrintOptionsTableViewController *)self stopPrinterWarningPolling];
  [(UIPrintOptionsTableViewController *)self setPrinterWarnings:0];
  [(UIPrintOptionsTableViewController *)self startPrinterWarningPoll];
  [(UIPrintOptionsTableViewController *)self updatePrintSectionList];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", 0x1F3C9EE98, a4, a5, a6))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__UIPrintOptionsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6DA1408;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __84__UIPrintOptionsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePrintSectionList];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int v4 = [(UIPrintOptionsTableViewController *)self appOptionsSection];

  if (v4)
  {
    [(UIPrintOptionsTableViewController *)self setAppOptionsSectionNum:2];
    int64_t v5 = 3;
  }
  else
  {
    int64_t v5 = 2;
  }
  int v6 = [(UIPrintOptionsTableViewController *)self printOptionSections];
  uint64_t v7 = [v6 count];

  if (v7) {
    [(UIPrintOptionsTableViewController *)self setPrintOptionsSectionNum:v5++];
  }
  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = [(UIPrintOptionsTableViewController *)self moreOptionsSection];
    goto LABEL_5;
  }
  if (!a4)
  {
    uint64_t v7 = [(UIPrintOptionsTableViewController *)self standardOptionsSection];
LABEL_5:
    uint64_t v8 = v7;
    uint64_t v9 = [v7 printOptions];
    int64_t v10 = [v9 count];

LABEL_10:
    goto LABEL_11;
  }
  if ([(UIPrintOptionsTableViewController *)self appOptionsSectionNum] != a4
    || ([(UIPrintOptionsTableViewController *)self appOptionsSection],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    uint64_t v8 = [(UIPrintOptionsTableViewController *)self printOptionSections];
    int64_t v10 = [v8 count];
    goto LABEL_10;
  }
  int64_t v10 = 1;
LABEL_11:

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4) {
    goto LABEL_2;
  }
  uint64_t v8 = [(UIPrintOptionsTableViewController *)self printerWarnings];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    int64_t v10 = [(UIPrintOptionsTableViewController *)self printerWarnings];
    if ([v10 length])
    {

LABEL_9:
      BOOL v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      uint64_t v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v13];

      if ([(UIPrintOptionsTableViewController *)self showingGatheringPrinterInfo])
      {
        long long v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        long long v15 = [v14 localizedStringForKey:@"Gathering printer information" value:@"Gathering printer information" table:@"Localizable"];
        [v7 setMessageText:v15];
      }
      else
      {
        long long v14 = [(UIPrintOptionsTableViewController *)self printerWarnings];
        [v7 setMessageText:v14];
      }

      objc_msgSend(v7, "setSpinSpinner:", -[UIPrintOptionsTableViewController showingGatheringPrinterInfo](self, "showingGatheringPrinterInfo"));
      goto LABEL_13;
    }
    BOOL v11 = [(UIPrintOptionsTableViewController *)self showingGatheringPrinterInfo];

    if (v11) {
      goto LABEL_9;
    }
  }
  else if ([(UIPrintOptionsTableViewController *)self showingGatheringPrinterInfo])
  {
    goto LABEL_9;
  }
LABEL_2:
  uint64_t v7 = 0;
LABEL_13:

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  uint64_t v9 = [v7 section];

  if (v9 == 1)
  {
    int64_t v10 = [(UIPrintOptionsTableViewController *)self moreOptionsSection];
    goto LABEL_5;
  }
  if (!v9)
  {
    int64_t v10 = [(UIPrintOptionsTableViewController *)self standardOptionsSection];
LABEL_5:
    BOOL v11 = v10;
    BOOL v12 = [v10 printOptions];
    v13 = [v12 objectAtIndex:v8];

    long long v14 = [v13 printOptionTableViewCell];
    goto LABEL_13;
  }
  if (v9 == [(UIPrintOptionsTableViewController *)self appOptionsSectionNum]
    && ([(UIPrintOptionsTableViewController *)self appOptionsSection],
        long long v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    v13 = [(UIPrintOptionsTableViewController *)self appOptionsSection];
  }
  else
  {
    long long v16 = [(UIPrintOptionsTableViewController *)self printOptionSections];
    v13 = [v16 objectAtIndex:v8];
  }
  long long v14 = [v6 dequeueReusableCellWithIdentifier:@"PrintSectionCell"];
  if (!v14) {
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PrintSectionCell"];
  }
  long long v17 = [MEMORY[0x1E4FB1948] cellConfiguration];
  v18 = [v13 title];
  [v17 setText:v18];

  uint64_t v19 = [v13 summaryString];
  [v17 setSecondaryText:v19];

  uint64_t v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  BOOL v21 = [v17 secondaryTextProperties];
  [v21 setColor:v20];

  [v14 setContentConfiguration:v17];
  v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v14 setTintColor:v22];

  [v13 setTableViewCell:v14];
  [v14 setAccessoryType:1];
  [v14 setSelectionStyle:3];

LABEL_13:
  return v14;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIPrintOptionsTableViewController;
  [(UIPrintOptionsTableViewController *)&v8 viewWillAppear:a3];
  int v4 = [(UIPrintOptionsTableViewController *)self printPanelViewController];
  int64_t v5 = [(UIPrintOptionsTableViewController *)self navigationItem];
  [v4 addPrintShareButtonsToNavItem:v5];

  id v6 = [(UIPrintOptionsTableViewController *)self printPanelViewController];
  id v7 = [(UIPrintOptionsTableViewController *)self navigationItem];
  [v6 addCanelButtonToNavItem:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPrintOptionsTableViewController;
  [(UIPrintOptionsTableViewController *)&v4 viewDidAppear:a3];
  [(UIPrintOptionsTableViewController *)self startPrinterWarningPoll];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPrintOptionsTableViewController;
  [(UIPrintOptionsTableViewController *)&v4 viewDidDisappear:a3];
  [(UIPrintOptionsTableViewController *)self stopPrinterWarningPolling];
}

- (id)printOptionAtIndexPath:(id)a3
{
  id v4 = a3;
  if (![v4 section])
  {
    int64_t v5 = [(UIPrintOptionsTableViewController *)self standardOptionsSection];
    goto LABEL_5;
  }
  if ([v4 section] == 1)
  {
    int64_t v5 = [(UIPrintOptionsTableViewController *)self moreOptionsSection];
LABEL_5:
    id v6 = v5;
    id v7 = [v5 printOptions];
    objc_super v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "row"));

    goto LABEL_7;
  }
  objc_super v8 = 0;
LABEL_7:

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  if ([v10 section] > 1)
  {
    uint64_t v6 = [v10 section];
    if (v6 == [(UIPrintOptionsTableViewController *)self appOptionsSectionNum]
      && ([(UIPrintOptionsTableViewController *)self appOptionsSection],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      objc_super v8 = [(UIPrintOptionsTableViewController *)self appOptionsSection];
      int64_t v5 = v8;
    }
    else
    {
      uint64_t v9 = [(UIPrintOptionsTableViewController *)self printOptionSections];
      int64_t v5 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v10, "row"));

      objc_super v8 = v5;
    }
    [v8 didSelectPrintOptionSection];
  }
  else
  {
    int64_t v5 = [(UIPrintOptionsTableViewController *)self printOptionAtIndexPath:v10];
    [v5 didSelectPrintOption];
  }
}

- (void)showGatheringPrinterInfo
{
  if ([(UIPrintOptionsTableViewController *)self showingGatheringPrinterInfo])
  {
    id v4 = [(UIPrintOptionsTableViewController *)self tableView];
    char v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v4 _reloadSectionHeaderFooters:v3 withRowAnimation:100];
  }
}

- (void)hideGatheringPrinterInfo
{
  if (![(UIPrintOptionsTableViewController *)self showingGatheringPrinterInfo])
  {
    id v4 = [(UIPrintOptionsTableViewController *)self tableView];
    char v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v4 _reloadSectionHeaderFooters:v3 withRowAnimation:100];
  }
}

- (void)setShowingGatheringPrinterInfo:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F1CAC0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showGatheringPrinterInfo object:0];
  [MEMORY[0x1E4F1CAC0] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideGatheringPrinterInfo object:0];
  if (self->_showingGatheringPrinterInfo != v3)
  {
    if (v3)
    {
      self->_showingGatheringPrinterInfo = 1;
      int64_t v5 = v8;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      uint64_t v6 = __68__UIPrintOptionsTableViewController_setShowingGatheringPrinterInfo___block_invoke;
    }
    else
    {
      self->_showingGatheringPrinterInfo = 0;
      int64_t v5 = v7;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      uint64_t v6 = __68__UIPrintOptionsTableViewController_setShowingGatheringPrinterInfo___block_invoke_2;
    }
    v5[2] = v6;
    v5[3] = &unk_1E6DA1408;
    v5[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __68__UIPrintOptionsTableViewController_setShowingGatheringPrinterInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:sel_showGatheringPrinterInfo withObject:0 afterDelay:1.0];
}

uint64_t __68__UIPrintOptionsTableViewController_setShowingGatheringPrinterInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:sel_hideGatheringPrinterInfo withObject:0];
}

- (void)setShowContactingPrinter:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(UIPrintOptionsTableViewController *)self setPrinterWarnings:0];
    [(UIPrintOptionsTableViewController *)self stopPrinterWarningPolling];
  }
  else
  {
    [(UIPrintOptionsTableViewController *)self startPrinterWarningPoll];
  }
  id v5 = [(UIPrintOptionsTableViewController *)self standardOptionsSection];
  [v5 setShowContactingPrinter:v3];
}

- (void)updateWarnings:(id)a3 forPrinter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIPrintOptionsTableViewController *)self currentPrinter];
  if (v8 == v7)
  {
    uint64_t v9 = [(UIPrintOptionsTableViewController *)self printerWarnings];
    char v10 = [v9 isEqual:v6];

    if ((v10 & 1) == 0)
    {
      [(UIPrintOptionsTableViewController *)self setPrinterWarnings:v6];
      if (![(UIPrintOptionsTableViewController *)self showingGatheringPrinterInfo])
      {
        if (pthread_main_np() == 1)
        {
          BOOL v11 = [(UIPrintOptionsTableViewController *)self tableView];
          BOOL v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
          [v11 _reloadSectionHeaderFooters:v12 withRowAnimation:1];
        }
        else
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __63__UIPrintOptionsTableViewController_updateWarnings_forPrinter___block_invoke;
          block[3] = &unk_1E6DA1408;
          block[4] = self;
          dispatch_sync(MEMORY[0x1E4F14428], block);
        }
      }
    }
  }
  else
  {
  }
}

void __63__UIPrintOptionsTableViewController_updateWarnings_forPrinter___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v2 _reloadSectionHeaderFooters:v1 withRowAnimation:1];
}

- (void)startPrinterWarningPoll
{
  BOOL v3 = [(UIPrintOptionsTableViewController *)self printerAttributesService];

  if (!v3)
  {
    id v4 = +[UIPrinterAttributesService instance];
    [(UIPrintOptionsTableViewController *)self setPrinterAttributesService:v4];
  }
  objc_initWeak(&location, self);
  id v5 = [(UIPrintOptionsTableViewController *)self currentPrinter];
  printerAttributesService = self->_printerAttributesService;
  id v7 = [v5 _internalPrinter];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__UIPrintOptionsTableViewController_startPrinterWarningPoll__block_invoke;
  v9[3] = &unk_1E6DA2218;
  objc_copyWeak(&v11, &location);
  id v8 = v5;
  id v10 = v8;
  [(UIPrinterAttributesService *)printerAttributesService startPollForPrinterWarningStatus:v7 completionHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__UIPrintOptionsTableViewController_startPrinterWarningPoll__block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    id v4 = (id *)(a1 + 40);
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained(v4);
    [WeakRetained updateWarnings:v5 forPrinter:*(void *)(a1 + 32)];
  }
}

- (void)stopPrinterWarningPolling
{
  BOOL v3 = [(UIPrintOptionsTableViewController *)self printerAttributesService];

  if (v3)
  {
    id v4 = [(UIPrintOptionsTableViewController *)self printerAttributesService];
    [v4 stopPrinterWarningPolling];
  }
}

- (UIPrinter)currentPrinter
{
  return self->_currentPrinter;
}

- (UIPrintAppOptionsProtocol)appOptionsViewController
{
  return self->_appOptionsViewController;
}

- (void)setAppOptionsViewController:(id)a3
{
}

- (BOOL)showingGatheringPrinterInfo
{
  return self->_showingGatheringPrinterInfo;
}

- (UIPrintPanelViewController)printPanelViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPanelViewController);
  return (UIPrintPanelViewController *)WeakRetained;
}

- (void)setPrintPanelViewController:(id)a3
{
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
}

- (int64_t)appOptionsSectionNum
{
  return self->_appOptionsSectionNum;
}

- (void)setAppOptionsSectionNum:(int64_t)a3
{
  self->_appOptionsSectionNum = a3;
}

- (int64_t)printOptionsSectionNum
{
  return self->_printOptionsSectionNum;
}

- (void)setPrintOptionsSectionNum:(int64_t)a3
{
  self->_printOptionsSectionNum = a3;
}

- (NSArray)printOptionSections
{
  return self->_printOptionSections;
}

- (void)setPrintOptionSections:(id)a3
{
}

- (UIPrintStandardOptionsSection)standardOptionsSection
{
  return self->_standardOptionsSection;
}

- (void)setStandardOptionsSection:(id)a3
{
}

- (UIPrintMoreOptionsSection)moreOptionsSection
{
  return self->_moreOptionsSection;
}

- (void)setMoreOptionsSection:(id)a3
{
}

- (UIPrintAppOptionsSection)appOptionsSection
{
  return self->_appOptionsSection;
}

- (void)setAppOptionsSection:(id)a3
{
}

- (UIPrintMediaQualitySection)mediaQualitySection
{
  return self->_mediaQualitySection;
}

- (void)setMediaQualitySection:(id)a3
{
}

- (UIPrintLayoutSection)layoutSection
{
  return self->_layoutSection;
}

- (void)setLayoutSection:(id)a3
{
}

- (UIPrintScalingSection)scalingSection
{
  return self->_scalingSection;
}

- (void)setScalingSection:(id)a3
{
}

- (UIPrintFinishingOptionsSection)finishingOptionsSection
{
  return self->_finishingOptionsSection;
}

- (void)setFinishingOptionsSection:(id)a3
{
}

- (UIPrinterAttributesService)printerAttributesService
{
  return self->_printerAttributesService;
}

- (void)setPrinterAttributesService:(id)a3
{
}

- (NSString)printerWarnings
{
  return self->_printerWarnings;
}

- (void)setPrinterWarnings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerWarnings, 0);
  objc_storeStrong((id *)&self->_printerAttributesService, 0);
  objc_storeStrong((id *)&self->_finishingOptionsSection, 0);
  objc_storeStrong((id *)&self->_scalingSection, 0);
  objc_storeStrong((id *)&self->_layoutSection, 0);
  objc_storeStrong((id *)&self->_mediaQualitySection, 0);
  objc_storeStrong((id *)&self->_appOptionsSection, 0);
  objc_storeStrong((id *)&self->_moreOptionsSection, 0);
  objc_storeStrong((id *)&self->_standardOptionsSection, 0);
  objc_storeStrong((id *)&self->_printOptionSections, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_destroyWeak((id *)&self->_printPanelViewController);
  objc_storeStrong((id *)&self->_appOptionsViewController, 0);
  objc_storeStrong((id *)&self->_currentPrinter, 0);
}

@end