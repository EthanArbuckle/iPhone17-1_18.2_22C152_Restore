@interface FMFIDSMessageController
+ (id)sharedInstance;
+ (unint64_t)defaultTimeout;
+ (void)_receivedDeletedFenceInformationMessage:(id)a3;
+ (void)_receivedFenceTriggerMessage:(id)a3;
+ (void)_receivedShareInvitationMessage:(id)a3 fromID:(id)a4;
- (BOOL)_sendMessage:(id)a3 toHandle:(id)a4 error:(id *)a5;
- (BOOL)_sendMessage:(id)a3 toHandles:(id)a4 error:(id *)a5;
- (BOOL)sendDeletedFenceMessageWithFenceID:(id)a3 ckRecordID:(id)a4 toHandles:(id)a5 error:(id *)a6;
- (BOOL)sendMessage:(id)a3 toIdentifier:(id)a4 error:(id *)a5;
- (BOOL)sendTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 toHandles:(id)a8 error:(id *)a9;
- (FMFIDSMessageController)init;
- (IDSService)fmfIDSService;
- (NSMutableSet)servicesRegistered;
- (OS_dispatch_queue)queue;
- (id)IDSRecipientFromHandle:(id)a3;
- (int64_t)checkIDSStatusOfRecipientForService:(id)a3;
- (void)hasIDSFenceCapabilityForHandle:(id)a3 withCompletion:(id)a4;
- (void)sendMappingPacket:(id)a3 toHandle:(id)a4;
- (void)senderIsValid:(id)a3 idsSenderRequirement:(int64_t)a4 fenceId:(id)a5 ckRecordName:(id)a6 withCompletion:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setServicesRegistered:(id)a3;
- (void)updateIDSStatusForHandle:(id)a3;
@end

@implementation FMFIDSMessageController

+ (id)sharedInstance
{
  if (qword_1000BB7A0 != -1) {
    dispatch_once(&qword_1000BB7A0, &stru_1000A2350);
  }
  v2 = (void *)qword_1000BB798;

  return v2;
}

+ (unint64_t)defaultTimeout
{
  return dispatch_time(0, 10000000000);
}

- (FMFIDSMessageController)init
{
  v8.receiver = self;
  v8.super_class = (Class)FMFIDSMessageController;
  v2 = [(FMFIDSMessageController *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(off_1000BB090, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.fmf"];
    fmfIDSService = v2->_fmfIDSService;
    v2->_fmfIDSService = v5;

    [v2->_fmfIDSService addDelegate:v2 queue:v2->_queue];
  }
  return v2;
}

- (id)IDSRecipientFromHandle:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  BOOL IsEmail = FMFStringIsEmail(v4);

  v6 = [v3 identifier];

  if (IsEmail) {
    uint64_t v7 = IDSCopyIDForEmailAddress();
  }
  else {
    uint64_t v7 = IDSCopyIDForPhoneNumber();
  }
  objc_super v8 = (void *)v7;

  return v8;
}

- (BOOL)_sendMessage:(id)a3 toHandle:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = +[NSSet setWithObject:a4];
  LOBYTE(a5) = [(FMFIDSMessageController *)self _sendMessage:v8 toHandles:v9 error:a5];

  return (char)a5;
}

- (BOOL)_sendMessage:(id)a3 toHandles:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(FMFIDSMessageController *)self fmfIDSService];
  v11 = [v10 accounts];

  if ([v11 count] && v11)
  {
    v12 = [v11 anyObject];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000268B0;
    v24[3] = &unk_1000A2378;
    v24[4] = self;
    v13 = [v9 fm_map:v24];
    v14 = sub_100005560();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Sending IDS message over account: %@, to handles: %@ with payload: %@", buf, 0x20u);
    }

    v15 = [(FMFIDSMessageController *)self fmfIDSService];
    id v22 = 0;
    id v23 = 0;
    [v15 sendMessage:v8 toDestinations:v13 priority:300 options:0 identifier:&v23 error:&v22];
    id v16 = v23;
    id v17 = v22;

    BOOL v18 = v17 == 0;
    if (v17)
    {
      v19 = sub_100005560();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v26 = v17;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2112;
        id v30 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error (%@) sending IDS message to handles: %@ with payload: %@", buf, 0x20u);
      }

      if (a5) {
        *a5 = v17;
      }
    }
  }
  else
  {
    v20 = sub_100005560();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Error no IDS Accounts on this device.", buf, 2u);
    }

    if (a5)
    {
      +[NSError errorWithDomain:FMFErrorDomain code:1017 userInfo:0];
      BOOL v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (int64_t)checkIDSStatusOfRecipientForService:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFIDSMessageController checkIDSStatusOfRecipientForService:]");
  id v6 = [objc_alloc((Class)FMFSynchronizer) initWithDescription:v5 andTimeout:10.0];
  uint64_t v7 = +[IDSIDQueryController sharedInstance];
  id v8 = &_dispatch_main_q;
  [v7 addDelegate:self forService:@"com.apple.private.alloy.fmf" listenerID:@"com.apple.private.alloy.fmf" queue:&_dispatch_main_q];

  id v9 = +[IDSIDQueryController sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100026AA0;
  v14[3] = &unk_1000A23A0;
  id v10 = v4;
  id v15 = v10;
  id v17 = &v18;
  id v11 = v6;
  id v16 = v11;
  [v9 refreshIDStatusForDestination:v10 service:@"com.apple.private.alloy.fmf" listenerID:@"com.apple.private.alloy.fmf" queue:&_dispatch_main_q completionBlock:v14];

  [v11 wait];
  int64_t v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

+ (void)_receivedFenceTriggerMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"fenceID" ofClass:objc_opt_class()];
  if (v4)
  {
    v5 = [v3 objectForKey:@"uuid" ofClass:objc_opt_class()];
    if (v5)
    {
      id v6 = [v3 objectForKey:@"triggerStatus" ofClass:objc_opt_class()];
      if (v6)
      {
        uint64_t v7 = [v3 objectForKey:@"date" ofClass:objc_opt_class()];
        id v8 = v7;
        if (v7)
        {
          [v7 doubleValue];
          id v9 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
          id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
          uint64_t v11 = [v3 objectForKey:@"location" ofClass:objc_opt_class()];
          uint64_t v21 = v10;
          uint64_t v20 = (void *)v11;
          if (v11)
          {
            uint64_t v12 = v11;
            v13 = +[NSSet setWithObject:objc_opt_class()];
            id v22 = 0;
            v19 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v13 fromData:v12 error:&v22];
            id v17 = v22;
          }
          else
          {
            id v17 = 0;
            v19 = 0;
          }
          v14 = +[FMFDataManager sharedInstance];
          id v15 = [v14 fenceSequencer];
          id v16 = [v15 fenceManager];
          [v16 receiveTriggerWithUUID:v21 forFenceWithID:v4 withStatus:v6 atDate:v9 triggerLocation:v19];
        }
        else
        {
          id v9 = sub_100005560();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No fence trigger time interval", buf, 2u);
          }
        }
      }
      else
      {
        id v8 = sub_100005560();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No fence trigger status", buf, 2u);
        }
      }
    }
    else
    {
      id v6 = sub_100005560();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No UUIDString received", buf, 2u);
      }
    }
  }
  else
  {
    v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No fenceID received", buf, 2u);
    }
  }
}

+ (void)_receivedShareInvitationMessage:(id)a3 fromID:(id)a4
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"p1" ofClass:objc_opt_class()];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"p0" ofClass:objc_opt_class()];
    if (v6)
    {
      uint64_t v7 = +[FMFCloudKitManager sharedInstance];
      [v7 handleReceiveCKShareWithURLString:v5 invitationTokenBase64String:v6];
    }
    else
    {
      uint64_t v7 = sub_100005560();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No param0 received", v8, 2u);
      }
    }
  }
  else
  {
    id v6 = sub_100005560();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No param1 received", buf, 2u);
    }
  }
}

+ (void)_receivedDeletedFenceInformationMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"fenceID" ofClass:objc_opt_class()];
  if (v4)
  {
    v5 = [v3 objectForKey:@"ckRecordID" ofClass:objc_opt_class()];
    if (v5)
    {
      id v6 = +[NSSet setWithObject:objc_opt_class()];
      uint64_t v10 = 0;
      uint64_t v7 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v6 fromData:v5 error:&v10];

      id v8 = +[FMFDataManager sharedInstance];
      id v9 = [v8 fenceSequencer];
      [v9 cleanupRemovedFenceInformationWithFenceID:v4 ckRecordID:v7];
    }
    else
    {
      uint64_t v7 = sub_100005560();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No recordIDData received", v11, 2u);
      }
    }
  }
  else
  {
    v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No fenceID received", buf, 2u);
    }
  }
}

- (BOOL)sendTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 toHandles:(id)a8 error:(id *)a9
{
  id v28 = 0;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = +[NSKeyedArchiver archivedDataWithRootObject:a7 requiringSecureCoding:1 error:&v28];
  id v21 = v28;
  v30[0] = @"fenceTrigger";
  v29[0] = @"kFMFServicePayloadKey";
  v29[1] = @"uuid";
  id v22 = [v19 UUIDString];

  v30[1] = v22;
  v30[2] = v18;
  v29[2] = @"fenceID";
  v29[3] = @"triggerStatus";
  v30[3] = v17;
  v29[4] = @"date";
  [v16 timeIntervalSince1970];
  double v24 = v23;

  v25 = +[NSNumber numberWithDouble:v24];
  v30[4] = v25;
  v30[5] = v20;
  v29[5] = @"location";
  v29[6] = @"v";
  v30[6] = @"1";
  id v26 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:7];

  LOBYTE(v25) = [(FMFIDSMessageController *)self _sendMessage:v26 toHandles:v15 error:a9];
  return (char)v25;
}

- (BOOL)sendDeletedFenceMessageWithFenceID:(id)a3 ckRecordID:(id)a4 toHandles:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a4)
  {
    id v16 = 0;
    a4 = +[NSKeyedArchiver archivedDataWithRootObject:a4 requiringSecureCoding:1 error:&v16];
    id v12 = v16;
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  [v13 fm_safeSetObject:@"deletedFenceInformation" forKey:@"kFMFServicePayloadKey"];
  [v13 fm_safeSetObject:v10 forKey:@"fenceID"];
  [v13 fm_safeSetObject:a4 forKey:@"ckRecordID"];
  BOOL v14 = [(FMFIDSMessageController *)self _sendMessage:v13 toHandles:v11 error:a6];

  return v14;
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4
{
  v9[0] = @"p";
  v9[1] = @"kFMFServicePayloadKey";
  v10[0] = a3;
  v10[1] = @"mappingPacket";
  v9[2] = @"v";
  v10[2] = @"1";
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  [(FMFIDSMessageController *)self _sendMessage:v8 toHandle:v6 error:0];
}

- (BOOL)sendMessage:(id)a3 toIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = +[FMFHandle handleWithId:a4];
  LOBYTE(a5) = [(FMFIDSMessageController *)self _sendMessage:v8 toHandle:v9 error:a5];

  return (char)a5;
}

- (void)updateIDSStatusForHandle:(id)a3
{
  id v6 = a3;
  id v4 = [(FMFIDSMessageController *)self IDSRecipientFromHandle:v6];
  [v6 setIdsStatus:-[FMFIDSMessageController checkIDSStatusOfRecipientForService:](self, "checkIDSStatusOfRecipientForService:", v4)];
  v5 = (void *)IDSCopyRawAddressForDestination();
  if ([v5 length]) {
    [v6 setQualifiedIdentifier:v5];
  }
}

- (void)hasIDSFenceCapabilityForHandle:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMFIDSMessageController *)self IDSRecipientFromHandle:v6];
  id v9 = +[IDSIDQueryController sharedInstance];
  id v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, 0);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  id v11 = &_dispatch_main_q;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100027870;
  v14[3] = &unk_1000A23C8;
  id v12 = v8;
  id v15 = v12;
  id v17 = v18;
  id v13 = v7;
  id v16 = v13;
  [v9 currentRemoteDevicesForDestinations:v10 service:@"com.apple.private.alloy.fmf" listenerID:@"com.apple.private.alloy.fmf" queue:&_dispatch_main_q completionBlock:v14];

  _Block_object_dispose(v18, 8);
}

- (void)senderIsValid:(id)a3 idsSenderRequirement:(int64_t)a4 fenceId:(id)a5 ckRecordName:(id)a6 withCompletion:(id)a7
{
  id v11 = a3;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  v33 = v11;
  v34 = [v11 senderCorrelationIdentifier];
  id v12 = sub_100005560();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v11 senderCorrelationIdentifier];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: sender correlationID: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  if (a4 == 2)
  {
    id v15 = +[FMFDataManager sharedInstance];
    id v17 = [v15 followerHandles];
    id v18 = +[FMFDataManager sharedInstance];
    char v19 = [v18 followingHandles];
    BOOL v14 = [v17 setByAddingObjectsFromSet:v19];
  }
  else
  {
    if (a4 == 1)
    {
      id v15 = +[FMFDataManager sharedInstance];
      uint64_t v16 = [v15 followingHandles];
    }
    else
    {
      BOOL v14 = 0;
      if (a4) {
        goto LABEL_11;
      }
      id v15 = +[FMFDataManager sharedInstance];
      uint64_t v16 = [v15 followerHandles];
    }
    BOOL v14 = (void *)v16;
  }

LABEL_11:
  uint64_t v20 = dispatch_group_create();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v21 = v14;
  id v22 = [v21 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v45;
LABEL_13:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v45 != v23) {
        objc_enumerationMutation(v21);
      }
      v25 = *(void **)(*((void *)&v44 + 1) + 8 * v24);
      dispatch_group_enter(v20);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100027E0C;
      v40[3] = &unk_1000A23F0;
      v40[4] = v25;
      id v41 = v34;
      p_long long buf = &buf;
      v42 = v20;
      [v25 idsCorrelationIdentifierWithCompletion:v40];
      LOBYTE(v25) = *(unsigned char *)(*((void *)&buf + 1) + 24) == 0;

      if ((v25 & 1) == 0) {
        break;
      }
      if (v22 == (id)++v24)
      {
        id v22 = [v21 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v22) {
          goto LABEL_13;
        }
        break;
      }
    }
  }

  id v26 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027F0C;
  block[3] = &unk_1000A2440;
  id v38 = v30;
  v39 = &buf;
  id v36 = v32;
  id v37 = v31;
  id v27 = v31;
  id v28 = v30;
  id v29 = v32;
  dispatch_group_notify(v20, v26, block);

  _Block_object_dispose(&buf, 8);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [v12 objectForKey:@"kFMFServicePayloadKey" ofClass:objc_opt_class()];
  uint64_t v16 = +[FMFCommandManager sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100028550;
  v21[3] = &unk_1000A24B8;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  v25 = v15;
  id v26 = self;
  id v27 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  [v16 refreshForSession:0 withReason:3 withCompletion:v21];
}

- (IDSService)fmfIDSService
{
  return self->_fmfIDSService;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)servicesRegistered
{
  return self->_servicesRegistered;
}

- (void)setServicesRegistered:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicesRegistered, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_fmfIDSService, 0);
}

@end