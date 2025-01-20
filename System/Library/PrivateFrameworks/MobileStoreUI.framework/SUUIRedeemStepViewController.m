@interface SUUIRedeemStepViewController
- (BOOL)shouldShowPassbookLearnMore;
- (NSOperationQueue)operationQueue;
- (SUUIClientContext)clientContext;
- (SUUIRedeemConfiguration)configuration;
- (SUUIRedeemStepDelegate)redeemStepDelegate;
- (void)setClientContext:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setRedeemStepDelegate:(id)a3;
@end

@implementation SUUIRedeemStepViewController

- (BOOL)shouldShowPassbookLearnMore
{
  uint64_t v3 = SUUIPassKitCoreFramework();
  id v4 = SUUIWeakLinkedClassForString(&cfstr_Pkpasslibrary.isa, v3);
  v5 = [(SUUIRedeemStepViewController *)self configuration];
  v6 = [v5 ITunesPassConfiguration];

  if (!v6) {
    return 0;
  }
  if (![v4 isPassLibraryAvailable]) {
    return 0;
  }
  v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1) {
    return 0;
  }
  v11 = [MEMORY[0x263F7B0E8] defaultStore];
  v12 = [v11 activeAccount];
  v13 = [v12 ITunesPassSerialNumber];

  if (v13)
  {
    id v14 = objc_alloc_init((Class)v4);
    v15 = [v14 passWithPassTypeIdentifier:@"pass.com.apple.itunes.storecredit" serialNumber:v13];
    BOOL v9 = v15 == 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (SUUIRedeemConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SUUIRedeemStepDelegate)redeemStepDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redeemStepDelegate);
  return (SUUIRedeemStepDelegate *)WeakRetained;
}

- (void)setRedeemStepDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redeemStepDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end