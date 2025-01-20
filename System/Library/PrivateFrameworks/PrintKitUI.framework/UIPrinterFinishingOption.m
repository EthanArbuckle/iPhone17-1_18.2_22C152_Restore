@interface UIPrinterFinishingOption
- (NSArray)optionChoices;
- (NSString)title;
- (UIPrintInfo)printInfo;
- (UIPrintOptionCell)printerFinishingOptionCell;
- (UIPrintPanelViewController)printPanelViewController;
- (UIPrinterFinishingOption)initWithTitle:(id)a3 finishingType:(int64_t)a4 viewType:(int64_t)a5 optionChoices:(id)a6 printPanelViewController:(id)a7 finishingOptionsTableView:(id)a8;
- (UITableView)finishingOptionsTableView;
- (id)itemList;
- (id)selectedItem;
- (id)summary;
- (int64_t)finishingType;
- (int64_t)listItemSelected:(id)a3;
- (int64_t)selectedChoice;
- (int64_t)viewType;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFinishingOptionsTableView:(id)a3;
- (void)setFinishingType:(int64_t)a3;
- (void)setOptionChoices:(id)a3;
- (void)setPrintInfo:(id)a3;
- (void)setPrintPanelViewController:(id)a3;
- (void)setPrinterFinishingOptionCell:(id)a3;
- (void)setSelectedChoice:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setViewType:(int64_t)a3;
- (void)updateFromPrintInfo;
- (void)updateSwitchValue:(id)a3;
@end

@implementation UIPrinterFinishingOption

- (UIPrinterFinishingOption)initWithTitle:(id)a3 finishingType:(int64_t)a4 viewType:(int64_t)a5 optionChoices:(id)a6 printPanelViewController:(id)a7 finishingOptionsTableView:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)UIPrinterFinishingOption;
  v18 = [(UIPrinterFinishingOption *)&v25 init];
  v19 = v18;
  if (v18)
  {
    [(UIPrinterFinishingOption *)v18 setTitle:v14];
    [(UIPrinterFinishingOption *)v19 setFinishingType:a4];
    [(UIPrinterFinishingOption *)v19 setViewType:a5];
    [(UIPrinterFinishingOption *)v19 setOptionChoices:v15];
    [(UIPrinterFinishingOption *)v19 setPrintPanelViewController:v16];
    v20 = [v16 printInfo];
    [(UIPrinterFinishingOption *)v19 setPrintInfo:v20];

    [(UIPrinterFinishingOption *)v19 setFinishingOptionsTableView:v17];
    unint64_t v21 = [(UIPrinterFinishingOption *)v19 finishingType];
    if (v21 <= 6)
    {
      v22 = off_1E6DA1DE8[v21];
      v23 = [(UIPrinterFinishingOption *)v19 printInfo];
      [v23 addObserver:v19 forKeyPath:*v22 options:0 context:0];
    }
    [(UIPrinterFinishingOption *)v19 updateFromPrintInfo];
  }

  return v19;
}

- (void)dealloc
{
  unint64_t v3 = [(UIPrinterFinishingOption *)self finishingType];
  if (v3 <= 6)
  {
    v4 = off_1E6DA1DE8[v3];
    v5 = [(UIPrinterFinishingOption *)self printInfo];
    [v5 removeObserver:self forKeyPath:*v4];
  }
  v6.receiver = self;
  v6.super_class = (Class)UIPrinterFinishingOption;
  [(UIPrinterFinishingOption *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__UIPrinterFinishingOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__UIPrinterFinishingOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (void)updateFromPrintInfo
{
  if ([(UIPrinterFinishingOption *)self viewType] == 1)
  {
    unint64_t v3 = [(UIPrinterFinishingOption *)self optionChoices];
    objc_msgSend(v3, "objectAtIndex:", -[UIPrinterFinishingOption selectedChoice](self, "selectedChoice"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    v4 = [(UIPrinterFinishingOption *)self printerFinishingOptionCell];
    v5 = [v4 contentConfiguration];

    objc_super v6 = [v9 title];
    [v5 setSecondaryText:v6];

    v7 = [(UIPrinterFinishingOption *)self printerFinishingOptionCell];
    [v7 setContentConfiguration:v5];
  }
  else
  {
    v8 = [(UIPrinterFinishingOption *)self printerFinishingOptionCell];
    id v9 = [v8 accessoryView];

    objc_msgSend(v9, "setOn:", -[UIPrinterFinishingOption selectedChoice](self, "selectedChoice") != 0);
  }
}

- (UIPrintPanelViewController)printPanelViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPanelViewController);
  return (UIPrintPanelViewController *)WeakRetained;
}

- (int64_t)selectedChoice
{
  v2 = self;
  if ([(UIPrinterFinishingOption *)self finishingType] == 6)
  {
    unint64_t v3 = [(UIPrinterFinishingOption *)v2 optionChoices];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      unint64_t v5 = 0;
      v29 = v2;
      while (1)
      {
        objc_super v6 = [(UIPrinterFinishingOption *)v2 optionChoices];
        v7 = [v6 objectAtIndex:v5];

        v8 = [(UIPrinterFinishingOption *)v2 printInfo];
        id v9 = [v8 outputBin];
        v10 = [v7 finishingChoiceInfo];
        v11 = [v10 objectForKey:@"OutputBinChoice"];
        if ([v9 isEqualToString:v11])
        {
          v30 = [(UIPrinterFinishingOption *)v2 printInfo];
          v12 = [v30 pageStackOrder];
          v13 = [v7 finishingChoiceInfo];
          id v14 = [v13 objectForKey:@"com.apple.pageStackOrder"];
          int v15 = [v12 isEqualToString:v14];

          v2 = v29;
        }
        else
        {
          int v15 = 0;
        }

        if (v15) {
          break;
        }
        ++v5;
        id v16 = [(UIPrinterFinishingOption *)v2 optionChoices];
        unint64_t v17 = [v16 count];

        if (v5 >= v17) {
          return 0;
        }
      }
      return v5;
    }
    return 0;
  }
  switch([(UIPrinterFinishingOption *)v2 finishingType])
  {
    case 0:
      v18 = [(UIPrinterFinishingOption *)v2 printInfo];
      uint64_t v19 = [v18 staple];
      goto LABEL_18;
    case 1:
      v18 = [(UIPrinterFinishingOption *)v2 printInfo];
      uint64_t v19 = [v18 punch];
      goto LABEL_18;
    case 2:
      v18 = [(UIPrinterFinishingOption *)v2 printInfo];
      uint64_t v19 = [v18 fold];
      goto LABEL_18;
    case 3:
      v18 = [(UIPrinterFinishingOption *)v2 printInfo];
      uint64_t v19 = [v18 laminate];
      goto LABEL_18;
    case 4:
      v18 = [(UIPrinterFinishingOption *)v2 printInfo];
      uint64_t v19 = [v18 coat];
      goto LABEL_18;
    case 5:
      v18 = [(UIPrinterFinishingOption *)v2 printInfo];
      uint64_t v19 = [v18 trim];
LABEL_18:
      unint64_t v5 = v19;

      break;
    default:
      unint64_t v5 = 0;
      break;
  }
  if ([(UIPrinterFinishingOption *)v2 viewType] != 1) {
    return v5;
  }
  v20 = [(UIPrinterFinishingOption *)v2 optionChoices];
  uint64_t v21 = [v20 count];

  if (!v21) {
    return 0;
  }
  unint64_t v22 = 0;
  while (1)
  {
    v23 = [(UIPrinterFinishingOption *)v2 optionChoices];
    v24 = [v23 objectAtIndex:v22];

    uint64_t v25 = [v24 finishingChoiceID];
    if (v25 == v5) {
      break;
    }
    ++v22;
    v26 = [(UIPrinterFinishingOption *)v2 optionChoices];
    unint64_t v27 = [v26 count];

    if (v22 >= v27) {
      return 0;
    }
  }
  return v22;
}

- (void)setSelectedChoice:(int64_t)a3
{
  int64_t v5 = [(UIPrinterFinishingOption *)self viewType];
  objc_super v6 = [(UIPrinterFinishingOption *)self optionChoices];
  v7 = v6;
  if (v5 == 1)
  {
    id v20 = [v6 objectAtIndex:a3];

    uint64_t v8 = [v20 finishingChoiceID];
    id v9 = [(UIPrinterFinishingOption *)self printerFinishingOptionCell];
    v10 = [v9 contentConfiguration];

    v11 = [v20 title];
    [v10 setSecondaryText:v11];

    v12 = [(UIPrinterFinishingOption *)self printerFinishingOptionCell];
    [v12 setContentConfiguration:v10];
  }
  else
  {
    id v20 = [v6 objectAtIndex:0];

    if (a3) {
      uint64_t v8 = [v20 finishingChoiceID];
    }
    else {
      uint64_t v8 = 0;
    }
    v13 = [(UIPrinterFinishingOption *)self printerFinishingOptionCell];
    v10 = [v13 accessoryView];

    [v10 setOn:a3 != 0];
  }

  switch([(UIPrinterFinishingOption *)self finishingType])
  {
    case 0:
      id v14 = [(UIPrinterFinishingOption *)self printInfo];
      [v14 setStaple:v8];
      goto LABEL_15;
    case 1:
      id v14 = [(UIPrinterFinishingOption *)self printInfo];
      [v14 setPunch:v8];
      goto LABEL_15;
    case 2:
      id v14 = [(UIPrinterFinishingOption *)self printInfo];
      [v14 setFold:v8];
      goto LABEL_15;
    case 3:
      id v14 = [(UIPrinterFinishingOption *)self printInfo];
      [v14 setLaminate:v8];
      goto LABEL_15;
    case 4:
      id v14 = [(UIPrinterFinishingOption *)self printInfo];
      [v14 setCoat:v8];
      goto LABEL_15;
    case 5:
      id v14 = [(UIPrinterFinishingOption *)self printInfo];
      [v14 setTrim:v8];
      goto LABEL_15;
    case 6:
      int v15 = [v20 finishingChoiceInfo];
      id v16 = [v15 objectForKey:@"OutputBinChoice"];
      unint64_t v17 = [(UIPrinterFinishingOption *)self printInfo];
      [v17 setOutputBin:v16];

      id v14 = [v20 finishingChoiceInfo];
      v18 = [v14 objectForKey:@"com.apple.pageStackOrder"];
      uint64_t v19 = [(UIPrinterFinishingOption *)self printInfo];
      [v19 setPageStackOrder:v18];

LABEL_15:
      break;
    default:
      break;
  }
}

- (id)itemList
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(UIPrinterFinishingOption *)self optionChoices];
  int64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v6 = [(UIPrinterFinishingOption *)self optionChoices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)MEMORY[0x1E4F1C9E8];
        v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) title];
        v13 = [v11 dictionaryWithObject:v12 forKey:@"Title"];
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];

  return v14;
}

- (id)selectedItem
{
  v2 = (void *)MEMORY[0x1E4F28D58];
  int64_t v3 = [(UIPrinterFinishingOption *)self selectedChoice];
  return (id)[v2 indexPathForRow:v3 inSection:0];
}

- (int64_t)listItemSelected:(id)a3
{
  -[UIPrinterFinishingOption setSelectedChoice:](self, "setSelectedChoice:", [a3 row]);
  uint64_t v4 = [(UIPrinterFinishingOption *)self optionChoices];
  int64_t v5 = objc_msgSend(v4, "objectAtIndex:", -[UIPrinterFinishingOption selectedChoice](self, "selectedChoice"));

  objc_super v6 = [(UIPrinterFinishingOption *)self printerFinishingOptionCell];
  uint64_t v7 = [v6 contentConfiguration];

  uint64_t v8 = [v5 title];
  [v7 setSecondaryText:v8];

  uint64_t v9 = [(UIPrinterFinishingOption *)self printerFinishingOptionCell];
  [v9 setContentConfiguration:v7];

  return 1;
}

- (void)updateSwitchValue:(id)a3
{
  if ([a3 isOn])
  {
    uint64_t v4 = [(UIPrinterFinishingOption *)self optionChoices];
    id v5 = [v4 objectAtIndex:0];

    -[UIPrinterFinishingOption setSelectedChoice:](self, "setSelectedChoice:", [v5 finishingChoiceID]);
  }
  else
  {
    [(UIPrinterFinishingOption *)self setSelectedChoice:0];
  }
}

- (id)summary
{
  if ([(UIPrinterFinishingOption *)self selectedChoice] < 1)
  {
    v10 = 0;
  }
  else
  {
    if ([(UIPrinterFinishingOption *)self viewType])
    {
      int64_t v3 = [(UIPrinterFinishingOption *)self optionChoices];
      uint64_t v4 = objc_msgSend(v3, "objectAtIndex:", -[UIPrinterFinishingOption selectedChoice](self, "selectedChoice"));

      id v5 = NSString;
      objc_super v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v7 = [v6 localizedStringForKey:@"%@: %@" value:@"%@: %@" table:@"Localizable"];
      uint64_t v8 = [(UIPrinterFinishingOption *)self title];
      uint64_t v9 = [v4 title];
      v10 = objc_msgSend(v5, "stringWithFormat:", v7, v8, v9);
    }
    else
    {
      v11 = NSString;
      uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      objc_super v6 = [v4 localizedStringForKey:@"%@ On" value:@"%@ On" table:@"Localizable"];
      uint64_t v7 = [(UIPrinterFinishingOption *)self title];
      v10 = objc_msgSend(v11, "stringWithFormat:", v6, v7);
    }
  }
  return v10;
}

- (void)setPrintPanelViewController:(id)a3
{
}

- (UITableView)finishingOptionsTableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_finishingOptionsTableView);
  return (UITableView *)WeakRetained;
}

- (void)setFinishingOptionsTableView:(id)a3
{
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
}

- (int64_t)finishingType
{
  return self->_finishingType;
}

- (void)setFinishingType:(int64_t)a3
{
  self->_finishingType = a3;
}

- (int64_t)viewType
{
  return self->_viewType;
}

- (void)setViewType:(int64_t)a3
{
  self->_viewType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)optionChoices
{
  return self->_optionChoices;
}

- (void)setOptionChoices:(id)a3
{
}

- (UIPrintOptionCell)printerFinishingOptionCell
{
  return self->_printerFinishingOptionCell;
}

- (void)setPrinterFinishingOptionCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerFinishingOptionCell, 0);
  objc_storeStrong((id *)&self->_optionChoices, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_destroyWeak((id *)&self->_finishingOptionsTableView);
  objc_destroyWeak((id *)&self->_printPanelViewController);
}

@end