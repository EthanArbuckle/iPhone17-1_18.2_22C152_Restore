@interface PKSpinnerHeaderView
- (BOOL)showSpinner;
- (PKSpinnerHeaderView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setShowSpinner:(BOOL)a3;
@end

@implementation PKSpinnerHeaderView

- (PKSpinnerHeaderView)initWithReuseIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKSpinnerHeaderView;
  v3 = [(PKSpinnerHeaderView *)&v7 initWithReuseIdentifier:a3];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKSpinnerHeaderView;
  [(PKSpinnerHeaderView *)&v3 prepareForReuse];
  [(PKSpinnerHeaderView *)self setShowSpinner:0];
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)PKSpinnerHeaderView;
  [(PKSpinnerHeaderView *)&v34 layoutSubviews];
  objc_super v3 = [(PKSpinnerHeaderView *)self contentView];
  [v3 bounds];
  double v33 = v4;
  double v6 = v5;
  double v31 = v5;
  [v3 layoutMargins];
  double v8 = v7;
  double v30 = v7;
  double v10 = v9;
  double v32 = v9;
  int v11 = [(PKSpinnerHeaderView *)self _shouldReverseLayoutDirection];
  v12 = [(PKSpinnerHeaderView *)self textLabel];
  v13 = [v12 text];
  uint64_t v14 = [v13 length];

  [v12 frame];
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v16 = v15;
  double v18 = v17;
  double v19 = v6 - (v8 + v10);
  double v20 = v15 + 10.0;
  double v21 = 0.0;
  if (self->_showSpinner) {
    double v21 = v15 + 10.0;
  }
  objc_msgSend(v12, "sizeThatFits:", v19 - v21, 1.79769313e308);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v23 = v22;
  double v25 = v24;
  objc_msgSend(v12, "setFrame:");
  PKFloatRoundToPixel();
  double v27 = v26;
  double v28 = v33 + v30;
  if (v14) {
    double v28 = v23 + v25 + 10.0;
  }
  double v29 = v33 + v31 - v32 - v16;
  if (v14) {
    double v29 = v23 - v20;
  }
  if (v11) {
    double v28 = v29;
  }
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v28, v27, v16, v18);
}

- (void)setShowSpinner:(BOOL)a3
{
  if (((!self->_showSpinner ^ a3) & 1) == 0)
  {
    self->_showSpinner = a3;
    spinner = self->_spinner;
    if (a3)
    {
      double v5 = [(UIActivityIndicatorView *)spinner superview];

      if (!v5)
      {
        double v6 = [(PKSpinnerHeaderView *)self contentView];
        [v6 addSubview:self->_spinner];
      }
      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
    else
    {
      [(UIActivityIndicatorView *)spinner stopAnimating];
      [(UIActivityIndicatorView *)self->_spinner removeFromSuperview];
    }
    [(PKSpinnerHeaderView *)self setNeedsLayout];
  }
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
}

@end