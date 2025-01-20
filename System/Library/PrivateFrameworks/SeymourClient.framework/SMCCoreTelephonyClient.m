@interface SMCCoreTelephonyClient
- ($2825F4736939C4A6D3AD43837233062D)cellularDataEnabled:(char *)a3;
- (BOOL)_getRoamingFromDataStatus:(id)a3;
- (BOOL)cellularDataEnabled;
- (BOOL)roaming;
- (CTXPCServiceSubscriptionContext)preferredDataSubscriptionContext;
- (CoreTelephonyClient)ctClient;
- (OS_dispatch_queue)queue;
- (SMCCoreTelephonyClient)initWithQueue:(id)a3;
- (SMCCoreTelephonyClientDelegate)delegate;
- (__CTServerConnection)ctServerConnection;
- (void)_updatePreferredDataSubscriptionContext;
- (void)activate;
- (void)dataSettingsChanged:(id)a3;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)internetDataStatus:(id)a3;
- (void)roaming:(char *)a3 error:(id *)a4;
- (void)servingNetworkChanged:(id)a3;
- (void)setCellularDataEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferredDataSubscriptionContext:(id)a3;
- (void)setRoaming:(BOOL)a3;
@end

@implementation SMCCoreTelephonyClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_preferredDataSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SMCCoreTelephonyClient)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMCCoreTelephonyClient;
  v6 = [(SMCCoreTelephonyClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- ($2825F4736939C4A6D3AD43837233062D)cellularDataEnabled:(char *)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)MEMORY[0x1F40DF128](self->_ctServerConnection, a3);
}

- (void)activate
{
  v3 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:self->_queue];
  ctClient = self->_ctClient;
  self->_ctClient = v3;

  [(CoreTelephonyClient *)self->_ctClient setDelegate:self];
  self->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  id v5 = self->_ctClient;
  id v9 = 0;
  v6 = [(CoreTelephonyClient *)v5 getPreferredDataSubscriptionContextSync:&v9];
  id v7 = v9;
  preferredDataSubscriptionContext = self->_preferredDataSubscriptionContext;
  self->_preferredDataSubscriptionContext = v6;
}

- (void)roaming:(char *)a3 error:(id *)a4
{
  id v5 = [(CoreTelephonyClient *)self->_ctClient getDataStatus:0 error:a4];
  if (v5)
  {
    id v7 = v5;
    char v6 = [v5 inHomeCountry] ^ 1;
    id v5 = v7;
    *a3 = v6;
  }
}

- (void)_updatePreferredDataSubscriptionContext
{
  ctClient = self->_ctClient;
  id v7 = 0;
  v4 = [(CoreTelephonyClient *)ctClient getPreferredDataSubscriptionContextSync:&v7];
  id v5 = v7;
  preferredDataSubscriptionContext = self->_preferredDataSubscriptionContext;
  self->_preferredDataSubscriptionContext = v4;
}

- (BOOL)_getRoamingFromDataStatus:(id)a3
{
  return [a3 inHomeCountry] ^ 1;
}

- (void)dataSettingsChanged:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v5 = [v4 isCellularDataEnabled];

  [WeakRetained cellularDataStateChangedWithCellularDataEnabled:v5];
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v8 = a4;
  if ([(CTXPCServiceSubscriptionContext *)self->_preferredDataSubscriptionContext isEqual:a3])
  {
    BOOL v6 = [(SMCCoreTelephonyClient *)self _getRoamingFromDataStatus:v8];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained cellularDataStateChangedWithRoaming:v6];
  }
}

- (void)internetDataStatus:(id)a3
{
  BOOL v4 = [(SMCCoreTelephonyClient *)self _getRoamingFromDataStatus:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cellularDataStateChangedWithRoaming:v4];
}

- (void)servingNetworkChanged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cellularDataStateChanged];
}

- (SMCCoreTelephonyClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SMCCoreTelephonyClientDelegate *)WeakRetained;
}

- (BOOL)cellularDataEnabled
{
  return self->_cellularDataEnabled;
}

- (void)setCellularDataEnabled:(BOOL)a3
{
  self->_cellularDataEnabled = a3;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (CTXPCServiceSubscriptionContext)preferredDataSubscriptionContext
{
  return self->_preferredDataSubscriptionContext;
}

- (void)setPreferredDataSubscriptionContext:(id)a3
{
}

- (BOOL)roaming
{
  return self->_roaming;
}

- (void)setRoaming:(BOOL)a3
{
  self->_roaming = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end