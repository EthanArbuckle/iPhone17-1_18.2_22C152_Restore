@interface NPDCompanionPassLibrary
- (NPDCompanionPassLibrary)initWithConnection:(id)a3 companionPaymentPassDatabase:(id)a4 dataSource:(id)a5;
- (NPDCompanionPassLibraryDataSource)dataSource;
- (NPDCompanionPaymentPassDatabase)companionPaymentPassDatabase;
- (id)_deviceName;
- (id)_filteredAndConfiguredPassForPaymentPass:(id)a3 deviceName:(id)a4;
- (void)_handleCompanionPassDatabaseNotification:(id)a3;
- (void)addPassesWithData:(id)a3 handler:(id)a4;
- (void)backupMetadataWithHandler:(id)a3;
- (void)canAddFelicaPassWithHandler:(id)a3;
- (void)canAddPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)canAddSecureElementPassWithConfiguration:(id)a3 completion:(id)a4;
- (void)checkForTransitNotification;
- (void)countPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)dealloc;
- (void)defaultPaymentPassWithHandler:(id)a3;
- (void)expressTransitPassWithHandler:(id)a3;
- (void)generateIssuerBindingDataForIssuerData:(id)a3 completion:(id)a4;
- (void)getArchivedObjectWithUniqueID:(id)a3 handler:(id)a4;
- (void)getContentForUniqueID:(id)a3 handler:(id)a4;
- (void)getDataForBundleResourceNamed:(id)a3 withExtension:(id)a4 objectUniqueIdentifier:(id)a5 handler:(id)a6;
- (void)getGroupsControllerSnapshotWithOptions:(id)a3 handler:(id)a4;
- (void)getImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 handler:(id)a7;
- (void)getManifestHashAndSettingsForPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5;
- (void)getPassWithPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5;
- (void)getPassWithUniqueID:(id)a3 handler:(id)a4;
- (void)getPassesAndCatalogOfPassTypes:(unint64_t)a3 limitResults:(BOOL)a4 withHandler:(id)a5;
- (void)getPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)getPassesWithHandler:(id)a3;
- (void)getPassesWithSearchableTransactions:(id)a3;
- (void)hasPassesInExpiredSectionWithHandler:(id)a3;
- (void)hasPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)hasRemoteLibraryWithHandler:(id)a3;
- (void)invalidateVehicleConnectionSessionIdentifier:(id)a3;
- (void)isIssuerAppProvisioningSupportedWithHandler:(id)a3;
- (void)isPaymentPassActivationAvailableWithHandler:(id)a3;
- (void)isWatchIssuerAppProvisioningSupportedWithHandler:(id)a3;
- (void)migrateDataWithHandler:(id)a3 didRestoreFromBackup:(BOOL)a4;
- (void)passWithDPANIdentifier:(id)a3 handler:(id)a4;
- (void)passWithFPANIdentifier:(id)a3 handler:(id)a4;
- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4;
- (void)peerPaymentPassUniqueIDWithHandler:(id)a3;
- (void)postUpgradedPassNotificationForMarket:(id)a3 passUniqueID:(id)a4;
- (void)prepareForBackupRestoreWithExistingPreferencesData:(id)a3 handler:(id)a4;
- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5;
- (void)recoverPassWithUniqueID:(id)a3 handler:(id)a4;
- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4 handler:(id)a5;
- (void)removePassesWithUniqueIDs:(id)a3 diagnosticReason:(id)a4 handler:(id)a5;
- (void)replacePassWithPassData:(id)a3 handler:(id)a4;
- (void)requestIssuerBindingDataForIssuerData:(id)a3 completion:(id)a4;
- (void)sendRKEPassThroughMessage:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5;
- (void)sendUserEditedCatalog:(id)a3;
- (void)serviceResumed;
- (void)serviceSuspended;
- (void)setBackupMetadata:(id)a3 handler:(id)a4;
- (void)setCompanionPaymentPassDatabase:(id)a3;
- (void)setDataSource:(id)a3;
- (void)signData:(id)a3 forPassUniqueID:(id)a4 completion:(id)a5;
- (void)sortedTransitPassesForAppletDataFormat:(id)a3 handler:(id)a4;
- (void)sortedTransitPassesForTransitNetworkIdentifiers:(id)a3;
- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPassWithUniqueID:(id)a5 handler:(id)a6;
- (void)supportedTransitPartnersForDigitalIssuance:(id)a3;
- (void)supportsSearchForPassUniqueID:(id)a3 completion:(id)a4;
- (void)unexpiredPassesOrderedByGroup:(id)a3;
- (void)usingSynchronousProxy:(BOOL)a3 canAddCarKeyPassWithConfiguration:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 dynamicStateForPassUniqueID:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getEncryptedServiceProviderDataForUniqueID:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getPassForProvisioningCredentialHash:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getServiceProviderDataForUniqueID:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 meetsProvisioningRequirements:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 passLocalizedStringForKey:(id)a4 uniqueID:(id)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 postUpgradesAvailableNotificationForMarket:(id)a4 passUniqueID:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 setLiveRenderingEnabled:(BOOL)a4 forPassUniqueID:(id)a5 handler:(id)a6;
@end

@implementation NPDCompanionPassLibrary

- (NPDCompanionPassLibrary)initWithConnection:(id)a3 companionPaymentPassDatabase:(id)a4 dataSource:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NPDCompanionPassLibrary;
  v10 = [(NPDPassLibrary *)&v17 initWithConnection:a3];
  v11 = v10;
  if (v10)
  {
    [(NPDCompanionPassLibrary *)v10 setCompanionPaymentPassDatabase:v8];
    [(NPDCompanionPassLibrary *)v11 setDataSource:v9];
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v11 selector:"_handleCompanionPassDatabaseNotification:" name:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.PassAdded" object:v8];
    [v12 addObserver:v11 selector:"_handleCompanionPassDatabaseNotification:" name:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.PassUpdated" object:v8];
    [v12 addObserver:v11 selector:"_handleCompanionPassDatabaseNotification:" name:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.PassRemoved" object:v8];
    [v12 addObserver:v11 selector:"_handleCompanionPassDatabaseNotification:" name:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.CatalogChanged" object:v8];
    v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      v15 = pk_General_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notice: NPDCompanionPassLibrary initialized: %@", buf, 0xCu);
      }
    }
  }

  return v11;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPDCompanionPassLibrary deallocated: %@", buf, 0xCu);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)NPDCompanionPassLibrary;
  [(NPDCompanionPassLibrary *)&v7 dealloc];
}

- (void)serviceResumed
{
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library service resumed", v5, 2u);
    }
  }
}

- (void)serviceSuspended
{
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library service suspended", v5, 2u);
    }
  }
}

- (void)replacePassWithPassData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Replace pass", buf, 2u);
    }
  }
  id v18 = 0;
  id v11 = +[PKPass createWithData:v6 warnings:0 error:&v18];
  id v12 = v18;
  if (v11)
  {
    v13 = [v11 passTypeIdentifier];
    BOOL v14 = [v11 serialNumber];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003E788;
    v15[3] = &unk_10006E8A0;
    v15[4] = self;
    id v16 = v11;
    id v17 = v7;
    [(NPDCompanionPassLibrary *)self getPassWithPassTypeID:v13 serialNumber:v14 handler:v15];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)addPassesWithData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v37 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library: Add %d passes", buf, 8u);
    }
  }
  id v11 = [(NPDPassLibrary *)self filter];
  id v12 = [v11 whitelist];
  unsigned int v13 = [v12 passesAllAccess];

  if (v13)
  {
    v26 = self;
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v27 = v6;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v30 = 0;
          id v21 = +[PKPass createWithData:v20 warnings:0 error:&v30];
          if (v21)
          {
            [v14 addObject:v21];
          }
          else
          {
            v22 = pk_General_log();
            BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

            if (v23)
            {
              v24 = pk_General_log();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error: Cannot add pass: pass cannot be instantiated from data.", buf, 2u);
              }
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v17);
    }

    v25 = [(NPDPassLibrary *)v26 delegate];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10003EBC8;
    v28[3] = &unk_10006CDC8;
    id v29 = v7;
    [v25 passLibrary:v26 requestsAdditionOfPasses:v14 completion:v28];

    id v6 = v27;
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(void))a5;
  BOOL v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library: Remove pass with uniqueID %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v12 = [(NPDPassLibrary *)self filter];
  unsigned int v13 = [v12 whitelist];
  unsigned int v14 = [v13 passesAllAccess];

  if (v14)
  {
    id v15 = [(NPDPassLibrary *)self delegate];
    [v15 passLibrary:self requestsDeletionOfPassWithUniqueID:v7 completion:v8];
  }
  else
  {
    v8[2](v8);
  }
}

- (void)removePassesWithUniqueIDs:(id)a3 diagnosticReason:(id)a4 handler:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)getPassesWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library: get passes", buf, 2u);
    }
  }
  id v8 = [(NPDCompanionPassLibrary *)self companionPaymentPassDatabase];
  BOOL v9 = [v8 uniqueIDs];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003EF14;
  v11[3] = &unk_10006E4F0;
  v11[4] = self;
  BOOL v10 = [v9 npkComprehension:v11];

  v4[2](v4, v10);
}

- (void)getPassesOfType:(unint64_t)a3 handler:(id)a4
{
  BOOL v6 = (void (**)(id, void))a4;
  id v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library: get passes of type %llu", (uint8_t *)&v10, 0xCu);
    }
  }
  if (a3 == 1) {
    [(NPDCompanionPassLibrary *)self getPassesWithHandler:v6];
  }
  else {
    v6[2](v6, 0);
  }
}

- (void)getPassesAndCatalogOfPassTypes:(unint64_t)a3 limitResults:(BOOL)a4 withHandler:(id)a5
{
  id v7 = a5;
  BOOL v8 = [(NPDCompanionPassLibrary *)self companionPaymentPassDatabase];
  BOOL v9 = [v8 catalog];

  if (!a3 || (a3 & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003F1DC;
    v11[3] = &unk_10006E8C8;
    id v13 = v7;
    id v12 = v9;
    [(NPDCompanionPassLibrary *)self getPassesWithHandler:v11];
  }
  else
  {
    int v10 = +[NSSet set];
    (*((void (**)(id, void *, void *))v7 + 2))(v7, v10, v9);
  }
}

- (void)sendUserEditedCatalog:(id)a3
{
  id v4 = a3;
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library received user edited catalog: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  BOOL v8 = [(NPDPassLibrary *)self filter];
  BOOL v9 = [v8 whitelist];
  unsigned int v10 = [v9 passesAllAccess];

  if (v10)
  {
    unint64_t v11 = [(NPDCompanionPassLibrary *)self companionPaymentPassDatabase];
    [v11 setCatalog:v4 fromWatch:0];
  }
}

- (void)peerPaymentPassUniqueIDWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)canAddFelicaPassWithHandler:(id)a3
{
  if (a3)
  {
    BOOL v3 = (void (**)(id, id))a3;
    NPKPairedOrPairingDevice();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6C4614A2-1ECC-4405-9FEE-B5F0A5666961"];
    v3[2](v3, [v5 supportsCapability:v4]);
  }
}

- (void)getManifestHashAndSettingsForPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = pk_General_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_General_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library get manifest hash and settings: %@ %@", buf, 0x16u);
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003F54C;
  v15[3] = &unk_10006E8F0;
  id v16 = v10;
  id v14 = v10;
  [(NPDCompanionPassLibrary *)self getPassWithPassTypeID:v8 serialNumber:v9 handler:v15];
}

- (void)getPassWithPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = pk_General_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_General_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library get pass: %@ %@", buf, 0x16u);
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003F77C;
  v17[3] = &unk_10006E918;
  id v18 = v8;
  id v19 = v9;
  id v20 = self;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [(NPDCompanionPassLibrary *)self getPassesWithHandler:v17];
}

- (void)getPassWithUniqueID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library get pass with unique ID %@", (uint8_t *)&v15, 0xCu);
    }
  }
  unint64_t v11 = [(NPDCompanionPassLibrary *)self _deviceName];
  BOOL v12 = [(NPDCompanionPassLibrary *)self companionPaymentPassDatabase];
  id v13 = [v12 paymentPassWithUniqueID:v6];

  id v14 = [(NPDCompanionPassLibrary *)self _filteredAndConfiguredPassForPaymentPass:v13 deviceName:v11];
  v7[2](v7, v14);
}

- (void)getContentForUniqueID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library get content for unique ID %@", buf, 0xCu);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003FBCC;
  v12[3] = &unk_10006E8F0;
  id v13 = v7;
  id v11 = v7;
  [(NPDCompanionPassLibrary *)self getPassWithUniqueID:v6 handler:v12];
}

- (void)getImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = pk_General_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    id v18 = pk_General_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v28 = v12;
      __int16 v29 = 2048;
      int64_t v30 = a4;
      __int16 v31 = 2112;
      id v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library get image set for unique ID %@ %llu %@", buf, 0x20u);
    }
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003FEA8;
  v22[3] = &unk_10006E968;
  id v23 = v14;
  id v24 = v13;
  id v25 = v15;
  int64_t v26 = a4;
  id v19 = v15;
  id v20 = v13;
  id v21 = v14;
  [(NPDCompanionPassLibrary *)self getPassWithUniqueID:v12 handler:v22];
}

- (void)getDataForBundleResourceNamed:(id)a3 withExtension:(id)a4 objectUniqueIdentifier:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = pk_General_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      id v16 = pk_General_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v22 = v10;
        __int16 v23 = 2112;
        id v24 = v11;
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library get getDataForBundleResourceNamed %@.%@ for unique ID %@", buf, 0x20u);
      }
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004017C;
    v17[3] = &unk_10006E8A0;
    id v18 = v10;
    id v19 = v11;
    id v20 = v13;
    [(NPDCompanionPassLibrary *)self getPassWithUniqueID:v12 handler:v17];
  }
}

- (void)getArchivedObjectWithUniqueID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library get getArchivedObjectWithUniqueID for unique ID %@", buf, 0xCu);
      }
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100040378;
    v11[3] = &unk_10006E8F0;
    id v12 = v7;
    [(NPDCompanionPassLibrary *)self getPassWithUniqueID:v6 handler:v11];
  }
}

- (void)isPaymentPassActivationAvailableWithHandler:(id)a3
{
  BOOL v3 = (void (**)(id, uint64_t))a3;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Is payment pass activation available? Always.", v7, 2u);
    }
  }
  v3[2](v3, 1);
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPassWithUniqueID:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = pk_General_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    id v16 = pk_General_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library submit verification code %@ %@ %@", buf, 0x20u);
    }
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100040670;
  v20[3] = &unk_10006E9B8;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v17 = v11;
  id v18 = v10;
  id v19 = v13;
  [(NPDCompanionPassLibrary *)self getPassWithUniqueID:v12 handler:v20];
}

- (void)hasPassesOfType:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: %llu", buf, 0xCu);
    }
  }
  if (a3 == 1)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000409A0;
    v10[3] = &unk_10006E9E0;
    id v11 = v6;
    [(NPDCompanionPassLibrary *)self getPassesOfType:1 handler:v10];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)canAddPassesOfType:(unint64_t)a3 handler:(id)a4
{
  BOOL v5 = (void (**)(id, void))a4;
  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: Can add passes of type %llu", (uint8_t *)&v9, 0xCu);
    }
  }
  v5[2](v5, 0);
}

- (void)countPassesOfType:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  BOOL v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    int v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Count passes of type %llu", buf, 0xCu);
    }
  }
  if (a3 == 1)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100040C40;
    v10[3] = &unk_10006E9E0;
    id v11 = v6;
    [(NPDCompanionPassLibrary *)self getPassesOfType:1 handler:v10];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)defaultPaymentPassWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NPSDomainAccessor);
  id v6 = [v5 initWithDomain:NPKDefaultsDomain];
  BOOL v7 = [v6 objectForKey:NPKDefaultPaymentPassDefault];
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100040D84;
    v8[3] = &unk_10006E8F0;
    id v9 = v4;
    [(NPDCompanionPassLibrary *)self getPassWithUniqueID:v7 handler:v8];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)expressTransitPassWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NPSDomainAccessor);
  id v6 = [v5 initWithDomain:NPKDefaultsDomain];
  BOOL v7 = [v6 objectForKey:NPKExpressFelicaTransitPaymentPassUniqueIDDefault];
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100040EE0;
    v8[3] = &unk_10006E8F0;
    id v9 = v4;
    [(NPDCompanionPassLibrary *)self getPassWithUniqueID:v7 handler:v8];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)passWithDPANIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1000410DC;
  id v21 = sub_1000410EC;
  id v22 = 0;
  BOOL v8 = [(NPDPassLibrary *)self filter];
  id v9 = [v8 whitelist];
  unsigned int v10 = [v9 passesAllAccess];

  if (v10)
  {
    id v11 = +[NPKGizmoDatabase sharedDatabase];
    id v12 = [v11 passDescriptions];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000410F4;
    v13[3] = &unk_10006EA30;
    BOOL v15 = self;
    id v16 = &v17;
    id v14 = v6;
    [v12 enumerateObjectsUsingBlock:v13];
  }
  if (v7) {
    v7[2](v7, v18[5]);
  }
  _Block_object_dispose(&v17, 8);
}

- (void)passWithFPANIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = sub_1000410DC;
    uint64_t v19 = sub_1000410EC;
    id v20 = 0;
    BOOL v8 = +[NPKGizmoDatabase sharedDatabase];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004143C;
    v12[3] = &unk_10006EA58;
    id v13 = v6;
    id v14 = &v15;
    [v8 enumerateAllPassesWithBlock:v12 includeImageSets:0];

    uint64_t v9 = v16[5];
    if (v9)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000414F4;
      v10[3] = &unk_10006E8F0;
      id v11 = v7;
      [(NPDCompanionPassLibrary *)self getPassWithUniqueID:v9 handler:v10];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }

    _Block_object_dispose(&v15, 8);
  }
}

- (void)migrateDataWithHandler:(id)a3 didRestoreFromBackup:(BOOL)a4
{
}

- (void)sortedTransitPassesForAppletDataFormat:(id)a3 handler:(id)a4
{
}

- (void)supportedTransitPartnersForDigitalIssuance:(id)a3
{
  id v4 = a3;
  id v5 = +[NSArray array];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)checkForTransitNotification
{
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[NPDCompanionPassLibrary checkForTransitNotification]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)postUpgradedPassNotificationForMarket:(id)a3 passUniqueID:(id)a4
{
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      BOOL v8 = "-[NPDCompanionPassLibrary postUpgradedPassNotificationForMarket:passUniqueID:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 postUpgradesAvailableNotificationForMarket:(id)a4 passUniqueID:(id)a5
{
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[NPDCompanionPassLibrary usingSynchronousProxy:postUpgradesAvailableNotificationForMarket:passUniqueID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)sortedTransitPassesForTransitNetworkIdentifiers:(id)a3
{
  BOOL v3 = (void (**)(id, void *))a3;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "-[NPDCompanionPassLibrary sortedTransitPassesForTransitNetworkIdentifiers:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v7, 0xCu);
    }
  }
  v3[2](v3, &__NSDictionary0__struct);
}

- (void)usingSynchronousProxy:(BOOL)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5
{
}

- (void)canAddSecureElementPassWithConfiguration:(id)a3 completion:(id)a4
{
  BOOL v6 = (void (**)(id, uint64_t, void *))a4;
  id v7 = a3;
  int v8 = [(NPDPassLibrary *)self filter];
  uint64_t v9 = [v8 whitelist];

  id v10 = [v7 configurationType];
  switch((unint64_t)v10)
  {
    case 1uLL:
      if (([v9 paymentAllAccess] & 1) != 0
        || [v9 secureElementPassProvisioning])
      {
        uint64_t v13 = NPKPairedOrPairingDeviceSupportsSubcredentialProvisioning();
        goto LABEL_14;
      }
      id v14 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      int v15 = 136315138;
      id v16 = "-[NPDCompanionPassLibrary canAddSecureElementPassWithConfiguration:completion:]";
      goto LABEL_22;
    case 2uLL:
    case 4uLL:
      if (([v9 paymentAllAccess] & 1) != 0
        || ([v9 shareableCredentialProvisioning] & 1) != 0)
      {
        goto LABEL_4;
      }
      id v14 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      int v15 = 136315138;
      id v16 = "-[NPDCompanionPassLibrary canAddSecureElementPassWithConfiguration:completion:]";
      goto LABEL_22;
    case 3uLL:
      if (([v9 passesAddUnsigned] & 1) != 0
        || [v9 passesAllAccess])
      {
        uint64_t v13 = NPKPairedOrPairingDeviceSupportsHomeKeyProvisioning();
LABEL_14:
        uint64_t v12 = v13;
        id v11 = 0;
        if (!v6) {
          goto LABEL_6;
        }
LABEL_5:
        v6[2](v6, v12, v11);
        goto LABEL_6;
      }
      id v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        id v16 = "-[NPDCompanionPassLibrary canAddSecureElementPassWithConfiguration:completion:]";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v15, 0xCu);
      }
LABEL_23:

      id v11 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
LABEL_24:
      uint64_t v12 = 0;
      if (v6) {
        goto LABEL_5;
      }
LABEL_6:

      return;
    case 5uLL:
LABEL_4:
      id v11 = 0;
      uint64_t v12 = 1;
      if (v6) {
        goto LABEL_5;
      }
      goto LABEL_6;
    default:
      id v11 = 0;
      goto LABEL_24;
  }
}

- (void)backupMetadataWithHandler:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "-[NPDCompanionPassLibrary backupMetadataWithHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)setBackupMetadata:(id)a3 handler:(id)a4
{
  id v4 = (void (**)(void))a4;
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[NPDCompanionPassLibrary setBackupMetadata:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v4) {
    v4[2](v4);
  }
}

- (void)signData:(id)a3 forPassUniqueID:(id)a4 completion:(id)a5
{
  id v5 = a5;
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    int v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[NPDCompanionPassLibrary signData:forPassUniqueID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v5)
  {
    uint64_t v9 = +[NSError errorWithDomain:NPKErrorDomain code:-1006 userInfo:0];
    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v9);
  }
}

- (void)generateIssuerBindingDataForIssuerData:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[NPDCompanionPassLibrary generateIssuerBindingDataForIssuerData:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v4)
  {
    int v8 = +[NSError errorWithDomain:NPKErrorDomain code:-1006 userInfo:0];
    v4[2](v4, 0, v8);
  }
}

- (void)supportsSearchForPassUniqueID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 passLocalizedStringForKey:(id)a4 uniqueID:(id)a5 completion:(id)a6
{
  id v16 = a4;
  int v9 = (void (**)(id, void *))a6;
  id v10 = a5;
  id v11 = [(NPDCompanionPassLibrary *)self companionPaymentPassDatabase];
  uint64_t v12 = [v11 paymentPassWithUniqueID:v10];

  uint64_t v13 = [(NPDPassLibrary *)self filter];
  LODWORD(v10) = [v13 allowAccessToPass:v12];

  if (v10)
  {
    id v14 = [v12 dataAccessor];
    int v15 = [v14 passLocalizedStringForKey:v16];
    v9[2](v9, v15);
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getServiceProviderDataForUniqueID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void, void *))a5;
  if (!v6)
  {
    uint64_t v13 = [(NPDCompanionPassLibrary *)self dataSource];
    [v13 serviceProviderDataForPassWithUniqueIdentifier:v8 completion:v9];
    goto LABEL_9;
  }
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      int v15 = "-[NPDCompanionPassLibrary usingSynchronousProxy:getServiceProviderDataForUniqueID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: Not supported in synchronous mode yet: %s", (uint8_t *)&v14, 0xCu);
    }
  }
  if (v9)
  {
    uint64_t v13 = +[NSError errorWithDomain:NPKErrorDomain code:-1006 userInfo:0];
    v9[2](v9, 0, v13);
LABEL_9:
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getEncryptedServiceProviderDataForUniqueID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void, void *))a5;
  if (!v6)
  {
    uint64_t v13 = [(NPDCompanionPassLibrary *)self dataSource];
    [v13 encryptedServiceProviderDataForPassWithUniqueIdentifier:v8 completion:v9];
    goto LABEL_9;
  }
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      int v15 = "-[NPDCompanionPassLibrary usingSynchronousProxy:getEncryptedServiceProviderDataForUniqueID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: Not supported in synchronous mode yet: %s", (uint8_t *)&v14, 0xCu);
    }
  }
  if (v9)
  {
    uint64_t v13 = +[NSError errorWithDomain:NPKErrorDomain code:-1006 userInfo:0];
    v9[2](v9, 0, v13);
LABEL_9:
  }
}

- (void)getGroupsControllerSnapshotWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 allowedPassType];
  id v9 = [v7 limitResults];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000424DC;
  v11[3] = &unk_10006EA80;
  id v12 = v6;
  id v10 = v6;
  [(NPDCompanionPassLibrary *)self getPassesAndCatalogOfPassTypes:v8 limitResults:v9 withHandler:v11];
}

- (void)usingSynchronousProxy:(BOOL)a3 getPassForProvisioningCredentialHash:(id)a4 handler:(id)a5
{
  id v5 = (void (**)(id, void))a5;
  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[NPDCompanionPassLibrary usingSynchronousProxy:getPassForProvisioningCredentialHash:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warning: Method with empty implementation: %s", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v5) {
    v5[2](v5, 0);
  }
}

- (void)recoverPassWithUniqueID:(id)a3 handler:(id)a4
{
  id v4 = (void (**)(void))a4;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "-[NPDCompanionPassLibrary recoverPassWithUniqueID:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v4) {
    v4[2](v4);
  }
}

- (void)sendRKEPassThroughMessage:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    int v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v15 = "-[NPDCompanionPassLibrary sendRKEPassThroughMessage:forSessionIdentifier:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", buf, 0xCu);
    }
  }
  if (v5)
  {
    uint64_t v9 = NPKErrorDomain;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"Unexpected call.";
    id v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    BOOL v11 = +[NSError errorWithDomain:v9 code:-1000 userInfo:v10];

    v5[2](v5, 0, v11);
  }
}

- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void))a4;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[NPDCompanionPassLibrary startVehicleConnectionSessionWithPassUniqueIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v4) {
    v4[2](v4, 0);
  }
}

- (void)invalidateVehicleConnectionSessionIdentifier:(id)a3
{
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      BOOL v7 = "-[NPDCompanionPassLibrary invalidateVehicleConnectionSessionIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPDCompanionPassLibrary *)self dataSource];
  [v8 paymentSetupFeaturesForConfiguration:v7 completion:v6];
}

- (void)hasRemoteLibraryWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)prepareForBackupRestoreWithExistingPreferencesData:(id)a3 handler:(id)a4
{
  BOOL v4 = (void (**)(void))a4;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[NPDCompanionPassLibrary prepareForBackupRestoreWithExistingPreferencesData:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v4) {
    v4[2](v4);
  }
}

- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5
{
  id v5 = (void (**)(void))a5;
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    int v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[NPDCompanionPassLibrary prepareForBackupRestoreWithRequiredFileURLs:destinationFileHandles:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)requestIssuerBindingDataForIssuerData:(id)a3 completion:(id)a4
{
  BOOL v4 = (void (**)(id, void, void *))a4;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[NPDCompanionPassLibrary requestIssuerBindingDataForIssuerData:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", buf, 0xCu);
    }
  }
  if (v4)
  {
    uint64_t v8 = NPKErrorDomain;
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Unexpected call.";
    int v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = +[NSError errorWithDomain:v8 code:-1000 userInfo:v9];

    v4[2](v4, 0, v10);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 canAddCarKeyPassWithConfiguration:(id)a4 completion:(id)a5
{
  id v5 = a5;
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v15 = "-[NPDCompanionPassLibrary usingSynchronousProxy:canAddCarKeyPassWithConfiguration:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", buf, 0xCu);
    }
  }
  if (v5)
  {
    uint64_t v9 = NPKErrorDomain;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"Unexpected call.";
    id v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    NSErrorUserInfoKey v11 = +[NSError errorWithDomain:v9 code:-1000 userInfo:v10];

    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v11);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 meetsProvisioningRequirements:(id)a4 completion:(id)a5
{
  id v5 = a5;
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[NPDCompanionPassLibrary usingSynchronousProxy:meetsProvisioningRequirements:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v5) {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

- (void)isIssuerAppProvisioningSupportedWithHandler:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[NPDCompanionPassLibrary isIssuerAppProvisioningSupportedWithHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 dynamicStateForPassUniqueID:(id)a4 handler:(id)a5
{
  BOOL v5 = (void (**)(id, void))a5;
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[NPDCompanionPassLibrary usingSynchronousProxy:dynamicStateForPassUniqueID:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v5) {
    v5[2](v5, 0);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 setLiveRenderingEnabled:(BOOL)a4 forPassUniqueID:(id)a5 handler:(id)a6
{
  BOOL v6 = (void (**)(id, void))a6;
  BOOL v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    int v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      NSErrorUserInfoKey v11 = "-[NPDCompanionPassLibrary usingSynchronousProxy:setLiveRenderingEnabled:forPassUniqueID:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected call to %s", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)getPassesWithSearchableTransactions:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      BOOL v8 = "-[NPDCompanionPassLibrary getPassesWithSearchableTransactions:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: %s not implemented", (uint8_t *)&v7, 0xCu);
    }
  }
  v3[2](v3, 0);
}

- (void)hasPassesInExpiredSectionWithHandler:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      BOOL v8 = "-[NPDCompanionPassLibrary hasPassesInExpiredSectionWithHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: %s not implemented", (uint8_t *)&v7, 0xCu);
    }
  }
  v3[2](v3, 0);
}

- (void)isWatchIssuerAppProvisioningSupportedWithHandler:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      BOOL v8 = "-[NPDCompanionPassLibrary isWatchIssuerAppProvisioningSupportedWithHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: %s not implemented", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)unexpiredPassesOrderedByGroup:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      BOOL v8 = "-[NPDCompanionPassLibrary unexpiredPassesOrderedByGroup:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: %s not implemented", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (id)_deviceName
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = [v2 getActivePairedDevice];
  BOOL v4 = [v3 valueForProperty:NRDevicePropertyName];

  return v4;
}

- (id)_filteredAndConfiguredPassForPaymentPass:(id)a3 deviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(NPDCompanionPassLibrary *)self dataSource];
  int v9 = [v8 secureElementIdentifiers];

  if (v9) {
    NPKIdentifyDevicePaymentApplicationsForPass();
  }
  int v10 = +[NPKGizmoDatabase sharedDatabase];
  NSErrorUserInfoKey v11 = [v6 uniqueID];
  NSErrorUserInfoKey v12 = [v10 transitAppletStateForPassWithUniqueID:v11];

  NPKUpdateTransitPassPropertiesForPass();
  CFStringRef v13 = +[NPKGizmoDatabase sharedDatabase];
  int v14 = [v6 uniqueID];
  int v15 = [v13 transactionSourceIdentifierForPassWithUniqueID:v14];

  NPKUpdateTransactionSourceIdentifierForPass();
  id v16 = +[NPKGizmoDatabase sharedDatabase];
  uint64_t v17 = [v6 uniqueID];
  id v18 = [v16 passForUniqueID:v17 includeImageSets:0];

  objc_msgSend(v6, "setSettings:", objc_msgSend(v18, "settings"));
  uint64_t v19 = [(NPDPassLibrary *)self filter];
  id v20 = [v19 whitelist];

  if (([v20 passesAllAccess] & 1) == 0
    && ([v20 paymentAllAccess] & 1) == 0)
  {
    [v6 sanitizePaymentApplications];
  }
  [v6 setRemotePass:1];
  [v6 setDeviceName:v7];

  [v6 setPassLibraryMachServiceName:PKCompanionWatchPassLibraryMachServiceName];
  id v21 = [(NPDPassLibrary *)self filter];
  id v22 = [v21 filterPassIfNeeded:v6];

  return v22;
}

- (void)_handleCompanionPassDatabaseNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 object];
  id v6 = [(NPDCompanionPassLibrary *)self companionPaymentPassDatabase];

  if (v5 == v6)
  {
    id v7 = [v4 name];
    unsigned int v8 = [v7 isEqualToString:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.CatalogChanged"];

    if (v8)
    {
      int v9 = [v4 userInfo];
      int v10 = [v9 objectForKeyedSubscript:@"Catalog"];

      if (v10)
      {
        NSErrorUserInfoKey v11 = [(NPDPassLibrary *)self filter];
        NSErrorUserInfoKey v12 = [v11 whitelist];
        unsigned int v13 = [v12 passesAllAccess];

        if (v13)
        {
          id v25 = _NSConcreteStackBlock;
          uint64_t v26 = 3221225472;
          id v27 = sub_100043CC8;
          __int16 v28 = &unk_10006EAA8;
          id v29 = self;
          id v30 = v10;
          [(NPDCompanionPassLibrary *)self getPassesWithHandler:&v25];
        }
      }
    }
    int v14 = objc_msgSend(v4, "userInfo", v25, v26, v27, v28, v29);
    int v15 = [v14 objectForKeyedSubscript:@"Pass"];

    id v16 = [v15 paymentPass];
    uint64_t v17 = [(NPDCompanionPassLibrary *)self _deviceName];
    id v18 = [(NPDCompanionPassLibrary *)self _filteredAndConfiguredPassForPaymentPass:v16 deviceName:v17];

    if (v18)
    {
      uint64_t v19 = [v4 name];
      unsigned int v20 = [v19 isEqualToString:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.PassAdded"];

      if (v20)
      {
        [(NPDPassLibrary *)self broadcastPassAdded:v18];
      }
      else
      {
        id v21 = [v4 name];
        unsigned int v22 = [v21 isEqualToString:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.PassUpdated"];

        if (v22)
        {
          [(NPDPassLibrary *)self broadcastPassUpdated:v18];
        }
        else
        {
          id v23 = [v4 name];
          unsigned int v24 = [v23 isEqualToString:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.PassRemoved"];

          if (v24) {
            [(NPDPassLibrary *)self broadcastPassRemoved:v18];
          }
        }
      }
    }
  }
}

- (NPDCompanionPaymentPassDatabase)companionPaymentPassDatabase
{
  return self->_companionPaymentPassDatabase;
}

- (void)setCompanionPaymentPassDatabase:(id)a3
{
}

- (NPDCompanionPassLibraryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NPDCompanionPassLibraryDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_companionPaymentPassDatabase, 0);
}

@end