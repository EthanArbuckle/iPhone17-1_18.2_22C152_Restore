@interface NBRemoteObjectClassC
- (NBRemoteObjectClassC)initWithDelegate:(id)a3 andQueue:(id)a4;
- (id)activelyPairingDevice;
- (id)backupFromProtobuf:(id)a3;
- (id)bytesFromClass:(id)a3;
- (id)class:(Class)a3 fromBytes:(id)a4;
- (id)dataFromUUID:(id)a3;
- (id)protobufFromBackup:(id)a3;
- (id)readWatchFaceFromFile:(id)a3;
- (id)sha256FromData:(id)a3;
- (id)uuidFromData:(id)a3;
- (id)writeWatchFaceToFile:(id)a3;
- (void)idsHandleBackupListRequest:(id)a3;
- (void)idsHandleDeleteBackupRequest:(id)a3;
- (void)idsHandlePayloadRestoreRequest:(id)a3 context:(id)a4;
- (void)idsHandleRestoreRequest:(id)a3;
- (void)registerProtobufHandlers;
- (void)sendBackupListRequestWithResponseBlock:(id)a3;
- (void)sendBackupListResponse:(id)a3 error:(id)a4 withRequestIdentifier:(id)a5 withSentBlock:(id)a6;
- (void)sendBackupPayload:(id)a3 withResponseBlock:(id)a4;
- (void)sendCreateBackupRequestWithResponseBlock:(id)a3;
- (void)sendCreateBackupResponse:(id)a3 withRequestIdentifier:(id)a4 error:(id)a5 withSentBlock:(id)a6;
- (void)sendDeleteBackupRequest:(id)a3 withResponseBlock:(id)a4;
- (void)sendDeleteBackupResponse:(id)a3 withRequestIdentifier:(id)a4 withSentBlock:(id)a5;
- (void)sendRestoreRequest:(id)a3 withResponseBlock:(id)a4;
- (void)sendRestoreResponse:(id)a3 withRequestIdentifier:(id)a4 withSentBlock:(id)a5;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation NBRemoteObjectClassC

- (NBRemoteObjectClassC)initWithDelegate:(id)a3 andQueue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NBRemoteObjectClassC;
  return [(NBRemoteObject *)&v5 initWithServiceName:@"com.apple.private.alloy.nanobackup" andDelegate:a3 andClientQueue:a4];
}

- (void)registerProtobufHandlers
{
  [(NBRemoteObject *)self setProtobufAction:"idsHandleBackupListRequest:" forIncomingRequestsOfType:0];
  [(NBRemoteObject *)self setProtobufAction:"idsHandleRestoreRequest:" forIncomingRequestsOfType:2];
  [(NBRemoteObject *)self setProtobufAction:"idsHandlePayloadRestoreRequest:context:" forIncomingRequestsOfType:8];
  [(NBRemoteObject *)self setProtobufAction:"idsHandleDeleteBackupRequest:" forIncomingRequestsOfType:6];
  [(NBRemoteObject *)self setProtobufAction:0 forIncomingResponsesOfType:1];
  [(NBRemoteObject *)self setProtobufAction:0 forIncomingResponsesOfType:3];

  [(NBRemoteObject *)self setProtobufAction:0 forIncomingResponsesOfType:7];
}

- (void)idsHandleBackupListRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NBRemoteObject *)self delegate];
  v6 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "idsHandleBackupListRequest called", buf, 2u);
  }
  v7 = [(NBRemoteObject *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D920;
  block[3] = &unk_10002CE40;
  id v11 = v5;
  v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

- (void)idsHandleRestoreRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NBRemoteObject *)self delegate];
  v6 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "idsHandleRestoreRequest called", buf, 2u);
  }
  v7 = [NBPBRestoreRequest alloc];
  id v8 = [v4 data];
  id v9 = [(NBPBRestoreRequest *)v7 initWithData:v8];

  v10 = [(NBRemoteObject *)self clientQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000DAA0;
  v14[3] = &unk_10002CE68;
  id v15 = v5;
  v16 = self;
  v17 = v9;
  id v18 = v4;
  id v11 = v4;
  v12 = v9;
  id v13 = v5;
  dispatch_async(v10, v14);
}

- (void)idsHandlePayloadRestoreRequest:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NBRemoteObject *)self delegate];
  id v9 = [(NBRemoteObject *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DC1C;
  block[3] = &unk_10002CE40;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, block);
}

- (void)idsHandleDeleteBackupRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NBRemoteObject *)self delegate];
  id v6 = [NBPBDeleteBackupRequest alloc];
  id v7 = [v4 data];
  id v8 = [(NBPBDeleteBackupRequest *)v6 initWithData:v7];

  id v9 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsHandleDeleteBackupRequest called", buf, 2u);
  }
  id v10 = [(NBRemoteObject *)self clientQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000DDE8;
  v14[3] = &unk_10002CE68;
  id v15 = v5;
  id v16 = self;
  v17 = v8;
  id v18 = v4;
  id v11 = v4;
  id v12 = v8;
  id v13 = v5;
  dispatch_async(v10, v14);
}

- (id)uuidFromData:(id)a3
{
  v5[0] = 0;
  v5[1] = 0;
  [a3 getBytes:v5 length:16];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v5];

  return v3;
}

- (id)dataFromUUID:(id)a3
{
  v5[0] = 0;
  v5[1] = 0;
  [a3 getUUIDBytes:v5];
  id v3 = +[NSData dataWithBytes:v5 length:16];

  return v3;
}

- (id)sha256FromData:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bytes];
  CC_LONG v5 = [v3 length];

  CC_SHA256(v4, v5, md);
  id v6 = +[NSData dataWithBytes:md length:32];

  return v6;
}

- (id)writeWatchFaceToFile:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    CC_LONG v5 = NSTemporaryDirectory();
    id v6 = [v5 stringByAppendingPathComponent:@"NanoBackup"];
    id v7 = [v5 stringByAppendingPathComponent:@"WatchFaceImages"];
    id v8 = +[NSFileManager defaultManager];
    id v17 = 0;
    [v8 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v9 = v17;

    if (v9)
    {
      id v10 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[NBRemoteObjectClassC writeWatchFaceToFile:]";
        __int16 v20 = 2114;
        v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to create directory %{public}@", buf, 0x16u);
      }
      id v11 = 0;
    }
    else
    {
      id v13 = [(NBRemoteObjectClassC *)self sha256FromData:v4];
      id v14 = [v13 base64EncodedStringWithOptions:0];
      id v15 = [v5 stringByAppendingPathComponent:v14];
      [v4 writeToFile:v5 atomically:1];
      id v11 = +[NSURL fileURLWithPath:v5];
    }
  }
  else
  {
    id v12 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[NBRemoteObjectClassC writeWatchFaceToFile:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: No face image", buf, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)readWatchFaceFromFile:(id)a3
{
  return +[NSData dataWithContentsOfURL:a3];
}

- (id)bytesFromClass:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v12 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v12];
    id v5 = v12;
    if (v5)
    {
      id v6 = (void *)nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v6;
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543618;
        id v14 = v5;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got error (%{public}@) archiving (%@)", buf, 0x16u);
      }
    }
    id v10 = v4;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)class:(Class)a3 fromBytes:(id)a4
{
  id v5 = a4;
  id v15 = 0;
  id v6 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:&v15];
  id v7 = v15;
  id v8 = +[NSSet setWithObject:a3];
  id v9 = [v6 decodeObjectOfClasses:v8 forKey:NSKeyedArchiveRootObjectKey];

  [v6 finishDecoding];
  if (v7)
  {
    id v10 = (void *)nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      id v12 = NSStringFromClass(a3);
      *(_DWORD *)buf = 138543618;
      id v17 = v12;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to unarchive data of type %{public}@ with error %{public}@", buf, 0x16u);
    }
  }
  id v13 = v9;

  return v13;
}

- (id)backupFromProtobuf:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NBBackup);
  id v6 = [v4 uuid];
  id v7 = [(NBRemoteObjectClassC *)self uuidFromData:v6];
  [v5 setUuid:v7];

  objc_msgSend(v5, "setBackupType:", (int)objc_msgSend(v4, "backupType"));
  id v8 = [v4 name];
  [v5 setName:v8];

  id v9 = [v4 productType];
  [v5 setProductType:v9];

  id v10 = [v4 productName];
  [v5 setProductName:v10];

  id v11 = [v4 systemVersion];
  [v5 setSystemVersion:v11];

  id v12 = [v4 systemBuildVersion];
  [v5 setSystemBuildVersion:v12];

  id v13 = [v4 marketingVersion];
  [v5 setMarketingVersion:v13];

  id v14 = [v4 deviceColor];
  [v5 setDeviceColor:v14];

  id v15 = [v4 deviceEnclosureColor];
  [v5 setDeviceEnclosureColor:v15];

  id v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 bottomEnclosureMaterial]);
  [v5 setBottomEnclosureMaterial:v16];

  id v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 topEnclosureMaterial]);
  [v5 setTopEnclosureMaterial:v17];

  __int16 v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 fcmMaterial]);
  [v5 setFcmMaterial:v18];

  id v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 bcmWindowMaterial]);
  [v5 setBcmWindowMaterial:v19];

  __int16 v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 coverGlassColor]);
  [v5 setCoverGlassColor:v20];

  v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 housingColor]);
  [v5 setHousingColor:v21];

  v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 backingColor]);
  [v5 setBackingColor:v22];

  v23 = [v4 watchFace];
  [v5 setWatchFace:v23];

  v24 = [v4 watchFaceColor];
  [v5 setWatchFaceColor:v24];

  objc_msgSend(v5, "setLocationOptInEnabled:", objc_msgSend(v4, "locationOptInEnabled"));
  objc_msgSend(v5, "setDiagnosticsOptInEnabled:", objc_msgSend(v4, "diagnosticsOptInEnabled"));
  [v4 lastModificationDate];
  v25 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [v5 setLastModificationDate:v25];

  v26 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 sizeInBytes]);
  [v5 setSizeInBytes:v26];

  v27 = [v4 activeWatchFaceFileContents];
  v28 = [(NBRemoteObjectClassC *)self writeWatchFaceToFile:v27];
  [v5 setActiveWatchFaceFileURL:v28];

  v29 = [v4 deviceCSN];
  [v5 setDeviceCSN:v29];

  v30 = [v4 watchFaceData];

  [v5 setWatchFaceData:v30];

  return v5;
}

- (id)protobufFromBackup:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [v4 uuid];
  id v7 = [(NBRemoteObjectClassC *)self dataFromUUID:v6];
  [v5 setUuid:v7];

  objc_msgSend(v5, "setBackupType:", objc_msgSend(v4, "backupType"));
  id v8 = [v4 name];
  [v5 setName:v8];

  id v9 = [v4 productType];
  [v5 setProductType:v9];

  id v10 = [v4 productName];
  [v5 setProductName:v10];

  id v11 = [v4 systemVersion];
  [v5 setSystemVersion:v11];

  id v12 = [v4 systemBuildVersion];
  [v5 setSystemBuildVersion:v12];

  id v13 = [v4 marketingVersion];
  [v5 setMarketingVersion:v13];

  id v14 = [v4 deviceColor];
  [v5 setDeviceColor:v14];

  id v15 = [v4 deviceEnclosureColor];
  [v5 setDeviceEnclosureColor:v15];

  id v16 = [v4 bottomEnclosureMaterial];
  objc_msgSend(v5, "setBottomEnclosureMaterial:", objc_msgSend(v16, "integerValue"));

  id v17 = [v4 topEnclosureMaterial];
  objc_msgSend(v5, "setTopEnclosureMaterial:", objc_msgSend(v17, "integerValue"));

  __int16 v18 = [v4 fcmMaterial];
  objc_msgSend(v5, "setFcmMaterial:", objc_msgSend(v18, "integerValue"));

  id v19 = [v4 bcmWindowMaterial];
  objc_msgSend(v5, "setBcmWindowMaterial:", objc_msgSend(v19, "integerValue"));

  __int16 v20 = [v4 coverGlassColor];
  objc_msgSend(v5, "setCoverGlassColor:", objc_msgSend(v20, "integerValue"));

  v21 = [v4 housingColor];
  objc_msgSend(v5, "setHousingColor:", objc_msgSend(v21, "integerValue"));

  v22 = [v4 backingColor];
  objc_msgSend(v5, "setBackingColor:", objc_msgSend(v22, "integerValue"));

  v23 = [v4 watchFace];
  [v5 setWatchFace:v23];

  v24 = [v4 watchFaceColor];
  [v5 setWatchFaceColor:v24];

  objc_msgSend(v5, "setLocationOptInEnabled:", objc_msgSend(v4, "isLocationOptInEnabled"));
  objc_msgSend(v5, "setDiagnosticsOptInEnabled:", objc_msgSend(v4, "isDiagnosticsOptInEnabled"));
  v25 = [v4 lastModificationDate];
  [v25 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "setLastModificationDate:");

  v26 = [v4 sizeInBytes];
  objc_msgSend(v5, "setSizeInBytes:", objc_msgSend(v26, "longLongValue"));

  v27 = [v4 activeWatchFaceFileURL];
  v28 = [(NBRemoteObjectClassC *)self readWatchFaceFromFile:v27];
  [v5 setActiveWatchFaceFileContents:v28];

  v29 = [v4 deviceCSN];
  [v5 setDeviceCSN:v29];

  v30 = [v4 watchFaceData];

  [v5 setWatchFaceData:v30];

  return v5;
}

- (void)sendBackupListRequestWithResponseBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F020;
  v9[3] = &unk_10002C988;
  id v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F108;
  v7[3] = &unk_10002CE90;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(NBRemoteObject *)self sendRequest:v5 type:0 withTimeout:&off_10002E850 withResponseTimeout:&off_10002E850 withDescription:@"NanoBackup Backup Metadata Request" onlyOneFor:0 didSend:v9 andResponse:v7];
}

- (void)sendBackupListResponse:(id)a3 error:(id)a4 withRequestIdentifier:(id)a5 withSentBlock:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = [(NBRemoteObjectClassC *)self protobufFromBackup:*(void *)(*((void *)&v22 + 1) + 8 * (void)v17)];
        [v12 addBackups:v18];

        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000F544;
  v20[3] = &unk_10002C988;
  id v21 = v11;
  id v19 = v11;
  [(NBRemoteObject *)self sendResponse:v12 type:1 withRequest:v10 withTimeout:&off_10002E850 withDescription:@"NanoBackup Backup Metadata Response" onlyOneFor:0 didSend:v20];
}

- (void)sendRestoreRequest:(id)a3 withResponseBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [(NBRemoteObjectClassC *)self dataFromUUID:v7];

  [v8 setBackupID:v9];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000F790;
  v13[3] = &unk_10002C988;
  id v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F874;
  v11[3] = &unk_10002CE90;
  v11[4] = self;
  id v12 = v14;
  id v10 = v14;
  [(NBRemoteObject *)self sendRequest:v8 type:2 withTimeout:&off_10002E868 withResponseTimeout:&off_10002E868 withDescription:@"NanoBackup Restore Request" onlyOneFor:0 didSend:v13 andResponse:v11];
}

- (id)activelyPairingDevice
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:&stru_10002CED0];

  if ((unint64_t)[v3 count] <= 1)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)sendBackupPayload:(id)a3 withResponseBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NBRemoteObject *)self service];
  id v9 = objc_msgSend(v8, "nb_defaultPairedDeviceIDIncludingTinkerDevices");

  if (v9)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000FD8C;
    v22[3] = &unk_10002C988;
    id v23 = v7;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000FE70;
    v20[3] = &unk_10002CE90;
    void v20[4] = self;
    id v21 = v23;
    [(NBRemoteObject *)self sendFileRequest:v6 type:8 withTimeout:&off_10002E868 withResponseTimeout:&off_10002E868 withDescription:@"NanoBackup Restore Request From Payload" onlyOneFor:0 didSend:v22 andResponse:v20];

    id v10 = v23;
  }
  else
  {
    id v11 = [(NBRemoteObject *)self delayedRestoreMessages];

    if (!v11)
    {
      id v12 = objc_opt_new();
      [(NBRemoteObject *)self setDelayedRestoreMessages:v12];
    }
    id v10 = [(NBRemoteObjectClassC *)self activelyPairingDevice];
    if (v10)
    {
      id v13 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Device is: %@", buf, 0xCu);
      }
      id v14 = objc_opt_new();
      [v14 setValue:v6 forKey:@"NBMessagePathKey"];
      id v15 = objc_retainBlock(v7);
      [v14 setValue:v15 forKey:@"NBMessageBlockKey"];

      uint64_t v16 = [(NBRemoteObject *)self delayedRestoreMessages];
      id v17 = [v10 valueForProperty:NRDevicePropertyPairingID];
      [v16 setValue:v14 forKey:v17];

      __int16 v18 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not sending backup payload, no default paired device", buf, 2u);
      }
    }
    else
    {
      id v19 = NBError();
      (*((void (**)(id, void *))v7 + 2))(v7, v19);
    }
  }
}

- (void)sendRestoreResponse:(id)a3 withRequestIdentifier:(id)a4 withSentBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  id v12 = [(NBRemoteObjectClassC *)self bytesFromClass:v10];

  [v11 setError:v12];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010094;
  v14[3] = &unk_10002C988;
  id v15 = v8;
  id v13 = v8;
  [(NBRemoteObject *)self sendResponse:v11 type:3 requestUUID:v9 withTimeout:&off_10002E868 withDescription:@"NanoBackup Restore Response" onlyOneFor:0 didSend:v14];
}

- (void)sendCreateBackupRequestWithResponseBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000102A8;
  v9[3] = &unk_10002C988;
  id v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010390;
  v7[3] = &unk_10002CE90;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(NBRemoteObject *)self sendRequest:v5 type:4 withTimeout:&off_10002E868 withResponseTimeout:&off_10002E868 withDescription:@"NanoBackup Create Backup Request" onlyOneFor:0 didSend:v9 andResponse:v7];
}

- (void)sendCreateBackupResponse:(id)a3 withRequestIdentifier:(id)a4 error:(id)a5 withSentBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_opt_new();
  id v15 = [(NBRemoteObjectClassC *)self protobufFromBackup:v13];

  [v14 setBackup:v15];
  uint64_t v16 = [(NBRemoteObjectClassC *)self bytesFromClass:v11];

  [v14 setError:v16];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100010650;
  v18[3] = &unk_10002C988;
  id v19 = v10;
  id v17 = v10;
  [(NBRemoteObject *)self sendResponse:v14 type:5 withRequest:v12 withTimeout:&off_10002E868 withDescription:@"NanoBackup Create Backup Response" onlyOneFor:0 didSend:v18];
}

- (void)sendDeleteBackupRequest:(id)a3 withResponseBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [(NBRemoteObjectClassC *)self dataFromUUID:v7];

  [v8 setBackupID:v9];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001089C;
  v13[3] = &unk_10002C988;
  id v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100010980;
  v11[3] = &unk_10002CE90;
  v11[4] = self;
  id v12 = v14;
  id v10 = v14;
  [(NBRemoteObject *)self sendRequest:v8 type:6 withTimeout:&off_10002E868 withResponseTimeout:&off_10002E868 withDescription:@"NanoBackup Delete Backup Request" onlyOneFor:0 didSend:v13 andResponse:v11];
}

- (void)sendDeleteBackupResponse:(id)a3 withRequestIdentifier:(id)a4 withSentBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  id v12 = [(NBRemoteObjectClassC *)self bytesFromClass:v10];

  [v11 setError:v12];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010BF8;
  v14[3] = &unk_10002C988;
  id v15 = v8;
  id v13 = v8;
  [(NBRemoteObject *)self sendResponse:v11 type:7 withRequest:v9 withTimeout:&off_10002E868 withDescription:@"NanoBackup Delete Backup Response" onlyOneFor:0 didSend:v14];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a3;
  id v6 = [(NBRemoteObjectClassC *)self activelyPairingDevice];
  uint64_t v7 = [(NBRemoteObject *)self delayedRestoreMessages];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = objc_msgSend(v5, "nb_defaultPairedDeviceIDIncludingTinkerDevices");

    if (v9)
    {
      id v10 = [v6 valueForProperty:NRDevicePropertyPairingID];
      if (v10)
      {
        id v11 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found delayed message with the same pairing id as watch being paired, sending", v14, 2u);
        }
        id v12 = [v10 objectForKey:@"NBMessagePathKey"];
        id v13 = [v10 objectForKey:@"NBMessageBlockKey"];
        [(NBRemoteObjectClassC *)self sendBackupPayload:v12 withResponseBlock:v13];
      }
      [(NBRemoteObject *)self setDelayedRestoreMessages:0];
    }
  }
}

@end