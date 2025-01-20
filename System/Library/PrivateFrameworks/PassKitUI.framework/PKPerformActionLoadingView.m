@interface PKPerformActionLoadingView
- (PKPerformActionLoadingView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)spinner;
- (UILabel)loadingLabel;
- (void)layoutSubviews;
@end

@implementation PKPerformActionLoadingView

- (PKPerformActionLoadingView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PKPerformActionLoadingView;
  v3 = -[PKPerformActionLoadingView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    [(PKPerformActionLoadingView *)v3 addSubview:v3->_spinner];
    [(UIActivityIndicatorView *)v3->_spinner startAnimating];
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    loadingLabel = v3->_loadingLabel;
    v3->_loadingLabel = (UILabel *)v7;

    v9 = v3->_loadingLabel;
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v9 setBackgroundColor:v10];

    v11 = v3->_loadingLabel;
    v12 = PKLocalizedPaymentString(&cfstr_PerformActionL.isa);
    [(UILabel *)v11 setText:v12];

    v13 = v3->_loadingLabel;
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v13 setTextColor:v14];

    [(PKPerformActionLoadingView *)v3 addSubview:v3->_loadingLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PKPerformActionLoadingView;
  [(PKPerformActionLoadingView *)&v17 layoutSubviews];
  [(PKPerformActionLoadingView *)self bounds];
  PKFloatRoundToPixel();
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:");
  [(UILabel *)self->_loadingLabel sizeToFit];
  [(UIActivityIndicatorView *)self->_spinner frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_loadingLabel frame];
  UIRectCenteredXInRect();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  -[UILabel setFrame:](self->_loadingLabel, "setFrame:", v12, CGRectGetMaxY(v18) + 10.0, v14, v16);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (UILabel)loadingLabel
{
  return self->_loadingLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingLabel, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end