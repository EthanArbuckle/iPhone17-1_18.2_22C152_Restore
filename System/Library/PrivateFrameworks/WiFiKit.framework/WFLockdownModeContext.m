@interface WFLockdownModeContext
- (BOOL)needsDismissal;
- (WFLockdownModeContext)initWithNetwork:(id)a3 securityType:(unint64_t)a4;
- (WFNetworkListRecord)network;
- (WFNetworkView)provider;
- (id)completionHandler;
- (int64_t)requestedFields;
- (unint64_t)securityType;
- (void)cancel;
- (void)join;
- (void)setCompletionHandler:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setProvider:(id)a3;
- (void)setSecurityType:(unint64_t)a3;
@end

@implementation WFLockdownModeContext

- (WFLockdownModeContext)initWithNetwork:(id)a3 securityType:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_network, a3);
    self->_securityType = a4;
    self->_needsDismissal = 1;
  }
  else
  {
    v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      int v11 = 136315138;
      v12 = "-[WFLockdownModeContext initWithNetwork:securityType:]";
      _os_log_impl(&dword_226071000, v9, v10, "%s: nil network", (uint8_t *)&v11, 0xCu);
    }

    self = 0;
  }

  return self;
}

- (int64_t)requestedFields
{
  return 0;
}

- (void)cancel
{
  self->_needsDismissal = 0;
  v2 = [(WFLockdownModeContext *)self completionHandler];
  v2[2](v2, 0);
}

- (void)join
{
  self->_needsDismissal = 0;
  v2 = [(WFLockdownModeContext *)self completionHandler];
  v2[2](v2, 1);
}

- (WFNetworkView)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (WFNetworkView *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (BOOL)needsDismissal
{
  return self->_needsDismissal;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (WFNetworkListRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (unint64_t)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(unint64_t)a3
{
  self->_securityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end