@interface UIPrintOptionViewCell
- (UIPrintOptionViewDelegate)optionViewDelegate;
- (UIView)printOptionView;
- (void)prepareForReuse;
- (void)printOptionCellTapped;
- (void)setOptionViewDelegate:(id)a3;
- (void)setPrintOptionView:(id)a3;
@end

@implementation UIPrintOptionViewCell

- (void)printOptionCellTapped
{
  id v11 = (id)[objc_alloc(MEMORY[0x1E4FB1D18]) initWithNibName:0 bundle:0];
  v3 = [(UIPrintOptionViewCell *)self optionViewDelegate];
  v4 = [v3 printOptionDetailView];
  [v11 setView:v4];

  v5 = [(UIPrintOptionViewCell *)self optionViewDelegate];
  v6 = [v5 title];
  [v11 setTitle:v6];

  v7 = [(UIPrintOptionViewCell *)self optionViewDelegate];
  v8 = [v7 printPanelViewController];

  v9 = [v11 navigationItem];
  [v8 addPrintShareButtonsToNavItem:v9];

  v10 = [v8 printOptionsNavController];
  [v10 pushViewController:v11 animated:1];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)UIPrintOptionViewCell;
  [(UIPrintOptionCell *)&v3 prepareForReuse];
  [(UIPrintOptionViewCell *)self setOptionViewDelegate:0];
  [(UIPrintOptionViewCell *)self setPrintOptionView:0];
}

- (UIPrintOptionViewDelegate)optionViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionViewDelegate);
  return (UIPrintOptionViewDelegate *)WeakRetained;
}

- (void)setOptionViewDelegate:(id)a3
{
}

- (UIView)printOptionView
{
  return self->_printOptionView;
}

- (void)setPrintOptionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printOptionView, 0);
  objc_destroyWeak((id *)&self->_optionViewDelegate);
}

@end