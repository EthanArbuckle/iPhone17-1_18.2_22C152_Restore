@interface UIPrintPagesPerSheetOption
- (NSArray)nUpNames;
- (NSIndexPath)selectedIndexPath;
- (UIPrintPagesPerSheetOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (id)itemList;
- (id)itemNameDictForNumber:(int64_t)a3;
- (id)printOptionTableViewCell;
- (id)shortSummary;
- (id)summaryString;
- (int64_t)listItemSelected:(id)a3;
- (void)dealloc;
- (void)didSelectPrintOption;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setNUpNames:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintPagesPerSheetOption

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DFF8];

  v4 = [(UIPrintOption *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9E098];

  v5 = [(UIPrintOption *)self printInfo];
  [v5 removeObserver:self forKeyPath:0x1F3C9DE58];

  v6.receiver = self;
  v6.super_class = (Class)UIPrintPagesPerSheetOption;
  [(UIPrintPagesPerSheetOption *)&v6 dealloc];
}

- (UIPrintPagesPerSheetOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)UIPrintPagesPerSheetOption;
  v4 = [(UIPrintOption *)&v20 initWithPrintInfo:a3 printPanelViewController:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v6 = [v5 localizedStringForKey:@"Pages per Sheet" value:@"Pages per Sheet" table:@"Localizable"];
    [(UIPrintOption *)v4 setTitle:v6];

    v7 = [(UIPrintPagesPerSheetOption *)v4 itemNameDictForNumber:1];
    v21[0] = v7;
    v8 = [(UIPrintPagesPerSheetOption *)v4 itemNameDictForNumber:2];
    v21[1] = v8;
    v9 = [(UIPrintPagesPerSheetOption *)v4 itemNameDictForNumber:4];
    v21[2] = v9;
    v10 = [(UIPrintPagesPerSheetOption *)v4 itemNameDictForNumber:6];
    v21[3] = v10;
    v11 = [(UIPrintPagesPerSheetOption *)v4 itemNameDictForNumber:9];
    v21[4] = v11;
    v12 = [(UIPrintPagesPerSheetOption *)v4 itemNameDictForNumber:16];
    v21[5] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:6];
    [(UIPrintPagesPerSheetOption *)v4 setNUpNames:v13];

    v14 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [(UIPrintPagesPerSheetOption *)v4 setSelectedIndexPath:v14];

    v15 = [(UIPrintPagesPerSheetOption *)v4 summaryString];
    [(UIPrintOption *)v4 setSummary:v15];

    v16 = [(UIPrintOption *)v4 printInfo];
    [v16 addObserver:v4 forKeyPath:0x1F3C9DFF8 options:0 context:0];

    v17 = [(UIPrintOption *)v4 printInfo];
    [v17 addObserver:v4 forKeyPath:0x1F3C9E098 options:0 context:0];

    v18 = [(UIPrintOption *)v4 printInfo];
    [v18 addObserver:v4 forKeyPath:0x1F3C9DE58 options:0 context:0];
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__UIPrintPagesPerSheetOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __77__UIPrintPagesPerSheetOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isEqual:0x1F3C9DE58])
  {
    v2 = [*(id *)(a1 + 40) printInfo];
    v3 = [v2 currentPrinter];
    if ([v3 supportsDuplex])
    {
LABEL_5:

      return [*(id *)(a1 + 40) updateFromPrintInfo];
    }
    v4 = [*(id *)(a1 + 40) printInfo];
    uint64_t v5 = [v4 bookletStyle];

    if (v5)
    {
      objc_super v6 = [*(id *)(a1 + 40) printInfo];
      [v6 setBookletStyle:0];

      v2 = [MEMORY[0x1E4F28ED0] numberWithInteger:1];
      v10[0] = v2;
      v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:1];
      v10[1] = v3;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
      id v8 = [*(id *)(a1 + 40) printInfo];
      [v8 setNUpRowsColumns:v7];

      goto LABEL_5;
    }
  }
  return [*(id *)(a1 + 40) updateFromPrintInfo];
}

- (void)updateFromPrintInfo
{
  v3 = [(UIPrintOption *)self printInfo];
  uint64_t v4 = [v3 bookletStyle];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v6 = 0;
    uint64_t v7 = 1;
  }
  else
  {
    id v8 = [(UIPrintOption *)self printInfo];
    uint64_t v9 = [v8 numNUpRows];
    id v10 = [(UIPrintOption *)self printInfo];
    uint64_t v11 = [v10 numNUpColumns] * v9;

    uint64_t v6 = 0;
    switch(v11)
    {
      case 2:
        uint64_t v6 = 1;
        break;
      case 3:
      case 5:
      case 7:
      case 8:
        break;
      case 4:
        uint64_t v6 = 2;
        break;
      case 6:
        uint64_t v6 = 3;
        break;
      case 9:
        uint64_t v6 = 4;
        break;
      default:
        if (v11 == 16) {
          uint64_t v6 = 5;
        }
        else {
          uint64_t v6 = 0;
        }
        break;
    }
    uint64_t v5 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v7 = 0;
  }
  v12 = [v5 indexPathForRow:v6 inSection:v7];
  [(UIPrintPagesPerSheetOption *)self setSelectedIndexPath:v12];

  v13 = [(UIPrintOption *)self tableViewCell];
  id v17 = [v13 contentConfiguration];

  v14 = [(UIPrintPagesPerSheetOption *)self shortSummary];
  [v17 setSecondaryText:v14];

  v15 = [(UIPrintOption *)self tableViewCell];
  [v15 setContentConfiguration:v17];

  v16 = [(UIPrintPagesPerSheetOption *)self summaryString];
  [(UIPrintOption *)self setSummary:v16];
}

- (id)itemList
{
  v3 = [(UIPrintOption *)self printInfo];
  uint64_t v4 = [v3 currentPrinter];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(UIPrintOption *)self printInfo];
    uint64_t v7 = [v6 currentPrinter];
    int v8 = [v7 supportsDuplex];

    if (!v8)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
      id v10 = [(UIPrintPagesPerSheetOption *)self nUpNames];
      uint64_t v11 = [v9 arrayWithObject:v10];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v12 = (void *)MEMORY[0x1E4F1C978];
  id v10 = [(UIPrintPagesPerSheetOption *)self nUpNames];
  v13 = (void *)MEMORY[0x1E4F1C978];
  v14 = (void *)MEMORY[0x1E4F1C9E8];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"Print As Booklet" value:@"Print As Booklet" table:@"Localizable"];
  id v17 = [v14 dictionaryWithObject:v16 forKey:@"Title"];
  v18 = [v13 arrayWithObject:v17];
  uint64_t v11 = objc_msgSend(v12, "arrayWithObjects:", v10, v18, 0);

LABEL_6:
  return v11;
}

- (int64_t)listItemSelected:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIPrintPagesPerSheetOption *)self setSelectedIndexPath:v4];
  uint64_t v5 = [v4 section];
  uint64_t v6 = v5 == 1;
  uint64_t v7 = [(UIPrintOption *)self printInfo];
  uint64_t v8 = [v7 bookletStyle];

  if (v8 != v6)
  {
    uint64_t v9 = [(UIPrintOption *)self printInfo];
    [v9 setBookletStyle:v6];
  }
  if (v5 == 1)
  {
    uint64_t v10 = 2;
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = sizes[2 * [v4 row] + 1];
    uint64_t v10 = sizes[2 * [v4 row]];
  }
  v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v11];
  v17[0] = v12;
  v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
  v17[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = [(UIPrintOption *)self printInfo];
  [v15 setNUpRowsColumns:v14];

  return 1;
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  id v4 = [v3 printOptionsTableView];
  uint64_t v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionListCell"];

  uint64_t v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  uint64_t v7 = [(UIPrintOption *)self title];
  [v6 setText:v7];

  uint64_t v8 = [(UIPrintPagesPerSheetOption *)self shortSummary];
  [v6 setSecondaryText:v8];

  [v5 setContentConfiguration:v6];
  [v5 setAccessoryType:1];
  [v5 setSelectionStyle:3];
  [v5 setItemListDelegate:self];
  [(UIPrintOption *)self setTableViewCell:v5];

  return v5;
}

- (id)itemNameDictForNumber:(int64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F28EE0];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v5 = [v3 localizedStringFromNumber:v4 numberStyle:1];

  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v5 forKey:@"Title"];

  return v6;
}

- (id)shortSummary
{
  v3 = [(UIPrintOption *)self printInfo];
  if ([v3 bookletStyle] == 1)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"Print As Booklet" value:@"Print As Booklet" table:@"Localizable"];
  }
  else
  {
    id v4 = [(UIPrintPagesPerSheetOption *)self nUpNames];
    uint64_t v6 = [(UIPrintPagesPerSheetOption *)self selectedIndexPath];
    uint64_t v7 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v6, "row"));
    uint64_t v5 = [v7 objectForKey:@"Title"];
  }
  return v5;
}

- (id)summaryString
{
  v3 = [(UIPrintOption *)self printInfo];
  uint64_t v4 = [v3 bookletStyle];

  if (v4 == 1)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"Print As Booklet" value:@"Print As Booklet" table:@"Localizable"];
  }
  else
  {
    uint64_t v7 = [(UIPrintOption *)self printInfo];
    uint64_t v8 = [v7 numNUpRows];
    uint64_t v9 = [(UIPrintOption *)self printInfo];
    uint64_t v10 = [v9 numNUpColumns] * v8;

    uint64_t v11 = NSString;
    uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"NUP_PAGES" value:@"NUP_PAGES" table:@"Localizable"];
    v14 = [v5 localizedStringForKey:v13 value:&stru_1F3C9D3F8 table:0];
    uint64_t v6 = objc_msgSend(v11, "localizedStringWithFormat:", v14, v10);
  }
  return v6;
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

- (NSArray)nUpNames
{
  return self->_nUpNames;
}

- (void)setNUpNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nUpNames, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
}

@end