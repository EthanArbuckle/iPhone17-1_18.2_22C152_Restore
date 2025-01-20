@interface SDAirDropClassroomTransferManager
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (SDAirDropAlertManagerProtocol)alertManager;
- (SDAirDropClassroomTransferManager)init;
- (id)exportedInterface;
- (id)machServiceName;
- (id)makeDestinationDirectoryWithIdentifier:(id)a3 error:(id *)a4;
- (id)remoteObjectInterface;
- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)activate;
- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6;
- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)invalidate;
- (void)replaceIconValue:(id)a3 forKey:(id)a4;
- (void)setAlertManager:(id)a3;
- (void)updateTransferWithIdentifier:(id)a3 withState:(int64_t)a4 information:(id)a5 completionHandler:(id)a6;
@end

@implementation SDAirDropClassroomTransferManager

- (SDAirDropClassroomTransferManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDAirDropClassroomTransferManager;
  v2 = [(SDXPCDaemon *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    transferIDToProgress = v2->_transferIDToProgress;
    v2->_transferIDToProgress = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)SDAirDropClassroomTransferManager;
  [(SDXPCDaemon *)&v2 _activate];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SDAirDropClassroomTransferManager;
  [(SDXPCDaemon *)&v2 _invalidate];
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
}

- (id)makeDestinationDirectoryWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_super v6 = sub_1001B2E7C();
  if (v6)
  {
    v7 = v6;
    v8 = [v6 URLByAppendingPathComponent:@"com.apple.AirDrop" isDirectory:1];

    v9 = [v8 URLByAppendingPathComponent:v5 isDirectory:1];

    v10 = [v9 URLByAppendingPathComponent:@"Files" isDirectory:1];

    NSFileAttributeKey v31 = NSFileProtectionKey;
    NSFileProtectionType v32 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    v11 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v12 = +[NSFileManager defaultManager];
    unsigned __int8 v13 = [v12 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v11 error:a4];

    if ((v13 & 1) == 0)
    {
      v14 = airdrop_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10023340C((uint64_t)a4, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    v21 = v10;

    v22 = v21;
  }
  else
  {
    if (a4)
    {
      id v23 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6709 userInfo:0];
      *a4 = v23;
    }
    v21 = airdrop_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10023339C((uint64_t)a4, v21, v24, v25, v26, v27, v28, v29);
    }
    v22 = 0;
  }

  return v22;
}

- (void)replaceIconValue:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFDataRef v7 = [v5 objectForKeyedSubscript:v6];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGImageRef v8 = sub_1000D8C3C(v7);
      if (v8)
      {
        CGImageRef v9 = v8;
        [v5 setObject:v8 forKeyedSubscript:v6];
        CFRelease(v9);
        goto LABEL_10;
      }
      v10 = airdrop_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10023347C(v10);
      }
    }
    else
    {
      v10 = airdrop_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1002334C0(v10);
      }
    }
  }
LABEL_10:
}

- (void)updateTransferWithIdentifier:(id)a3 withState:(int64_t)a4 information:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v42 = a5;
  v41 = (void (**)(id, uint64_t, void *, id))a6;
  v11 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v11);

  v12 = airdrop_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v10;
    __int16 v54 = 1024;
    int v55 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Update transfer %@ with state %d", buf, 0x12u);
  }

  id v13 = [v42 mutableCopy];
  [v13 setObject:&__kCFBooleanFalse forKeyedSubscript:kSFOperationSenderIsMeKey];
  [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kSFOperationVerifiableIdentityKey];
  [(SDAirDropClassroomTransferManager *)self replaceIconValue:v13 forKey:kSFOperationSmallFileIconKey];
  [(SDAirDropClassroomTransferManager *)self replaceIconValue:v13 forKey:kSFOperationFileIconKey];
  [(SDAirDropClassroomTransferManager *)self replaceIconValue:v13 forKey:kSFOperationSenderIconKey];
  [(SDAirDropClassroomTransferManager *)self replaceIconValue:v13 forKey:kSFOperationReceiverIconKey];
  v14 = [(NSMutableDictionary *)self->_transferIDToProgress objectForKeyedSubscript:v10];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  switch(a4)
  {
    case 1:
      id v50 = 0;
      uint64_t v15 = [(SDAirDropClassroomTransferManager *)self makeDestinationDirectoryWithIdentifier:v10 error:&v50];
      id v16 = v50;
      [v13 setObject:v15 forKeyedSubscript:kSFOperationReceiverClassroomDestination];
      id v17 = objc_alloc((Class)NSProgress);
      uint64_t v18 = [v15 URLByDeletingLastPathComponent];
      uint64_t v19 = [v17 sf_initWithFileURL:v18];

      [(NSMutableDictionary *)self->_transferIDToProgress setObject:v19 forKeyedSubscript:v10];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100232BAC;
      v47[3] = &unk_1008D1DC0;
      objc_copyWeak(&v49, (id *)buf);
      v47[4] = self;
      id v20 = v10;
      id v48 = v20;
      [v19 setCancellationHandler:v47];
      [v19 _publish];
      [v19 setSf_transferState:3];
      v21 = [v13 objectForKeyedSubscript:kSFOperationTotalBytesKey];
      [v19 setTotalUnitCount:[v21 longLongValue]];

      [v19 setCompletedUnitCount:0];
      v22 = [(SDAirDropClassroomTransferManager *)self alertManager];
      [v22 askEventForRecordID:v20 withResults:v13];

      objc_destroyWeak(&v49);
      if (!v16) {
        goto LABEL_15;
      }
      goto LABEL_5;
    case 2:
      NSFileAttributeKey v31 = [v13 objectForKeyedSubscript:kSFOperationTotalBytesKey];
      [v14 setTotalUnitCount:[v31 longLongValue]];

      NSFileProtectionType v32 = [v13 objectForKeyedSubscript:kSFOperationBytesCopiedKey];
      [v14 setCompletedUnitCount:[v32 longLongValue]];

      v33 = [v13 objectForKeyedSubscript:kSFOperationTimeRemainingKey];
      [v14 setUserInfoObject:v33 forKey:NSProgressEstimatedTimeRemainingKey];

      v34 = [(SDAirDropClassroomTransferManager *)self alertManager];
      [v34 progressEventForRecordID:v10 withResults:v13];

      goto LABEL_13;
    case 3:
      [v14 setSf_transferState:4];
      v35 = [(SDAirDropClassroomTransferManager *)self alertManager];
      [v35 cancelEventForRecordID:v10 withResults:v13];
      goto LABEL_12;
    case 4:
      v36 = [v13 objectForKeyedSubscript:kSFOperationErrorKey];
      v37 = [v36 localizedDescription];
      [v14 sf_failedWithError:v37];

      v35 = [(SDAirDropClassroomTransferManager *)self alertManager];
      [v35 errorEventForRecordID:v10 withResults:v13];
      goto LABEL_12;
    case 5:
      [v14 setSf_transferState:6];
      v35 = [(SDAirDropClassroomTransferManager *)self alertManager];
      [v35 finishedEventForRecordID:v10 withResults:v13];
LABEL_12:

      id location = 0;
      objc_initWeak(&location, v14);
      dispatch_time_t v38 = sub_1001B1AF8(2.0);
      v39 = SFMainQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100232C0C;
      block[3] = &unk_1008D1DC0;
      objc_copyWeak(&v45, &location);
      block[4] = self;
      id v44 = v10;
      dispatch_after(v38, v39, block);

      objc_destroyWeak(&v45);
      objc_destroyWeak(&location);
LABEL_13:
      uint64_t v15 = 0;
      id v16 = 0;
      uint64_t v30 = 1;
      break;
    default:
      NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
      CFStringRef v52 = @"invalid state value";
      v40 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      id v16 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v40];

      uint64_t v15 = 0;
      uint64_t v19 = v14;
      if (v16)
      {
LABEL_5:
        id v23 = airdrop_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100233504((uint64_t)v16, v23, v24, v25, v26, v27, v28, v29);
        }

        uint64_t v30 = 0;
      }
      else
      {
LABEL_15:
        uint64_t v30 = 1;
      }
      v14 = v19;
      break;
  }
  v41[2](v41, v30, v15, v16);

  objc_destroyWeak((id *)buf);
}

- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6
{
  id v7 = a4;
  CGImageRef v8 = airdrop_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CGImageRef v9 = [(SDXPCDaemon *)self activeConnections];
    *(_DWORD *)buf = 67109378;
    unsigned int v14 = [v9 count];
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notifying %d clients that transfer %@ was accepted", buf, 0x12u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100232DA4;
  v11[3] = &unk_1008D1DE8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(SDAirDropClassroomTransferManager *)self _enumerateRemoteObjectProxiesUsingBlock:v11];
}

- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5
{
  id v7 = a4;
  CGImageRef v8 = airdrop_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CGImageRef v9 = [(SDXPCDaemon *)self activeConnections];
    *(_DWORD *)buf = 67109378;
    unsigned int v15 = [v9 count];
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notifying %d clients that transfer %@ was declined", buf, 0x12u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100232F60;
  v11[3] = &unk_1008D1E10;
  v11[4] = self;
  id v12 = v7;
  unint64_t v13 = a5;
  id v10 = v7;
  [(SDAirDropClassroomTransferManager *)self _enumerateRemoteObjectProxiesUsingBlock:v11];
}

- (id)machServiceName
{
  return @"com.apple.sharing.classroom-transfer";
}

- (id)exportedInterface
{
  objc_super v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SDAirDropClassroomTransferManagerProtocol];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  uint64_t v3 = +[NSArray arrayWithObjects:v6 count:6];
  v4 = +[NSSet setWithArray:v3];
  [v2 setClasses:v4 forSelector:"updateTransferWithIdentifier:withState:information:completionHandler:" argumentIndex:2 ofReply:0];

  return v2;
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFAirDropClassroomTransferManagerProtocol];
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v4 = a3;
  id v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 sd_description];
    int v8 = 138412290;
    CGImageRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connection established %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(SDAirDropClassroomTransferManager *)self alertManager];
  [v7 setClassroomDelegate:self];
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = a3;
  id v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 sd_description];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connection invalidated %@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(SDXPCDaemon *)self activeConnections];
  id v8 = [v7 count];

  if (!v8)
  {
    CGImageRef v9 = [(SDAirDropClassroomTransferManager *)self alertManager];
    [v9 setClassroomDelegate:0];
  }
}

- (SDAirDropAlertManagerProtocol)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertManager, 0);

  objc_storeStrong((id *)&self->_transferIDToProgress, 0);
}

@end