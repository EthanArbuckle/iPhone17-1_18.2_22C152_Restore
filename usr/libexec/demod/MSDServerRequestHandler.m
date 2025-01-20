@interface MSDServerRequestHandler
+ (id)sharedInstance;
- (MSDDemoUnitServer)duServer;
- (MSDDownloadRequestManager)downloadManager;
- (MSDHubServer)hubServer;
- (MSDS3Server)s3Server;
- (MSDServerRequestHandler)init;
- (MSDTargetDevice)device;
- (NSDictionary)dispatchTable;
- (NSString)deviceUDID;
- (NSString)hubHostName;
- (NSString)hubPort;
- (id)getDispatchTable;
- (id)getDownloadFileRequestFromResponse:(id)a3 forFilePath:(id)a4;
- (id)getHmacKey;
- (id)handleRequest:(id)a3 synchronous:(BOOL)a4;
- (id)handleRequestSync:(id)a3;
- (id)updateFileDownloadCredentialFromManifestInfo:(id)a3;
- (void)autoFillCDNRequest:(id)a3;
- (void)autoFillCommandRequest:(id)a3;
- (void)autoFillRequest:(id)a3;
- (void)checkIPAForResponse:(id)a3 withRequest:(id)a4;
- (void)downloadIPAForResponse:(id)a3 withRequest:(id)a4;
- (void)handleAck:(id)a3;
- (void)handleCheckIn:(id)a3;
- (void)handleDownloadFile:(id)a3;
- (void)handleDownloadIPA:(id)a3;
- (void)handleEnroll:(id)a3;
- (void)handleFMH:(id)a3;
- (void)handleGetAccountSettings:(id)a3;
- (void)handleIsEnrolled:(id)a3;
- (void)handleKVStore:(id)a3;
- (void)handleManifestDownload:(id)a3;
- (void)handleMarkNotDemo:(id)a3;
- (void)handlePing:(id)a3;
- (void)handleReportDone:(id)a3;
- (void)handleReportError:(id)a3;
- (void)handleRequestAsync:(id)a3;
- (void)handleS3Upload:(id)a3;
- (void)handleStoreSearch:(id)a3;
- (void)handleUnenroll:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDevice:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setDispatchTable:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setDuServer:(id)a3;
- (void)setHubHostName:(id)a3;
- (void)setHubPort:(id)a3;
- (void)setHubServer:(id)a3;
- (void)setS3Server:(id)a3;
- (void)setupRequest:(id)a3;
- (void)updateHubHostNameAndPort;
@end

@implementation MSDServerRequestHandler

+ (id)sharedInstance
{
  if (qword_100189C98 != -1) {
    dispatch_once(&qword_100189C98, &stru_100153CE8);
  }
  v2 = (void *)qword_100189C90;

  return v2;
}

- (MSDServerRequestHandler)init
{
  v12.receiver = self;
  v12.super_class = (Class)MSDServerRequestHandler;
  v2 = [(MSDServerRequestHandler *)&v12 init];
  if (v2)
  {
    v3 = +[MSDTargetDevice sharedInstance];
    [(MSDServerRequestHandler *)v2 setDevice:v3];

    v4 = [(MSDServerRequestHandler *)v2 device];
    v5 = [v4 udid];
    [(MSDServerRequestHandler *)v2 setDeviceUDID:v5];

    [(MSDServerRequestHandler *)v2 setHubServer:0];
    [(MSDServerRequestHandler *)v2 setDownloadManager:0];
    v6 = objc_alloc_init(MSDDemoUnitServer);
    [(MSDServerRequestHandler *)v2 setDuServer:v6];

    v7 = [(MSDServerRequestHandler *)v2 getDispatchTable];
    [(MSDServerRequestHandler *)v2 setDispatchTable:v7];

    v8 = [(MSDServerRequestHandler *)v2 device];
    [v8 addObserver:v2 forKeyPath:@"hubHostName" options:1 context:0];

    v9 = [(MSDServerRequestHandler *)v2 device];
    [v9 addObserver:v2 forKeyPath:@"hubPort" options:1 context:0];

    [(MSDServerRequestHandler *)v2 updateHubHostNameAndPort];
    v10 = v2;
  }

  return v2;
}

- (void)handleRequestAsync:(id)a3
{
  id v5 = a3;
  [(MSDServerRequestHandler *)self setupRequest:v5];
  id v4 = [(MSDServerRequestHandler *)self handleRequest:v5 synchronous:0];
}

- (id)handleRequestSync:(id)a3
{
  id v4 = a3;
  [(MSDServerRequestHandler *)self setupRequest:v4];
  id v5 = [(MSDServerRequestHandler *)self handleRequest:v4 synchronous:1];

  return v5;
}

- (id)getHmacKey
{
  v2 = +[MSDKeychainManager sharedInstance];
  v3 = [v2 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];

  id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];

  return v4;
}

- (void)autoFillRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MSDServerRequestHandler *)self autoFillCommandRequest:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MSDServerRequestHandler *)self autoFillCDNRequest:v4];
    }
  }
}

- (void)autoFillCommandRequest:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [v14 server];

  if (!v5)
  {
    v6 = [(MSDServerRequestHandler *)v4 hubHostName];
    [v14 setServer:v6];
  }
  v7 = [v14 port];

  if (!v7)
  {
    v8 = [(MSDServerRequestHandler *)v4 hubPort];
    [v14 setPort:v8];
  }
  v9 = [v14 hubVersion];

  if (!v9)
  {
    v10 = [(MSDServerRequestHandler *)v4 device];
    v11 = [v10 hubProtocolVersion];
    [v14 setHubVersion:v11];
  }
  objc_super v12 = [v14 deviceUDID];

  if (!v12)
  {
    v13 = [(MSDServerRequestHandler *)v4 deviceUDID];
    [v14 setDeviceUDID:v13];
  }
  objc_sync_exit(v4);
}

- (void)autoFillCDNRequest:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [v7 downloadCredentials];

  if (!v5)
  {
    v6 = +[MSDFileDownloadCredentials sharedInstance];
    [v7 setDownloadCredentials:v6];
  }
  objc_sync_exit(v4);
}

- (void)setupRequest:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = [(MSDServerRequestHandler *)v4 hubServer];

    if (!v5)
    {
      v6 = [[MSDHubServer alloc] initWithCellularAccess:1];
      [(MSDServerRequestHandler *)v4 setHubServer:v6];

      id v7 = [(MSDServerRequestHandler *)v4 hubServer];
      v8 = [(MSDServerRequestHandler *)v4 getHmacKey];
      [v7 overrideHmacKey:v8];
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = [(MSDServerRequestHandler *)v4 downloadManager];

    if (!v9)
    {
      v10 = [[MSDDownloadRequestManager alloc] initWithCellularAccess:1 andFDCUpdateDelegate:v4];
      [(MSDServerRequestHandler *)v4 setDownloadManager:v10];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [(MSDServerRequestHandler *)v4 s3Server];

    if (!v11)
    {
      objc_super v12 = [[MSDS3Server alloc] initWithCellularAccess:1];
      [(MSDServerRequestHandler *)v4 setS3Server:v12];
    }
  }
  objc_sync_exit(v4);

  [(MSDServerRequestHandler *)v4 autoFillRequest:v13];
}

- (id)handleRequest:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000AA18C;
  v26 = sub_1000AA19C;
  id v27 = 0;
  if (v4)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AA1A4;
    v19[3] = &unk_100153D10;
    v21 = &v22;
    id v7 = dispatch_semaphore_create(0);
    v20 = v7;
    [v6 setCompletion:v19];
  }
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [(MSDServerRequestHandler *)self dispatchTable];
  v11 = [v10 allKeys];
  unsigned int v12 = [v11 containsObject:v9];

  if (v12)
  {
    id v13 = [(MSDServerRequestHandler *)self dispatchTable];
    id v14 = [v13 objectForKey:v9];
    SEL v15 = NSSelectorFromString(v14);

    ((void (*)(MSDServerRequestHandler *, SEL, id))[(MSDServerRequestHandler *)self methodForSelector:v15])(self, v15, v6);
  }
  else
  {
    v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unrecognized request: %{public}@, ignoring...", buf, 0xCu);
    }
  }
  if (v4) {
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v17;
}

- (void)handleIsEnrolled:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self hubServer];
  [v5 isEnrolled:v4];
}

- (void)handleEnroll:(id)a3
{
  id v4 = a3;
  [v4 completion];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_1000AA32C;
  v10 = &unk_100153D38;
  v11 = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v12;
  [v4 setCompletion:&v7];
  id v6 = [(MSDServerRequestHandler *)self hubServer];
  [v6 enroll:v4];
}

- (void)handleUnenroll:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self hubServer];
  [v5 unenroll:v4];
}

- (void)handleDownloadIPA:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000AA8BC;
  v20[3] = &unk_100153D60;
  v20[4] = self;
  id v6 = v4;
  id v21 = v6;
  [v5 setCompletion:v20];
  id v7 = [v6 copy];
  [v7 setSavePath:0];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000AA8CC;
  id v17 = &unk_100153D60;
  v18 = self;
  id v19 = v6;
  id v8 = v6;
  [v7 setCompletion:&v14];
  v9 = [(MSDServerRequestHandler *)self device];
  v10 = [v9 hubProtocolVersion];
  unsigned int v11 = [v10 isEqualToString:@"2"];

  id v12 = [(MSDServerRequestHandler *)self hubServer];
  id v13 = v12;
  if (v11) {
    [v12 downloadIPAPreCachingHub:v5];
  }
  else {
    [v12 downloadIPACachingHub:v7];
  }
}

- (void)handleManifestDownload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 completion];
  id v6 = [v4 savePath];
  id v7 = [(MSDServerRequestHandler *)self device];
  id v8 = [v7 hubProtocolVersion];
  unsigned int v9 = [v8 isEqualToString:@"3"];

  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000AAA20;
    v11[3] = &unk_100153D88;
    v11[4] = self;
    id v12 = v6;
    id v13 = v5;
    [v4 setCompletion:v11];
    [v4 setSavePath:0];
  }
  v10 = [(MSDServerRequestHandler *)self hubServer];
  [v10 downloadManifest:v4];
}

- (void)handleReportError:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self hubServer];
  [v5 reportError:v4];
}

- (void)handleReportDone:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self hubServer];
  [v5 reportDone:v4];
}

- (void)handleFMH:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self duServer];
  [v5 findMyHub:v4];
}

- (void)handleCheckIn:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self duServer];
  [v5 checkIn:v4];
}

- (void)handleMarkNotDemo:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self duServer];
  [v5 markAsNotDemo:v4];
}

- (void)handleStoreSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self duServer];
  [v5 storeSearch:v4];
}

- (void)handleGetAccountSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self hubServer];
  [v5 getAccountSettings:v4];
}

- (void)handleDownloadFile:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MSDServerRequestHandler *)v5 hubHostName];
  if (v6)
  {
    id v7 = [(MSDServerRequestHandler *)v5 hubPort];

    if (v7)
    {
      objc_sync_exit(v5);

      id v8 = [(MSDServerRequestHandler *)v5 downloadManager];
      [v8 downloadFileForRequest:v4];
      id v9 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unsigned int v11 = [v4 getName];
    sub_1000DB928(v11, buf, v10);
  }

  id v14 = 0;
  sub_1000C3140(&v14, 3727744769, @"Input is invalid");
  id v9 = v14;
  objc_sync_exit(v5);

  id v12 = [v4 completion];

  if (v12)
  {
    id v8 = [v4 completion];
    id v13 = [[MSDServerResponse alloc] initWithError:v9];
    ((void (**)(void, MSDServerResponse *))v8)[2](v8, v13);

    goto LABEL_8;
  }
LABEL_9:
}

- (void)handlePing:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self hubServer];
  [v5 ping:v4];
}

- (void)handleAck:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self hubServer];
  [v5 ack:v4];
}

- (void)handleS3Upload:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self s3Server];
  [v5 uploadMobileStoreDemoLogs:v4];
}

- (void)handleKVStore:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDServerRequestHandler *)self hubServer];
  [v5 handleKVStore:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v9 isEqualToString:@"hubHostName"] & 1) != 0
    || [v9 isEqualToString:@"hubPort"])
  {
    id v12 = [(MSDServerRequestHandler *)self device];

    if (v12 == v10)
    {
      id v13 = [v11 objectForKey:NSKeyValueChangeKindKey];
      unsigned int v14 = [v13 intValue];

      if (v14 == 1)
      {
        uint64_t v15 = sub_100068600();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138543618;
          id v18 = (id)objc_opt_class();
          __int16 v19 = 2114;
          id v20 = v9;
          id v16 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Observed %{public}@ change!", (uint8_t *)&v17, 0x16u);
        }
        [(MSDServerRequestHandler *)self updateHubHostNameAndPort];
      }
    }
  }
}

- (id)updateFileDownloadCredentialFromManifestInfo:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating file download credential...", buf, 2u);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  __int16 v19 = buf;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1000AA18C;
  uint64_t v22 = sub_1000AA19C;
  id v23 = 0;
  id v7 = objc_alloc_init(MSDFileDownloadCredentialRequest);
  [(MSDServerRequestHandler *)self autoFillCommandRequest:v7];
  [(MSDFileDownloadCredentialRequest *)v7 setManifestInfo:v4];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  unsigned int v14 = sub_1000AB450;
  uint64_t v15 = &unk_100153D10;
  int v17 = buf;
  id v8 = v6;
  id v16 = v8;
  [(MSDServerRequest *)v7 setCompletion:&v12];
  id v9 = [(MSDServerRequestHandler *)self hubServer];
  [v9 getFileDownloadCredential:v7];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = *((id *)v19 + 5);

  _Block_object_dispose(buf, 8);

  return v10;
}

- (void)downloadIPAForResponse:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000AB7C0;
  v19[3] = &unk_100153DB0;
  id v8 = v6;
  id v20 = v8;
  id v21 = self;
  id v9 = v7;
  id v22 = v9;
  id v10 = objc_retainBlock(v19);
  id v11 = [v8 error];

  if (v11)
  {
    unsigned int v14 = 0;
  }
  else
  {
    id v12 = [v9 savePath];
    uint64_t v13 = [v8 fileName];
    unsigned int v14 = [v12 stringByAppendingPathComponent:v13];

    uint64_t v15 = [(MSDServerRequestHandler *)self getDownloadFileRequestFromResponse:v8 forFilePath:v14];
    if (v15)
    {
      id v16 = v15;
      [v15 setCompletion:v10];
      [(MSDServerRequestHandler *)self handleDownloadFile:v16];
      goto LABEL_4;
    }
    int v17 = +[NSError errorDomainMSDWithCode:3727744512 message:@"Unexpected server response."];
    [v8 setError:v17];
  }
  id v18 = [v9 completion];

  if (!v18) {
    goto LABEL_5;
  }
  id v16 = [v9 completion];
  ((void (**)(void, id))v16)[2](v16, v8);
LABEL_4:

LABEL_5:
}

- (void)checkIPAForResponse:(id)a3 withRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 error];

  if (!v7)
  {
    id v8 = +[NSFileManager defaultManager];
    id v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 appID];
      int v19 = 138543362;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Checking IPA File for %{public}@", (uint8_t *)&v19, 0xCu);
    }
    id v11 = [v6 savePath];
    unsigned __int8 v12 = [v8 fileExistsAtPath:v11];

    if (v12)
    {
      uint64_t v13 = [v6 savePath];
      unsigned int v14 = [v8 attributesOfItemAtPath:v13 error:0];

      if ([v14 fileSize])
      {
LABEL_6:

        goto LABEL_7;
      }
      int v17 = sub_100068600();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000DBA08(v6);
      }
    }
    else
    {
      int v17 = sub_100068600();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000DBA90(v6);
      }
      unsigned int v14 = 0;
    }

    id v18 = +[NSError errorDomainMSDWithCode:3727744512 message:@"Unexpected server response."];
    [v5 setError:v18];

    goto LABEL_6;
  }
LABEL_7:
  uint64_t v15 = [v6 completion];

  if (v15)
  {
    id v16 = [v6 completion];
    ((void (**)(void, id))v16)[2](v16, v5);
  }
}

- (id)getDownloadFileRequestFromResponse:(id)a3 forFilePath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 fileName];
  id v8 = [v5 originServer];
  unsigned __int8 v9 = [v5 conformsToProtocol:&OBJC_PROTOCOL___MSDDownloadFileDetailsProtocol];
  id v10 = sub_100068600();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Details to download file are: FileName = %{public}@, OriginServer = %{public}@", (uint8_t *)&v17, 0x16u);
    }

    unsigned __int8 v12 = objc_alloc_init(MSDDownloadFileRequest);
    uint64_t v13 = +[MSDFileDownloadCredentials sharedInstance];
    [(MSDCDNServerRequest *)v12 setDownloadCredentials:v13];

    unsigned int v14 = [(MSDDownloadFileRequest *)v12 fileInfo];
    [v14 setFile:v7];

    uint64_t v15 = [(MSDDownloadFileRequest *)v12 fileInfo];
    [v15 setFileHash:v7];

    [(MSDServerRequest *)v12 setSavePath:v6];
    [(MSDCDNServerRequest *)v12 setOriginServer:v8];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DBB18(v5);
    }

    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)getDispatchTable
{
  return &off_100163070;
}

- (void)updateHubHostNameAndPort
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MSDServerRequestHandler *)v2 device];
  id v4 = [v3 hubHostName];
  [(MSDServerRequestHandler *)v2 setHubHostName:v4];

  id v5 = [(MSDServerRequestHandler *)v2 device];
  id v6 = [v5 hubPort];
  [(MSDServerRequestHandler *)v2 setHubPort:v6];

  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(MSDServerRequestHandler *)v2 hubHostName];
    unsigned __int8 v9 = [(MSDServerRequestHandler *)v2 hubPort];
    int v10 = 136315650;
    id v11 = "-[MSDServerRequestHandler updateHubHostNameAndPort]";
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - updated hub host name: %{public}@ port: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  objc_sync_exit(v2);
}

- (NSString)hubHostName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHubHostName:(id)a3
{
}

- (NSString)hubPort
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHubPort:(id)a3
{
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceUDID:(id)a3
{
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDevice:(id)a3
{
}

- (MSDHubServer)hubServer
{
  return (MSDHubServer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHubServer:(id)a3
{
}

- (MSDDemoUnitServer)duServer
{
  return (MSDDemoUnitServer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDuServer:(id)a3
{
}

- (MSDS3Server)s3Server
{
  return (MSDS3Server *)objc_getProperty(self, a2, 56, 1);
}

- (void)setS3Server:(id)a3
{
}

- (MSDDownloadRequestManager)downloadManager
{
  return (MSDDownloadRequestManager *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDownloadManager:(id)a3
{
}

- (NSDictionary)dispatchTable
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDispatchTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchTable, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_s3Server, 0);
  objc_storeStrong((id *)&self->_duServer, 0);
  objc_storeStrong((id *)&self->_hubServer, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_hubPort, 0);

  objc_storeStrong((id *)&self->_hubHostName, 0);
}

@end