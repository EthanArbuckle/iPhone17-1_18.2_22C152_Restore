@interface UIPrintMediaQualitySection
- (BOOL)updatePrintOptionsList;
- (UIPrintFeedFromOption)feedFromPrintOption;
- (UIPrintMediaQualitySection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrintMediaTypeOption)mediaTypePrintOption;
- (UIPrintQualityOption)qualityPrintOption;
- (UITableViewController)mediaQualitySectionController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)feedFromRow;
- (int64_t)mediaTypeRow;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)qualitySectionNum;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)currentPrinterChanged;
- (void)dealloc;
- (void)didSelectPrintOptionSection;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFeedFromPrintOption:(id)a3;
- (void)setFeedFromRow:(int64_t)a3;
- (void)setMediaQualitySectionController:(id)a3;
- (void)setMediaTypePrintOption:(id)a3;
- (void)setMediaTypeRow:(int64_t)a3;
- (void)setQualityPrintOption:(id)a3;
- (void)setQualitySectionNum:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation UIPrintMediaQualitySection

- (UIPrintMediaQualitySection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIPrintMediaQualitySection;
  v8 = [(UIPrintOptionSection *)&v19 initWithPrintInfo:v6 printPanelViewController:v7];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"Media & Quality" value:@"Media & Quality" table:@"Localizable"];
    [(UIPrintOptionSection *)v8 setTitle:v10];

    v11 = [[UIPrintFeedFromOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintMediaQualitySection *)v8 setFeedFromPrintOption:v11];

    v12 = [[UIPrintMediaTypeOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintMediaQualitySection *)v8 setMediaTypePrintOption:v12];

    v13 = [[UIPrintQualityOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintMediaQualitySection *)v8 setQualityPrintOption:v13];

    [(UIPrintMediaQualitySection *)v8 updatePrintOptionsList];
    v14 = [(UIPrintMediaQualitySection *)v8 feedFromPrintOption];
    [v14 addObserver:v8 forKeyPath:@"summary" options:0 context:0];

    v15 = [(UIPrintMediaQualitySection *)v8 mediaTypePrintOption];
    [v15 addObserver:v8 forKeyPath:@"summary" options:0 context:0];

    v16 = [(UIPrintMediaQualitySection *)v8 qualityPrintOption];
    [v16 addObserver:v8 forKeyPath:@"summary" options:0 context:0];

    v17 = [(UIPrintOptionSection *)v8 printInfo];
    [v17 addObserver:v8 forKeyPath:0x1F3C9DE58 options:0 context:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(UIPrintMediaQualitySection *)self feedFromPrintOption];
  [v3 removeObserver:self forKeyPath:@"summary"];

  v4 = [(UIPrintMediaQualitySection *)self mediaTypePrintOption];
  [v4 removeObserver:self forKeyPath:@"summary"];

  v5 = [(UIPrintMediaQualitySection *)self qualityPrintOption];
  [v5 removeObserver:self forKeyPath:@"summary"];

  id v6 = [(UIPrintOptionSection *)self printInfo];
  [v6 removeObserver:self forKeyPath:0x1F3C9DE58];

  v7.receiver = self;
  v7.super_class = (Class)UIPrintMediaQualitySection;
  [(UIPrintMediaQualitySection *)&v7 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__UIPrintMediaQualitySection_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __77__UIPrintMediaQualitySection_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEqualToString:0x1F3C9DE58];
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    return [v3 currentPrinterChanged];
  }
  else
  {
    return [v3 updateSectionSummary];
  }
}

- (void)currentPrinterChanged
{
  [(UIPrintMediaQualitySection *)self updatePrintOptionsList];
  [(UIPrintOptionSection *)self updateSectionSummary];
}

- (BOOL)updatePrintOptionsList
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  [(UIPrintMediaQualitySection *)self setFeedFromRow:-1];
  [(UIPrintMediaQualitySection *)self setMediaTypeRow:-1];
  [(UIPrintMediaQualitySection *)self setQualitySectionNum:-1];
  v4 = [(UIPrintMediaQualitySection *)self feedFromPrintOption];
  int v5 = [v4 shouldShow];

  if (v5)
  {
    id v6 = [(UIPrintMediaQualitySection *)self feedFromPrintOption];
    [v3 addObject:v6];

    [(UIPrintMediaQualitySection *)self setFeedFromRow:0];
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = [(UIPrintMediaQualitySection *)self mediaTypePrintOption];
  int v9 = [v8 shouldShow];

  if (v9)
  {
    id v10 = [(UIPrintMediaQualitySection *)self mediaTypePrintOption];
    [v3 addObject:v10];

    [(UIPrintMediaQualitySection *)self setMediaTypeRow:v7];
    uint64_t v7 = 1;
  }
  v11 = [(UIPrintMediaQualitySection *)self qualityPrintOption];
  int v12 = [v11 shouldShow];

  if (v12)
  {
    v13 = [(UIPrintMediaQualitySection *)self qualityPrintOption];
    [v3 addObject:v13];

    [(UIPrintMediaQualitySection *)self setQualitySectionNum:v7];
  }
  v14 = [(UIPrintOptionSection *)self printOptions];
  char v15 = [v14 isEqualToArray:v3];

  if ((v15 & 1) == 0)
  {
    [(UIPrintOptionSection *)self setPrintOptions:v3];
    if (pthread_main_np() == 1)
    {
      v16 = [(UIPrintMediaQualitySection *)self mediaQualitySectionController];
      v17 = [v16 tableView];
      [v17 reloadData];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__UIPrintMediaQualitySection_updatePrintOptionsList__block_invoke;
      block[3] = &unk_1E6DA1408;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }

  return v15 ^ 1;
}

void __52__UIPrintMediaQualitySection_updatePrintOptionsList__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mediaQualitySectionController];
  v1 = [v2 tableView];
  [v1 reloadData];
}

- (void)didSelectPrintOptionSection
{
  id v16 = [(UIPrintOptionSection *)self printPanelViewController];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D18]) initWithStyle:2];
  [(UIPrintMediaQualitySection *)self setMediaQualitySectionController:v3];

  v4 = [(UIPrintOptionSection *)self title];
  int v5 = [(UIPrintMediaQualitySection *)self mediaQualitySectionController];
  [v5 setTitle:v4];

  id v6 = [(UIPrintMediaQualitySection *)self mediaQualitySectionController];
  uint64_t v7 = [v6 tableView];
  [v7 setDelegate:self];

  id v8 = [(UIPrintMediaQualitySection *)self mediaQualitySectionController];
  int v9 = [v8 tableView];
  [v9 setDataSource:self];

  id v10 = [(UIPrintMediaQualitySection *)self mediaQualitySectionController];
  v11 = [v10 tableView];
  [v11 setEstimatedSectionHeaderHeight:8.0];

  int v12 = [(UIPrintMediaQualitySection *)self mediaQualitySectionController];
  v13 = [v12 navigationItem];
  [v16 addPrintShareButtonsToNavItem:v13];

  v14 = [v16 printOptionsNavController];
  char v15 = [(UIPrintMediaQualitySection *)self mediaQualitySectionController];
  [v14 pushViewController:v15 animated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(UIPrintMediaQualitySection *)self qualitySectionNum] < 1) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(UIPrintMediaQualitySection *)self qualitySectionNum] == a4) {
    return 1;
  }
  id v6 = [(UIPrintOptionSection *)self printOptions];
  uint64_t v7 = [(UIPrintMediaQualitySection *)self feedFromPrintOption];
  if ([v6 containsObject:v7])
  {
    id v8 = [(UIPrintOptionSection *)self printOptions];
    int v9 = [(UIPrintMediaQualitySection *)self mediaTypePrintOption];
    if ([v8 containsObject:v9]) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = 1;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(UIPrintMediaQualitySection *)self qualitySectionNum] == a4)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int64_t v5 = [v4 localizedStringForKey:@"Print Quality" value:@"Print Quality" table:@"Localizable"];
  }
  else
  {
    int64_t v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  if (v6 == [(UIPrintMediaQualitySection *)self qualitySectionNum])
  {
    uint64_t v7 = [(UIPrintMediaQualitySection *)self qualityPrintOption];
  }
  else
  {
    uint64_t v8 = [v5 row];
    if (v8 == [(UIPrintMediaQualitySection *)self feedFromRow]) {
      [(UIPrintMediaQualitySection *)self feedFromPrintOption];
    }
    else {
    uint64_t v7 = [(UIPrintMediaQualitySection *)self mediaTypePrintOption];
    }
  }
  int v9 = v7;
  id v10 = [v7 printOptionTableViewCell];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [v10 section];
  if (v5 != [(UIPrintMediaQualitySection *)self qualitySectionNum])
  {
    uint64_t v6 = [v10 row];
    if (v6 == [(UIPrintMediaQualitySection *)self feedFromRow])
    {
      uint64_t v7 = [(UIPrintMediaQualitySection *)self feedFromPrintOption];
    }
    else
    {
      uint64_t v8 = [v10 row];
      if (v8 != [(UIPrintMediaQualitySection *)self mediaTypeRow]) {
        goto LABEL_8;
      }
      uint64_t v7 = [(UIPrintMediaQualitySection *)self mediaTypePrintOption];
    }
    int v9 = v7;
    if (v7)
    {
      [v7 didSelectPrintOption];
    }
  }
LABEL_8:
}

- (UIPrintFeedFromOption)feedFromPrintOption
{
  return self->_feedFromPrintOption;
}

- (void)setFeedFromPrintOption:(id)a3
{
}

- (UIPrintMediaTypeOption)mediaTypePrintOption
{
  return self->_mediaTypePrintOption;
}

- (void)setMediaTypePrintOption:(id)a3
{
}

- (UIPrintQualityOption)qualityPrintOption
{
  return self->_qualityPrintOption;
}

- (void)setQualityPrintOption:(id)a3
{
}

- (UITableViewController)mediaQualitySectionController
{
  return self->_mediaQualitySectionController;
}

- (void)setMediaQualitySectionController:(id)a3
{
}

- (int64_t)feedFromRow
{
  return self->_feedFromRow;
}

- (void)setFeedFromRow:(int64_t)a3
{
  self->_feedFromRow = a3;
}

- (int64_t)mediaTypeRow
{
  return self->_mediaTypeRow;
}

- (void)setMediaTypeRow:(int64_t)a3
{
  self->_mediaTypeRow = a3;
}

- (int64_t)qualitySectionNum
{
  return self->_qualitySectionNum;
}

- (void)setQualitySectionNum:(int64_t)a3
{
  self->_qualitySectionNum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaQualitySectionController, 0);
  objc_storeStrong((id *)&self->_qualityPrintOption, 0);
  objc_storeStrong((id *)&self->_mediaTypePrintOption, 0);
  objc_storeStrong((id *)&self->_feedFromPrintOption, 0);
}

@end