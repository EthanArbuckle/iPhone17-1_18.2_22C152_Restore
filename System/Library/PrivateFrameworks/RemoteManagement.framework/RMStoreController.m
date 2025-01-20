@interface RMStoreController
+ (RMStoreController)sharedController;
+ (void)start;
- (NSManagedObjectContext)context;
- (NSMutableDictionary)clientByIdentifier;
- (NSPersistentContainer)persistentContainer;
- (RMDebounceTimer)debouncer;
- (RMStoreController)initWithPersistentContainer:(id)a3 context:(id)a4;
- (id)_activeConfigurationsAndAssetsForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 error:(id *)a5;
- (id)_activeConfigurationsForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 includeAssets:(BOOL)a5 error:(id *)a6;
- (id)_activeConfigurationsForStoreIdentifier:(id)a3 error:(id *)a4;
- (id)_activeConfigurationsOnlyForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 error:(id *)a5;
- (id)_allManagementSourcesReturningError:(id *)a3;
- (id)_buildFlattenedConfigurations:(id)a3 includeAssets:(BOOL)a4 error:(id *)a5;
- (id)_clientForIdentifier:(id)a3;
- (id)_configurationsWithVisibleUIForConfigurationTypes:(id)a3 managementSource:(id)a4 error:(id *)a5;
- (id)_declarationsForStoreIdentifier:(id)a3 declarationTypes:(id)a4 identifier:(id)a5 error:(id *)a6;
- (id)_declarationsOfClass:(Class)a3 managementSource:(id)a4 declarationTypes:(id)a5 identifier:(id)a6 error:(id *)a7;
- (id)_makeClientWithManagementSourceObjectID:(id)a3 storeIdentifier:(id)a4 persistentContainer:(id)a5;
- (id)_managementSourceWithIdentifier:(id)a3 error:(id *)a4;
- (id)_newPayloadWithDeclaration:(id)a3 managementSource:(id)a4 error:(id *)a5;
- (id)_observerStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)_payloadsForDeclarationIdentifier:(id)a3 managementSource:(id)a4 error:(id *)a5;
- (id)_payloadsForPayloadClass:(Class)a3 identifier:(id)a4 managementSource:(id)a5 error:(id *)a6;
- (id)_providerStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)_startClientForSourceIdentifier:(id)a3 objectID:(id)a4;
- (id)_subscriberStoreWithIdentifier:(id)a3 error:(id *)a4;
- (void)_addOptionsToManagementSource:(id)a3 options:(id)a4;
- (void)_observerStoresDidChange;
- (void)_start;
- (void)_stopClientForIdentifier:(id)a3;
- (void)applyChangesForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)certificatePersistentRefForAssetKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)certificateStatusWithStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)configurationUIsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)createStoreWithType:(int64_t)a3 defaultToInteractive:(BOOL)a4 dataSeparated:(BOOL)a5 options:(id)a6 completionHandler:(id)a7;
- (void)declarationManifestForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)declarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)declarationsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)declarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteDeclarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)displayableProfileConfigurationsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchDataAtURL:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)metadataForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)metadataValueForKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)observerStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)observerStoresDidChange;
- (void)observerStoresWithCompletionHandler:(id)a3;
- (void)providerStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)providerStoresWithCompletionHandler:(id)a3;
- (void)removeStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6;
- (void)resolveAsset:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)saveDeclaration:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setClientByIdentifier:(id)a3;
- (void)setConfigurationUIWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 visible:(BOOL)a6 ui:(id)a7 completionHandler:(id)a8;
- (void)setDebouncer:(id)a3;
- (void)setMetadataValue:(id)a3 forKey:(id)a4 storeIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 storeIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6;
- (void)subscribedDeclarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)subscribedStoreConfigurationsVisibleUIWithTypes:(id)a3 completionHandler:(id)a4;
- (void)subscribedStoreDeclarationsWithTypes:(id)a3 completionHandler:(id)a4;
- (void)subscriberStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)subscriberStoresWithCompletionHandler:(id)a3;
- (void)triggerAggregatingTimerAction;
- (void)unassignAssets:(id)a3 completionHandler:(id)a4;
@end

@implementation RMStoreController

+ (RMStoreController)sharedController
{
  if (qword_1000DB410 != -1) {
    dispatch_once(&qword_1000DB410, &stru_1000C6B98);
  }
  v2 = (void *)qword_1000DB408;

  return (RMStoreController *)v2;
}

- (RMStoreController)initWithPersistentContainer:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RMStoreController;
  v9 = [(RMStoreController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistentContainer, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    uint64_t v11 = objc_opt_new();
    clientByIdentifier = v10->_clientByIdentifier;
    v10->_clientByIdentifier = (NSMutableDictionary *)v11;

    uint64_t v13 = +[RMDebounceTimer debounceTimerWithMinimumInterval:v10 maximumInterval:@"RMStoreController" delegate:1.0 identifier:10.0];
    debouncer = v10->_debouncer;
    v10->_debouncer = (RMDebounceTimer *)v13;
  }
  return v10;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FEAC;
  block[3] = &unk_1000C5160;
  block[4] = a1;
  if (qword_1000DB418 != -1) {
    dispatch_once(&qword_1000DB418, block);
  }
}

- (void)_start
{
  v3 = [(RMStoreController *)self context];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_100070074;
  uint64_t v13 = sub_100070084;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007008C;
  v6[3] = &unk_1000C6BC0;
  v6[4] = self;
  id v8 = &v9;
  id v4 = (id)objc_opt_new();
  id v7 = v4;
  [v3 performBlockAndWait:v6];
  if (!v10[5])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100070280;
    v5[3] = &unk_1000C6BE8;
    v5[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }

  _Block_object_dispose(&v9, 8);
}

- (id)_startClientForSourceIdentifier:(id)a3 objectID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RMStoreController *)self persistentContainer];
  uint64_t v9 = [(RMStoreController *)self _makeClientWithManagementSourceObjectID:v6 storeIdentifier:v7 persistentContainer:v8];

  v10 = [(RMStoreController *)self clientByIdentifier];
  [v10 setObject:v9 forKeyedSubscript:v7];

  [v9 start];

  return v9;
}

- (id)_makeClientWithManagementSourceObjectID:(id)a3 storeIdentifier:(id)a4 persistentContainer:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [RMStoreClient alloc];
  v10 = objc_opt_new();
  uint64_t v11 = [(RMStoreController *)self persistentContainer];
  v12 = [(RMStoreClient *)v9 initWithManagementSourceObjectID:v8 storeIdentifier:v7 statusQuerier:v10 persistentContainer:v11];

  return v12;
}

- (void)_stopClientForIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = [(RMStoreController *)self clientByIdentifier];
  v5 = [v4 objectForKeyedSubscript:v7];

  if (v5)
  {
    [v5 remove];
    id v6 = [(RMStoreController *)self clientByIdentifier];
    [v6 removeObjectForKey:v7];
  }
}

- (id)_clientForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(RMStoreController *)self clientByIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)observerStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ObserverStoreWithIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v9 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100070074;
  v24 = sub_100070084;
  id v25 = 0;
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100070074;
  v19 = sub_100070084;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007077C;
  v11[3] = &unk_1000C6C10;
  uint64_t v13 = &v15;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p_long long buf = &buf;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    v7[2](v7, 0);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)observerStoresWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = +[RMLog storeController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ObserverStoresWithCompletionHandler...", buf, 2u);
  }

  id v6 = [(RMStoreController *)self context];
  *(void *)long long buf = 0;
  uint64_t v15 = buf;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100070074;
  v18 = sub_100070084;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_100070074;
  id v12 = sub_100070084;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000709F4;
  v7[3] = &unk_1000C5798;
  v7[4] = self;
  v7[5] = buf;
  v7[6] = &v8;
  [v6 performBlockAndWait:v7];
  if (*((void *)v15 + 5)) {
    v4[2](v4, 0);
  }
  else {
    v4[2](v4, v9[5]);
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(buf, 8);
}

- (void)declarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v11 = +[RMLog storeController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DeclarationWithIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v12 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100070074;
  v30 = sub_100070084;
  id v31 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100070074;
  id v25 = sub_100070084;
  id v26 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100070EB4;
  v16[3] = &unk_1000C6C38;
  id v19 = &v21;
  v16[4] = self;
  id v13 = v9;
  id v17 = v13;
  id v14 = v8;
  id v18 = v14;
  p_long long buf = &buf;
  [v12 performBlockAndWait:v16];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v10[2](v10, 0);
  }
  else
  {
    if ([(id)v22[5] count])
    {
      uint64_t v15 = [(id)v22[5] objectAtIndexedSubscript:0];
      ((void (*)(void (**)(id, void), void *, void))v10[2])(v10, v15, 0);
    }
    else
    {
      uint64_t v15 = +[RMErrorUtilities createDeclarationNotFoundErrorWithIdentifier:v14];
      ((void (*)(void (**)(id, void), void, void *))v10[2])(v10, 0, v15);
    }
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&buf, 8);
}

- (void)declarationsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DeclarationsForStoreIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100070074;
  v24 = sub_100070084;
  id v25 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100070074;
  id v19 = sub_100070084;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000711A4;
  v11[3] = &unk_1000C6C10;
  id v13 = &v15;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p_long long buf = &buf;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    v7[2](v7, 0);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)declarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v11 = +[RMLog storeController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DeclarationsWithTypes with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v12 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100070074;
  v29 = sub_100070084;
  id v30 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100070074;
  v24 = sub_100070084;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000714C4;
  v15[3] = &unk_1000C6C38;
  id v18 = &v20;
  v15[4] = self;
  id v13 = v9;
  id v16 = v13;
  id v14 = v8;
  id v17 = v14;
  p_long long buf = &buf;
  [v12 performBlockAndWait:v15];
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    v10[2](v10, 0);
  }
  else {
    v10[2](v10, v21[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)declarationManifestForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DeclarationManifestForStoreIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100070074;
  v29 = sub_100070084;
  id v30 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100070074;
  v24 = sub_100070084;
  id v25 = 0;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_1000717D8;
  uint64_t v15 = &unk_1000C6C10;
  id v18 = &v20;
  id v16 = self;
  id v10 = v6;
  id v17 = v10;
  p_long long buf = &buf;
  [v9 performBlockAndWait:&v12];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v11 = +[RMDeclarationManifest declarationManifestWithDeclarations:](RMDeclarationManifest, "declarationManifestWithDeclarations:", v21[5], v12, v13, v14, v15, v16);
    ((void (*)(void (**)(id, void), void *, void))v7[2])(v7, v11, 0);
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&buf, 8);
}

- (void)configurationUIsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ConfigurationUIsForStoreIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  +[RMConfigurationPublisher fetchVisibleConfigurationUIs];
  id v9 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100070074;
  v24 = sub_100070084;
  id v25 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100070074;
  id v19 = sub_100070084;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100071AD0;
  v11[3] = &unk_1000C5798;
  id v10 = v6;
  id v12 = v10;
  p_long long buf = &buf;
  id v14 = &v15;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    v7[2](v7, 0);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)displayableProfileConfigurationsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v20 = (void (**)(void))a4;
  id v7 = +[RMLog storeController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DisplayableProfileConfigurations", buf, 2u);
  }

  v45[0] = RMConfigurationTypeLegacyProfiles;
  v45[1] = RMConfigurationTypeLegacyInteractiveProfiles;
  id v8 = +[NSArray arrayWithObjects:v45 count:2];
  id v9 = +[NSSet setWithArray:v8];

  uint64_t v21 = [(RMStoreController *)self context];
  *(void *)long long buf = 0;
  v39 = buf;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100070074;
  v42 = sub_100070084;
  id v43 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100070074;
  v36 = sub_100070084;
  id v37 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100072248;
  v27[3] = &unk_1000C6C38;
  id v30 = &v32;
  v27[4] = self;
  id v19 = v9;
  id v28 = v19;
  id v10 = v6;
  id v29 = v10;
  id v31 = buf;
  [v21 performBlockAndWait:v27];
  uint64_t v22 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = (id)v33[5];
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "declarationIdentifier", v19);
        uint64_t v17 = [v15 declarationServerToken];
        unsigned __int8 v18 = +[RMConfigurationStatusArchiver validStatusForStoreIdentifier:v10 declarationIdentifier:v16 serverToken:v17];

        if (v18) {
          [v22 addObject:v15];
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v44 count:16];
    }
    while (v12);
  }

  v20[2]();
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(buf, 8);
}

- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 storeIdentifier:(id)a5 completionHandler:(id)a6
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a6;
  id v9 = +[RMLog storeController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 declarationIdentifier];
    int v12 = 138543362;
    uint64_t v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SetShouldInstallConfiguration with %{public}@...", (uint8_t *)&v12, 0xCu);
  }
  id v11 = +[RMErrorUtilities createNotImplementedErrorForFeature:@"SetShouldInstallConfiguration"];
  v8[2](v8, v11);
}

- (void)fetchDataAtURL:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = +[RMLog storeController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "fetchDataAtURL with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  int v12 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100070074;
  id v30 = sub_100070084;
  id v31 = 0;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000726C4;
  v19[3] = &unk_1000C5468;
  v19[4] = self;
  id v13 = v9;
  id v20 = v13;
  p_long long buf = &buf;
  uint64_t v22 = &v23;
  [v12 performBlockAndWait:v19];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v10[2](v10, 0);
  }
  else
  {
    id v14 = objc_opt_new();
    uint64_t v15 = *((unsigned __int8 *)v24 + 24);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10007277C;
    v16[3] = &unk_1000C6C60;
    id v17 = v8;
    unsigned __int8 v18 = v10;
    [v14 fetchDataAtURL:v17 useDDM:v15 completionHandler:v16];
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)triggerAggregatingTimerAction
{
}

- (void)observerStoresDidChange
{
  id v2 = [(RMStoreController *)self debouncer];
  [v2 trigger];
}

- (void)_observerStoresDidChange
{
  id v2 = +[RMLog storeController];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10007ADD4();
  }

  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 postNotificationName:RMObserverStoreStoreDidChangeNotification object:0 userInfo:0 options:3];
}

- (void)createStoreWithType:(int64_t)a3 defaultToInteractive:(BOOL)a4 dataSeparated:(BOOL)a5 options:(id)a6 completionHandler:(id)a7
{
  id v10 = a6;
  id v11 = (void (**)(id, void, uint64_t))a7;
  int v12 = +[RMLog storeController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CreateStoreWithType...", buf, 2u);
  }

  *(void *)long long buf = 0;
  v48 = buf;
  uint64_t v49 = 0x3032000000;
  v50 = sub_100070074;
  v51 = sub_100070084;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_100070074;
  v45 = sub_100070084;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_100070074;
  v39 = sub_100070084;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_100070074;
  v33 = sub_100070084;
  id v34 = 0;
  [(RMStoreController *)self context];
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = sub_100072C34;
  id v20 = &unk_1000C6C88;
  int64_t v28 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v13;
  long long v24 = &v29;
  id v14 = v10;
  id v22 = v14;
  uint64_t v23 = self;
  uint64_t v25 = buf;
  char v26 = &v41;
  uint64_t v27 = &v35;
  [v13 performBlockAndWait:&v17];
  if (*((void *)v48 + 5))
  {
    uint64_t v15 = -[RMStoreController _startClientForSourceIdentifier:objectID:](self, "_startClientForSourceIdentifier:objectID:", v42[5], v36[5], v17, v18, v19, v20, v21);
    [v15 create];
  }
  id v16 = +[RMClientController sharedController];
  [v16 managementChannelsChanged];

  v11[2](v11, *((void *)v48 + 5), v30[5]);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(buf, 8);
}

- (void)removeStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "RemoveStoreWithIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  [(RMStoreController *)self _stopClientForIdentifier:v6];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  long long v24 = sub_100070074;
  uint64_t v25 = sub_100070084;
  id v26 = 0;
  id v9 = [(RMStoreController *)self context];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10007318C;
  id v17 = &unk_1000C6CB0;
  uint64_t v18 = self;
  id v10 = v6;
  id v19 = v10;
  p_long long buf = &buf;
  id v11 = v9;
  id v20 = v11;
  [v11 performBlockAndWait:&v14];
  +[RMConfigurationStatusArchiver removeAllStatusForStoreIdentifier:error:](RMConfigurationStatusArchiver, "removeAllStatusForStoreIdentifier:error:", v10, 0, v14, v15, v16, v17, v18);
  int v12 = +[RMExternalStatusPublisher sharedPublisher];
  [v12 listenToNotificationsForAllKeyPaths];

  id v13 = +[RMClientController sharedController];
  [v13 managementChannelsChanged];

  v7[2](v7, *(void *)(*((void *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);
}

- (void)providerStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ProviderStoreWithIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100070074;
  long long v24 = sub_100070084;
  id v25 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100070074;
  id v19 = sub_100070084;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000734FC;
  v11[3] = &unk_1000C6C10;
  id v13 = &v15;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p_long long buf = &buf;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    v7[2](v7, 0);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)providerStoresWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = +[RMLog storeController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ProviderStoresWithCompletionHandler...", buf, 2u);
  }

  id v6 = [(RMStoreController *)self context];
  *(void *)long long buf = 0;
  uint64_t v15 = buf;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100070074;
  uint64_t v18 = sub_100070084;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100070074;
  id v12 = sub_100070084;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100073774;
  v7[3] = &unk_1000C5798;
  v7[4] = self;
  v7[5] = buf;
  v7[6] = &v8;
  [v6 performBlockAndWait:v7];
  if (*((void *)v15 + 5)) {
    v4[2](v4, 0);
  }
  else {
    v4[2](v4, v9[5]);
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(buf, 8);
}

- (void)saveDeclaration:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  id v11 = +[RMLog storeController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 declarationIdentifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SaveDeclaration with %{public}@...", (uint8_t *)&buf, 0xCu);
  }
  id v13 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  long long v24 = sub_100070074;
  id v25 = sub_100070084;
  id v26 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100073B74;
  v17[3] = &unk_1000C6CD8;
  v17[4] = self;
  id v14 = v9;
  id v18 = v14;
  p_long long buf = &buf;
  id v15 = v8;
  id v19 = v15;
  id v16 = v13;
  id v20 = v16;
  [v16 performBlockAndWait:v17];
  v10[2](v10, *(void *)(*((void *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
}

- (void)deleteDeclarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  id v11 = +[RMLog storeController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DeleteDeclarationWithIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v12 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100070074;
  long long v24 = sub_100070084;
  id v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100074240;
  v16[3] = &unk_1000C6CD8;
  void v16[4] = self;
  id v13 = v9;
  id v17 = v13;
  p_long long buf = &buf;
  id v14 = v8;
  id v18 = v14;
  id v15 = v12;
  id v19 = v15;
  [v15 performBlockAndWait:v16];
  v10[2](v10, *(void *)(*((void *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
}

- (void)applyChangesForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ApplyChangesForStoreIdentifier with %{public}@...", (uint8_t *)&v12, 0xCu);
  }

  id v9 = [(RMStoreController *)self _clientForIdentifier:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 syncWithCompletionHandler:v7];
  }
  else
  {
    id v11 = +[RMClientController sharedController];
    [v11 applyNowWithIdentifier:v6 completionHandler:v7];
  }
}

- (void)subscriberStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SubscriberStoreWithIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100070074;
  long long v24 = sub_100070084;
  id v25 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100070074;
  id v19 = sub_100070084;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000748E0;
  v11[3] = &unk_1000C6C10;
  id v13 = &v15;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p_long long buf = &buf;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    v7[2](v7, 0);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)subscriberStoresWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = +[RMLog storeController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SubscriberStoresWithCompletionHandler...", buf, 2u);
  }

  id v6 = [(RMStoreController *)self context];
  *(void *)long long buf = 0;
  uint64_t v15 = buf;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100070074;
  id v18 = sub_100070084;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100070074;
  id v12 = sub_100070084;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100074B58;
  v7[3] = &unk_1000C5798;
  v7[4] = self;
  v7[5] = buf;
  v7[6] = &v8;
  [v6 performBlockAndWait:v7];
  if (*((void *)v15 + 5)) {
    v4[2](v4, 0);
  }
  else {
    v4[2](v4, v9[5]);
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(buf, 8);
}

- (void)subscribedStoreDeclarationsWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SubscribedStoreDeclarationsWithTypes...", buf, 2u);
  }

  id v9 = [(RMStoreController *)self context];
  *(void *)long long buf = 0;
  uint64_t v29 = buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_100070074;
  uint64_t v32 = sub_100070084;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100070074;
  id v26 = sub_100070084;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100070074;
  id v20 = sub_100070084;
  id v21 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100074FA8;
  v11[3] = &unk_1000C6D00;
  void v11[4] = self;
  id v13 = buf;
  id v14 = &v22;
  uint64_t v15 = &v16;
  id v10 = v6;
  id v12 = v10;
  [v9 performBlockAndWait:v11];
  if (*((void *)v29 + 5)) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else {
    (*((void (**)(id, uint64_t, uint64_t))v7 + 2))(v7, v23[5], v17[5]);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(buf, 8);
}

- (void)subscribedDeclarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = +[RMLog storeController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SubscribedDeclarationsWithTypes with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v12 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  int64_t v28 = sub_100070074;
  uint64_t v29 = sub_100070084;
  id v30 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100070074;
  uint64_t v24 = sub_100070084;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000754E0;
  v15[3] = &unk_1000C6C38;
  uint64_t v18 = &v20;
  v15[4] = self;
  id v13 = v8;
  id v16 = v13;
  id v14 = v9;
  id v17 = v14;
  p_long long buf = &buf;
  [v12 performBlockAndWait:v15];
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    v10[2](v10, 0);
  }
  else {
    v10[2](v10, v21[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)subscribedStoreConfigurationsVisibleUIWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SubscribedStoreConfigurationsVisibleUIWithTypes...", buf, 2u);
  }

  id v9 = [(RMStoreController *)self context];
  *(void *)long long buf = 0;
  uint64_t v29 = buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_100070074;
  uint64_t v32 = sub_100070084;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100070074;
  id v26 = sub_100070084;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100070074;
  uint64_t v20 = sub_100070084;
  id v21 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000757EC;
  v11[3] = &unk_1000C6D00;
  void v11[4] = self;
  id v13 = buf;
  id v14 = &v22;
  uint64_t v15 = &v16;
  id v10 = v6;
  id v12 = v10;
  [v9 performBlockAndWait:v11];
  if (*((void *)v29 + 5)) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else {
    (*((void (**)(id, uint64_t, uint64_t))v7 + 2))(v7, v23[5], v17[5]);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(buf, 8);
}

- (void)resolveAsset:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = +[RMLog storeController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ResolveAsset with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v12 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v51 = 0x3032000000;
  id v52 = sub_100070074;
  v53 = sub_100070084;
  id v54 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_100070074;
  v48 = sub_100070084;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = sub_100070074;
  v42 = sub_100070084;
  id v43 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100075E5C;
  v22[3] = &unk_1000C6D28;
  v22[4] = self;
  id v13 = v9;
  id v23 = v13;
  id v14 = v8;
  id v24 = v14;
  p_long long buf = &buf;
  id v26 = &v44;
  id v27 = &v38;
  int64_t v28 = &v34;
  uint64_t v29 = &v30;
  [v12 performBlockAndWait:v22];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v10[2](v10, 0);
  }
  else
  {
    uint64_t v15 = v45[5];
    uint64_t v16 = v39[5];
    uint64_t v17 = *((unsigned __int8 *)v35 + 24);
    uint64_t v18 = v31[3];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100076134;
    v19[3] = &unk_1000C6A28;
    id v20 = v14;
    id v21 = v10;
    +[RMStoreAssetResolver resolveAsset:v15 unresolvedAsset:v20 personaID:v16 isDDM:v17 enrollmentType:v18 completionHandler:v19];
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)unassignAssets:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RMStoreController *)self context];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_100070074;
  id v23 = sub_100070084;
  id v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000763CC;
  v16[3] = &unk_1000C4E08;
  void v16[4] = self;
  id v9 = v6;
  id v17 = v9;
  uint64_t v18 = &v19;
  [v8 performBlockAndWait:v16];
  uint64_t v10 = v20[5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100076478;
  v13[3] = &unk_1000C4F40;
  id v11 = v9;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  +[RMStoreAssetResolver unassignAssets:v11 personaID:v10 completionHandler:v13];

  _Block_object_dispose(&v19, 8);
}

- (void)setConfigurationUIWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 visible:(BOOL)a6 ui:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = (void (**)(id, void))a8;
  uint64_t v19 = +[RMLog storeController];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SetConfigurationUIWithStoreIdentifier with %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v20 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000;
  v42 = sub_100070074;
  id v43 = sub_100070084;
  id v44 = 0;
  uint64_t v36 = 0;
  char v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000767E0;
  v27[3] = &unk_1000C6D50;
  v27[4] = self;
  id v21 = v14;
  id v28 = v21;
  p_long long buf = &buf;
  id v22 = v15;
  id v29 = v22;
  id v23 = v16;
  id v30 = v23;
  BOOL v35 = a6;
  id v24 = v17;
  id v31 = v24;
  uint64_t v34 = &v36;
  id v25 = v20;
  id v32 = v25;
  [v25 performBlockAndWait:v27];
  uint64_t v26 = *((void *)&buf + 1);
  if (*((unsigned char *)v37 + 24) && !*(void *)(*((void *)&buf + 1) + 40))
  {
    [(RMStoreController *)self observerStoresDidChange];
    uint64_t v26 = *((void *)&buf + 1);
  }
  v18[2](v18, *(void *)(v26 + 40));

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  id v13 = [(RMStoreController *)self context];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_100070074;
  uint64_t v34 = sub_100070084;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_100070074;
  id v28 = sub_100070084;
  id v29 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100076E4C;
  v20[3] = &unk_1000C5468;
  v20[4] = self;
  id v14 = v11;
  id v21 = v14;
  id v22 = &v30;
  id v23 = &v24;
  [v13 performBlockAndWait:v20];
  if (v31[5])
  {
    v12[2](v12);
  }
  else
  {
    int64_t v15 = +[RMStoreHelper storeScope];
    id v16 = +[RMManagedTrustStoreController newManagedTrustStoreControllerProtocolForScope:v15 personaID:v25[5]];
    id v17 = [v14 key];
    uint64_t v18 = (id *)(v31 + 5);
    id obj = (id)v31[5];
    [v16 setTrustForCertificateRef:v10 configurationKey:v17 fullTrust:v7 error:&obj];
    objc_storeStrong(v18, obj);

    ((void (*)(void (**)(void), uint64_t))v12[2])(v12, v31[5]);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id))a6;
  id v13 = [(RMStoreController *)self context];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100070074;
  id v27 = sub_100070084;
  id v28 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000770D8;
  v20[3] = &unk_1000C4E08;
  v20[4] = self;
  id v14 = v11;
  id v21 = v14;
  id v22 = &v23;
  [v13 performBlockAndWait:v20];
  int64_t v15 = +[RMStoreHelper storeScope];
  id v16 = +[RMManagedTrustStoreController newManagedTrustStoreControllerProtocolForScope:v15 personaID:v24[5]];
  id v17 = [v14 key];
  id v19 = 0;
  [v16 removeTrustForCertificateRef:v10 configurationKey:v17 fullTrust:v7 error:&v19];
  id v18 = v19;

  v12[2](v12, v18);
  _Block_object_dispose(&v23, 8);
}

- (void)certificatePersistentRefForAssetKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [(RMStoreController *)self context];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_100070074;
  uint64_t v32 = sub_100070084;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_100070074;
  uint64_t v26 = sub_100070084;
  id v27 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000773CC;
  v18[3] = &unk_1000C5468;
  v18[4] = self;
  id v12 = v9;
  id v19 = v12;
  id v20 = &v28;
  id v21 = &v22;
  [v11 performBlockAndWait:v18];
  if (v29[5])
  {
    v10[2](v10, 0);
  }
  else
  {
    int64_t v13 = +[RMStoreHelper storeScope];
    id v14 = +[RMManagedKeychainController newManagedKeychainControllerForScope:v13 personaID:v23[5]];
    id v17 = 0;
    int64_t v15 = [v14 certificatePersistentRefForAssetKey:v8 error:&v17];
    id v16 = v17;
    ((void (*)(void (**)(id, void), void *, id))v10[2])(v10, v15, v16);
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

- (void)certificateStatusWithStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v33 = (void (**)(id, void))a4;
  uint64_t v34 = [(RMStoreController *)self context];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = sub_100070074;
  v62 = sub_100070084;
  id v63 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = sub_100070074;
  v56 = sub_100070084;
  id v57 = 0;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100077A24;
  v48[3] = &unk_1000C5468;
  v48[4] = self;
  id v7 = v6;
  id v49 = v7;
  v50 = &v58;
  uint64_t v51 = &v52;
  [v34 performBlockAndWait:v48];
  if (v59[5])
  {
    v33[2](v33, 0);
  }
  else
  {
    int64_t v8 = +[RMStoreHelper storeScope];
    id v9 = +[RMManagedKeychainController newManagedKeychainControllerForScope:v8 personaID:v53[5]];
    id v47 = 0;
    uint64_t v32 = v9;
    id v31 = [v9 assetKeysForCertificatesAndReturnError:&v47];
    id v10 = v47;
    if (v10)
    {
      id v11 = v10;
      ((void (*)(void (**)(id, void), void, id))v33[2])(v33, 0, v10);
    }
    else
    {
      id v46 = 0;
      uint64_t v30 = [v32 assetKeysForIdentitiesAndReturnError:&v46];
      id v12 = v46;
      if (v12)
      {
        id v11 = v12;
        ((void (*)(void (**)(id, void), void, id))v33[2])(v33, 0, v12);
      }
      else
      {
        id v35 = +[NSSet setWithArray:v30];
        uint64_t v36 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v31 count]);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v13 = v31;
        id v14 = [v13 countByEnumeratingWithState:&v42 objects:v65 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v43;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v43 != v15) {
                objc_enumerationMutation(v13);
              }
              uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              id v18 = +[RMStoreDeclarationKey newDeclarationKey:v17];
              id v19 = [v18 storeIdentifier];
              unsigned int v20 = [v19 isEqualToString:v7];

              if (v20) {
                [v36 addObject:v17];
              }
            }
            id v14 = [v13 countByEnumeratingWithState:&v42 objects:v65 count:16];
          }
          while (v14);
        }

        if ([v36 count])
        {
          id v41 = 0;
          id v29 = [v32 certificatePersistentRefsForAssetKeys:v36 error:&v41];
          id v11 = v41;
          if (v11)
          {
            ((void (*)(void (**)(id, void), void, id))v33[2])(v33, 0, v11);
          }
          else
          {
            id v21 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v29 count]);
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v22 = v29;
            id v23 = [v22 countByEnumeratingWithState:&v37 objects:v64 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v38;
              do
              {
                for (j = 0; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v38 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
                  id v27 = objc_msgSend(v22, "objectForKeyedSubscript:", v26, v29);
                  uint64_t v28 = +[RMCertificateStatusItem certificateStatusItemWithPersistentRef:isIdentity:](RMCertificateStatusItem, "certificateStatusItemWithPersistentRef:isIdentity:", v27, [v35 containsObject:v26]);
                  [v21 setObject:v28 forKeyedSubscript:v26];
                }
                id v23 = [v22 countByEnumeratingWithState:&v37 objects:v64 count:16];
              }
              while (v23);
            }

            ((void (*)(void (**)(id, void), void *, void))v33[2])(v33, v21, 0);
          }
        }
        else
        {
          ((void (*)(void (**)(id, void), void *, void))v33[2])(v33, &__NSDictionary0__struct, 0);
          id v11 = 0;
        }
      }
    }
  }
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
}

- (void)metadataForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  int64_t v8 = +[RMLog storeController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MetadataForStoreIdentifier in store %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [(RMStoreController *)self context];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100070074;
  uint64_t v24 = sub_100070084;
  id v25 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100070074;
  id v19 = sub_100070084;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100077CFC;
  v11[3] = &unk_1000C5468;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p_long long buf = &buf;
  id v14 = &v15;
  [v9 performBlockAndWait:v11];
  v7[2](v7, v16[5], *(void *)(*((void *)&buf + 1) + 40));

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)metadataValueForKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = +[RMLog storeController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MetadataValueForKey with key %{public}@ in store %{public}@...", buf, 0x16u);
  }

  id v12 = [(RMStoreController *)self context];
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v27 = sub_100070074;
  uint64_t v28 = sub_100070084;
  id v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100070074;
  uint64_t v24 = sub_100070084;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100078228;
  v15[3] = &unk_1000C6D78;
  v15[4] = self;
  id v13 = v9;
  id v16 = v13;
  id v18 = buf;
  id v14 = v8;
  id v17 = v14;
  id v19 = &v20;
  [v12 performBlockAndWait:v15];
  v10[2](v10, v21[5], *(void *)(*(void *)&buf[8] + 40));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(buf, 8);
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4 storeIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  id v14 = +[RMLog storeController];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SetMetadataValue with key %{public}@ in store %{public}@...", buf, 0x16u);
  }

  uint64_t v15 = [(RMStoreController *)self context];
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v27 = sub_100070074;
  uint64_t v28 = sub_100070084;
  id v29 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000786B0;
  v20[3] = &unk_1000C6DA0;
  v20[4] = self;
  id v16 = v12;
  id v21 = v16;
  id v25 = buf;
  id v17 = v11;
  id v22 = v17;
  id v18 = v10;
  id v23 = v18;
  id v19 = v15;
  id v24 = v19;
  [v19 performBlockAndWait:v20];
  v13[2](v13, *(void *)(*(void *)&buf[8] + 40));

  _Block_object_dispose(buf, 8);
}

- (id)_observerStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v10 = 0;
  v5 = [(RMStoreController *)self _managementSourceWithIdentifier:a3 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (v5)
  {
    id v8 = +[RMObserverStore storeFromManagementSource:v5];
  }
  else
  {
    id v8 = 0;
    if (a4 && v6)
    {
      id v8 = 0;
      *a4 = v6;
    }
  }

  return v8;
}

- (id)_providerStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v10 = 0;
  v5 = [(RMStoreController *)self _managementSourceWithIdentifier:a3 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (v5)
  {
    id v8 = +[RMProviderStore storeFromManagementSource:v5];
  }
  else
  {
    id v8 = 0;
    if (a4 && v6)
    {
      id v8 = 0;
      *a4 = v6;
    }
  }

  return v8;
}

- (id)_subscriberStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v10 = 0;
  v5 = [(RMStoreController *)self _managementSourceWithIdentifier:a3 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (v5)
  {
    id v8 = +[RMSubscriberStore storeFromManagementSource:v5];
  }
  else
  {
    id v8 = 0;
    if (a4 && v6)
    {
      id v8 = 0;
      *a4 = v6;
    }
  }

  return v8;
}

- (id)_managementSourceWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[RMManagementSource fetchRequestWithIdentifier:v5];
  id v15 = 0;
  id v7 = [v6 execute:&v15];
  id v8 = v15;
  if (v7)
  {
    if ([v7 count])
    {
      id v9 = [v7 objectAtIndexedSubscript:0];
    }
    else
    {
      id v11 = +[RMLog storeController];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10007B7EC();
      }

      if (a4)
      {
        id v12 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v5];
        id v13 = v12;
        if (v12) {
          *a4 = v12;
        }
      }
      id v9 = 0;
    }
  }
  else
  {
    id v10 = +[RMLog storeController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10007B784();
    }

    id v9 = 0;
    if (a4 && v8)
    {
      id v9 = 0;
      *a4 = v8;
    }
  }

  return v9;
}

- (id)_allManagementSourcesReturningError:(id *)a3
{
  id v4 = +[RMManagementSource fetchRequest];
  id v19 = 0;
  id v5 = [v4 execute:&v19];
  id v6 = v19;
  if (v5)
  {
    id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "addObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v13 = +[RMLog storeController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10001C3E0();
    }

    id v7 = 0;
    if (a3 && v6)
    {
      id v7 = 0;
      *a3 = v6;
    }
  }

  return v7;
}

- (void)_addOptionsToManagementSource:(id)a3 options:(id)a4
{
  uint64_t v5 = RMStoreOptionName;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 objectForKeyedSubscript:v5];
  [v7 setName:v8];

  id v9 = [v6 objectForKeyedSubscript:RMStoreOptionDescription];
  [v7 setStoreDescription:v9];

  id v10 = [v6 objectForKeyedSubscript:RMStoreOptionAccountIdentifier];
  [v7 setAccountIdentifier:v10];

  id v11 = [v6 objectForKeyedSubscript:RMStoreOptionPersonaIdentifier];

  [v7 setPersonaIdentifier:v11];
}

- (id)_declarationsForStoreIdentifier:(id)a3 declarationTypes:(id)a4 identifier:(id)a5 error:(id *)a6
{
  id v26 = a4;
  id v25 = a5;
  id v32 = 0;
  id v10 = [(RMStoreController *)self _managementSourceWithIdentifier:a3 error:&v32];
  id v11 = v32;
  id v12 = v11;
  if (v10)
  {
    id v13 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    id v14 = +[NSArray arrayWithObjects:v33 count:4];
    id v15 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v15)
    {
      id v16 = v15;
      id v24 = a6;
      uint64_t v17 = *(void *)v29;
      while (2)
      {
        long long v18 = 0;
        id v19 = v12;
        do
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v18);
          id v27 = v19;
          id v21 = -[RMStoreController _declarationsOfClass:managementSource:declarationTypes:identifier:error:](self, "_declarationsOfClass:managementSource:declarationTypes:identifier:error:", v20, v10, v26, v25, &v27, v24);
          id v12 = v27;

          if (!v21)
          {
            if (v24 && v12) {
              *id v24 = v12;
            }

            id v22 = 0;
            goto LABEL_15;
          }
          [v13 addObjectsFromArray:v21];

          long long v18 = (char *)v18 + 1;
          id v19 = v12;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v22 = v13;
LABEL_15:
  }
  else
  {
    id v22 = 0;
    if (a6 && v11)
    {
      id v12 = v11;
      id v22 = 0;
      *a6 = v12;
    }
  }

  return v22;
}

- (id)_declarationsOfClass:(Class)a3 managementSource:(id)a4 declarationTypes:(id)a5 identifier:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0)
  {
    id v14 = [(objc_class *)a3 fetchRequest];
    if (v12)
    {
      CFStringRef v34 = @"declarationType";
      id v36 = v12;
      CFStringRef v15 = @"(%K == %@) && ((%K == %d) || (%K == %d)) && (%K in %@)";
    }
    else
    {
      if (!v13)
      {
        +[NSPredicate predicateWithFormat:@"(%K == %@) && ((%K == %d) || (%K == %d))", @"managementSource", v11, @"loadState", 1, @"loadState", 4, v33, v35];
        goto LABEL_10;
      }
      CFStringRef v34 = @"identifier";
      id v36 = v13;
      CFStringRef v15 = @"(%K == %@) && ((%K == %d) || (%K == %d)) && (%K == %@)";
    }
    +[NSPredicate predicateWithFormat:v15, @"managementSource", v11, @"loadState", 1, @"loadState", 4, v34, v36];
    id v16 = LABEL_10:;
    [v14 setPredicate:v16];

    id v47 = 0;
    uint64_t v17 = [v14 execute:&v47];
    id v18 = v47;
    if (v17)
    {
      id v39 = v13;
      id v40 = v12;
      id v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v17 count]);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v38 = v17;
      id obj = v17;
      id v20 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v20)
      {
        id v21 = v20;
        long long v37 = a7;
        uint64_t v22 = *(void *)v44;
        while (2)
        {
          id v23 = 0;
          id v24 = v18;
          do
          {
            if (*(void *)v44 != v22) {
              objc_enumerationMutation(obj);
            }
            id v25 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)v23) payload];
            id v42 = v24;
            id v26 = +[RMModelDeclarationBase loadData:v25 serializationType:0 error:&v42];
            id v18 = v42;

            if (!v26)
            {
              long long v28 = +[RMLog storeController];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                sub_10007B8C0();
              }

              id v13 = v39;
              id v12 = v40;
              uint64_t v17 = v38;
              if (v37 && v18) {
                *long long v37 = v18;
              }

              id v27 = 0;
              goto LABEL_26;
            }
            [v19 addObject:v26];

            id v23 = (char *)v23 + 1;
            id v24 = v18;
          }
          while (v21 != v23);
          id v21 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      id v27 = v19;
      id v12 = v40;
      id v13 = v39;
      uint64_t v17 = v38;
LABEL_26:
    }
    else
    {
      long long v29 = +[RMLog storeController];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        sub_10007B858();
      }

      id v27 = 0;
      if (a7 && v18)
      {
        id v18 = v18;
        id v27 = 0;
        *a7 = v18;
      }
    }

    goto LABEL_33;
  }
  long long v31 = +[RMLog storeController];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_10007B94C(a3);
  }

  if (a7)
  {
    id v32 = +[RMErrorUtilities createInternalError];
    id v14 = v32;
    if (v32)
    {
      id v14 = v32;
      id v27 = 0;
      *a7 = v14;
    }
    else
    {
      id v27 = 0;
    }
LABEL_33:

    goto LABEL_34;
  }
  id v27 = 0;
LABEL_34:

  return v27;
}

- (id)_activeConfigurationsAndAssetsForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 error:(id *)a5
{
  return [(RMStoreController *)self _activeConfigurationsForConfigurationTypes:a3 storeIdentifier:a4 includeAssets:1 error:a5];
}

- (id)_activeConfigurationsOnlyForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 error:(id *)a5
{
  return [(RMStoreController *)self _activeConfigurationsForConfigurationTypes:a3 storeIdentifier:a4 includeAssets:0 error:a5];
}

- (id)_activeConfigurationsForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 includeAssets:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v35 = 0;
  id v11 = [(RMStoreController *)self _managementSourceWithIdentifier:a4 error:&v35];
  id v12 = v35;
  id v13 = v12;
  if (v11)
  {
    BOOL v28 = v7;
    id v29 = v12;
    id v14 = [RMConfigurationQuerier alloc];
    CFStringRef v15 = [(RMStoreController *)self persistentContainer];
    id v16 = [(RMConfigurationQuerier *)v14 initWithPersistentContainer:v15];

    id v30 = v10;
    uint64_t v17 = [v10 allObjects];
    id v18 = [v11 identifier];
    id v19 = [(RMConfigurationQuerier *)v16 activeConfigurationsByTypeForTypes:v17 managementSourceIdentifier:v18 error:a6];

    id v20 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = [v19 allValues];
    id v22 = [v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          [v20 addObjectsFromArray:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        }
        id v23 = [v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v23);
    }

    id v26 = [(RMStoreController *)self _buildFlattenedConfigurations:v20 includeAssets:v28 error:a6];

    id v13 = v29;
    id v10 = v30;
  }
  else
  {
    id v26 = 0;
    if (a6 && v12)
    {
      id v26 = 0;
      *a6 = v12;
    }
  }

  return v26;
}

- (id)_activeConfigurationsForStoreIdentifier:(id)a3 error:(id *)a4
{
  id v16 = 0;
  id v6 = [(RMStoreController *)self _managementSourceWithIdentifier:a3 error:&v16];
  id v7 = v16;
  id v8 = v7;
  if (v6)
  {
    id v9 = [RMConfigurationQuerier alloc];
    id v10 = [(RMStoreController *)self persistentContainer];
    id v11 = [(RMConfigurationQuerier *)v9 initWithPersistentContainer:v10];

    id v12 = [v6 identifier];
    id v13 = [(RMConfigurationQuerier *)v11 activeConfigurationsForManagementSourceIdentifier:v12 error:a4];

    id v14 = [(RMStoreController *)self _buildFlattenedConfigurations:v13 includeAssets:0 error:a4];
  }
  else
  {
    id v14 = 0;
    if (a4 && v7)
    {
      id v14 = 0;
      *a4 = v7;
    }
  }

  return v14;
}

- (id)_configurationsWithVisibleUIForConfigurationTypes:(id)a3 managementSource:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [RMConfigurationQuerier alloc];
  long long v33 = self;
  id v11 = [(RMStoreController *)self persistentContainer];
  id v12 = [(RMConfigurationQuerier *)v10 initWithPersistentContainer:v11];

  id v36 = v8;
  id v13 = [v8 allObjects];
  id v35 = v9;
  id v14 = [v9 identifier];
  long long v32 = v12;
  long long v34 = a5;
  CFStringRef v15 = [(RMConfigurationQuerier *)v12 configurationUIsByTypeForTypes:v13 managementSourceIdentifier:v14 error:a5];

  id v41 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v31 = v15;
  id obj = [v15 allValues];
  id v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v47;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v16;
        uint64_t v17 = *(void **)(*((void *)&v46 + 1) + 8 * v16);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v18 = v17;
        id v19 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v43;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v43 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              uint64_t v24 = [v23 channel];
              id v25 = [v24 identifier];
              id v26 = [v23 identifier];
              id v27 = [v23 serverToken];
              unsigned int v28 = +[RMConfigurationStatusArchiver validStatusForStoreIdentifier:v25 declarationIdentifier:v26 serverToken:v27];

              if (v28) {
                [v41 addObject:v23];
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v20);
        }

        uint64_t v16 = v40 + 1;
      }
      while ((id)(v40 + 1) != v39);
      id v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v39);
  }

  id v29 = [(RMStoreController *)v33 _buildFlattenedConfigurations:v41 includeAssets:1 error:v34];

  return v29;
}

- (id)_buildFlattenedConfigurations:(id)a3 includeAssets:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  if (v5)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v52;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v52 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v51 + 1) + 8 * i) assetByIdentifier];
          id v14 = v13;
          if (v13)
          {
            CFStringRef v15 = [v13 allValues];
            [v7 addObjectsFromArray:v15];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v10);
    }
  }
  uint64_t v40 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v6 count] + (void)objc_msgSend(v7, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v47 objects:v56 count:16];
  id obj = v16;
  if (v17)
  {
    id v18 = v17;
    id v19 = 0;
    uint64_t v20 = *(void *)v48;
    while (2)
    {
      uint64_t v21 = 0;
      id v22 = v19;
      do
      {
        if (*(void *)v48 != v20) {
          objc_enumerationMutation(obj);
        }
        id v23 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)v21) content];
        id v46 = v22;
        uint64_t v24 = +[RMModelDeclarationBase loadData:v23 serializationType:0 error:&v46];
        id v19 = v46;

        if (!v24)
        {
          id v25 = +[RMLog storeController];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_10007BA5C();
          }

          id v26 = obj;
          if (a5 && v19) {
            *a5 = v19;
          }

LABEL_43:
          id v34 = 0;
          goto LABEL_44;
        }
        [v40 addObject:v24];

        uint64_t v21 = (char *)v21 + 1;
        id v22 = v19;
      }
      while (v18 != v21);
      id v16 = obj;
      id v18 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v19 = 0;
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v38 = v7;
  id v27 = [v38 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v43;
    while (2)
    {
      id v30 = 0;
      long long v31 = v19;
      do
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v38);
        }
        long long v32 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)v30) content];
        id v41 = v31;
        long long v33 = +[RMModelDeclarationBase loadData:v32 serializationType:0 error:&v41];
        id v19 = v41;

        if (!v33)
        {
          id v35 = +[RMLog storeController];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_10007B9D0();
          }

          id v26 = obj;
          if (a5 && v19) {
            *a5 = v19;
          }

          goto LABEL_43;
        }
        [v40 addObject:v33];

        id v30 = (char *)v30 + 1;
        long long v31 = v19;
      }
      while (v28 != v30);
      id v28 = [v38 countByEnumeratingWithState:&v42 objects:v55 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

  id v34 = v40;
  id v26 = obj;
LABEL_44:

  return v34;
}

- (id)_payloadsForDeclarationIdentifier:(id)a3 managementSource:(id)a4 error:(id *)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  id v10 = +[NSArray arrayWithObjects:v28 count:4];
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v21 = a5;
    id v13 = 0;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      CFStringRef v15 = 0;
      id v16 = v13;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v15);
        id v23 = v16;
        id v18 = [(RMStoreController *)self _payloadsForPayloadClass:v17 identifier:v22 managementSource:v8 error:&v23];
        id v13 = v23;

        if (!v18)
        {
          if (v21 && v13) {
            *uint64_t v21 = v13;
          }

          id v19 = 0;
          goto LABEL_16;
        }
        [v9 addObjectsFromArray:v18];

        CFStringRef v15 = (char *)v15 + 1;
        id v16 = v13;
      }
      while (v12 != v15);
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }

  id v19 = v9;
LABEL_16:

  return v19;
}

- (id)_payloadsForPayloadClass:(Class)a3 identifier:(id)a4 managementSource:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0)
  {
    id v11 = [(objc_class *)a3 fetchRequest];
    id v12 = +[NSPredicate predicateWithFormat:@"(%K == %@) && (%K == %@)", @"managementSource", v10, @"identifier", v9];
    [v11 setPredicate:v12];

    CFStringRef v22 = @"declarationType";
    id v13 = +[NSArray arrayWithObjects:&v22 count:1];
    [v11 setPropertiesToFetch:v13];

    id v21 = 0;
    uint64_t v14 = [v11 execute:&v21];
    id v15 = v21;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      uint64_t v17 = +[RMLog storeController];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10007B3FC();
      }

      if (a6 && v15) {
        *a6 = v15;
      }
    }

    goto LABEL_13;
  }
  id v19 = +[RMLog storeController];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10007B94C(a3);
  }

  if (a6)
  {
    uint64_t v20 = +[RMErrorUtilities createInternalError];
    id v11 = v20;
    if (v20)
    {
      id v11 = v20;
      uint64_t v14 = 0;
      *a6 = v11;
    }
    else
    {
      uint64_t v14 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v14 = 0;
LABEL_14:

  return v14;
}

- (id)_newPayloadWithDeclaration:(id)a3 managementSource:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_4:
    id v12 = [v8 managedObjectContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = &off_1000C4708;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = &off_1000C4738;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = &off_1000C4718;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v20 = +[RMLog storeController];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_10007BB54();
            }

            if (a5)
            {
              id v21 = +[RMErrorUtilities createInternalError];
              CFStringRef v22 = v21;
              if (v21) {
                *a5 = v21;
              }
            }
            id v15 = 0;
            id v9 = 0;
            uint64_t v14 = 0;
            goto LABEL_30;
          }
          id v13 = &off_1000C47F8;
        }
      }
    }
    id v15 = [objc_alloc(*v13) initWithContext:v12];
    [v15 setManagementSource:v8];
    id v16 = [v7 declarationIdentifier];
    [v15 setIdentifier:v16];

    uint64_t v17 = [v7 declarationServerToken];
    [v15 setServerToken:v17];

    id v24 = 0;
    unsigned __int8 v18 = [v15 loadPayload:v7 error:&v24];
    id v9 = v24;
    if (v18)
    {
      id v15 = v15;
      uint64_t v14 = v15;
    }
    else
    {
      id v19 = +[RMLog storeController];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10007BAE8();
      }

      uint64_t v14 = 0;
      if (a5 && v9)
      {
        id v9 = v9;
        uint64_t v14 = 0;
        *a5 = v9;
      }
    }
LABEL_30:

    goto LABEL_31;
  }
  id v9 = [v7 serializeWithType:0];
  id v25 = 0;
  uint64_t v10 = +[RMModelDeclarationBase load:v9 serializationType:0 error:&v25];
  id v11 = v25;

  if (v10)
  {

    id v7 = (id)v10;
    goto LABEL_4;
  }
  uint64_t v14 = 0;
  if (a5 && v11)
  {
    id v7 = v11;
    uint64_t v14 = 0;
    *a5 = v7;
  }
  else
  {
    id v7 = v11;
  }
LABEL_31:

  return v14;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (NSMutableDictionary)clientByIdentifier
{
  return self->_clientByIdentifier;
}

- (void)setClientByIdentifier:(id)a3
{
}

- (RMDebounceTimer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_clientByIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end