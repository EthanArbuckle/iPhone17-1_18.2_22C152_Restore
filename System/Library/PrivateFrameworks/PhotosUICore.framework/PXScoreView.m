@interface PXScoreView
- (PXScoreView)init;
- (PXScoreView)initWithColorScale:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setScore:(double)a3;
@end

@implementation PXScoreView

- (void).cxx_destruct
{
}

- (void)setScore:(double)a3
{
  if (a3 >= 0.0)
  {
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%0.2f", *(void *)&a3);
    p_label = &self->_label;
    [(UILabel *)self->_label setText:v6];
  }
  else
  {
    p_label = &self->_label;
    [(UILabel *)self->_label setText:@"-"];
  }
  switch(self->_colorScale)
  {
    case 1uLL:
      v7 = (void *)MEMORY[0x1E4FB1618];
      if (a3 < 0.5) {
        goto LABEL_8;
      }
      double v8 = 1.0 - a3;
      double v9 = 0.75;
      double v10 = a3;
      goto LABEL_16;
    case 2uLL:
      v7 = (void *)MEMORY[0x1E4FB1618];
      double v8 = a3 * -2.0 + 1.5;
      double v10 = a3 * 2.0 + -0.5;
      goto LABEL_15;
    case 3uLL:
      v7 = (void *)MEMORY[0x1E4FB1618];
      if (a3 < 0.0)
      {
LABEL_8:
        id v16 = [v7 redColor];
        v11 = [v16 colorWithAlphaComponent:0.75];
        [(PXScoreView *)self setBackgroundColor:v11];

        goto LABEL_17;
      }
      double v14 = 1.5;
      double v15 = -2.0;
      goto LABEL_14;
    case 4uLL:
      v7 = (void *)MEMORY[0x1E4FB1618];
      if (a3 >= 0.0)
      {
        double v14 = 1.0;
        double v15 = -0.5;
LABEL_14:
        double v8 = v14 + a3 * v15;
        double v10 = 1.0;
LABEL_15:
        double v9 = 0.75;
LABEL_16:
        id v16 = [v7 colorWithRed:v8 green:v10 blue:0.1 alpha:v9];
        [(PXScoreView *)self setBackgroundColor:v16];
      }
      else
      {
        v12 = [MEMORY[0x1E4FB1618] redColor];
        v13 = [v12 colorWithAlphaComponent:0.75];
        [(PXScoreView *)self setBackgroundColor:v13];

        objc_msgSend(NSString, "stringWithFormat:", @"%0.0f", *(void *)&a3);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        [(UILabel *)*p_label setText:v16];
      }
LABEL_17:

      return;
    default:
      return;
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXScoreView;
  [(PXScoreView *)&v5 layoutSubviews];
  label = self->_label;
  [(PXScoreView *)self bounds];
  -[UILabel setFrame:](label, "setFrame:");
  v4 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:8.0];
  [(UILabel *)self->_label setFont:v4];
}

- (PXScoreView)initWithColorScale:(unint64_t)a3
{
  result = [(PXScoreView *)self init];
  if (result) {
    result->_colorScale = a3;
  }
  return result;
}

- (PXScoreView)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXScoreView;
  v2 = [(PXScoreView *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v4 = [v3 colorWithAlphaComponent:0.5];
    [(PXScoreView *)v2 setBackgroundColor:v4];

    objc_super v5 = [(PXScoreView *)v2 layer];
    [v5 setCornerRadius:3.0];

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v2->_label;
    v2->_label = v6;

    double v8 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v2->_label setTextColor:v8];

    [(UILabel *)v2->_label setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v2->_label setTextAlignment:1];
    [(PXScoreView *)v2 addSubview:v2->_label];
  }
  return v2;
}

@end