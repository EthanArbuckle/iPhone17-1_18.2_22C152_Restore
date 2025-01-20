@interface VUIAppSpinnerView
- (void)layoutSubviews;
@end

@implementation VUIAppSpinnerView

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)VUIAppSpinnerView;
  [(VUIAppSpinnerView *)&v12 layoutSubviews];
  if (!self->_didLayout)
  {
    v3 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(VUIAppSpinnerView *)self setBackgroundColor:v3];

    v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v4;

    [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
    [(VUIAppSpinnerView *)self addSubview:self->_spinner];
    v6 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
    v7 = [(VUIAppSpinnerView *)self centerXAnchor];
    v8 = [v6 constraintEqualToAnchor:v7];
    [v8 setActive:1];

    v9 = [(UIActivityIndicatorView *)self->_spinner centerYAnchor];
    v10 = [(VUIAppSpinnerView *)self centerYAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    [(UIActivityIndicatorView *)self->_spinner startAnimating];
    self->_didLayout = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end