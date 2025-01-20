@interface PDPassSignalManager
- (BOOL)_isFeatureEnabled;
- (PDPassSignalManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4;
- (id)_createEventPassContentForSemantics:(id)a3;
- (id)_createPassInstanceForPassUniqueID:(id)a3 semantics:(id)a4;
- (id)_descriptors;
- (void)_peformIncrementalSetDonationAction:(int64_t)a3 pass:(id)a4 completion:(id)a5;
- (void)_performFullSetDonation:(id)a3 withCompletion:(id)a4;
- (void)_queue_updateVersion:(double)a3;
- (void)donateAllPassSignalsIfNeccessaryWithCompletion:(id)a3;
- (void)donateSignalForPass:(id)a3 completion:(id)a4;
- (void)removeAllPassSignalsWithCompletion:(id)a3;
- (void)removeSignalForPass:(id)a3 completion:(id)a4;
@end

@implementation PDPassSignalManager

- (PDPassSignalManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PDPassSignalManager;
  v9 = [(PDPassSignalManager *)&v15 init];
  if (v9)
  {
    uint64_t v10 = PDUtilityQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_databaseManager, a3);
    objc_storeStrong((id *)&v9->_webServiceCoordinator, a4);
    v12 = +[NSUserDefaults standardUserDefaults];
    [v12 doubleForKey:@"PDPassSignalManagerVersion"];
    v9->_currentVersion = v13 + 1.0;
  }
  return v9;
}

- (void)donateAllPassSignalsIfNeccessaryWithCompletion:(id)a3
{
  id v4 = a3;
  if (PKCascadeIntegrationEnabled()
    && [(PDPassSignalManager *)self _isFeatureEnabled]
    && (+[PKWalletVisibility isWalletVisible] & 1) != 0)
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001FC730;
    v6[3] = &unk_10072FDC8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)donateSignalForPass:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v6 = (void (**)(id, void))a4;
  if (PKCascadeIntegrationEnabled()
    && [(PDPassSignalManager *)self _isFeatureEnabled]
    && (+[PKWalletVisibility isWalletVisible] & 1) != 0)
  {
    [(PDPassSignalManager *)self _peformIncrementalSetDonationAction:0 pass:v7 completion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)removeSignalForPass:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v6 = (void (**)(id, void))a4;
  if (PKCascadeIntegrationEnabled()) {
    [(PDPassSignalManager *)self _peformIncrementalSetDonationAction:1 pass:v7 completion:v6];
  }
  else {
    v6[2](v6, 0);
  }
}

- (void)removeAllPassSignalsWithCompletion:(id)a3
{
  id v4 = a3;
  if (PKCascadeIntegrationEnabled())
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001FCC20;
    v6[3] = &unk_10072FDC8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_peformIncrementalSetDonationAction:(int64_t)a3 pass:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 uniqueID];
  v11 = [v8 allSemantics];
  v12 = [(PDPassSignalManager *)self _createPassInstanceForPassUniqueID:v10 semantics:v11];

  if (v12)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001FD274;
    block[3] = &unk_10073FD58;
    block[4] = self;
    int64_t v18 = a3;
    id v15 = v8;
    id v17 = v9;
    id v16 = v12;
    dispatch_async(queue, block);
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

- (void)_performFullSetDonation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FD834;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_queue_updateVersion:(double)a3
{
  self->_currentVersion = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setInteger:(uint64_t)a3 forKey:@"PDPassSignalManagerVersion"];
}

- (id)_descriptors
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = PKPassKitCoreBundle();
  id v4 = [v3 bundleIdentifier];

  id v18 = 0;
  v5 = +[CCSetDescriptor sourceIdentifierWithValue:v4 error:&v18];
  id v6 = v18;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    [v2 addObject:v5];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to build required source bundle identifier descriptor from donation bundle %@ with error %@", buf, 0x16u);
    }
  }
  id v10 = +[NSLocale currentLocale];
  v11 = [v10 localeIdentifier];
  id v17 = v7;
  id v12 = +[CCSetDescriptor localeIdentifierWithValue:v11 error:&v17];
  id v13 = v17;

  if (!v12 || v13)
  {
    v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to build required locale descriptor from donation bundle %@ with error %@", buf, 0x16u);
    }
  }
  else
  {
    [v2 addObject:v12];
  }
  id v15 = [v2 copy];

  return v15;
}

- (id)_createPassInstanceForPassUniqueID:(id)a3 semantics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (v7 && [v7 count])
  {
    id v20 = 0;
    id v9 = [objc_alloc((Class)CCWalletPassMetaContent) initWithSourceItemIdentifier:v6 error:&v20];
    id v10 = v20;
    id v11 = objc_alloc((Class)CCWalletPassContent);
    id v12 = [(PDPassSignalManager *)self _createEventPassContentForSemantics:v8];
    id v19 = v10;
    id v13 = [v11 initWithPassUniqueIdentifier:v6 eventContent:v12 error:&v19];
    id v14 = v19;

    id v18 = v14;
    id v15 = [objc_alloc((Class)CCItemInstance) initWithContent:v13 metaContent:v9 error:&v18];
    id v16 = v18;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_createEventPassContentForSemantics:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)CCWalletPassEventContent);
  v25 = [v3 objectForKey:PKPassSemanticStringsKeyArtistIDs];
  v26 = [v25 stringsValue];
  v24 = [v3 objectForKey:PKPassSemanticStringKeyAwayTeamAbbreviation];
  v5 = [v24 stringValue];
  v23 = [v3 objectForKey:PKPassSemanticStringKeyAwayTeamName];
  id v6 = [v23 stringValue];
  id v22 = [v3 objectForKey:PKPassSemanticStringKeyEventName];
  id v7 = [v22 stringValue];
  __int16 v21 = [v3 objectForKey:PKPassSemanticStringKeyEventType];
  id v18 = [v21 stringValue];
  id v20 = [v3 objectForKey:PKPassSemanticStringKeyGenre];
  id v16 = [v20 stringValue];
  id v19 = [v3 objectForKey:PKPassSemanticStringKeyHomeTeamAbbreviation];
  BOOL v8 = [v19 stringValue];
  id v9 = [v3 objectForKey:PKPassSemanticStringKeyHomeTeamName];
  id v10 = [v9 stringValue];
  id v11 = [v3 objectForKey:PKPassSemanticStringsKeyPerformerNames];

  id v12 = [v11 stringsValue];
  id v27 = 0;
  id v17 = [v4 initWithArtistIDs:v26 awayTeamAbbreviation:v5 awayTeamName:v6 eventName:v7 eventType:v18 genre:v16 homeTeamAbbreviation:v8 homeTeamName:v10 performerNames:v12 error:&v27];
  id v15 = v27;

  if (v15 || !v17)
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to build event pass content with error %@", buf, 0xCu);
    }
  }
  return v17;
}

- (BOOL)_isFeatureEnabled
{
  id v2 = [(PDPaymentWebServiceCoordinator *)self->_webServiceCoordinator sharedWebService];
  id v3 = [v2 supportedRegionFeatureOfType:18 didFailOSVersionRequirements:0];
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 isIntegrationTypeSupported:3];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end