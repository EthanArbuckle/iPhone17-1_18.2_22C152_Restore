@interface SKUICellLayout
- (SKUICellLayout)initWithCollectionViewCell:(id)a3;
- (SKUICellLayout)initWithParentView:(id)a3;
- (SKUICellLayout)initWithTableViewCell:(id)a3;
- (SKUIClientContext)clientContext;
- (UIView)contentView;
- (UIView)parentCellView;
- (void)setClientContext:(id)a3;
- (void)setNeedsLayout;
@end

@implementation SKUICellLayout

- (SKUICellLayout)initWithCollectionViewCell:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICellLayout initWithCollectionViewCell:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUICellLayout;
  v13 = [(SKUICellLayout *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_cell, v4);
    v15 = [v4 contentView];
    objc_storeWeak((id *)&v14->_contentView, v15);

    id WeakRetained = objc_loadWeakRetained((id *)&v14->_cell);
    v14->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;
  }
  return v14;
}

- (SKUICellLayout)initWithParentView:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICellLayout initWithParentView:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUICellLayout;
  v13 = [(SKUICellLayout *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_cell, v4);
    objc_storeWeak((id *)&v14->_contentView, v4);
    id WeakRetained = objc_loadWeakRetained((id *)&v14->_cell);
    v14->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;
  }
  return v14;
}

- (SKUICellLayout)initWithTableViewCell:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICellLayout initWithTableViewCell:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUICellLayout;
  v13 = [(SKUICellLayout *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_cell, v4);
    v15 = [v4 contentView];
    objc_storeWeak((id *)&v14->_contentView, v15);

    id WeakRetained = objc_loadWeakRetained((id *)&v14->_cell);
    v14->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;
  }
  return v14;
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

- (SKUIClientContext)clientContext
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

- (void)initWithCollectionViewCell:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithParentView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTableViewCell:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end