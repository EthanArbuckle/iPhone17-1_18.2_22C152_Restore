@interface PTPCameraDevice
- (BOOL)acceptConnection:(id)a3;
- (BOOL)eject;
- (BOOL)prioritizeSpeed;
- (NSMutableArray)controlBundles;
- (NSString)internalUUID;
- (NSXPCListenerEndpoint)endpoint;
- (PTPCameraDevice)initWithDeviceContext:(id)a3;
- (PTPInitiator)initiator;
- (id)additionalProperties;
- (id)itemForObjectHandle:(id)a3;
- (unint64_t)locationID;
- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5;
- (void)closeDevice;
- (void)dealloc;
- (void)enumerateContentWithOptions:(id)a3;
- (void)registerInterestedEventNotifications:(id)a3;
- (void)requestDeleteObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)requestDownloadObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)requestEndUsingDevice;
- (void)requestFingerprintForObjectHandle:(id)a3 withReply:(id)a4;
- (void)requestMetadataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)requestReadDataFromObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)requestStartUsingDeviceWithReply:(id)a3;
- (void)requestThumbnailDataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)sendPTPCommand:(id)a3 andPayload:(id)a4 withReply:(id)a5;
- (void)setControlBundles:(id)a3;
- (void)setInitiator:(id)a3;
- (void)setLocationID:(unint64_t)a3;
- (void)setPrioritizeSpeed:(BOOL)a3;
- (void)unregisterInterestedEventNotifications:(id)a3;
@end

@implementation PTPCameraDevice

- (PTPCameraDevice)initWithDeviceContext:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PTPCameraDevice;
  v5 = [(ICRemoteCameraDevice *)&v16 initWithDeviceContext:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ICDevicePrimaryIdentifier"];
    v5->_locationID = (unint64_t)[v6 integerValue];

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    controlBundles = v5->_controlBundles;
    v5->_controlBundles = v7;

    v9 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v9 setObject:@"camera" forKeyedSubscript:@"ICDeviceSystemSymbolName"];

    v10 = [v4 objectForKeyedSubscript:@"ICDeviceName"];
    v11 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v11 setObject:v10 forKeyedSubscript:@"ICDeviceName"];

    v12 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v12 setObject:@"ICTransportTypeUSB" forKeyedSubscript:@"ICDeviceTransportType"];

    v13 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v13 setObject:@"Camera" forKeyedSubscript:@"ICDeviceType"];

    v14 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v14 setObject:@"Camera" forKeyedSubscript:@"ICDeviceProductKind"];
  }
  return v5;
}

- (void)dealloc
{
  __ICOSLogCreate();
  v3 = @"PTPCamera";
  if ((unint64_t)[@"PTPCamera" length] >= 0x15)
  {
    id v4 = [@"PTPCamera" substringWithRange:0, 18];
    v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = [(PTPInitiator *)self->_initiator transport];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p | %16s - 0x%08X", self, "dealloc locID", [v5 locationID]);

  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v3;
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    id v14 = [(__CFString *)v8 UTF8String];
    __int16 v15 = 2114;
    objc_super v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [(PTPInitiator *)self->_initiator setDelegate:0];
  initiator = self->_initiator;
  self->_initiator = 0;

  v11 = [(ICRemoteCameraDevice *)self deviceOperationQueue];
  [v11 waitUntilAllOperationsAreFinished];

  self->_locationID = 0;
  v12.receiver = self;
  v12.super_class = (Class)PTPCameraDevice;
  [(ICRemoteCameraDevice *)&v12 dealloc];
}

- (NSXPCListenerEndpoint)endpoint
{
  v2 = [(ICRemoteCameraDevice *)self listener];
  v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (NSString)internalUUID
{
  v2 = [(ICRemoteCameraDevice *)self cameraDictionary];
  v3 = [v2 objectForKeyedSubscript:@"ICInternalDeviceUUID"];

  return (NSString *)v3;
}

- (void)requestEndUsingDevice
{
  __ICOSLogCreate();
  v3 = +[NSString stringWithFormat:@"requestEndUsingDevice"];
  uint64_t v4 = __ICLogTypeEnabled(2);
  v5 = _gICOSLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
  {
    sub_100033CE8((uint64_t)v3, v5);
  }

  v6 = [(ICRemoteCameraDevice *)self sessionManager];
  v7 = +[NSXPCConnection currentConnection];
  v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 processIdentifier]);
  [v6 removeSessionsWithProcessIdentifier:v8];
}

- (void)requestStartUsingDeviceWithReply:(id)a3
{
  id v4 = a3;
  v5 = +[NSXPCConnection currentConnection];
  v6 = v5;
  memset(&error[1], 0, 32);
  if (v5) {
    [v5 auditToken];
  }
  audit_token_t token = *(audit_token_t *)&error[1];
  v7 = SecTaskCreateWithAuditToken(0, &token);
  error[0] = 0;
  v8 = (__CFString *)SecTaskCopySigningIdentifier(v7, error);
  CFRelease(v7);
  if (([(__CFString *)v8 isEqualToString:@"com.apple.Photos"] & 1) != 0
    || [(__CFString *)v8 isEqualToString:@"com.apple.MobileSlideShow"])
  {
    int v9 = &__kCFBooleanTrue;
  }
  else
  {
    int v9 = &__kCFBooleanFalse;
  }
  __ICOSLogCreate();
  v10 = @"requestStart";
  if ((unint64_t)[@"requestStart" length] >= 0x15)
  {
    v11 = [@"requestStart" substringWithRange:0, 18];
    v10 = [v11 stringByAppendingString:@".."];
  }
  unsigned int v12 = [v9 BOOLValue];
  v13 = "NO";
  if (v12) {
    v13 = "YES";
  }
  id v14 = +[NSString stringWithFormat:@"Process: %@, Request Order Ascending: %s", v8, v13];
  __int16 v15 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v16 = v10;
    v17 = v15;
    id v18 = [(__CFString *)v16 UTF8String];
    token.val[0] = 136446466;
    *(void *)&token.val[1] = v18;
    LOWORD(token.val[3]) = 2114;
    *(void *)((char *)&token.val[3] + 2) = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000AD58;
  v21[3] = &unk_10004C8E0;
  v21[4] = self;
  id v22 = v9;
  id v23 = v4;
  id v19 = v4;
  v20 = +[NSBlockOperation blockOperationWithBlock:v21];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v20];
}

- (void)registerInterestedEventNotifications:(id)a3
{
  id v4 = a3;
  +[NSXPCConnection currentConnection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000BCFC;
  v8[3] = &unk_10004C908;
  v8[4] = self;
  id v9 = v4;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v10;
  id v6 = v4;
  v7 = +[NSBlockOperation blockOperationWithBlock:v8];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v7];
}

- (void)unregisterInterestedEventNotifications:(id)a3
{
  id v4 = a3;
  +[NSXPCConnection currentConnection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000BE38;
  v8[3] = &unk_10004C908;
  v8[4] = self;
  id v9 = v4;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v10;
  id v6 = v4;
  v7 = +[NSBlockOperation blockOperationWithBlock:v8];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v7];
}

- (void)requestMetadataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  unsigned int v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10000BF94;
  __int16 v15 = &unk_10004C930;
  objc_super v16 = self;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v8 = v19;
  id v9 = v18;
  id v10 = v17;
  v11 = +[NSBlockOperation blockOperationWithBlock:&v12];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v11, v12, v13, v14, v15, v16);
}

- (void)requestThumbnailDataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  unsigned int v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10000C16C;
  __int16 v15 = &unk_10004C930;
  objc_super v16 = self;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v8 = v19;
  id v9 = v18;
  id v10 = v17;
  v11 = +[NSBlockOperation blockOperationWithBlock:&v12];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v11, v12, v13, v14, v15, v16);
}

- (void)requestDownloadObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  unsigned int v12 = sub_10000C318;
  uint64_t v13 = &unk_10004C958;
  id v14 = a4;
  id v15 = a5;
  id v7 = v15;
  id v8 = v14;
  id v9 = +[NSBlockOperation blockOperationWithBlock:&v10];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v9, v10, v11, v12, v13);
}

- (void)requestReadDataFromObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"ICReadBufferStreamOpen"];
  if (v11)
  {
  }
  else
  {
    unsigned int v12 = [v9 objectForKeyedSubscript:@"ICReadBufferStreamClose"];

    if (!v12)
    {
      id v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      id v17 = sub_10000C54C;
      id v18 = &unk_10004C930;
      id v19 = self;
      id v20 = v8;
      id v21 = v9;
      id v22 = v10;
      id v14 = +[NSBlockOperation blockOperationWithBlock:&v15];
      -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v14, v15, v16, v17, v18, v19);

      goto LABEL_5;
    }
  }
  uint64_t v13 = +[NSMutableDictionary dictionary];
  [v13 addEntriesFromDictionary:v9];
  [v13 setObject:&off_100054870 forKeyedSubscript:@"errCode"];
  (*((void (**)(id, void *))v10 + 2))(v10, v13);

LABEL_5:
}

- (void)requestDeleteObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[NSXPCConnection currentConnection];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C948;
  v16[3] = &unk_10004C980;
  v16[4] = self;
  id v17 = v8;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v10;
  id v18 = v9;
  id v11 = v19;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = +[NSBlockOperation blockOperationWithBlock:v16];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v15];
}

- (void)requestFingerprintForObjectHandle:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000CCC0;
  v9[3] = &unk_10004C8E0;
  v9[4] = self;
  id v10 = a3;
  id v11 = a4;
  id v6 = v11;
  id v7 = v10;
  id v8 = +[NSBlockOperation blockOperationWithBlock:v9];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v8];
}

- (void)sendPTPCommand:(id)a3 andPayload:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSXPCConnection currentConnection];
  id v12 = v11;
  long long v25 = 0u;
  long long v26 = 0u;
  if (v11) {
    [v11 auditToken];
  }
  long long v23 = v25;
  long long v24 = v26;
  if (TCCAccessCheckAuditToken())
  {
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_10000CF90;
    id v18 = &unk_10004C930;
    id v19 = self;
    id v20 = v8;
    id v21 = v9;
    id v22 = v10;
    id v13 = +[NSBlockOperation blockOperationWithBlock:&v15];
    -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v13, v15, v16, v17, v18, v19);
  }
  else
  {
    id v14 = +[NSMutableDictionary dictionary];
    [v14 setObject:&off_1000548A0 forKeyedSubscript:@"errCode"];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)enumerateContentWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[NSXPCConnection currentConnection];
  [(PTPCameraDevice *)self setPrioritizeSpeed:0];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"ICEnumerationPrioritizeSpeed"];
  if (v6
    && (id v7 = (void *)v6,
        [v4 objectForKeyedSubscript:@"ICEnumerationPrioritizeSpeed"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 BOOLValue],
        v8,
        v7,
        v9))
  {
    __ICOSLogCreate();
    id v10 = @"Enum-Priority";
    if ((unint64_t)[@"Enum-Priority" length] >= 0x15)
    {
      id v11 = [@"Enum-Priority" substringWithRange:0, 18];
      id v10 = [v11 stringByAppendingString:@".."];
    }
    id v12 = +[NSString stringWithFormat:@">>> Set Prioritize Speed"];
    id v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v10;
      id v15 = v13;
      *(_DWORD *)buf = 136446466;
      id v29 = [(__CFString *)v14 UTF8String];
      __int16 v30 = 2114;
      v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(PTPCameraDevice *)self setPrioritizeSpeed:1];
  }
  else
  {
    __ICOSLogCreate();
    uint64_t v16 = @"Enum-Priority";
    if ((unint64_t)[@"Enum-Priority" length] >= 0x15)
    {
      id v17 = [@"Enum-Priority" substringWithRange:0, 18];
      uint64_t v16 = [v17 stringByAppendingString:@".."];
    }
    id v18 = +[NSString stringWithFormat:@">>> Set Prioritize Fidelity"];
    id v19 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v16;
      id v21 = v19;
      *(_DWORD *)buf = 136446466;
      id v29 = [(__CFString *)v20 UTF8String];
      __int16 v30 = 2114;
      v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000D354;
  v25[3] = &unk_10004C908;
  v25[4] = self;
  id v26 = v4;
  id v27 = v5;
  id v22 = v5;
  id v23 = v4;
  long long v24 = +[NSBlockOperation blockOperationWithBlock:v25];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v24];
}

- (id)additionalProperties
{
  CFStringRef v6 = @"ICDeviceAccessRestrictedAppleDevice";
  v2 = [(PTPCameraDevice *)self initiator];
  v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 isAccessRestrictedAppleDevice]);
  id v7 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return v4;
}

- (BOOL)eject
{
  return 1;
}

- (id)itemForObjectHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(PTPCameraDevice *)self initiator];
  id v6 = [v4 unsignedIntegerValue];

  id v7 = [v5 cameraItemWithObjectID:v6];

  return v7;
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = qword_100063480;
  id v8 = (NSString *)a4;
  id v11 = a3;
  if (v7 != -1) {
    dispatch_once(&qword_100063480, &stru_10004C9C0);
  }
  uint64_t v9 = qword_100063478;
  SEL v10 = NSSelectorFromString(v8);

  [v11 setClasses:v9 forSelector:v10 argumentIndex:0 ofReply:v5];
}

- (BOOL)acceptConnection:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PTPCameraDevice;
  if (![(ICRemoteCameraDevice *)&v15 acceptConnection:v4])
  {
    v14.receiver = self;
    v14.super_class = (Class)PTPCameraDevice;
    if (![(ICRemoteCameraDevice *)&v14 evaulateCommonTCC:v4])
    {
      BOOL v12 = 0;
      goto LABEL_10;
    }
    __ICOSLogCreate();
    BOOL v5 = @"TCC Access";
    if ((unint64_t)[@"TCC Access" length] >= 0x15)
    {
      id v6 = [@"TCC Access" substringWithRange:0, 18];
      BOOL v5 = [v6 stringByAppendingString:@".."];
    }
    uint64_t v7 = +[NSString stringWithFormat:@"Access has been granted"];
    id v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v5;
      SEL v10 = v8;
      id v11 = [(__CFString *)v9 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v17 = v11;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (void)closeDevice
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(ICRemoteCameraDevice *)self deviceOperationQueue];
  [v4 cancelAllOperations];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000DF58;
  v21[3] = &unk_10004C9E8;
  v21[4] = self;
  BOOL v5 = v3;
  id v22 = v5;
  id v6 = +[NSBlockOperation blockOperationWithBlock:v21];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v6];

  intptr_t v7 = dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  __ICOSLogCreate();
  id v8 = [@"closeDevice" length];
  if (v7)
  {
    if ((unint64_t)v8 >= 0x15)
    {
      uint64_t v9 = [[@"closeDevice" substringWithRange:0, 18];
      id v11 = [v9 stringByAppendingString:@".."];
    }
    else
    {
      id v11 = @"closeDevice";
    }
    BOOL v12 = [(ICRemoteCameraDevice *)self cameraDictionary];
    id v13 = [v12 objectForKeyedSubscript:@"ICDeviceName"];
    objc_super v14 = +[NSString stringWithFormat:@">>> Close Timed Out: %@", v13];

    objc_super v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033D60(v11, v15, (uint64_t)v14);
    }
  }
  else
  {
    if ((unint64_t)v8 >= 0x15)
    {
      SEL v10 = [@"closeDevice" substringWithRange:0, 18];
      id v11 = [v10 stringByAppendingString:@".."];
    }
    else
    {
      id v11 = @"closeDevice";
    }
    uint64_t v16 = [(ICRemoteCameraDevice *)self cameraDictionary];
    id v17 = [v16 objectForKeyedSubscript:@"ICDeviceName"];
    objc_super v14 = +[NSString stringWithFormat:@">>> Device Closed: %@", v17];

    __int16 v18 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v11;
      id v19 = v18;
      id v20 = [(__CFString *)v11 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v24 = v20;
      __int16 v25 = 2114;
      id v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

- (PTPInitiator)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (unint64_t)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unint64_t)a3
{
  self->_locationID = a3;
}

- (NSMutableArray)controlBundles
{
  return self->_controlBundles;
}

- (void)setControlBundles:(id)a3
{
}

- (BOOL)prioritizeSpeed
{
  return self->_prioritizeSpeed;
}

- (void)setPrioritizeSpeed:(BOOL)a3
{
  self->_prioritizeSpeed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlBundles, 0);

  objc_storeStrong((id *)&self->_initiator, 0);
}

@end