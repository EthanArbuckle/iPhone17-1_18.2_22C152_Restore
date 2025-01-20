@interface UIPrintLayoutSection
- (BOOL)shouldShow;
- (BOOL)updatePrintOptionsList;
- (UIPrintBorderOption)borderPrintOption;
- (UIPrintFlipHorizontalOption)flipHorizontalPrintOption;
- (UIPrintLayoutDirectionOption)layoutDirectionPrintOption;
- (UIPrintLayoutSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrintPagesPerSheetOption)pagesPerSheetPrintOption;
- (UITableViewController)layoutSectionController;
- (id)printOptionAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)didSelectPrintOptionSection;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBorderPrintOption:(id)a3;
- (void)setFlipHorizontalPrintOption:(id)a3;
- (void)setLayoutDirectionPrintOption:(id)a3;
- (void)setLayoutSectionController:(id)a3;
- (void)setPagesPerSheetPrintOption:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation UIPrintLayoutSection

- (UIPrintLayoutSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)UIPrintLayoutSection;
  v8 = [(UIPrintOptionSection *)&v21 initWithPrintInfo:v6 printPanelViewController:v7];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"Layout" value:@"Layout" table:@"Localizable"];
    [(UIPrintOptionSection *)v8 setTitle:v10];

    v11 = [[UIPrintPagesPerSheetOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintLayoutSection *)v8 setPagesPerSheetPrintOption:v11];

    v12 = [[UIPrintLayoutDirectionOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintLayoutSection *)v8 setLayoutDirectionPrintOption:v12];

    v13 = [[UIPrintBorderOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintLayoutSection *)v8 setBorderPrintOption:v13];

    v14 = [[UIPrintFlipHorizontalOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintLayoutSection *)v8 setFlipHorizontalPrintOption:v14];

    [(UIPrintLayoutSection *)v8 updatePrintOptionsList];
    [(UIPrintOptionSection *)v8 updateSectionSummary];
    v15 = [(UIPrintLayoutSection *)v8 pagesPerSheetPrintOption];
    [v15 addObserver:v8 forKeyPath:@"summary" options:0 context:0];

    v16 = [(UIPrintLayoutSection *)v8 layoutDirectionPrintOption];
    [v16 addObserver:v8 forKeyPath:@"summary" options:0 context:0];

    v17 = [(UIPrintLayoutSection *)v8 borderPrintOption];
    [v17 addObserver:v8 forKeyPath:@"summary" options:0 context:0];

    v18 = [(UIPrintLayoutSection *)v8 flipHorizontalPrintOption];
    [v18 addObserver:v8 forKeyPath:@"summary" options:0 context:0];

    v19 = [(UIPrintOptionSection *)v8 printInfo];
    [v19 addObserver:v8 forKeyPath:0x1F3C9DFF8 options:0 context:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(UIPrintLayoutSection *)self pagesPerSheetPrintOption];
  [v3 removeObserver:self forKeyPath:@"summary"];

  v4 = [(UIPrintLayoutSection *)self layoutDirectionPrintOption];
  [v4 removeObserver:self forKeyPath:@"summary"];

  v5 = [(UIPrintLayoutSection *)self borderPrintOption];
  [v5 removeObserver:self forKeyPath:@"summary"];

  id v6 = [(UIPrintLayoutSection *)self flipHorizontalPrintOption];
  [v6 removeObserver:self forKeyPath:@"summary"];

  id v7 = [(UIPrintOptionSection *)self printInfo];
  [v7 removeObserver:self forKeyPath:0x1F3C9DFF8];

  v8.receiver = self;
  v8.super_class = (Class)UIPrintLayoutSection;
  [(UIPrintLayoutSection *)&v8 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__UIPrintLayoutSection_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __71__UIPrintLayoutSection_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEqualToString:0x1F3C9DFF8];
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    return [v3 updatePrintOptionsList];
  }
  else
  {
    return [v3 updateSectionSummary];
  }
}

- (BOOL)shouldShow
{
  int v2 = [(UIPrintOptionSection *)self printPanelViewController];
  char v3 = [v2 shouldShowLayout];

  return v3;
}

- (BOOL)updatePrintOptionsList
{
  char v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  v4 = [(UIPrintLayoutSection *)self pagesPerSheetPrintOption];
  [v3 addObject:v4];

  v5 = [(UIPrintOptionSection *)self printInfo];
  int v6 = [v5 nUpActive];

  if (v6)
  {
    id v7 = [(UIPrintLayoutSection *)self layoutDirectionPrintOption];
    [v3 addObject:v7];
  }
  id v8 = [(UIPrintLayoutSection *)self borderPrintOption];
  [v3 addObject:v8];

  v9 = [(UIPrintLayoutSection *)self flipHorizontalPrintOption];
  [v3 addObject:v9];

  id v10 = [(UIPrintOptionSection *)self printOptions];
  char v11 = [v10 isEqualToArray:v3];

  if ((v11 & 1) == 0)
  {
    [(UIPrintOptionSection *)self setPrintOptions:v3];
    if (pthread_main_np() == 1)
    {
      v12 = [(UIPrintLayoutSection *)self layoutSectionController];
      v13 = [v12 tableView];
      [v13 reloadData];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__UIPrintLayoutSection_updatePrintOptionsList__block_invoke;
      block[3] = &unk_1E6DA1408;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }

  return v11 ^ 1;
}

void __46__UIPrintLayoutSection_updatePrintOptionsList__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layoutSectionController];
  v1 = [v2 tableView];
  [v1 reloadData];
}

- (void)didSelectPrintOptionSection
{
  id v16 = [(UIPrintOptionSection *)self printPanelViewController];
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D18]) initWithStyle:2];
  [(UIPrintLayoutSection *)self setLayoutSectionController:v3];

  v4 = [(UIPrintOptionSection *)self title];
  v5 = [(UIPrintLayoutSection *)self layoutSectionController];
  [v5 setTitle:v4];

  int v6 = [(UIPrintLayoutSection *)self layoutSectionController];
  id v7 = [v6 tableView];
  [v7 setDelegate:self];

  id v8 = [(UIPrintLayoutSection *)self layoutSectionController];
  v9 = [v8 tableView];
  [v9 setDataSource:self];

  id v10 = [(UIPrintLayoutSection *)self layoutSectionController];
  char v11 = [v10 tableView];
  [v11 setEstimatedSectionHeaderHeight:8.0];

  v12 = [(UIPrintLayoutSection *)self layoutSectionController];
  v13 = [v12 navigationItem];
  [v16 addPrintShareButtonsToNavItem:v13];

  v14 = [v16 printOptionsNavController];
  v15 = [(UIPrintLayoutSection *)self layoutSectionController];
  [v14 pushViewController:v15 animated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 2;
  }
  v5 = [(UIPrintOptionSection *)self printInfo];
  if ([v5 nUpActive]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)printOptionAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 row];

  if (v5)
  {
    if (v6) {
      [(UIPrintLayoutSection *)self flipHorizontalPrintOption];
    }
    else {
      [(UIPrintLayoutSection *)self borderPrintOption];
    }
  }
  else if (v6)
  {
    [(UIPrintLayoutSection *)self layoutDirectionPrintOption];
  }
  else
  {
    [(UIPrintLayoutSection *)self pagesPerSheetPrintOption];
  id v7 = };
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = [(UIPrintLayoutSection *)self printOptionAtIndexPath:a4];
  uint64_t v5 = [v4 printOptionTableViewCell];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v4 = [(UIPrintLayoutSection *)self printOptionAtIndexPath:a4];
  if (v4)
  {
    id v5 = v4;
    [v4 didSelectPrintOption];
    id v4 = v5;
  }
}

- (UIPrintPagesPerSheetOption)pagesPerSheetPrintOption
{
  return self->_pagesPerSheetPrintOption;
}

- (void)setPagesPerSheetPrintOption:(id)a3
{
}

- (UIPrintLayoutDirectionOption)layoutDirectionPrintOption
{
  return self->_layoutDirectionPrintOption;
}

- (void)setLayoutDirectionPrintOption:(id)a3
{
}

- (UIPrintBorderOption)borderPrintOption
{
  return self->_borderPrintOption;
}

- (void)setBorderPrintOption:(id)a3
{
}

- (UIPrintFlipHorizontalOption)flipHorizontalPrintOption
{
  return self->_flipHorizontalPrintOption;
}

- (void)setFlipHorizontalPrintOption:(id)a3
{
}

- (UITableViewController)layoutSectionController
{
  return self->_layoutSectionController;
}

- (void)setLayoutSectionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutSectionController, 0);
  objc_storeStrong((id *)&self->_flipHorizontalPrintOption, 0);
  objc_storeStrong((id *)&self->_borderPrintOption, 0);
  objc_storeStrong((id *)&self->_layoutDirectionPrintOption, 0);
  objc_storeStrong((id *)&self->_pagesPerSheetPrintOption, 0);
}

@end