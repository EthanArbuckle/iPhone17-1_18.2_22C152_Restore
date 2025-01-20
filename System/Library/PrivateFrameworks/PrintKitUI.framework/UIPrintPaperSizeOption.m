@interface UIPrintPaperSizeOption
- (NSArray)loadedPaperNames;
- (NSArray)loadedPaperSizes;
- (NSArray)supportedPaperNames;
- (NSArray)supportedPaperSizes;
- (NSIndexPath)selectedIndexPath;
- (UIPrintPaperSizeOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrinter)observedPrinter;
- (id)_removeRollsFrom:(id)a3;
- (id)defaultPaperIndex;
- (id)getPaperNames:(id)a3;
- (id)itemList;
- (id)paperList;
- (id)printOptionTableViewCell;
- (id)summary;
- (int64_t)listItemSelected:(id)a3;
- (void)currentPrinterChanged;
- (void)dealloc;
- (void)didSelectPrintOption;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLoadedPaperNames:(id)a3;
- (void)setLoadedPaperSizes:(id)a3;
- (void)setObservedPrinter:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSupportedPaperNames:(id)a3;
- (void)setSupportedPaperSizes:(id)a3;
- (void)updateSelectedPaper;
@end

@implementation UIPrintPaperSizeOption

- (void)dealloc
{
  pkPrinterQueue = self->_pkPrinterQueue;
  self->_pkPrinterQueue = 0;

  v4 = [(UIPrintPaperSizeOption *)self observedPrinter];
  [v4 removeObserver:self forKeyPath:0x1F3C9EE98];

  v5 = [(UIPrintOption *)self printInfo];
  [v5 removeObserver:self forKeyPath:0x1F3C9DED8];

  v6 = [(UIPrintOption *)self printInfo];
  [v6 removeObserver:self forKeyPath:0x1F3C9DE58];

  v7.receiver = self;
  v7.super_class = (Class)UIPrintPaperSizeOption;
  [(UIPrintPaperSizeOption *)&v7 dealloc];
}

- (UIPrintPaperSizeOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UIPrintPaperSizeOption;
  objc_super v7 = [(UIPrintOption *)&v33 initWithPrintInfo:v6 printPanelViewController:a4];
  if (!v7) {
    goto LABEL_17;
  }
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Paper Size" value:@"Paper Size" table:@"Localizable"];
  [(UIPrintOption *)v7 setTitle:v9];

  uint64_t v10 = [(UIPrintPaperSizeOption *)v7 defaultPaperIndex];
  selectedIndexPath = v7->_selectedIndexPath;
  v7->_selectedIndexPath = (NSIndexPath *)v10;

  dispatch_queue_t v12 = dispatch_queue_create("com.apple.UIKit.UIPrintPaperSizeOption.pkPrinter", 0);
  pkPrinterQueue = v7->_pkPrinterQueue;
  v7->_pkPrinterQueue = (OS_dispatch_queue *)v12;

  v14 = [(UIPrintOption *)v7 printInfo];
  uint64_t v15 = [v14 currentPrinter];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(UIPrintOption *)v7 printInfo];
    v18 = [v17 currentPrinter];
    v19 = [v18 printerInfoDict];

    if (!v19) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  [(UIPrintPaperSizeOption *)v7 updateSelectedPaper];
LABEL_7:
  v20 = [(UIPrintOption *)v7 printInfo];
  v21 = [v20 currentPrinter];

  if (v21)
  {
    v22 = [(UIPrintOption *)v7 printPanelViewController];
    v23 = [v22 printInteractionController];
    if ([v23 _canShowPaperList])
    {
      v24 = [(UIPrintOption *)v7 printInfo];
      v25 = [v24 currentPrinter];
      v26 = [v25 printerInfoDict];
      if (v26)
      {
        v27 = [(UIPrintPaperSizeOption *)v7 loadedPaperSizes];
        -[UIPrintOption setShouldShow:](v7, "setShouldShow:", [v27 count] != 0);
      }
      else
      {
        [(UIPrintOption *)v7 setShouldShow:0];
      }
    }
    else
    {
      [(UIPrintOption *)v7 setShouldShow:0];
    }
  }
  else
  {
    [(UIPrintOption *)v7 setShouldShow:1];
  }
  v28 = [v6 currentPrinter];
  [(UIPrintPaperSizeOption *)v7 setObservedPrinter:v28];

  v29 = [(UIPrintPaperSizeOption *)v7 observedPrinter];
  [v29 addObserver:v7 forKeyPath:0x1F3C9EE98 options:0 context:0];

  v30 = [(UIPrintOption *)v7 printInfo];
  [v30 addObserver:v7 forKeyPath:0x1F3C9DED8 options:0 context:0];

  v31 = [(UIPrintOption *)v7 printInfo];
  [v31 addObserver:v7 forKeyPath:0x1F3C9DE58 options:0 context:0];

LABEL_17:
  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__UIPrintPaperSizeOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __73__UIPrintPaperSizeOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:0x1F3C9DE58])
  {
    v2 = [*(id *)(a1 + 40) observedPrinter];
    [v2 removeObserver:*(void *)(a1 + 40) forKeyPath:0x1F3C9EE98];

    v3 = [*(id *)(a1 + 40) printInfo];
    v4 = [v3 currentPrinter];
    [*(id *)(a1 + 40) setObservedPrinter:v4];

    v5 = [*(id *)(a1 + 40) observedPrinter];
    [v5 addObserver:*(void *)(a1 + 40) forKeyPath:0x1F3C9EE98 options:0 context:0];

LABEL_8:
    id v8 = *(void **)(a1 + 40);
    return [v8 currentPrinterChanged];
  }
  if (![*(id *)(a1 + 32) isEqualToString:0x1F3C9DED8])
  {
    uint64_t result = [*(id *)(a1 + 32) isEqualToString:0x1F3C9EE98];
    if (!result) {
      return result;
    }
    goto LABEL_8;
  }
  id v6 = *(void **)(a1 + 40);
  return [v6 updateSelectedPaper];
}

- (id)_removeRollsFrom:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  v5 = [v3 predicateWithBlock:&__block_literal_global_5];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

uint64_t __43__UIPrintPaperSizeOption__removeRollsFrom___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _pkPaper];
  uint64_t v3 = [v2 isRoll] ^ 1;

  return v3;
}

- (id)paperList
{
  uint64_t v3 = [(UIPrintOption *)self printInfo];
  id v4 = [v3 currentPrinter];

  if (v4
    && ([v4 printerInfoDict], v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    v18 = 0;
  }
  else
  {
    id v6 = [(UIPrintOption *)self printPanelViewController];
    id v7 = [v6 printInteractionController];
    [v7 _printItemContentSize];
    double v9 = v8;
    double v11 = v10;

    if (v4)
    {
      dispatch_queue_t v12 = [(UIPrintOption *)self printInfo];
      int v13 = [v12 scaleUp];

      v14 = [v4 _internalPrinter];
      uint64_t v15 = [(UIPrintOption *)self printInfo];
      uint64_t v16 = [v15 duplex];
      if (v13)
      {
        v17 = +[UIPrintPaper _readyDocumentPaperListForPrinter:withDuplexMode:contentSize:scaleUpForRoll:](UIPrintPaper, "_readyDocumentPaperListForPrinter:withDuplexMode:contentSize:scaleUpForRoll:", v14, v16, 1, v9, v11);
      }
      else
      {
        v19 = [(UIPrintOption *)self printInfo];
        v17 = +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", v14, v16, [v19 outputType], v9, v11);
      }
    }
    else
    {
      v14 = [(UIPrintOption *)self printInfo];
      v17 = +[UIPrintPaper _genericPaperListForOutputType:](UIPrintPaper, "_genericPaperListForOutputType:", [v14 outputType]);
    }

    if (v9 == *MEMORY[0x1E4F1DB30] && v11 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      uint64_t v21 = [(UIPrintPaperSizeOption *)self _removeRollsFrom:v17];

      v17 = (void *)v21;
    }
    v18 = [v17 sortedArrayUsingComparator:&__block_literal_global_551];
  }
  return v18;
}

uint64_t __35__UIPrintPaperSizeOption_paperList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 _pkPaper];
  id v6 = [v5 localizedName];
  id v7 = [v4 _pkPaper];

  double v8 = [v7 localizedName];
  uint64_t v9 = [v6 localizedCompare:v8];

  return v9;
}

- (NSArray)loadedPaperSizes
{
  loadedPaperSizes = self->_loadedPaperSizes;
  if (!loadedPaperSizes)
  {
    id v4 = [(UIPrintPaperSizeOption *)self paperList];
    v5 = self->_loadedPaperSizes;
    self->_loadedPaperSizes = v4;

    loadedPaperSizes = self->_loadedPaperSizes;
  }
  return loadedPaperSizes;
}

- (NSArray)loadedPaperNames
{
  loadedPaperNames = self->_loadedPaperNames;
  if (!loadedPaperNames)
  {
    id v4 = [(UIPrintPaperSizeOption *)self loadedPaperSizes];
    v5 = [(UIPrintPaperSizeOption *)self getPaperNames:v4];
    id v6 = self->_loadedPaperNames;
    self->_loadedPaperNames = v5;

    loadedPaperNames = self->_loadedPaperNames;
  }
  return loadedPaperNames;
}

- (NSArray)supportedPaperNames
{
  uint64_t v3 = [(UIPrintPaperSizeOption *)self supportedPaperSizes];
  if (v3)
  {
    supportedPaperNames = self->_supportedPaperNames;

    if (!supportedPaperNames)
    {
      v5 = [(UIPrintPaperSizeOption *)self supportedPaperSizes];
      id v6 = [(UIPrintPaperSizeOption *)self getPaperNames:v5];
      id v7 = self->_supportedPaperNames;
      self->_supportedPaperNames = v6;
    }
  }
  double v8 = self->_supportedPaperNames;
  return v8;
}

- (id)getPaperNames:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
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
          double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          dispatch_queue_t v12 = [v11 _localizedName];
          if (v12)
          {
            int v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
            [v13 setObject:v12 forKey:@"Title"];
            v14 = [v11 _localizedMediaTypeName];
            if (v14) {
              [v13 setObject:v14 forKey:@"SubTitle"];
            }
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)itemList
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v4 = [(UIPrintPaperSizeOption *)self loadedPaperNames];

  if (v4)
  {
    v5 = [(UIPrintPaperSizeOption *)self loadedPaperNames];
    [v3 addObject:v5];
  }
  id v6 = [(UIPrintPaperSizeOption *)self supportedPaperNames];

  if (v6)
  {
    uint64_t v7 = [(UIPrintPaperSizeOption *)self supportedPaperNames];
    [v3 addObject:v7];
  }
  if ([v3 count]) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4 = a3;
  [(UIPrintPaperSizeOption *)self setSelectedIndexPath:v4];
  v5 = [(UIPrintPaperSizeOption *)self loadedPaperSizes];
  uint64_t v6 = [v4 row];

  uint64_t v7 = [v5 objectAtIndex:v6];

  uint64_t v8 = [(UIPrintOption *)self printPanelViewController];
  id v9 = [v8 printInteractionController];
  [v9 setPaper:v7];

  double v10 = [(UIPrintOption *)self printInfo];
  [v10 setPrintPaper:v7];

  return 1;
}

- (id)printOptionTableViewCell
{
  id v3 = objc_alloc_init(UIPrintOptionListCell);
  id v4 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v5 = [(UIPrintOption *)self title];
  [v4 setText:v5];

  uint64_t v6 = [(UIPrintPaperSizeOption *)self summary];
  [v4 setSecondaryText:v6];

  [(UIPrintOptionListCell *)v3 setContentConfiguration:v4];
  [(UIPrintOptionListCell *)v3 setAccessoryType:1];
  [(UIPrintOptionListCell *)v3 setSelectionStyle:3];
  [(UIPrintOptionListCell *)v3 setItemListDelegate:self];
  [(UIPrintOption *)self setTableViewCell:v3];

  return v3;
}

- (id)defaultPaperIndex
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v4 = [(UIPrintOption *)self printInfo];
  v5 = [v4 currentPrinter];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [(UIPrintPaperSizeOption *)self loadedPaperSizes];

    if (!v6) {
      goto LABEL_15;
    }
    id v4 = [MEMORY[0x1E4F932E8] defaultGenericPaperForLocale:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [(UIPrintPaperSizeOption *)self loadedPaperSizes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          dispatch_queue_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          int v13 = [v12 _pkPaper];
          int v14 = [v13 isEqualSizeAndMediaType:v4];

          if (v14)
          {
            uint64_t v15 = (void *)MEMORY[0x1E4F28D58];
            long long v16 = [(UIPrintPaperSizeOption *)self loadedPaperSizes];
            uint64_t v17 = objc_msgSend(v15, "indexPathForRow:inSection:", objc_msgSend(v16, "indexOfObject:", v12), 0);

            id v3 = (void *)v17;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
  }
LABEL_15:
  return v3;
}

- (void)updateSelectedPaper
{
  pkPrinterQueue = self->_pkPrinterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__UIPrintPaperSizeOption_updateSelectedPaper__block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(pkPrinterQueue, block);
}

void __45__UIPrintPaperSizeOption_updateSelectedPaper__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) printInfo];
  id v3 = [v2 printPaper];
  id v4 = [v3 _pkPaper];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [*(id *)(a1 + 32) loadedPaperSizes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v22;
    long long v18 = v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v10), "_pkPaper", v18);
        int v12 = [v11 isEqualSizeAndMediaType:v4];

        if (v12)
        {
          int v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 + v10 inSection:0];
          [*(id *)(a1 + 32) setSelectedIndexPath:v13];

          if (pthread_main_np() == 1)
          {
            int v14 = [*(id *)(a1 + 32) tableViewCell];
            uint64_t v15 = [v14 contentConfiguration];

            long long v16 = [*(id *)(a1 + 32) summary];
            [v15 setSecondaryText:v16];

            uint64_t v17 = [*(id *)(a1 + 32) tableViewCell];
            [v17 setContentConfiguration:v15];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v20[0] = __45__UIPrintPaperSizeOption_updateSelectedPaper__block_invoke_2;
            v20[1] = &unk_1E6DA1408;
            v20[2] = *(void *)(a1 + 32);
            dispatch_sync(MEMORY[0x1E4F14428], block);
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      v8 += v10;
    }
    while (v7);
  }
}

void __45__UIPrintPaperSizeOption_updateSelectedPaper__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableViewCell];
  id v5 = [v2 contentConfiguration];

  id v3 = [*(id *)(a1 + 32) summary];
  [v5 setSecondaryText:v3];

  id v4 = [*(id *)(a1 + 32) tableViewCell];
  [v4 setContentConfiguration:v5];
}

- (void)currentPrinterChanged
{
  [(UIPrintPaperSizeOption *)self setLoadedPaperSizes:0];
  [(UIPrintPaperSizeOption *)self setLoadedPaperNames:0];
  [(UIPrintPaperSizeOption *)self setSupportedPaperSizes:0];
  [(UIPrintPaperSizeOption *)self setSupportedPaperNames:0];
  id v3 = [(UIPrintPaperSizeOption *)self defaultPaperIndex];
  [(UIPrintPaperSizeOption *)self setSelectedIndexPath:v3];

  [(UIPrintPaperSizeOption *)self updateSelectedPaper];
  id v4 = [(UIPrintOption *)self printInfo];
  id v5 = [v4 currentPrinter];

  if (v5)
  {
    id v11 = [(UIPrintOption *)self printPanelViewController];
    uint64_t v6 = [v11 printInteractionController];
    if ([v6 _canShowPaperList])
    {
      uint64_t v7 = [(UIPrintOption *)self printInfo];
      uint64_t v8 = [v7 currentPrinter];
      uint64_t v9 = [v8 printerInfoDict];
      if (v9)
      {
        uint64_t v10 = [(UIPrintPaperSizeOption *)self loadedPaperSizes];
        -[UIPrintOption setShouldShow:](self, "setShouldShow:", [v10 count] != 0);
      }
      else
      {
        [(UIPrintOption *)self setShouldShow:0];
      }
    }
    else
    {
      [(UIPrintOption *)self setShouldShow:0];
    }
  }
  else
  {
    [(UIPrintOption *)self setShouldShow:1];
  }
}

- (id)summary
{
  id v3 = [(UIPrintPaperSizeOption *)self selectedIndexPath];
  if ([v3 section] == 1)
  {
    id v4 = [(UIPrintPaperSizeOption *)self supportedPaperNames];
  }
  else
  {
    id v5 = [(UIPrintPaperSizeOption *)self loadedPaperNames];
    if (v5) {
      [(UIPrintPaperSizeOption *)self loadedPaperNames];
    }
    else {
    id v4 = [(UIPrintPaperSizeOption *)self supportedPaperNames];
    }
  }
  unint64_t v6 = [v4 count];
  uint64_t v7 = [(UIPrintPaperSizeOption *)self selectedIndexPath];
  unint64_t v8 = [v7 row];

  if (v6 <= v8)
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v9 = [(UIPrintPaperSizeOption *)self selectedIndexPath];
    uint64_t v10 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v9, "row"));
    id v11 = [v10 objectForKey:@"Title"];
  }
  return v11;
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

- (void)setLoadedPaperSizes:(id)a3
{
}

- (NSArray)supportedPaperSizes
{
  return self->_supportedPaperSizes;
}

- (void)setSupportedPaperSizes:(id)a3
{
}

- (void)setLoadedPaperNames:(id)a3
{
}

- (void)setSupportedPaperNames:(id)a3
{
}

- (UIPrinter)observedPrinter
{
  return self->_observedPrinter;
}

- (void)setObservedPrinter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedPrinter, 0);
  objc_storeStrong((id *)&self->_supportedPaperNames, 0);
  objc_storeStrong((id *)&self->_loadedPaperNames, 0);
  objc_storeStrong((id *)&self->_supportedPaperSizes, 0);
  objc_storeStrong((id *)&self->_loadedPaperSizes, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_pkPrinterQueue, 0);
}

@end