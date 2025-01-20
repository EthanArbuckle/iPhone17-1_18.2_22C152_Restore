@interface PDInAppPaymentService
- (BOOL)_hasValidSecureElement;
- (PDDatabaseManager)databaseManager;
- (PDInAppPaymentService)initWithConnection:(id)a3;
- (PDInAppPaymentService)initWithConnection:(id)a3 server:(id)a4;
- (PDInAppPaymentServiceDelegate)delegate;
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PKIDSManager)idsManager;
- (PKSecureElement)secureElement;
- (id)_paymentServicesMerchantURLForAPIType:(int64_t)a3;
- (int64_t)_AMPEnrollmentAccountStatus;
- (int64_t)_cardsAvailableForAMPWithCountryCode:(id)a3;
- (void)cardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5;
- (void)cardsAvailableForAMPWithCountryCode:(id)a3 completion:(id)a4;
- (void)enrollPaymentPassWithUniqueIdentifier:(id)a3 merchantSession:(id)a4 completion:(id)a5;
- (void)merchantStatusCheck:(id)a3 merchantDomain:(id)a4 sourceApplicationSecondaryIdentifier:(id)a5 handler:(id)a6;
- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4;
- (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 handler:(id)a4;
- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 awaitingRemoteNetworkPaymentRequest:(BOOL)a4 forHostIdentifier:(id)a5 hostSceneIdentifier:(id)a6 hostSceneBundleIdentifier:(id)a7 orientation:(id)a8 omitPresentationTarget:(BOOL)a9 analyticsSubject:(id)a10 analyticsArchivedSessionToken:(id)a11 handler:(id)a12;
- (void)registerPaymentListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 handler:(id)a5;
- (void)retrievePaymentListenerEndpointForHostIdentifier:(id)a3 handler:(id)a4;
- (void)secureElementStatusWithCompletion:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdsManager:(id)a3;
- (void)setPaymentWebServiceCoordinator:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)validatePayLaterMerchandisingConfiguration:(id)a3 type:(unint64_t)a4 completion:(id)a5;
@end

@implementation PDInAppPaymentService

- (PDInAppPaymentService)initWithConnection:(id)a3
{
  return 0;
}

- (PDInAppPaymentService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDInAppPaymentService;
  v8 = [(PDInAppPaymentService *)&v16 initWithConnection:v6];
  if (v8)
  {
    v9 = (PKEntitlementWhitelist *)[objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v6];
    whitelist = v8->_whitelist;
    v8->_whitelist = v9;

    v11 = sub_100011FE8((uint64_t)v7);
    uint64_t v12 = sub_100011FD0((uint64_t)v11);
    remoteInterfacePresenter = v8->_remoteInterfacePresenter;
    v8->_remoteInterfacePresenter = (PDRemoteInterfacePresenter *)v12;

    v14 = PDInAppPaymentServiceInterface();
    [v6 setExportedInterface:v14];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 awaitingRemoteNetworkPaymentRequest:(BOOL)a4 forHostIdentifier:(id)a5 hostSceneIdentifier:(id)a6 hostSceneBundleIdentifier:(id)a7 orientation:(id)a8 omitPresentationTarget:(BOOL)a9 analyticsSubject:(id)a10 analyticsArchivedSessionToken:(id)a11 handler:(id)a12
{
  BOOL v16 = a4;
  id v18 = a3;
  id v32 = a5;
  id v31 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  v24 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v25 = @"false";
    if (v16) {
      CFStringRef v25 = @"true";
    }
    *(_DWORD *)buf = 138543618;
    id v47 = v18;
    __int16 v48 = 2114;
    CFStringRef v49 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received PKPaymentRequest: %{public}@, Remote Payment Request Promised? %{public}@", buf, 0x16u);
  }

  if (([(PKEntitlementWhitelist *)self->_whitelist isEntitledForPaymentRequest:v18] & 1) != 0|| v16)
  {
    v30 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002D5BC4;
    block[3] = &unk_100746F60;
    block[4] = self;
    id v34 = v18;
    BOOL v42 = v16;
    id v35 = v32;
    id v36 = v31;
    id v37 = v19;
    BOOL v43 = a9;
    id v38 = v21;
    id v39 = v22;
    id v40 = v20;
    id v41 = v23;
    dispatch_async(v30, block);
  }
  else if (v23)
  {
    v26 = [v18 merchantIdentifier];
    v27 = PKLocalizedPaymentString(@"IN_APP_PAYMENT_ERROR_NO_ENTITLEMENT_FORMAT", @"%@", v26);

    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    v45 = v27;
    v28 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    v29 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:v28];
    (*((void (**)(id, void, void *))v23 + 2))(v23, 0, v29);
  }
}

- (void)registerPaymentListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([(PKEntitlementWhitelist *)self->_whitelist supportsWebPayments] & 1) != 0
    || ([(PKEntitlementWhitelist *)self->_whitelist inAppPayments] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist cardOnFilePayments])
  {
    v11 = PDDefaultQueue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002D5FB0;
    v13[3] = &unk_100730578;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v11, v13);
  }
  else
  {
    uint64_t v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[PDInAppPaymentService registerPaymentListenerEndpoint:forHostIdentifier:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)retrievePaymentListenerEndpointForHostIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = [(PDInAppPaymentService *)self delegate];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002D6220;
    v10[3] = &unk_100746F88;
    id v11 = v7;
    [v8 inAppPaymentService:self retrievePaymentListenerEndpointForHostIdentifier:v6 completion:v10];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[PDInAppPaymentService retrievePaymentListenerEndpointForHostIdentifier:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)merchantStatusCheck:(id)a3 merchantDomain:(id)a4 sourceApplicationSecondaryIdentifier:(id)a5 handler:(id)a6
{
  id v31 = a3;
  id v10 = a4;
  id v11 = (char *)a5;
  id v12 = a6;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_100020B1C;
  v40[4] = sub_100021080;
  id v41 = 0;
  v13 = dispatch_group_create();
  if (![(PKEntitlementWhitelist *)self->_whitelist supportsWebPayments])
  {
    id v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[PDInAppPaymentService merchantStatusCheck:merchantDomain:sourceApplicationSecondaryIdentifier:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }
    goto LABEL_18;
  }
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator updateWebServiceConfigurationWithCompletion:0];
  if ([(PDInAppPaymentService *)self _hasValidSecureElement])
  {
    id v14 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebServiceContext];
    id v15 = [v14 primaryRegion];

    id v16 = [v15 inAppPaymentServicesURL];

    if (v16) {
      goto LABEL_6;
    }
  }
  v17 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebServiceContext];
  id v18 = [v17 configuration];
  id v19 = PKCurrentRegion();
  id v16 = [v18 paymentServicesURLForRegion:v19];

  if (v16) {
    goto LABEL_6;
  }
  id v20 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebServiceContext];
  id v21 = [v20 configuration];
  id v16 = [v21 paymentServicesURLForRegion:@"US"];

  if (v16)
  {
LABEL_6:
    id v22 = [objc_alloc((Class)PKPaymentCheckMerchantRequest) initWithMerchantIdentifier:v31 domainName:v10];
    id v23 = [v22 _urlRequestWithServiceURL:v16];
    if (v23)
    {
      v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v25 = [v23 URL];
        *(_DWORD *)buf = 138412290;
        v45 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Performing merchantStatusCheck with URL: %@", buf, 0xCu);
      }
      if (v11)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v11;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "source application secondary identifier set to %@", buf, 0xCu);
        }

        v26 = +[NSURLSessionConfiguration defaultSessionConfiguration];
        objc_msgSend(v26, "set_sourceApplicationSecondaryIdentifier:", v11);
        v27 = +[NSURLSession sessionWithConfiguration:v26];
      }
      else
      {
        v27 = +[NSURLSession sharedSession];
      }
      dispatch_group_enter(v13);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1002D6770;
      v36[3] = &unk_100746FB0;
      id v38 = v42;
      id v39 = v40;
      id v37 = v13;
      v28 = [v27 dataTaskWithRequest:v23 completionHandler:v36];
      [v28 resume];
    }
LABEL_18:
  }
  v29 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D68CC;
  block[3] = &unk_10073EB00;
  id v33 = v12;
  id v34 = v42;
  id v35 = v40;
  id v30 = v12;
  dispatch_group_notify(v13, v29, block);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

- (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 handler:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D6AA0;
  v11[3] = &unk_100746FD8;
  id v6 = a4;
  id v12 = v6;
  id v7 = objc_retainBlock(v11);
  whitelist = self->_whitelist;
  if (a3 == 4)
  {
    if ([(PKEntitlementWhitelist *)whitelist AMPCardEnrollment]) {
      goto LABEL_6;
    }
  }
  else if ([(PKEntitlementWhitelist *)whitelist supportsWebPayments])
  {
LABEL_6:
    id v9 = [(PDInAppPaymentService *)self _paymentServicesMerchantURLForAPIType:a3];
    goto LABEL_10;
  }
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
    goto LABEL_6;
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[PDInAppPaymentService paymentServicesMerchantURLForAPIType:handler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
  }

  id v9 = 0;
LABEL_10:
  ((void (*)(void *, BOOL, void *))v7[2])(v7, v9 != 0, v9);
}

- (void)secureElementStatusWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    (*((void (**)(id, BOOL, void))a3 + 2))(v5, [(PDInAppPaymentService *)self _hasValidSecureElement], 0);
  }
}

- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  if (!a3
    || a3 == 1
    && (([(PKEntitlementWhitelist *)self->_whitelist inAppPayments] & 1) != 0
     || [(PKEntitlementWhitelist *)self->_whitelist supportsWebPayments]))
  {
    [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator paymentHardwareStatusWithType:a3 completion:v6];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[PDInAppPaymentService paymentHardwareStatusWithType:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v8, 0xCu);
    }

    if (v6) {
      v6[2](v6, 0);
    }
  }
}

- (id)_paymentServicesMerchantURLForAPIType:(int64_t)a3
{
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator updateWebServiceConfigurationWithCompletion:0];
  id v5 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebServiceContext];
  id v6 = [v5 configuration];

  id v7 = PKCurrentRegion();
  int v8 = [v6 paymentServicesMerchantURLForRegion:v7];

  if (!v8)
  {
    int v8 = [v6 paymentServicesMerchantURLForRegion:@"US"];
  }
  if ((unint64_t)a3 > 3) {
    CFStringRef v9 = &stru_10075AAD8;
  }
  else {
    CFStringRef v9 = *(&off_1007470E8 + a3);
  }
  id v10 = [v8 URLByAppendingPathComponent:v9];

  return v10;
}

- (BOOL)_hasValidSecureElement
{
  int IsAvailable = PKSecureElementIsAvailable();
  if (IsAvailable)
  {
    unsigned int v3 = +[PKSecureElement isInFailForward];
    if (v3)
    {
      v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Secure Element in fail forward", v6, 2u);
      }
    }
    LOBYTE(IsAvailable) = v3 ^ 1;
  }
  return IsAvailable;
}

- (void)cardsAvailableForAMPWithCountryCode:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = (void (**)(id, int64_t))a4;
    int64_t v7 = [(PDInAppPaymentService *)self _cardsAvailableForAMPWithCountryCode:a3];
    int v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = PKAMPCardEligibilityStatusToString();
      int v10 = 136315394;
      id v11 = "-[PDInAppPaymentService cardsAvailableForAMPWithCountryCode:completion:]";
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
    }
    v6[2](v6, v7);
  }
}

- (int64_t)_cardsAvailableForAMPWithCountryCode:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist AMPCardEnrollment])
  {
    if (PKSecureElementIsAvailable()
      && (+[PKSecureElement isInFailForward] & 1) == 0)
    {
      if (PKPasscodeEnabled())
      {
        databaseManager = self->_databaseManager;
        id v8 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
        CFStringRef v9 = [(PDDatabaseManager *)databaseManager paymentPassesWithIssuerCountryCodes:v8];

        if ([v9 count])
        {
          int64_t v5 = [(PDInAppPaymentService *)self _AMPEnrollmentAccountStatus];
          if (v5 == 1)
          {
            PDDefaultPaymentPassUniqueIdentifier();
            v13[0] = _NSConcreteStackBlock;
            v13[1] = 3221225472;
            v13[2] = sub_1002D7130;
            v13[3] = &unk_100739820;
            id v14 = (id)objc_claimAutoreleasedReturnValue();
            id v10 = v14;
            id v11 = [v9 objectsPassingTest:v13];
            id v12 = [v11 count];

            if (v12) {
              int64_t v5 = 1;
            }
            else {
              int64_t v5 = 8;
            }
          }
        }
        else
        {
          int64_t v5 = 5;
        }
      }
      else
      {
        int64_t v5 = 2;
      }
    }
    else
    {
      int64_t v5 = 4;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)cardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    unsigned int v11 = [(PKEntitlementWhitelist *)self->_whitelist AMPCardEnrollment];
    unint64_t v12 = [(PDInAppPaymentService *)self _cardsAvailableForAMPWithCountryCode:v9];
    v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = PKAMPCardEligibilityStatusToString();
      *(_DWORD *)buf = 138412290;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AMP card eligibility: %@", buf, 0xCu);
    }
    if (v11)
    {
      if (v12 <= 8 && ((1 << v12) & 0x182) != 0)
      {
        paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1002D7414;
        v20[3] = &unk_100737868;
        id v21 = v8;
        id v22 = self;
        id v23 = v10;
        [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v20];

        id v16 = v21;
LABEL_10:

        goto LABEL_11;
      }
      id v18 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = @"This device is not currently eligible for enrollment.";
      id v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v16 = [v18 initWithDomain:PKPaymentErrorDomain code:1 userInfo:v19];
    }
    else
    {
      id v16 = [objc_alloc((Class)NSError) initWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    }
    id v17 = [objc_alloc((Class)PKAMPCardRegistrationResponse) initWithCardData:0 brokerURL:0 paymentServicesURL:0 error:v16];
    (*((void (**)(id, id))v10 + 2))(v10, v17);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)enrollPaymentPassWithUniqueIdentifier:(id)a3 merchantSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1002D7928;
  v34[3] = &unk_100747028;
  id v10 = a5;
  id v35 = v10;
  unsigned int v11 = objc_retainBlock(v34);
  if (PKBypassCertValidation())
  {
    BOOL v12 = 1;
  }
  else
  {
    v13 = PKValidatePaymentMerchantSession();
    BOOL v12 = v13 == 0;
  }
  if ([(PKEntitlementWhitelist *)self->_whitelist AMPCardEnrollment]) {
    unsigned int v14 = 1;
  }
  else {
    unsigned int v14 = [(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess];
  }
  if ((v12 & v14) == 1)
  {
    id v15 = +[NSMutableData data];
    id v16 = [v9 merchantSessionIdentifier];
    id v17 = [v16 dataUsingEncoding:4];
    [v15 appendData:v17];

    id v18 = [v9 nonce];
    id v19 = objc_msgSend(v18, "pk_decodeHexadecimal");
    [v15 appendData:v19];

    id v20 = [v9 ampEnrollmentPinning];
    [v15 appendData:v20];

    id v21 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v8];
    id v22 = [v21 paymentPass];

    id v23 = [v22 devicePrimaryInAppPaymentApplication];
    secureElement = self->_secureElement;
    CFStringRef v25 = [v15 SHA256Hash];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1002D7940;
    v29[3] = &unk_1007470A0;
    v29[4] = self;
    id v30 = v9;
    id v31 = v22;
    id v32 = v23;
    id v33 = v11;
    id v26 = v23;
    id v27 = v22;
    [(PKSecureElement *)secureElement signChallenge:v25 forPaymentApplication:v26 withCompletion:v29];
  }
  else
  {
    v28 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v37 = "-[PDInAppPaymentService enrollPaymentPassWithUniqueIdentifier:merchantSession:completion:]";
      __int16 v38 = 1024;
      unsigned int v39 = v14;
      __int16 v40 = 1024;
      BOOL v41 = v12;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Method: %s isEntitledClient: %d isValidSignature: %d", buf, 0x18u);
    }

    ((void (*)(void *, void, void))v11[2])(v11, 0, 0);
  }
}

- (int64_t)_AMPEnrollmentAccountStatus
{
  v2 = +[ACAccountStore ams_sharedAccountStore];
  unsigned int v3 = objc_msgSend(v2, "ams_activeiCloudAccount");
  if (v3)
  {
    id v4 = objc_msgSend(v2, "ams_activeiTunesAccount");
    int64_t v5 = objc_msgSend(v4, "ams_altDSID");
    id v6 = objc_msgSend(v3, "ams_altDSID");
    unsigned int v7 = [v6 isEqualToString:v5];

    id v8 = +[AKAccountManager sharedInstance];
    id v9 = [v8 authKitAccountWithAltDSID:v5];

    if ((objc_msgSend(v9, "ams_isManagedAppleID") & 1) != 0
      || ((+[AKAccountManager sharedInstance],
           id v10 = objc_claimAutoreleasedReturnValue(),
           id v11 = [v10 securityLevelForAccount:v9],
           v10,
           !v7)
        ? (int64_t v12 = 6)
        : (int64_t v12 = 7),
          v11 == (id)4))
    {
      int64_t v12 = 1;
    }
  }
  else
  {
    int64_t v12 = 3;
  }

  return v12;
}

- (void)validatePayLaterMerchandisingConfiguration:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (!a4) {
      goto LABEL_9;
    }
    if (a4 == 1)
    {
      if ([(PKEntitlementWhitelist *)self->_whitelist payLaterPayInFourMerchandising])
      {
        id v10 = +[PKPayLaterMerchandisingUtilities sharedInstance];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1002D7F14;
        v13[3] = &unk_1007470C8;
        id v14 = v9;
        [v10 evaluateEligibilityForConfiguration:v8 completion:v13];

        goto LABEL_10;
      }
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User not entitled for payLaterPayInFourMerchandising", buf, 2u);
      }

LABEL_9:
      int64_t v12 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void *, void))v9 + 2))(v9, v12, 0);
    }
  }
LABEL_10:
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (void)setPaymentWebServiceCoordinator:(id)a3
{
}

- (PKIDSManager)idsManager
{
  return self->_idsManager;
}

- (void)setIdsManager:(id)a3
{
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (PDInAppPaymentServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDInAppPaymentServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_idsManager, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end