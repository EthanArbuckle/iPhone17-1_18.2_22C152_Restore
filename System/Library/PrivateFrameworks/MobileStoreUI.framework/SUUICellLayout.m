@interface SUUICellLayout
- (SUUICellLayout)initWithCollectionViewCell:(id)a3;
- (SUUICellLayout)initWithParentView:(id)a3;
- (SUUICellLayout)initWithTableViewCell:(id)a3;
- (SUUIClientContext)clientContext;
- (UIView)contentView;
- (UIView)parentCellView;
- (void)setClientContext:(id)a3;
- (void)setNeedsLayout;
@end

@implementation SUUICellLayout

- (SUUICellLayout)initWithCollectionViewCell:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUICellLayout;
  v5 = [(SUUICellLayout *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cell, v4);
    v7 = [v4 contentView];
    objc_storeWeak((id *)&v6->_contentView, v7);

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_cell);
    v6->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;
  }
  return v6;
}

- (SUUICellLayout)initWithParentView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUICellLayout;
  v5 = [(SUUICellLayout *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cell, v4);
    objc_storeWeak((id *)&v6->_contentView, v4);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_cell);
    v6->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;
  }
  return v6;
}

- (SUUICellLayout)initWithTableViewCell:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUICellLayout;
  v5 = [(SUUICellLayout *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cell, v4);
    v7 = [v4 contentView];
    objc_storeWeak((id *)&v6->_contentView, v7);

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_cell);
    v6->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;
  }
  return v6;
}

- (void)setNeedsLayout
{
  BOOL parentWantsCellNeedsLayout = self->_parentWantsCellNeedsLayout;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  id v4 = WeakRetained;
  if (parentWantsCellNeedsLayout) {
    [WeakRetained setCellLayoutNeedsLayout];
  }
  else {
    [WeakRetained setNeedsLayout];
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (UIView *)WeakRetained;
}

- (UIView)parentCellView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end