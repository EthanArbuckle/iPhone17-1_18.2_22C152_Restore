@interface UIPrintMediaTypeOption
- (BOOL)shouldShow;
- (NSArray)mediaTypes;
- (NSIndexPath)selectedIndexPath;
- (NSMutableArray)mediaTypeNames;
- (UIPrintMediaTypeOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (id)itemList;
- (id)printOptionTableViewCell;
- (id)selectedMediaTypeName;
- (id)summaryString;
- (int64_t)listItemSelected:(id)a3;
- (void)currentPrinterChanged;
- (void)dealloc;
- (void)didSelectPrintOption;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMediaTypeNames:(id)a3;
- (void)setMediaTypes:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintMediaTypeOption

- (UIPrintMediaTypeOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"Media Type" value:@"Media Type" table:@"Localizable"];
  [(UIPrintOption *)self setTitle:v10];

  v18.receiver = self;
  v18.super_class = (Class)UIPrintMediaTypeOption;
  v11 = [(UIPrintOption *)&v18 initWithPrintInfo:v8 printPanelViewController:v7];

  if (v11)
  {
    mediaTypes = v11->_mediaTypes;
    v11->_mediaTypes = 0;

    uint64_t v13 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    selectedIndexPath = v11->_selectedIndexPath;
    v11->_selectedIndexPath = (NSIndexPath *)v13;

    [(UIPrintMediaTypeOption *)v11 currentPrinterChanged];
    v15 = [(UIPrintOption *)v11 printInfo];
    [v15 addObserver:v11 forKeyPath:0x1F3C9DF98 options:0 context:0];

    v16 = [(UIPrintOption *)v11 printInfo];
    [v16 addObserver:v11 forKeyPath:0x1F3C9DE58 options:0 context:0];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DF98];

  v4 = [(UIPrintOption *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DE58];

  v5.receiver = self;
  v5.super_class = (Class)UIPrintMediaTypeOption;
  [(UIPrintMediaTypeOption *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__UIPrintMediaTypeOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __73__UIPrintMediaTypeOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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
  if ([(UIPrintMediaTypeOption *)self shouldShow])
  {
    v3 = [(UIPrintOption *)self printInfo];
    v4 = [v3 mediaType];

    if (v4)
    {
      objc_super v5 = [(UIPrintMediaTypeOption *)self mediaTypes];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        unint64_t v7 = 0;
        uint64_t v8 = *MEMORY[0x1E4F933D8];
        do
        {
          v9 = [(UIPrintMediaTypeOption *)self mediaTypes];
          id v10 = [v9 objectAtIndex:v7];

          v11 = [v10 objectForKey:v8];
          v12 = [(UIPrintOption *)self printInfo];
          uint64_t v13 = [v12 mediaType];
          int v14 = [v11 isEqualToString:v13];

          if (v14)
          {
            v15 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:0];
            [(UIPrintMediaTypeOption *)self setSelectedIndexPath:v15];

            v16 = [(UIPrintOption *)self tableViewCell];
            v17 = [v16 contentConfiguration];

            objc_super v18 = self;
            v19 = [v18 selectedMediaTypeName];
            [v17 setSecondaryText:v19];

            v20 = [(UIPrintOption *)self tableViewCell];
            [v20 setContentConfiguration:v17];
          }
          ++v7;
          v21 = [(UIPrintMediaTypeOption *)self mediaTypes];
          unint64_t v22 = [v21 count];
        }
        while (v7 < v22);
      }
    }
    else
    {
      v23 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      [(UIPrintMediaTypeOption *)self setSelectedIndexPath:v23];
    }
    id v24 = [(UIPrintMediaTypeOption *)self summaryString];
    [(UIPrintOption *)self setSummary:v24];
  }
}

- (NSArray)mediaTypes
{
  p_mediaTypes = &self->_mediaTypes;
  if (!self->_mediaTypes)
  {
    v4 = [(UIPrintOption *)self printInfo];
    objc_super v5 = [v4 currentPrinter];
    uint64_t v6 = [v5 printerInfoDict];

    if (v6)
    {
      unint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v8 = [(UIPrintOption *)self printInfo];
      v9 = [v8 currentPrinter];
      id v10 = [v9 supportedMediaTypes];
      v11 = [v7 arrayWithArray:v10];

      [v11 sortUsingFunction:compareMediaTypes context:0];
      if ([v11 count]) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
      objc_storeStrong((id *)p_mediaTypes, v12);
    }
  }
  uint64_t v13 = *p_mediaTypes;
  return v13;
}

- (void)currentPrinterChanged
{
  [(UIPrintMediaTypeOption *)self setMediaTypes:0];
  [(UIPrintMediaTypeOption *)self setMediaTypeNames:0];
  v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v3;

  [(UIPrintMediaTypeOption *)self updateFromPrintInfo];
}

- (BOOL)shouldShow
{
  v3 = [(UIPrintMediaTypeOption *)self mediaTypes];
  if (v3)
  {
    v4 = [(UIPrintMediaTypeOption *)self mediaTypes];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSMutableArray)mediaTypeNames
{
  int v2 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!self->_mediaTypeNames)
  {
    uint64_t v5 = [(UIPrintMediaTypeOption *)self mediaTypes];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      unint64_t v7 = [(UIPrintMediaTypeOption *)v2 mediaTypes];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E4F1CA48];
        id v10 = [(UIPrintMediaTypeOption *)v2 mediaTypes];
        objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v26 = v2;
        id obj = [(UIPrintMediaTypeOption *)v2 mediaTypes];
        uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v29;
          uint64_t v15 = *MEMORY[0x1E4F933E8];
          uint64_t v16 = *MEMORY[0x1E4F933D8];
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(obj);
              }
              objc_super v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v19 = [v18 objectForKey:v15];
              if (v19)
              {
                v20 = (void *)v19;
                v21 = [v18 objectForKey:v16];
                if (([v21 isEqualToString:@"auto"] & 1) != 0
                  || [v21 isEqualToString:@"any"])
                {
                  unint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                  uint64_t v23 = [v22 localizedStringForKey:@"Auto Select" value:@"Auto Select" table:@"Localizable"];

                  v20 = (void *)v23;
                }
                id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v20 forKey:@"Title"];
                [(NSMutableArray *)v11 addObject:v24];
              }
            }
            uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v13);
        }

        int v2 = v26;
        mediaTypeNames = v26->_mediaTypeNames;
        v26->_mediaTypeNames = v11;
      }
    }
  }
  v3 = v2->_mediaTypeNames;
  return v3;
}

- (id)itemList
{
  int v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(UIPrintMediaTypeOption *)self mediaTypeNames];
  v4 = [v2 arrayWithObject:v3];

  return v4;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4 = a3;
  [(UIPrintMediaTypeOption *)self setSelectedIndexPath:v4];
  uint64_t v5 = [(UIPrintMediaTypeOption *)self mediaTypes];
  uint64_t v6 = [v4 row];

  unint64_t v7 = [v5 objectAtIndex:v6];

  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F933D8]];
  v9 = [(UIPrintOption *)self printInfo];
  [v9 setMediaType:v8];

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

  uint64_t v8 = [(UIPrintMediaTypeOption *)self selectedMediaTypeName];
  [v6 setSecondaryText:v8];

  [v5 setContentConfiguration:v6];
  [v5 setAccessoryType:1];
  [v5 setSelectionStyle:3];
  [v5 setItemListDelegate:self];
  [(UIPrintOption *)self setTableViewCell:v5];
  v9 = [(UIPrintMediaTypeOption *)self summaryString];
  [(UIPrintOption *)self setSummary:v9];

  return v5;
}

- (id)selectedMediaTypeName
{
  v3 = [(UIPrintMediaTypeOption *)self mediaTypeNames];
  id v4 = [(UIPrintMediaTypeOption *)self selectedIndexPath];
  uint64_t v5 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "row"));
  uint64_t v6 = [v5 objectForKey:@"Title"];

  return v6;
}

- (id)summaryString
{
  v3 = [(UIPrintMediaTypeOption *)self selectedIndexPath];
  uint64_t v4 = [v3 row];

  if (v4)
  {
    uint64_t v5 = [(UIPrintMediaTypeOption *)self selectedMediaTypeName];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v6 localizedStringForKey:@"Auto Select Media Type" value:@"Auto Select Media Type" table:@"Localizable"];
  }
  return v5;
}

- (void)didSelectPrintOption
{
  id v2 = [(UIPrintOption *)self tableViewCell];
  [v2 printOptionCellTapped];
}

- (void)setMediaTypes:(id)a3
{
}

- (void)setMediaTypeNames:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_mediaTypeNames, 0);
  objc_storeStrong((id *)&self->_mediaTypes, 0);
}

@end