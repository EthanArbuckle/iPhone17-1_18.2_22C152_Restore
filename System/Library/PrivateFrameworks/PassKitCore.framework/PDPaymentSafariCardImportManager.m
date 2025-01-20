@interface PDPaymentSafariCardImportManager
- (PDPaymentSafariCardImportManager)initWithWebService:(id)a3 webServiceQueue:(id)a4 databaseManager:(id)a5;
- (void)_associateCredentialsForItem:(id)a3;
- (void)_cleanupQueueResources;
- (void)_popEligibilityQueue;
- (void)_processEligibilityItem:(id)a3;
- (void)processSafariCredentialEligibility:(id)a3 completion:(id)a4;
@end

@implementation PDPaymentSafariCardImportManager

- (PDPaymentSafariCardImportManager)initWithWebService:(id)a3 webServiceQueue:(id)a4 databaseManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PDPaymentSafariCardImportManager;
  v12 = [(PDPaymentSafariCardImportManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_webService, a3);
    objc_storeStrong((id *)&v13->_webServiceQueue, a4);
    objc_storeStrong((id *)&v13->_databaseManager, a5);
  }

  return v13;
}

- (void)processSafariCredentialEligibility:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087C18;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_popEligibilityQueue
{
  v3 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087F1C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_cleanupQueueResources
{
  eligibilityItems = self->_eligibilityItems;
  self->_eligibilityItems = 0;

  provisioningController = self->_provisioningController;
  self->_provisioningController = 0;
}

- (void)_processEligibilityItem:(id)a3
{
  id v4 = a3;
  provisioningController = self->_provisioningController;
  id v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (provisioningController)
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Safari Import: Provisioning controller exists, associating immediately", (uint8_t *)buf, 2u);
    }

    [(PDPaymentSafariCardImportManager *)self _associateCredentialsForItem:v4];
  }
  else
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Safari Import: Creating provisioning controller", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    webServiceQueue = self->_webServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100088200;
    block[3] = &unk_1007328A8;
    block[4] = self;
    objc_copyWeak(&v11, buf);
    id v10 = v4;
    dispatch_async(webServiceQueue, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

- (void)_associateCredentialsForItem:(id)a3
{
  id v4 = a3;
  webServiceQueue = self->_webServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000887D0;
  v7[3] = &unk_10072E198;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(webServiceQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_eligibilityItems, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_webServiceQueue, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end