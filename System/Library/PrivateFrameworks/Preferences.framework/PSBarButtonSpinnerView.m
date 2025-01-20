@interface PSBarButtonSpinnerView
- (PSBarButtonSpinnerView)init;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation PSBarButtonSpinnerView

- (PSBarButtonSpinnerView)init
{
  v13.receiver = self;
  v13.super_class = (Class)PSBarButtonSpinnerView;
  v2 = [(UIBarItem *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    spinner = v2->_spinner;
    v2->_spinner = (UIActivityIndicatorView *)v3;

    [(UIActivityIndicatorView *)v2->_spinner frame];
    double v6 = v5;
    double v8 = v7;
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    -[UIActivityIndicatorView setFrame:](v2->_spinner, "setFrame:");
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v6, v8);
    [v11 addSubview:v2->_spinner];
    [(PSBarButtonSpinnerView *)v2 setCustomView:v11];
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