@interface _TUISearchBar
- (BOOL)showsScopeBar;
- (CGSize)scopeBarContentSize;
- (_TUISearchBar)initWithFrame:(CGRect)a3;
- (_TUISearchScopeBarContainerView)scopeBarContentView;
- (void)layoutSubviews;
- (void)setScopeBarContentSize:(CGSize)a3;
- (void)setShowsScopeBar:(BOOL)a3;
- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation _TUISearchBar

- (_TUISearchBar)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_TUISearchBar;
  v3 = -[_TUISearchBar initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[_TUISearchScopeBarContainerView initWithFrame:]([_TUISearchScopeBarContainerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    scopeBarContentView = v3->_scopeBarContentView;
    v3->_scopeBarContentView = v4;

    [(_TUISearchScopeBarContainerView *)v3->_scopeBarContentView setAlpha:0.0];
    [(_TUISearchScopeBarContainerView *)v3->_scopeBarContentView setHidden:1];
    [(_TUISearchBar *)v3 addSubview:v3->_scopeBarContentView];
  }
  return v3;
}

- (CGSize)scopeBarContentSize
{
  [(_TUISearchScopeBarContainerView *)self->_scopeBarContentView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setScopeBarContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_TUISearchScopeBarContainerView *)self->_scopeBarContentView intrinsicContentSize];
  if (width != v7 || height != v6)
  {
    -[_TUISearchScopeBarContainerView setIntrinsicContentSize:](self->_scopeBarContentView, "setIntrinsicContentSize:", width, height);
    if (self->_showsScopeBar) {
      self->_needsUpdateScopeBarSize = 1;
    }
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)_TUISearchBar;
  [(_TUISearchBar *)&v11 layoutSubviews];
  [(_TUISearchBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  scopeBarContentView = self->_scopeBarContentView;
  [(_TUISearchBar *)self bounds];
  -[_TUISearchScopeBarContainerView sizeThatFits:](scopeBarContentView, "sizeThatFits:", v8, 0.0);
  double v10 = v9;
  [(_TUISearchBar *)self bounds];
  -[_TUISearchScopeBarContainerView setFrame:](self->_scopeBarContentView, "setFrame:", v4, CGRectGetMaxY(v12) - v10, v6, v10);
  self->_needsUpdateScopeBarSize = 0;
}

- (void)setShowsScopeBar:(BOOL)a3
{
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = a3 && self->_needsUpdateScopeBarSize;
  self->_needsUpdateScopeBarSize = 0;
  if (v7 || self->_showsScopeBar != a3)
  {
    self->_showsScopeBar = a3;
    [(_TUISearchBar *)self setNeedsLayout];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_162B38;
    v15[3] = &unk_252AC0;
    BOOL v16 = v5;
    v15[4] = self;
    double v8 = objc_retainBlock(v15);
    if (v4)
    {
      [(_TUISearchScopeBarContainerView *)self->_scopeBarContentView setHidden:0];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_162C18;
      v12[3] = &unk_256B40;
      BOOL v14 = v5;
      v12[4] = self;
      v13 = v8;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_162CF8;
      v10[3] = &unk_255930;
      BOOL v11 = v5;
      v10[4] = self;
      +[UIView animateKeyframesWithDuration:0 delay:v12 options:v10 animations:0.35 completion:0.0];
    }
    else
    {
      double v9 = 0.0;
      if (v5) {
        double v9 = 1.0;
      }
      [(_TUISearchScopeBarContainerView *)self->_scopeBarContentView setAlpha:v9];
      ((void (*)(void *))v8[2])(v8);
      [(_TUISearchScopeBarContainerView *)self->_scopeBarContentView setHidden:!v5];
    }
  }
}

- (BOOL)showsScopeBar
{
  return self->_showsScopeBar;
}

- (_TUISearchScopeBarContainerView)scopeBarContentView
{
  return self->_scopeBarContentView;
}

- (void).cxx_destruct
{
}

@end