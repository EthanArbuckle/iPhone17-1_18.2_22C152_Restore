@interface PDExpressTransitUpgradeController
- (BOOL)hasAttemptedDefaultPassExpressUpgrade;
- (BOOL)isPassUpgradeableForExpress:(id)a3;
- (PDExpressTransitUpgradeController)initWithPaymentWebServiceCoordinator:(id)a3 databaseManager:(id)a4 expressPassManager:(id)a5 notificationManager:(id)a6 assertionManager:(id)a7 passUpgradeController:(id)a8;
- (id)_eligibleUpgradeRequestsForPass:(id)a3;
- (id)upgradeablePaymentApplicationIdentifiersForPass:(id)a3;
- (void)_upgradePaymentPass:(id)a3 withRequest:(id)a4 completionHandler:(id)a5;
- (void)recordExpressUpgradeAttemptStatus:(int64_t)a3;
- (void)resetDefaultPassExpressUpgradeAttempt;
- (void)upgradePass:(id)a3 completionHandler:(id)a4;
@end

@implementation PDExpressTransitUpgradeController

- (PDExpressTransitUpgradeController)initWithPaymentWebServiceCoordinator:(id)a3 databaseManager:(id)a4 expressPassManager:(id)a5 notificationManager:(id)a6 assertionManager:(id)a7 passUpgradeController:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PDExpressTransitUpgradeController;
  v18 = [(PDExpressTransitUpgradeController *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a3);
    objc_storeStrong((id *)&v19->_databaseManager, a4);
    objc_storeStrong((id *)&v19->_expressPassManager, a5);
    objc_storeStrong((id *)&v19->_userNotificationManager, a6);
    objc_storeStrong((id *)&v19->_passUpgradeController, a8);
    objc_storeStrong((id *)&v19->_assertionManager, a7);
  }

  return v19;
}

- (BOOL)hasAttemptedDefaultPassExpressUpgrade
{
  v2 = +[PKPassPreferencesManager sharedInstance];
  unsigned __int8 v3 = [v2 hasDoneExpressUpgrade];

  return v3;
}

- (void)resetDefaultPassExpressUpgradeAttempt
{
  id v2 = +[PKPassPreferencesManager sharedInstance];
  [v2 setHasDoneExpressUpgrade:0];
}

- (void)recordExpressUpgradeAttemptStatus:(int64_t)a3
{
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Marking express upgrade attempt status as %ld", (uint8_t *)&v6, 0xCu);
  }

  if (a3 == 2)
  {
    v5 = +[PKPassPreferencesManager sharedInstance];
    [v5 setHasDoneExpressUpgrade:1];
  }
}

- (BOOL)isPassUpgradeableForExpress:(id)a3
{
  unsigned __int8 v3 = [(PDExpressTransitUpgradeController *)self _eligibleUpgradeRequestsForPass:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)upgradeablePaymentApplicationIdentifiersForPass:(id)a3
{
  unsigned __int8 v3 = [(PDExpressTransitUpgradeController *)self _eligibleUpgradeRequestsForPass:a3];
  BOOL v4 = [v3 firstObject];
  v5 = [v4 paymentApplicationIdentifiers];

  return v5;
}

- (void)upgradePass:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10012A6B4;
  v19 = &unk_100738FA8;
  v20 = self;
  id v21 = a4;
  id v7 = v21;
  v8 = objc_retainBlock(&v16);
  if (v6)
  {
    v9 = -[PDExpressTransitUpgradeController _eligibleUpgradeRequestsForPass:](self, "_eligibleUpgradeRequestsForPass:", v6, v16, v17, v18, v19, v20, v21);
    if ((unint64_t)[v9 count] < 2)
    {
      v13 = [v9 firstObject];
      if (v13)
      {
        [(PDExpressTransitUpgradeController *)self _upgradePaymentPass:v6 withRequest:v13 completionHandler:v8];
      }
      else
      {
        v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v6 uniqueID];
          *(_DWORD *)buf = 138412290;
          id v23 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Pass has no express upgrade: %@", buf, 0xCu);
        }
        ((void (*)(void ***, id, uint64_t))v8[2])(v8, v6, 1);
      }
    }
    else
    {
      v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v6 uniqueID];
        *(_DWORD *)buf = 138412290;
        id v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pass has multiple eligible upgrades: %@", buf, 0xCu);
      }
      ((void (*)(void ***, id, uint64_t))v8[2])(v8, v6, 3);
    }
  }
  else
  {
    v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Payment pass is nil, skipping upgrade.", buf, 2u);
    }

    ((void (*)(void ***, void, uint64_t))v8[2])(v8, 0, 1);
  }
}

- (id)_eligibleUpgradeRequestsForPass:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[PKOSVersionRequirement fromDeviceVersion];
  v5 = PKDeviceClass();
  id v6 = +[PKSecureElement secureElementIdentifiers];
  id v7 = [v3 eligibleExpressUpgradeRequestsForDeviceClass:v5 deviceSEIDs:v6 deviceVersion:v4 technologyTest:&stru_100738FE8];

  return v7;
}

- (void)_upgradePaymentPass:(id)a3 withRequest:(id)a4 completionHandler:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(location, self);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_1000208CC;
  v51 = sub_100020F58;
  v10 = +[NSUUID UUID];
  id v52 = [v10 UUIDString];

  v11 = dispatch_queue_create("com.apple.passd.pdexpresstransitupgradecontroller.assertionqueue", 0);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_1000208CC;
  v45 = sub_100020F58;
  dispatch_source_t v46 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
  v12 = v42[5];
  dispatch_time_t v13 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v14 = v42[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10012ABDC;
  handler[3] = &unk_100739010;
  objc_copyWeak(&v40, location);
  handler[4] = &v47;
  handler[5] = &v41;
  dispatch_source_set_event_handler(v14, handler);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10012AC84;
  v33[3] = &unk_100739060;
  id v23 = v9;
  id v35 = v23;
  id v15 = v11;
  v34 = v15;
  v36 = &v41;
  objc_copyWeak(&v38, location);
  v37 = &v47;
  id v16 = objc_retainBlock(v33);
  assertionManager = self->_assertionManager;
  uint64_t v18 = v48[5];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10012ADF0;
  v25[3] = &unk_100739120;
  v30 = &v41;
  v25[4] = self;
  id v19 = v8;
  id v26 = v19;
  id v20 = v24;
  id v27 = v20;
  objc_copyWeak(&v32, location);
  id v21 = v16;
  id v29 = v21;
  id v22 = v15;
  v28 = v22;
  v31 = &v47;
  [(PDAssertionManager *)assertionManager acquireAssertionOfType:1 withIdentifier:v18 reason:@"Pass Upgrade Request" handler:v25];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v40);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  objc_destroyWeak(location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_passUpgradeController, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
}

@end