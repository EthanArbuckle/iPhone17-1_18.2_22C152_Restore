@interface PKRemoteSubcredentialMessageComposeViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
- (PKSubcredentialMessageComposeViewControllerDelegate)delegate;
- (void)messageComposeViewControllerDidFinishWithResult:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PKRemoteSubcredentialMessageComposeViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  if (!self->_finished)
  {
    self->_finished = 1;
    id v3 = [(PKRemoteSubcredentialMessageComposeViewController *)self delegate];
    [v3 messageComposeViewControllerDidFinishWithResult:0];
  }
}

- (void)messageComposeViewControllerDidFinishWithResult:(BOOL)a3
{
  if (!self->_finished)
  {
    BOOL v3 = a3;
    self->_finished = 1;
    id v4 = [(PKRemoteSubcredentialMessageComposeViewController *)self delegate];
    [v4 messageComposeViewControllerDidFinishWithResult:v3];
  }
}

- (PKSubcredentialMessageComposeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSubcredentialMessageComposeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end