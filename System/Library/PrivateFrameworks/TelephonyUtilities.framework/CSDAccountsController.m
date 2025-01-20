@interface CSDAccountsController
- (BOOL)faceTimeIDMatchesAppleID;
- (BOOL)isFaceTimeAudioAvailable;
- (BOOL)isFaceTimeVideoAvailable;
- (BOOL)isValidOutgoingCallerID:(id)a3;
- (CSDAccountsController)init;
- (CSDAccountsControllerDelegate)delegate;
- (NSString)debugDescription;
- (NSString)outgoingCallerID;
- (OS_dispatch_queue)queue;
- (int64_t)_faceTimeAudioAvailability;
- (int64_t)_faceTimeVideoAvailability;
- (void)_updateOutgoingCallerID;
- (void)callerIDChanged:(id)a3;
- (void)dealloc;
- (void)devicesChanged:(id)a3;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)serviceAvailabilityChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOutgoingCallerID:(id)a3;
- (void)updateOutgoingCallerIDAndSendDelegateCallbacksIfNecessary;
@end

@implementation CSDAccountsController

- (CSDAccountsController)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSDAccountsController;
  v2 = [(CSDAccountsController *)&v12 init];
  if (v2)
  {
    v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      id v5 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing %@", buf, 0xCu);
    }
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[@"com.apple.telephonyutilities.callservicesd.accountscontroller" UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074C48;
    block[3] = &unk_100504EC0;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[FTCServiceAvailabilityCenter sharedInstance];
  [v3 removeListenerID:@"com.apple.telephonyutilities.callservicesd.accountscontroller" forService:0];

  v4 = +[FTCServiceAvailabilityCenter sharedInstance];
  [v4 removeListenerID:@"com.apple.telephonyutilities.callservicesd.accountscontroller" forService:2];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)CSDAccountsController;
  [(CSDAccountsController *)&v6 dealloc];
}

- (NSString)debugDescription
{
  v3 = +[NSMutableString stringWithFormat:@"%@\n", self];
  unsigned int v4 = [(CSDAccountsController *)self faceTimeIDMatchesAppleID];
  CFStringRef v5 = @"NO";
  if (v4) {
    CFStringRef v5 = @"YES";
  }
  [v3 appendFormat:@"    faceTimeIDMatchesAppleID: %@\n", v5];
  objc_msgSend(v3, "appendFormat:", @"    faceTimeAudioAvailability: %ld\n", -[CSDAccountsController _faceTimeAudioAvailability](self, "_faceTimeAudioAvailability"));
  objc_msgSend(v3, "appendFormat:", @"    faceTimeVideoAvailability: %ld\n", -[CSDAccountsController _faceTimeVideoAvailability](self, "_faceTimeVideoAvailability"));
  objc_super v6 = [(CSDAccountsController *)self outgoingCallerID];
  [v3 appendFormat:@"    outgoingCallerID: %@\n", v6];

  return (NSString *)v3;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSDAccountsController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Active accounts changed for service %@: %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = [(CSDAccountsController *)self delegate];
  [v10 accountsChanged];

  [(CSDAccountsController *)self updateOutgoingCallerIDAndSendDelegateCallbacksIfNecessary];
}

- (void)callerIDChanged:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDAccountsController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100075254;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)serviceAvailabilityChanged:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDAccountsController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000753B8;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)devicesChanged:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDAccountsController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007552C;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)faceTimeIDMatchesAppleID
{
  v2 = +[CSDFaceTimeVideoIDSService sharedInstance];
  v3 = [v2 service];
  id v4 = [v3 iCloudAccount];

  CFStringRef v5 = +[CSDRelayIDSService sharedInstance];
  id v6 = [v5 service];
  id v7 = [v6 iCloudAccount];

  if ([v4 isActive] && objc_msgSend(v7, "isActive"))
  {
    id v8 = [v4 profileID];
    if (v8)
    {
      v9 = [v7 profileID];
      if (v9)
      {
        v10 = [v4 profileID];
        int v11 = [v7 profileID];
        unsigned __int8 v12 = [v10 isEqualToIgnoringCase:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }
  __int16 v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [v4 isActive];
    v15 = [v4 profileID];
    unsigned int v16 = [v7 isActive];
    v17 = [v7 profileID];
    int v19 = 138413570;
    v20 = v4;
    __int16 v21 = 1024;
    unsigned int v22 = v14;
    __int16 v23 = 2112;
    v24 = v15;
    __int16 v25 = 2112;
    v26 = v7;
    __int16 v27 = 1024;
    unsigned int v28 = v16;
    __int16 v29 = 2112;
    v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FaceTime iCloud account is %@ (isActive=%d, profileID=%@) and relay iCloud account is %@ (isActive=%d, profileID=%@)", (uint8_t *)&v19, 0x36u);
  }
  return v12;
}

- (BOOL)isFaceTimeAudioAvailable
{
  return (id)[(CSDAccountsController *)self _faceTimeAudioAvailability] == (id)1;
}

- (BOOL)isFaceTimeVideoAvailable
{
  return (id)[(CSDAccountsController *)self _faceTimeVideoAvailability] == (id)1;
}

- (NSString)outgoingCallerID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10007596C;
  int v11 = sub_10007597C;
  id v12 = 0;
  v3 = [(CSDAccountsController *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100075984;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (int64_t)_faceTimeAudioAvailability
{
  v2 = +[FTCServiceAvailabilityCenter sharedInstance];
  id v3 = [v2 availabilityForListenerID:@"com.apple.telephonyutilities.callservicesd.accountscontroller" forService:2];

  return (int64_t)v3;
}

- (int64_t)_faceTimeVideoAvailability
{
  v2 = +[FTCServiceAvailabilityCenter sharedInstance];
  id v3 = [v2 availabilityForListenerID:@"com.apple.telephonyutilities.callservicesd.accountscontroller" forService:0];

  return (int64_t)v3;
}

- (void)updateOutgoingCallerIDAndSendDelegateCallbacksIfNecessary
{
  id v3 = [(CSDAccountsController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075AB8;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_updateOutgoingCallerID
{
  id v3 = [(CSDAccountsController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[CSDFaceTimeVideoIDSService sharedInstance];
  CFStringRef v5 = [v4 callerID];

  if ([(CSDAccountsController *)self isValidOutgoingCallerID:v5])
  {
    id v6 = (NSString *)[v5 copy];
    outgoingCallerID = self->_outgoingCallerID;
    self->_outgoingCallerID = v6;

    goto LABEL_26;
  }
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = (NSString *)v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FaceTime caller ID %@ is not a valid outgoing relay caller ID", buf, 0xCu);
  }

  uint64_t v9 = +[CSDRelayIDSService sharedInstance];
  v10 = [v9 availableOutgoingRelayCallerIDs];

  int v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to find a valid outgoing caller ID in set of available outgoing caller IDs %@", buf, 0xCu);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10007602C;
  v29[3] = &unk_100505DE8;
  v29[4] = self;
  id v12 = [(NSString *)v10 objectsPassingTest:v29];
  if ([v12 count] == (id)1)
  {
    __int16 v13 = [v12 anyObject];
    unsigned int v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v13;
      __int16 v32 = 2112;
      v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Selected outgoing caller ID %@ from list of available outgoing caller IDs %@", buf, 0x16u);
    }

    if (v13) {
      goto LABEL_25;
    }
  }
  else
  {
    v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Could not automatically select an outgoing caller ID; multiple telephone numbers are listed in the set of availa"
        "ble outgoing caller IDs %@",
        buf,
        0xCu);
    }
  }
  unsigned int v16 = +[CSDFaceTimeVideoIDSService sharedInstance];
  v17 = [v16 account];
  v18 = [v17 vettedAliases];

  int v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Attempting to find a valid outgoing caller ID in list of vetted account aliases %@", buf, 0xCu);
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100076038;
  v28[3] = &unk_100505E10;
  v28[4] = self;
  v20 = [(NSString *)v18 indexesOfObjectsPassingTest:v28];
  id v21 = [v20 count];
  unsigned int v22 = sub_100008DCC();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21 == (id)1)
  {
    if (v23)
    {
      *(_DWORD *)buf = 138412546;
      v31 = 0;
      __int16 v32 = 2112;
      v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Selected outgoing caller ID %@ from list of vetted account aliases %@", buf, 0x16u);
    }

    -[NSString objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", [v20 firstIndex]);
    __int16 v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v23)
    {
      *(_DWORD *)buf = 138412290;
      v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Could not automatically select an outgoing caller ID; multiple telephone numbers are listed in the set of vetted"
        " account aliases IDs %@",
        buf,
        0xCu);
    }

    __int16 v13 = 0;
  }

LABEL_25:
  v24 = (NSString *)[(NSString *)v13 copy];
  __int16 v25 = self->_outgoingCallerID;
  self->_outgoingCallerID = v24;

LABEL_26:
  v26 = sub_100008DCC();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v27 = self->_outgoingCallerID;
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Outgoing Caller ID is %@", buf, 0xCu);
  }
}

- (BOOL)isValidOutgoingCallerID:(id)a3
{
  id v3 = a3;
  if (qword_10058C298 != -1) {
    dispatch_once(&qword_10058C298, &stru_100505E30);
  }
  if ([v3 length]) {
    char v4 = off_10058C290(v3);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (CSDAccountsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDAccountsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setOutgoingCallerID:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_outgoingCallerID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end