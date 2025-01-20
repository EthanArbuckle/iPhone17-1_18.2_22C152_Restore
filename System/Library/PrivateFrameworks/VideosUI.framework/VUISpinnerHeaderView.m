@interface VUISpinnerHeaderView
- (VUISpinnerHeaderView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (void)hideSpinner;
- (void)hideText;
- (void)layoutSubviews;
- (void)showSpinner;
- (void)showText;
@end

@implementation VUISpinnerHeaderView

- (VUISpinnerHeaderView)initWithSpecifier:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)VUISpinnerHeaderView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[VUISpinnerHeaderView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  if (v10)
  {
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(VUISpinnerHeaderView *)v10 setBackgroundColor:v11];

    [(VUISpinnerHeaderView *)v10 setAutoresizingMask:2];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    text = v10->_text;
    v10->_text = (UILabel *)v12;

    v14 = v10->_text;
    v15 = [MEMORY[0x1E4FB1D30] _defaultFontForTableViewStyle:1 isSectionHeader:1];
    [(UILabel *)v14 setFont:v15];

    v16 = v10->_text;
    v17 = [MEMORY[0x1E4FB1D30] _defaultTextColorForTableViewStyle:1 isSectionHeader:1];
    [(UILabel *)v16 setTextColor:v17];

    v18 = [v5 name];
    v19 = [v18 uppercaseString];
    [(UILabel *)v10->_text setText:v19];

    [(VUISpinnerHeaderView *)v10 addSubview:v10->_text];
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v10->_spinner;
    v10->_spinner = (UIActivityIndicatorView *)v20;

    [(UIActivityIndicatorView *)v10->_spinner setHidesWhenStopped:1];
    [(VUISpinnerHeaderView *)v10 addSubview:v10->_spinner];
    [(UIActivityIndicatorView *)v10->_spinner startAnimating];
    objc_storeStrong((id *)&v10->_specifier, a3);
  }

  return v10;
}

- (void)showText
{
  id v4 = [(PSSpecifier *)self->_specifier name];
  v3 = [v4 uppercaseString];
  [(UILabel *)self->_text setText:v3];
}

- (void)hideText
{
}

- (void)showSpinner
{
}

- (void)hideSpinner
{
}

- (double)preferredHeightForWidth:(double)a3
{
  [(UIActivityIndicatorView *)self->_spinner frame];
  return v3 + 24.0;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)VUISpinnerHeaderView;
  [(VUISpinnerHeaderView *)&v27 layoutSubviews];
  [(UILabel *)self->_text sizeToFit];
  [(UILabel *)self->_text frame];
  double v4 = v3;
  double v6 = v5;
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v8 = v7;
  double v10 = v9;
  v11 = (id *)MEMORY[0x1E4FB2608];
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection])
  {
    [(VUISpinnerHeaderView *)self bounds];
    double v13 = v12;
    v14 = [(VUISpinnerHeaderView *)self superview];
    [v14 _backgroundInset];
    double v16 = v13 - v15;
    PreferencesTableViewCellLeftPad();
    double v18 = v16 - v17 - v4;
  }
  else
  {
    v14 = [(VUISpinnerHeaderView *)self superview];
    [v14 _backgroundInset];
    double v20 = v19;
    PreferencesTableViewCellLeftPad();
    double v18 = v20 + v21;
  }

  [(VUISpinnerHeaderView *)self frame];
  double v23 = floor((v22 - v6) * 0.5);
  if ([*v11 userInterfaceLayoutDirection]) {
    double v24 = v18 + -10.0 - v8;
  }
  else {
    double v24 = v4 + v18 + 10.0;
  }
  [(VUISpinnerHeaderView *)self frame];
  CGFloat v26 = floor((v25 - v10) * 0.5);
  v28.origin.x = v18;
  v28.origin.y = v23;
  v28.size.width = v4;
  v28.size.height = v6;
  CGRect v29 = CGRectIntegral(v28);
  -[UILabel setFrame:](self->_text, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  v30.origin.x = v24;
  v30.origin.y = v26;
  v30.size.width = v8;
  v30.size.height = v10;
  CGRect v31 = CGRectIntegral(v30);
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end