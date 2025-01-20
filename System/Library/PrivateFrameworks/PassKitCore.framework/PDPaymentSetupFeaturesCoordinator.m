@interface PDPaymentSetupFeaturesCoordinator
- (BOOL)_productsNeedUpdating:(id *)a3 ignoreCache:(BOOL *)a4;
- (PDAccountManager)accountManager;
- (PDPaymentSetupFeaturesCoordinator)initWithWebService:(id)a3 webServiceQueue:(id)a4 databaseManager:(id)a5 paymentWebServiceCoordinator:(id)a6 accountManager:(id)a7 familyCircleManager:(id)a8 discoveryManager:(id)a9;
- (PDUserNotificationManager)userNotificationManager;
- (id)_paymentSetupFeaturesForFilteredProducts:(id)a3;
- (id)_staticAvailableProductsRequest:(BOOL *)a3;
- (void)_applyRegionFilteringAndAgeCheckToProductsResponse:(id)a3 completion:(id)a4;
- (void)_cachedPaymentSetupFeaturesForSourceApplicationID:(id)a3 useStaticContent:(BOOL)a4 blockServerFetch:(BOOL)a5 completion:(id)a6;
- (void)_fetchAccountFeaturesWithSupportedFeatureIdentifiers:(id)a3 paymentSetupFeatures:(id)a4 completion:(id)a5;
- (void)_fetchPaymentSetupFeaturesForSourceApplicationID:(id)a3 useStaticContent:(BOOL)a4 blockServerFetch:(BOOL)a5 completion:(id)a6;
- (void)_notificationForNewProduct:(id)a3 oldProduct:(id)a4;
- (void)_performProductActionRequest:(id)a3 completion:(id)a4;
- (void)_processPaymentSetupProductsResponse:(id)a3 completion:(id)a4;
- (void)_productsWithRequest:(id)a3 completion:(id)a4;
- (void)_removeNotificationForProduct:(id)a3;
- (void)_runNextProductsRequest;
- (void)_storeServerPaymentSetupFeatures:(id)a3 productsResponse:(id)a4 isStaticContent:(BOOL)a5 priorDirtyStateIdentifier:(id)a6;
- (void)clearPaymentSetupFeatures;
- (void)handleWebServiceRequest:(id)a3 completion:(id)a4;
- (void)hasCachedPaymentSetupFeatures:(id)a3;
- (void)markProductsDirty;
- (void)paymentSetupFeaturesForSourceApplicationID:(id)a3 completion:(id)a4;
- (void)performProductActionRequest:(id)a3 completion:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)productsWithRequest:(id)a3 completion:(id)a4;
- (void)scheduleStaticPaymentSetupFeaturesCacheUpdateWithInterval:(double)a3;
- (void)scheduleStaticPaymentSetupFeaturesFetchForSourceApplicationID:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)staticFilteredProductsWithDiagnosticReason:(id)a3 completion:(id)a4;
- (void)staticPaymentSetupFeaturesForSourceApplicationID:(id)a3 blockServerFetch:(BOOL)a4 completion:(id)a5;
- (void)unscheduleStaticPaymentSetupFeaturesCacheUpdate;
@end

@implementation PDPaymentSetupFeaturesCoordinator

- (PDPaymentSetupFeaturesCoordinator)initWithWebService:(id)a3 webServiceQueue:(id)a4 databaseManager:(id)a5 paymentWebServiceCoordinator:(id)a6 accountManager:(id)a7 familyCircleManager:(id)a8 discoveryManager:(id)a9
{
  id v15 = a3;
  id v43 = a4;
  id v42 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  v48.receiver = self;
  v48.super_class = (Class)PDPaymentSetupFeaturesCoordinator;
  v19 = [(PDPaymentSetupFeaturesCoordinator *)&v48 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_webService, a3);
    objc_storeStrong((id *)&v20->_webServiceQueue, a4);
    objc_storeStrong((id *)&v20->_databaseManager, a5);
    objc_storeWeak((id *)&v20->_paymentWebServiceCoordinator, v16);
    objc_storeStrong((id *)&v20->_familyCircleManager, a8);
    objc_storeStrong((id *)&v20->_discoveryManager, a9);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.passd.PDPaymentSetupFeaturesCoordinator.reply", v21);
    replyQueue = v20->_replyQueue;
    v20->_replyQueue = (OS_dispatch_queue *)v22;

    v24 = &dispatch_get_global_queue_ptr;
    if (PDPaymentSetupFeaturesAreDirty())
    {
      v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: PDPaymentSetupFeaturesDirty is dirty due to locale has changed", buf, 2u);
      }

      PDSetPaymentSetupFeaturesAreDirty();
    }
    else
    {
      v26 = [(PDDatabaseManager *)v20->_databaseManager paymentSetupFeatures];
      v27 = [v26 allObjects];

      if ([v27 count])
      {
        id v41 = v15;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v28 = v27;
        id v29 = [v28 countByEnumeratingWithState:&v44 objects:v51 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v45;
          while (2)
          {
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v45 != v31) {
                objc_enumerationMutation(v28);
              }
              if ([*(id *)(*((void *)&v44 + 1) + 8 * i) productType])
              {

                v24 = &dispatch_get_global_queue_ptr;
                v34 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v28];
                p_super = &v20->_paymentSetupFeatures->super.super;
                v20->_paymentSetupFeatures = v34;
                id v15 = v41;
                goto LABEL_19;
              }
            }
            id v30 = [v28 countByEnumeratingWithState:&v44 objects:v51 count:16];
            if (v30) {
              continue;
            }
            break;
          }
        }

        p_super = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v28;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Invalid payment setup features from database, ignoring: %@", buf, 0xCu);
        }
        id v15 = v41;
        v24 = &dispatch_get_global_queue_ptr;
LABEL_19:
      }
    }
    v35 = (NSMutableArray *)objc_alloc_init((Class)v24[501]);
    pendingProductRequests = v20->_pendingProductRequests;
    v20->_pendingProductRequests = v35;

    v37 = (NSMutableArray *)objc_alloc_init((Class)v24[501]);
    pendingPaymentSetupFeatureBlocks = v20->_pendingPaymentSetupFeatureBlocks;
    v20->_pendingPaymentSetupFeatureBlocks = v37;

    v39 = PDDefaultQueue();
    PDScheduledActivityClientRegister();
  }
  return v20;
}

- (void)paymentSetupFeaturesForSourceApplicationID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    webServiceQueue = self->_webServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002F7B84;
    block[3] = &unk_1007315D8;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(webServiceQueue, block);
  }
}

- (void)scheduleStaticPaymentSetupFeaturesCacheUpdateWithInterval:(double)a3
{
  if (a3 >= 43200.0)
  {
    v5 = PDScheduledActivityGetCriteria();
    v4 = v5;
    if (v5)
    {
      [v5 repeatInterval];
      double v7 = v6;
      v8 = PKLogFacilityTypeGetObject();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7 == a3)
      {
        if (v9)
        {
          int v12 = 134217984;
          double v13 = a3;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping scheduling prefetch for PDStaticPaymentSetupFeaturesCacheUpdateActivityIdentifier. Activity already exists with interval %f.", (uint8_t *)&v12, 0xCu);
        }
LABEL_14:

        goto LABEL_15;
      }
      if (v9)
      {
        int v12 = 134217984;
        double v13 = a3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing prefetch activity with interval %f for PDStaticPaymentSetupFeaturesCacheUpdateActivityIdentifier.", (uint8_t *)&v12, 0xCu);
      }

      PDScheduledActivityRemove();
    }
    v8 = +[NSDate dateWithTimeIntervalSinceNow:(double)arc4random_uniform(0xA8C0u)];
    v10 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v8];
    [v10 setRequireNetworkConnectivity:1];
    [v10 setRequireScreenSleep:1];
    [v10 setRequireMainsPower:1];
    [v10 setRepeating:1];
    [v10 setRepeatInterval:a3];
    [v10 setReason:@"Scheduled Payment Setup Feature Cache Update"];
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1005170F0(v10);
    }

    PDScheduledActivityRegister();
    goto LABEL_14;
  }
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    double v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cache update internal for PDStaticPaymentSetupFeaturesCacheUpdateActivityIdentifier is too short, at %lf. This is likely a config error. Ignoring.", (uint8_t *)&v12, 0xCu);
  }
LABEL_15:
}

- (void)unscheduleStaticPaymentSetupFeaturesCacheUpdate
{
}

- (void)scheduleStaticPaymentSetupFeaturesFetchForSourceApplicationID:(id)a3
{
  id v3 = a3;
  v4 = PDScheduledActivityGetCriteria();
  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity already exists for PDFetchStaticPaymentSetupFeaturesActivityIdentifier, not scheduling.", v8, 2u);
    }
  }
  else
  {
    double v6 = +[NSDate dateWithTimeIntervalSinceNow:(double)arc4random_uniform(0xA8C0u)];
    v5 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v6];

    [v5 setRepeating:0];
    [v5 setRequireNetworkConnectivity:1];
    [v5 setRequireMainsPower:0];
    [v5 setRequireScreenSleep:0];
    [v5 setReason:v3];
    double v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100517178(v5);
    }

    PDScheduledActivityRegister();
  }
}

- (void)staticPaymentSetupFeaturesForSourceApplicationID:(id)a3 blockServerFetch:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    [(PDPaymentSetupFeaturesCoordinator *)self _fetchPaymentSetupFeaturesForSourceApplicationID:a3 useStaticContent:1 blockServerFetch:a4 completion:a5];
  }
}

- (void)_fetchPaymentSetupFeaturesForSourceApplicationID:(id)a3 useStaticContent:(BOOL)a4 blockServerFetch:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void))a6;
  int v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: PDPaymentWebServiceCoordinator preparing payment setup features", buf, 2u);
  }

  if (+[PKWalletVisibility isWalletRestricted])
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Wallet is restricted, returning no supported features", buf, 2u);
    }

    v11[2](v11, 0);
  }
  else
  {
    id v13 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    *(void *)buf = 0;
    v39 = buf;
    uint64_t v40 = 0x3032000000;
    id v41 = sub_100020B4C;
    id v42 = sub_100021098;
    id v43 = 0;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1002F86EC;
    v37[3] = &unk_10072E5C0;
    v37[4] = self;
    [v13 addOperation:v37];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1002F87CC;
    v35[3] = &unk_100747EE0;
    BOOL v36 = a5;
    v35[4] = self;
    [v13 addOperation:v35];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1002F8A08;
    v32[3] = &unk_100730BC0;
    v32[4] = self;
    v34 = buf;
    id v15 = v14;
    id v33 = v15;
    [v13 addOperation:v32];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1002F8C88;
    v27[3] = &unk_100747F80;
    v27[4] = self;
    id v28 = v10;
    BOOL v30 = a4;
    BOOL v31 = a5;
    id v16 = v15;
    id v29 = v16;
    [v13 addOperation:v27];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1002F8F94;
    v24[3] = &unk_100736498;
    v26 = buf;
    v24[4] = self;
    id v17 = v16;
    id v25 = v17;
    [v13 addOperation:v24];
    id v18 = +[NSNull null];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002F9258;
    v21[3] = &unk_100747FA8;
    id v19 = v17;
    id v22 = v19;
    v23 = v11;
    id v20 = [v13 evaluateWithInput:v18 completion:v21];

    _Block_object_dispose(buf, 8);
  }
}

- (void)_fetchAccountFeaturesWithSupportedFeatureIdentifiers:(id)a3 paymentSetupFeatures:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accountManager = self->_accountManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002F9450;
  v15[3] = &unk_100747FF0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(PDAccountManager *)accountManager accountsForProvisioningWithCompletion:v15];
}

- (id)_staticAvailableProductsRequest:(BOOL *)a3
{
  v4 = [(PKPaymentWebService *)self->_webService supportedRegionFeatureOfType:14 didFailOSVersionRequirements:0];
  v5 = [v4 createProductsRequestWithIsFetchBlocked:a3];

  return v5;
}

- (void)_cachedPaymentSetupFeaturesForSourceApplicationID:(id)a3 useStaticContent:(BOOL)a4 blockServerFetch:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (v7)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v10;
      id v13 = "PDPaymentSetupFeaturesCoordinator: Server fetch blocked, returning cached payment setup features for: %@";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (!v8) {
    goto LABEL_13;
  }
  char v30 = 0;
  uint64_t v14 = [(PDPaymentSetupFeaturesCoordinator *)self _staticAvailableProductsRequest:&v30];
  id v15 = (id)v14;
  if (!v30)
  {
    if (v14)
    {
      id v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Getting cached static payment setup features for: %@", buf, 0xCu);
      }

      [v15 setSourceApplicationIdentifier:v10];
      webService = self->_webService;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1002F9DC4;
      v26[3] = &unk_100748018;
      id v27 = v10;
      id v28 = self;
      id v29 = v11;
      [(PKPaymentWebService *)webService availableCommonProductsWithRequest:v15 completion:v26];

      id v20 = v27;
LABEL_17:

      goto LABEL_22;
    }
LABEL_13:
    unsigned int v21 = [(PDPaymentSetupFeaturesCoordinator *)self _productsNeedUpdating:0 ignoreCache:0];
    id v12 = PKLogFacilityTypeGetObject();
    BOOL v22 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (!v21)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v10;
        id v13 = "PDPaymentSetupFeaturesCoordinator: Returning cached payment setup features for: %@";
        goto LABEL_20;
      }
LABEL_21:

      id v15 = [(NSMutableArray *)self->_paymentSetupFeatures copy];
      (*((void (**)(id, id))v11 + 2))(v11, v15);
      goto LABEL_22;
    }
    if (v22)
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Updating payment setup feature cache for: %@", buf, 0xCu);
    }

    id v15 = objc_alloc_init((Class)PKPaymentAvailableProductsRequest);
    [v15 setSourceApplicationIdentifier:v10];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1002F9FC8;
    v23[3] = &unk_100748040;
    v23[4] = self;
    id v24 = v10;
    id v25 = v11;
    [(PDPaymentSetupFeaturesCoordinator *)self handleWebServiceRequest:v15 completion:v23];

    id v20 = v24;
    goto LABEL_17;
  }
  id v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Static fetching disabled, returning cached payment setup features for: %@", buf, 0xCu);
  }

  id v17 = [(NSMutableArray *)self->_paymentSetupFeatures copy];
  (*((void (**)(id, id))v11 + 2))(v11, v17);

LABEL_22:
}

- (void)hasCachedPaymentSetupFeatures:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    webServiceQueue = self->_webServiceQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002FA1EC;
    v7[3] = &unk_10072E598;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(webServiceQueue, v7);
  }
}

- (void)productsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webServiceQueue = self->_webServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FA2FC;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(webServiceQueue, block);
}

- (void)staticFilteredProductsWithDiagnosticReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webServiceQueue = self->_webServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FA3D4;
  block[3] = &unk_1007315D8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(webServiceQueue, block);
}

- (void)performProductActionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webServiceQueue = self->_webServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FA720;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(webServiceQueue, block);
}

- (void)handleWebServiceRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(PDProductRequestTask);
  [(PDProductRequestTask *)v8 setRequest:v7];

  [(PDProductRequestTask *)v8 setCompletion:v6];
  [(NSMutableArray *)self->_pendingProductRequests addObject:v8];
  [(PDPaymentSetupFeaturesCoordinator *)self _runNextProductsRequest];
}

- (void)_runNextProductsRequest
{
  if (self->_isUpdatingProducts)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Waiting for current running products update to complete", buf, 2u);
    }
  }
  else
  {
    id v4 = [(NSMutableArray *)self->_pendingProductRequests firstObject];
    v2 = v4;
    if (v4)
    {
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      id v13 = sub_1002FAA88;
      id v14 = &unk_1007480B8;
      id v15 = self;
      v2 = v4;
      id v16 = v2;
      v5 = objc_retainBlock(&v11);
      self->_isUpdatingProducts = 1;
      id v6 = [v2 request];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(PDPaymentSetupFeaturesCoordinator *)self _productsWithRequest:v6 completion:v5];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(PDPaymentSetupFeaturesCoordinator *)self _performProductActionRequest:v6 completion:v5];
        }
        else
        {
          id v8 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = (objc_class *)objc_opt_class();
            id v10 = NSStringFromClass(v9);
            *(_DWORD *)buf = 138412290;
            id v18 = v10;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Error: unknown request class: %@ removing and running next request", buf, 0xCu);
          }
          ((void (*)(void ***, void, void))v5[2])(v5, 0, 0);
        }
      }
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Completed all product request tasks", buf, 2u);
      }
    }
  }
}

- (void)_performProductActionRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.product_action");
  webService = self->_webService;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002FACCC;
  v12[3] = &unk_100748018;
  v12[4] = self;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  [(PKPaymentWebService *)webService performProductActionRequest:v7 completion:v12];
}

- (void)_productsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.update_products");
  char v30 = 0;
  id v9 = [v6 cachePolicyOverride];
  if (v9 == (id)3)
  {
    id v10 = 0;
  }
  else
  {
    id v29 = 0;
    [(PDPaymentSetupFeaturesCoordinator *)self _productsNeedUpdating:&v29 ignoreCache:&v30];
    id v10 = v29;
    if (v30) {
      [v6 setCachePolicyOverride:1];
    }
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1002FB110;
  v24[3] = &unk_100748130;
  BOOL v11 = v9 == (id)3;
  BOOL v28 = v9 == (id)3;
  v24[4] = self;
  id v25 = v10;
  id v26 = v8;
  id v27 = v7;
  id v12 = v8;
  id v13 = v7;
  id v14 = v10;
  id v15 = objc_retainBlock(v24);
  webService = self->_webService;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002FB3B8;
  v19[3] = &unk_100748180;
  char v22 = v30;
  BOOL v23 = v11;
  v19[4] = self;
  id v20 = v6;
  id v21 = v15;
  id v17 = v15;
  id v18 = v6;
  [(PKPaymentWebService *)webService availableProductsWithRequest:v18 completion:v19];
}

- (void)_processPaymentSetupProductsResponse:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002FB6C8;
  v6[3] = &unk_1007346F0;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(PDPaymentSetupFeaturesCoordinator *)v7 _applyRegionFilteringAndAgeCheckToProductsResponse:a3 completion:v6];
}

- (void)_applyRegionFilteringAndAgeCheckToProductsResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = objc_alloc_init((Class)PKPaymentSetupProductModel);
  id v9 = [v6 JSONObject];
  [v8 updateWithPaymentSetupProductsResponse:v9 productsFilter:0 sectionsFilter:0];

  id v10 = +[PKAppleAccountManager sharedInstance];
  BOOL v11 = [v10 appleAccountInformation];
  id v12 = [v11 ageCategory];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = objc_msgSend(v8, "allSetupProducts", 0);
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v19 = (uint64_t)[v18 minimumSupportedAge];
        if (v19 < 18 || (BOOL v20 = 0, v12 != (id)2) && v12 != (id)4) {
          BOOL v20 = v19 < 13 || v12 != (id)1;
        }
        [v18 setMeetsAgeRequirements:v20];
      }
      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  char v22 = PKCurrentMobileCarrierRegion();
  BOOL v23 = [(PKPaymentWebService *)self->_webService targetDevice];
  id v24 = [v23 deviceRegion];

  id v25 = [v8 filteredPaymentSetupProductModel:self->_webService mobileCarrierRegion:v22 deviceRegion:v24 cardOnFiles:0];
  v7[2](v7, v25);
}

- (id)_paymentSetupFeaturesForFilteredProducts:(id)a3
{
  id v3 = a3;
  id v33 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    uint64_t v31 = *(void *)v35;
    id v32 = v4;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v10 = [v9 configuration];
        id v11 = [v10 state];
        if (PKPaymentSetupMergeProductsPartnersAPIEnabled()) {
          LODWORD(v12) = [v9 supportsProvisioningMethodForType:2];
        }
        else {
          unint64_t v12 = ((unint64_t)[v9 supportedProvisioningMethods] >> 1) & 1;
        }
        if (v12) {
          BOOL v13 = 0;
        }
        else {
          BOOL v13 = v11 == 0;
        }
        if (!v13)
        {
          id v14 = [v9 paymentOptions];
          id v15 = [v14 firstObject];

          [v15 cardType];
          uint64_t v16 = PKPaymentNetworkNameForPaymentCredentialType();
          if (v16) {
            BOOL v17 = 0;
          }
          else {
            BOOL v17 = v11 == 0;
          }
          if (!v17)
          {
            id v18 = PKPaymentTransitAppletFormatForPaymentNetwork();
            uint64_t v19 = [v9 supportedTransitNetworkIdentifiers];
            BOOL v20 = +[NSSet setWithArray:v19];

            if (![v20 count] && v18)
            {
              uint64_t v21 = +[NSSet setWithObject:v18];

              BOOL v20 = (void *)v21;
            }
            id v22 = objc_alloc_init((Class)PKPaymentSetupFeature);
            BOOL v23 = [v10 productIdentifier];
            [v22 setProductIdentifier:v23];

            id v24 = [v10 partnerIdentifier];
            [v22 setPartnerIdentifier:v24];

            objc_msgSend(v22, "setFeatureIdentifier:", objc_msgSend(v10, "featureIdentifier"));
            objc_msgSend(v22, "setProductType:", objc_msgSend(v10, "type"));
            objc_msgSend(v22, "setProductState:", objc_msgSend(v10, "state"));
            id v25 = [v10 notificationTitle];
            [v22 setNotificationTitle:v25];

            long long v26 = [v10 notificationMessage];
            [v22 setNotificationMessage:v26];

            long long v27 = [v10 discoveryCardIdentifier];
            [v22 setDiscoveryCardIdentifier:v27];

            [v22 setSupportedDevices:1];
            if ([v20 count])
            {
              [v22 setIdentifiers:v20];
              long long v28 = [v9 displayName];
              [v22 setLocalizedDisplayName:v28];

              [v22 setType:3];
              [v22 setState:1];
              [v22 setSupportedOptions:0];
            }
            [v33 addObject:v22];

            uint64_t v7 = v31;
            id v4 = v32;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v6);
  }

  id v29 = [v33 copy];
  return v29;
}

- (void)_storeServerPaymentSetupFeatures:(id)a3 productsResponse:(id)a4 isStaticContent:(BOOL)a5 priorDirtyStateIdentifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v96 = a6;
  id v11 = PKGetLastProductCacheUpdateTimestamp();
  v86 = v10;
  unint64_t v12 = [v10 timestamp];
  BOOL v13 = v12;
  if (v12 && (uint64_t)[v12 longValue] >= 1)
  {
    if (v11)
    {
      id v14 = [v11 longValue];
      if ((uint64_t)v14 >= (uint64_t)[v13 longValue])
      {
        v82 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v125 = v11;
          __int16 v126 = 2112;
          v127 = v13;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Skip updating product cache, last update timestamp: %@, product response timestamp: %@", buf, 0x16u);
        }
        goto LABEL_76;
      }
    }
    PKSetLastProductCacheUpdateTimestamp();
  }
  v84 = v13;
  v85 = v11;
  id v94 = objc_alloc_init((Class)NSMutableArray);
  id v89 = objc_alloc_init((Class)NSMutableArray);
  id v87 = objc_alloc_init((Class)NSMutableArray);
  id v97 = objc_alloc_init((Class)NSMutableArray);
  v99 = self;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obj = [(NSMutableArray *)self->_paymentSetupFeatures copy];
  id v15 = [obj countByEnumeratingWithState:&v120 objects:v136 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v121;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v121 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        if (![v9 count]) {
          goto LABEL_25;
        }
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = [v9 objectAtIndex:v20];
          id v22 = [v19 productIdentifier];
          BOOL v23 = [v21 productIdentifier];
          id v24 = v22;
          id v25 = v23;
          if (v24 == v25) {
            break;
          }
          long long v26 = v25;
          if (v24 && v25)
          {
            unsigned __int8 v27 = [v24 isEqualToString:v25];

            if (v27) {
              goto LABEL_22;
            }
          }
          else
          {
          }
          if (++v20 >= (unint64_t)[v9 count]) {
            goto LABEL_25;
          }
        }

LABEL_22:
        if (v21)
        {
          [v9 removeObjectAtIndex:v20];
          long long v28 = [v19 dirtyStateIdentifier];
          [v21 setDirtyStateIdentifier:v28];

          [v97 addObject:v21];
          if ((PKEqualObjects() & 1) == 0)
          {
            v135[0] = v19;
            v135[1] = v21;
            id v29 = +[NSArray arrayWithObjects:v135 count:2];
            [v87 addObject:v29];
          }
        }
        else
        {
LABEL_25:
          if (!a5) {
            [v89 addObject:v19];
          }
          uint64_t v21 = 0;
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v120 objects:v136 count:16];
    }
    while (v16);
  }

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v30 = v9;
  id v31 = [v30 countByEnumeratingWithState:&v116 objects:v134 count:16];
  id v32 = v99;
  if (v31)
  {
    id v33 = v31;
    uint64_t v34 = *(void *)v117;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v117 != v34) {
          objc_enumerationMutation(v30);
        }
        uint64_t v36 = *(void *)(*((void *)&v116 + 1) + 8 * (void)j);
        [v94 addObject:v36];
        [v97 addObject:v36];
      }
      id v33 = [v30 countByEnumeratingWithState:&v116 objects:v134 count:16];
    }
    while (v33);
  }

  uint64_t v37 = +[NSDate date];
  uint64_t v38 = [v86 expiry];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v98 = v97;
  id v39 = [v98 countByEnumeratingWithState:&v112 objects:v133 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v113;
    do
    {
      for (k = 0; k != v40; k = (char *)k + 1)
      {
        if (*(void *)v113 != v41) {
          objc_enumerationMutation(v98);
        }
        id v43 = *(void **)(*((void *)&v112 + 1) + 8 * (void)k);
        [v43 setLastUpdated:v37];
        [v43 setExpiry:v38];
        long long v44 = [v43 dirtyStateIdentifier];
        unsigned int v45 = [v44 isEqualToString:v96];

        if (v45) {
          [v43 setDirtyStateIdentifier:0];
        }
      }
      id v40 = [v98 countByEnumeratingWithState:&v112 objects:v133 count:16];
    }
    while (v40);
  }
  v83 = (void *)v38;
  v88 = (void *)v37;

  id v46 = objc_alloc((Class)NSMutableArray);
  long long v47 = [(PDDatabaseManager *)v99->_databaseManager setPaymentSetupFeatures:v98];
  objc_super v48 = (NSMutableArray *)[v46 initWithArray:v47];
  paymentSetupFeatures = v99->_paymentSetupFeatures;
  v99->_paymentSetupFeatures = v48;

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v50 = v94;
  id v51 = [v50 countByEnumeratingWithState:&v108 objects:v132 count:16];
  v93 = v50;
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v109;
    do
    {
      for (m = 0; m != v52; m = (char *)m + 1)
      {
        if (*(void *)v109 != v53) {
          objc_enumerationMutation(v93);
        }
        v55 = *(void **)(*((void *)&v108 + 1) + 8 * (void)m);
        v56 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = objc_msgSend(v55, "productIdentifier", v83);
          [v55 productState];
          v58 = PKPaymentSetupProductStateToString();
          *(_DWORD *)buf = 138412546;
          v125 = v57;
          __int16 v126 = 2112;
          v127 = v58;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Product Added: %@ state: %@", buf, 0x16u);

          id v32 = v99;
        }

        [(PDPaymentSetupFeaturesCoordinator *)v32 _notificationForNewProduct:v55 oldProduct:0];
      }
      id v50 = v93;
      id v52 = [v93 countByEnumeratingWithState:&v108 objects:v132 count:16];
    }
    while (v52);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v95 = v89;
  id v59 = [v95 countByEnumeratingWithState:&v104 objects:v131 count:16];
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v105;
    do
    {
      for (n = 0; n != v60; n = (char *)n + 1)
      {
        if (*(void *)v105 != v61) {
          objc_enumerationMutation(v95);
        }
        v63 = *(void **)(*((void *)&v104 + 1) + 8 * (void)n);
        v64 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = [v63 productIdentifier];
          [v63 productState];
          v66 = PKPaymentSetupProductStateToString();
          *(_DWORD *)buf = 138412546;
          v125 = v65;
          __int16 v126 = 2112;
          v127 = v66;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Product Deleted: %@ state: %@", buf, 0x16u);

          id v32 = v99;
        }

        [(PDPaymentSetupFeaturesCoordinator *)v32 _removeNotificationForProduct:v63];
      }
      id v60 = [v95 countByEnumeratingWithState:&v104 objects:v131 count:16];
    }
    while (v60);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v67 = v87;
  id v68 = [v67 countByEnumeratingWithState:&v100 objects:v130 count:16];
  v69 = v88;
  if (v68)
  {
    id v70 = v68;
    uint64_t v71 = *(void *)v101;
    do
    {
      v72 = 0;
      id obja = v70;
      do
      {
        if (*(void *)v101 != v71) {
          objc_enumerationMutation(v67);
        }
        v73 = *(void **)(*((void *)&v100 + 1) + 8 * (void)v72);
        if (objc_msgSend(v73, "count", v83) == (id)2)
        {
          v74 = [v73 objectAtIndexedSubscript:0];
          v75 = [v73 objectAtIndexedSubscript:1];
          v76 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            v77 = [v75 productIdentifier];
            [v75 productState];
            PKPaymentSetupProductStateToString();
            uint64_t v78 = v71;
            v80 = id v79 = v67;
            [v74 productState];
            v81 = PKPaymentSetupProductStateToString();
            *(_DWORD *)buf = 138412802;
            v125 = v77;
            __int16 v126 = 2112;
            v127 = v80;
            __int16 v128 = 2112;
            v129 = v81;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Product Updated: %@ new state: %@ old state: %@", buf, 0x20u);

            v69 = v88;
            id v67 = v79;
            uint64_t v71 = v78;
            id v70 = obja;

            id v32 = v99;
          }

          [(PDPaymentSetupFeaturesCoordinator *)v32 _notificationForNewProduct:v75 oldProduct:v74];
        }
        v72 = (char *)v72 + 1;
      }
      while (v70 != v72);
      id v70 = [v67 countByEnumeratingWithState:&v100 objects:v130 count:16];
    }
    while (v70);
  }

  BOOL v13 = v84;
  id v11 = v85;
  v82 = v93;
LABEL_76:
}

- (BOOL)_productsNeedUpdating:(id *)a3 ignoreCache:(BOOL *)a4
{
  if ([(NSMutableArray *)self->_paymentSetupFeatures count])
  {
    uint64_t v7 = +[NSDate now];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = [(NSMutableArray *)self->_paymentSetupFeatures copy];
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v14 = [v13 dirtyStateIdentifier];
          id v15 = v14;
          if (a3 && v14)
          {
            id v15 = v14;
            *a3 = v15;
            uint64_t v20 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Payment setup feature cache is dirty", buf, 2u);
            }

            if (a4) {
              *a4 = 1;
            }
            goto LABEL_29;
          }
          id v16 = [v13 expiry];
          [v16 timeIntervalSinceDate:v7];
          if (!v16 || v17 <= 0.0)
          {
            uint64_t v21 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Payment setup feature cache expired", buf, 2u);
            }

            if (a4) {
              *a4 = 0;
            }

LABEL_29:
            BOOL v18 = 1;
            goto LABEL_30;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v18 = 0;
    if (a4) {
      *a4 = 0;
    }
LABEL_30:
  }
  else
  {
    uint64_t v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: No payment setup feature cache", buf, 2u);
    }

    if (a4) {
      *a4 = 0;
    }
    return 1;
  }
  return v18;
}

- (void)_notificationForNewProduct:(id)a3 oldProduct:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (char *)[v6 productState];
  id v9 = (char *)[v7 productState];
  if (v8 != v9)
  {
    if ((unint64_t)(v8 - 2) < 3 || !v8) {
      goto LABEL_6;
    }
    if (v8 == (char *)1)
    {
      if ((unint64_t)v9 < 4)
      {
LABEL_6:
        [(PDPaymentSetupFeaturesCoordinator *)self _removeNotificationForProduct:v6];
        goto LABEL_7;
      }
      if (v9 != (char *)4) {
        goto LABEL_7;
      }
      id v10 = [v6 notificationTitle];
      uint64_t v11 = [v6 notificationMessage];
      unint64_t v12 = [v6 discoveryCardIdentifier];
      uint64_t v46 = 0;
      long long v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = sub_100020B4C;
      id v50 = sub_100021098;
      id v51 = PKURLActionPaymentSetup;
      id v13 = [v6 productType];
      if (v13 == (id)3)
      {
        if (!v10 || !v11)
        {
          uint64_t v19 = PKLocalizedTransitString(@"TRANSIT_NOTIFY_ME_TITLE");

          uint64_t v20 = PKLocalizedTransitString(@"TRANSIT_NOTIFY_ME_MESSAGE");

          uint64_t v11 = (void *)v20;
          id v10 = (void *)v19;
        }
      }
      else
      {
        if (v13 == (id)7)
        {
          id v21 = [v6 featureIdentifier];
          if (v21)
          {
            if (!v10 || !v11)
            {
              uint64_t v22 = PKLocalizedFeatureString();

              uint64_t v23 = PKLocalizedFeatureString();

              uint64_t v11 = (void *)v23;
              id v10 = (void *)v22;
            }
            long long v24 = PKFeatureIdentifierToString();
            uint64_t v25 = +[NSString stringWithFormat:@"%@/%@/%@", PKURLActionSetup, PKURLActionFeature, v24];
            long long v26 = (void *)v47[5];
            v47[5] = v25;

            if (!v12 || !self->_discoveryManager)
            {
              unsigned __int8 v27 = 0;
LABEL_34:
              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472;
              v36[2] = sub_1002FD40C;
              v36[3] = &unk_100748220;
              v36[4] = self;
              id v37 = v6;
              id v30 = v10;
              id v38 = v30;
              id v31 = v11;
              id v39 = v31;
              id v40 = &v46;
              id v32 = objc_retainBlock(v36);
              id v33 = v32;
              if (v27)
              {
                v34[0] = _NSConcreteStackBlock;
                v34[1] = 3221225472;
                v34[2] = sub_1002FD5E0;
                v34[3] = &unk_10072FDC8;
                v34[4] = self;
                long long v35 = v32;
                v27[2](v27, v34);
              }
              else
              {
                ((void (*)(void *))v32[2])(v32);
              }

              _Block_object_dispose(&v46, 8);
              goto LABEL_7;
            }
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_1002FD060;
            v41[3] = &unk_1007481F8;
            id v45 = v21;
            id v42 = v12;
            id v43 = self;
            long long v44 = &v46;
            unsigned __int8 v27 = objc_retainBlock(v41);
            id v16 = v42;
LABEL_33:

            goto LABEL_34;
          }
          id v16 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = [v6 productIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v53 = v29;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDPaymentSetupFeaturesCoordinator: Could not identify feature identifier for product identifier: %@", buf, 0xCu);
          }
LABEL_32:
          unsigned __int8 v27 = 0;
          goto LABEL_33;
        }
        if (v13 != (id)10)
        {
          id v16 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            [v6 productType];
            long long v28 = PKPaymentSetupProductTypeToString();
            *(_DWORD *)buf = 138412290;
            uint64_t v53 = v28;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Could not post notify me notification because product type %@ not supported", buf, 0xCu);
          }
          goto LABEL_32;
        }
        if (!v10 || !v11)
        {
          uint64_t v14 = PKLocalizedTransitString(@"IDENTITY_NOTIFY_ME_TITLE");

          uint64_t v15 = PKLocalizedTransitString(@"IDENTITY_NOTIFY_ME_MESSAGE");

          uint64_t v11 = (void *)v15;
          id v10 = (void *)v14;
        }
      }
      id v16 = [v6 productIdentifier];
      uint64_t v17 = +[NSString stringWithFormat:@"%@/%@", PKURLActionPaymentSetupSelectProduct, v16];
      BOOL v18 = (void *)v47[5];
      v47[5] = v17;

      goto LABEL_32;
    }
  }
LABEL_7:
}

- (void)_removeNotificationForProduct:(id)a3
{
  id v4 = [a3 productIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationWithIdentifier:v4];
    id v5 = v6;
  }
  _objc_release_x1(v4, v5);
}

- (void)markProductsDirty
{
  id v3 = +[NSUUID UUID];
  id v4 = [v3 UUIDString];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(NSMutableArray *)self->_paymentSetupFeatures copy];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) setDirtyStateIdentifier:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  id v10 = [(PDDatabaseManager *)self->_databaseManager setPaymentSetupFeatures:self->_paymentSetupFeatures];
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([@"PDFetchStaticPaymentSetupFeaturesActivityIdentifier" isEqualToString:v6] & 1) != 0
    || [@"PDStaticPaymentSetupFeaturesCacheUpdateActivityIdentifier" isEqualToString:v6])
  {
    [v7 reason];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002FD908;
    v9[3] = &unk_10072FC20;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v10;
    [(PDPaymentSetupFeaturesCoordinator *)self staticPaymentSetupFeaturesForSourceApplicationID:v8 blockServerFetch:0 completion:v9];
  }
}

- (void)clearPaymentSetupFeatures
{
  paymentSetupFeatures = self->_paymentSetupFeatures;
  self->_paymentSetupFeatures = 0;

  id v4 = [(PDDatabaseManager *)self->_databaseManager setPaymentSetupFeatures:self->_paymentSetupFeatures];
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_pendingProductRequests, 0);
  objc_storeStrong((id *)&self->_pendingPaymentSetupFeatureBlocks, 0);
  objc_storeStrong((id *)&self->_paymentSetupFeatures, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
  objc_storeStrong((id *)&self->_familyCircleManager, 0);
  objc_destroyWeak((id *)&self->_paymentWebServiceCoordinator);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_webServiceQueue, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end