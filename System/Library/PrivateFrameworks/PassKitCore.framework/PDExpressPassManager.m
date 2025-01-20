@interface PDExpressPassManager
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (PDExpressPassManager)init;
- (id)createCurrentNotificationRegistrationState;
- (void)accessTerminalDidLockForType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5 withContent:(id)a6;
- (void)accessTerminalDidUnlockForType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5 withContent:(id)a6;
- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4;
- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)receivedSecureExpressTransactionEvent:(id)a3;
- (void)secureElementExpressConfigurationDidFail;
- (void)secureElementExpressConfigurationNeedsUpdate;
- (void)secureElementRadioStateChanged;
@end

@implementation PDExpressPassManager

- (PDExpressPassManager)init
{
  return 0;
}

- (void)secureElementExpressConfigurationNeedsUpdate
{
  if (a1)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PKExpressPassManager: sanitizing express passes", buf, 2u);
    }

    v3 = (void *)PDOSTransactionCreate("PDExpressPassManager");
    v4 = *(NSObject **)(a1 + 72);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10018C7F4;
    v6[3] = &unk_10072E198;
    id v7 = v3;
    uint64_t v8 = a1;
    id v5 = v3;
    dispatch_async(v4, v6);
  }
}

- (void)secureElementExpressConfigurationDidFail
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_100515FF8();
  }

  sub_10018C7FC((uint64_t)self);
}

- (void)secureElementRadioStateChanged
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100195140;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)accessTerminalDidLockForType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5 withContent:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)PDOSTransactionCreate("PDExpressPassManager");
  v14 = PDExpressTransactionQueue();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100195274;
  v19[3] = &unk_10072EA00;
  id v20 = v13;
  v21 = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  int64_t v25 = a3;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, v19);
}

- (void)accessTerminalDidUnlockForType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5 withContent:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)PDOSTransactionCreate("PDExpressPassManager");
  v14 = PDExpressTransactionQueue();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001953B8;
  v19[3] = &unk_10072EA00;
  id v20 = v13;
  v21 = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  int64_t v25 = a3;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, v19);
}

- (void)receivedSecureExpressTransactionEvent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)PDOSTransactionCreate("PDExpressPassManager");
  v6 = PDExpressTransactionQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001956DC;
  block[3] = &unk_10072E238;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_biometricsEnabled);
  if ((v4 & 1) == 0) {
    sub_1001937E0(self, 0);
  }
}

- (id)createCurrentNotificationRegistrationState
{
  if (!PKNearFieldRadioIsAvailable()) {
    return 0;
  }
  v3 = objc_alloc_init(PDNotificationStreamRegistrationState);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  [v4 addObject:PKDarwinNotificationEventLostModeStateChanged];
  [v4 addObject:@"com.apple.BiometricKit.enrollmentChanged"];
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_setup);
  if (v5 & 1) == 0 || (unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_biometricsEnrolled), (v6)) {
    [v4 addObject:@"com.apple.BiometricKit.expressModeStateChanged"];
  }
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_setup);
  if ((v7 & 1) == 0 || (unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_biometricsEnabled), (v8 & 1) == 0))
  {
    [v4 addObject:@"com.apple.mobile.keybagd.lock_status"];
    [v4 addObject:@"com.apple.mobile.keybagd.passcode_threshold"];
    [v4 addObject:@"com.apple.springboard.lock-with-force-biolockout"];
  }
  [(PDNotificationStreamRegistrationState *)v3 setNotificationNames:v4 forStream:0];

  return v3;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v6 = a3;
  accessQueue = self->_accessQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001979D4;
  v9[3] = &unk_10072E198;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(accessQueue, v9);
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return (a3 < 6) & (0x23u >> a3);
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return 1;
}

- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4
{
  id v5 = objc_msgSend(a4, "type", a3);
  if (v5 == (id)5 || !v5)
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100197B80;
    block[3] = &unk_10072E1E8;
    void block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4
{
  id v5 = objc_msgSend(a4, "type", a3);
  if (v5 == (id)5)
  {
LABEL_4:
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100197C54;
    block[3] = &unk_10072E1E8;
    void block[4] = self;
    dispatch_async(accessQueue, block);
    return;
  }
  if (v5 != (id)1)
  {
    if (v5) {
      return;
    }
    goto LABEL_4;
  }
  if (![(PDAssertionManager *)self->_assertionManager hasAssertionsOfType:1])
  {
    -[PDExpressPassManager secureElementExpressConfigurationNeedsUpdate]_0((uint64_t)self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcPairingManager, 0);
  objc_storeStrong((id *)&self->_expressMutationRequests, 0);
  objc_storeStrong((id *)&self->_sessionAccessHandlers, 0);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_expressTransactionState, 0);
  objc_storeStrong((id *)&self->_expressState, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_expressPassesToRestore, 0);
  objc_storeStrong((id *)&self->_databaseRestoreTransaction, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
  objc_destroyWeak((id *)&self->_remoteInterfacePresenter);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end