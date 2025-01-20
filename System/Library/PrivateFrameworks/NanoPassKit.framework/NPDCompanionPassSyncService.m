@interface NPDCompanionPassSyncService
- (NPDCompanionPassSyncService)initWithCompanionPaymentPassDatabase:(id)a3;
- (NPDCompanionPassSyncServiceDataSource)dataSource;
- (NPDCompanionPassSyncServiceDelegate)delegate;
- (NPDCompanionPaymentPassDatabase)companionPaymentPassDatabase;
- (NPDPassesSyncServiceDataSource)nonPaymentPassSyncServiceSource;
- (id)_passWithUniqueID:(id)a3;
- (id)companionCatalogToSendWithStateChange;
- (id)currentLibraryPassSyncStateWithReconciledState:(id)a3;
- (id)passSyncEngine:(id)a3 dataForPassWithUniqueID:(id)a4;
- (id)passSyncEngine:(id)a3 partialDataForPassWithUniqueID:(id)a4 baseManifest:(id)a5 outRemoteAssets:(id *)a6;
- (id)watchCatalogToSendWithStateChange;
- (unint64_t)_associatedDataToRequestForPass:(id)a3;
- (unint64_t)settingsForPassWithUniqueID:(id)a3;
- (void)_companionPaymentPassCatalogChanged:(id)a3;
- (void)_removePassWithUniqueID:(id)a3 completion:(id)a4;
- (void)_savePassData:(id)a3 forSyncStateItem:(id)a4 baseManifestHashForPartialUpdate:(id)a5 remoteAssetsForPartialUpdate:(id)a6 completion:(id)a7;
- (void)handleIncomingCompanionCatalog:(id)a3 watchCatalog:(id)a4;
- (void)handleIncomingPassSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4;
- (void)handleRequestedAssociatedData:(unint64_t)a3 forPassWithUniqueID:(id)a4;
- (void)initiateSync;
- (void)passSyncEngine:(id)a3 requestsAddPassData:(id)a4 forSyncStateItem:(id)a5 completion:(id)a6;
- (void)passSyncEngine:(id)a3 requestsRemovePassWithUniqueID:(id)a4 completion:(id)a5;
- (void)passSyncEngine:(id)a3 requestsUpdatePassData:(id)a4 forSyncStateItem:(id)a5 baseManifestHashForPartialUpdate:(id)a6 remoteAssetsForPartialUpdate:(id)a7 completion:(id)a8;
- (void)setCompanionPaymentPassDatabase:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNonPaymentPassSyncServiceSource:(id)a3;
- (void)teardownSync;
@end

@implementation NPDCompanionPassSyncService

- (NPDCompanionPassSyncService)initWithCompanionPaymentPassDatabase:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NPDCompanionPassSyncService;
  v6 = [(NPDCompanionPassSyncService *)&v15 initWithPassSyncEngineRole:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_companionPaymentPassDatabase, a3);
    v8 = [NPDSyncServiceLibraryDataSource alloc];
    v9 = +[PKPassLibrary sharedInstance];
    v10 = +[NPDSyncServiceLibraryDataSource nonPaymentPassesFilter];
    v11 = [(NPDSyncServiceLibraryDataSource *)v8 initWithPassLibrary:v9 passesFilter:v10];
    nonPaymentPassSyncServiceSource = v7->_nonPaymentPassSyncServiceSource;
    v7->_nonPaymentPassSyncServiceSource = (NPDPassesSyncServiceDataSource *)v11;

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v7 selector:"_companionPaymentPassDatabaseChanged:" name:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.Changed" object:v5];
    [v13 addObserver:v7 selector:"_companionPaymentPassCatalogChanged:" name:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.CatalogChanged" object:v5];
  }
  return v7;
}

- (void)initiateSync
{
}

- (void)teardownSync
{
  v4.receiver = self;
  v4.super_class = (Class)NPDCompanionPassSyncService;
  [(NPDCompanionPassSyncService *)&v4 teardownSync];
  [(NPDCompanionPassSyncService *)self setDelegate:0];
  [(NPDCompanionPassSyncService *)self setDataSource:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (id)currentLibraryPassSyncStateWithReconciledState:(id)a3
{
  id v4 = a3;
  v6 = NPKPairedOrPairingDevice();
  v7 = [(NPDCompanionPassSyncService *)self nonPaymentPassSyncServiceSource];
  v8 = [v7 passLibrarySyncStateForDevice:v6];

  id v9 = objc_alloc_init((Class)NSMutableSet);
  v10 = [(NPDCompanionPaymentPassDatabase *)self->_companionPaymentPassDatabase uniqueIDs];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10000BDC4;
  v19 = &unk_10006D0F0;
  v20 = self;
  id v21 = v9;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:&v16];

  id v12 = objc_alloc((Class)NPKPassLibrarySyncState);
  id v13 = objc_msgSend(v12, "initWithPasses:device:", v11, v6, v16, v17, v18, v19, v20);

  v14 = [v8 mergeWithPassLibrarySyncState:v13];

  return v14;
}

- (unint64_t)settingsForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPDCompanionPassSyncService *)self dataSource];
  id v6 = [v5 companionPassSyncService:self settingsForPassWithUniqueID:v4];

  return (unint64_t)v6;
}

- (void)handleIncomingPassSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = [(NPDCompanionPassSyncService *)self delegate];
  [v7 companionPassSyncService:self receivedUpdatedSettings:a3 forPassWithUniqueID:v6];
}

- (void)handleIncomingCompanionCatalog:(id)a3 watchCatalog:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = pk_Sync_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_Sync_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218240;
      id v13 = v6;
      __int16 v14 = 2048;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass sync service: received incoming catalogs (companion %p watch %p", (uint8_t *)&v12, 0x16u);
    }
  }
  if (v7)
  {
    id v11 = [(NPDCompanionPassSyncService *)self companionPaymentPassDatabase];
    [v11 setCatalog:v7 fromWatch:1];
  }
}

- (id)companionCatalogToSendWithStateChange
{
  v2 = [(NPDCompanionPassSyncService *)self nonPaymentPassSyncServiceSource];
  v3 = [v2 passesCatalog];

  return v3;
}

- (id)watchCatalogToSendWithStateChange
{
  return 0;
}

- (void)passSyncEngine:(id)a3 requestsAddPassData:(id)a4 forSyncStateItem:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = pk_Sync_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    __int16 v14 = pk_Sync_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v9 npkDescription];
      *(_DWORD *)buf = 138412546;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass sync service: add pass data delegate method invoked\n\tPass data: %@\n\tSync state item: %@", buf, 0x16u);
    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000C2C0;
  v18[3] = &unk_10006D118;
  id v19 = v10;
  id v20 = v11;
  v18[4] = self;
  id v16 = v10;
  id v17 = v11;
  [(NPDCompanionPassSyncService *)self _savePassData:v9 forSyncStateItem:v16 baseManifestHashForPartialUpdate:0 remoteAssetsForPartialUpdate:0 completion:v18];
}

- (void)passSyncEngine:(id)a3 requestsUpdatePassData:(id)a4 forSyncStateItem:(id)a5 baseManifestHashForPartialUpdate:(id)a6 remoteAssetsForPartialUpdate:(id)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = pk_Sync_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    id v20 = pk_Sync_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v13 npkDescription];
      *(_DWORD *)buf = 138413058;
      v26 = v21;
      __int16 v27 = 2112;
      id v28 = v14;
      __int16 v29 = 2112;
      id v30 = v15;
      __int16 v31 = 2112;
      id v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass sync service: update pass data delegate method invoked\n\tPass data: %@\n\tSync state item: %@\n\tBase manifest hash for partial update: %@\n\tRemote assets for partial update: %@", buf, 0x2Au);
    }
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000C5D0;
  v23[3] = &unk_10006D140;
  id v24 = v17;
  id v22 = v17;
  [(NPDCompanionPassSyncService *)self _savePassData:v13 forSyncStateItem:v14 baseManifestHashForPartialUpdate:v15 remoteAssetsForPartialUpdate:v16 completion:v23];
}

- (void)passSyncEngine:(id)a3 requestsRemovePassWithUniqueID:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = pk_Sync_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_Sync_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass sync service: remove pass delegate method invoked\n\tUnique ID: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  [(NPDCompanionPassSyncService *)self _removePassWithUniqueID:v7 completion:v8];
}

- (id)passSyncEngine:(id)a3 partialDataForPassWithUniqueID:(id)a4 baseManifest:(id)a5 outRemoteAssets:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (NPKIsPairedDeviceGraceOrLater())
  {
    id v11 = [(NPDCompanionPassSyncService *)self _passWithUniqueID:v9];
    if (v10)
    {
      int v12 = NPKPartialPassDataWithBaseManifest();
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }
  id v13 = pk_Sync_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_Sync_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v12 npkDescription];
      id v17 = (void *)v16;
      if (a6) {
        id v18 = *a6;
      }
      else {
        id v18 = 0;
      }
      int v20 = 138413058;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass sync service: partial pass data data source method invoked\n\tUnique ID: %@\n\tmanifest: %@\n\tReturning archive data: %@\n\tRemote assets: %@", (uint8_t *)&v20, 0x2Au);
    }
  }

  return v12;
}

- (id)passSyncEngine:(id)a3 dataForPassWithUniqueID:(id)a4
{
  id v5 = a4;
  id v6 = [(NPDCompanionPassSyncService *)self _passWithUniqueID:v5];
  id v7 = [v6 archiveData];
  id v8 = pk_Sync_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Sync_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 npkDescription];
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass sync service: full pass data data source method invoked\n\tUnique ID: %@\n\tReturning archive data: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v7;
}

- (void)handleRequestedAssociatedData:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a4;
  if ((a3 & 8) != 0)
  {
    [(NPDCompanionPassSyncService *)self handleSettingsChanged:[(NPDCompanionPassSyncService *)self settingsForPassWithUniqueID:v6] forPassWithUniqueID:v6];
    a3 &= ~8uLL;
  }
  if (a3)
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      BOOL v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = NSStringFromNPKAssociatedPassData();
        int v11 = 138412546;
        int v12 = v10;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Warning: we can't handle requested data:%@ for passWithUniqueID:%@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (unint64_t)_associatedDataToRequestForPass:(id)a3
{
  id v3 = a3;
  id v4 = [v3 secureElementPass];
  if ([v4 isStoredValuePass])
  {
    if ([v4 isTransitPass]) {
      uint64_t v5 = 7;
    }
    else {
      uint64_t v5 = 5;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | [v4 isAccessPass];
  if (!v4 && NPKIsValidVASPass()) {
    v6 |= 8uLL;
  }

  return v6;
}

- (id)_passWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPDCompanionPaymentPassDatabase *)self->_companionPaymentPassDatabase paymentPassWithUniqueID:v4];
  if (!v5)
  {
    unint64_t v6 = [(NPDCompanionPassSyncService *)self nonPaymentPassSyncServiceSource];
    uint64_t v5 = [v6 passWithUniqueID:v4];
  }
  return v5;
}

- (void)_companionPaymentPassCatalogChanged:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"CatalogFromWatch"];
  unsigned __int8 v6 = [v5 BOOLValue];

  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    BOOL v8 = [v10 userInfo];
    BOOL v9 = [v8 objectForKeyedSubscript:@"Catalog"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NPDCompanionPassSyncService *)self handleCatalogChangeWithCompanionCatalog:0 watchCatalog:v9];
    }

    id v7 = v10;
  }
}

- (void)_savePassData:(id)a3 forSyncStateItem:(id)a4 baseManifestHashForPartialUpdate:(id)a5 remoteAssetsForPartialUpdate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v44 = a6;
  id v15 = a7;
  uint64_t v16 = +[NPKOSTransaction transactionWithName:@"Save pass data for sync"];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10000D31C;
  v55[3] = &unk_10006D118;
  id v17 = v15;
  id v57 = v17;
  v55[4] = self;
  id v18 = v16;
  id v56 = v18;
  BOOL v19 = objc_retainBlock(v55);
  v42 = v12;
  v43 = v13;
  if (v14)
  {
    int v20 = [v13 uniqueID];
    id v21 = [(NPDCompanionPassSyncService *)self _passWithUniqueID:v20];

    __int16 v22 = NPKManifestHashForPass();
    if (![v22 isEqual:v14])
    {
      id v24 = 0;
LABEL_12:
      __int16 v29 = pk_Sync_log();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

      if (v30)
      {
        __int16 v31 = pk_Sync_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v43 uniqueID];
          *(_DWORD *)buf = 138413314;
          id v60 = v32;
          __int16 v61 = 2112;
          id v62 = v14;
          __int16 v63 = 2112;
          v64 = v22;
          __int16 v65 = 2112;
          id v66 = v44;
          __int16 v67 = 2112;
          id v68 = v24;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Warning: Unable to construct pass from partial update\n\tunique ID: %@\n\tincoming base manifest hash: %@\n\tour base manifest hash: %@\n\tremote assets: %@\n\terror: %@", buf, 0x34u);
        }
      }
      id v23 = 0;
      BOOL v27 = 1;
      goto LABEL_24;
    }
    v54[1] = 0;
    NPKUpdatedPassWithPartialPassData();
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = 0;
    if (!v23) {
      goto LABEL_12;
    }
LABEL_23:
    BOOL v27 = 0;
LABEL_24:

    goto LABEL_28;
  }
  v54[0] = 0;
  id v21 = [objc_alloc((Class)PKSerializedDataAccessor) initWithData:v12 error:v54];
  id v25 = v54[0];
  id v24 = v25;
  if (!v21 || v25)
  {
    if (v25)
    {
      v33 = pk_Sync_log();
      BOOL v27 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

      if (v27)
      {
        __int16 v22 = pk_Sync_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v60 = v21;
          __int16 v61 = 2112;
          id v62 = v24;
          id v28 = "Error: Error creating data accessor (%@). Error: %@";
          goto LABEL_21;
        }
LABEL_22:
        id v23 = 0;
        goto LABEL_23;
      }
      goto LABEL_25;
    }
    id v23 = 0;
  }
  else
  {
    id v53 = 0;
    id v23 = +[PKPass createWithFileDataAccessor:v21 validationOptions:2 warnings:0 error:&v53];
    id v24 = v53;
    if (!v23)
    {
      __int16 v26 = pk_Sync_log();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (v27)
      {
        __int16 v22 = pk_Sync_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v60 = v42;
          __int16 v61 = 2112;
          id v62 = v24;
          id v28 = "Error: Unable to create a pass from this pass data! %@. Error: %@";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
LABEL_25:
      id v23 = 0;
      goto LABEL_28;
    }
  }
  BOOL v27 = 0;
LABEL_28:

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    companionPaymentPassDatabase = self->_companionPaymentPassDatabase;
    v35 = [v23 paymentPass];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10000D470;
    v49[3] = &unk_10006D190;
    id v50 = v23;
    v51 = v19;
    BOOL v52 = v27;
    [(NPDCompanionPaymentPassDatabase *)companionPaymentPassDatabase savePaymentPass:v35 requireExisting:0 requireNewer:0 completion:v49];

    v36 = v43;
  }
  else
  {
    v36 = v43;
    if (v23)
    {
      v37 = [(NPDCompanionPassSyncService *)self nonPaymentPassSyncServiceSource];
      id v58 = v23;
      v38 = +[NSArray arrayWithObjects:&v58 count:1];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10000D58C;
      v45[3] = &unk_10006D1B8;
      id v46 = v23;
      v47 = v19;
      BOOL v48 = v27;
      [v37 addPasses:v38 withCompletionHandler:v45];
    }
    else
    {
      v39 = pk_Sync_log();
      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

      if (v40)
      {
        v41 = pk_Sync_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v60 = v24;
          __int16 v61 = 2112;
          id v62 = v43;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Warning: Companion pass sync service: Unable to initialize PKPass with provided data\n\tError: %@\n\tSync state item: %@", buf, 0x16u);
        }
      }
      ((void (*)(void *, void, BOOL, void))v19[2])(v19, 0, v27, 0);
    }
  }
}

- (void)_removePassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(NPDCompanionPassSyncService *)self nonPaymentPassSyncServiceSource];
  BOOL v9 = [v8 passWithUniqueID:v6];
  id v10 = v9;
  if (v9 && [v9 passType] != (id)1)
  {
    id v17 = pk_Sync_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      BOOL v19 = pk_Sync_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Warning: Companion pass sync service: Removing non-payment pass from companion library\n\tUnique ID: %@", buf, 0xCu);
      }
    }
    [v8 removePassWithUniqueID:v6 diagnosticReason:@"Delete request received from watch"];
  }
  else
  {
    int v11 = [(NPDCompanionPaymentPassDatabase *)self->_companionPaymentPassDatabase uniqueIDs];
    unsigned int v12 = [v11 containsObject:v6];

    if (v12)
    {
      companionPaymentPassDatabase = self->_companionPaymentPassDatabase;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000D918;
      v20[3] = &unk_10006D1E0;
      id v21 = v6;
      __int16 v22 = self;
      id v23 = v7;
      [(NPDCompanionPaymentPassDatabase *)companionPaymentPassDatabase removePaymentPassWithUniqueID:v21 completion:v20];

      goto LABEL_16;
    }
    id v14 = pk_Sync_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      uint64_t v16 = pk_Sync_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass sync service: Pass does not exist in either database; reporting success\n"
          "\tunique ID: %@",
          buf,
          0xCu);
      }
    }
  }
  if (v7) {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
LABEL_16:
}

- (NPDCompanionPassSyncServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPDCompanionPassSyncServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPDCompanionPassSyncServiceDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NPDCompanionPassSyncServiceDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NPDCompanionPaymentPassDatabase)companionPaymentPassDatabase
{
  return self->_companionPaymentPassDatabase;
}

- (void)setCompanionPaymentPassDatabase:(id)a3
{
}

- (NPDPassesSyncServiceDataSource)nonPaymentPassSyncServiceSource
{
  return self->_nonPaymentPassSyncServiceSource;
}

- (void)setNonPaymentPassSyncServiceSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonPaymentPassSyncServiceSource, 0);
  objc_storeStrong((id *)&self->_companionPaymentPassDatabase, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end