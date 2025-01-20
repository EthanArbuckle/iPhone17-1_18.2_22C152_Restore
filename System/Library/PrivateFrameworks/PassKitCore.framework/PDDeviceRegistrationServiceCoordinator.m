@interface PDDeviceRegistrationServiceCoordinator
- (PDDeviceRegistrationServiceCoordinator)init;
- (PDDeviceRegistrationServiceCoordinator)initWithPaymentWebServiceCoordinator:(id)a3 peerPaymentWebServiceCoordinator:(id)a4;
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator;
- (void)dealloc;
- (void)notePasscodeChanged;
- (void)performDeviceRegistrationForReason:(id)a3 brokerURL:(id)a4 action:(int64_t)a5 forceApplePayRegister:(BOOL)a6 forcePeerPaymentRegister:(BOOL)a7 completion:(id)a8;
- (void)performRegistrationForMemberOfRegions:(id)a3 force:(BOOL)a4 withReason:(id)a5 completion:(id)a6;
- (void)performRegistrationForRegion:(id)a3 force:(BOOL)a4 withReason:(id)a5 completion:(id)a6;
@end

@implementation PDDeviceRegistrationServiceCoordinator

- (PDDeviceRegistrationServiceCoordinator)init
{
  return [(PDDeviceRegistrationServiceCoordinator *)self initWithPaymentWebServiceCoordinator:0 peerPaymentWebServiceCoordinator:0];
}

- (PDDeviceRegistrationServiceCoordinator)initWithPaymentWebServiceCoordinator:(id)a3 peerPaymentWebServiceCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PDDeviceRegistrationServiceCoordinator;
  v9 = [(PDDeviceRegistrationServiceCoordinator *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentWebServiceCoordinator, a3);
    [(PDPaymentWebServiceCoordinator *)v10->_paymentWebServiceCoordinator registerObserver:v10];
    objc_storeStrong((id *)&v10->_peerPaymentWebServiceCoordinator, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.passd.registration.service", v11);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    registrationTasks = v10->_registrationTasks;
    v10->_registrationTasks = v14;

    v16 = [v7 sharedWebService];
    v17 = [v16 _appleAccountInformation];
    if ([v17 aidaAccountAvailable]) {
      PKDisableAutomaticRegistration();
    }
  }
  return v10;
}

- (void)dealloc
{
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDDeviceRegistrationServiceCoordinator;
  [(PDDeviceRegistrationServiceCoordinator *)&v3 dealloc];
}

- (void)notePasscodeChanged
{
  if (PKPasscodeEnabled())
  {
    unsigned __int8 v3 = +[PDSetupAssistantCompleteMonitor hasCompletedSetupAssistant];
    v4 = PKLogFacilityTypeGetObject();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RegistrationService: Passcode changed and device has passcode. Attempting to register for Apple Pay.", v7, 2u);
      }

      [(PDDeviceRegistrationServiceCoordinator *)self performDeviceRegistrationForReason:@"passcode changed" brokerURL:0 action:0 forceApplePayRegister:0 forcePeerPaymentRegister:0 completion:0];
    }
    else
    {
      if (v5)
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RegistrationService: Passcode changed but still in buddy - skipping registration", v8, 2u);
      }
    }
  }
  else
  {
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RegistrationService: Passcode changed but disabled - skipping registration", buf, 2u);
    }
  }
}

- (void)performRegistrationForMemberOfRegions:(id)a3 force:(BOOL)a4 withReason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029884;
  block[3] = &unk_10072E3F0;
  id v18 = v11;
  id v19 = v10;
  BOOL v22 = a4;
  v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(workQueue, block);
}

- (void)performRegistrationForRegion:(id)a3 force:(BOOL)a4 withReason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029AA8;
  block[3] = &unk_10072E3F0;
  id v18 = v11;
  id v19 = v10;
  BOOL v22 = a4;
  v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(workQueue, block);
}

- (void)performDeviceRegistrationForReason:(id)a3 brokerURL:(id)a4 action:(int64_t)a5 forceApplePayRegister:(BOOL)a6 forcePeerPaymentRegister:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100029C34;
  v21[3] = &unk_10072E418;
  id v24 = v16;
  int64_t v25 = a5;
  v21[4] = self;
  id v22 = v15;
  BOOL v26 = a6;
  BOOL v27 = a7;
  id v23 = v14;
  id v18 = v14;
  id v19 = v16;
  id v20 = v15;
  dispatch_async(workQueue, v21);
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator
{
  return self->_peerPaymentWebServiceCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_registrationTasks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end