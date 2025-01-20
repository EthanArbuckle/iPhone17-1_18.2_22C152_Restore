@interface SKUIProductPageTableView
- (UIView)productPageHeaderView;
- (void)_addContentSubview:(id)a3 atBack:(BOOL)a4;
- (void)setProductPageHeaderView:(id)a3;
@end

@implementation SKUIProductPageTableView

- (void)setProductPageHeaderView:(id)a3
{
  v5 = (UIView *)a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableView setProductPageHeaderView:]();
  }
  p_productPageHeaderView = &self->_productPageHeaderView;
  productPageHeaderView = self->_productPageHeaderView;
  if (productPageHeaderView != v5)
  {
    if ([(UIView *)productPageHeaderView isDescendantOfView:self]) {
      [(UIView *)*p_productPageHeaderView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_productPageHeaderView, a3);
    if (*p_productPageHeaderView) {
      -[SKUIProductPageTableView addSubview:](self, "addSubview:");
    }
  }
}

- (void)_addContentSubview:(id)a3 atBack:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SKUIProductPageTableView;
  v6 = (UIView *)a3;
  [(SKUIProductPageTableView *)&v10 _addContentSubview:v6 atBack:v4];
  productPageHeaderView = self->_productPageHeaderView;

  if (productPageHeaderView) {
    BOOL v8 = productPageHeaderView == v6;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)SKUIProductPageTableView;
    [(SKUIProductPageTableView *)&v9 _addContentSubview:productPageHeaderView atBack:0];
  }
}

- (UIView)productPageHeaderView
{
  return self->_productPageHeaderView;
}

- (void).cxx_destruct
{
}

- (void)setProductPageHeaderView:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageTableView setProductPageHeaderView:]";
}

@end