@interface SBWindowedAccessoryViewController
- (BOOL)_canShowWhileLocked;
- (SBWindowedAccessoryView)windowedAccessoryView;
- (SBWindowedAccessoryViewControllerDelegate)delegate;
- (void)forceDetachWindowedAcessoryButtonTapped:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setWindowedAccessoryView:(id)a3;
- (void)viewDidLoad;
@end

@implementation SBWindowedAccessoryViewController

- (void)loadView
{
  v3 = objc_alloc_init(SBWindowedAccessoryView);
  windowedAccessoryView = self->_windowedAccessoryView;
  self->_windowedAccessoryView = v3;

  [(SBWindowedAccessoryView *)self->_windowedAccessoryView setDelegate:self];
  v5 = self->_windowedAccessoryView;
  [(SBWindowedAccessoryViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SBWindowedAccessoryViewController;
  [(SBWindowedAccessoryViewController *)&v2 viewDidLoad];
}

- (void)forceDetachWindowedAcessoryButtonTapped:(id)a3
{
  id v4 = [(SBWindowedAccessoryViewController *)self delegate];
  [v4 windowedAccessoryViewControllerForceDetachButtonTapped:self];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SBWindowedAccessoryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBWindowedAccessoryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBWindowedAccessoryView)windowedAccessoryView
{
  return self->_windowedAccessoryView;
}

- (void)setWindowedAccessoryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowedAccessoryView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end