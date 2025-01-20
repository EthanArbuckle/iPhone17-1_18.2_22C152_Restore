@interface PDIssuerBindingManager
- (BOOL)_isIssuerBindingAvailable;
- (PDIssuerBindingManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 notificationMananger:(id)a5 notificationStreamManager:(id)a6 webServiceCoordinator:(id)a7 paymentWebServiceCoordinator:(id)a8 secureElement:(id)a9;
- (id)createCurrentNotificationRegistrationState;
- (void)_sendGenericUserNotificationForStateUpdate:(unint64_t)a3;
- (void)_sendUserNotificationForStateUpdate:(unint64_t)a3 forPass:(id)a4;
- (void)_updateActivatingCheckSchedule;
- (void)_updateIssuerBindingAvailability;
- (void)_updateNFCPayloadState:(unint64_t)a3 forPassUniqueIdentifier:(id)a4 notify:(BOOL)a5;
- (void)_verifyActivatingPasses;
- (void)_verifyAllPasses;
- (void)_verifyIssuerBindingInformationForPassUniqueIdentifier:(id)a3 passIngestionDate:(id)a4 fidoProfile:(id)a5 signedChallenge:(id)a6 forFirstTime:(BOOL)a7;
- (void)dealloc;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)noteAccountAdded;
- (void)noteAccountRemoved;
- (void)passAddedOrUpdated:(id)a3 passAdded:(BOOL)a4;
- (void)passRemoved:(id)a3;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)registerObserver:(id)a3;
- (void)requestIssuerBoundPassesWithBindingWithData:(id)a3 withCompletion:(id)a4;
- (void)scheduleVerifyAllIssuerBoundPassesActivity;
- (void)unregisterObserver:(id)a3;
- (void)updateNFCPayloadState:(unint64_t)a3 forPass:(id)a4;
@end

@implementation PDIssuerBindingManager

- (void)registerObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (PDIssuerBindingManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 notificationMananger:(id)a5 notificationStreamManager:(id)a6 webServiceCoordinator:(id)a7 paymentWebServiceCoordinator:(id)a8 secureElement:(id)a9
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v16 = a8;
  id v17 = a9;
  v33.receiver = self;
  v33.super_class = (Class)PDIssuerBindingManager;
  v18 = [(PDIssuerBindingManager *)&v33 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_cardFileManager, a4);
    objc_storeStrong((id *)&v19->_secureElement, a9);
    objc_storeStrong((id *)&v19->_webServiceCoordinator, a7);
    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a8);
    [(PDPaymentWebServiceCoordinator *)v19->_paymentWebServiceCoordinator registerObserver:v19];
    objc_storeStrong((id *)&v19->_notificationMananger, a5);
    objc_storeStrong((id *)&v19->_notificationStreamManager, a6);
    [(PDNotificationStreamManager *)v19->_notificationStreamManager registerConsumer:v19];
    uint64_t v20 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v20;

    v19->_observersLock._os_unfair_lock_opaque = 0;
    v19->_lock._os_unfair_lock_opaque = 0;
    v22 = +[PKAppleAccountManager sharedInstance];
    v23 = [v22 appleAccountInformation];
    uint64_t v24 = [v23 creationDate];
    lastAccountAddedDate = v19->_lastAccountAddedDate;
    v19->_lastAccountAddedDate = (NSDate *)v24;

    v19->_isIssuerBindingSupported = [(PDIssuerBindingManager *)v19 _isIssuerBindingAvailable];
    v26 = PDHeavyQueue();
    PDScheduledActivityClientRegister();
  }
  return v19;
}

- (void)dealloc
{
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator unregisterObserver:self];
  [(PDNotificationStreamManager *)self->_notificationStreamManager unregisterConsumer:self];
  v3.receiver = self;
  v3.super_class = (Class)PDIssuerBindingManager;
  [(PDIssuerBindingManager *)&v3 dealloc];
}

- (void)requestIssuerBoundPassesWithBindingWithData:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  uint64_t v105 = 0;
  v106 = (id *)&v105;
  uint64_t v107 = 0x3032000000;
  v108 = sub_100020D9C;
  v109 = sub_1000211C0;
  id v110 = 0;
  os_unfair_lock_lock(&self->_lock);
  BOOL isIssuerBindingSupported = self->_isIssuerBindingSupported;
  os_unfair_lock_unlock(&self->_lock);
  if (isIssuerBindingSupported)
  {
    PKLogFacilityTypeGetObject();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, v11, "passIssuerData:generate", "", (uint8_t *)&buf, 2u);
      }
    }

    v12 = v106;
    id v104 = v106[5];
    v13 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v104];
    objc_storeStrong(v12 + 5, v104);
    id v14 = v106[5];
    if (v14 || !v13)
    {
      uint64_t v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Pass Issuer Data Generation -  unable to parse issuerData error: %@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v25 = +[NSError errorWithDomain:PKIssuerBindingErrorDomain code:2 userInfo:0];
      id v26 = v106[5];
      v106[5] = (id)v25;

      v7[2](v7, 0, v106[5]);
    }
    else
    {
      v15 = [v13 PKStringForKey:@"sessionIdentifier"];
      id v16 = [v13 PKStringForKey:@"callbackURL"];
      id v17 = objc_alloc((Class)PKFidoProfile);
      v18 = [v13 objectForKey:@"fidoProfile"];
      id v19 = [v17 initWithDictionary:v18];

      v49 = [v19 relyingPartyIdentifier];
      v48 = [v19 accountHash];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v112 = 0x3032000000;
      v113 = sub_100020D9C;
      v114 = sub_1000211C0;
      uint64_t v20 = [v19 keyHash];
      objc_msgSend(v20, "pk_decodeHexadecimal");
      id v115 = (id)objc_claimAutoreleasedReturnValue();

      if (v49 && v48)
      {
        if (PKHasVerifiedPrimaryAppleAccount())
        {
          v47 = PKPrimaryAppleAccountFormattedUsername();
        }
        else
        {
          v47 = 0;
        }
        v46 = [v13 PKStringForKey:@"displayableName"];
        if (v47)
        {
          v102[0] = 0;
          v102[1] = v102;
          v102[2] = 0x2020000000;
          char v103 = 1;
          *(void *)v96 = 0;
          v97 = v96;
          uint64_t v98 = 0x3032000000;
          v99 = sub_100020D9C;
          v100 = sub_1000211C0;
          id v101 = 0;
          v94[0] = 0;
          v94[1] = v94;
          v94[2] = 0x3032000000;
          v94[3] = sub_100020D9C;
          v94[4] = sub_1000211C0;
          id v95 = 0;
          v92[0] = 0;
          v92[1] = v92;
          v92[2] = 0x3032000000;
          v92[3] = sub_100020D9C;
          v92[4] = sub_1000211C0;
          id v93 = 0;
          id v30 = +[NSUUID UUID];
          id v31 = [v30 UUIDString];
          v45 = [v31 dataUsingEncoding:4];

          v44 = v15;
          id v32 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
          v91[0] = _NSConcreteStackBlock;
          v91[1] = 3221225472;
          v91[2] = sub_10041F850;
          v91[3] = &unk_100730D50;
          v91[4] = self;
          v91[5] = &v105;
          [v32 addOperation:v91];
          v84[0] = _NSConcreteStackBlock;
          v84[1] = 3221225472;
          v84[2] = sub_10041FA1C;
          v84[3] = &unk_1007502E8;
          v88 = v94;
          id v85 = v46;
          id v86 = v47;
          v87 = self;
          v89 = v96;
          v90 = &v105;
          [v32 addOperation:v84];
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472;
          v79[2] = sub_10041FE58;
          v79[3] = &unk_1007395B8;
          p_long long buf = &buf;
          v79[4] = self;
          id v33 = v49;
          id v80 = v33;
          id v34 = v48;
          id v81 = v34;
          v83 = v102;
          [v32 addOperation:v79];
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472;
          v72[2] = sub_10041FF98;
          v72[3] = &unk_100750338;
          v76 = v102;
          v72[4] = self;
          id v35 = v33;
          id v73 = v35;
          id v36 = v34;
          id v74 = v36;
          id v37 = v45;
          id v75 = v37;
          v77 = &buf;
          v78 = &v105;
          [v32 addOperation:v72];
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_10042025C;
          v64[3] = &unk_100750388;
          v64[4] = self;
          id v65 = v35;
          id v66 = v36;
          v68 = &buf;
          id v38 = v37;
          id v67 = v38;
          v69 = v96;
          v70 = v92;
          v71 = &v105;
          [v32 addOperation:v64];
          v62[0] = 0;
          v62[1] = v62;
          v62[2] = 0x3032000000;
          v62[3] = sub_100020D9C;
          v62[4] = sub_1000211C0;
          id v63 = 0;
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_1004204E0;
          v54[3] = &unk_1007503D8;
          v15 = v44;
          id v55 = v44;
          v58 = &buf;
          v59 = v92;
          id v56 = v16;
          v57 = self;
          v60 = v62;
          v61 = &v105;
          [v32 addOperation:v54];
          v39 = +[NSNull null];
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_100420810;
          v50[3] = &unk_100750400;
          v52 = &v105;
          v51 = v7;
          v53 = v62;
          id v40 = [v32 evaluateWithInput:v39 completion:v50];

          _Block_object_dispose(v62, 8);
          _Block_object_dispose(v92, 8);

          _Block_object_dispose(v94, 8);
          _Block_object_dispose(v96, 8);

          _Block_object_dispose(v102, 8);
        }
        else
        {
          v41 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v96 = 0;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Pass Issuer Data Generation -  could not get account", v96, 2u);
          }

          uint64_t v42 = +[NSError errorWithDomain:PKIssuerBindingErrorDomain code:1 userInfo:0];
          id v43 = v106[5];
          v106[5] = (id)v42;

          v7[2](v7, 0, v106[5]);
        }
      }
      else
      {
        v27 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v96 = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Pass Issuer Data Generation -  valid fido profile not supplied", v96, 2u);
        }

        uint64_t v28 = +[NSError errorWithDomain:PKPassKitErrorDomain code:2 userInfo:0];
        id v29 = v106[5];
        v106[5] = (id)v28;

        v7[2](v7, 0, v106[5]);
      }
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Pass Issuer Data Generation - Issuer Binding Not Supported.", (uint8_t *)&buf, 2u);
    }

    uint64_t v22 = +[NSError errorWithDomain:PKIssuerBindingErrorDomain code:8 userInfo:0];
    id v23 = v106[5];
    v106[5] = (id)v22;

    v7[2](v7, 0, v106[5]);
  }
  _Block_object_dispose(&v105, 8);
}

- (void)scheduleVerifyAllIssuerBoundPassesActivity
{
  if (PDScheduledActivityExists())
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Verify all bound passes activity already exists", buf, 2u);
    }
  }
  else
  {
    id v3 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:0];
    [v3 setRepeating:1];
    [v3 setRequireScreenSleep:1];
    [v3 setRequireMainsPower:1];
    [v3 setRepeatInterval:86400.0];
    [v3 setReason:@"check all bound passes"];
    PDScheduledActivityRegister();
  }
}

- (void)_verifyAllPasses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isVerifyingAllPasses)
  {
    os_unfair_lock_unlock(p_lock);
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Verification of all passess processing - coalescing", buf, 2u);
    }
  }
  else
  {
    self->_isVerifyingAllPasses = 1;
    os_unfair_lock_unlock(p_lock);
    id v5 = PDHeavyQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100420A78;
    block[3] = &unk_10072E1E8;
    block[4] = self;
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v5, v6);
  }
}

- (void)passAddedOrUpdated:(id)a3 passAdded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL isIssuerBindingSupported = self->_isIssuerBindingSupported;
  os_unfair_lock_unlock(&self->_lock);
  unsigned int v8 = [v6 supportsIssuerBinding];
  if (!isIssuerBindingSupported || v8 == 0)
  {
    os_signpost_id_t v10 = [v6 uniqueID];
    os_signpost_id_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping issuer binding validation for pass and marking as valid:%@", (uint8_t *)&v18, 0xCu);
    }

    [(PDIssuerBindingManager *)self _updateNFCPayloadState:0 forPassUniqueIdentifier:v10 notify:0];
  }
  else
  {
    v12 = [v6 issuerBindingInformation];
    v13 = [v12 PKStringForKey:@"issuerBindingData"];
    id v14 = objc_msgSend(v13, "pk_decodeHexadecimal");

    v15 = [v6 uniqueID];
    id v16 = [v6 ingestedDate];
    id v17 = [v6 fidoProfile];
    [(PDIssuerBindingManager *)self _verifyIssuerBindingInformationForPassUniqueIdentifier:v15 passIngestionDate:v16 fidoProfile:v17 signedChallenge:v14 forFirstTime:v4];
  }
}

- (void)passRemoved:(id)a3
{
}

- (void)noteAccountAdded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = +[PKAppleAccountManager sharedInstance];
  id v5 = [v4 appleAccountInformation];
  id v6 = [v5 creationDate];
  lastAccountAddedDate = self->_lastAccountAddedDate;
  self->_lastAccountAddedDate = v6;

  os_unfair_lock_unlock(p_lock);
  [(PDIssuerBindingManager *)self _verifyAllPasses];
}

- (void)noteAccountRemoved
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastAccountAddedDate = self->_lastAccountAddedDate;
  self->_lastAccountAddedDate = 0;

  BOOL isIssuerBindingSupported = self->_isIssuerBindingSupported;
  os_unfair_lock_unlock(p_lock);
  if (isIssuerBindingSupported)
  {
    id v6 = PDHeavyQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100420FAC;
    block[3] = &unk_10072E1E8;
    block[4] = self;
    dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v6, v7);
  }
}

- (void)unregisterObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (BOOL)_isIssuerBindingAvailable
{
  v2 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
  id v3 = [v2 targetDevice];
  BOOL v4 = [v2 context];
  id v5 = [v4 configuration];
  id v6 = [v2 targetDevice];
  dispatch_block_t v7 = [v6 deviceRegion];
  unsigned int v8 = [v5 featureWithType:11 inRegion:v7];

  v9 = [v8 versionRange];
  if (!v8) {
    goto LABEL_5;
  }
  if (![v8 enabled])
  {
    unsigned __int8 v12 = 0;
    goto LABEL_7;
  }
  if (v9)
  {
    os_signpost_id_t v10 = [v3 deviceVersion];
    os_signpost_id_t v11 = [v3 deviceClass];
    unsigned __int8 v12 = [v9 versionMeetsRequirements:v10 deviceClass:v11];
  }
  else
  {
LABEL_5:
    unsigned __int8 v12 = 1;
  }
LABEL_7:

  return v12;
}

- (void)_verifyIssuerBindingInformationForPassUniqueIdentifier:(id)a3 passIngestionDate:(id)a4 fidoProfile:(id)a5 signedChallenge:(id)a6 forFirstTime:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[ACAccountStore defaultStore];
  id v17 = objc_msgSend(v16, "aa_primaryAppleAccount");

  if (v17)
  {
    id v18 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10042160C;
    v34[3] = &unk_10072E5C0;
    v34[4] = self;
    [v18 addOperation:v34];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1004216F0;
    v29[3] = &unk_100734040;
    v29[4] = self;
    id v30 = v15;
    id v31 = v14;
    id v19 = v12;
    id v32 = v19;
    p_long long buf = &buf;
    [v18 addOperation:v29];
    uint64_t v20 = +[NSNull null];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100421940;
    v23[3] = &unk_100750450;
    v27 = &buf;
    id v24 = v13;
    uint64_t v25 = self;
    BOOL v28 = a7;
    id v26 = v19;
    id v21 = [v18 evaluateWithInput:v20 completion:v23];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Account missing marking pass: %@ invalid", (uint8_t *)&buf, 0xCu);
    }

    [(PDIssuerBindingManager *)self _updateNFCPayloadState:2 forPassUniqueIdentifier:v12 notify:1];
  }
}

- (void)updateNFCPayloadState:(unint64_t)a3 forPass:(id)a4
{
  id v6 = [a4 uniqueID];
  [(PDIssuerBindingManager *)self _updateNFCPayloadState:a3 forPassUniqueIdentifier:v6 notify:1];
}

- (void)_updateNFCPayloadState:(unint64_t)a3 forPassUniqueIdentifier:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v15 = v8;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating NFC Payload State for pass: %@ with newState: %lu", buf, 0x16u);
  }

  buf[0] = 0;
  [(PDDatabaseManager *)self->_databaseManager updateNFCPayloadState:a3 forPassUniqueIdentifier:v8 didChange:buf];
  if (buf[0])
  {
    os_unfair_lock_lock(&self->_observersLock);
    os_signpost_id_t v10 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_observersLock);
    [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v8];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100421C50;
    v12[3] = &unk_100750478;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v11;
    [v10 enumerateObjectsUsingBlock:v12];
    if (v5 && ((PKIsPhone() & 1) != 0 || PKIsWatch())) {
      [(PDIssuerBindingManager *)self _sendUserNotificationForStateUpdate:a3 forPass:v11];
    }
  }
}

- (void)_sendUserNotificationForStateUpdate:(unint64_t)a3 forPass:(id)a4
{
  id v13 = a4;
  id v6 = @"ISSUER_DATA_BINDING_NOTIFICATION_PASS_ENABLED_MESSAGE";
  dispatch_block_t v7 = @"ISSUER_DATA_BINDING_NOTIFICATION_PASS_ENABLED_TITLE";
  switch(a3)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      id v6 = @"ISSUER_DATA_BINDING_NOTIFICATION_MISMATCH_MESSAGE";
      goto LABEL_5;
    case 2uLL:
      id v6 = @"ISSUER_DATA_BINDING_NOTIFICATION_ACCOUNT_MISSING_MESSAGE";
LABEL_5:
      dispatch_block_t v7 = @"ISSUER_DATA_BINDING_NOTIFICATION_PASS_DISABLED_TITLE";
LABEL_6:
      v9 = PKLocalizedPaymentString(&v7->isa);
      id v8 = PKLocalizedPaymentString(&v6->isa);
      goto LABEL_7;
    case 3uLL:
      goto LABEL_8;
    default:
      id v8 = 0;
      v9 = 0;
LABEL_7:
      os_signpost_id_t v10 = [PDNFCPayloadStateUpdateUserNotification alloc];
      id v11 = [v13 uniqueID];
      id v12 = [(PDNFCPayloadStateUpdateUserNotification *)v10 initWithTitle:v9 message:v8 forPassUniqueIdentifier:v11];

      [(PDUserNotificationManager *)self->_notificationMananger insertUserNotification:v12];
LABEL_8:

      return;
  }
}

- (void)_sendGenericUserNotificationForStateUpdate:(unint64_t)a3
{
  if (a3 == 2)
  {
    BOOL v5 = [PDNFCPayloadStateUpdateUserNotification alloc];
    id v6 = PKLocalizedPaymentString(@"ISSUER_DATA_BINDING_NOTIFICATION_PASSES_DISABLED_TITLE");
    dispatch_block_t v7 = PKLocalizedPaymentString(@"ISSUER_DATA_BINDING_NOTIFICATION_ACCOUNT_MISSING_MESSAGE_MULTIPLE");
    id v8 = [(PDGenericUserNotification *)v5 initWithTitle:v6 message:v7];

    [(PDUserNotificationManager *)self->_notificationMananger insertUserNotification:v8];
  }
}

- (void)_verifyActivatingPasses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isVerifyingActivatingPasses)
  {
    self->_didDeferWork = 1;
    os_unfair_lock_unlock(p_lock);
    BOOL v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Verification already processing - coalescing", buf, 2u);
    }
  }
  else
  {
    self->_didDeferWork = 0;
    self->_isVerifyingActivatingPasses = 1;
    os_unfair_lock_unlock(p_lock);
    BOOL v5 = PDHeavyQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100421FC0;
    block[3] = &unk_10072E1E8;
    block[4] = self;
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v5, v6);
  }
}

- (void)_updateIssuerBindingAvailability
{
  BOOL v3 = [(PDIssuerBindingManager *)self _isIssuerBindingAvailable];
  os_unfair_lock_lock(&self->_lock);
  if (v3)
  {
    if (!self->_isIssuerBindingSupported)
    {
      self->_BOOL isIssuerBindingSupported = v3;
      os_unfair_lock_unlock(&self->_lock);
      BOOL v4 = PDHeavyQueue();
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10042251C;
      v8[3] = &unk_10072E1E8;
      v8[4] = self;
      BOOL v5 = v8;
LABEL_8:
      dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, v5);
      dispatch_async(v4, v7);

      return;
    }
  }
  else if (self->_isIssuerBindingSupported)
  {
    self->_BOOL isIssuerBindingSupported = v3;
    os_unfair_lock_unlock(&self->_lock);
    dispatch_block_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Issuer binding disabled by config change - marking all passes as valid", buf, 2u);
    }

    BOOL v4 = PDHeavyQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004223F8;
    block[3] = &unk_10072E1E8;
    block[4] = self;
    BOOL v5 = block;
    goto LABEL_8;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_updateActivatingCheckSchedule
{
  BOOL v3 = PDHeavyQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100422760;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
  dispatch_async(v3, v4);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"checkActivatingPasses"])
  {
    [(PDIssuerBindingManager *)self _verifyActivatingPasses];
  }
  else if ([v5 isEqualToString:@"checkAllPasses"])
  {
    [(PDIssuerBindingManager *)self _verifyAllPasses];
  }
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(PDNotificationStreamRegistrationState);
  id v3 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"com.apple.security.view-change.ApplePay", @"com.apple.seserviced.keysync.fido.tlk.synced", 0);
  [(PDNotificationStreamRegistrationState *)v2 setNotificationNames:v3 forStream:0];

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) != 0 || PKEqualObjects())
  {
    dispatch_block_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDIssuerBindingManager: did recieve underlying key update notification", v8, 2u);
    }

    [(PDIssuerBindingManager *)self _verifyAllPasses];
  }
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccountAddedDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
  objc_storeStrong((id *)&self->_notificationMananger, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end