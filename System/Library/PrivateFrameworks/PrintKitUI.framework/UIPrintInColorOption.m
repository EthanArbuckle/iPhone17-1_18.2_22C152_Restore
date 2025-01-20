@interface UIPrintInColorOption
- (BOOL)canShowColor;
- (BOOL)printInColor;
- (BOOL)shouldShow;
- (UIPrintInColorOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UISwitch)printInColorSwitch;
- (id)printOptionTableViewCell;
- (id)summary;
- (int64_t)savedOutputType;
- (void)changePrintInColor:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCanShowColor:(BOOL)a3;
- (void)setPrintInColor:(BOOL)a3;
- (void)setPrintInColorSwitch:(id)a3;
- (void)setSavedOutputType:(int64_t)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintInColorOption

- (UIPrintInColorOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)UIPrintInColorOption;
  v4 = [(UIPrintOption *)&v12 initWithPrintInfo:a3 printPanelViewController:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"Print in Color" value:@"Print in Color" table:@"Localizable"];
    [(UIPrintOption *)v4 setTitle:v6];

    v7 = [(UIPrintOption *)v4 printPanelViewController];
    v8 = [v7 printInteractionController];
    -[UIPrintInColorOption setCanShowColor:](v4, "setCanShowColor:", [v8 _canShowColor]);

    [(UIPrintInColorOption *)v4 setSavedOutputType:-1];
    v9 = [(UIPrintOption *)v4 printInfo];
    [v9 addObserver:v4 forKeyPath:0x1F3C9DD78 options:0 context:0];

    v10 = [(UIPrintOption *)v4 printInfo];
    [v10 addObserver:v4 forKeyPath:0x1F3C9DE58 options:0 context:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DD78];

  v4 = [(UIPrintOption *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DE58];

  v5.receiver = self;
  v5.super_class = (Class)UIPrintInColorOption;
  [(UIPrintInColorOption *)&v5 dealloc];
}

- (BOOL)shouldShow
{
  v2 = [(UIPrintOption *)self printInfo];
  v3 = [v2 currentPrinter];
  char v4 = [v3 supportsColor];

  return v4;
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  char v4 = [v3 printOptionsTableView];
  objc_super v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionCell"];

  v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v7 = [(UIPrintOption *)self title];
  [v6 setText:v7];

  [v6 setSecondaryText:0];
  [v5 setContentConfiguration:v6];
  [v5 setSelectionStyle:0];
  v8 = createPrintKitUISwitch(*MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIPrintInColorOption *)self setPrintInColorSwitch:v8];

  BOOL v9 = [(UIPrintInColorOption *)self printInColor];
  v10 = [(UIPrintInColorOption *)self printInColorSwitch];
  [v10 setOn:v9];

  v11 = [(UIPrintInColorOption *)self printInColorSwitch];
  [v11 addTarget:self action:sel_changePrintInColor_ forControlEvents:4096];

  objc_super v12 = [(UIPrintInColorOption *)self printInColorSwitch];
  [v5 setAccessoryView:v12];

  [(UIPrintOption *)self setTableViewCell:v5];
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", 0x1F3C9DE58, a4, a5, a6))
  {
    if ([(UIPrintInColorOption *)self canShowColor])
    {
      v7 = [(UIPrintOption *)self printInfo];
      v8 = [v7 currentPrinter];
      -[UIPrintOption setShouldShow:](self, "setShouldShow:", [v8 supportsColor]);
    }
    else
    {
      [(UIPrintOption *)self setShouldShow:0];
    }
    BOOL v9 = [(UIPrintOption *)self printInfo];
    v10 = [v9 currentPrinter];
    int v11 = [v10 supportsColor];

    int64_t v12 = [(UIPrintInColorOption *)self savedOutputType];
    if (v11)
    {
      if (v12 != -1)
      {
        int64_t v13 = [(UIPrintInColorOption *)self savedOutputType];
        v14 = [(UIPrintOption *)self printInfo];
        [v14 setOutputType:v13];

        [(UIPrintInColorOption *)self setSavedOutputType:-1];
      }
    }
    else if (v12 == -1)
    {
      v15 = [(UIPrintOption *)self printInfo];
      -[UIPrintInColorOption setSavedOutputType:](self, "setSavedOutputType:", [v15 outputType]);

      v16 = [(UIPrintOption *)self printInfo];
      [v16 setOutputType:2];
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__UIPrintInColorOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__UIPrintInColorOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (BOOL)printInColor
{
  v3 = [(UIPrintOption *)self printInfo];
  char v4 = [v3 currentPrinter];
  if ([v4 supportsColor])
  {
    objc_super v5 = [(UIPrintOption *)self printInfo];
    if ([v5 outputType] == 1)
    {
      BOOL v6 = 1;
    }
    else
    {
      v7 = [(UIPrintOption *)self printInfo];
      BOOL v6 = [v7 outputType] == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setPrintInColor:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(UIPrintOption *)self printInfo];
  uint64_t v6 = [v5 outputType];

  v7 = [(UIPrintOption *)self printInfo];
  id v12 = v7;
  if (v6 != 1 || v3)
  {
    uint64_t v9 = [v7 outputType];

    v7 = [(UIPrintOption *)self printInfo];
    id v12 = v7;
    if (v9 == 3 && v3)
    {
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v10 = [v7 outputType];

      v7 = [(UIPrintOption *)self printInfo];
      id v12 = v7;
      if (v10 || v3)
      {
        uint64_t v11 = [v7 outputType];

        if (v11 != 2 || !v3) {
          return;
        }
        v7 = [(UIPrintOption *)self printInfo];
        id v12 = v7;
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v8 = 2;
      }
    }
  }
  else
  {
    uint64_t v8 = 3;
  }
  [v7 setOutputType:v8];
}

- (void)changePrintInColor:(id)a3
{
  uint64_t v4 = [a3 isOn];
  [(UIPrintInColorOption *)self setPrintInColor:v4];
}

- (void)updateFromPrintInfo
{
  BOOL v3 = [(UIPrintInColorOption *)self printInColor];
  id v4 = [(UIPrintInColorOption *)self printInColorSwitch];
  [v4 setOn:v3];
}

- (id)summary
{
  BOOL v2 = [(UIPrintInColorOption *)self printInColor];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (v2) {
    objc_super v5 = @"Color";
  }
  else {
    objc_super v5 = @"Black & White";
  }
  uint64_t v6 = [v3 localizedStringForKey:v5 value:v5 table:@"Localizable"];

  return v6;
}

- (UISwitch)printInColorSwitch
{
  return self->_printInColorSwitch;
}

- (void)setPrintInColorSwitch:(id)a3
{
}

- (BOOL)canShowColor
{
  return self->_canShowColor;
}

- (void)setCanShowColor:(BOOL)a3
{
  self->_canShowColor = a3;
}

- (int64_t)savedOutputType
{
  return self->_savedOutputType;
}

- (void)setSavedOutputType:(int64_t)a3
{
  self->_savedOutputType = a3;
}

- (void).cxx_destruct
{
}

@end