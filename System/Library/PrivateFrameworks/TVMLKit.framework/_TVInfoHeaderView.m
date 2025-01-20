@interface _TVInfoHeaderView
+ (id)infoHeaderViewWithElement:(id)a3 existingView:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)headerView;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (void)layoutSubviews;
- (void)setHeaderView:(id)a3;
@end

@implementation _TVInfoHeaderView

+ (id)infoHeaderViewWithElement:(id)a3 existingView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (_TVInfoHeaderView *)v5;
  }
  else
  {
    v8 = [_TVInfoHeaderView alloc];
    v7 = -[_TVInfoHeaderView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v9 = v7;
  v10 = +[TVInterfaceFactory sharedInterfaceFactory];
  v11 = [v6 children];

  v12 = [v11 firstObject];
  v13 = [(_TVInfoHeaderView *)v9 headerView];
  v14 = [v10 _viewFromElement:v12 existingView:v13];

  [(_TVInfoHeaderView *)v9 setHeaderView:v14];
  return v9;
}

- (void)setHeaderView:(id)a3
{
  id v5 = (UIView *)a3;
  headerView = self->_headerView;
  v7 = v5;
  if (headerView != v5)
  {
    [(UIView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView) {
      -[_TVInfoHeaderView addSubview:](self, "addSubview:");
    }
  }
  [(_TVInfoHeaderView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(UIView *)self tv_padding];
  double v8 = v7;
  double v10 = v9;
  headerView = self->_headerView;
  if (headerView)
  {
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", width - v5 - v6, 0.0);
  }
  else
  {
    [(UIView *)self tv_itemHeight];
    double v12 = v13;
  }
  double v14 = v10 + v8 + v12;
  double v15 = width;
  result.height = v14;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  [(_TVInfoHeaderView *)self bounds];
  double Width = CGRectGetWidth(v13);
  [(UIView *)self tv_padding];
  double v5 = v4;
  double v7 = v6;
  double v9 = Width - v6 - v8;
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", v9, 0.0);
  headerView = self->_headerView;
  -[UIView setFrame:](headerView, "setFrame:", v7, v5, v9, v10);
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4 = a3;
  double v5 = [self tv_associatedIKViewElement];
  double v6 = [v5 appDocument];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    double v8 = [(_TVInfoHeaderView *)self headerView];
    double v9 = objc_msgSend(v8, "tv_impressionableElementsForDocument:", v4);

    if ([v9 count])
    {
      double v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
    }
    else
    {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void).cxx_destruct
{
}

@end