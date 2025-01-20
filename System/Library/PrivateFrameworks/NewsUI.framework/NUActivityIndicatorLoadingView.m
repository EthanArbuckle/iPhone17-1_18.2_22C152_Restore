@interface NUActivityIndicatorLoadingView
- (NUActivityIndicatorLoadingView)initWithActivityIndicatorStyle:(int64_t)a3;
- (NUActivityIndicatorLoadingView)initWithCoder:(id)a3;
- (NUActivityIndicatorLoadingView)initWithFrame:(CGRect)a3;
- (NUActivityIndicatorLoadingView)initWithText:(id)a3 activityIndicatorStyle:(int64_t)a4;
- (UIActivityIndicatorView)activityIndicatorView;
- (UILabel)label;
- (void)layoutSubviews;
- (void)loadingViewStartAnimating;
- (void)loadingViewStopAnimating;
@end

@implementation NUActivityIndicatorLoadingView

- (NUActivityIndicatorLoadingView)initWithActivityIndicatorStyle:(int64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)NUActivityIndicatorLoadingView;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = -[NUActivityIndicatorLoadingView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x263F001A8], v5, v6, v7);
  if (v8)
  {
    v9 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(NUActivityIndicatorLoadingView *)v8 setBackgroundColor:v9];

    uint64_t v10 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:a3];
    activityIndicatorView = v8->_activityIndicatorView;
    v8->_activityIndicatorView = (UIActivityIndicatorView *)v10;

    [(UIActivityIndicatorView *)v8->_activityIndicatorView setHidesWhenStopped:1];
    v12 = (void *)MEMORY[0x263F1C550];
    v13 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.45];
    v14 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
    v15 = objc_msgSend(v12, "nu_dynamicColor:withDarkStyleVariant:", v13, v14);

    [(UIActivityIndicatorView *)v8->_activityIndicatorView setColor:v15];
    [(NUActivityIndicatorLoadingView *)v8 addSubview:v8->_activityIndicatorView];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v4, v5, v6, v7);
    label = v8->_label;
    v8->_label = (UILabel *)v16;

    [(UILabel *)v8->_label setTextAlignment:1];
    [(UILabel *)v8->_label setNumberOfLines:1];
    v18 = [MEMORY[0x263F1C658] systemFontOfSize:11.0 weight:*MEMORY[0x263F1D338]];
    [(UILabel *)v8->_label setFont:v18];

    v19 = NUBundle();
    v20 = [v19 localizedStringForKey:@"LOADING" value:&stru_26D495918 table:0];
    [(UILabel *)v8->_label setText:v20];

    [(UILabel *)v8->_label setTextColor:v15];
    [(UILabel *)v8->_label setAlpha:0.0];
    [(NUActivityIndicatorLoadingView *)v8 addSubview:v8->_label];
  }
  return v8;
}

- (NUActivityIndicatorLoadingView)initWithText:(id)a3 activityIndicatorStyle:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(NUActivityIndicatorLoadingView *)self initWithActivityIndicatorStyle:a4];
  v8 = v7;
  if (v7) {
    [(UILabel *)v7->_label setText:v6];
  }

  return v8;
}

- (NUActivityIndicatorLoadingView)initWithFrame:(CGRect)a3
{
  return -[NUActivityIndicatorLoadingView initWithActivityIndicatorStyle:](self, "initWithActivityIndicatorStyle:", 100, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NUActivityIndicatorLoadingView)initWithCoder:(id)a3
{
  return [(NUActivityIndicatorLoadingView *)self initWithActivityIndicatorStyle:100];
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)NUActivityIndicatorLoadingView;
  [(NUActivityIndicatorLoadingView *)&v22 layoutSubviews];
  [(NUActivityIndicatorLoadingView *)self center];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(NUActivityIndicatorLoadingView *)self activityIndicatorView];
  objc_msgSend(v7, "setCenter:", v4, v6);

  v8 = [(NUActivityIndicatorLoadingView *)self label];
  [v8 sizeToFit];

  v9 = [(NUActivityIndicatorLoadingView *)self label];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  [(NUActivityIndicatorLoadingView *)self frame];
  double v15 = (v14 - v11) * 0.5;
  [(NUActivityIndicatorLoadingView *)self frame];
  double v17 = (v16 - v13) * 0.5;
  v18 = [(NUActivityIndicatorLoadingView *)self activityIndicatorView];
  [v18 bounds];
  double v20 = v17 + v19;

  v21 = [(NUActivityIndicatorLoadingView *)self label];
  objc_msgSend(v21, "setFrame:", v15, v20, v11, v13);
}

- (void)loadingViewStartAnimating
{
  double v3 = [(NUActivityIndicatorLoadingView *)self activityIndicatorView];
  char v4 = [v3 isAnimating];

  if ((v4 & 1) == 0)
  {
    double v5 = [(NUActivityIndicatorLoadingView *)self activityIndicatorView];
    [v5 startAnimating];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__NUActivityIndicatorLoadingView_loadingViewStartAnimating__block_invoke;
    v6[3] = &unk_2645FE4C8;
    v6[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:0x10000 delay:v6 options:0 animations:0.5 completion:0.0];
  }
}

void __59__NUActivityIndicatorLoadingView_loadingViewStartAnimating__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) label];
  [v1 setAlpha:1.0];
}

- (void)loadingViewStopAnimating
{
  double v3 = [(NUActivityIndicatorLoadingView *)self activityIndicatorView];
  int v4 = [v3 isAnimating];

  if (v4)
  {
    double v5 = [(NUActivityIndicatorLoadingView *)self activityIndicatorView];
    [v5 stopAnimating];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__NUActivityIndicatorLoadingView_loadingViewStopAnimating__block_invoke;
    v6[3] = &unk_2645FE4C8;
    v6[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:0x20000 delay:v6 options:0 animations:0.5 completion:0.0];
  }
}

void __58__NUActivityIndicatorLoadingView_loadingViewStopAnimating__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) label];
  [v1 setAlpha:0.0];
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

@end