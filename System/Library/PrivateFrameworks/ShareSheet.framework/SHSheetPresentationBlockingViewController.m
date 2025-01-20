@interface SHSheetPresentationBlockingViewController
- (SHSheetContentPresenter)presenter;
- (SHSheetPresentationBlockingViewControllerDelegate)delegate;
- (UIBarButtonItem)closeButton;
- (id)_createSystemCloseButton;
- (void)_handleClose;
- (void)loadView;
- (void)setCloseButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresenter:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SHSheetPresentationBlockingViewController

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(SHSheetPresentationBlockingViewController *)self setView:v3];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)SHSheetPresentationBlockingViewController;
  [(SHSheetPresentationBlockingViewController *)&v2 viewDidLayoutSubviews];
}

- (id)_createSystemCloseButton
{
  objc_super v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__handleClose];
  return v2;
}

- (void)_handleClose
{
  id v2 = [(SHSheetPresentationBlockingViewController *)self delegate];
  [v2 handlePresentationBlockingViewControllerClose];
}

- (SHSheetPresentationBlockingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetPresentationBlockingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIBarButtonItem)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (SHSheetContentPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SHSheetContentPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end