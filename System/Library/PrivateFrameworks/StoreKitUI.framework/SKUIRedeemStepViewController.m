@interface SKUIRedeemStepViewController
- (BOOL)shouldShowPassbookLearnMore;
- (NSOperationQueue)operationQueue;
- (SKUIClientContext)clientContext;
- (SKUIRedeemConfiguration)configuration;
- (SKUIRedeemStepDelegate)redeemStepDelegate;
- (void)setClientContext:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setRedeemStepDelegate:(id)a3;
- (void)shouldShowPassbookLearnMore;
@end

@implementation SKUIRedeemStepViewController

- (BOOL)shouldShowPassbookLearnMore
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemStepViewController shouldShowPassbookLearnMore]();
  }
  uint64_t v3 = SKUIPassKitCoreFramework();
  id v4 = SKUIWeakLinkedClassForString(&cfstr_Pkpasslibrary.isa, v3);
  v5 = [(SKUIRedeemStepViewController *)self configuration];
  v6 = [v5 ITunesPassConfiguration];

  if (!v6) {
    return 0;
  }
  if (![v4 isPassLibraryAvailable]) {
    return 0;
  }
  v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1) {
    return 0;
  }
  v11 = [MEMORY[0x1E4FA8100] defaultStore];
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

- (SKUIClientContext)clientContext
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

- (SKUIRedeemConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SKUIRedeemStepDelegate)redeemStepDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redeemStepDelegate);

  return (SKUIRedeemStepDelegate *)WeakRetained;
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

- (void)shouldShowPassbookLearnMore
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemStepViewController shouldShowPassbookLearnMore]";
}

@end