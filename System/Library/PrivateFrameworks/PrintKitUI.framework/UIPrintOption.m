@interface UIPrintOption
- (BOOL)canDismiss;
- (BOOL)collapsed;
- (BOOL)keyboardShowing;
- (BOOL)shouldShow;
- (NSString)summary;
- (NSString)title;
- (UIPrintInfo)printInfo;
- (UIPrintOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrintPanelViewController)printPanelViewController;
- (UITableViewCell)tableViewCell;
- (id)printOptionDetailView;
- (id)printOptionTableViewCell;
- (void)setCollapsed:(BOOL)a3;
- (void)setPrintInfo:(id)a3;
- (void)setPrintPanelViewController:(id)a3;
- (void)setShouldShow:(BOOL)a3;
- (void)setSummary:(id)a3;
- (void)setTableViewCell:(id)a3;
- (void)setTitle:(id)a3;
- (void)updatePrintOptionSummary;
@end

@implementation UIPrintOption

- (UIPrintOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIPrintOption;
  v9 = [(UIPrintOption *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_printInfo, a3);
    objc_storeWeak((id *)&v10->_printPanelViewController, v8);
    *(_WORD *)&v10->_collapsed = 257;
  }

  return v10;
}

- (id)printOptionTableViewCell
{
  return 0;
}

- (id)printOptionDetailView
{
  return 0;
}

- (void)updatePrintOptionSummary
{
  v3 = [(UIPrintOption *)self tableViewCell];

  if (v3)
  {
    v4 = [(UIPrintOption *)self printPanelViewController];
    id v8 = [v4 printOptionsTableView];

    v5 = [(UIPrintOption *)self tableViewCell];
    v6 = [v8 indexPathForCell:v5];

    if (v6)
    {
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
      [v8 reloadRowsAtIndexPaths:v7 withRowAnimation:100];
    }
  }
}

- (BOOL)canDismiss
{
  return 1;
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

- (UITableViewCell)tableViewCell
{
  return self->_tableViewCell;
}

- (void)setTableViewCell:(id)a3
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

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void)setShouldShow:(BOOL)a3
{
  self->_shouldShow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
  objc_destroyWeak((id *)&self->_printPanelViewController);
}

@end