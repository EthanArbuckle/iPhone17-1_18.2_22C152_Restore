@interface SDActivityPayloadManager
+ (id)sharedPayloadManager;
- (NSString)state;
- (SDActivityPayloadManager)init;
- (id)createRapportClientWithDestinationDevice:(id)a3;
- (id)dataFromUUID:(id)a3;
- (id)idsDeviceWithUniqueID:(id)a3 onService:(id)a4;
- (id)protobufDataFromRequest:(id)a3;
- (id)requestFromProtobufData:(id)a3;
- (void)activityPayloadReplySuccess:(id)a3;
- (void)clearPersistedKeyRequests;
- (void)handleEncryptionKeyReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6;
- (void)handleEncryptionKeyReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6;
- (void)handleEncryptionKeyReplyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleEncryptionKeyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleEncryptionKeyRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)handleEncyptionKeyRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7;
- (void)handleNewAdvertisementWithpayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handlePayloadReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6;
- (void)handlePayloadReplyProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handlePayloadReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6;
- (void)handlePayloadRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7;
- (void)handlePayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handlePayloadRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)logDashboardHandoffRequestViaTransportLinkType:(int)a3 type:(id)a4 success:(BOOL)a5 rtt:(double)a6;
- (void)messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5;
- (void)requestTimedOut:(id)a3;
- (void)sendActivityPayloadRequestMessageToDevice:(id)a3 withRequestRecord:(id)a4 withDestinationDevice:(id)a5 completionHandler:(id)a6;
- (void)sendActivityPayloadRequestToDeviceIdentifier:(id)a3 withAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7;
- (void)sendActivityPayloadWithAdvertisementData:(id)a3 forAdvertisementPayload:(id)a4 activityIdentifier:(id)a5 activityPayload:(id)a6;
- (void)sendEncryptionKeyReplyRequestToDevice:(id)a3 reply:(id)a4 requestIdentifier:(id)a5;
- (void)sendEncryptionKeyRequestToDeviceIdentifier:(id)a3 previousKeyIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendIDSActivityPayloadReply:(id)a3 withReplyRecord:(id)a4;
- (void)sendIDSActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5;
- (void)sendIDSEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5;
- (void)sendRapportActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5;
- (void)sendRapportEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4;
- (void)setUpIDSServices;
- (void)setUpRapport;
- (void)setUpSystemMonitor;
@end

@implementation SDActivityPayloadManager

+ (id)sharedPayloadManager
{
  if (qword_100980098 != -1) {
    dispatch_once(&qword_100980098, &stru_1008CDC48);
  }
  v2 = (void *)qword_100980090;

  return v2;
}

- (SDActivityPayloadManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)SDActivityPayloadManager;
  v2 = [(SDActivityPayloadManager *)&v19 init];
  if (v2)
  {
    if (IsAppleInternalBuild()) {
      BOOL v3 = sub_1000D9060(@"DisabledKeyRequestBudget", 0) != 0;
    }
    else {
      BOOL v3 = 0;
    }
    v2->_restrictionsDisabled = v3;
    uint64_t v4 = +[SDActivityAdvertiser sharedAdvertiser];
    advertiser = v2->_advertiser;
    v2->_advertiser = (SDActivityAdvertiser *)v4;

    uint64_t v6 = +[SDActivityScanner sharedScanner];
    scanner = v2->_scanner;
    v2->_scanner = (SDActivityScanner *)v6;

    uint64_t v8 = objc_opt_new();
    cachedActivityPayloadsForDemo = v2->_cachedActivityPayloadsForDemo;
    v2->_cachedActivityPayloadsForDemo = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    uniqueIDToKeyReplyDate = v2->_uniqueIDToKeyReplyDate;
    v2->_uniqueIDToKeyReplyDate = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    messageIdentifierToKeyRequestRecords = v2->_messageIdentifierToKeyRequestRecords;
    v2->_messageIdentifierToKeyRequestRecords = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    messageIdentifierToReplyRecords = v2->_messageIdentifierToReplyRecords;
    v2->_messageIdentifierToReplyRecords = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    messageIdentifierToRequestRecords = v2->_messageIdentifierToRequestRecords;
    v2->_messageIdentifierToRequestRecords = (NSMutableDictionary *)v16;

    [(SDActivityPayloadManager *)v2 clearPersistedKeyRequests];
    [(SDActivityPayloadManager *)v2 setUpSystemMonitor];
    [(SDActivityPayloadManager *)v2 setUpRapport];
    [(SDActivityPayloadManager *)v2 setUpIDSServices];
    [(SDActivityPayloadManager *)v2 setUpHandoffPreferenceMonitor];
  }
  return v2;
}

- (void)setUpSystemMonitor
{
  BOOL v3 = (CUSystemMonitor *)objc_opt_new();
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = v3;

  id location = 0;
  objc_initWeak(&location, self->_systemMonitor);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10012AA94;
  v6[3] = &unk_1008CA580;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  v5 = objc_retainBlock(v6);
  [(CUSystemMonitor *)self->_systemMonitor setManateeChangedHandler:v5];
  [(CUSystemMonitor *)self->_systemMonitor activateWithCompletion:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setUpRapport
{
  if (!sub_1000D9060(@"DisableContinuityRapportPayloads", 0))
  {
    BOOL v3 = [(SDActivityPayloadManager *)self createRapportClientWithDestinationDevice:0];
    rapportDiscoveryClient = self->_rapportDiscoveryClient;
    self->_rapportDiscoveryClient = v3;

    v5 = self->_rapportDiscoveryClient;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10012AC08;
    v8[3] = &unk_1008CB5B8;
    v8[4] = self;
    [(RPCompanionLinkClient *)v5 registerRequestID:@"com.apple.handoff.encryption-key-request" options:0 handler:v8];
    uint64_t v6 = self->_rapportDiscoveryClient;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10012AC1C;
    v7[3] = &unk_1008CB5B8;
    v7[4] = self;
    [(RPCompanionLinkClient *)v6 registerRequestID:@"com.apple.handoff.payload-request" options:0 handler:v7];
    [(RPCompanionLinkClient *)self->_rapportDiscoveryClient activateWithCompletion:&stru_1008CDC68];
  }
}

- (void)setUpIDSServices
{
  BOOL v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.continuity.encryption"];
  encryptionService = self->_encryptionService;
  self->_encryptionService = v3;

  [(IDSService *)self->_encryptionService setProtobufAction:"handleEncryptionKeyRequestProtobuf:service:account:fromID:context:" forIncomingRequestsOfType:4];
  [(IDSService *)self->_encryptionService setProtobufAction:"handleEncryptionKeyReplyRequestProtobuf:service:account:fromID:context:" forIncomingResponsesOfType:5];
  [(IDSService *)self->_encryptionService addDelegate:self queue:&_dispatch_main_q];
  v5 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.continuity.activity"];
  activityService = self->_activityService;
  self->_activityService = v5;

  [(IDSService *)self->_activityService setProtobufAction:"handlePayloadRequestProtobuf:service:account:fromID:context:" forIncomingRequestsOfType:1];
  [(IDSService *)self->_activityService setProtobufAction:"handlePayloadReplyProtobuf:service:account:fromID:context:" forIncomingResponsesOfType:2];
  [(IDSService *)self->_activityService setProtobufAction:"handleNewAdvertisementWithpayloadRequestProtobuf:service:account:fromID:context:" forIncomingRequestsOfType:3];
  [(IDSService *)self->_activityService addDelegate:self queue:&_dispatch_main_q];
}

- (id)idsDeviceWithUniqueID:(id)a3 onService:(id)a4
{
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a4 devices];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 uniqueIDOverride];
        unsigned int v12 = [v11 isEqual:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)requestTimedOut:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  p_messageIdentifierToRequestRecords = &self->_messageIdentifierToRequestRecords;
  uint64_t v6 = [(NSMutableDictionary *)self->_messageIdentifierToRequestRecords objectForKeyedSubscript:v4];
  p_messageIdentifierToKeyRequestRecords = &self->_messageIdentifierToKeyRequestRecords;
  uint64_t v8 = [(NSMutableDictionary *)self->_messageIdentifierToKeyRequestRecords objectForKeyedSubscript:v4];
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_10012B194;
  v28 = &unk_1008CDC90;
  v29 = self;
  id v9 = v4;
  id v30 = v9;
  uint64_t v10 = objc_retainBlock(&v25);
  if (v6 | v8)
  {
    uint64_t v23 = v8;
    if (v6) {
      v11 = (void *)v6;
    }
    else {
      v11 = (void *)v8;
    }
    id v12 = v11;
    v13 = [v12 error];

    if (v13)
    {
      long long v14 = [v12 error];
      long long v15 = [v14 userInfo];
      long long v16 = [v15 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (v16)
      {
        do
        {
          long long v17 = [v14 userInfo:v23, v25, v26, v27, v28, v29];
          v18 = [v17 objectForKeyedSubscript:NSUnderlyingErrorKey];

          objc_super v19 = [v18 userInfo];
          v20 = [v19 objectForKeyedSubscript:NSUnderlyingErrorKey];

          long long v14 = v18;
        }
        while (v20);
      }
      else
      {
        v18 = v14;
      }
    }
    else
    {
      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      CFStringRef v32 = @"Request timed out";
      v21 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v18 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:60 userInfo:v21];
    }
    [v12 setError:v18];

    if (v6) {
      v22 = (id *)p_messageIdentifierToRequestRecords;
    }
    else {
      v22 = (id *)p_messageIdentifierToKeyRequestRecords;
    }
    [*v22 removeObjectForKey:v9];
    ((void (*)(void ***, id))v10[2])(v10, v12);
    uint64_t v8 = v24;
  }
}

- (NSString)state
{
  BOOL v3 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  NSAppendPrintF();
  id v5 = v4;

  if (self->_restrictionsDisabled) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  CFStringRef v21 = v6;
  NSAppendPrintF();
  id v7 = v5;

  activityService = self->_activityService;
  id v9 = [(IDSService *)activityService devices];
  uint64_t v10 = [v9 valueForKeyPath:@"@unionOfObjects.uniqueIDOverride"];
  SFCompactStringFromCollection();
  uint64_t v23 = v22 = activityService;
  NSAppendPrintF();
  id v11 = v7;

  id v12 = [(IDSService *)self->_encryptionService devices];
  v13 = [v12 valueForKeyPath:@"@unionOfObjects.uniqueIDOverride"];
  uint64_t v24 = SFCompactStringFromCollection();
  NSAppendPrintF();
  id v14 = v11;

  NSAppendPrintF();
  id v15 = v14;

  NSAppendPrintF();
  id v16 = v15;

  NSAppendPrintF();
  id v17 = v16;

  NSAppendPrintF();
  id v18 = v17;

  return (NSString *)v18;
}

- (void)clearPersistedKeyRequests
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"EncryptionKeyRequests"];
}

- (void)sendEncryptionKeyRequestToDeviceIdentifier:(id)a3 previousKeyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v39 = self;
  id v11 = [(NSMutableDictionary *)self->_messageIdentifierToKeyRequestRecords allValues];
  id v12 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v47;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v17 = [v16 deviceIdentifier];
        unsigned int v18 = [v17 isEqual:v8];

        if (v18)
        {
          v22 = v10;
          [v16 setCompletionHandler:v10];
          v25 = handoff_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            sub_100132CC4();
          }

          CFStringRef v21 = v9;
          goto LABEL_19;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  objc_super v19 = +[SDAutoUnlockSessionManager sharedManager];
  unsigned int v20 = [v19 attemptInProgress];

  if (v20)
  {
    id v11 = handoff_log();
    CFStringRef v21 = v9;
    v22 = v10;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138412290;
      v51 = v24;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Preventing encryption key request - Auto Unlock in progress", buf, 0xCu);
    }
  }
  else
  {
    id v11 = objc_opt_new();
    uint64_t v26 = objc_opt_new();
    [v26 setRequestIdentifier:v11];
    [v26 setDeviceIdentifier:v8];
    v22 = v10;
    [v26 setCompletionHandler:v10];
    CFStringRef v21 = v9;
    [v26 setPreviousKeyIdentifier:v9];
    v27 = [v26 requestIdentifier];
    v28 = +[NSTimer timerWithTimeInterval:v39 target:"requestTimedOut:" selector:v27 userInfo:0 repeats:16.0];
    [v26 setTimeoutTimer:v28];

    [v26 setTimeoutTimeInterval:15];
    [(NSMutableDictionary *)v39->_messageIdentifierToKeyRequestRecords setObject:v26 forKeyedSubscript:v11];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012BA28;
    block[3] = &unk_1008CA4B8;
    id v29 = v26;
    id v45 = v29;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v30 = objc_opt_new();
    NSErrorUserInfoKey v31 = [v29 previousKeyIdentifier];
    uint64_t v32 = [v31 UUIDString];
    v33 = (void *)v32;
    if (v32) {
      CFStringRef v34 = (const __CFString *)v32;
    }
    else {
      CFStringRef v34 = &stru_1008E7020;
    }
    [v30 setObject:v34 forKeyedSubscript:@"rKeyPreviousIdentifier"];

    v35 = +[SDActivityEncryptionManager sharedEncryptionManager];
    v36 = [v35 dataRepresentationForCurrentEncryptionKey];
    [v30 setObject:v36 forKeyedSubscript:@"rKeyDataRepresentation"];

    [v30 setObject:&__kCFBooleanTrue forKeyedSubscript:@"rLocalOnly"];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10012BAA4;
    v40[3] = &unk_1008CDCB8;
    id v41 = v29;
    v42 = v39;
    id v43 = v30;
    id v37 = v30;
    id v38 = v29;
    [(SDActivityPayloadManager *)v39 sendRapportEncryptionKeyRequest:v37 withRequestRecord:v38 completionHandler:v40];
  }
LABEL_19:
}

- (void)sendRapportEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(RPCompanionLinkClient *)self->_rapportDiscoveryClient activeDevices];
  id v11 = [v8 deviceIdentifier];
  id v12 = +[NSPredicate predicateWithFormat:@"idsDeviceIdentifier == %@", v11];
  id v13 = [v10 filteredArrayUsingPredicate:v12];
  uint64_t v14 = [v13 firstObject];

  if (v14)
  {
    uint64_t v15 = (uint64_t)[v8 timeoutTimeInterval];
    int v16 = 5;
    if (v15 < 5) {
      int v16 = v15;
    }
    int v28 = v16;
    id v17 = handoff_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = [v14 name];
      objc_super v19 = [v8 deviceIdentifier];
      unsigned int v20 = [v8 requestIdentifier];
      CFStringRef v21 = [v20 UUIDString];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v18;
      __int16 v38 = 2112;
      v39 = v19;
      __int16 v40 = 2112;
      id v41 = v21;
      __int16 v42 = 1024;
      int v43 = v28;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Requesting Encryption key via Rapport from \"%@\" %@ with message GUID: %@ and timeout: %d", buf, 0x26u);
    }
    v22 = handoff_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100132D5C();
    }

    uint64_t v23 = [v8 linkClient];

    if (v23)
    {
      uint64_t v24 = [v8 linkClient];
      [v24 invalidate];

      [v8 setLinkClient:0];
    }
    v25 = [(SDActivityPayloadManager *)self createRapportClientWithDestinationDevice:v14];
    [v8 setLinkClient:v25];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, v8);
    uint64_t v26 = [v8 linkClient];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10012BF6C;
    v30[3] = &unk_1008CDD08;
    objc_copyWeak(&v35, (id *)buf);
    int v36 = v28;
    id v31 = v29;
    uint64_t v32 = self;
    id v33 = v14;
    id v34 = v9;
    [v26 activateWithCompletion:v30];

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (self->_rapportDiscoveryClient)
    {
      v27 = handoff_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v8;
        __int16 v38 = 2112;
        v39 = v10;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Cannot send Handoff encryption key request %@ via Rapport as we found no devices in %@", buf, 0x16u);
      }
    }
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

- (void)sendIDSEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5
{
  id v8 = a4;
  id v9 = [(SDActivityPayloadManager *)self protobufDataFromRequest:a3];
  id v10 = [v8 deviceIdentifier];
  p_encryptionService = (id *)&self->_encryptionService;
  v51 = self;
  id v12 = [(SDActivityPayloadManager *)self idsDeviceWithUniqueID:v10 onService:self->_encryptionService];

  id v13 = objc_opt_new();
  if (v12)
  {
    long long v48 = v9;
    id v14 = *p_encryptionService;
    uint64_t v15 = [v12 nsuuid];
    int v16 = [v14 devicesForBTUUID:v15];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v55;
      v50 = v13;
      while (2)
      {
        id v21 = v8;
        v22 = v12;
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v55 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v24 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v25 = IDSCopyForDevice();
          if (v25)
          {
            int v28 = (void *)v25;
            [v50 addObject:v25];
            id v12 = v22;
            id v8 = v21;
            if ((unint64_t)[v17 count] >= 2)
            {
              id v29 = handoff_log();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Sending encryption key request to single of multiple possible destinations.", buf, 2u);
              }
            }
            id v13 = v50;
            goto LABEL_18;
          }
          uint64_t v26 = handoff_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = [*p_encryptionService devices];
            *(_DWORD *)buf = 138412546;
            v61 = v24;
            __int16 v62 = 2112;
            v63 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Encryption key: No device ID generated for device %@ (Devices: %@)", buf, 0x16u);
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v54 objects:v68 count:16];
        id v12 = v22;
        id v8 = v21;
        id v13 = v50;
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    id v9 = v48;
  }
  else
  {
    id v17 = handoff_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100132E98();
    }
  }

  if (v13)
  {
    id v30 = handoff_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = [v12 name];
      uint64_t v32 = [v8 deviceIdentifier];
      id v33 = [v8 requestIdentifier];
      id v34 = [v33 UUIDString];
      *(_DWORD *)buf = 138413058;
      v61 = v31;
      __int16 v62 = 2112;
      v63 = v32;
      __int16 v64 = 2112;
      v65 = v34;
      __int16 v66 = 2048;
      double v67 = a5;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Requesting Encryption key via IDS from \"%@\" %@ with message GUID: %@ and timeout: %f", buf, 0x2Au);
    }
    long long v49 = v12;

    id v35 = handoff_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_100132E30();
    }

    int v36 = objc_opt_new();
    id v37 = [v8 requestIdentifier];
    __int16 v38 = [(SDActivityPayloadManager *)v51 dataFromUUID:v37];
    [v36 setObject:v38 forKeyedSubscript:IDSSendMessageOptionUUIDKey];

    [v36 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
    [v36 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    v39 = +[NSNumber numberWithDouble:a5];
    [v36 setObject:v39 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    [v36 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
    id v40 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v9 type:4 isResponse:0];
    encryptionService = v51->_encryptionService;
    id v52 = 0;
    id v53 = 0;
    id v42 = [(IDSService *)encryptionService sendProtobuf:v40 toDestinations:v13 priority:300 options:v36 identifier:&v53 error:&v52];
    id v43 = v53;
    id v44 = v52;
    [v8 requestIdentifier];
    v46 = id v45 = v9;
    [(SDActivityPayloadManager *)v51 messageWithIdentifier:v46 didSendWithSuccess:v42 error:v44];

    id v9 = v45;
    id v12 = v49;
  }
  else
  {
    NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
    CFStringRef v59 = @"Failed to find device to request encryption key from";
    long long v47 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    id v43 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:65 userInfo:v47];

    int v36 = [v8 requestIdentifier];
    [(SDActivityPayloadManager *)v51 messageWithIdentifier:v36 didSendWithSuccess:0 error:v43];
  }
}

- (void)sendEncryptionKeyReplyRequestToDevice:(id)a3 reply:(id)a4 requestIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  __int16 v38 = [v7 uniqueIDOverride];
  id v9 = objc_opt_new();
  id v10 = +[SDActivityEncryptionManager sharedEncryptionManager];
  id v11 = [v10 dataRepresentationForCurrentEncryptionKey];
  [v9 setObject:v11 forKeyedSubscript:@"rKeyDataRepresentation"];

  id v12 = [(SDActivityPayloadManager *)self protobufDataFromRequest:v9];
  id v13 = (void *)IDSCopyForDevice();
  if (v13)
  {
    int v36 = v13;
    uint64_t v14 = +[NSSet setWithObject:v13];
    uint64_t v15 = objc_opt_new();
    int v16 = handoff_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      [v7 name];
      v18 = uint64_t v17 = v15;
      *(_DWORD *)buf = 138412290;
      id v42 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Responding to Handoff encryption key request from \"%@\" via IDS", buf, 0xCu);

      uint64_t v15 = v17;
    }
    id v37 = (void *)v15;

    id v19 = objc_opt_new();
    uint64_t v20 = [(SDActivityPayloadManager *)self dataFromUUID:v15];
    [v19 setObject:v20 forKeyedSubscript:IDSSendMessageOptionUUIDKey];

    [v19 setObject:v8 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
    [v19 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    [v19 setObject:&off_100902C28 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
    id v21 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v12 type:5 isResponse:1];
    encryptionService = self->_encryptionService;
    id v39 = 0;
    id v40 = 0;
    id v35 = v14;
    unsigned __int8 v23 = [(IDSService *)encryptionService sendProtobuf:v21 toDestinations:v14 priority:300 options:v19 identifier:&v40 error:&v39];
    uint64_t v24 = self;
    unsigned __int8 v25 = v23;
    id v26 = v40;
    id v27 = v39;
    if ((v25 & 1) == 0)
    {
      int v28 = v24->_encryptionService;
      [v37 UUIDString];
      id v34 = v12;
      id v29 = v7;
      v31 = id v30 = v8;
      [(SDActivityPayloadManager *)v24 service:v28 account:0 identifier:v31 didSendWithSuccess:0 error:v27];

      id v8 = v30;
      id v7 = v29;
      id v12 = v34;
    }

    uint64_t v32 = v35;
    id v13 = v36;
  }
  else
  {
    uint64_t v32 = handoff_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = [(IDSService *)self->_encryptionService devices];
      *(_DWORD *)buf = 138412802;
      id v42 = v38;
      __int16 v43 = 2112;
      id v44 = v33;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "No device ID generated for device %@ (Devices: %@) for requestIdentifier %@", buf, 0x20u);
    }
  }
}

- (void)sendActivityPayloadRequestToDeviceIdentifier:(id)a3 withAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  int v16 = handoff_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v36 = SFHexStringForData();
    *(_DWORD *)buf = 138413058;
    id v57 = v12;
    __int16 v58 = 2112;
    CFStringRef v59 = v36;
    __int16 v60 = 2112;
    id v61 = v14;
    __int16 v62 = 1024;
    int v63 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@ %@ %@ %d", buf, 0x26u);
  }
  if ([(NSMutableArray *)self->_cachedActivityPayloadsForDemo count])
  {
    int64_t v37 = a6;
    __int16 v38 = self;
    id v39 = v15;
    id v40 = v14;
    id v41 = v13;
    id v17 = v12;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obj = self->_cachedActivityPayloadsForDemo;
    id v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v50;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          [v22 objectForKeyedSubscript:@"deviceIdentifier" v37, v38];
          id v23 = (id)objc_claimAutoreleasedReturnValue();
          id v24 = [v22 objectForKeyedSubscript:@"advertisementPayload"];
          unsigned __int8 v25 = [v22 objectForKeyedSubscript:@"activityCommand"];
          if ([v23 isEqual:v17]
            && [v24 isEqual:v41]
            && [v25 isEqual:v40])
          {
            uint64_t v32 = [v22 objectForKeyedSubscript:@"activityPayload"];
            id v33 = handoff_log();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              id v34 = SFHexStringForData();
              unsigned int v35 = [v32 length];
              *(_DWORD *)buf = 138412802;
              id v57 = v23;
              __int16 v58 = 2112;
              CFStringRef v59 = v34;
              __int16 v60 = 1024;
              LODWORD(v61) = v35;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Found activity payload in cache for %@ from %@ of size %d", buf, 0x1Cu);
            }
            id v15 = v39;
            (*((void (**)(id, void *, void))v39 + 2))(v39, v32, 0);

            id v12 = v17;
            id v14 = v40;
            id v13 = v41;
            id v26 = obj;
            goto LABEL_19;
          }
        }
        id v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    id v12 = v17;
    id v14 = v40;
    id v13 = v41;
    self = v38;
    id v15 = v39;
    a6 = v37;
  }
  id v26 = objc_opt_new();
  v53[0] = @"rAdvPayload";
  v53[1] = @"rClientCommand";
  v54[0] = v13;
  v54[1] = v14;
  v53[2] = @"rIdentifier";
  id v27 = [v26 UUIDString];
  v54[2] = v27;
  int v28 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];

  id v29 = objc_opt_new();
  [v29 setRequestIdentifier:v26];
  [v29 setDeviceIdentifier:v12];
  [v29 setCompletionHandler:v15];
  [v29 setAdvertisementPayload:v13];
  [v29 setCommand:v14];
  id v30 = +[NSTimer timerWithTimeInterval:self target:"requestTimedOut:" selector:v26 userInfo:0 repeats:(double)(a6 + 1)];
  [v29 setTimeoutTimer:v30];

  [v29 setTimeoutTimeInterval:a6];
  [(NSMutableDictionary *)self->_messageIdentifierToRequestRecords setObject:v29 forKeyedSubscript:v26];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012D35C;
  block[3] = &unk_1008CA4B8;
  id v31 = v29;
  id v48 = v31;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10012D3D8;
  v43[3] = &unk_1008CDCB8;
  id v44 = v31;
  __int16 v45 = self;
  id v46 = v28;
  id v24 = v28;
  id v23 = v31;
  [(SDActivityPayloadManager *)self sendRapportActivityPayloadRequest:v24 withRequestRecord:v23 completionHandler:v43];

  unsigned __int8 v25 = v48;
LABEL_19:
}

- (void)sendRapportActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5
{
  id v36 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = handoff_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to send rapport activity payload request", buf, 2u);
  }

  id v11 = +[SDStatusMonitor sharedMonitor];
  unsigned __int8 v12 = [v11 isMirroringActive];

  id v13 = handoff_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Mirroring is active, bringing up scanner and sending if we find device", buf, 2u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v52 = sub_10012DAC0;
    id v53 = sub_10012DAD0;
    id v54 = 0;
    id v54 = objc_alloc_init((Class)RPCompanionLinkClient);
    [*(id *)(*(void *)&buf[8] + 40) setControlFlags:2];
    [*(id *)(*(void *)&buf[8] + 40) setControlFlags:((unint64_t)[*(id *)(*(void *)&buf[8] + 40) controlFlags] | 0x10000)];
    id v15 = [v8 deviceIdentifier];
    int v16 = +[NSArray arrayWithObject:v15];
    [*(id *)(*(void *)&buf[8] + 40) setDeviceFilter:v16];

    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    char v50 = 0;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10012DAD8;
    v42[3] = &unk_1008CDD58;
    id v17 = v8;
    id v43 = v17;
    id v44 = self;
    id v45 = v36;
    id v18 = v9;
    id v46 = v18;
    long long v47 = buf;
    id v48 = v49;
    [*(id *)(*(void *)&buf[8] + 40) setDeviceFoundHandler:v42];
    id v19 = *(void **)(*(void *)&buf[8] + 40);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10012DCAC;
    v37[3] = &unk_1008CDDA8;
    id v39 = v18;
    id v40 = v49;
    v37[4] = self;
    id v38 = v17;
    id v41 = buf;
    [v19 activateWithCompletion:v37];

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Mirroring is not active, sending directly", buf, 2u);
    }

    unsigned int v35 = [(RPCompanionLinkClient *)self->_rapportDiscoveryClient activeDevices];
    uint64_t v20 = [v8 deviceIdentifier];
    id v21 = +[NSPredicate predicateWithFormat:@"idsDeviceIdentifier == %@", v20];
    v22 = [v35 filteredArrayUsingPredicate:v21];
    id v23 = [v22 firstObject];

    if (v23)
    {
      uint64_t v24 = (uint64_t)[v8 timeoutTimeInterval];
      unsigned __int8 v25 = handoff_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v24 >= 5) {
          int v26 = 5;
        }
        else {
          int v26 = v24;
        }
        id v27 = [v8 advertisementPayload];
        int v28 = SFHexStringForData();
        id v29 = [v8 requestIdentifier];
        id v30 = [v29 UUIDString];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v52) = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Requesting Handoff payload via Rapport for %@ with message GUID: %@ and timeout: %d", buf, 0x1Cu);
      }
      id v31 = handoff_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_100132F40();
      }

      uint64_t v32 = [v8 linkClient];

      if (v32)
      {
        id v33 = [v8 linkClient];
        [v33 invalidate];

        [v8 setLinkClient:0];
      }
      [(SDActivityPayloadManager *)self sendActivityPayloadRequestMessageToDevice:v36 withRequestRecord:v8 withDestinationDevice:v23 completionHandler:v9];
    }
    else
    {
      if (self->_rapportDiscoveryClient)
      {
        id v34 = handoff_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Cannot send Handoff payload request %@ via Rapport as we found no devices in %@", buf, 0x16u);
        }
      }
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (void)sendActivityPayloadRequestMessageToDevice:(id)a3 withRequestRecord:(id)a4 withDestinationDevice:(id)a5 completionHandler:(id)a6
{
  id v28 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (uint64_t)[v10 timeoutTimeInterval];
  if (v13 >= 5) {
    int v14 = 5;
  }
  else {
    int v14 = v13;
  }
  id v15 = handoff_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [v10 advertisementPayload];
    id v17 = SFHexStringForData();
    id v18 = [v10 requestIdentifier];
    id v19 = [v18 UUIDString];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v37 = 2112;
    id v38 = v19;
    __int16 v39 = 1024;
    int v40 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Requesting Handoff payload via Rapport for %@ with message GUID: %@ and timeout: %d", buf, 0x1Cu);
  }
  uint64_t v20 = handoff_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100132F40();
  }

  id v21 = [v10 linkClient];

  if (v21)
  {
    v22 = [v10 linkClient];
    [v22 invalidate];

    [v10 setLinkClient:0];
  }
  id v23 = [(SDActivityPayloadManager *)self createRapportClientWithDestinationDevice:v11];
  [v10 setLinkClient:v23];

  *(void *)buf = 0;
  objc_initWeak((id *)buf, v10);
  uint64_t v24 = [v10 linkClient];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10012E258;
  v29[3] = &unk_1008CDD08;
  objc_copyWeak(&v34, (id *)buf);
  int v35 = v14;
  id v25 = v28;
  id v30 = v25;
  id v31 = self;
  id v26 = v11;
  id v32 = v26;
  id v27 = v12;
  id v33 = v27;
  [v24 activateWithCompletion:v29];

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

- (void)sendIDSActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5
{
  id v8 = a4;
  id v9 = [(SDActivityPayloadManager *)self protobufDataFromRequest:a3];
  id v10 = [v8 deviceIdentifier];
  id v11 = [(SDActivityPayloadManager *)self idsDeviceWithUniqueID:v10 onService:self->_activityService];

  id v12 = objc_opt_new();
  id v46 = v11;
  if (v11)
  {
    id v45 = v9;
    activityService = self->_activityService;
    int v14 = [v11 nsuuid];
    id v15 = [(IDSService *)activityService devicesForBTUUID:v14];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    int v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v50;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v22 = IDSCopyForDevice();
          if (v22)
          {
            id v25 = (void *)v22;
            [v12 addObject:v22];
            if ((unint64_t)[v16 count] >= 2)
            {
              id v26 = handoff_log();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sending handoff payload request via IDS to single of multiple possible destinations.", buf, 2u);
              }
            }
            goto LABEL_18;
          }
          id v23 = handoff_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = [(IDSService *)self->_encryptionService devices];
            *(_DWORD *)buf = 138412546;
            long long v56 = v21;
            __int16 v57 = 2112;
            __int16 v58 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No device ID generated for device %@ (Devices: %@)", buf, 0x16u);
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v49 objects:v61 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    id v9 = v45;
  }
  else
  {
    int v16 = handoff_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1001330E0();
    }
  }

  if (v12)
  {
    id v27 = handoff_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [v8 advertisementPayload];
      id v29 = SFHexStringForData();
      id v30 = [v8 requestIdentifier];
      id v31 = [v30 UUIDString];
      unsigned int v32 = [v8 timeoutTimeInterval];
      *(_DWORD *)buf = 138412802;
      long long v56 = v29;
      __int16 v57 = 2112;
      __int16 v58 = v31;
      __int16 v59 = 1024;
      unsigned int v60 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Requesting Handoff payload via IDS for %@ with message GUID: %@ and timeout: %d", buf, 0x1Cu);
    }
    id v33 = handoff_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_100133078();
    }

    id v34 = objc_opt_new();
    int v35 = [v8 requestIdentifier];
    id v36 = [(SDActivityPayloadManager *)self dataFromUUID:v35];
    [v34 setObject:v36 forKeyedSubscript:IDSSendMessageOptionUUIDKey];

    [v34 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
    __int16 v37 = +[NSNumber numberWithDouble:a5];
    [v34 setObject:v37 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    [v34 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
    [v34 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionActivityContinuationKey];
    [v34 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    [v34 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
    id v38 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v9 type:1 isResponse:0];
    kdebug_trace();
    __int16 v39 = self->_activityService;
    id v47 = 0;
    id v48 = 0;
    id v40 = [(IDSService *)v39 sendProtobuf:v38 toDestinations:v12 priority:300 options:v34 identifier:&v48 error:&v47];
    id v41 = v48;
    id v42 = v47;
    id v43 = [v8 requestIdentifier];
    [(SDActivityPayloadManager *)self messageWithIdentifier:v43 didSendWithSuccess:v40 error:v42];
  }
  else
  {
    NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
    CFStringRef v54 = @"Failed to find device to request activity payload from";
    id v44 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    id v41 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:65 userInfo:v44];

    id v34 = [v8 requestIdentifier];
    [(SDActivityPayloadManager *)self messageWithIdentifier:v34 didSendWithSuccess:0 error:v41];
  }
}

- (void)handleEncyptionKeyRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(void, void *))a7;
  int v16 = [a4 uniqueIDOverride];
  id v17 = [v12 objectForKeyedSubscript:@"rKeyDataRepresentation"];
  [(SDActivityPayloadManager *)self setDecryptionKeyDataRepresentation:v17 forDeviceIdentifier:v16];
  id v18 = [(NSMutableDictionary *)self->_uniqueIDToKeyReplyDate objectForKeyedSubscript:v16];
  [v18 timeIntervalSinceNow];
  if (v19 <= -0.0) {
    double v20 = -v19;
  }
  else {
    double v20 = 0.0;
  }
  if (v18 && v20 < 5.0)
  {
    id v21 = handoff_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v29 = SFStringFromTimeInterval();
      *(_DWORD *)buf = 138413058;
      unsigned int v32 = v16;
      __int16 v33 = 2112;
      id v34 = v14;
      __int16 v35 = 2112;
      id v36 = v13;
      __int16 v37 = 2112;
      id v38 = v29;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Ignoring request from %@ via %@ for key with requestIdentifier %@ as we replied only %@ ago", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v22 = objc_opt_new();
    [(NSMutableDictionary *)self->_uniqueIDToKeyReplyDate setObject:v22 forKeyedSubscript:v16];

    id v30 = [v12 objectForKeyedSubscript:@"rKeyPreviousIdentifier"];
    id v23 = objc_opt_new();
    uint64_t v24 = +[SDActivityEncryptionManager sharedEncryptionManager];
    [v24 dataRepresentationForCurrentEncryptionKey];
    id v25 = v15;
    id v26 = v14;
    id v28 = v27 = v13;
    [v23 setObject:v28 forKeyedSubscript:@"rKeyDataRepresentation"];

    id v13 = v27;
    id v14 = v26;
    id v15 = v25;

    v25[2](v25, v23);
  }
}

- (void)handleEncryptionKeyRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (RPOptionSenderIDSDeviceID) {
    CFStringRef v11 = (const __CFString *)RPOptionSenderIDSDeviceID;
  }
  else {
    CFStringRef v11 = @"senderIDS";
  }
  id v12 = [v9 objectForKeyedSubscript:v11];
  if (!v12)
  {
    id v16 = 0;
LABEL_11:
    id v21 = NSErrorWithOSStatusF();
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v21);

    goto LABEL_12;
  }
  id v13 = [(IDSService *)self->_activityService devices];
  id v14 = +[NSPredicate predicateWithFormat:@"uniqueIDOverride == %@", v12];
  id v15 = [v13 filteredArrayUsingPredicate:v14];
  id v16 = [v15 firstObject];

  if (!v8 || !v16) {
    goto LABEL_11;
  }
  id v17 = [v8 objectForKeyedSubscript:@"rIdentifier"];
  id v18 = handoff_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = [v16 name];
    double v20 = [v9 objectForKeyedSubscript:RPOptionXID];
    *(_DWORD *)buf = 138412802;
    id v26 = v19;
    __int16 v27 = 2112;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received Handoff encryption key request from \"%@\" via Rapport with requestIdentifier %@, xid %@", buf, 0x20u);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10012F288;
  v22[3] = &unk_1008CDDD0;
  id v16 = v16;
  id v23 = v16;
  id v24 = v10;
  [(SDActivityPayloadManager *)self handleEncyptionKeyRequest:v8 fromIDSDevice:v16 withRequestIdentifier:v17 transportType:@"Rapport" completionHandler:v22];

LABEL_12:
}

- (void)handleEncryptionKeyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  encryptionService = self->_encryptionService;
  id v13 = a3;
  id v14 = [(IDSService *)encryptionService deviceForFromID:v10];
  id v15 = [v13 data];

  id v16 = [(SDActivityPayloadManager *)self requestFromProtobufData:v15];

  if (v14 && v16)
  {
    id v17 = [v11 outgoingResponseIdentifier];
    id v18 = handoff_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = [v14 name];
      *(_DWORD *)buf = 138412546;
      id v25 = v19;
      __int16 v26 = 2112;
      __int16 v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received Handoff encryption key request from \"%@\" via IDS with requestIdentifier %@", buf, 0x16u);
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10012F59C;
    v21[3] = &unk_1008CDDF8;
    v21[4] = self;
    id v22 = v14;
    id v23 = v17;
    double v20 = v17;
    [(SDActivityPayloadManager *)self handleEncyptionKeyRequest:v16 fromIDSDevice:v22 withRequestIdentifier:v20 transportType:@"IDS" completionHandler:v21];
  }
  else
  {
    double v20 = handoff_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100133188();
    }
  }
}

- (void)handleEncryptionKeyReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  activityService = self->_activityService;
  id v13 = a6;
  id v14 = a3;
  id v15 = [(IDSService *)activityService devices];
  id v16 = [v13 idsDeviceIdentifier];

  id v17 = +[NSPredicate predicateWithFormat:@"uniqueIDOverride == %@", v16];
  id v18 = [v15 filteredArrayUsingPredicate:v17];
  double v19 = [v18 firstObject];

  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  id v21 = handoff_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v26 = self;
    id v22 = [v19 name];
    if (Int64Ranged > 0xB) {
      id v23 = "?";
    }
    else {
      id v23 = off_1008CDEB8[(int)Int64Ranged];
    }
    id v24 = [v11 requestIdentifier];
    id v25 = [v10 objectForKeyedSubscript:RPOptionXID];
    *(_DWORD *)buf = 138413058;
    id v28 = v22;
    __int16 v29 = 2080;
    id v30 = v23;
    __int16 v31 = 2112;
    unsigned int v32 = v24;
    __int16 v33 = 2112;
    id v34 = v25;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received a new Handoff encryption key from \"%@\" via Rapport (%s) with requestIdentifier %@, xid %@", buf, 0x2Au);

    self = v26;
  }

  [(SDActivityPayloadManager *)self handleEncryptionKeyReply:v14 forRequestRecord:v11 fromDevice:v19 transportLinkType:Int64Ranged];
}

- (void)handleEncryptionKeyReplyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  encryptionService = self->_encryptionService;
  id v11 = a7;
  id v12 = a3;
  id v13 = [(IDSService *)encryptionService deviceForFromID:a6];
  id v14 = objc_alloc((Class)NSUUID);
  id v15 = [v11 incomingResponseIdentifier];

  id v16 = [v14 initWithUUIDString:v15];
  id v17 = [v12 data];

  id v18 = [(SDActivityPayloadManager *)self requestFromProtobufData:v17];

  double v19 = [(NSMutableDictionary *)self->_messageIdentifierToKeyRequestRecords objectForKeyedSubscript:v16];
  double v20 = handoff_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v13 name];
    id v22 = [v19 requestIdentifier];
    int v23 = 138412546;
    id v24 = v21;
    __int16 v25 = 2112;
    __int16 v26 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received a new Handoff encryption key from \"%@\" via IDS with requestIdentifier %@", (uint8_t *)&v23, 0x16u);
  }
  [(SDActivityPayloadManager *)self handleEncryptionKeyReply:v18 forRequestRecord:v19 fromDevice:v13 transportLinkType:0xFFFFFFFFLL];
}

- (void)handleEncryptionKeyReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v11 uniqueIDOverride];
  id v14 = [v12 objectForKeyedSubscript:@"rKeyDataRepresentation"];

  id v15 = [v10 requestIdentifier];
  if (v10 && v11)
  {
    [(NSMutableDictionary *)self->_messageIdentifierToKeyRequestRecords removeObjectForKey:v15];
    id v16 = [v10 timeoutTimer];
    [v16 invalidate];

    id v17 = [v10 deviceIdentifier];
    unsigned __int8 v18 = [v17 isEqual:v13];

    if ((v18 & 1) == 0)
    {
      double v19 = handoff_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100133220();
      }
    }
    sub_1000C9E18(1, 1, 0, 0);
    double v20 = [v10 requestCreatedDate];
    [v20 timeIntervalSinceNow];
    -[SDActivityPayloadManager logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:](self, "logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:", v6, @"EncryptionKey", 1);

    id v21 = [v10 completionHandler];
    ((void (**)(void, void *, void))v21)[2](v21, v14, 0);
  }
  else
  {
    id v22 = handoff_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
    if (v14 && v13)
    {
      if (v23) {
        sub_1001332B8();
      }

      [(SDActivityPayloadManager *)self setDecryptionKeyDataRepresentation:v14 forDeviceIdentifier:v13];
    }
    else
    {
      if (v23) {
        sub_100133360();
      }
    }
  }
}

- (void)handlePayloadRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (RPOptionSenderIDSDeviceID) {
    CFStringRef v11 = (const __CFString *)RPOptionSenderIDSDeviceID;
  }
  else {
    CFStringRef v11 = @"senderIDS";
  }
  id v12 = [v9 objectForKeyedSubscript:v11];
  if (!v12)
  {
    id v16 = 0;
LABEL_11:
    id v21 = NSErrorWithOSStatusF();
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v21);

    goto LABEL_12;
  }
  id v13 = [(IDSService *)self->_activityService devices];
  id v14 = +[NSPredicate predicateWithFormat:@"uniqueIDOverride == %@", v12];
  id v15 = [v13 filteredArrayUsingPredicate:v14];
  id v16 = [v15 firstObject];

  if (!v8 || !v16) {
    goto LABEL_11;
  }
  id v17 = [v8 objectForKeyedSubscript:@"rIdentifier"];
  unsigned __int8 v18 = handoff_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = [v16 name];
    double v20 = [v9 objectForKeyedSubscript:RPOptionXID];
    *(_DWORD *)buf = 138412802;
    __int16 v27 = v19;
    __int16 v28 = 2112;
    __int16 v29 = v17;
    __int16 v30 = 2112;
    __int16 v31 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received Handoff payload request from \"%@\" via Rapport with requestIdentifier %@, xid %@", buf, 0x20u);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10012FE80;
  v22[3] = &unk_1008CDE20;
  id v16 = v16;
  id v23 = v16;
  id v24 = self;
  id v25 = v10;
  [(SDActivityPayloadManager *)self handlePayloadRequest:v8 fromIDSDevice:v16 withRequestIdentifier:v17 transportType:@"Rapport" completionHandler:v22];

LABEL_12:
}

- (void)handlePayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  activityService = self->_activityService;
  id v13 = a3;
  id v14 = [(IDSService *)activityService deviceForFromID:v10];
  id v15 = [v13 data];

  id v16 = [(SDActivityPayloadManager *)self requestFromProtobufData:v15];

  if (v14 && v16)
  {
    id v17 = [v11 outgoingResponseIdentifier];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10013017C;
    v18[3] = &unk_1008CDE48;
    v18[4] = self;
    [(SDActivityPayloadManager *)self handlePayloadRequest:v16 fromIDSDevice:v14 withRequestIdentifier:v17 transportType:@"IDS" completionHandler:v18];
  }
  else
  {
    id v17 = handoff_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001334C4();
    }
  }
}

- (void)handlePayloadRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  id v17 = [v12 uniqueIDOverride];
  unsigned __int8 v18 = objc_opt_new();
  __int16 v37 = sub_1000C9CC4(v12);
  double v19 = [v16 objectForKeyedSubscript:@"rAdvPayload"];
  double v20 = [v16 objectForKeyedSubscript:@"rClientCommand"];

  id v21 = handoff_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    [v12 name];
    v22 = id v36 = self;
    id v34 = v15;
    if (v20) {
      CFStringRef v23 = v20;
    }
    else {
      CFStringRef v23 = @"-";
    }
    SFHexStringForData();
    id v24 = v35 = v18;
    *(_DWORD *)buf = 138413570;
    id v49 = v14;
    __int16 v50 = 2112;
    long long v51 = v22;
    __int16 v52 = 2112;
    NSErrorUserInfoKey v53 = v17;
    __int16 v54 = 2112;
    id v55 = v13;
    __int16 v56 = 2112;
    CFStringRef v57 = v23;
    id v15 = v34;
    __int16 v58 = 2112;
    __int16 v59 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received handoff payload request via %@ from \"%@\" (%@) with requestIdentifier %@ command=%@ for advertisementPayload %@", buf, 0x3Eu);

    self = v36;
    unsigned __int8 v18 = v35;
  }

  advertiser = self->_advertiser;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10013048C;
  v38[3] = &unk_1008CDE70;
  id v39 = v18;
  id v40 = v14;
  id v41 = v12;
  id v42 = v17;
  id v43 = v13;
  id v44 = v19;
  id v45 = v20;
  id v46 = self;
  id v47 = v15;
  id v26 = v15;
  __int16 v27 = v20;
  id v28 = v19;
  id v29 = v13;
  id v30 = v17;
  id v31 = v12;
  id v32 = v14;
  id v33 = v18;
  [(SDActivityAdvertiser *)advertiser activityPayloadForAdvertisementPayload:v28 command:v27 requestedByDevice:v37 withCompletionHandler:v38];
}

- (void)sendIDSActivityPayloadReply:(id)a3 withReplyRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSService *)self->_activityService devices];
  id v9 = [v7 deviceIdentifier];
  id v10 = +[NSPredicate predicateWithFormat:@"uniqueIDOverride == %@", v9];
  id v11 = [v8 filteredArrayUsingPredicate:v10];
  id v12 = [v11 firstObject];

  id v13 = (void *)IDSCopyForDevice();
  if (v13)
  {
    id v14 = +[NSSet setWithObject:v13];
    uint64_t v15 = [(SDActivityPayloadManager *)self protobufDataFromRequest:v6];
    id v16 = handoff_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v12 name];
      *(_DWORD *)buf = 138412290;
      __int16 v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Responding to Handoff payload request from \"%@\" via IDS", buf, 0xCu);
    }
    unsigned __int8 v18 = handoff_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10013345C();
    }
    id v32 = v12;
    id v33 = v6;

    double v19 = handoff_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1001333F4();
    }

    double v20 = objc_opt_new();
    id v21 = [v7 messageIdentifier];
    id v22 = [(SDActivityPayloadManager *)self dataFromUUID:v21];
    [v20 setObject:v22 forKeyedSubscript:IDSSendMessageOptionUUIDKey];

    CFStringRef v23 = [v7 requestIdentifier];
    id v24 = [v23 UUIDString];
    [v20 setObject:v24 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];

    [v20 setObject:&off_100902C28 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
    [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionActivityContinuationKey];
    [v20 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
    id v25 = (void *)v15;
    id v26 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v15 type:2 isResponse:1];
    activityService = self->_activityService;
    id v34 = 0;
    id v35 = 0;
    unsigned int v28 = [(IDSService *)activityService sendProtobuf:v26 toDestinations:v14 priority:300 options:v20 identifier:&v35 error:&v34];
    id v29 = v35;
    id v30 = v34;
    if (v28)
    {
      [(SDActivityPayloadManager *)self activityPayloadReplySuccess:v7];
    }
    else
    {
      id v31 = [v7 messageIdentifier];
      [(SDActivityPayloadManager *)self messageWithIdentifier:v31 didSendWithSuccess:0 error:v30];
    }
    id v6 = v33;

    id v12 = v32;
  }
  else
  {
    id v14 = handoff_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100133708();
    }
  }
}

- (void)activityPayloadReplySuccess:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activityIdentifier];

  if (v4)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    CFStringRef v9 = @"SDStreamActivityIdentifier";
    id v6 = [v3 activityIdentifier];
    id v7 = [v6 UUIDString];
    id v10 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v5 postNotificationName:@"com.apple.sharingd.ContinuationPayloadSent" object:0 userInfo:v8];
  }
}

- (void)handlePayloadReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  activityService = self->_activityService;
  id v13 = a6;
  id v14 = a3;
  uint64_t v15 = [(IDSService *)activityService devices];
  id v16 = [v13 idsDeviceIdentifier];

  id v17 = +[NSPredicate predicateWithFormat:@"uniqueIDOverride == %@", v16];
  unsigned __int8 v18 = [v15 filteredArrayUsingPredicate:v17];
  double v19 = [v18 firstObject];

  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  id v21 = handoff_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = self;
    id v22 = [v19 name];
    if (Int64Ranged > 0xB) {
      CFStringRef v23 = "?";
    }
    else {
      CFStringRef v23 = off_1008CDEB8[(int)Int64Ranged];
    }
    id v24 = [v11 requestIdentifier];
    id v25 = [v10 objectForKeyedSubscript:RPOptionXID];
    *(_DWORD *)buf = 138413058;
    unsigned int v28 = v22;
    __int16 v29 = 2080;
    id v30 = v23;
    __int16 v31 = 2112;
    id v32 = v24;
    __int16 v33 = 2112;
    id v34 = v25;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received Handoff payload reply from \"%@\" via Rapport (%s) with requestIdentifier %@, xid %@", buf, 0x2Au);

    self = v26;
  }

  [(SDActivityPayloadManager *)self handlePayloadReply:v14 forRequestRecord:v11 fromDevice:v19 transportLinkType:Int64Ranged];
}

- (void)handlePayloadReplyProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  id v12 = [(IDSService *)self->_activityService deviceForFromID:a6];
  if (v12)
  {
    id v13 = objc_alloc((Class)NSUUID);
    id v14 = [v11 incomingResponseIdentifier];
    id v15 = [v13 initWithUUIDString:v14];

    id v16 = [(NSMutableDictionary *)self->_messageIdentifierToRequestRecords objectForKeyedSubscript:v15];
    id v17 = [v10 data];
    unsigned __int8 v18 = [(SDActivityPayloadManager *)self requestFromProtobufData:v17];

    double v19 = handoff_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = [v12 name];
      id v21 = [v16 requestIdentifier];
      int v22 = 138412546;
      CFStringRef v23 = v20;
      __int16 v24 = 2112;
      id v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received Handoff payload reply from \"%@\" via IDS with requestIdentifier %@", (uint8_t *)&v22, 0x16u);
    }
    [(SDActivityPayloadManager *)self handlePayloadReply:v18 forRequestRecord:v16 fromDevice:v12 transportLinkType:0xFFFFFFFFLL];
  }
}

- (void)handlePayloadReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v42 = a5;
  if ((v6 & 0x80000000) != 0)
  {
    id v41 = @"IDS";
    if (!v10) {
      goto LABEL_11;
    }
  }
  else
  {
    if (v6 > 0xB) {
      id v12 = "?";
    }
    else {
      id v12 = off_1008CDEB8[(int)v6];
    }
    id v41 = +[NSString stringWithFormat:@"Rapport (%s)", v12];
    if (!v10) {
      goto LABEL_11;
    }
  }
  if (v11)
  {
    messageIdentifierToRequestRecords = self->_messageIdentifierToRequestRecords;
    id v14 = [v11 requestIdentifier];
    [(NSMutableDictionary *)messageIdentifierToRequestRecords removeObjectForKey:v14];

    id v15 = [v11 timeoutTimer];
    [v15 invalidate];

    id v40 = [v10 objectForKeyedSubscript:@"rAdvPayload"];
    id v16 = [v10 objectForKeyedSubscript:@"rActPayload"];
    id v17 = [v10 objectForKeyedSubscript:@"rActPayloadErrorDomain"];

    if (v17)
    {
      unsigned __int8 v18 = [v10 objectForKeyedSubscript:@"rActPayloadErrorDomain"];
      [v10 objectForKeyedSubscript:@"rActPayloadErrorCode"];
      v20 = double v19 = v16;
      id v39 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, [v20 integerValue], 0);

      id v16 = v19;
    }
    else
    {
      id v39 = 0;
    }
    __int16 v24 = [v11 requestCreatedDate];
    [v24 timeIntervalSinceNow];
    id v25 = SFStringFromTimeInterval();

    id v26 = handoff_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = [v42 name];
      unsigned int v28 = [v42 uniqueIDOverride];
      SFHexStringForData();
      __int16 v29 = v36 = v6;
      __int16 v37 = v16;
      id v30 = [v16 length];
      [v11 requestIdentifier];
      v32 = __int16 v31 = v25;
      [v32 UUIDString];
      v33 = id v38 = self;
      *(_DWORD *)buf = 138414082;
      id v44 = v41;
      __int16 v45 = 2112;
      id v46 = v27;
      __int16 v47 = 2112;
      id v48 = v28;
      __int16 v49 = 2112;
      __int16 v50 = v29;
      __int16 v51 = 2048;
      id v52 = v30;
      id v16 = v37;
      __int16 v53 = 2112;
      __int16 v54 = v33;
      __int16 v55 = 2112;
      __int16 v56 = v39;
      __int16 v57 = 2112;
      __int16 v58 = v31;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received requested Handoff payload via %@ from \"%@\" (%@) for %@ with activity payload of size %ld for requestIdentifier %@ (%@). RTT:%@", buf, 0x52u);

      id v25 = v31;
      self = v38;

      uint64_t v6 = v36;
    }

    kdebug_trace();
    id v34 = [v11 requestCreatedDate];
    [v34 timeIntervalSinceNow];
    -[SDActivityPayloadManager logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:](self, "logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:", v6, @"Request", 1);

    id v35 = [v11 completionHandler];
    ((void (**)(void, void *, void *))v35)[2](v35, v16, v39);

    goto LABEL_17;
  }
LABEL_11:
  id v40 = handoff_log();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    id v21 = [v11 requestIdentifier];
    int v22 = [v21 UUIDString];
    CFStringRef v23 = [v42 uniqueIDOverride];
    *(_DWORD *)buf = 138412802;
    id v44 = v41;
    __int16 v45 = 2112;
    id v46 = v22;
    __int16 v47 = 2112;
    id v48 = v23;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Activity payload received via %@ for requestIdentifier %@ not/no longer wanted from %@", buf, 0x20u);
  }
LABEL_17:
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a5;
  id v9 = a7;
  id v10 = handoff_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1001337D8();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7 = a7;
  id v8 = handoff_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100133840();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v6 = a5;
  id v7 = handoff_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001338A8();
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v7 = a6;
  id v10 = a7;
  id v11 = a5;
  id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];

  [(SDActivityPayloadManager *)self messageWithIdentifier:v12 didSendWithSuccess:v7 error:v10];
}

- (void)messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_messageIdentifierToReplyRecords objectForKeyedSubscript:v8];
  id v11 = [(NSMutableDictionary *)self->_messageIdentifierToRequestRecords objectForKeyedSubscript:v8];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(NSMutableDictionary *)self->_messageIdentifierToKeyRequestRecords objectForKeyedSubscript:v8];
  }
  id v14 = v13;

  id v15 = handoff_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = v8;
    }
    if (v10) {
      id v16 = v10;
    }
    CFStringRef v17 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v27 = v16;
    __int16 v28 = 2112;
    if (v6) {
      CFStringRef v17 = @"YES";
    }
    CFStringRef v29 = v17;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ %@ (%@)", buf, 0x20u);
  }

  if (!v9 && !v6)
  {
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Unknown Error";
    unsigned __int8 v18 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:94 userInfo:v18];
  }
  if (v10)
  {
    [(NSMutableDictionary *)self->_messageIdentifierToReplyRecords removeObjectForKey:v8];
    double v19 = [v10 deviceIdentifier];
    double v20 = [(SDActivityPayloadManager *)self idsDeviceWithUniqueID:v19 onService:self->_activityService];
    id v21 = sub_1000C9CC4(v20);

    advertiser = self->_advertiser;
    CFStringRef v23 = [v10 activityIdentifier];
    [(SDActivityAdvertiser *)advertiser didSendPayloadForActivityIdentifier:v23 toDevice:v21 error:v9];

LABEL_21:
    goto LABEL_22;
  }
  if (v14 && v9)
  {
    [v14 setError:v9];
    id v21 = [v14 timeoutTimer];
    [v21 fire];
    goto LABEL_21;
  }
LABEL_22:
}

- (id)dataFromUUID:(id)a3
{
  v5[0] = 0;
  v5[1] = 0;
  [a3 getUUIDBytes:v5];
  id v3 = +[NSData dataWithBytes:v5 length:16];

  return v3;
}

- (id)requestFromProtobufData:(id)a3
{
  id v7 = 0;
  uint64_t v8 = 0;
  id v3 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:&v8 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    id v5 = handoff_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100133910();
    }
  }

  return v3;
}

- (id)protobufDataFromRequest:(id)a3
{
  id v3 = a3;
  id v4 = [&off_100905898 mutableCopy];
  [v4 addEntriesFromDictionary:v3];

  id v9 = 0;
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = handoff_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100133978();
    }
  }

  return v5;
}

- (void)setDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = a3;
    id v7 = +[SDActivityEncryptionManager sharedEncryptionManager];
    id v8 = [v7 newDecryptionKeyFromDataRepresentation:v6];

    id v9 = [v7 decryptionKeyForDeviceIdentifier:v5];
    id v10 = [v9 dateCreated];
    id v11 = [v8 dateCreated];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;

    id v14 = [v9 keyIdentifier];
    id v15 = [v8 keyIdentifier];
    unsigned int v16 = [v14 isEqual:v15];

    if (v16)
    {
      unsigned int v17 = [v9 lastUsedCounter];
      BOOL v18 = v17 < [v8 lastUsedCounter];
      if (!v8) {
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v18 = 0;
      if (!v8) {
        goto LABEL_14;
      }
    }
    if (v13 < 0.0 || v9 == 0) {
      BOOL v18 = 1;
    }
    if (v18)
    {
      double v20 = +[SDActivityEncryptionManager sharedEncryptionManager];
      [v20 setDecryptionKey:v8 forDeviceIdentifier:v5];
LABEL_16:

      goto LABEL_17;
    }
LABEL_14:
    double v20 = handoff_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_1001339E0();
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)logDashboardHandoffRequestViaTransportLinkType:(int)a3 type:(id)a4 success:(BOOL)a5 rtt:(double)a6
{
  BOOL v6 = a5;
  uint64_t v8 = *(void *)&a3;
  v19[0] = @"_cat";
  v19[1] = @"_op";
  v20[0] = @"Handoff";
  v20[1] = a4;
  v19[2] = @"rapportTransport";
  id v10 = a4;
  id v11 = +[NSNumber numberWithInt:v8];
  v20[2] = v11;
  v19[3] = @"success";
  double v12 = +[NSNumber numberWithBool:v6];
  v20[3] = v12;
  v19[4] = @"wasRapport";
  double v13 = +[NSNumber numberWithInt:(int)v8 >= 0];
  v20[4] = v13;
  v19[5] = @"RTT";
  int v14 = (int)(a6 * 1000.0);
  if (v14 >= 0) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = -v14;
  }
  unsigned int v16 = +[NSNumber numberWithInt:v15];
  v20[5] = v16;
  v19[6] = @"d2dEncryptionAvailable";
  unsigned int v17 = +[NSNumber numberWithBool:self->_d2dEncryptionAvailable];
  v20[6] = v17;
  BOOL v18 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];

  SFDashboardLogJSON();
}

- (id)createRapportClientWithDestinationDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (!sub_1000D9060(@"ContinuityRapportDisableBLEDiscovery", 0)) {
    [v4 setControlFlags:((unint64_t)[v4 controlFlags] | 2)];
  }
  if (sub_1000D9060(@"ContinuityRapportForceL2CAP", 0)) {
    [v4 setControlFlags:((unint64_t)[v4 controlFlags] | 0x100)];
  }
  [v4 setDestinationDevice:v3];
  if (v3) {
    [v4 setControlFlags:((unint64_t)[v4 controlFlags] | 0x8000000000000)];
  }
  id v5 = handoff_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SDActivityPayloadManager createRapportClientWithDestinationDevice:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s creating client: %@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (void)sendActivityPayloadWithAdvertisementData:(id)a3 forAdvertisementPayload:(id)a4 activityIdentifier:(id)a5 activityPayload:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v53 = a5;
  id v12 = a6;
  __int16 v51 = self;
  double v13 = [(IDSService *)self->_activityService devices];
  int v14 = [v13 firstObject];
  id v52 = [v14 uniqueIDOverride];

  uint64_t v15 = handoff_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v42 = [v12 length];
    id v43 = SFHexStringForData();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v62 = v42;
    *(_WORD *)&v62[4] = 2112;
    *(void *)&v62[6] = v53;
    *(_WORD *)&v62[14] = 2112;
    *(void *)&v62[16] = v43;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Got payload to send of size %d with activityIdentifier:%@ for advertisementPayload:%@", buf, 0x1Cu);
  }
  id v48 = v11;

  unsigned int v16 = objc_opt_new();
  [v16 setObject:v10 forKeyedSubscript:@"rAdvData"];
  if (v12) {
    [v16 setObject:v12 forKeyedSubscript:@"rActPayload"];
  }
  id v49 = v12;
  __int16 v47 = v16;
  __int16 v50 = -[SDActivityPayloadManager protobufDataFromRequest:](v51, "protobufDataFromRequest:", v16, a2);
  id v17 = objc_alloc_init((Class)NSMutableSet);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  BOOL v18 = [(IDSService *)v51->_activityService devices];
  id v19 = [v18 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v57;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v57 != v21) {
          objc_enumerationMutation(v18);
        }
        CFStringRef v23 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        NSErrorUserInfoKey v24 = [v23 nsuuid];

        if (v24)
        {
          CFStringRef v25 = IDSCopyForDevice();
          if (v25)
          {
            [v17 addObject:v25];
          }
          else
          {
            id v26 = handoff_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)__int16 v62 = v53;
              *(_WORD *)&v62[8] = 2112;
              *(void *)&v62[10] = v23;
              _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Not sending %@ to device as we could not get deviceID: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          CFStringRef v25 = handoff_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)__int16 v62 = v53;
            *(_WORD *)&v62[8] = 2112;
            *(void *)&v62[10] = v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Not sending %@ to device as it has no nsuuid/BTUUID: %@", buf, 0x16u);
          }
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v20);
  }

  if (!v17)
  {
    id v44 = +[NSAssertionHandler currentHandler];
    [v44 handleFailureInMethod:v46, v51, @"SDActivityPayloadManager.m", 1149, @"Demo mode enabled, yet cannot find any destinations on service" object file lineNumber description];
  }
  id v27 = objc_opt_new();
  __int16 v28 = objc_opt_new();
  [v28 setMessageIdentifier:v27];
  [v28 setRequestIdentifier:0];
  [v28 setActivityIdentifier:v53];
  [v28 setDeviceIdentifier:v52];
  [(NSMutableDictionary *)v51->_messageIdentifierToReplyRecords setObject:v28 forKeyedSubscript:v27];
  CFStringRef v29 = handoff_log();
  __int16 v30 = v49;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v31 = @"final ";
    if (!v49) {
      CFStringRef v31 = &stru_1008E7020;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v62 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Sending Handoff %@advertisement", buf, 0xCu);
  }

  id v32 = handoff_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    sub_100133A48();
  }

  __int16 v33 = objc_opt_new();
  id v34 = [(SDActivityPayloadManager *)v51 dataFromUUID:v27];
  [v33 setObject:v34 forKeyedSubscript:IDSSendMessageOptionUUIDKey];

  [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionActivityContinuationKey];
  [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
  [v33 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
  if (!v49) {
    [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionNonWakingKey];
  }
  id v35 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v50 type:3 isResponse:0];
  activityService = v51->_activityService;
  id v54 = 0;
  id v55 = 0;
  unsigned __int8 v37 = [(IDSService *)activityService sendProtobuf:v35 toDestinations:v17 priority:300 options:v33 identifier:&v55 error:&v54];
  id v38 = v55;
  id v39 = v54;
  if ((v37 & 1) == 0)
  {
    id v40 = v51->_activityService;
    id v41 = [v27 UUIDString];
    [(SDActivityPayloadManager *)v51 service:v40 account:0 identifier:v41 didSendWithSuccess:0 error:v39];

    __int16 v30 = v49;
  }
}

- (void)handleNewAdvertisementWithpayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [a3 data];
  double v13 = [(SDActivityPayloadManager *)self requestFromProtobufData:v12];

  int v14 = [v11 deviceForFromID:v10];

  uint64_t v15 = [v14 uniqueIDOverride];
  unsigned int v16 = [v13 objectForKeyedSubscript:@"rAdvData"];
  scanner = self->_scanner;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10013283C;
  v21[3] = &unk_1008CDE98;
  id v22 = v13;
  CFStringRef v23 = self;
  id v24 = v15;
  id v25 = v14;
  id v18 = v14;
  id v19 = v15;
  id v20 = v13;
  [(SDActivityScanner *)scanner handleNewAdvertisementDevice:v18 data:v16 receivedViaScanning:0 withSuccessHandler:v21];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedActivityPayloadsForDemo, 0);
  objc_storeStrong((id *)&self->_tempDeviceScanTimer, 0);
  objc_storeStrong((id *)&self->_messageIdentifierToRequestRecords, 0);
  objc_storeStrong((id *)&self->_messageIdentifierToReplyRecords, 0);
  objc_storeStrong((id *)&self->_messageIdentifierToKeyRequestRecords, 0);
  objc_storeStrong((id *)&self->_uniqueIDToKeyReplyDate, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_rapportDiscoveryClient, 0);
  objc_storeStrong((id *)&self->_encryptionService, 0);

  objc_storeStrong((id *)&self->_activityService, 0);
}

@end