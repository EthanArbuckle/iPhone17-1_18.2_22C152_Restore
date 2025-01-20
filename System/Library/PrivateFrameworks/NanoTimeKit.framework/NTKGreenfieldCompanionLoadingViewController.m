@interface NTKGreenfieldCompanionLoadingViewController
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NTKGreenfieldCompanionLoadingViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldCompanionLoadingViewController;
  [(NTKGreenfieldCompanionLoadingViewController *)&v6 viewDidLoad];
  v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v3;

  v5 = [(NTKGreenfieldCompanionLoadingViewController *)self view];
  [v5 addSubview:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKGreenfieldCompanionLoadingViewController;
  [(NTKGreenfieldCompanionLoadingViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(NTKGreenfieldCompanionLoadingViewController *)self view];
  [v3 center];
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:");
}

- (void).cxx_destruct
{
}

@end