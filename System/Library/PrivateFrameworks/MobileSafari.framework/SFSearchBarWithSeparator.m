@interface SFSearchBarWithSeparator
- (SFSearchBarWithSeparator)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SFSearchBarWithSeparator

- (SFSearchBarWithSeparator)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFSearchBarWithSeparator;
  v3 = -[SFSearchBarWithSeparator initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v4;

    v6 = [MEMORY[0x1E4FB1618] tableSeparatorDarkColor];
    [(UIView *)v3->_separatorView setBackgroundColor:v6];

    [(SFSearchBarWithSeparator *)v3 addSubview:v3->_separatorView];
    v7 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SFSearchBarWithSeparator;
  [(SFSearchBarWithSeparator *)&v13 layoutSubviews];
  [(SFSearchBarWithSeparator *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = _SFOnePixel();
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  CGFloat v12 = CGRectGetMaxY(v14) - v11;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, v12, CGRectGetWidth(v15), v11);
}

- (void).cxx_destruct
{
}

@end