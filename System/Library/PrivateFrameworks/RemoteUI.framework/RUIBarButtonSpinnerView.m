@interface RUIBarButtonSpinnerView
- (RUIBarButtonSpinnerView)initWithActivityIndicatorStyle:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation RUIBarButtonSpinnerView

- (RUIBarButtonSpinnerView)initWithActivityIndicatorStyle:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)RUIBarButtonSpinnerView;
  v4 = [(UIBarItem *)&v19 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:a3];
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v5;

    [(UIActivityIndicatorView *)v4->_spinner frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    [(UIActivityIndicatorView *)v4->_spinner setHidesWhenStopped:1];
    -[UIActivityIndicatorView setFrame:](v4->_spinner, "setFrame:", v8, v10, v12, v14);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v15, v16, v12, v14);
    [v17 addSubview:v4->_spinner];
    [(RUIBarButtonSpinnerView *)v4 setCustomView:v17];
  }
  return v4;
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RUIBarButtonSpinnerView;
  id v4 = a3;
  [(RUIBarButtonSpinnerView *)&v5 setTintColor:v4];
  -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v4, v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end