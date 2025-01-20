@interface PKLoadingViewController
- (PKLoadingViewController)initWithDelegate:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKLoadingViewController

- (PKLoadingViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKLoadingViewController;
  v5 = [(PKLoadingViewController *)&v11 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [(PKLoadingViewController *)v6 navigationItem];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v6 action:sel__cancelButtonTapped_];
    [v7 setLeftBarButtonItem:v8];
    id v9 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v9 configureWithTransparentBackground];
    [v7 setStandardAppearance:v9];
  }
  return v6;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PKLoadingViewController;
  [(PKLoadingViewController *)&v14 viewDidLoad];
  v3 = [(PKLoadingViewController *)self view];
  id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v5;

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  [v3 addSubview:self->_spinner];
  id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
  v8 = (UILabel *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v8;

  v10 = self->_loadingLabel;
  objc_super v11 = PKLocalizedString(&cfstr_Loading_1.isa);
  [(UILabel *)v10 setText:v11];

  v12 = self->_loadingLabel;
  v13 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v12 setTextColor:v13];

  [v3 addSubview:self->_loadingLabel];
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PKLoadingViewController;
  [(PKLoadingViewController *)&v18 viewDidLayoutSubviews];
  v3 = [(PKLoadingViewController *)self view];
  [v3 bounds];
  [(UIActivityIndicatorView *)self->_spinner frame];
  [v3 center];
  UIRectCenteredAboutPoint();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  [(UILabel *)self->_loadingLabel sizeToFit];
  [(UILabel *)self->_loadingLabel frame];
  UIRectCenteredXInRect();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  -[UILabel setFrame:](self->_loadingLabel, "setFrame:", v13, CGRectGetMaxY(v19) + 10.0, v15, v17);
}

- (void)_cancelButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained loadingViewControllerDidCancel:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end