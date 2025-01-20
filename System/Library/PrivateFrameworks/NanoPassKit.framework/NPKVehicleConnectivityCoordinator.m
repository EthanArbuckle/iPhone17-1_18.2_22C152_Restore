@interface NPKVehicleConnectivityCoordinator
+ (id)_secureElementPassMatchingAID:(id)a3 subcredentialIdentifier:(id)a4;
+ (id)_subcredentialIdentifierForPass:(id)a3;
- (BOOL)isVehicleConnectedForPass:(id)a3;
- (NPKVehicleConnectivityCoordinator)init;
- (NPKVehicleConnectivityCoordinator)initWithDistributedNotificationCenter:(id)a3;
- (NPKVehicleConnectivityCoordinatorDelegate)delegate;
- (void)_handleCarKeyVehicleConnectedNotification:(id)a3;
- (void)_handleCarKeyVehicleDisconnectedNotification:(id)a3;
- (void)_parseVehicleConnectivityChangeNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outSubcredentialIdentifier:(id *)a5;
- (void)_registerObservers;
- (void)setDelegate:(id)a3;
@end

@implementation NPKVehicleConnectivityCoordinator

- (NPKVehicleConnectivityCoordinator)init
{
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  v4 = [(NPKVehicleConnectivityCoordinator *)self initWithDistributedNotificationCenter:v3];

  return v4;
}

- (NPKVehicleConnectivityCoordinator)initWithDistributedNotificationCenter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKVehicleConnectivityCoordinator;
  v6 = [(NPKVehicleConnectivityCoordinator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_distributedNotificationCenter, a3);
    [(NPKVehicleConnectivityCoordinator *)v7 _registerObservers];
  }

  return v7;
}

- (BOOL)isVehicleConnectedForPass:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (![v3 isCarKeyPass] || (objc_msgSend(v3, "npkSupportsBluetooth") & 1) == 0)
  {
    v4 = pk_General_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      v6 = pk_General_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v20 = "-[NPKVehicleConnectivityCoordinator isVehicleConnectedForPass:]";
        __int16 v21 = 2082;
        v22 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKVehicleConnectivityCoordinator.m";
        __int16 v23 = 2048;
        uint64_t v24 = 43;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to check vehicle connected state for any pass other than UWB capable car keys!)", buf, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  id v18 = 0;
  v7 = [(id)PKGetClassNFDigitalCarKeySession() getVehicleReports:&v18];
  v8 = (char *)v18;
  if (!v8)
  {
    v11 = [(id)objc_opt_class() _subcredentialIdentifierForPass:v3];
    v12 = [v7 objectForKeyedSubscript:v11];
    LOBYTE(v10) = v12 != 0;
    v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      v15 = pk_General_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v3 uniqueID];
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        __int16 v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Vehicle report for pass %@ is %@", buf, 0x16u);
      }
    }

    goto LABEL_18;
  }
  objc_super v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

  if (v10)
  {
    v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: NPKVehicleConnectivityCoordinator: Unable to fetch vehicle report! %@", buf, 0xCu);
    }
    LOBYTE(v10) = 0;
LABEL_18:
  }
  return v10;
}

- (void)_registerObservers
{
  [(NSDistributedNotificationCenter *)self->_distributedNotificationCenter addObserver:self selector:sel__handleCarKeyVehicleConnectedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.connect" object:0];
  distributedNotificationCenter = self->_distributedNotificationCenter;
  [(NSDistributedNotificationCenter *)distributedNotificationCenter addObserver:self selector:sel__handleCarKeyVehicleDisconnectedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.disconnect" object:0];
}

- (void)_handleCarKeyVehicleConnectedNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 object];
  id v15 = 0;
  id v16 = 0;
  [(NPKVehicleConnectivityCoordinator *)self _parseVehicleConnectivityChangeNotificationObject:v5 outApplicationIdentifier:&v16 outSubcredentialIdentifier:&v15];
  id v6 = v16;
  id v7 = v15;

  v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = v4;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Received car key vehicle connected notification: %@ for AID: %@ subcredential ID: %@", buf, 0x20u);
    }
  }
  v11 = [(id)objc_opt_class() _secureElementPassMatchingAID:v6 subcredentialIdentifier:v7];
  if (v11)
  {
    v12 = [(NPKVehicleConnectivityCoordinator *)self delegate];
    [v12 vehicleConnectivityCoordinator:self didBecomeConnectedToVehicleCorrespondingToPass:v11];
  }
  else
  {
    v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (!v14) {
      goto LABEL_8;
    }
    v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Unable to identify pass for subcredential: %@", buf, 0xCu);
    }
  }

LABEL_8:
}

- (void)_handleCarKeyVehicleDisconnectedNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 object];
  id v15 = 0;
  id v16 = 0;
  [(NPKVehicleConnectivityCoordinator *)self _parseVehicleConnectivityChangeNotificationObject:v5 outApplicationIdentifier:&v16 outSubcredentialIdentifier:&v15];
  id v6 = v16;
  id v7 = v15;

  v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = v4;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Received car key vehicle disconnected notification: %@ for AID: %@ subcredential ID: %@", buf, 0x20u);
    }
  }
  v11 = [(id)objc_opt_class() _secureElementPassMatchingAID:v6 subcredentialIdentifier:v7];
  if (v11)
  {
    v12 = [(NPKVehicleConnectivityCoordinator *)self delegate];
    [v12 vehicleConnectivityCoordinator:self didBecomeDisconnectedFromVehicleCorrespondingToPass:v11];
  }
  else
  {
    v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (!v14) {
      goto LABEL_8;
    }
    v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Unable to identify pass for subcredential: %@", buf, 0xCu);
    }
  }

LABEL_8:
}

- (void)_parseVehicleConnectivityChangeNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outSubcredentialIdentifier:(id *)a5
{
  id v7 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = [v7 componentsSeparatedByString:@":"];
    *a4 = [v8 firstObject];
    if ([v8 count] == 2)
    {
      id v9 = [v8 lastObject];
      *a5 = v9;
    }
    else
    {
      *a5 = 0;
    }
  }
  else
  {
    BOOL v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Expected to be provided a notification object, but instead found nil!", v13, 2u);
      }
    }
  }
}

+ (id)_secureElementPassMatchingAID:(id)a3 subcredentialIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263F5BF80] sharedInstance];
  id v7 = [v6 passesOfType:1];

  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __91__NPKVehicleConnectivityCoordinator__secureElementPassMatchingAID_subcredentialIdentifier___block_invoke;
  id v16 = &unk_2644D2828;
  id v17 = v5;
  id v18 = a1;
  id v8 = v5;
  id v9 = objc_msgSend(v7, "pk_objectsPassingTest:", &v13);

  BOOL v10 = objc_msgSend(v9, "firstObject", v13, v14, v15, v16);
  BOOL v11 = [v10 secureElementPass];

  return v11;
}

uint64_t __91__NPKVehicleConnectivityCoordinator__secureElementPassMatchingAID_subcredentialIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 40);
  id v7 = [a2 secureElementPass];
  id v8 = [v6 _subcredentialIdentifierForPass:v7];

  uint64_t v9 = [v8 isEqualToString:*(void *)(a1 + 32)];
  *a4 = v9;

  return v9;
}

+ (id)_subcredentialIdentifierForPass:(id)a3
{
  id v3 = [a3 secureElementPass];
  id v4 = [v3 devicePrimaryContactlessPaymentApplication];

  id v5 = [v4 subcredentials];
  id v6 = [v5 anyObject];

  id v7 = [v6 identifier];

  return v7;
}

- (NPKVehicleConnectivityCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKVehicleConnectivityCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
}

@end