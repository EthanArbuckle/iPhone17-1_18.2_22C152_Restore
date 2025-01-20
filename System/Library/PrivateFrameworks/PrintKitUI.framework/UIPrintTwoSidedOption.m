@interface UIPrintTwoSidedOption
- (BOOL)shouldShow;
- (UIPrintTwoSidedOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UISwitch)duplexSwitch;
- (id)printOptionTableViewCell;
- (id)summary;
- (void)changeDuplex:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDuplexSwitch:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintTwoSidedOption

- (UIPrintTwoSidedOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIPrintTwoSidedOption;
  v4 = [(UIPrintOption *)&v9 initWithPrintInfo:a3 printPanelViewController:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(UIPrintOption *)v4 printInfo];
    [v6 addObserver:v5 forKeyPath:0x1F3C9DDB8 options:0 context:0];

    v7 = [(UIPrintOption *)v5 printInfo];
    [v7 addObserver:v5 forKeyPath:0x1F3C9DE58 options:0 context:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DDB8];

  v4 = [(UIPrintOption *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DE58];

  v5.receiver = self;
  v5.super_class = (Class)UIPrintTwoSidedOption;
  [(UIPrintTwoSidedOption *)&v5 dealloc];
}

- (BOOL)shouldShow
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  if ([v3 shouldShowDuplex])
  {
    v4 = [(UIPrintOption *)self printInfo];
    objc_super v5 = [v4 currentPrinter];
    char v6 = [v5 supportsDuplex];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  v4 = [v3 printOptionsTableView];
  objc_super v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionCell"];

  char v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"Double-sided" value:@"Double-sided" table:@"Localizable"];
  [v6 setText:v8];

  [v6 setSecondaryText:0];
  [v5 setContentConfiguration:v6];
  [v5 setSelectionStyle:0];
  objc_super v9 = createPrintKitUISwitch(*MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIPrintTwoSidedOption *)self setDuplexSwitch:v9];

  v10 = [(UIPrintTwoSidedOption *)self duplexSwitch];
  [v10 setPreferredStyle:1];

  v11 = [(UIPrintOption *)self printInfo];
  BOOL v12 = [v11 duplex] != 0;
  v13 = [(UIPrintTwoSidedOption *)self duplexSwitch];
  [v13 setOn:v12];

  v14 = [(UIPrintTwoSidedOption *)self duplexSwitch];
  [v14 addTarget:self action:sel_changeDuplex_ forControlEvents:4096];

  v15 = [(UIPrintTwoSidedOption *)self duplexSwitch];
  [v5 setAccessoryView:v15];

  [(UIPrintOption *)self setTableViewCell:v5];
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", 0x1F3C9DE58, a4, a5, a6))
  {
    v7 = [(UIPrintOption *)self printInfo];
    if (([v7 outputType] & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      [(UIPrintOption *)self setShouldShow:0];
    }
    else
    {
      v8 = [(UIPrintOption *)self printInfo];
      objc_super v9 = [v8 currentPrinter];
      -[UIPrintOption setShouldShow:](self, "setShouldShow:", [v9 supportsDuplex]);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__UIPrintTwoSidedOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__UIPrintTwoSidedOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (void)updateFromPrintInfo
{
  id v5 = [(UIPrintOption *)self printInfo];
  BOOL v3 = [v5 duplex] != 0;
  v4 = [(UIPrintTwoSidedOption *)self duplexSwitch];
  [v4 setOn:v3];
}

- (void)changeDuplex:(id)a3
{
  uint64_t v4 = [a3 isOn];
  id v5 = [(UIPrintOption *)self printInfo];
  [v5 setDuplex:v4];
}

- (id)summary
{
  v2 = [(UIPrintOption *)self printInfo];
  uint64_t v3 = [v2 duplex];
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3) {
    char v6 = @"Double-sided";
  }
  else {
    char v6 = @"Single-sided";
  }
  v7 = [v4 localizedStringForKey:v6 value:v6 table:@"Localizable"];

  return v7;
}

- (UISwitch)duplexSwitch
{
  return self->_duplexSwitch;
}

- (void)setDuplexSwitch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end