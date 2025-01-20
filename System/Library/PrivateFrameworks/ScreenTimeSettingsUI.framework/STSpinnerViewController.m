@interface STSpinnerViewController
- (STSpinnerViewController)initWithCoder:(id)a3;
- (STSpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIActivityIndicatorView)spinnerView;
- (void)_commonInit;
- (void)setSpinnerView:(id)a3;
- (void)viewDidLoad;
@end

@implementation STSpinnerViewController

- (STSpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)STSpinnerViewController;
  v4 = [(STSpinnerViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(STSpinnerViewController *)v4 _commonInit];
  }
  return v5;
}

- (STSpinnerViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STSpinnerViewController;
  v3 = [(STSpinnerViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(STSpinnerViewController *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  spinnerView = self->_spinnerView;
  self->_spinnerView = v3;

  [(UIActivityIndicatorView *)self->_spinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = self->_spinnerView;

  [(UIActivityIndicatorView *)v5 startAnimating];
}

- (void)viewDidLoad
{
  v18[2] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)STSpinnerViewController;
  [(STSpinnerViewController *)&v17 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] whiteColor];
  v4 = [(STSpinnerViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(STSpinnerViewController *)self view];
  [v5 addSubview:self->_spinnerView];

  objc_super v6 = (void *)MEMORY[0x263F08938];
  objc_super v7 = [(UIActivityIndicatorView *)self->_spinnerView centerXAnchor];
  v8 = [(STSpinnerViewController *)self view];
  v9 = [v8 centerXAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v18[0] = v10;
  v11 = [(UIActivityIndicatorView *)self->_spinnerView centerYAnchor];
  v12 = [(STSpinnerViewController *)self view];
  v13 = [v12 centerYAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v18[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [v6 activateConstraints:v15];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STSpinnerViewController.viewDidLoad", v16, 2u);
  }
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end