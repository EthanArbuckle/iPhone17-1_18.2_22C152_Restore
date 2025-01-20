@interface SUUIProductPageTableView
- (UIView)productPageHeaderView;
- (void)_addContentSubview:(id)a3 atBack:(BOOL)a4;
- (void)setProductPageHeaderView:(id)a3;
@end

@implementation SUUIProductPageTableView

- (void)setProductPageHeaderView:(id)a3
{
  v5 = (UIView *)a3;
  p_productPageHeaderView = &self->_productPageHeaderView;
  productPageHeaderView = self->_productPageHeaderView;
  v8 = v5;
  if (productPageHeaderView != v5)
  {
    if ([(UIView *)productPageHeaderView isDescendantOfView:self]) {
      [(UIView *)*p_productPageHeaderView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_productPageHeaderView, a3);
    if (*p_productPageHeaderView) {
      -[SUUIProductPageTableView addSubview:](self, "addSubview:");
    }
  }
}

- (void)_addContentSubview:(id)a3 atBack:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageTableView;
  v6 = (UIView *)a3;
  [(SUUIProductPageTableView *)&v10 _addContentSubview:v6 atBack:v4];
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
    v9.super_class = (Class)SUUIProductPageTableView;
    [(SUUIProductPageTableView *)&v9 _addContentSubview:productPageHeaderView atBack:0];
  }
}

- (UIView)productPageHeaderView
{
  return self->_productPageHeaderView;
}

- (void).cxx_destruct
{
}

@end