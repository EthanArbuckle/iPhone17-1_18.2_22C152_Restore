@interface CSStudiesServerUploader
- (BOOL)addOutOfBandMetadata:(id)a3 error:(id *)a4;
- (BOOL)enqueueFileWithFilename:(id)a3 andMetadata:(id)a4 error:(id *)a5;
- (BOOL)isFileOldEnoughForDeletion:(id)a3;
- (BOOL)monitoring;
- (BOOL)persistToDiskWithSpooledFile:(BOOL)a3 fileURL:(id)a4 enqueueTime:(double)a5 metadata:(id)a6 theError:(id *)a7;
- (BOOL)registerForUploadingWithError:(id *)a3;
- (BOOL)registered;
- (BOOL)startMonitoringWithError:(id *)a3;
- (CSFolderMonitor)encryptMonitor;
- (CSFolderMonitor)oobMetadataMonitor;
- (CSFolderMonitor)submitMonitor;
- (CSStudiesServerConfiguration)configuration;
- (CSStudiesServerSubmitter)submitter;
- (CSStudiesServerUploader)initWithSpoolerFolder:(id)a3 serverConfiguration:(id)a4 registrationPeriodInSeconds:(unint64_t)a5 retentionPeriodInSeconds:(unint64_t)a6 outOfBandMetadataTimeout:(double)a7 defaultsKeyPostfix:(id)a8;
- (NSString)defaultsRegistrationDateKeyName;
- (NSString)defaultsSubjectAuthTokenKeyName;
- (NSString)defaultsSubjectIDKeyName;
- (NSString)postfix;
- (NSString)subjectAuthorizationToken;
- (NSURL)folderURL;
- (NSUUID)subjectID;
- (double)oobTimeout;
- (unint64_t)registrationPeriodInSeconds;
- (unint64_t)retentionPeriodInSeconds;
- (void)checkForPersistedRegistration;
- (void)createSubmitterIfRegistered;
- (void)dealloc;
- (void)setDefaultsRegistrationDateKeyName:(id)a3;
- (void)setDefaultsSubjectAuthTokenKeyName:(id)a3;
- (void)setDefaultsSubjectIDKeyName:(id)a3;
- (void)setEncryptMonitor:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setOobMetadataMonitor:(id)a3;
- (void)setOobTimeout:(double)a3;
- (void)setRegistered:(BOOL)a3;
- (void)setRegistrationPeriodInSeconds:(unint64_t)a3;
- (void)setRetentionPeriodInSeconds:(unint64_t)a3;
- (void)setSubjectAuthorizationToken:(id)a3;
- (void)setSubjectID:(id)a3;
- (void)setSubmitMonitor:(id)a3;
- (void)setSubmitter:(id)a3;
@end

@implementation CSStudiesServerUploader

- (CSStudiesServerUploader)initWithSpoolerFolder:(id)a3 serverConfiguration:(id)a4 registrationPeriodInSeconds:(unint64_t)a5 retentionPeriodInSeconds:(unint64_t)a6 outOfBandMetadataTimeout:(double)a7 defaultsKeyPostfix:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CSStudiesServerUploader;
  v17 = [(CSStudiesServerUploader *)&v30 init];
  if (v17)
  {
    v18 = (NSURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:v14 isDirectory:1];
    folderURL = v17->_folderURL;
    v17->_folderURL = v18;

    if (qword_1003DB770 != -1) {
      dispatch_once(&qword_1003DB770, &stru_10039B000);
    }
    v20 = qword_1003DB778;
    if (os_log_type_enabled((os_log_t)qword_1003DB778, OS_LOG_TYPE_INFO))
    {
      v21 = v17->_folderURL;
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Starting uploader with spooler at: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)&v17->_configuration, a4);
    v17->_registrationPeriodInSeconds = a5;
    v17->_retentionPeriodInSeconds = a6;
    objc_storeStrong((id *)&v17->_postfix, a8);
    uint64_t v22 = [@"StudiesServerUploaderDefaultsSubjectID" stringByAppendingString:v16];
    defaultsSubjectIDKeyName = v17->_defaultsSubjectIDKeyName;
    v17->_defaultsSubjectIDKeyName = (NSString *)v22;

    uint64_t v24 = [@"StudiesServerUploaderDefaultsSubjectAuthorizationToken" stringByAppendingString:v16];
    defaultsSubjectAuthTokenKeyName = v17->_defaultsSubjectAuthTokenKeyName;
    v17->_defaultsSubjectAuthTokenKeyName = (NSString *)v24;

    uint64_t v26 = [@"StudiesServerUploaderDefaultsRegistrationDate" stringByAppendingString:v16];
    defaultsRegistrationDateKeyName = v17->_defaultsRegistrationDateKeyName;
    v17->_defaultsRegistrationDateKeyName = (NSString *)v26;

    [(CSStudiesServerUploader *)v17 checkForPersistedRegistration];
    submitter = v17->_submitter;
    v17->_submitter = 0;

    [(CSStudiesServerUploader *)v17 createSubmitterIfRegistered];
    v17->_oobTimeout = a7;
  }

  return v17;
}

- (void)checkForPersistedRegistration
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [(CSStudiesServerUploader *)self defaultsRegistrationDateKeyName];
  id v5 = [v3 integerForKey:v4];

  if (v5)
  {
    v6 = +[NSDate date];
    [v6 timeIntervalSinceReferenceDate];
    unint64_t v8 = (unint64_t)(v7 - (double)(unint64_t)v5);

    if ([(CSStudiesServerUploader *)self registrationPeriodInSeconds] <= v8)
    {
      if (qword_1003DB770 != -1) {
        dispatch_once(&qword_1003DB770, &stru_10039B000);
      }
      v21 = (id)qword_1003DB778;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v22 = 134349312;
        unint64_t v23 = v8;
        __int16 v24 = 2050;
        unint64_t v25 = [(CSStudiesServerUploader *)self registrationPeriodInSeconds];
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Expired HDS UUID found: %{public}llu > %{public}llu", (uint8_t *)&v22, 0x16u);
      }

      [(CSStudiesServerUploader *)self setRegistered:0];
    }
    else
    {
      v9 = self;
      objc_sync_enter(v9);
      [(CSStudiesServerUploader *)v9 setRegistered:1];
      id v10 = objc_alloc((Class)NSUUID);
      v11 = +[NSUserDefaults standardUserDefaults];
      v12 = [(CSStudiesServerUploader *)v9 defaultsSubjectIDKeyName];
      v13 = [v11 stringForKey:v12];
      id v14 = [v10 initWithUUIDString:v13];
      [(CSStudiesServerUploader *)v9 setSubjectID:v14];

      id v15 = +[NSUserDefaults standardUserDefaults];
      id v16 = [(CSStudiesServerUploader *)v9 defaultsSubjectAuthTokenKeyName];
      v17 = [v15 stringForKey:v16];
      [(CSStudiesServerUploader *)v9 setSubjectAuthorizationToken:v17];

      objc_sync_exit(v9);
      if (qword_1003DB770 != -1) {
        dispatch_once(&qword_1003DB770, &stru_10039B000);
      }
      v18 = (id)qword_1003DB778;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = [(CSStudiesServerUploader *)v9 subjectID];
        int v22 = 138543362;
        unint64_t v23 = (unint64_t)v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Persisted HDS UUID found: %{public}@", (uint8_t *)&v22, 0xCu);
      }
    }
  }
  else
  {
    if (qword_1003DB770 != -1) {
      dispatch_once(&qword_1003DB770, &stru_10039B000);
    }
    v20 = qword_1003DB778;
    if (os_log_type_enabled((os_log_t)qword_1003DB778, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "No persisted HDS UUID found", (uint8_t *)&v22, 2u);
    }
    [(CSStudiesServerUploader *)self setRegistered:0];
  }
}

- (void)createSubmitterIfRegistered
{
  if ([(CSStudiesServerUploader *)self registered])
  {
    if (qword_1003DB770 != -1) {
      dispatch_once(&qword_1003DB770, &stru_10039B000);
    }
    v3 = (id)qword_1003DB778;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(CSStudiesServerUploader *)self subjectID];
      int v15 = 138543362;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Registered with Studies Server as %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id v5 = [(CSStudiesServerUploader *)self configuration];
    v6 = [v5 server];
    double v7 = +[NSURL URLWithString:v6];
    unint64_t v8 = [v7 URLByAppendingPathComponent:@"/ingest/v2/submit/"];

    v9 = [(CSStudiesServerUploader *)self submitter];
    LODWORD(v5) = v9 == 0;

    if (v5)
    {
      v12 = [CSStudiesServerSubmitter alloc];
      id v10 = [(CSStudiesServerUploader *)self configuration];
      v11 = [v10 auth];
      v13 = [(CSStudiesServerUploader *)self subjectAuthorizationToken];
      id v14 = [(CSStudiesServerSubmitter *)v12 initWithEndpoint:v8 authorization:v11 subjectToken:v13];
      [(CSStudiesServerUploader *)self setSubmitter:v14];
    }
    else
    {
      id v10 = [(CSStudiesServerUploader *)self submitter];
      v11 = [(CSStudiesServerUploader *)self subjectAuthorizationToken];
      [v10 updateRegistrationWithSubjectToken:v11];
    }
  }
}

- (BOOL)registerForUploadingWithError:(id *)a3
{
  [(CSStudiesServerUploader *)self checkForPersistedRegistration];
  if (![(CSStudiesServerUploader *)self registered])
  {
    unint64_t v23 = a3;
    id v5 = [(CSStudiesServerUploader *)self configuration];
    v6 = [v5 server];
    double v7 = +[NSURL URLWithString:v6];
    unint64_t v8 = [v7 URLByAppendingPathComponent:@"/ingest/v2/register/"];
    v9 = [(CSStudiesServerUploader *)self configuration];
    id v10 = [v9 studyUUID];
    v11 = [v10 UUIDString];
    v12 = [v11 lowercaseString];
    v13 = [v8 URLByAppendingPathComponent:v12];

    id v14 = [CSStudiesServerRegistrar alloc];
    int v15 = [(CSStudiesServerUploader *)self configuration];
    id v16 = [v15 auth];
    v17 = [(CSStudiesServerRegistrar *)v14 initWithEndpoint:v13 authorization:v16 cellularAccess:1 timeoutInSeconds:60];

    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = sub_10001479C;
    v32 = sub_1000147AC;
    id v33 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000147B4;
    v24[3] = &unk_10039AF40;
    uint64_t v26 = &v28;
    objc_copyWeak(&v27, &location);
    v19 = v18;
    unint64_t v25 = v19;
    [(CSStudiesServerRegistrar *)v17 registerWithHandler:v24];
    dispatch_time_t v20 = dispatch_time(0, 61000000000);
    dispatch_semaphore_wait(v19, v20);
    v21 = (void *)v29[5];
    if (v21) {
      *unint64_t v23 = v21;
    }
    [(CSStudiesServerUploader *)self createSubmitterIfRegistered];

    objc_destroyWeak(&v27);
    _Block_object_dispose(&v28, 8);

    objc_destroyWeak(&location);
  }
  return [(CSStudiesServerUploader *)self registered];
}

- (BOOL)isFileOldEnoughForDeletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileManager defaultManager];
  v6 = [v4 path];
  id v19 = 0;
  double v7 = [v5 attributesOfItemAtPath:v6 error:&v19];
  id v8 = v19;
  if (v8)
  {
    if (qword_1003DB770 != -1) {
      dispatch_once(&qword_1003DB770, &stru_10039B000);
    }
    v9 = qword_1003DB778;
    if (os_log_type_enabled((os_log_t)qword_1003DB778, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v4;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to get attributes for file %{public}@: %{public}@", buf, 0x16u);
    }
    BOOL v10 = 1;
  }
  else
  {
    v11 = [v7 fileCreationDate];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;

    id v14 = +[NSDate date];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;

    BOOL v10 = [(CSStudiesServerUploader *)self retentionPeriodInSeconds] + (unint64_t)v13 < (unint64_t)v16;
  }
  if (qword_1003DB770 != -1) {
    dispatch_once(&qword_1003DB770, &stru_10039B000);
  }
  v17 = qword_1003DB778;
  if (os_log_type_enabled((os_log_t)qword_1003DB778, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v4;
    __int16 v22 = 1026;
    LODWORD(v23) = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "File %{public}@ for deletion? %{public}d", buf, 0x12u);
  }

  return v10;
}

- (BOOL)startMonitoringWithError:(id *)a3
{
  if ([(CSStudiesServerUploader *)self monitoring])
  {
LABEL_13:
    LOBYTE(v5) = 1;
    return v5;
  }
  int v5 = sub_10001D0F8(self, a3, @"starter");
  if (v5)
  {
    objc_initWeak(location, self);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000152A4;
    v37[3] = &unk_10039AF90;
    objc_copyWeak(&v38, location);
    v37[4] = self;
    v32 = objc_retainBlock(v37);
    v6 = [CSFolderMonitor alloc];
    double v7 = [(CSStudiesServerUploader *)self folderURL];
    id v8 = [v7 path];
    v9 = dispatch_get_global_queue(0, 0);
    BOOL v10 = [(CSStudiesServerUploader *)self postfix];
    v11 = [(CSFolderMonitor *)v6 initWithFolder:v8 fileExtension:@"protodata" queue:v9 postfix:v10 andAction:v32];
    [(CSStudiesServerUploader *)self setOobMetadataMonitor:v11];

    double v12 = +[CSPersistentConfiguration sharedConfiguration];
    unsigned int v13 = [v12 BOOLForKey:@"UploaderIndigenousXPCActivity"];

    if (v13)
    {
      id v14 = [[CSFolderMonitorBackgroundScanningConfiguration alloc] initWithFileProtectionType:NSFileProtectionCompleteUnlessOpen allowBattery:1 periodInseconds:XPC_ACTIVITY_INTERVAL_1_HOUR];
      double v15 = [(CSStudiesServerUploader *)self oobMetadataMonitor];
      [v15 setupRecurringScanningWithConfiguration:v14 runNow:1];
    }
    else
    {
      id v14 = [(CSStudiesServerUploader *)self oobMetadataMonitor];
      [(CSFolderMonitorBackgroundScanningConfiguration *)v14 registerForFolderMonitorActivity];
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100015B74;
    v35[3] = &unk_10039AF90;
    objc_copyWeak(&v36, location);
    v35[4] = self;
    double v16 = objc_retainBlock(v35);
    v17 = [CSFolderMonitor alloc];
    dispatch_semaphore_t v18 = [(CSStudiesServerUploader *)self folderURL];
    id v19 = [v18 path];
    dispatch_time_t v20 = [(CSStudiesServerUploader *)self postfix];
    id v21 = [(CSFolderMonitor *)v17 initWithFolder:v19 fileExtension:@"metadata" queue:v9 postfix:v20 andAction:v16];
    [(CSStudiesServerUploader *)self setEncryptMonitor:v21];

    if (v13)
    {
      __int16 v22 = [[CSFolderMonitorBackgroundScanningConfiguration alloc] initWithFileProtectionType:NSFileProtectionCompleteUnlessOpen allowBattery:1 periodInseconds:XPC_ACTIVITY_INTERVAL_1_HOUR];
      id v23 = [(CSStudiesServerUploader *)self encryptMonitor];
      [v23 setupRecurringScanningWithConfiguration:v22 runNow:1];
    }
    else
    {
      __int16 v22 = [(CSStudiesServerUploader *)self encryptMonitor];
      [(CSFolderMonitorBackgroundScanningConfiguration *)v22 registerForFolderMonitorActivity];
    }

    __int16 v24 = [CSFolderMonitor alloc];
    unint64_t v25 = [(CSStudiesServerUploader *)self folderURL];
    uint64_t v26 = [v25 path];
    id v27 = [(CSStudiesServerUploader *)self postfix];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100016784;
    v33[3] = &unk_10039AFE0;
    objc_copyWeak(&v34, location);
    uint64_t v28 = [(CSFolderMonitor *)v24 initWithFolder:v26 fileExtension:@"encrypted" queue:v9 postfix:v27 andAction:v33];
    [(CSStudiesServerUploader *)self setSubmitMonitor:v28];

    if (v13)
    {
      v29 = [[CSFolderMonitorBackgroundScanningConfiguration alloc] initWithFileProtectionType:NSFileProtectionCompleteUntilFirstUserAuthentication allowBattery:1 periodInseconds:XPC_ACTIVITY_INTERVAL_1_HOUR];
      uint64_t v30 = [(CSStudiesServerUploader *)self submitMonitor];
      [v30 setupRecurringScanningWithConfiguration:v29 runNow:1];
    }
    else
    {
      v29 = [(CSStudiesServerUploader *)self submitMonitor];
      [(CSFolderMonitorBackgroundScanningConfiguration *)v29 registerForFolderMonitorActivity];
    }

    [(CSStudiesServerUploader *)self setMonitoring:1];
    objc_destroyWeak(&v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(location);
    goto LABEL_13;
  }
  return v5;
}

- (BOOL)persistToDiskWithSpooledFile:(BOOL)a3 fileURL:(id)a4 enqueueTime:(double)a5 metadata:(id)a6 theError:(id *)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  CFStringRef v15 = @"metadata";
  [v14 encodeObject:v13 forKey:@"metadata"];
  [v14 encodeBool:v10 forKey:@"spooled"];
  [v14 encodeDouble:@"enqueueTime" forKey:a5];
  if (!v10)
  {
    double v16 = [v12 path];
    [v14 encodeObject:v16 forKey:@"unspooledFilePath"];
  }
  [v14 finishEncoding];
  [(CSStudiesServerUploader *)self oobTimeout];
  if (v17 != 0.0) {
    CFStringRef v15 = @"protodata";
  }
  dispatch_semaphore_t v18 = [(CSStudiesServerUploader *)self folderURL];
  id v19 = [v12 lastPathComponent];
  dispatch_time_t v20 = [v18 URLByAppendingPathComponent:v19];
  id v21 = [v20 URLByAppendingPathExtension:v15];

  __int16 v22 = [v14 encodedData];
  unsigned __int8 v23 = [v22 writeToURL:v21 options:805306369 error:a7];

  return v23;
}

- (BOOL)enqueueFileWithFilename:(id)a3 andMetadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v20 = a4;
  v9 = +[NSFileManager defaultManager];
  if ([v9 fileExistsAtPath:v8])
  {
    id v10 = [objc_alloc((Class)NSURL) initFileURLWithPath:v8 isDirectory:0];
    v11 = [v10 URLByDeletingLastPathComponent];
    id v12 = [v11 absoluteString];
    id v13 = [(CSStudiesServerUploader *)self folderURL];
    id v14 = [v13 absoluteString];
    id v15 = [v12 isEqualToString:v14];

    double v16 = +[NSDate now];
    [v16 timeIntervalSinceReferenceDate];
    LOBYTE(a5) = -[CSStudiesServerUploader persistToDiskWithSpooledFile:fileURL:enqueueTime:metadata:theError:](self, "persistToDiskWithSpooledFile:fileURL:enqueueTime:metadata:theError:", v15, v10, v20, a5);
  }
  else if (a5)
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    double v17 = +[NSString stringWithFormat:@"While enqueuing, file doesnt exist: %@", v8];
    __int16 v22 = v17;
    dispatch_semaphore_t v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:v18];

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (BOOL)addOutOfBandMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v7 encodeObject:v6 forKey:@"oobMetadata"];
  id v8 = +[NSDate now];
  [v8 timeIntervalSinceReferenceDate];
  [v7 encodeDouble:@"enqueueTime"];

  [v7 finishEncoding];
  v9 = +[NSUUID UUID];
  id v10 = [(CSStudiesServerUploader *)self folderURL];
  v11 = [v9 UUIDString];
  id v12 = [v10 URLByAppendingPathComponent:v11];
  id v13 = [v12 URLByAppendingPathExtension:@"oob"];

  id v14 = [v7 encodedData];
  LOBYTE(a4) = [v14 writeToURL:v13 options:805306369 error:a4];

  return (char)a4;
}

- (void)dealloc
{
  v3 = [(CSStudiesServerUploader *)self submitMonitor];
  [v3 stopRecurringScanning];

  id v4 = [(CSStudiesServerUploader *)self encryptMonitor];
  [v4 stopRecurringScanning];

  int v5 = [(CSStudiesServerUploader *)self oobMetadataMonitor];
  [v5 stopRecurringScanning];

  v6.receiver = self;
  v6.super_class = (Class)CSStudiesServerUploader;
  [(CSStudiesServerUploader *)&v6 dealloc];
}

- (CSStudiesServerConfiguration)configuration
{
  return self->_configuration;
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (NSUUID)subjectID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSubjectID:(id)a3
{
}

- (NSString)subjectAuthorizationToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubjectAuthorizationToken:(id)a3
{
}

- (CSStudiesServerSubmitter)submitter
{
  return (CSStudiesServerSubmitter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubmitter:(id)a3
{
}

- (CSFolderMonitor)oobMetadataMonitor
{
  return (CSFolderMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOobMetadataMonitor:(id)a3
{
}

- (CSFolderMonitor)encryptMonitor
{
  return (CSFolderMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEncryptMonitor:(id)a3
{
}

- (CSFolderMonitor)submitMonitor
{
  return (CSFolderMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSubmitMonitor:(id)a3
{
}

- (unint64_t)registrationPeriodInSeconds
{
  return self->_registrationPeriodInSeconds;
}

- (void)setRegistrationPeriodInSeconds:(unint64_t)a3
{
  self->_registrationPeriodInSeconds = a3;
}

- (unint64_t)retentionPeriodInSeconds
{
  return self->_retentionPeriodInSeconds;
}

- (void)setRetentionPeriodInSeconds:(unint64_t)a3
{
  self->_retentionPeriodInSeconds = a3;
}

- (double)oobTimeout
{
  return self->_oobTimeout;
}

- (void)setOobTimeout:(double)a3
{
  self->_oobTimeout = a3;
}

- (NSString)postfix
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)defaultsSubjectIDKeyName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDefaultsSubjectIDKeyName:(id)a3
{
}

- (NSString)defaultsSubjectAuthTokenKeyName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDefaultsSubjectAuthTokenKeyName:(id)a3
{
}

- (NSString)defaultsRegistrationDateKeyName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDefaultsRegistrationDateKeyName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsRegistrationDateKeyName, 0);
  objc_storeStrong((id *)&self->_defaultsSubjectAuthTokenKeyName, 0);
  objc_storeStrong((id *)&self->_defaultsSubjectIDKeyName, 0);
  objc_storeStrong((id *)&self->_postfix, 0);
  objc_storeStrong((id *)&self->_submitMonitor, 0);
  objc_storeStrong((id *)&self->_encryptMonitor, 0);
  objc_storeStrong((id *)&self->_oobMetadataMonitor, 0);
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_subjectAuthorizationToken, 0);
  objc_storeStrong((id *)&self->_subjectID, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end