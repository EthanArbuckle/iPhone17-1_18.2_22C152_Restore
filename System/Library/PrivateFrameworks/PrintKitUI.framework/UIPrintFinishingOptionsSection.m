@interface UIPrintFinishingOptionsSection
- (BOOL)updatePrintOptionsList;
- (UIPrintFinishingOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrintFinishingsOption)finishingPrintOption;
- (void)currentPrinterChanged;
- (void)dealloc;
- (void)didSelectPrintOptionSection;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFinishingPrintOption:(id)a3;
@end

@implementation UIPrintFinishingOptionsSection

- (UIPrintFinishingOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UIPrintFinishingOptionsSection;
  v8 = [(UIPrintOptionSection *)&v16 initWithPrintInfo:v6 printPanelViewController:v7];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"Finishing Options" value:@"Finishing Options" table:@"Localizable"];
    [(UIPrintOptionSection *)v8 setTitle:v10];

    v11 = [[UIPrintFinishingsOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintFinishingOptionsSection *)v8 setFinishingPrintOption:v11];

    [(UIPrintOptionSection *)v8 updateSectionSummary];
    v12 = [(UIPrintFinishingOptionsSection *)v8 finishingPrintOption];
    [v12 addObserver:v8 forKeyPath:@"summary" options:0 context:0];

    v13 = [(UIPrintOptionSection *)v8 printInfo];
    [v13 addObserver:v8 forKeyPath:0x1F3C9DE58 options:0 context:0];

    v14 = [(UIPrintOptionSection *)v8 printInfo];
    [v14 addObserver:v8 forKeyPath:0x1F3C9E0D8 options:0 context:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(UIPrintFinishingOptionsSection *)self finishingPrintOption];
  [v3 removeObserver:self forKeyPath:@"summary"];

  v4 = [(UIPrintOptionSection *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DE58];

  v5 = [(UIPrintOptionSection *)self printInfo];
  [v5 removeObserver:self forKeyPath:0x1F3C9E0D8];

  v6.receiver = self;
  v6.super_class = (Class)UIPrintFinishingOptionsSection;
  [(UIPrintFinishingOptionsSection *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__UIPrintFinishingOptionsSection_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __81__UIPrintFinishingOptionsSection_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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

- (BOOL)updatePrintOptionsList
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  v4 = [(UIPrintFinishingOptionsSection *)self finishingPrintOption];
  int v5 = [v4 shouldShow];

  if (v5)
  {
    objc_super v6 = [(UIPrintFinishingOptionsSection *)self finishingPrintOption];
    [v3 addObject:v6];
  }
  id v7 = [(UIPrintOptionSection *)self printOptions];
  char v8 = [v7 isEqualToArray:v3];

  if ((v8 & 1) == 0)
  {
    [(UIPrintOptionSection *)self setPrintOptions:v3];
    if (pthread_main_np() == 1)
    {
      v9 = [(UIPrintFinishingOptionsSection *)self finishingPrintOption];
      id v10 = [v9 finishingOptionsTableView];
      [v10 reloadData];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__UIPrintFinishingOptionsSection_updatePrintOptionsList__block_invoke;
      block[3] = &unk_1E6DA1408;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }

  return v8 ^ 1;
}

void __56__UIPrintFinishingOptionsSection_updatePrintOptionsList__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) finishingPrintOption];
  v1 = [v2 finishingOptionsTableView];
  [v1 reloadData];
}

- (void)currentPrinterChanged
{
  [(UIPrintFinishingOptionsSection *)self updatePrintOptionsList];
  [(UIPrintOptionSection *)self updateSectionSummary];
}

- (void)didSelectPrintOptionSection
{
  id v10 = [(UIPrintOptionSection *)self printPanelViewController];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1EC0]) initWithNibName:0 bundle:0];
  v4 = [(UIPrintFinishingOptionsSection *)self finishingPrintOption];
  int v5 = [v4 finishingOptionsTableView];
  [v3 setView:v5];

  objc_super v6 = [(UIPrintFinishingOptionsSection *)self finishingPrintOption];
  id v7 = [v6 title];
  [v3 setTitle:v7];

  char v8 = [v3 navigationItem];
  [v10 addPrintShareButtonsToNavItem:v8];

  v9 = [v10 printOptionsNavController];
  [v9 pushViewController:v3 animated:1];
}

- (UIPrintFinishingsOption)finishingPrintOption
{
  return self->_finishingPrintOption;
}

- (void)setFinishingPrintOption:(id)a3
{
}

- (void).cxx_destruct
{
}

@end