@interface UIPrintStandardOptionsSection
- (BOOL)updatePrintOptionsList;
- (UIPrintPresetsOption)presetsOption;
- (UIPrintStandardOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrinterSelectionOption)printerSelectionOption;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPresetsOption:(id)a3;
- (void)setPrinterSelectionOption:(id)a3;
- (void)setShowContactingPrinter:(BOOL)a3;
@end

@implementation UIPrintStandardOptionsSection

- (UIPrintStandardOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIPrintStandardOptionsSection;
  v8 = [(UIPrintOptionSection *)&v14 initWithPrintInfo:v6 printPanelViewController:v7];
  v9 = v8;
  if (v8)
  {
    [(UIPrintOptionSection *)v8 setTitle:&stru_1F3C9D3F8];
    v10 = [[UIPrinterSelectionOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintStandardOptionsSection *)v9 setPrinterSelectionOption:v10];

    v11 = [[UIPrintPresetsOption alloc] initWithPrintInfo:v6 printPanelViewController:v7];
    [(UIPrintStandardOptionsSection *)v9 setPresetsOption:v11];

    [(UIPrintStandardOptionsSection *)v9 updatePrintOptionsList];
    v12 = [(UIPrintStandardOptionsSection *)v9 presetsOption];
    [v12 addObserver:v9 forKeyPath:@"shouldShow" options:0 context:0];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(UIPrintStandardOptionsSection *)self presetsOption];
  [v3 removeObserver:self forKeyPath:@"shouldShow"];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintStandardOptionsSection;
  [(UIPrintStandardOptionsSection *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__UIPrintStandardOptionsSection_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__UIPrintStandardOptionsSection_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePrintOptionsList];
}

- (BOOL)updatePrintOptionsList
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  objc_super v4 = [(UIPrintStandardOptionsSection *)self printerSelectionOption];
  [v3 addObject:v4];

  v5 = [(UIPrintStandardOptionsSection *)self presetsOption];
  int v6 = [v5 shouldShow];

  if (v6)
  {
    id v7 = [(UIPrintStandardOptionsSection *)self presetsOption];
    [v3 addObject:v7];
  }
  v8 = [(UIPrintOptionSection *)self printOptions];
  char v9 = [v8 isEqualToArray:v3];

  if ((v9 & 1) == 0) {
    [(UIPrintOptionSection *)self setPrintOptions:v3];
  }

  return v9 ^ 1;
}

- (void)setShowContactingPrinter:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIPrintStandardOptionsSection *)self printerSelectionOption];
  [v4 setShowContactingPrinter:v3];
}

- (UIPrinterSelectionOption)printerSelectionOption
{
  return self->_printerSelectionOption;
}

- (void)setPrinterSelectionOption:(id)a3
{
}

- (UIPrintPresetsOption)presetsOption
{
  return self->_presetsOption;
}

- (void)setPresetsOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presetsOption, 0);
  objc_storeStrong((id *)&self->_printerSelectionOption, 0);
}

@end