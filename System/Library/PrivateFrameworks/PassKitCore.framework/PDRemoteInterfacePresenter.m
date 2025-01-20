@interface PDRemoteInterfacePresenter
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (PDRemoteInterfacePresenter)init;
- (id)createCurrentNotificationRegistrationState;
- (void)dealloc;
- (void)didAttachSleeveAccessory:(id)a3;
- (void)didDetachSleeveAccessory;
- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)receivedSecureContactlessPresentationEvent:(id)a3;
@end

@implementation PDRemoteInterfacePresenter

- (PDRemoteInterfacePresenter)init
{
  return 0;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  sub_10000725C((uint64_t)self->_fieldDetectorManager, self);
  [(PDAssertionManager *)self->_assertionManager unregisterObserver:self];
  [(PKCancelable *)self->_inProgressPassbookUIServiceBoost cancel];
  [(RBSAssertion *)self->_passbookUIServiceBoostAssertion invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PDRemoteInterfacePresenter;
  [(PDRemoteInterfacePresenter *)&v4 dealloc];
}

- (id)createCurrentNotificationRegistrationState
{
  if (!PKNearFieldRadioIsAvailable()) {
    return 0;
  }
  v3 = objc_alloc_init(PDNotificationStreamRegistrationState);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  [v4 addObject:PKDarwinNotificationEventLostModeStateChanged];
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_passbookUIServiceCanBoost);
  if (v5) {
    [v4 addObject:PKDarwinNotificationEventLockStateChanged];
  }
  [(PDNotificationStreamRegistrationState *)v3 setNotificationNames:v4 forStream:0];

  return v3;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v8 = a3;
  if ([v8 isEqualToString:PKDarwinNotificationEventLostModeStateChanged])
  {
    p_lostModeActive = &self->_lostModeActive;
    v7 = +[FMDFMIPManager sharedInstance];
    atomic_store([v7 lostModeIsActive], (unsigned __int8 *)p_lostModeActive);
  }
  else if ([v8 isEqualToString:PKDarwinNotificationEventLockStateChanged])
  {
    sub_1002057D0((uint64_t)self);
  }
}

- (void)receivedSecureContactlessPresentationEvent:(id)a3
{
  if (!sub_100011FDC((uint64_t)a3))
  {
    PDDefaultPaymentPassUniqueIdentifier();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    sub_100205C84((uint64_t)self, v4, 0, 0);
  }
}

- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_lostModeActive);
  if (v8)
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      CFStringRef v17 = @"Active";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remote Interface Presenter ignoring field with properties: %@, Lost Mode: %@", buf, 0x16u);
    }
  }
  else
  {
    unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_protectedDataAvailable);
    if (v9)
    {
      v11 = PDExpressTransactionQueue();
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100205F0C;
      v12[3] = &unk_10072E198;
      v12[4] = self;
      id v13 = v7;
      dispatch_async(v11, v12);
    }
    else
    {
      sub_100206358((uint64_t)self);
    }
  }
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return !a3 || a3 == 5;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  if (a3 != 5 && a3) {
    return 1;
  }
  else {
    return sub_1002064CC((os_unfair_lock_s *)self, 0) ^ 1;
  }
}

- (void)didAttachSleeveAccessory:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_accessoryDevice, a3);
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    unsigned __int8 v8 = "/Library/Caches/com.apple.xbs/Sources/Wallet/passd/PDRemoteInterfacePresenter.m";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - didAttachSleeveAccessory getting called with %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)didDetachSleeveAccessory
{
  v3 = self->_accessoryDevice;
  accessoryDevice = self->_accessoryDevice;
  self->_accessoryDevice = 0;

  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "/Library/Caches/com.apple.xbs/Sources/Wallet/passd/PDRemoteInterfacePresenter.m";
    __int16 v8 = 2112;
    __int16 v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - didDetachSleeveAccessory getting called (and removing %@)", (uint8_t *)&v6, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
  objc_storeStrong((id *)&self->_fieldDetectorManager, 0);
  objc_storeStrong((id *)&self->_accessoryDevice, 0);
  objc_storeStrong((id *)&self->_accessoryDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_passbookUIServiceLaunchAssertion, 0);
  objc_storeStrong((id *)&self->_passbookUIServiceBoostGraceTimeout, 0);
  objc_storeStrong((id *)&self->_passbookUIServiceBoostAssertion, 0);
  objc_storeStrong((id *)&self->_passbookUIServiceBoostTransaction, 0);
  objc_storeStrong((id *)&self->_inProgressPassbookUIServiceBoost, 0);
  objc_storeStrong((id *)&self->_outstandingProvisioningContinuityPresentation, 0);
  objc_storeStrong((id *)&self->_outstandingProxCardPresentation, 0);
  objc_storeStrong((id *)&self->_outstandingIssuerBindingPresentation, 0);
  objc_storeStrong((id *)&self->_outstandingMessagePresentation, 0);
  objc_storeStrong((id *)&self->_outstandingTermsPresentation, 0);
  objc_storeStrong((id *)&self->_outstandingRegistrationPresentation, 0);
  objc_storeStrong((id *)&self->_outstandingIdentityVerificationPresentation, 0);
  objc_storeStrong((id *)&self->_outstandingContactlessInterfaceRequest, 0);
  objc_storeStrong((id *)&self->_contactlessBannerHandle, 0);
  objc_storeStrong((id *)&self->_alertHandles, 0);
  objc_storeStrong((id *)&self->_expressTransactionState, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_presenterSerialQueue, 0);
}

@end