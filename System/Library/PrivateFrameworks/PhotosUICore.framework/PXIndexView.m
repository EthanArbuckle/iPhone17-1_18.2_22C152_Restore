@interface PXIndexView
- (PXIndexView)init;
- (void)layoutSubviews;
- (void)setIndex:(unint64_t)a3;
@end

@implementation PXIndexView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_frameView, 0);
}

- (void)setIndex:(unint64_t)a3
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  [(UILabel *)self->_label setText:v4];

  [(PXIndexView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PXIndexView;
  [(PXIndexView *)&v11 layoutSubviews];
  [(PXIndexView *)self bounds];
  double v4 = v3;
  double v6 = v5 + -1.0;
  -[UILabel setFrame:](self->_label, "setFrame:", 0.0, 1.0);
  v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:8.0];
  [(UILabel *)self->_label setFont:v7];

  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label bounds];
  double v9 = v8;
  double v10 = v4 - (v8 + 8.0);
  -[UIView setFrame:](self->_frameView, "setFrame:", v10, 0.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v10 + 4.0, 1.0, v9, v6);
}

- (PXIndexView)init
{
  v16.receiver = self;
  v16.super_class = (Class)PXIndexView;
  v2 = [(PXIndexView *)&v16 init];
  if (v2)
  {
    double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    frameView = v2->_frameView;
    v2->_frameView = v3;

    double v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    double v6 = [v5 colorWithAlphaComponent:0.5];
    [(UIView *)v2->_frameView setBackgroundColor:v6];

    v7 = [(UIView *)v2->_frameView layer];
    [v7 setCornerRadius:3.0];

    double v8 = [(UIView *)v2->_frameView layer];
    [v8 setBorderWidth:1.0];

    id v9 = [MEMORY[0x1E4FB1618] grayColor];
    uint64_t v10 = [v9 CGColor];
    objc_super v11 = [(UIView *)v2->_frameView layer];
    [v11 setBorderColor:v10];

    [(PXIndexView *)v2 addSubview:v2->_frameView];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v2->_label;
    v2->_label = v12;

    v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v2->_label setTextColor:v14];

    [(UILabel *)v2->_label setTextAlignment:1];
    [(PXIndexView *)v2 addSubview:v2->_label];
  }
  return v2;
}

@end