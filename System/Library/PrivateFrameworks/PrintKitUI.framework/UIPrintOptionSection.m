@interface UIPrintOptionSection
- (BOOL)canDismiss;
- (BOOL)keyboardShowing;
- (BOOL)shouldShow;
- (BOOL)updatePrintOptionsList;
- (NSMutableArray)printOptions;
- (NSString)title;
- (UIPrintInfo)printInfo;
- (UIPrintOptionSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrintPanelViewController)printPanelViewController;
- (UITableViewCell)tableViewCell;
- (id)summaryString;
- (void)setPrintInfo:(id)a3;
- (void)setPrintOptions:(id)a3;
- (void)setPrintPanelViewController:(id)a3;
- (void)setShouldShow:(BOOL)a3;
- (void)setTableViewCell:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateSectionSummary;
@end

@implementation UIPrintOptionSection

- (UIPrintOptionSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIPrintOptionSection;
  v8 = [(UIPrintOptionSection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(UIPrintOptionSection *)v8 setPrintInfo:v6];
    [(UIPrintOptionSection *)v9 setPrintPanelViewController:v7];
  }

  return v9;
}

- (void)updateSectionSummary
{
  v3 = [(UIPrintOptionSection *)self tableViewCell];
  id v10 = [v3 contentConfiguration];

  v4 = [(UIPrintOptionSection *)self summaryString];
  [v10 setSecondaryText:v4];

  v5 = [(UIPrintOptionSection *)self tableViewCell];
  [v5 setContentConfiguration:v10];

  id v6 = [(UIPrintOptionSection *)self printPanelViewController];
  id v7 = [v6 printOptionsTableView];

  v8 = [(UIPrintOptionSection *)self tableViewCell];
  v9 = [v7 indexPathForCell:v8];
}

- (id)summaryString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(UIPrintOptionSection *)self printOptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) summary];
        if (v9)
        {
          if ([v3 length])
          {
            id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            objc_super v11 = [v10 localizedStringForKey:@" • " value:@" • " table:@"Localizable"];
            [v3 appendString:v11];
          }
          [v3 appendString:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)updatePrintOptionsList
{
  return 0;
}

- (BOOL)shouldShow
{
  [(UIPrintOptionSection *)self updatePrintOptionsList];
  v3 = [(UIPrintOptionSection *)self printOptions];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)canDismiss
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(UIPrintOptionSection *)self printOptions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) canDismiss])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)keyboardShowing
{
  return 0;
}

- (UIPrintPanelViewController)printPanelViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPanelViewController);
  return (UIPrintPanelViewController *)WeakRetained;
}

- (void)setPrintPanelViewController:(id)a3
{
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UITableViewCell)tableViewCell
{
  return self->_tableViewCell;
}

- (void)setTableViewCell:(id)a3
{
}

- (NSMutableArray)printOptions
{
  return self->_printOptions;
}

- (void)setPrintOptions:(id)a3
{
}

- (void)setShouldShow:(BOOL)a3
{
  self->_shouldShow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printOptions, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_destroyWeak((id *)&self->_printPanelViewController);
}

@end