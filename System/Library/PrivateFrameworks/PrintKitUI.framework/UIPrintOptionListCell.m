@interface UIPrintOptionListCell
- (UIPrintOptionListDelegate)itemListDelegate;
- (UIPrintOptionListViewController)printOptionListViewController;
- (void)prepareForReuse;
- (void)printOptionCellTapped;
- (void)setItemListDelegate:(id)a3;
- (void)setPrintOptionListViewController:(id)a3;
@end

@implementation UIPrintOptionListCell

- (void)printOptionCellTapped
{
  v3 = [(UIPrintOptionListCell *)self printOptionListViewController];

  if (!v3)
  {
    v4 = [UIPrintOptionListViewController alloc];
    v5 = [(UIPrintOptionListCell *)self itemListDelegate];
    v6 = [(UIPrintOptionListViewController *)v4 initWithListDelegate:v5];
    [(UIPrintOptionListCell *)self setPrintOptionListViewController:v6];

    v7 = [(UIPrintOptionListCell *)self itemListDelegate];
    v8 = [v7 title];
    v9 = [(UIPrintOptionListCell *)self printOptionListViewController];
    [v9 setTitle:v8];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__UIPrintOptionListCell_printOptionCellTapped__block_invoke;
    v20[3] = &unk_1E6DA1408;
    v20[4] = self;
    v10 = [(UIPrintOptionListCell *)self printOptionListViewController];
    v11 = self;
    [v11 setOnDoneBlock:v20];

    v12 = [(UIPrintOptionListCell *)self itemListDelegate];
    v13 = [v12 printPanelViewController];

    v14 = [(UIPrintOptionListCell *)self printOptionListViewController];
    v15 = [v14 navigationItem];
    [v13 addPrintShareButtonsToNavItem:v15];

    v16 = [v13 printOptionsNavController];
    v17 = [v16 presentationController];

    [v17 setDelegate:self];
    v18 = [v13 printOptionsNavController];
    v19 = [(UIPrintOptionListCell *)self printOptionListViewController];
    [v18 pushViewController:v19 animated:1];
  }
}

uint64_t __46__UIPrintOptionListCell_printOptionCellTapped__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPrintOptionListViewController:0];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)UIPrintOptionListCell;
  [(UIPrintOptionCell *)&v4 prepareForReuse];
  [(UIPrintOptionListCell *)self setItemListDelegate:0];
  v3 = self;
  [v3 setPrintOptionListViewController:0];
}

- (UIPrintOptionListDelegate)itemListDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemListDelegate);
  return (UIPrintOptionListDelegate *)WeakRetained;
}

- (void)setItemListDelegate:(id)a3
{
}

- (UIPrintOptionListViewController)printOptionListViewController
{
  return self->_printOptionListViewController;
}

- (void)setPrintOptionListViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printOptionListViewController, 0);
  objc_destroyWeak((id *)&self->_itemListDelegate);
}

@end