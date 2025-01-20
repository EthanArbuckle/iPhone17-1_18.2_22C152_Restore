@interface PDDevicePasscodeManager
- (BOOL)_currentPasscodeMeetsUpgradedPasscodePolicy:(id *)a3 isPasscodeCompliant:(BOOL *)a4;
- (BOOL)_requiresUpgradedPasscode;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)currentPasscodeMeetsUpgradedPasscodePolicy:(id *)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (PDDevicePasscodeManager)initWithPaymentWebService:(id)a3 databaseManager:(id)a4 assertionManager:(id)a5;
- (id)_strongPasscodeRestrictions;
- (void)_enforceUpgradedPasscodePolicy:(BOOL)a3 withCompletion:(id)a4;
- (void)_updateUpgradedPasscodePolicyEnforcementWithCompletion:(id)a3;
- (void)_updateUpgradedPasscodePolicyEnforcementWithRemovalOnly:(BOOL)a3 completion:(id)a4;
- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4;
- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4;
- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)performUpgradedPasscodeEnforcementUpdateAfterBoot;
- (void)requiresUpgradedPasscodeWithCompletion:(id)a3;
- (void)updateUpgradedPasscodePolicyEnforcementWithCompletion:(id)a3;
@end

@implementation PDDevicePasscodeManager

- (PDDevicePasscodeManager)initWithPaymentWebService:(id)a3 databaseManager:(id)a4 assertionManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PDDevicePasscodeManager;
  v12 = [(PDDevicePasscodeManager *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a4);
    objc_storeStrong((id *)&v13->_paymentWebService, a3);
    objc_storeStrong((id *)&v13->_assertionManager, a5);
    [(PDAssertionManager *)v13->_assertionManager registerObserver:v13];
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.passd.devicepasscodemanager.internal", 0);
    internalQueue = v13->_internalQueue;
    v13->_internalQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.passd.devicepasscodemanager.reply", 0);
    replyQueue = v13->_replyQueue;
    v13->_replyQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passd.devicepasscodemanager.restrictions", 0);
    restrictionsQueue = v13->_restrictionsQueue;
    v13->_restrictionsQueue = (OS_dispatch_queue *)v18;
  }
  return v13;
}

- (void)dealloc
{
  [(PDAssertionManager *)self->_assertionManager unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDDevicePasscodeManager;
  [(PDDevicePasscodeManager *)&v3 dealloc];
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10041AAE8;
  v7[3] = &unk_10072E598;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (void)updateUpgradedPasscodePolicyEnforcementWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10041ADD8;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (void)requiresUpgradedPasscodeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    internalQueue = self->_internalQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10041AFC4;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(internalQueue, v7);
  }
}

- (void)performUpgradedPasscodeEnforcementUpdateAfterBoot
{
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10041B0FC;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10041B3E8;
  v15[3] = &unk_100730578;
  id v16 = v8;
  id v17 = v9;
  dispatch_queue_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  if (a3 == 6) {
    return 1;
  }
  if (a3 == 7) {
    return !self->_hasActivePasscodeUpgradeFlow;
  }
  return 0;
}

- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4
{
  if (objc_msgSend(a4, "type", a3) == (id)7) {
    self->_hasActivePasscodeUpgradeFlow = 1;
  }
}

- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4
{
  id v5 = a4;
  if ([v5 type] == (id)7)
  {
    self->_hasActivePasscodeUpgradeFlow = 0;
  }
  else if ([v5 type] == (id)6)
  {
    [(PDDevicePasscodeManager *)self updateUpgradedPasscodePolicyEnforcementWithCompletion:0];
  }
}

- (void)_updateUpgradedPasscodePolicyEnforcementWithCompletion:(id)a3
{
}

- (void)_updateUpgradedPasscodePolicyEnforcementWithRemovalOnly:(BOOL)a3 completion:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  id v6 = [(PDAssertionManager *)self->_assertionManager assertionsOfType:6];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skip updating passcode policy due to active assertions", (uint8_t *)&v10, 2u);
    }

    if (v5) {
      v5[2](v5, 1);
    }
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10041BAB4;
    v11[3] = &unk_1007378B8;
    id v12 = v5;
    id v9 = objc_retainBlock(v11);
    if ([(PDDevicePasscodeManager *)self _requiresUpgradedPasscode]) {
      ((void (*)(void *, void))v9[2])(v9, 0);
    }
    else {
      [(PDDevicePasscodeManager *)self _enforceUpgradedPasscodePolicy:0 withCompletion:v9];
    }
  }
}

- (void)_enforceUpgradedPasscodePolicy:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  restrictionsQueue = self->_restrictionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10041BC38;
  block[3] = &unk_10073A378;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(restrictionsQueue, block);
}

- (BOOL)currentPasscodeMeetsUpgradedPasscodePolicy:(id *)a3
{
  return [(PDDevicePasscodeManager *)self _currentPasscodeMeetsUpgradedPasscodePolicy:a3 isPasscodeCompliant:0];
}

- (BOOL)_currentPasscodeMeetsUpgradedPasscodePolicy:(id *)a3 isPasscodeCompliant:(BOOL *)a4
{
  id v7 = +[MCProfileConnection sharedConnection];
  id v16 = 0;
  unsigned int v8 = [v7 isPasscodeCompliantWithNamedPolicy:kMCPasscodePolicyApplePayChinaKey outError:&v16];
  id v9 = v16;
  id v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    if (a4) {
      *a4 = 1;
    }
    id v13 = [v7 clientRestrictionsForClientUUID:PKMCRestrictionClientUUIDUpgradedPasscode];
    if (v13)
    {
      id v14 = [(PDDevicePasscodeManager *)self _strongPasscodeRestrictions];
      char v12 = MCEqualDictionaries();
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
    if (a3) {
      *a3 = v9;
    }
  }

  return v12;
}

- (BOOL)_requiresUpgradedPasscode
{
  v2 = self;
  objc_super v3 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
  id v4 = [v3 allObjects];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10041BFE4;
  v6[3] = &unk_100746378;
  v6[4] = v2;
  LOBYTE(v2) = objc_msgSend(v4, "pk_containsObjectPassingTest:", v6);

  return (char)v2;
}

- (id)_strongPasscodeRestrictions
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 MCSetBoolRestriction:MCFeatureSimplePasscodeAllowed value:0];
  uint64_t v3 = MCFeatureMinimumPasscodeLength;
  id v4 = +[NSNumber numberWithUnsignedInteger:PKUpgradedDevicePasscodeMinimumLength];
  [v2 MCSetValueRestriction:v3 value:v4];

  id v5 = [v2 copy];
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionsQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end