@interface NCModalNavigationController
- (NCModalNavigationControllerDelegate)presenterDelegate;
- (void)setPresenterDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation NCModalNavigationController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NCModalNavigationController;
  [(NCModalNavigationController *)&v4 viewDidLoad];
  [(NCModalNavigationController *)self setModalPresentationStyle:2];
  v3 = [(NCModalNavigationController *)self sheetPresentationController];
  [v3 _setShouldDismissWhenTappedOutside:1];
  [v3 setPrefersGrabberVisible:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCModalNavigationController *)self isBeingDismissed])
  {
    v5 = [(NCModalNavigationController *)self presenterDelegate];
    if (objc_opt_respondsToSelector()) {
      [v5 modalNavigationControllerDidDismiss:self];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NCModalNavigationController;
  [(NCModalNavigationController *)&v6 viewDidDisappear:v3];
}

- (NCModalNavigationControllerDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

  return (NCModalNavigationControllerDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end