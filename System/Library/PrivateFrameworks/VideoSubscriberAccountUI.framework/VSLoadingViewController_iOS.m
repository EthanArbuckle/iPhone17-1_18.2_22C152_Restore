@interface VSLoadingViewController_iOS
+ (NSString)defaultLoadingTitle;
+ (double)layoutSpacing;
+ (id)signingOutTitle;
- (BOOL)isAnimating;
- (BOOL)isCancellationAllowed;
- (NSString)loadingTitle;
- (UIActivityIndicatorView)loadingIndicator;
- (UILabel)label;
- (VSLoadingViewControllerDelegate)delegate;
- (VSLoadingViewController_iOS)initWithCoder:(id)a3;
- (VSLoadingViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_cancelButtonPressed:(id)a3;
- (void)setCancellationAllowed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLoadingIndicator:(id)a3;
- (void)setLoadingTitle:(id)a3;
- (void)updateAnimating;
- (void)viewDidLoad;
@end

@implementation VSLoadingViewController_iOS

- (VSLoadingViewController_iOS)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSLoadingViewController_iOS;
  v3 = [(VSLoadingViewController_iOS *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    commonInit_3(v3);
  }
  return v4;
}

- (VSLoadingViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VSLoadingViewController_iOS;
  v4 = [(VSLoadingViewController_iOS *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    commonInit_3(v4);
  }
  return v5;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)VSLoadingViewController_iOS;
  [(VSLoadingViewController_iOS *)&v24 viewDidLoad];
  v3 = [(VSLoadingViewController_iOS *)self view];
  v4 = [MEMORY[0x263F1C550] groupTableViewBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(VSLoadingViewController_iOS *)self loadingIndicator];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setHidesWhenStopped:1];
  [(VSLoadingViewController_iOS *)self updateAnimating];
  [v3 addSubview:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v7 = [v5 centerXAnchor];
  v8 = [v3 centerXAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  [v6 addObject:v9];

  v10 = [v5 centerYAnchor];
  v11 = [v3 centerYAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v6 addObject:v12];

  v13 = [(VSLoadingViewController_iOS *)self label];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v13];
  [(id)objc_opt_class() layoutSpacing];
  double v15 = v14;
  v16 = [v5 centerXAnchor];
  v17 = [v13 centerXAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v6 addObject:v18];

  v19 = [MEMORY[0x263F08938] constraintWithItem:v13 attribute:3 relatedBy:0 toItem:v5 attribute:4 multiplier:1.0 constant:v15];
  [v6 addObject:v19];

  [MEMORY[0x263F08938] activateConstraints:v6];
  if ([(VSLoadingViewController_iOS *)self isCancellationAllowed])
  {
    v20 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    v21 = [v20 localizedStringForKey:@"CANCEL_TITLE" value:0 table:0];

    v22 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:v21 style:0 target:self action:sel__cancelButtonPressed_];
    v23 = [(VSLoadingViewController_iOS *)self navigationItem];
    [v23 setLeftBarButtonItem:v22];
  }
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (void)updateAnimating
{
  BOOL v3 = [(VSLoadingViewController_iOS *)self isAnimating];
  v4 = [(VSLoadingViewController_iOS *)self loadingIndicator];
  v5 = v4;
  if (v3) {
    [v4 startAnimating];
  }
  else {
    [v4 stopAnimating];
  }

  id v6 = [(VSLoadingViewController_iOS *)self label];
  objc_msgSend(v6, "setHidden:", -[VSLoadingViewController_iOS isAnimating](self, "isAnimating") ^ 1);
}

- (void)setLoadingTitle:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(id)objc_opt_class() defaultLoadingTitle];
  }
  id v6 = v5;
  objc_super v7 = [(VSLoadingViewController_iOS *)self label];
  v8 = [v6 uppercaseString];
  [v7 setText:v8];
}

- (NSString)loadingTitle
{
  v2 = [(VSLoadingViewController_iOS *)self label];
  BOOL v3 = [v2 text];

  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The textOrNil parameter must not be nil."];
  }
  return (NSString *)v3;
}

+ (NSString)defaultLoadingTitle
{
  v2 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  BOOL v3 = [v2 localizedStringForKey:@"LOADING_TITLE_NO_ELLIPSIS" value:0 table:0];

  return (NSString *)v3;
}

+ (id)signingOutTitle
{
  v2 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  BOOL v3 = [v2 localizedStringForKey:@"SIGNING_OUT_TITLE" value:0 table:0];

  return v3;
}

+ (double)layoutSpacing
{
  return 8.0;
}

- (void)_cancelButtonPressed:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[VSLoadingViewController_iOS _cancelButtonPressed:]";
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(VSLoadingViewController_iOS *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 loadingViewControllerDidCancel:self];
  }
}

- (VSLoadingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSLoadingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (void)setCancellationAllowed:(BOOL)a3
{
  self->_cancellationAllowed = a3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end