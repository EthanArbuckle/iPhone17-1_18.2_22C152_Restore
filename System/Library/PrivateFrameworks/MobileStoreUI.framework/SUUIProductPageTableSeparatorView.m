@interface SUUIProductPageTableSeparatorView
- (void)layoutSubviews;
@end

@implementation SUUIProductPageTableSeparatorView

- (void)layoutSubviews
{
  [(SUUIProductPageTableSeparatorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 scale];
  double v9 = 1.0 / v8;

  double v10 = v6 - v9;
  double v11 = v4 + -15.0;
  separatorView = self->_separatorView;
  if (separatorView)
  {
    -[UIView setFrame:](separatorView, "setFrame:", 15.0, v10, v11, v9);
  }
  else
  {
    v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 15.0, v10, v11, v9);
    v14 = self->_separatorView;
    self->_separatorView = v13;

    v15 = self->_separatorView;
    v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v15 setBackgroundColor:v16];

    v17 = self->_separatorView;
    [(SUUIProductPageTableSeparatorView *)self addSubview:v17];
  }
}

- (void).cxx_destruct
{
}

@end