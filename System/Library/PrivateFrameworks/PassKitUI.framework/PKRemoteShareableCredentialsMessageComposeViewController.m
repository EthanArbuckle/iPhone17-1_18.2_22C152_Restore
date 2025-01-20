@interface PKRemoteShareableCredentialsMessageComposeViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (PKShareableCredentialsMessageComposeViewControllerDelegate)delegate;
- (void)messageComposeViewControllerDidFinishWithResult:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PKRemoteShareableCredentialsMessageComposeViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF3257F8];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF430E50];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  if (!self->_finished)
  {
    self->_finished = 1;
    id v3 = [(PKRemoteShareableCredentialsMessageComposeViewController *)self delegate];
    [v3 messageComposeViewControllerDidFinishWithResult:0];
  }
}

- (void)messageComposeViewControllerDidFinishWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PKRemoteShareableCredentialsMessageComposeViewController *)self delegate];

  if (v5)
  {
    id v6 = [(PKRemoteShareableCredentialsMessageComposeViewController *)self delegate];
    [v6 messageComposeViewControllerDidFinishWithResult:v3];
  }
  else
  {
    [(PKRemoteShareableCredentialsMessageComposeViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (PKShareableCredentialsMessageComposeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKShareableCredentialsMessageComposeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end