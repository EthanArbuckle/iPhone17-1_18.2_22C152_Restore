@interface UIPrintFinishingTemplatesOption
- (BOOL)shouldShow;
- (NSMutableArray)finishingTemplateNames;
- (NSString)summary;
- (UIPrintFinishingTemplatesOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4 finishingOptionsTableView:(id)a5;
- (UIPrintInfo)printInfo;
- (UIPrintPanelViewController)printPanelViewController;
- (UITableView)finishingOptionsTableView;
- (UITableViewCell)finishingTemplatesCell;
- (id)itemList;
- (id)selectedItem;
- (id)title;
- (int64_t)listItemSelected:(id)a3;
- (int64_t)selectedTemplate;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFinishingOptionsTableView:(id)a3;
- (void)setFinishingTemplateNames:(id)a3;
- (void)setFinishingTemplatesCell:(id)a3;
- (void)setPrintInfo:(id)a3;
- (void)setPrintPanelViewController:(id)a3;
- (void)setSelectedTemplate:(int64_t)a3;
- (void)setSummary:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintFinishingTemplatesOption

- (UIPrintFinishingTemplatesOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4 finishingOptionsTableView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UIPrintFinishingTemplatesOption;
  v11 = [(UIPrintFinishingTemplatesOption *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(UIPrintFinishingTemplatesOption *)v11 setPrintInfo:v8];
    [(UIPrintFinishingTemplatesOption *)v12 setPrintPanelViewController:v9];
    [(UIPrintFinishingTemplatesOption *)v12 setFinishingOptionsTableView:v10];
    [(UIPrintFinishingTemplatesOption *)v12 setSelectedTemplate:0];
    v13 = [(UIPrintFinishingTemplatesOption *)v12 printInfo];
    [v13 addObserver:v12 forKeyPath:0x1F3C9E0F8 options:0 context:0];
  }
  return v12;
}

- (void)dealloc
{
  v3 = [(UIPrintFinishingTemplatesOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9E0F8];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintFinishingTemplatesOption;
  [(UIPrintFinishingTemplatesOption *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__UIPrintFinishingTemplatesOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__UIPrintFinishingTemplatesOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (void)updateFromPrintInfo
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(UIPrintFinishingTemplatesOption *)self printInfo];
  objc_super v4 = [v3 finishingTemplate];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [(UIPrintFinishingTemplatesOption *)self printInfo];
  v6 = [v5 currentPrinter];
  v7 = [v6 finishingTemplates];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    uint64_t v11 = *MEMORY[0x1E4F93360];
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = [v13 objectForKey:v11];
        if ([v14 isEqualToString:v4])
        {
          objc_super v15 = [(UIPrintFinishingTemplatesOption *)self printInfo];
          v16 = [v15 currentPrinter];
          v17 = [v16 finishingTemplates];
          -[UIPrintFinishingTemplatesOption setSelectedTemplate:](self, "setSelectedTemplate:", [v17 indexOfObject:v13]);

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v18 = [(UIPrintFinishingTemplatesOption *)self finishingTemplatesCell];
  v19 = [v18 contentConfiguration];

  v20 = [(UIPrintFinishingTemplatesOption *)self summary];
  [v19 setSecondaryText:v20];

  v21 = [(UIPrintFinishingTemplatesOption *)self finishingTemplatesCell];
  [v21 setContentConfiguration:v19];
}

- (BOOL)shouldShow
{
  v3 = [(UIPrintFinishingTemplatesOption *)self printInfo];
  objc_super v4 = [v3 currentPrinter];
  v5 = [v4 printerInfoDict];
  if (v5)
  {
    v6 = [(UIPrintFinishingTemplatesOption *)self printInfo];
    v7 = [v6 currentPrinter];
    uint64_t v8 = [v7 finishingTemplates];
    if (v8)
    {
      uint64_t v9 = [(UIPrintFinishingTemplatesOption *)self printInfo];
      uint64_t v10 = [v9 currentPrinter];
      uint64_t v11 = [v10 finishingTemplates];
      BOOL v12 = [v11 count] != 0;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"Finishing Template" value:@"Finishing Template" table:@"Localizable"];

  return v3;
}

- (NSString)summary
{
  v3 = [(UIPrintFinishingTemplatesOption *)self finishingTemplateNames];
  objc_super v4 = objc_msgSend(v3, "objectAtIndex:", -[UIPrintFinishingTemplatesOption selectedTemplate](self, "selectedTemplate"));
  v5 = [v4 objectForKey:@"Title"];

  return (NSString *)v5;
}

- (id)itemList
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(UIPrintFinishingTemplatesOption *)self finishingTemplateNames];
  objc_super v4 = [v2 arrayWithObject:v3];

  return v4;
}

- (id)selectedItem
{
  v2 = (void *)MEMORY[0x1E4F28D58];
  int64_t v3 = [(UIPrintFinishingTemplatesOption *)self selectedTemplate];
  return (id)[v2 indexPathForRow:v3 inSection:0];
}

- (int64_t)listItemSelected:(id)a3
{
  id v4 = a3;
  -[UIPrintFinishingTemplatesOption setSelectedTemplate:](self, "setSelectedTemplate:", [v4 row]);
  v5 = [(UIPrintFinishingTemplatesOption *)self printInfo];
  v6 = [v5 currentPrinter];
  v7 = [v6 finishingTemplates];
  uint64_t v8 = [v4 row];

  uint64_t v9 = [v7 objectAtIndex:v8];

  uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F93360]];
  uint64_t v11 = [(UIPrintFinishingTemplatesOption *)self printInfo];
  [v11 setFinishingTemplate:v10];

  return 1;
}

- (NSMutableArray)finishingTemplateNames
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(UIPrintFinishingTemplatesOption *)self printInfo];
  id v4 = [v3 currentPrinter];
  v5 = [v4 finishingTemplates];

  if (!v2->_finishingTemplateNames && v5 && [v5 count])
  {
    v29 = v2;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v28 = v5;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      uint64_t v10 = *MEMORY[0x1E4F93370];
      uint64_t v11 = @"none";
      uint64_t v12 = *MEMORY[0x1E4F93360];
      do
      {
        uint64_t v13 = 0;
        uint64_t v30 = v8;
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
          objc_msgSend(v14, "objectForKey:", v10, v28);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          v16 = [v14 objectForKey:v12];
          if ([v16 isEqualToString:v11])
          {
            v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            [v17 localizedStringForKey:@"No finishing template" value:@"No finishing template" table:@"Localizable"];
            uint64_t v18 = v12;
            uint64_t v19 = v10;
            uint64_t v20 = v9;
            v21 = v6;
            v23 = long long v22 = v11;

            id v15 = (id)v23;
            uint64_t v11 = v22;
            v6 = v21;
            uint64_t v9 = v20;
            uint64_t v10 = v19;
            uint64_t v12 = v18;
            uint64_t v8 = v30;
          }
          else if (!v15)
          {
            id v15 = v16;
          }
          long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v15 forKey:@"Title"];
          [(NSMutableArray *)v6 addObject:v24];

          ++v13;
        }
        while (v8 != v13);
        uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v8);
    }

    v2 = v29;
    finishingTemplateNames = v29->_finishingTemplateNames;
    v29->_finishingTemplateNames = v6;

    v5 = v28;
  }
  v26 = v2->_finishingTemplateNames;

  return v26;
}

- (UIPrintPanelViewController)printPanelViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPanelViewController);
  return (UIPrintPanelViewController *)WeakRetained;
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

- (void)setFinishingTemplateNames:(id)a3
{
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
}

- (int64_t)selectedTemplate
{
  return self->_selectedTemplate;
}

- (void)setSelectedTemplate:(int64_t)a3
{
  self->_selectedTemplate = a3;
}

- (UITableViewCell)finishingTemplatesCell
{
  return self->_finishingTemplatesCell;
}

- (void)setFinishingTemplatesCell:(id)a3
{
}

- (void)setSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_finishingTemplatesCell, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_finishingTemplateNames, 0);
  objc_destroyWeak((id *)&self->_finishingOptionsTableView);
  objc_destroyWeak((id *)&self->_printPanelViewController);
}

@end