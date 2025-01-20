@interface VSSpinnerTitleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (VSSpinnerTitleView)initWithTitle:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation VSSpinnerTitleView

- (VSSpinnerTitleView)initWithTitle:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSSpinnerTitleView;
  v5 = -[VSSpinnerTitleView initWithFrame:](&v13, sel_initWithFrame_, 0.0, 0.0, 0.0, 22.0);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    titleView = v5->_titleView;
    v5->_titleView = (UILabel *)v7;

    [(UILabel *)v5->_titleView setText:v4];
    v9 = [MEMORY[0x263F1C658] boldSystemFontOfSize:18.0];
    [(UILabel *)v5->_titleView setFont:v9];

    v10 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x263F1C3D8]);
    spinner = v5->_spinner;
    v5->_spinner = v10;

    [(VSSpinnerTitleView *)v5 addSubview:v5->_titleView];
    [(VSSpinnerTitleView *)v5 addSubview:v5->_spinner];
  }

  return v5;
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  v3.receiver = self;
  v3.super_class = (Class)VSSpinnerTitleView;
  [(VSSpinnerTitleView *)&v3 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UILabel *)self->_titleView sizeToFit];
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(UILabel *)self->_titleView frame];
  double v5 = v4;
  [(UIActivityIndicatorView *)self->_spinner frame];
  if (v5 < v6) {
    double v5 = v6;
  }
  [(UILabel *)self->_titleView frame];
  double v8 = v7 + 10.0;
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v10 = v8 + v9 + 10.0;
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v12 = v10 + v11;
  double v13 = v5;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)VSSpinnerTitleView;
  [(VSSpinnerTitleView *)&v11 layoutSubviews];
  [(UILabel *)self->_titleView sizeToFit];
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(VSSpinnerTitleView *)self bounds];
  double v4 = v3;
  [(UIActivityIndicatorView *)self->_spinner frame];
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  [(UILabel *)self->_titleView frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIActivityIndicatorView *)self->_spinner frame];
  -[UILabel setFrame:](self->_titleView, "setFrame:", CGRectGetMaxX(v12) + 10.0, v6 + floor((v4 - v10) * 0.5), v8, v10);
}

- (void)didMoveToWindow
{
  double v3 = [(VSSpinnerTitleView *)self window];

  spinner = self->_spinner;
  if (v3)
  {
    [(UIActivityIndicatorView *)spinner startAnimating];
  }
  else
  {
    [(UIActivityIndicatorView *)spinner stopAnimating];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end