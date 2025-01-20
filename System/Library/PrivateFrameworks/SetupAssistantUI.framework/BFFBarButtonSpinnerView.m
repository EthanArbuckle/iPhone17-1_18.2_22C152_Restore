@interface BFFBarButtonSpinnerView
- (BFFBarButtonSpinnerView)init;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation BFFBarButtonSpinnerView

- (BFFBarButtonSpinnerView)init
{
  v13.receiver = self;
  v13.super_class = (Class)BFFBarButtonSpinnerView;
  v2 = [(UIBarItem *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = v2->_spinner;
    v2->_spinner = (UIActivityIndicatorView *)v3;

    [(UIActivityIndicatorView *)v2->_spinner frame];
    double v6 = v5;
    double v8 = v7;
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    -[UIActivityIndicatorView setFrame:](v2->_spinner, "setFrame:");
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v9, v10, v6, v8);
    [v11 addSubview:v2->_spinner];
    [(BFFBarButtonSpinnerView *)v2 setCustomView:v11];
  }
  return v2;
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (void).cxx_destruct
{
}

@end