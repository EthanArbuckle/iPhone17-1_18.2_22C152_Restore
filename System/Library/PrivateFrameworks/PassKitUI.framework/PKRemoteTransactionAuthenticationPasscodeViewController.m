@interface PKRemoteTransactionAuthenticationPasscodeViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (PKRemoteTransactionAuthenticationPasscodeViewControllerDelegate)delegate;
- (void)passcodeViewControllerDidCancel;
- (void)passcodeViewControllerDidEndSessionExchange;
- (void)passcodeViewControllerDidGenerateEncryptedPasscode:(id)a3;
- (void)passcodeViewControllerRequestSessionExchangeTokenWithHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PKRemoteTransactionAuthenticationPasscodeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF370340];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF431238];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKRemoteTransactionAuthenticationPasscodeViewController;
  [(_UIRemoteViewController *)&v5 viewServiceDidTerminateWithError:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeViewControllerDidCancel];
}

- (void)passcodeViewControllerRequestSessionExchangeTokenWithHandler:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained passcodeViewControllerRequestSessionExchangeTokenWithHandler:v4];
}

- (void)passcodeViewControllerDidEndSessionExchange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeViewControllerDidEndSessionExchange];
}

- (void)passcodeViewControllerDidCancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeViewControllerDidCancel];
}

- (void)passcodeViewControllerDidGenerateEncryptedPasscode:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained passcodeViewControllerDidGenerateEncryptedPasscode:v4];
}

- (PKRemoteTransactionAuthenticationPasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKRemoteTransactionAuthenticationPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end