@interface UIPrintFlipHorizontalOption
- (UIPrintFlipHorizontalOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UISwitch)flipHorizontalSwitch;
- (id)printOptionTableViewCell;
- (id)summaryString;
- (void)dealloc;
- (void)flipHorizontalSelected:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFlipHorizontalSwitch:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintFlipHorizontalOption

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9E0B8];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintFlipHorizontalOption;
  [(UIPrintFlipHorizontalOption *)&v4 dealloc];
}

- (UIPrintFlipHorizontalOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIPrintFlipHorizontalOption;
  objc_super v4 = [(UIPrintOption *)&v8 initWithPrintInfo:a3 printPanelViewController:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(UIPrintOption *)v4 printInfo];
    [v6 addObserver:v5 forKeyPath:0x1F3C9E0B8 options:0 context:0];
  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__UIPrintFlipHorizontalOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__UIPrintFlipHorizontalOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  objc_super v4 = [v3 printOptionsTableView];
  v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionCell"];

  [v5 setSelectionStyle:0];
  v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v8 = [v7 localizedStringForKey:@"Flip Horizontally" value:@"Flip Horizontally" table:@"Localizable"];
  [v6 setText:v8];

  [v5 setContentConfiguration:v6];
  v9 = createPrintKitUISwitch(*MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIPrintFlipHorizontalOption *)self setFlipHorizontalSwitch:v9];

  v10 = [(UIPrintOption *)self printInfo];
  uint64_t v11 = [v10 flipHorizontal];
  v12 = [(UIPrintFlipHorizontalOption *)self flipHorizontalSwitch];
  [v12 setOn:v11];

  v13 = [(UIPrintFlipHorizontalOption *)self flipHorizontalSwitch];
  [v13 addTarget:self action:sel_flipHorizontalSelected_ forControlEvents:4096];

  v14 = [(UIPrintFlipHorizontalOption *)self flipHorizontalSwitch];
  [v5 setAccessoryView:v14];

  [(UIPrintOption *)self setTableViewCell:v5];
  v15 = [(UIPrintFlipHorizontalOption *)self summaryString];
  [(UIPrintOption *)self setSummary:v15];

  return v5;
}

- (void)updateFromPrintInfo
{
  v3 = [(UIPrintOption *)self printInfo];
  uint64_t v4 = [v3 flipHorizontal];
  v5 = [(UIPrintFlipHorizontalOption *)self flipHorizontalSwitch];
  [v5 setOn:v4];

  id v6 = [(UIPrintFlipHorizontalOption *)self summaryString];
  [(UIPrintOption *)self setSummary:v6];
}

- (void)flipHorizontalSelected:(id)a3
{
  uint64_t v4 = [a3 isOn];
  id v5 = [(UIPrintOption *)self printInfo];
  [v5 setFlipHorizontal:v4];
}

- (id)summaryString
{
  v2 = [(UIPrintOption *)self printInfo];
  int v3 = [v2 flipHorizontal];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"Flipped Horizontally" value:@"Flipped Horizontally" table:@"Localizable"];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (UISwitch)flipHorizontalSwitch
{
  return self->_flipHorizontalSwitch;
}

- (void)setFlipHorizontalSwitch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end