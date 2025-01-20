@interface UIPrintFeedFromOption
- (BOOL)shouldShow;
- (NSArray)trays;
- (NSIndexPath)selectedIndexPath;
- (NSMutableArray)trayNames;
- (UIPrintFeedFromOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (id)capitalizeFirstLetter:(id)a3;
- (id)itemList;
- (id)printOptionTableViewCell;
- (id)selectedTrayName;
- (id)summaryString;
- (int64_t)listItemSelected:(id)a3;
- (void)currentPrinterChanged;
- (void)dealloc;
- (void)didSelectPrintOption;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTrayNames:(id)a3;
- (void)setTrays:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintFeedFromOption

- (UIPrintFeedFromOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIPrintFeedFromOption;
  v4 = [(UIPrintOption *)&v11 initWithPrintInfo:a3 printPanelViewController:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"Feed From" value:@"Feed From" table:@"Localizable"];
    [(UIPrintOption *)v4 setTitle:v6];

    [(UIPrintFeedFromOption *)v4 setTrays:0];
    v7 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [(UIPrintFeedFromOption *)v4 setSelectedIndexPath:v7];

    [(UIPrintFeedFromOption *)v4 currentPrinterChanged];
    v8 = [(UIPrintOption *)v4 printInfo];
    [v8 addObserver:v4 forKeyPath:0x1F3C9DFB8 options:0 context:0];

    v9 = [(UIPrintOption *)v4 printInfo];
    [v9 addObserver:v4 forKeyPath:0x1F3C9DE58 options:0 context:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DFB8];

  v4 = [(UIPrintOption *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DE58];

  v5.receiver = self;
  v5.super_class = (Class)UIPrintFeedFromOption;
  [(UIPrintFeedFromOption *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__UIPrintFeedFromOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  objc_super v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __72__UIPrintFeedFromOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEqualToString:0x1F3C9DE58];
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    return [v3 currentPrinterChanged];
  }
  else
  {
    return [v3 updateFromPrintInfo];
  }
}

- (void)updateFromPrintInfo
{
  if ([(UIPrintFeedFromOption *)self shouldShow])
  {
    v3 = [(UIPrintOption *)self printInfo];
    v4 = [v3 inputSlot];

    if (v4)
    {
      objc_super v5 = [(UIPrintFeedFromOption *)self trays];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        unint64_t v7 = 0;
        uint64_t v8 = *MEMORY[0x1E4F93380];
        do
        {
          v9 = [(UIPrintFeedFromOption *)self trays];
          id v10 = [v9 objectAtIndex:v7];

          objc_super v11 = [v10 allKeys];
          int v12 = [v11 containsObject:v8];

          if (v12)
          {
            v13 = [v10 objectForKey:v8];
            v14 = [(UIPrintOption *)self printInfo];
            v15 = [v14 inputSlot];
            int v16 = [v13 isEqualToString:v15];

            if (v16)
            {
              v17 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:0];
              [(UIPrintFeedFromOption *)self setSelectedIndexPath:v17];

              v18 = [(UIPrintOption *)self tableViewCell];
              v19 = [v18 contentConfiguration];

              v20 = [(UIPrintFeedFromOption *)self selectedTrayName];
              [v19 setSecondaryText:v20];

              v21 = [(UIPrintOption *)self tableViewCell];
              [v21 setContentConfiguration:v19];
            }
          }

          ++v7;
          v22 = [(UIPrintFeedFromOption *)self trays];
          unint64_t v23 = [v22 count];
        }
        while (v7 < v23);
      }
    }
    else
    {
      v24 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      [(UIPrintFeedFromOption *)self setSelectedIndexPath:v24];
    }
    id v25 = [(UIPrintFeedFromOption *)self summaryString];
    [(UIPrintOption *)self setSummary:v25];
  }
}

- (BOOL)shouldShow
{
  v3 = [(UIPrintFeedFromOption *)self trays];
  if (v3)
  {
    v4 = [(UIPrintFeedFromOption *)self trays];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSMutableArray)trayNames
{
  int v2 = self;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!self->_trayNames)
  {
    uint64_t v5 = [(UIPrintFeedFromOption *)self trays];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      unint64_t v7 = [(UIPrintFeedFromOption *)v2 trays];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E4F1CA48];
        id v10 = [(UIPrintFeedFromOption *)v2 trays];
        objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
        objc_super v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v24 = v2;
        int v12 = [(UIPrintFeedFromOption *)v2 trays];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          uint64_t v16 = *MEMORY[0x1E4F93390];
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              v18 = [*(id *)(*((void *)&v25 + 1) + 8 * i) objectForKey:v16];
              if (v18)
              {
                v19 = v18;
                if (([v18 isEqualToString:@"auto"] & 1) != 0
                  || [v19 isEqualToString:@"any"])
                {
                  v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                  v21 = [v20 localizedStringForKey:@"Auto Select" value:@"Auto Select" table:@"Localizable"];

                  v19 = v20;
                }
                else
                {
                  v21 = [(UIPrintFeedFromOption *)v24 capitalizeFirstLetter:v19];
                }

                v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v21 forKey:@"Title"];
                [(NSMutableArray *)v11 addObject:v22];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v14);
        }

        int v2 = v24;
        trayNames = v24->_trayNames;
        v24->_trayNames = v11;
      }
    }
  }
  v3 = v2->_trayNames;
  return v3;
}

- (id)capitalizeFirstLetter:(id)a3
{
  v3 = [a3 lowercaseString];
  v4 = [v3 substringToIndex:1];
  uint64_t v5 = [v4 uppercaseString];
  uint64_t v6 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 1, v5);

  return v6;
}

- (id)itemList
{
  int v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(UIPrintFeedFromOption *)self trayNames];
  v4 = [v2 arrayWithObject:v3];

  return v4;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4 = a3;
  [(UIPrintFeedFromOption *)self setSelectedIndexPath:v4];
  uint64_t v5 = [(UIPrintFeedFromOption *)self trays];
  uint64_t v6 = [v4 row];

  unint64_t v7 = [v5 objectAtIndex:v6];

  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F93380]];
  v9 = [(UIPrintOption *)self printInfo];
  [v9 setInputSlot:v8];

  return 1;
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  id v4 = [v3 printOptionsTableView];
  uint64_t v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionListCell"];

  uint64_t v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  unint64_t v7 = [(UIPrintOption *)self title];
  [v6 setText:v7];

  uint64_t v8 = [(UIPrintFeedFromOption *)self selectedTrayName];
  [v6 setSecondaryText:v8];

  [v5 setContentConfiguration:v6];
  [v5 setAccessoryType:1];
  [v5 setSelectionStyle:3];
  [v5 setItemListDelegate:self];
  [(UIPrintOption *)self setTableViewCell:v5];

  return v5;
}

- (NSArray)trays
{
  p_trays = &self->_trays;
  if (!self->_trays)
  {
    id v4 = [(UIPrintOption *)self printInfo];
    uint64_t v5 = [v4 currentPrinter];
    uint64_t v6 = [v5 printerInfoDict];

    if (v6)
    {
      unint64_t v7 = [(UIPrintOption *)self printInfo];
      uint64_t v8 = [v7 currentPrinter];
      v9 = [v8 supportedTrays];

      if (!v9 || (unint64_t)[v9 count] < 2) {
        goto LABEL_9;
      }
      if ([v9 count] == 2)
      {
        id v10 = [v9 objectAtIndex:0];
        uint64_t v11 = *MEMORY[0x1E4F93380];
        int v12 = [v10 objectForKey:*MEMORY[0x1E4F93380]];

        uint64_t v13 = [v9 objectAtIndex:1];
        uint64_t v14 = [v13 objectForKey:v11];

        if ([v12 isEqual:@"auto"])
        {

LABEL_9:
          uint64_t v16 = 0;
LABEL_10:
          if ([v16 count]) {
            v17 = v16;
          }
          else {
            v17 = 0;
          }
          objc_storeStrong((id *)p_trays, v17);

          goto LABEL_14;
        }
        char v15 = [v14 isEqual:@"auto"];

        if (v15) {
          goto LABEL_9;
        }
      }
      uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
      [v16 sortUsingFunction:compareTrayNames context:0];
      goto LABEL_10;
    }
  }
LABEL_14:
  v18 = *p_trays;
  return v18;
}

- (void)currentPrinterChanged
{
  [(UIPrintFeedFromOption *)self setTrays:0];
  [(UIPrintFeedFromOption *)self setTrayNames:0];
  v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v3;

  [(UIPrintFeedFromOption *)self updateFromPrintInfo];
}

- (id)selectedTrayName
{
  v3 = [(UIPrintFeedFromOption *)self trayNames];
  id v4 = [(UIPrintFeedFromOption *)self selectedIndexPath];
  uint64_t v5 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "row"));
  uint64_t v6 = [v5 objectForKey:@"Title"];

  return v6;
}

- (id)summaryString
{
  v3 = [(UIPrintFeedFromOption *)self selectedIndexPath];
  uint64_t v4 = [v3 row];

  if (v4)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v7 = [v6 localizedStringForKey:@"Feed From %@" value:@"Feed From %@" table:@"Localizable"];
    uint64_t v8 = [(UIPrintFeedFromOption *)self selectedTrayName];
    v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8);
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = [v6 localizedStringForKey:@"Auto Select Feed" value:@"Auto Select Feed" table:@"Localizable"];
  }

  return v9;
}

- (void)didSelectPrintOption
{
  id v2 = [(UIPrintOption *)self tableViewCell];
  [v2 printOptionCellTapped];
}

- (void)setTrays:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void)setTrayNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trayNames, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_trays, 0);
}

@end