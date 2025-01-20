@interface PDTrustedDeviceEnrollmentInfoProvider
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PDTrustedDeviceEnrollmentInfoProvider)initWithConnection:(id)a3;
- (PDTrustedDeviceEnrollmentInfoProvider)initWithConnection:(id)a3 server:(id)a4;
- (void)localTrustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5;
- (void)remoteTrustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5;
- (void)setPaymentWebServiceCoordinator:(id)a3;
- (void)trustedDeviceEnrollmentInfoWithHandler:(id)a3;
- (void)trustedDeviceEnrollmentSignatureForDevice:(unint64_t)a3 accountDSID:(id)a4 sessionData:(id)a5 handler:(id)a6;
@end

@implementation PDTrustedDeviceEnrollmentInfoProvider

- (PDTrustedDeviceEnrollmentInfoProvider)initWithConnection:(id)a3
{
  return 0;
}

- (PDTrustedDeviceEnrollmentInfoProvider)initWithConnection:(id)a3 server:(id)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PDTrustedDeviceEnrollmentInfoProvider;
  v6 = [(PDTrustedDeviceEnrollmentInfoProvider *)&v14 initWithConnection:v5];
  if (v6)
  {
    v7 = (PKEntitlementWhitelist *)[objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v5];
    whitelist = v6->_whitelist;
    v6->_whitelist = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.passd.trusted-device-enrollment-info-provider", v9);
    processingQueue = v6->_processingQueue;
    v6->_processingQueue = (OS_dispatch_queue *)v10;

    [v5 setRemoteObjectInterface:0];
    v12 = PDTrustedDeviceEnrollmentInfoProviderExportedInterface();
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:v6];
  }

  return v6;
}

- (void)trustedDeviceEnrollmentInfoWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist trustedDeviceEnrollmentInfo])
    {
      processingQueue = self->_processingQueue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100455754;
      v7[3] = &unk_10072FDC8;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(processingQueue, v7);
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        dispatch_queue_t v10 = "-[PDTrustedDeviceEnrollmentInfoProvider trustedDeviceEnrollmentInfoWithHandler:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (void)trustedDeviceEnrollmentSignatureForDevice:(unint64_t)a3 accountDSID:(id)a4 sessionData:(id)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist trustedDeviceEnrollmentInfo])
    {
      processingQueue = self->_processingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100455AC0;
      block[3] = &unk_100730288;
      unint64_t v21 = a3;
      block[4] = self;
      id v18 = v10;
      id v19 = v11;
      id v20 = v12;
      dispatch_async(processingQueue, block);
    }
    else
    {
      objc_super v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[PDTrustedDeviceEnrollmentInfoProvider trustedDeviceEnrollmentSignatureForDevice:accountDSID:sessionData:handler:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      CFStringRef v23 = @"Missing entitlement for Trusted Device Enrollment info.";
      v15 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:v15];
      (*((void (**)(id, void, void, void, void *))v12 + 2))(v12, 0, 0, 0, v16);
    }
  }
}

- (void)localTrustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
  id v12 = [v11 targetDevice];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v13 = [v12 trustedDeviceEnrollmentInfoForWebService:v11];
    objc_super v14 = [v13 deviceUDID];
    id v15 = objc_alloc_init((Class)NSMutableData);
    v16 = [v14 dataUsingEncoding:4];
    [v15 appendData:v16];

    v17 = [v8 dataUsingEncoding:4];
    [v15 appendData:v17];

    [v15 appendData:v9];
    id v18 = [v15 SHA256Hash];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100455D80;
    v19[3] = &unk_100752750;
    id v20 = v10;
    [v12 paymentWebService:v11 signData:v18 signatureEntanglementMode:0 withCompletionHandler:v19];
  }
  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"Error connecting to target device.";
    v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    objc_super v14 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:v13];
    (*((void (**)(id, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, v14);
  }
}

- (void)remoteTrustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(off_100807430());
  if (objc_opt_respondsToSelector())
  {
    [v10 trustedDeviceEnrollmentSignatureWithAccountDSID:v7 sessionData:v8 handler:v9];
  }
  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"Error connecting to remote target device.";
    id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v12 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:v11];
    (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v12);
  }
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (void)setPaymentWebServiceCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end