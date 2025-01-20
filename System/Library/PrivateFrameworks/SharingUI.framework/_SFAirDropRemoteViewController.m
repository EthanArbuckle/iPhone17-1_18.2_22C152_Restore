@interface _SFAirDropRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SFAirDropViewServiceHostProtocol)airDropHost;
- (void)airDropViewServiceDidFinishTransferWithSuccess:(BOOL)a3;
- (void)airDropViewServiceDidRequestDismissal;
- (void)airDropViewServiceDidStartTransfer;
- (void)airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:(id)a3;
- (void)airDropViewServiceRequestingSharedItemsWithDataRequest:(id)a3 completionHandler:(id)a4;
- (void)airDropViewServiceWillStartTransferToRecipient:(id)a3;
- (void)setAirDropHost:(id)a3;
@end

@implementation _SFAirDropRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CEB3AE8];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE978A8];
}

- (void)airDropViewServiceWillStartTransferToRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFAirDropRemoteViewController *)self airDropHost];
  [v5 airDropViewServiceWillStartTransferToRecipient:v4];
}

- (void)airDropViewServiceDidStartTransfer
{
  id v2 = [(_SFAirDropRemoteViewController *)self airDropHost];
  [v2 airDropViewServiceDidStartTransfer];
}

- (void)airDropViewServiceDidFinishTransferWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_SFAirDropRemoteViewController *)self airDropHost];
  [v4 airDropViewServiceDidFinishTransferWithSuccess:v3];
}

- (void)airDropViewServiceRequestingSharedItemsWithDataRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_SFAirDropRemoteViewController *)self airDropHost];
  [v8 airDropViewServiceRequestingSharedItemsWithDataRequest:v7 completionHandler:v6];
}

- (void)airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFAirDropRemoteViewController *)self airDropHost];
  [v5 airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:v4];
}

- (void)airDropViewServiceDidRequestDismissal
{
  id v2 = [(_SFAirDropRemoteViewController *)self airDropHost];
  [v2 airDropViewServiceDidRequestDismissal];
}

- (SFAirDropViewServiceHostProtocol)airDropHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_airDropHost);
  return (SFAirDropViewServiceHostProtocol *)WeakRetained;
}

- (void)setAirDropHost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end