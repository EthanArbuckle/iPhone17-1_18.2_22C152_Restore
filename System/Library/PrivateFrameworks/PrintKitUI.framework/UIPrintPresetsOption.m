@interface UIPrintPresetsOption
- (BOOL)isItemSelected:(id)a3;
- (BOOL)printerContainsQuality:(int64_t)a3;
- (BOOL)shouldShow;
- (NSArray)presets;
- (NSArray)printerPresets;
- (NSArray)standardPresets;
- (NSDictionary)colorFineStandardPreset;
- (NSDictionary)colorStandardPreset;
- (NSDictionary)grayscaleDraftStandardPreset;
- (NSDictionary)grayscaleStandardPreset;
- (NSIndexPath)selectedIndexPath;
- (NSMutableArray)presetNames;
- (UILabel)appliedPresetsSummaryLabel;
- (UIPrintInfo)origPrintInfo;
- (UIPrintPresetsOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrinter)observedPrinter;
- (id)appliedPresetsSummary;
- (id)getPrinterPresets;
- (id)getStandardPresets;
- (id)itemList;
- (id)printOptionTableViewCell;
- (id)selectedItem;
- (id)selectedItems;
- (id)summary;
- (id)titleForFooterInSection:(int64_t)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (int64_t)listItemSelected:(id)a3;
- (void)currentPrinterChanged;
- (void)dealloc;
- (void)didSelectPrintOption;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppliedPresetsSummaryLabel:(id)a3;
- (void)setColorFineStandardPreset:(id)a3;
- (void)setColorStandardPreset:(id)a3;
- (void)setGrayscaleDraftStandardPreset:(id)a3;
- (void)setGrayscaleStandardPreset:(id)a3;
- (void)setObservedPrinter:(id)a3;
- (void)setOrigPrintInfo:(id)a3;
- (void)setPresetNames:(id)a3;
- (void)setPresets:(id)a3;
- (void)setPrinterPresets:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setStandardPresets:(id)a3;
- (void)updateFromPrintInfo;
- (void)updatePresetsList;
- (void)updatePrintInfoWithSelectedIndex:(id)a3;
@end

@implementation UIPrintPresetsOption

- (UIPrintPresetsOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIPrintPresetsOption;
  v7 = [(UIPrintOption *)&v18 initWithPrintInfo:v6 printPanelViewController:a4];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"Presets" value:@"Presets" table:@"Localizable"];
    [(UIPrintOption *)v7 setTitle:v9];

    [(UIPrintPresetsOption *)v7 setPresets:0];
    v10 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [(UIPrintPresetsOption *)v7 setSelectedIndexPath:v10];

    [(UIPrintPresetsOption *)v7 updateFromPrintInfo];
    v11 = [(UIPrintOption *)v7 printInfo];
    [v11 addObserver:v7 forKeyPath:0x1F3C9DE98 options:0 context:0];

    v12 = [(UIPrintOption *)v7 printInfo];
    [v12 addObserver:v7 forKeyPath:0x1F3C9DE58 options:0 context:0];

    v13 = [v6 currentPrinter];
    [(UIPrintPresetsOption *)v7 setObservedPrinter:v13];

    v14 = [(UIPrintPresetsOption *)v7 observedPrinter];
    [v14 addObserver:v7 forKeyPath:0x1F3C9EE98 options:0 context:0];

    v15 = [(UIPrintOption *)v7 printInfo];
    v16 = (void *)[v15 copy];
    [(UIPrintPresetsOption *)v7 setOrigPrintInfo:v16];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DE98];

  v4 = [(UIPrintOption *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DE58];

  v5 = [(UIPrintPresetsOption *)self observedPrinter];
  [v5 removeObserver:self forKeyPath:0x1F3C9EE98];

  v6.receiver = self;
  v6.super_class = (Class)UIPrintPresetsOption;
  [(UIPrintPresetsOption *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__UIPrintPresetsOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __71__UIPrintPresetsOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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

    [*(id *)(a1 + 40) currentPrinterChanged];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:0x1F3C9EE98])
  {
    [*(id *)(a1 + 40) updatePresetsList];
  }
  objc_super v6 = *(void **)(a1 + 40);
  return [v6 updateFromPrintInfo];
}

- (BOOL)shouldShow
{
  v3 = [(UIPrintPresetsOption *)self presets];
  if (v3)
  {
    v4 = [(UIPrintPresetsOption *)self presets];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)updateFromPrintInfo
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(UIPrintOption *)self printInfo];
  v4 = [v3 jobPreset];
  BOOL v5 = [v4 objectForKey:@"PresetTitle"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v6 = [(UIPrintPresetsOption *)self presets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
      v12 = [v11 objectForKey:@"PresetTitle"];
      if ([v12 isEqualToString:v5]) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v13 = [(UIPrintPresetsOption *)self presets];
    uint64_t v14 = [v13 indexOfObject:v11];

    v15 = [MEMORY[0x1E4F28D58] indexPathForRow:v14 inSection:1];

    if (v15) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v15 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
LABEL_12:
  [(UIPrintPresetsOption *)self setSelectedIndexPath:v15];

  v16 = [(UIPrintOption *)self tableViewCell];
  v17 = [v16 contentConfiguration];

  objc_super v18 = [(UIPrintPresetsOption *)self summary];
  [v17 setSecondaryText:v18];

  v19 = [(UIPrintOption *)self tableViewCell];
  [v19 setContentConfiguration:v17];
}

- (void)updatePresetsList
{
  v3 = [(UIPrintPresetsOption *)self getPrinterPresets];
  [(UIPrintPresetsOption *)self setPrinterPresets:v3];

  v4 = [(UIPrintPresetsOption *)self getStandardPresets];
  [(UIPrintPresetsOption *)self setStandardPresets:v4];

  BOOL v5 = [(UIPrintPresetsOption *)self printerPresets];
  if ([v5 count]) {
    [(UIPrintPresetsOption *)self printerPresets];
  }
  else {
  objc_super v6 = [(UIPrintPresetsOption *)self standardPresets];
  }
  [(UIPrintPresetsOption *)self setPresets:v6];

  [(UIPrintPresetsOption *)self setPresetNames:0];
  id v8 = [(UIPrintPresetsOption *)self appliedPresetsSummary];
  uint64_t v7 = [(UIPrintPresetsOption *)self appliedPresetsSummaryLabel];
  [v7 setText:v8];
}

- (void)currentPrinterChanged
{
  [(UIPrintPresetsOption *)self updatePresetsList];
  v3 = [(UIPrintPresetsOption *)self printerPresets];

  v4 = [(UIPrintOption *)self printInfo];
  id v5 = v4;
  if (v3) {
    [v4 setJobPreset:0];
  }
  else {
    [v4 setAppliedPresetsList:0];
  }
}

- (void)updatePrintInfoWithSelectedIndex:(id)a3
{
  id v25 = a3;
  if (![v25 section])
  {
    uint64_t v9 = [(UIPrintOption *)self printInfo];
    v17 = [(UIPrintPresetsOption *)self origPrintInfo];
    [v9 resetToDefaultSettings:v17];
LABEL_14:

    goto LABEL_15;
  }
  v4 = [(UIPrintPresetsOption *)self presets];
  unint64_t v5 = [v4 count];
  objc_super v6 = [(UIPrintPresetsOption *)self selectedIndexPath];
  unint64_t v7 = [v6 row];

  if (v5 <= v7) {
    goto LABEL_16;
  }
  id v8 = [(UIPrintPresetsOption *)self presets];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v25, "row"));

  if (v9)
  {
    uint64_t v10 = [v9 objectForKey:@"PresetType"];
    uint64_t v11 = [v10 integerValue];

    v12 = [(UIPrintOption *)self printInfo];
    v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 appliedPresetsList];
      if (v14)
      {
        v15 = [(UIPrintOption *)self printInfo];
        v16 = [v15 appliedPresetsList];
        v17 = (void *)[v16 mutableCopy];
      }
      else
      {
        v17 = [MEMORY[0x1E4F1CA48] array];
      }

      char v19 = [v17 containsObject:v9];
      [v17 removeObject:v9];
      if ((v19 & 1) == 0)
      {
        [v17 addObject:v9];
        long long v20 = [(UIPrintOption *)self printInfo];
        long long v21 = [v9 objectForKey:@"PresetInfo"];
        [v20 updateWithDictionary:v21];
      }
      long long v22 = [(UIPrintOption *)self printInfo];
      [v22 setAppliedPresetsList:v17];

      long long v23 = [(UIPrintPresetsOption *)self appliedPresetsSummary];
      v24 = [(UIPrintPresetsOption *)self appliedPresetsSummaryLabel];
      [v24 setText:v23];

      objc_super v18 = [(UIPrintPresetsOption *)self appliedPresetsSummaryLabel];
      [v18 sizeToFit];
    }
    else
    {
      [v12 setJobPreset:v9];

      v17 = [(UIPrintOption *)self printInfo];
      objc_super v18 = [v9 objectForKey:@"PresetInfo"];
      [v17 updateWithDictionary:v18];
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
}

- (id)appliedPresetsSummary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(UIPrintPresetsOption *)self printerPresets];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = [(UIPrintOption *)self printInfo];
    objc_super v6 = [v5 appliedPresetsList];

    if ([v6 count])
    {
      unint64_t v7 = [MEMORY[0x1E4F28E78] string];
      id v8 = [v6 reverseObjectEnumerator];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) objectForKey:@"PresetTitle"];
            PMAppendToSummaryString(v13, v7);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }
    }
    else
    {
      unint64_t v7 = 0;
    }
    v15 = @"No Presets Applied";
    if (v7) {
      v15 = v7;
    }
    uint64_t v14 = v15;
  }
  else
  {
    uint64_t v14 = &stru_1F3C9D3F8;
  }
  return v14;
}

- (NSMutableArray)presetNames
{
  v2 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_presetNames)
  {
    uint64_t v5 = [(UIPrintPresetsOption *)self presets];
    if (v5)
    {
      objc_super v6 = (void *)v5;
      unint64_t v7 = [(UIPrintPresetsOption *)v2 presets];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v10 = [(UIPrintPresetsOption *)v2 presets];
        objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
        uint64_t v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v20 = v2;
        v12 = [(UIPrintPresetsOption *)v2 presets];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v22 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectForKey:@"PresetTitle"];
              if (v17)
              {
                long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v17 forKey:@"Title"];
                [(NSMutableArray *)v11 addObject:v18];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v14);
        }

        v2 = v20;
        presetNames = v20->_presetNames;
        v20->_presetNames = v11;
      }
    }
  }
  v3 = v2->_presetNames;
  return v3;
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  uint64_t v4 = [v3 printOptionsTableView];
  uint64_t v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionListCell"];

  objc_super v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  unint64_t v7 = [(UIPrintOption *)self title];
  [v6 setText:v7];

  uint64_t v8 = [(UIPrintPresetsOption *)self summary];
  [v6 setSecondaryText:v8];

  [v5 setContentConfiguration:v6];
  [v5 setAccessoryType:1];
  [v5 setSelectionStyle:3];
  [v5 setItemListDelegate:self];
  [(UIPrintOption *)self setTableViewCell:v5];

  return v5;
}

- (id)itemList
{
  v3 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"Reset to Default Settings" value:@"Reset to Default Settings" table:@"Localizable"];
  unint64_t v7 = [v4 dictionaryWithObject:v6 forKey:@"Title"];
  uint64_t v8 = [v3 arrayWithObject:v7];
  uint64_t v9 = [(UIPrintPresetsOption *)self presetNames];
  uint64_t v10 = objc_msgSend(v3, "arrayWithObjects:", v8, v9, 0);

  return v10;
}

- (id)selectedItem
{
  return 0;
}

- (id)selectedItems
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(UIPrintOption *)self printInfo];
  uint64_t v4 = [v3 appliedPresetsList];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v6 = [(UIPrintOption *)self printInfo];
    unint64_t v7 = [v6 appliedPresetsList];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = (void *)MEMORY[0x1E4F28D58];
          uint64_t v14 = [(UIPrintPresetsOption *)self presets];
          uint64_t v15 = objc_msgSend(v13, "indexPathForRow:inSection:", objc_msgSend(v14, "indexOfObject:", v12), 1);

          [v5 addObject:v15];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v16 = [(UIPrintPresetsOption *)self selectedIndexPath];
    uint64_t v17 = [v16 section];

    if (v17 == 1)
    {
      long long v18 = (void *)MEMORY[0x1E4F1CA48];
      long long v19 = [(UIPrintPresetsOption *)self selectedIndexPath];
      uint64_t v5 = [v18 arrayWithObject:v19];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (BOOL)isItemSelected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIPrintPresetsOption *)self presets];
  uint64_t v6 = [v4 row];

  unint64_t v7 = [v5 objectAtIndex:v6];

  uint64_t v8 = [(UIPrintOption *)self printInfo];
  uint64_t v9 = [v8 appliedPresetsList];
  LOBYTE(v6) = [v9 containsObject:v7];

  return v6;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  if (a3)
  {
    v3 = [(UIPrintPresetsOption *)self printerPresets];
    uint64_t v4 = [v3 count];
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = v5;
    if (v4) {
      unint64_t v7 = @"Printer Presets";
    }
    else {
      unint64_t v7 = @"Standard Presets";
    }
    uint64_t v8 = [v5 localizedStringForKey:v7 value:v7 table:@"Localizable"];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)titleForFooterInSection:(int64_t)a3
{
  if (a3
    && ([(UIPrintPresetsOption *)self printerPresets],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    uint64_t v6 = NSString;
    unint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"%@\n\n%@" value:@"%@\n\n%@" table:@"Localizable"];
    uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"The most recent selection may override previously selected presets." value:@"The most recent selection may override previously selected presets." table:@"Localizable"];
    uint64_t v11 = [(UIPrintPresetsOption *)self appliedPresetsSummary];
    uint64_t v12 = objc_msgSend(v6, "stringWithFormat:", v8, v10, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4 = a3;
  [(UIPrintPresetsOption *)self setSelectedIndexPath:v4];
  [(UIPrintPresetsOption *)self updatePrintInfoWithSelectedIndex:v4];
  uint64_t v5 = [(UIPrintOption *)self tableViewCell];
  uint64_t v6 = [v5 contentConfiguration];

  unint64_t v7 = [(UIPrintPresetsOption *)self summary];
  [v6 setSecondaryText:v7];

  uint64_t v8 = [(UIPrintOption *)self tableViewCell];
  [v8 setContentConfiguration:v6];

  uint64_t v9 = [v4 section];
  if (v9)
  {
    uint64_t v10 = [(UIPrintPresetsOption *)self printerPresets];
    int64_t v11 = [v10 count] != 0;
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (BOOL)printerContainsQuality:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(UIPrintOption *)self printInfo];
  uint64_t v5 = [v4 currentPrinter];
  uint64_t v6 = [v5 supportedQualities];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) integerValue] == a3)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)getStandardPresets
{
  v3 = [(UIPrintOption *)self printInfo];
  id v4 = [v3 currentPrinter];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = [(UIPrintPresetsOption *)self grayscaleStandardPreset];

    if (v6)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:2];
      uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInt:4];
      uint64_t v7 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, 0x1F3C9E518, v10, 0x1F3C9E538, 0);

      BOOL v11 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:0];
      long long v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v14 = [v13 localizedStringForKey:@"Black and White" value:@"Black and White" table:@"Localizable"];
      long long v15 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"PresetType", v14, @"PresetTitle", v7, @"PresetInfo", 0);
      [(UIPrintPresetsOption *)self setGrayscaleStandardPreset:v15];
    }
    long long v16 = [(UIPrintPresetsOption *)self grayscaleStandardPreset];
    [v5 addObject:v16];

    if ([(UIPrintPresetsOption *)self printerContainsQuality:3])
    {
      uint64_t v17 = [(UIPrintPresetsOption *)self grayscaleDraftStandardPreset];

      if (!v17)
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
        long long v19 = [MEMORY[0x1E4F28ED0] numberWithInt:2];
        long long v20 = [MEMORY[0x1E4F28ED0] numberWithInt:3];
        uint64_t v21 = objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v19, 0x1F3C9E518, v20, 0x1F3C9E538, 0);

        long long v22 = (void *)MEMORY[0x1E4F1C9E8];
        long long v23 = [MEMORY[0x1E4F28ED0] numberWithInteger:0];
        long long v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v25 = [v24 localizedStringForKey:@"Black and White - Draft" value:@"Black and White - Draft" table:@"Localizable"];
        uint64_t v26 = objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, @"PresetType", v25, @"PresetTitle", v21, @"PresetInfo", 0);
        [(UIPrintPresetsOption *)self setGrayscaleDraftStandardPreset:v26];

        uint64_t v7 = (void *)v21;
      }
      v27 = [(UIPrintPresetsOption *)self grayscaleDraftStandardPreset];
      [v5 addObject:v27];
    }
    v28 = [(UIPrintOption *)self printInfo];
    v29 = [v28 currentPrinter];
    int v30 = [v29 supportsColor];

    if (v30)
    {
      v31 = [(UIPrintPresetsOption *)self colorStandardPreset];

      if (!v31)
      {
        v32 = (void *)MEMORY[0x1E4F1C9E8];
        v33 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
        v34 = [MEMORY[0x1E4F28ED0] numberWithInt:4];
        uint64_t v35 = objc_msgSend(v32, "dictionaryWithObjectsAndKeys:", v33, 0x1F3C9E518, v34, 0x1F3C9E538, 0);

        v36 = (void *)MEMORY[0x1E4F1C9E8];
        v37 = [MEMORY[0x1E4F28ED0] numberWithInteger:0];
        v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v39 = [v38 localizedStringForKey:@"Color" value:@"Color" table:@"Localizable"];
        v40 = objc_msgSend(v36, "dictionaryWithObjectsAndKeys:", v37, @"PresetType", v39, @"PresetTitle", v35, @"PresetInfo", 0);
        [(UIPrintPresetsOption *)self setColorStandardPreset:v40];

        uint64_t v7 = (void *)v35;
      }
      v41 = [(UIPrintPresetsOption *)self colorStandardPreset];
      [v5 addObject:v41];

      if ([(UIPrintPresetsOption *)self printerContainsQuality:5])
      {
        v42 = [(UIPrintPresetsOption *)self colorFineStandardPreset];

        if (!v42)
        {
          v43 = (void *)MEMORY[0x1E4F1C9E8];
          v44 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
          v45 = [MEMORY[0x1E4F28ED0] numberWithInt:5];
          uint64_t v46 = objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v44, 0x1F3C9E518, v45, 0x1F3C9E538, 0);

          v47 = (void *)MEMORY[0x1E4F1C9E8];
          v48 = [MEMORY[0x1E4F28ED0] numberWithInteger:0];
          v49 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v50 = [v49 localizedStringForKey:@"Color - Fine" value:@"Color - Fine" table:@"Localizable"];
          v51 = objc_msgSend(v47, "dictionaryWithObjectsAndKeys:", v48, @"PresetType", v50, @"PresetTitle", v46, @"PresetInfo", 0);
          [(UIPrintPresetsOption *)self setColorFineStandardPreset:v51];

          uint64_t v7 = (void *)v46;
        }
        v52 = [(UIPrintPresetsOption *)self colorFineStandardPreset];
        [v5 addObject:v52];
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)getPrinterPresets
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [(UIPrintOption *)self printInfo];
  v3 = [v2 currentPrinter];
  id v4 = [v3 supportedPresets];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v4 count])
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = *MEMORY[0x1E4F933A8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v12 = [v11 objectForKey:v9];
          long long v13 = (void *)MEMORY[0x1E4F1C9E8];
          long long v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:1];
          long long v23 = @"UIPrintInfoJobPresetKey";
          long long v24 = v11;
          long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          long long v16 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, @"PresetType", v12, @"PresetTitle", v15, @"PresetInfo", 0);
          [v5 addObject:v16];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v5 sortUsingComparator:&__block_literal_global_1];

  return v5;
}

uint64_t __41__UIPrintPresetsOption_getPrinterPresets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:@"PresetTitle"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"PresetTitle"];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)summary
{
  v3 = [(UIPrintPresetsOption *)self selectedIndexPath];
  if ([v3 section])
  {
  }
  else
  {
    id v4 = [(UIPrintOption *)self printInfo];
    uint64_t v5 = [v4 appliedPresetsList];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v11 = v10;
      uint64_t v12 = @"No Preset";
      goto LABEL_9;
    }
  }
  uint64_t v7 = [(UIPrintOption *)self printInfo];
  uint64_t v8 = [v7 appliedPresetsList];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    BOOL v11 = [(UIPrintOption *)self printInfo];
    long long v13 = [v11 appliedPresetsList];
    if (v13)
    {
      long long v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v15 = [v14 localizedStringForKey:@"No Preset" value:@"No Preset" table:@"Localizable"];
    }
    else
    {
      long long v14 = [(UIPrintPresetsOption *)self presets];
      long long v16 = [(UIPrintPresetsOption *)self selectedIndexPath];
      uint64_t v17 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v16, "row"));
      long long v15 = [v17 objectForKey:@"PresetTitle"];
    }
    goto LABEL_12;
  }
  uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v11 = v10;
  uint64_t v12 = @"Printer";
LABEL_9:
  long long v15 = [v10 localizedStringForKey:v12 value:v12 table:@"Localizable"];
LABEL_12:

  return v15;
}

- (void)didSelectPrintOption
{
  [(UIPrintPresetsOption *)self updatePresetsList];
  id v3 = [(UIPrintOption *)self tableViewCell];
  [v3 printOptionCellTapped];
}

- (NSArray)presets
{
  return self->_presets;
}

- (void)setPresets:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void)setPresetNames:(id)a3
{
}

- (UIPrinter)observedPrinter
{
  return self->_observedPrinter;
}

- (void)setObservedPrinter:(id)a3
{
}

- (UIPrintInfo)origPrintInfo
{
  return self->_origPrintInfo;
}

- (void)setOrigPrintInfo:(id)a3
{
}

- (NSArray)printerPresets
{
  return self->_printerPresets;
}

- (void)setPrinterPresets:(id)a3
{
}

- (NSArray)standardPresets
{
  return self->_standardPresets;
}

- (void)setStandardPresets:(id)a3
{
}

- (UILabel)appliedPresetsSummaryLabel
{
  return self->_appliedPresetsSummaryLabel;
}

- (void)setAppliedPresetsSummaryLabel:(id)a3
{
}

- (NSDictionary)grayscaleStandardPreset
{
  return self->_grayscaleStandardPreset;
}

- (void)setGrayscaleStandardPreset:(id)a3
{
}

- (NSDictionary)grayscaleDraftStandardPreset
{
  return self->_grayscaleDraftStandardPreset;
}

- (void)setGrayscaleDraftStandardPreset:(id)a3
{
}

- (NSDictionary)colorStandardPreset
{
  return self->_colorStandardPreset;
}

- (void)setColorStandardPreset:(id)a3
{
}

- (NSDictionary)colorFineStandardPreset
{
  return self->_colorFineStandardPreset;
}

- (void)setColorFineStandardPreset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorFineStandardPreset, 0);
  objc_storeStrong((id *)&self->_colorStandardPreset, 0);
  objc_storeStrong((id *)&self->_grayscaleDraftStandardPreset, 0);
  objc_storeStrong((id *)&self->_grayscaleStandardPreset, 0);
  objc_storeStrong((id *)&self->_appliedPresetsSummaryLabel, 0);
  objc_storeStrong((id *)&self->_standardPresets, 0);
  objc_storeStrong((id *)&self->_printerPresets, 0);
  objc_storeStrong((id *)&self->_origPrintInfo, 0);
  objc_storeStrong((id *)&self->_observedPrinter, 0);
  objc_storeStrong((id *)&self->_presetNames, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_presets, 0);
}

@end