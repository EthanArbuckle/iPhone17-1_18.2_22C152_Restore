@interface UIPrintBorderOption
- (NSArray)borderTypeNames;
- (NSIndexPath)selectedIndexPath;
- (UIPrintBorderOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (id)itemList;
- (id)printOptionTableViewCell;
- (id)shortSummary;
- (id)summaryString;
- (int64_t)listItemSelected:(id)a3;
- (void)dealloc;
- (void)didSelectPrintOption;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBorderTypeNames:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintBorderOption

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9E078];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintBorderOption;
  [(UIPrintBorderOption *)&v4 dealloc];
}

- (UIPrintBorderOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v35[5] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)UIPrintBorderOption;
  objc_super v4 = [(UIPrintOption *)&v34 initWithPrintInfo:a3 printPanelViewController:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(UIPrintOption *)v4 printInfo];
    [v6 setBorderType:0];

    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"Border" value:@"Border" table:@"Localizable"];
    [(UIPrintOption *)v5 setTitle:v8];

    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v32 = [v33 localizedStringForKey:@"No Layout Border" value:@"No Layout Border" table:@"Localizable"];
    v31 = [v9 dictionaryWithObject:v32 forKey:@"Title"];
    v35[0] = v31;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v29 = [v30 localizedStringForKey:@"Single Hairline" value:@"Single Hairline" table:@"Localizable"];
    v28 = [v10 dictionaryWithObject:v29 forKey:@"Title"];
    v35[1] = v28;
    v11 = (void *)MEMORY[0x1E4F1C9E8];
    v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [v27 localizedStringForKey:@"Single Thin Line" value:@"Single Thin Line" table:@"Localizable"];
    v13 = [v11 dictionaryWithObject:v12 forKey:@"Title"];
    v35[2] = v13;
    v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"Double Hairline" value:@"Double Hairline" table:@"Localizable"];
    v17 = [v14 dictionaryWithObject:v16 forKey:@"Title"];
    v35[3] = v17;
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"Double Thin Line" value:@"Double Thin Line" table:@"Localizable"];
    v21 = [v18 dictionaryWithObject:v20 forKey:@"Title"];
    v35[4] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
    [(UIPrintBorderOption *)v5 setBorderTypeNames:v22];

    v23 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [(UIPrintBorderOption *)v5 setSelectedIndexPath:v23];

    v24 = [(UIPrintBorderOption *)v5 summaryString];
    [(UIPrintOption *)v5 setSummary:v24];

    v25 = [(UIPrintOption *)v5 printInfo];
    [v25 addObserver:v5 forKeyPath:0x1F3C9E078 options:0 context:0];
  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__UIPrintBorderOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__UIPrintBorderOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (void)updateFromPrintInfo
{
  v3 = (void *)MEMORY[0x1E4F28D58];
  objc_super v4 = [(UIPrintOption *)self printInfo];
  v5 = objc_msgSend(v3, "indexPathForRow:inSection:", objc_msgSend(v4, "borderType"), 0);
  [(UIPrintBorderOption *)self setSelectedIndexPath:v5];

  v6 = [(UIPrintOption *)self tableViewCell];
  id v10 = [v6 contentConfiguration];

  v7 = [(UIPrintBorderOption *)self shortSummary];
  [v10 setSecondaryText:v7];

  v8 = [(UIPrintOption *)self tableViewCell];
  [v8 setContentConfiguration:v10];

  v9 = [(UIPrintBorderOption *)self summaryString];
  [(UIPrintOption *)self setSummary:v9];
}

- (id)itemList
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(UIPrintBorderOption *)self borderTypeNames];
  objc_super v4 = [v2 arrayWithObject:v3];

  return v4;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4 = a3;
  [(UIPrintBorderOption *)self setSelectedIndexPath:v4];
  uint64_t v5 = [v4 row];

  v6 = [(UIPrintOption *)self printInfo];
  [v6 setBorderType:v5];

  return 1;
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  id v4 = [v3 printOptionsTableView];
  uint64_t v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionListCell"];

  v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v7 = [(UIPrintOption *)self title];
  [v6 setText:v7];

  v8 = [(UIPrintBorderOption *)self shortSummary];
  [v6 setSecondaryText:v8];

  [v5 setContentConfiguration:v6];
  [v5 setAccessoryType:1];
  [v5 setSelectionStyle:3];
  [v5 setItemListDelegate:self];
  [(UIPrintOption *)self setTableViewCell:v5];

  return v5;
}

- (id)shortSummary
{
  v3 = [(UIPrintBorderOption *)self borderTypeNames];
  id v4 = [(UIPrintOption *)self printInfo];
  uint64_t v5 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "borderType"));
  v6 = [v5 objectForKey:@"Title"];

  return v6;
}

- (id)summaryString
{
  v2 = [(UIPrintOption *)self printInfo];
  uint64_t v3 = [v2 borderType];

  switch(v3)
  {
    case 1:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      v6 = @"Single Hairline Border";
      goto LABEL_7;
    case 2:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      v6 = @"Single Thin Line Border";
      goto LABEL_7;
    case 3:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      v6 = @"Double Hairline Border";
      goto LABEL_7;
    case 4:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      v6 = @"Double Thin Line Border";
LABEL_7:
      v7 = [v4 localizedStringForKey:v6 value:v6 table:@"Localizable"];

      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (void)didSelectPrintOption
{
  id v2 = [(UIPrintOption *)self tableViewCell];
  [v2 printOptionCellTapped];
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSArray)borderTypeNames
{
  return self->_borderTypeNames;
}

- (void)setBorderTypeNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderTypeNames, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
}

@end