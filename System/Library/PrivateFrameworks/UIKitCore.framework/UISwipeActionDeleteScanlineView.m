@interface UISwipeActionDeleteScanlineView
+ (double)lineHeight;
- (UIColor)deleteLineColor;
- (UISwipeActionDeleteScanlineView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDeleteLineColor:(id)a3;
@end

@implementation UISwipeActionDeleteScanlineView

+ (double)lineHeight
{
  return 1.0;
}

- (UISwipeActionDeleteScanlineView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v18.receiver = self;
  v18.super_class = (Class)UISwipeActionDeleteScanlineView;
  v5 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, width, 1.0);
    topLine = v5->_topLine;
    v5->_topLine = v6;

    v8 = v5->_topLine;
    v9 = +[UIColor systemRedColor];
    [(UIView *)v8 setBackgroundColor:v9];

    [(UIView *)v5 addSubview:v5->_topLine];
    v10 = [UIView alloc];
    [(UIView *)v5 bounds];
    uint64_t v11 = -[UIView initWithFrame:](v10, "initWithFrame:");
    bottomLineWrapper = v5->_bottomLineWrapper;
    v5->_bottomLineWrapper = (UIView *)v11;

    [(UIView *)v5->_bottomLineWrapper setClipsToBounds:1];
    [(UIView *)v5 addSubview:v5->_bottomLineWrapper];
    v13 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, height + -1.0, width, 1.0);
    bottomLine = v5->_bottomLine;
    v5->_bottomLine = v13;

    v15 = v5->_bottomLine;
    v16 = +[UIColor systemRedColor];
    [(UIView *)v15 setBackgroundColor:v16];

    [(UIView *)v5->_bottomLineWrapper addSubview:v5->_bottomLine];
  }
  return v5;
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_bottomLineWrapper, "setFrame:");
  [(UIView *)self frame];
  -[UIView setFrame:](self->_topLine, "setFrame:", 0.0, 0.0);
  [(UIView *)self frame];
  double v4 = v3 + -1.0;
  [(UIView *)self frame];
  bottomLine = self->_bottomLine;
  -[UIView setFrame:](bottomLine, "setFrame:", 0.0, v4);
}

- (void)setDeleteLineColor:(id)a3
{
  topLine = self->_topLine;
  id v5 = a3;
  [(UIView *)topLine setBackgroundColor:v5];
  [(UIView *)self->_bottomLine setBackgroundColor:v5];
}

- (UIColor)deleteLineColor
{
  return [(UIView *)self->_topLine backgroundColor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_bottomLineWrapper, 0);
}

@end