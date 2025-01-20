@interface BADownload
+ (BOOL)supportsSecureCoding;
+ (id)classesForSerialization;
- (BAApplicationInfo)applicationInfo;
- (BADownload)copyAsNonEssential;
- (BADownload)init;
- (BADownload)initWithCoder:(id)a3;
- (BADownloadAgentDelegate)delegate;
- (BADownloadState)state;
- (BADownloaderPriority)priority;
- (BAURLSession)session;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEssential;
- (BOOL)isForegroundDownload;
- (BOOL)permitInitialCellularDownload;
- (BOOL)startDownloadWithDelegate:(id)a3 error:(id *)a4;
- (NSData)resumeData;
- (NSDate)downloadStartDate;
- (NSError)downloadError;
- (NSNumber)downloadedFileSize;
- (NSString)applicationGroupIdentifier;
- (NSString)applicationIdentifier;
- (NSString)downloadCachePath;
- (NSString)identifier;
- (NSString)uniqueIdentifier;
- (OS_dispatch_queue)responseQueue;
- (OS_os_transaction)transaction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)initPrivatelyWithApplicationGroupIdentifier:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)necessity;
- (os_unfair_lock_s)downloadLock;
- (unint64_t)hash;
- (unsigned)powerAssertionID;
- (void)_addActivityWithIdentifier:(id)a3 takePowerAssertion:(BOOL)a4;
- (void)_removeActivityAndPowerAssertion;
- (void)cancelDownload;
- (void)cancelDownloadSilently;
- (void)demoteToBackground;
- (void)encodeWithCoder:(id)a3;
- (void)pauseDownload;
- (void)promoteToForeground;
- (void)setApplicationGroupIdentifier:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationInfo:(id)a3;
- (void)setApplicationInformationForRestrictedDownload:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadCachePath:(id)a3;
- (void)setDownloadError:(id)a3;
- (void)setDownloadStartDate:(id)a3;
- (void)setDownloadedFileSize:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsForegroundDownload:(BOOL)a3;
- (void)setNecessity:(int64_t)a3;
- (void)setPermitInitialCellularDownload:(BOOL)a3;
- (void)setPowerAssertionID:(unsigned int)a3;
- (void)setPriority:(int64_t)a3;
- (void)setResponseQueue:(id)a3;
- (void)setResumeData:(id)a3;
- (void)setSession:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation BADownload

- (void)promoteToForeground
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"promoteToForeground is not implemented on BADownload as it is abstract." userInfo:0];
  [v2 raise];
}

- (void)demoteToBackground
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"demoteToBackground is not implemented on BADownload as it is abstract." userInfo:0];
  [v2 raise];
}

- (void)pauseDownload
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"pauseDownload is not implemented on BADownload as it is abstract." userInfo:0];
  [v2 raise];
}

- (void)cancelDownload
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"cancelDownload is not implemented on BADownload as it is abstract." userInfo:0];
  [v2 raise];
}

- (void)cancelDownloadSilently
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"cancelDownloadSilently is not implemented on BADownload as it is abstract." userInfo:0];
  [v2 raise];
}

- (BOOL)startDownloadWithDelegate:(id)a3 error:(id *)a4
{
  v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"startDownloadWithDelegate:error: is not implemented on BADownload as it is abstract." userInfo:0];
  [v4 raise];

  return 0;
}

- (void)setApplicationInformationForRestrictedDownload:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner([(BADownload *)self downloadLock]);
  [(BADownload *)self setApplicationInfo:v4];
}

- (void)_addActivityWithIdentifier:(id)a3 takePowerAssertion:(BOOL)a4
{
  BOOL v4 = a4;
  os_unfair_lock_assert_owner([(BADownload *)self downloadLock]);
  [(BADownload *)self _removeActivityAndPowerAssertion];
  if (v4)
  {
    IOPMAssertionID AssertionID = 0;
    v6 = [(BADownload *)self uniqueIdentifier];
    IOReturn v7 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, (CFStringRef)+[NSString stringWithFormat:@"Downloading - %@", v6], &AssertionID);

    if (v7)
    {
      v8 = sub_100013ABC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100038D64(v8);
      }
    }
    else
    {
      [(BADownload *)self setPowerAssertionID:AssertionID];
    }
  }
  id v9 = [(BADownload *)self uniqueIdentifier];
  [v9 UTF8String];
  v10 = (void *)os_transaction_create();
  [(BADownload *)self setTransaction:v10];
}

- (void)_removeActivityAndPowerAssertion
{
  os_unfair_lock_assert_owner([(BADownload *)self downloadLock]);
  if ([(BADownload *)self powerAssertionID])
  {
    IOPMAssertionRelease([(BADownload *)self powerAssertionID]);
    [(BADownload *)self setPowerAssertionID:0];
  }

  [(BADownload *)self setTransaction:0];
}

+ (id)classesForSerialization
{
  if (qword_100069508 != -1) {
    dispatch_once(&qword_100069508, &stru_10005CB90);
  }
  id v2 = (void *)qword_100069500;

  return v2;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = v4;
  if ((id)-[BADownload necessity](v5, "necessity") == (id)1 && ![v6 necessity]) {
    goto LABEL_9;
  }
  if (!-[BADownload necessity](v5, "necessity") && [v6 necessity] == (id)1
    || (id v7 = -[BADownload priority](v5, "priority"), (uint64_t)v7 < (uint64_t)[v6 priority]))
  {
    int64_t v8 = -1;
    goto LABEL_10;
  }
  id v9 = [(BADownload *)v5 priority];
  if ((uint64_t)v9 > (uint64_t)[v6 priority] || (unint64_t v10 = sub_1000333AC(v5), v10 < sub_1000333AC(v6)))
  {
LABEL_9:
    int64_t v8 = 1;
    goto LABEL_10;
  }
  unint64_t v12 = sub_1000333AC(v5);
  if (v12 <= sub_1000333AC(v6)) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = -1;
  }
LABEL_10:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BADownload)init
{
  result = (BADownload *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    id v4 = "BADownload cannot be constructed using -init.";
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BADownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BADownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BADownload;
  v5 = [(BADownload *)&v29 init];
  if (!v5) {
    goto LABEL_14;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [(BADownload *)v5 setIdentifier:v6];

  sub_100032D34(v5, (uint64_t)[v4 decodeIntegerForKey:@"internalState"]);
  if ([v4 containsValueForKey:@"necessity"])
  {
    id v7 = [v4 decodeIntegerForKey:@"necessity"];
    self;
    if ((unint64_t)v7 >= 2) {
      id v8 = 0;
    }
    else {
      id v8 = v7;
    }
  }
  else
  {
    id v8 = 0;
  }
  [(BADownload *)v5 setNecessity:v8];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priority"];
  -[BADownload setPriority:](v5, "setPriority:", [v9 integerValue]);
  unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
  [(BADownload *)v5 setUniqueIdentifier:v10];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationGroupIdentifier"];
  [(BADownload *)v5 setApplicationGroupIdentifier:v11];

  unint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedDownloadedFileURL"];
  objc_setProperty_atomic(v5, v13, v12, 80);

  sub_100032DA4(v5, (uint64_t)[v4 decodeIntegerForKey:@"clientSpecifiedFileSize"]);
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
  [(BADownload *)v5 setApplicationIdentifier:v14];

  [(BADownload *)v5 setPowerAssertionID:0];
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadFailureError"];
  [(BADownload *)v5 setDownloadError:v15];

  dispatch_queue_t v16 = dispatch_queue_create("com.apple.BackgroundAssets.BADownload+Agent.ResponseQueue", 0);
  [(BADownload *)v5 setResponseQueue:v16];

  v5->_downloadLockOpaque._os_unfair_lock_opaque = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(BADownload *)v5 setResumeData:0];
    [(BADownload *)v5 setDownloadCachePath:0];
    [(BADownload *)v5 setApplicationInfo:0];
LABEL_13:

LABEL_14:
    v26 = v5;
    goto LABEL_15;
  }
  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resumeData"];
  [(BADownload *)v5 setResumeData:v17];

  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadCachePath"];
  [(BADownload *)v5 setDownloadCachePath:v18];

  v19 = [(BADownload *)v5 applicationIdentifier];
  v20 = [(BADownload *)v5 applicationIdentifier];
  v21 = [v20 _baassets_validUTI];
  unsigned __int8 v22 = [v19 isEqualToString:v21];

  if (v22)
  {
    if ([v4 decodeBoolForKey:@"isRestrictedDownload"])
    {
      v23 = [v4 agentCore];
      v24 = [(BADownload *)v5 applicationIdentifier];
      v25 = [v23 applicationInfoForIdentifier:v24];
      [(BADownload *)v5 setApplicationInfo:v25];
    }
    -[BADownload setPermitInitialCellularDownload:](v5, "setPermitInitialCellularDownload:", [v4 decodeBoolForKey:@"permitInitialCellularDownload"]);
    goto LABEL_13;
  }
  v28 = sub_100013ABC();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_10003B730(v5, v28);
  }

  v26 = 0;
LABEL_15:

  return v26;
}

- (id)initPrivatelyWithApplicationGroupIdentifier:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BADownload;
  v5 = [(BADownload *)&v16 init];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Provided applicationGroupIdentifier must be a valid string." userInfo:0];
      [v14 raise];

      SEL v13 = 0;
      goto LABEL_6;
    }
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.BackgroundAssets.BADownload+Agent.ResponseQueue", 0);
    [(BADownload *)v5 setResponseQueue:v6];

    v5->_downloadLockOpaque._os_unfair_lock_opaque = 0;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    sub_100032D34(v5, 0);
    [(BADownload *)v5 setPriority:0];
    [(BADownload *)v5 setApplicationGroupIdentifier:v4];
    [(BADownload *)v5 setNecessity:0];
    sub_100032DA4(v5, 0);
    id v9 = [(BADownload *)v5 applicationGroupIdentifier];
    unint64_t v10 = +[NSUUID UUID];
    v11 = [v10 UUIDString];
    unint64_t v12 = +[NSString stringWithFormat:@"%@.%@.%@", v8, v9, v11];
    [(BADownload *)v5 setUniqueIdentifier:v12];
  }
  SEL v13 = v5;
LABEL_6:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(BADownload *)v4 identifier];
  [v20 encodeObject:v5 forKey:@"identifier"];

  [v20 encodeInteger:sub_100033364(v4) forKey:@"internalState"];
  [v20 encodeInteger:-[BADownload necessity](v4, "necessity") forKey:@"necessity"];
  dispatch_queue_t v6 = +[NSNumber numberWithInteger:[(BADownload *)v4 priority]];
  [v20 encodeObject:v6 forKey:@"priority"];

  [v20 encodeInteger:sub_1000333AC(v4) forKey:@"clientSpecifiedFileSize"];
  id v7 = [(BADownload *)v4 uniqueIdentifier];
  [v20 encodeObject:v7 forKey:@"uniqueIdentifier"];

  id v8 = [(BADownload *)v4 applicationGroupIdentifier];
  [v20 encodeObject:v8 forKey:@"applicationGroupIdentifier"];

  if (v4 && objc_getProperty(v4, v9, 80, 1))
  {
    id v11 = objc_getProperty(v4, v10, 80, 1);
    [v20 encodeObject:v11 forKey:@"stagedDownloadedFileURL"];
  }
  unint64_t v12 = [(BADownload *)v4 downloadError];

  if (v12)
  {
    SEL v13 = [(BADownload *)v4 downloadError];
    [v20 encodeObject:v13 forKey:@"downloadFailureError"];
  }
  v14 = [(BADownload *)v4 applicationIdentifier];
  [v20 encodeObject:v14 forKey:@"applicationIdentifier"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [(BADownload *)v4 resumeData];

    if (v15)
    {
      objc_super v16 = [(BADownload *)v4 resumeData];
      [v20 encodeObject:v16 forKey:@"resumeData"];
    }
    v17 = [(BADownload *)v4 downloadCachePath];

    if (v17)
    {
      v18 = [(BADownload *)v4 downloadCachePath];
      [v20 encodeObject:v18 forKey:@"downloadCachePath"];
    }
    v19 = [(BADownload *)v4 applicationInfo];

    if (v19) {
      [v20 encodeBool:1 forKey:@"isRestrictedDownload"];
    }
    [v20 encodeBool:-[BADownload permitInitialCellularDownload](v4, "permitInitialCellularDownload") forKey:@"permitInitialCellularDownload"];
  }
  objc_sync_exit(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  dispatch_queue_t v6 = self;
  objc_sync_enter(v6);
  id v7 = [v5 allocWithZone:a3];
  id v8 = [(BADownload *)v6 applicationGroupIdentifier];
  id v9 = [v7 initPrivatelyWithApplicationGroupIdentifier:v8];

  if (v9)
  {
    unint64_t v10 = [(BADownload *)v6 identifier];
    id v11 = [v10 copyWithZone:a3];
    [v9 setIdentifier:v11];

    uint64_t v12 = sub_100033364(v6);
    sub_100032D34(v9, v12);
    [v9 setPriority:-[BADownload priority](v6, "priority")];
    [v9 setNecessity:-[BADownload necessity](v6, "necessity")];
    uint64_t v13 = sub_1000333AC(v6);
    sub_100032DA4(v9, v13);
    v14 = [(BADownload *)v6 uniqueIdentifier];
    id v15 = [v14 copyWithZone:a3];
    [v9 setUniqueIdentifier:v15];

    objc_super v16 = [(BADownload *)v6 applicationGroupIdentifier];
    id v17 = [v16 copyWithZone:a3];
    [v9 setApplicationGroupIdentifier:v17];

    if (v6) {
      id Property = objc_getProperty(v6, v18, 80, 1);
    }
    else {
      id Property = 0;
    }
    id v20 = Property;
    id v21 = [v20 copyWithZone:a3];
    objc_setProperty_atomic(v9, v22, v21, 80);

    v23 = [(BADownload *)v6 downloadError];
    id v24 = [v23 copyWithZone:a3];
    [v9 setDownloadError:v24];

    v25 = [(BADownload *)v6 applicationIdentifier];
    id v26 = [v25 copyWithZone:a3];
    [v9 setApplicationIdentifier:v26];

    [v9 setPermitInitialCellularDownload:-[BADownload permitInitialCellularDownload](v6, "permitInitialCellularDownload")];
  }
  objc_sync_exit(v6);

  return v9;
}

- (BADownloaderPriority)priority
{
  id v2 = self;
  objc_sync_enter(v2);
  BADownloaderPriority priority = v2->_priority;
  objc_sync_exit(v2);

  return priority;
}

- (void)setPriority:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BADownloaderPriority priority = a3;
  objc_sync_exit(obj);
}

- (BOOL)isEssential
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_necessity == 1;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)necessity
{
  id v2 = self;
  objc_sync_enter(v2);
  int64_t necessity = v2->_necessity;
  objc_sync_exit(v2);

  return necessity;
}

- (void)setNecessity:(int64_t)a3
{
  self;
  if ((unint64_t)a3 >= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10003B850();
    }
    qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Cannot provide an unsupported BADownloadNecessity.";
    __break(1u);
  }
  else
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_int64_t necessity = a3;
    objc_sync_exit(obj);
  }
}

- (BADownloadState)state
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = sub_100033364(v2);
  if (v3 > 8) {
    BADownloadState v4 = BADownloadStateFailed;
  }
  else {
    BADownloadState v4 = qword_100046DE0[v3];
  }
  objc_sync_exit(v2);

  return v4;
}

- (BADownload)copyAsNonEssential
{
  id v2 = (BADownload *)[(BADownload *)self copy];
  [(BADownload *)v2 setNecessity:0];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  BADownloadState v4 = (BADownload *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      dispatch_queue_t v6 = [(BADownload *)self uniqueIdentifier];
      id v7 = [(BADownload *)v5 uniqueIdentifier];
      if ([v6 isEqual:v7])
      {
        id v8 = [(BADownload *)self identifier];
        id v9 = [(BADownload *)v5 identifier];
        unsigned __int8 v10 = [v8 isEqualToString:v9];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BADownload *)self uniqueIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(BADownload *)self identifier];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  v5 = [(BADownload *)self identifier];
  unint64_t v6 = [(BADownload *)self applicationIdentifier];
  id v7 = sub_10002CE90([(BADownload *)self necessity]);
  id v8 = +[NSString stringWithFormat:@"%@ (%p): [ID:%@, AppID:%@, Necessity:%@]", v4, self, v5, v6, v7];

  return v8;
}

- (id)debugDescription
{
  id v3 = objc_alloc((Class)NSMutableString);
  unint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(BADownload *)self identifier];
  id v7 = [v3 initWithFormat:@"%@ (%p): %@\n", v5, self, v6];

  uint64_t v8 = sub_100033364(self);
  if ((unint64_t)(v8 + 2) > 0xA) {
    CFStringRef v9 = @"???";
  }
  else {
    CFStringRef v9 = *(&off_10005D880 + v8 + 2);
  }
  [v7 appendFormat:@"State: %@\n", v9];
  [v7 appendFormat:@"Priority: %lu\n", -[BADownload priority](self, "priority")];
  unsigned __int8 v10 = sub_10002CE90([(BADownload *)self necessity]);
  [v7 appendFormat:@"Download Necessity: %@\n", v10];

  id v11 = [(BADownload *)self uniqueIdentifier];
  [v7 appendFormat:@"Unique identifier: %@\n", v11];

  uint64_t v12 = [(BADownload *)self applicationGroupIdentifier];
  [v7 appendFormat:@"App Group identifier: %@\n", v12];

  if (self) {
    id Property = objc_getProperty(self, v13, 80, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendFormat:@"Staged file url: %@\n", Property];
  [v7 appendFormat:@"Client file size: %ld\n", sub_1000333AC(self)];
  id v15 = [(BADownload *)self applicationIdentifier];
  [v7 appendFormat:@"Application identifier: %@\n", v15];

  objc_super v16 = [(BADownload *)self downloadError];
  [v7 appendFormat:@"Download error: %@\n", v16];

  id v17 = [(BADownload *)self downloadStartDate];
  [v7 appendFormat:@"Download start time: %@\n", v17];

  v18 = [(BADownload *)self downloadCachePath];
  [v7 appendFormat:@"Download cache path: %@\n", v18];

  v19 = [(BADownload *)self session];
  [v7 appendFormat:@"BAURLSession object: %@\n", v19];

  id v20 = [(BADownload *)self resumeData];
  id v21 = [v20 bytes];
  SEL v22 = [(BADownload *)self resumeData];
  [v7 appendFormat:@"Resume data: %p, %lu\n", v21, [v22 length]];

  v23 = [(BADownload *)self applicationInfo];
  if (v23) {
    CFStringRef v24 = @"YES";
  }
  else {
    CFStringRef v24 = @"NO";
  }
  [v7 appendFormat:@"Is restricted download: %@\n", v24];

  if (self->_isForegroundDownload) {
    CFStringRef v25 = @"YES";
  }
  else {
    CFStringRef v25 = @"NO";
  }
  [v7 appendFormat:@"Is foreground download: %@\n", v25];
  if ([(BADownload *)self permitInitialCellularDownload]) {
    CFStringRef v26 = @"YES";
  }
  else {
    CFStringRef v26 = @"NO";
  }
  [v7 appendFormat:@"Is initial cellular permitted: %@\n", v26];

  return v7;
}

- (os_unfair_lock_s)downloadLock
{
  return &self->_downloadLockOpaque;
}

- (void)setIsForegroundDownload:(BOOL)a3
{
  self->_isForegroundDownload = a3;
}

- (BOOL)isForegroundDownload
{
  return self->_isForegroundDownload;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)applicationGroupIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setApplicationGroupIdentifier:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (BADownloadAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BADownloadAgentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)downloadStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDownloadStartDate:(id)a3
{
}

- (NSString)downloadCachePath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDownloadCachePath:(id)a3
{
}

- (BAURLSession)session
{
  return (BAURLSession *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSession:(id)a3
{
}

- (NSData)resumeData
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setResumeData:(id)a3
{
}

- (NSError)downloadError
{
  return (NSError *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDownloadError:(id)a3
{
}

- (NSNumber)downloadedFileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDownloadedFileSize:(id)a3
{
}

- (BAApplicationInfo)applicationInfo
{
  return (BAApplicationInfo *)objc_getProperty(self, a2, 152, 1);
}

- (void)setApplicationInfo:(id)a3
{
}

- (BOOL)permitInitialCellularDownload
{
  return self->_permitInitialCellularDownload;
}

- (void)setPermitInitialCellularDownload:(BOOL)a3
{
  self->_permitInitialCellularDownload = a3;
}

- (OS_dispatch_queue)responseQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setResponseQueue:(id)a3
{
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerIOPMAssertionID AssertionID = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_applicationInfo, 0);
  objc_storeStrong((id *)&self->_downloadedFileSize, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_downloadCachePath, 0);
  objc_storeStrong((id *)&self->_downloadStartDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_stagedDownloadedFileURL, 0);
  objc_storeStrong((id *)&self->_applicationGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end