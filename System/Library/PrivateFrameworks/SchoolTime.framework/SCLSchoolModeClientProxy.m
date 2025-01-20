@interface SCLSchoolModeClientProxy
- (BOOL)validateBooleanEntitlement:(id)a3 error:(id *)a4;
- (BOOL)validatePairing:(id *)a3;
- (NSString)description;
- (NSString)identifier;
- (NSUUID)pairingID;
- (NSXPCConnection)connection;
- (SCLSchoolModeClientProxy)initWithConnection:(id)a3;
- (SCLSchoolModeClientProxyDelegate)delegate;
- (SCLSchoolModeCoordinator)coordinator;
- (id)remoteClient;
- (id)serverSettings;
- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4;
- (void)applySchedule:(id)a3 completion:(id)a4;
- (void)connectWithPairingID:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)deleteHistoryWithCompletion:(id)a3;
- (void)didUpdateScheduleSettings:(id)a3 notify:(BOOL)a4;
- (void)didUpdateState:(id)a3 fromState:(id)a4;
- (void)dumpState;
- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3;
- (void)noteSignificantUserInteraction;
- (void)sendServerSettings:(id)a3;
- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPairingID:(id)a3;
- (void)triggerRemoteSync;
- (void)unlockHistoryDidChange;
@end

@implementation SCLSchoolModeClientProxy

- (SCLSchoolModeClientProxy)initWithConnection:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLSchoolModeClientProxy;
  v6 = [(SCLSchoolModeClientProxy *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    [(NSXPCConnection *)v7->_connection setExportedObject:v7];
    connection = v7->_connection;
    v9 = SCLSchoolModeServerXPCInterface();
    [(NSXPCConnection *)connection setExportedInterface:v9];

    v10 = v7->_connection;
    v11 = SCLSchoolModeClientXPCInterface();
    [(NSXPCConnection *)v10 setRemoteObjectInterface:v11];

    objc_initWeak(&location, v7);
    v12 = v7->_connection;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __47__SCLSchoolModeClientProxy_initWithConnection___block_invoke;
    v14[3] = &unk_2648AC4E0;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v12 setInvalidationHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __47__SCLSchoolModeClientProxy_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 clientProxyDidInvalidate:WeakRetained];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(SCLSchoolModeClientProxy *)self pairingID];
  id v5 = (id)[v3 appendObject:v4 withName:@"pairingID"];

  v6 = [(SCLSchoolModeClientProxy *)self identifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"identifier"];

  id v8 = (id)objc_msgSend(v3, "appendInt:withName:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), @"pid");
  v9 = [v3 build];

  return (NSString *)v9;
}

- (void)connectWithPairingID:(id)a3 identifier:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = scl_framework_log();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);

  v13 = scl_framework_log();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v19 = 134217984;
    v20 = self;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Connect Client", "Client: %p", (uint8_t *)&v19, 0xCu);
  }

  [(SCLSchoolModeClientProxy *)self setPairingID:v10];
  [(SCLSchoolModeClientProxy *)self setIdentifier:v9];

  id v15 = [(SCLSchoolModeClientProxy *)self delegate];
  [v15 clientProxy:self didConnectWithPairingID:v10];

  v16 = [(SCLSchoolModeClientProxy *)self serverSettings];
  v8[2](v8, v16, 0);

  objc_super v17 = scl_framework_log();
  v18 = v17;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    int v19 = 134217984;
    v20 = self;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v18, OS_SIGNPOST_INTERVAL_END, v12, "Connect Client", "Client: %p", (uint8_t *)&v19, 0xCu);
  }
}

- (void)applySchedule:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  id v17 = 0;
  BOOL v8 = [(SCLSchoolModeClientProxy *)self validateBooleanEntitlement:@"com.apple.schooltime.setschedule" error:&v17];
  id v9 = v17;
  id v10 = v9;
  if (v8)
  {
    id v16 = v9;
    BOOL v11 = [(SCLSchoolModeClientProxy *)self validatePairing:&v16];
    id v12 = v16;

    if (v11)
    {
      v13 = [(SCLSchoolModeClientProxy *)self coordinator];
      id v15 = v12;
      uint64_t v14 = [v13 applySchedule:v6 error:&v15];
      id v10 = v15;

      v7[2](v7, v14, v10);
    }
    else
    {
      v7[2](v7, 0, v12);
      id v10 = v12;
    }
  }
  else
  {
    v7[2](v7, 0, v9);
  }
}

- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  BOOL v8 = (void (**)(id, uint64_t, id))a5;
  id v15 = 0;
  BOOL v9 = [(SCLSchoolModeClientProxy *)self validatePairing:&v15];
  id v10 = v15;
  if (v9)
  {
    BOOL v11 = [(SCLSchoolModeClientProxy *)self coordinator];
    id v14 = v10;
    uint64_t v12 = [v11 setActive:v6 options:a4 error:&v14];
    id v13 = v14;

    v8[2](v8, v12, v13);
    id v10 = v13;
  }
  else
  {
    v8[2](v8, 0, v10);
  }
}

- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v15 = 0;
  BOOL v8 = [(SCLSchoolModeClientProxy *)self validateBooleanEntitlement:@"com.apple.schooltime.edithistory" error:&v15];
  id v9 = v15;
  id v10 = v9;
  if (v8)
  {
    id v14 = v9;
    BOOL v11 = [(SCLSchoolModeClientProxy *)self validatePairing:&v14];
    id v12 = v14;

    if (v11)
    {
      id v13 = [(SCLSchoolModeClientProxy *)self coordinator];
      [v13 addUnlockHistoryItem:v6 completion:v7];
    }
    else
    {
      v7[2](v7, 0, v12);
    }
    id v10 = v12;
  }
  else
  {
    v7[2](v7, 0, v9);
  }
}

- (void)deleteHistoryWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  id v12 = 0;
  BOOL v5 = [(SCLSchoolModeClientProxy *)self validateBooleanEntitlement:@"com.apple.schooltime.edithistory" error:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    id v11 = v6;
    BOOL v8 = [(SCLSchoolModeClientProxy *)self validatePairing:&v11];
    id v9 = v11;

    if (v8)
    {
      id v10 = [(SCLSchoolModeClientProxy *)self coordinator];
      [v10 deleteHistoryWithCompletion:v4];
    }
    else
    {
      v4[2](v4, 0, v9);
    }
    id v7 = v9;
  }
  else
  {
    v4[2](v4, 0, v6);
  }
}

- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  id v12 = 0;
  BOOL v5 = [(SCLSchoolModeClientProxy *)self validateBooleanEntitlement:@"com.apple.schooltime.unlockhistory" error:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    id v11 = v6;
    BOOL v8 = [(SCLSchoolModeClientProxy *)self validatePairing:&v11];
    id v9 = v11;

    if (v8)
    {
      id v10 = [(SCLSchoolModeClientProxy *)self coordinator];
      [v10 fetchRecentUnlockHistoryItemsWithCompletion:v4];
    }
    else
    {
      v4[2](v4, MEMORY[0x263EFFA68], v9);
    }
    id v7 = v9;
  }
  else
  {
    v4[2](v4, MEMORY[0x263EFFA68], v6);
  }
}

- (void)triggerRemoteSync
{
  id v4 = [(SCLSchoolModeClientProxy *)self coordinator];
  v2 = [v4 configuration];
  v3 = [v2 transportController];
  [v3 requestRemoteSettings];
}

- (void)dumpState
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22B7B4000, log, (os_log_type_t)0x90u, "State dump", v1, 2u);
}

- (void)noteSignificantUserInteraction
{
  id v5 = [(SCLSchoolModeClientProxy *)self coordinator];
  v2 = [v5 configuration];
  v3 = [v2 transportController];
  id v4 = [v3 settingsSyncCoordinator];
  [v4 noteSignificantUserInteractionOccured];
}

- (BOOL)validateBooleanEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SCLSchoolModeClientProxy *)self connection];
  BOOL v8 = [v7 valueForEntitlement:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue])
  {
    BOOL v9 = 1;
  }
  else if (a4)
  {
    SCLEntitlementError((uint64_t)v6);
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)validatePairing:(id *)a3
{
  id v5 = [(SCLSchoolModeClientProxy *)self coordinator];
  char v6 = [v5 isReady];

  if (a3 && (v6 & 1) == 0)
  {
    id v7 = [(SCLSchoolModeClientProxy *)self pairingID];
    SCLPairingUnavailableError((uint64_t)v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)serverSettings
{
  v3 = [(SCLSchoolModeClientProxy *)self coordinator];
  id v4 = [v3 currentState];

  id v5 = [(SCLSchoolModeClientProxy *)self coordinator];
  char v6 = [v5 scheduleSettings];

  id v7 = [(SCLSchoolModeClientProxy *)self coordinator];
  uint64_t v8 = [v7 isReady];

  BOOL v9 = objc_alloc_init(SCLSchoolModeServerSettings);
  [(SCLSchoolModeServerSettings *)v9 setState:v4];
  [(SCLSchoolModeServerSettings *)v9 setScheduleSettings:v6];
  [(SCLSchoolModeServerSettings *)v9 setLoaded:v8];

  return v9;
}

- (void)sendServerSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLSchoolModeClientProxy *)self remoteClient];
  [v5 applyServerSettings:v4];
}

- (id)remoteClient
{
  v2 = [(SCLSchoolModeClientProxy *)self connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)didUpdateScheduleSettings:(id)a3 notify:(BOOL)a4
{
  id v5 = [(SCLSchoolModeClientProxy *)self serverSettings];
  [(SCLSchoolModeClientProxy *)self sendServerSettings:v5];
}

- (void)didUpdateState:(id)a3 fromState:(id)a4
{
  id v5 = [(SCLSchoolModeClientProxy *)self serverSettings];
  [(SCLSchoolModeClientProxy *)self sendServerSettings:v5];
}

- (void)unlockHistoryDidChange
{
  id v2 = [(SCLSchoolModeClientProxy *)self remoteClient];
  [v2 didChangeUnlockHistory];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSUUID)pairingID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairingID:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (SCLSchoolModeCoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  return (SCLSchoolModeCoordinator *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (SCLSchoolModeClientProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCLSchoolModeClientProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end