@interface UMEventRecorder
+ (BOOL)diagnosticsAndUsageAllowed:(id)a3;
+ (id)recorder;
+ (id)recorderWithOptions:(id)a3;
+ (int64_t)eventForEventString:(id)a3;
- (BOOL)_installInProgress;
- (BOOL)_installInProgressAfterApply;
- (BOOL)_setNvramValue:(id)a3 forKey:(id)a4;
- (BOOL)_setPermissionsOnURL:(id)a3;
- (BOOL)_syncNvram;
- (BOOL)_updateRetryInformationForEvents:(id)a3;
- (BOOL)submissionPending;
- (NSDictionary)eventAttributes;
- (NSDictionary)nvramDict;
- (NSMutableArray)droppedEvents;
- (NSMutableDictionary)attributeDict;
- (NSNumber)installTonight;
- (NSString)baseServerURL;
- (NSString)brainVersion;
- (NSString)context;
- (NSString)dataMountPoint;
- (NSString)installType;
- (NSString)nvramPath;
- (NSString)systemMountPoint;
- (NSString)targetOSVersion;
- (NSString)updateMountPoint;
- (NSString)uuid;
- (UMEventRecorder)init;
- (UMEventRecorder)initWithOptions:(id)a3;
- (UMEventSubmitter)submitter;
- (double)_retryInterval;
- (double)_timeIntervalUntilRetry:(id)a3;
- (id)_copyEscapeStringsForEventData:(id)a3;
- (id)_copyUnsubmittedEventsFromDirectory:(id)a3 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:(BOOL)a4 previouslySubmittedEventSkipped:(BOOL *)a5;
- (id)_currentBaseOSVersion;
- (id)_currentEAPFSMode;
- (id)_currentOSVersion;
- (id)_currentTimeInMilliseconds;
- (id)_defaults;
- (id)_eventDirectory;
- (id)_eventDirectoryWithMountPoint:(id)a3;
- (id)_getDeviceModel;
- (id)_getDiskUsage;
- (id)_getGestaltDiskUsageKey:(__CFString *)a3 inDictionary:(id)a4;
- (id)_getGestaltString:(__CFString *)a3;
- (id)_getGestaltString:(__CFString *)a3 default:(id)a4;
- (id)_getGestaltValue:(__CFString *)a3;
- (id)_installInfoFile;
- (id)_legacyEventDirectory;
- (id)_legacyInstallInfoFile;
- (id)_legacySupportDirectory;
- (id)_loadUnsubmittedEvents;
- (id)_nvramValue:(id)a3;
- (id)_serverURL;
- (id)_submissionBodyForEvents:(id)a3;
- (id)_supportDirectory;
- (id)_supportDirectoryWithMountPoint:(id)a3;
- (id)_topic;
- (int)_serverCompatibilityVersion;
- (int64_t)_uptime;
- (unint64_t)numUnsubmittedEvents;
- (void)_cleanupInstallState;
- (void)_recordEvent:(id)a3 getPowerLog:(BOOL)a4 information:(id)a5 callback:(id)a6;
- (void)_recordEvent:(id)a3 information:(id)a4 callback:(id)a5;
- (void)_recordPowerLog:(id)a3 information:(id)a4;
- (void)_removeEvents:(id)a3;
- (void)_saveEvent:(id)a3;
- (void)_scheduleEventSubmissionRetry;
- (void)_submitEvents:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
- (void)_submitIndividualEvents:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
- (void)_writeInfoFile;
- (void)addPersistentAttribute:(id)a3 forKey:(id)a4;
- (void)commitMetadataToPersistentStorage;
- (void)commitMetadataToPersistentStorage:(id)a3;
- (void)dealloc;
- (void)recordEvent:(id)a3 information:(id)a4;
- (void)recordEvent:(id)a3 information:(id)a4 installIsComplete:(BOOL)a5;
- (void)recordPostUpdateEvent:(id)a3 additionalInfo:(id)a4;
- (void)recordPostUpdateEvent:(id)a3 additionalInfo:(id)a4 withCallback:(id)a5;
- (void)removePersistentAttributeKey:(id)a3;
- (void)setAttributeDict:(id)a3;
- (void)setBaseServerURL:(id)a3;
- (void)setBrainVersion:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataMountPoint:(id)a3;
- (void)setDroppedEvents:(id)a3;
- (void)setEventAttributes:(id)a3;
- (void)setInstallTonight:(id)a3;
- (void)setInstallType:(id)a3;
- (void)setNvramDict:(id)a3;
- (void)setNvramPath:(id)a3;
- (void)setSubmissionPending:(BOOL)a3;
- (void)setSubmitter:(id)a3;
- (void)setSystemMountPoint:(id)a3;
- (void)setTargetOSVersion:(id)a3;
- (void)setUpdateMountPoint:(id)a3;
- (void)setUuid:(id)a3;
- (void)startRecordingInstall:(id)a3;
- (void)submitEvents;
- (void)submitEventsInBackground:(BOOL)a3;
- (void)submitEventsInBackground:(BOOL)a3 withOptions:(id)a4;
- (void)submitEventsWithUpdateOptions:(id)a3;
@end

@implementation UMEventRecorder

+ (id)recorder
{
  return +[UMEventRecorder recorderWithOptions:0];
}

+ (id)recorderWithOptions:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __39__UMEventRecorder_recorderWithOptions___block_invoke;
  block[3] = &__block_descriptor_40_e8_32o_e5_v8__0l;
  block[4] = a3;
  if (recorderWithOptions__once != -1) {
    dispatch_once(&recorderWithOptions__once, block);
  }
  return (id)recorderWithOptions__recorder;
}

UMEventRecorder *__39__UMEventRecorder_recorderWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _log(a1, @"initializing new event recorder with options: %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  result = [[UMEventRecorder alloc] initWithOptions:*(void *)(a1 + 32)];
  recorderWithOptions__recorder = (uint64_t)result;
  return result;
}

+ (BOOL)diagnosticsAndUsageAllowed:(id)a3
{
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"/private/var";
  }
  v4 = +[NSDictionary dictionaryWithContentsOfFile:[(__CFString *)v3 stringByAppendingPathComponent:@"/mobile/Library/UserConfigurationProfiles/EffectiveUserSettings.plist"]];
  if (!v4) {
    v4 = +[NSDictionary dictionaryWithContentsOfFile:[(__CFString *)v3 stringByAppendingPathComponent:@"/mobile/Library/ConfigurationProfiles/EffectiveUserSettings.plist"]];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(NSDictionary *)v4 objectForKey:@"restrictedBool"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v6 = [v5 objectForKey:@"allowDiagnosticSubmission"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v7 = [v6 objectForKey:@"value"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v7 BOOLValue];
}

- (UMEventRecorder)init
{
  return [(UMEventRecorder *)self initWithOptions:0];
}

- (UMEventRecorder)initWithOptions:(id)a3
{
  v66.receiver = self;
  v66.super_class = (Class)UMEventRecorder;
  v4 = [(UMEventRecorder *)&v66 init];
  id v5 = v4;
  if (v4)
  {
    [(UMEventRecorder *)v4 setInstallType:@"ota"];
    -[UMEventRecorder setSystemMountPoint:](v5, "setSystemMountPoint:", [a3 objectForKey:@"SystemPartitionMountPath"]);
    -[UMEventRecorder setDataMountPoint:](v5, "setDataMountPoint:", [a3 objectForKey:@"DataPartitionMountPath"]);
    -[UMEventRecorder setUpdateMountPoint:](v5, "setUpdateMountPoint:", [a3 objectForKey:@"UpdatePartitionMountPath"]);
    -[UMEventRecorder setNvramPath:](v5, "setNvramPath:", [a3 objectForKey:@"NVRAMShadowPath"]);
    -[UMEventRecorder setEventAttributes:](v5, "setEventAttributes:", [a3 objectForKeyedSubscript:@"AdditionalEventAttributes"]);
    v5->_nvramDict = (NSDictionary *)+[UMEventCheckpoint lastSyncedNvram:[(UMEventRecorder *)v5 nvramPath]];
    id v6 = +[NSDictionary dictionaryWithContentsOfURL:[(UMEventRecorder *)v5 _installInfoFile]];
    if (v6)
    {
      id v7 = v6;
      [(UMEventRecorder *)v5 setUuid:[(NSDictionary *)v6 objectForKey:@"UUID"]];
      [(UMEventRecorder *)v5 setBaseServerURL:[(NSDictionary *)v7 objectForKey:@"Submission URL"]];
      v5->_targetOSVersion = (NSString *)objc_msgSend(-[NSDictionary objectForKey:](v7, "objectForKey:", @"Target OS Version"), "copy");
      v5->_context = (NSString *)objc_msgSend(-[NSDictionary objectForKey:](v7, "objectForKey:", @"Context"), "copy");
      v5->_attributeDict = (NSMutableDictionary *)objc_msgSend(-[NSDictionary objectForKey:](v7, "objectForKey:", @"Persistent Attributes"), "mutableCopy");
    }
    else
    {
      [(UMEventRecorder *)v5 setUuid:[(UMEventRecorder *)v5 _nvramValue:@"ota-uuid"]];
      [(UMEventRecorder *)v5 setBaseServerURL:[(UMEventRecorder *)v5 _nvramValue:@"ota-submission-url"]];
      v5->_targetOSVersion = (NSString *)objc_msgSend(-[UMEventRecorder _nvramValue:](v5, "_nvramValue:", @"ota-os-version"), "copy");
      v5->_context = (NSString *)objc_msgSend(-[UMEventRecorder _nvramValue:](v5, "_nvramValue:", @"ota-context"), "copy");
    }
    v5->_droppedEvents = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5->_submitter = objc_alloc_init(UMEventSubmitter);
    v5->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.UpdateMetrics.UMEventRecorderCallback", 0);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5->_submitQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.UpdateMetrics.UMEventRecorderSubmit", v8);
    v9 = [(UMEventRecorder *)v5 systemMountPoint];
    _log((uint64_t)v9, @"%@: initializing event recorder with systemMountPoint: %@", v10, v11, v12, v13, v14, v15, (uint64_t)v5);
    v16 = [(UMEventRecorder *)v5 dataMountPoint];
    _log((uint64_t)v16, @"%@: initializing event recorder with dataMountPoint: %@", v17, v18, v19, v20, v21, v22, (uint64_t)v5);
    v23 = [(UMEventRecorder *)v5 updateMountPoint];
    _log((uint64_t)v23, @"%@: initializing event recorder with updateMountPoint: %@", v24, v25, v26, v27, v28, v29, (uint64_t)v5);
    v30 = [(UMEventRecorder *)v5 nvramPath];
    _log((uint64_t)v30, @"%@: initializing event recorder with nvramPath: %@", v31, v32, v33, v34, v35, v36, (uint64_t)v5);
    v37 = [(UMEventRecorder *)v5 targetOSVersion];
    _log((uint64_t)v37, @"%@: initializing event recorder with targetOSVersion: %@", v38, v39, v40, v41, v42, v43, (uint64_t)v5);
    v44 = [(UMEventRecorder *)v5 context];
    _log((uint64_t)v44, @"%@: initializing event recorder with context: %@", v45, v46, v47, v48, v49, v50, (uint64_t)v5);
    v51 = [(UMEventRecorder *)v5 baseServerURL];
    _log((uint64_t)v51, @"%@: initializing event recorder with baseServerURL: %@", v52, v53, v54, v55, v56, v57, (uint64_t)v5);
    v65 = [(UMEventRecorder *)v5 uuid];
    _log((uint64_t)v65, @"%@: initializing event recorder with uuid: %@", v58, v59, v60, v61, v62, v63, (uint64_t)v5);
  }
  return v5;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_callbackQueue);
  dispatch_release((dispatch_object_t)self->_submitQueue);
  v3.receiver = self;
  v3.super_class = (Class)UMEventRecorder;
  [(UMEventRecorder *)&v3 dealloc];
}

- (id)_defaults
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UpdateMetrics"];
  return v2;
}

- (id)_topic
{
  return @"psr_ota";
}

- (int)_serverCompatibilityVersion
{
  return 2;
}

- (id)_serverURL
{
  id v2 = +[NSString stringWithFormat:@"%@/%d/%@", [(UMEventRecorder *)self baseServerURL], [(UMEventRecorder *)self _serverCompatibilityVersion], [(UMEventRecorder *)self _topic]];
  id result = +[NSURL URLWithString:v2];
  if (!result)
  {
    _log(0, @"Malformed URL for update metrics event reporting - %@", v4, v5, v6, v7, v8, v9, (uint64_t)v2);
    return +[NSURL URLWithString:@"https://xp.apple.com/report/2/psr_ota"];
  }
  return result;
}

- (id)_legacySupportDirectory
{
  if ([(UMEventRecorder *)self dataMountPoint]) {
    CFStringRef v3 = [(UMEventRecorder *)self dataMountPoint];
  }
  else {
    CFStringRef v3 = @"/var";
  }
  return [(UMEventRecorder *)self _supportDirectoryWithMountPoint:v3];
}

- (id)_supportDirectory
{
  _log((uint64_t)self, @"Permanent update volume present..supportDir will be placed there", v2, v3, v4, v5, v6, v7, v11);
  uint64_t v9 = [(UMEventRecorder *)self updateMountPoint];
  return [(UMEventRecorder *)self _supportDirectoryWithMountPoint:v9];
}

- (id)_supportDirectoryWithMountPoint:(id)a3
{
  uint64_t v18 = 0;
  if (a3) {
    CFStringRef v8 = (const __CFString *)a3;
  }
  else {
    CFStringRef v8 = @"/var/MobileSoftwareUpdate";
  }
  if (!a3) {
    _log((uint64_t)self, @"%s: mountPoint is nil...Using %@ as the mountPoint", 0, v3, v4, v5, v6, v7, (uint64_t)"-[UMEventRecorder _supportDirectoryWithMountPoint:]");
  }
  uint64_t v9 = [+[NSURL fileURLWithPath:v8] URLByAppendingPathComponent:@"db/UpdateMetrics"];
  v19[0] = NSFileOwnerAccountName;
  v19[1] = NSFileGroupOwnerAccountName;
  v20[0] = @"mobile";
  v20[1] = @"mobile";
  v19[2] = NSFileProtectionKey;
  v20[2] = NSFileProtectionNone;
  uint64_t v10 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:+[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3] error:&v18];
  if ((v10 & 1) == 0) {
    _log(v10, @"%s: unable to create support directory at path:%@ error:%@", v11, v12, v13, v14, v15, v16, (uint64_t)"-[UMEventRecorder _supportDirectoryWithMountPoint:]");
  }
  return v9;
}

- (id)_legacyInstallInfoFile
{
  id v2 = [(UMEventRecorder *)self _legacySupportDirectory];
  return [v2 URLByAppendingPathComponent:@"ota-info.plist"];
}

- (id)_installInfoFile
{
  id v2 = [(UMEventRecorder *)self _supportDirectory];
  return [v2 URLByAppendingPathComponent:@"ota-info.plist"];
}

- (double)_retryInterval
{
  return 960.0;
}

- (BOOL)_setPermissionsOnURL:(id)a3
{
  uint64_t v20 = 0;
  v21[0] = NSFileOwnerAccountName;
  v21[1] = NSFileGroupOwnerAccountName;
  v22[0] = @"mobile";
  v22[1] = @"mobile";
  v21[2] = NSFilePosixPermissions;
  v21[3] = NSFileProtectionKey;
  v22[2] = +[NSNumber numberWithInt:438];
  v22[3] = NSFileProtectionNone;
  uint64_t v4 = -[NSFileManager setAttributes:ofItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4), [a3 path], &v20);
  if ((v4 & 1) == 0) {
    _log(v4, @"unable to set permissions on %@: %@", v5, v6, v7, v8, v9, v10, (uint64_t)a3);
  }
  uint64_t v11 = (uint64_t)objc_msgSend(a3, "setResourceValue:forKey:error:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), NSURLIsExcludedFromBackupKey, &v20);
  BOOL v18 = v11;
  if ((v11 & 1) == 0) {
    _log(v11, @"unable to disable backup for %@: %@", v12, v13, v14, v15, v16, v17, (uint64_t)a3);
  }
  return v18;
}

- (id)_legacyEventDirectory
{
  if ([(UMEventRecorder *)self dataMountPoint]) {
    CFStringRef v3 = [(UMEventRecorder *)self dataMountPoint];
  }
  else {
    CFStringRef v3 = @"/var";
  }
  return [(UMEventRecorder *)self _eventDirectoryWithMountPoint:v3];
}

- (id)_eventDirectory
{
  CFStringRef v3 = [(UMEventRecorder *)self updateMountPoint];
  return [(UMEventRecorder *)self _eventDirectoryWithMountPoint:v3];
}

- (id)_eventDirectoryWithMountPoint:(id)a3
{
  uint64_t v24 = 0;
  unsigned __int8 v23 = 0;
  id v3 = objc_msgSend(-[UMEventRecorder _supportDirectoryWithMountPoint:](self, "_supportDirectoryWithMountPoint:", a3), "URLByAppendingPathComponent:", @"Events");
  v25[0] = NSFileOwnerAccountName;
  v25[1] = NSFileGroupOwnerAccountName;
  v26[0] = @"mobile";
  v26[1] = @"mobile";
  v25[2] = NSFilePosixPermissions;
  v25[3] = NSFileProtectionKey;
  v26[2] = +[NSNumber numberWithInt:511];
  v26[3] = NSFileProtectionNone;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  unsigned int v5 = -[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", [v3 path], &v23);
  int v6 = v23;
  uint64_t v7 = +[NSFileManager defaultManager];
  if (v5 && v6)
  {
    uint64_t v8 = -[NSFileManager setAttributes:ofItemAtPath:error:](v7, "setAttributes:ofItemAtPath:error:", v4, [v3 path], &v24);
    if ((v8 & 1) == 0) {
      _log(v8, @"unable to set attributes on directory for update events: %@", v9, v10, v11, v12, v13, v14, v24);
    }
  }
  else
  {
    uint64_t v15 = [(NSFileManager *)v7 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:v4 error:&v24];
    if ((v15 & 1) == 0) {
      _log(v15, @"unable to create directory for update events: %@", v16, v17, v18, v19, v20, v21, v24);
    }
  }
  return v3;
}

- (id)_getGestaltValue:(__CFString *)a3
{
  id v3 = (void *)MGCopyAnswer();
  return v3;
}

- (id)_getGestaltString:(__CFString *)a3 default:(id)a4
{
  id v5 = [(UMEventRecorder *)self _getGestaltValue:a3];
  if (!v5) {
    return a4;
  }
  int v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a4;
  }
  return v6;
}

- (id)_getGestaltString:(__CFString *)a3
{
  return [(UMEventRecorder *)self _getGestaltString:a3 default:@"unknown"];
}

- (id)_getGestaltDiskUsageKey:(__CFString *)a3 inDictionary:(id)a4
{
  uint64_t v4 = (uint64_t)objc_msgSend(objc_msgSend(a4, "objectForKey:", a3), "longLongValue");
  return +[NSNumber numberWithLongLong:v4 / 0x100000];
}

- (id)_getDiskUsage
{
  id v3 = [(UMEventRecorder *)self systemMountPoint];
  if (v3 || (id v3 = [(UMEventRecorder *)self dataMountPoint]) != 0)
  {
    BOOL v11 = is_storage_apfs((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    id v12 = +[NSMutableDictionary dictionary];
    bzero(&v53, 0x878uLL);
    bzero(&v52, 0x878uLL);
    if ([(UMEventRecorder *)self systemMountPoint])
    {
      statfs([(NSString *)[(UMEventRecorder *)self systemMountPoint] fileSystemRepresentation], &v53);
      if (v11)
      {
        v50[2] = 0;
        memset(v51, 0, 12);
        v50[0] = 5;
        v50[1] = 2155872256;
        if (getattrlist([(NSString *)[(UMEventRecorder *)self systemMountPoint] fileSystemRepresentation], v50, v51, 0xCuLL, 0))
        {
          uint64_t v13 = __error();
          logfunction(", 1, @"getattrlist(ATTR_VOL_SPACEUSED) to get filesystem used space failed: %d\n"", v14, v15, v16, v17, v18, *v13);
          uint64_t v19 = (v53.f_blocks - v53.f_bfree) * v53.f_bsize;
        }
        else
        {
          uint64_t v19 = *(void *)((char *)v51 + 4);
        }
        uint64_t v41 = +[NSNumber numberWithLongLong:v19];
        [v12 setObject:v41 forKeyedSubscript:kMGQDiskUsageTotalSystemCapacity];
        uint64_t v24 = +[NSNumber numberWithInt:0];
      }
      else
      {
        unsigned __int8 v23 = +[NSNumber numberWithLongLong:v53.f_blocks * v53.f_bsize];
        [v12 setObject:v23 forKeyedSubscript:kMGQDiskUsageTotalSystemCapacity];
        uint64_t v24 = +[NSNumber numberWithLongLong:v53.f_bavail * v53.f_bsize];
      }
      [v12 setObject:v24 forKeyedSubscript:kMGQDiskUsageTotalSystemAvailable];
      uint64_t v22 = v53.f_blocks * v53.f_bsize;
    }
    else
    {
      uint64_t v20 = +[NSNumber numberWithInt:0];
      [v12 setObject:v20 forKeyedSubscript:kMGQDiskUsageTotalSystemCapacity];
      uint64_t v21 = +[NSNumber numberWithInt:0];
      [v12 setObject:v21 forKeyedSubscript:kMGQDiskUsageTotalSystemAvailable];
      uint64_t v22 = 0;
    }
    if ([(UMEventRecorder *)self dataMountPoint])
    {
      statfs([(NSString *)[(UMEventRecorder *)self dataMountPoint] fileSystemRepresentation], &v52);
      if (v11)
      {
        uint64_t v42 = +[NSNumber numberWithLongLong:v52.f_blocks * v52.f_bsize];
        [v12 setObject:v42 forKeyedSubscript:kMGQDiskUsageTotalDataCapacity];
        uint64_t f_bsize = v52.f_bsize;
        uint64_t v22 = v52.f_blocks * v52.f_bsize;
      }
      else
      {
        if (v53.f_blocks) {
          p_f_bfree = &v53.f_bfree;
        }
        else {
          p_f_bfree = &v52.f_blocks;
        }
        uint64_t v47 = +[NSNumber numberWithLongLong:*p_f_bfree * v52.f_bsize];
        [v12 setObject:v47 forKeyedSubscript:kMGQDiskUsageTotalDataCapacity];
        uint64_t f_bsize = v52.f_bsize;
        v22 += v52.f_blocks * v52.f_bsize;
      }
      uint64_t v45 = +[NSNumber numberWithLongLong:v52.f_bavail * f_bsize];
    }
    else
    {
      v44 = +[NSNumber numberWithInt:0];
      [v12 setObject:v44 forKeyedSubscript:kMGQDiskUsageTotalDataCapacity];
      uint64_t v45 = +[NSNumber numberWithInt:0];
    }
    [v12 setObject:v45 forKeyedSubscript:kMGQDiskUsageTotalDataAvailable];
    uint64_t v40 = v22;
    goto LABEL_26;
  }
  if (&_os_variant_is_recovery)
  {
    uint64_t is_recovery = os_variant_is_recovery();
    if (is_recovery)
    {
      if (!is_storage_apfs(is_recovery, v26, v27, v28, v29, v30, v31, v32)) {
        return 0;
      }
      *(void *)&v53.uint64_t f_bsize = 0;
      *(void *)&v52.uint64_t f_bsize = 0;
      v50[0] = 0;
      v51[0] = 0;
      get_main_container_space_info(&v53, &v52, 0, v50, v51, v33, v34, v35);
      id v12 = +[NSMutableDictionary dictionary];
      uint64_t v36 = +[NSNumber numberWithLongLong:*(void *)&v53.f_bsize];
      [v12 setObject:v36 forKeyedSubscript:kMGQDiskUsageTotalSystemCapacity];
      v37 = +[NSNumber numberWithInt:0];
      [v12 setObject:v37 forKeyedSubscript:kMGQDiskUsageTotalSystemAvailable];
      uint64_t v38 = +[NSNumber numberWithLongLong:v50[0] + *(void *)&v52.f_bsize];
      [v12 setObject:v38 forKeyedSubscript:kMGQDiskUsageTotalDataCapacity];
      uint64_t v39 = +[NSNumber numberWithLongLong:v50[0]];
      [v12 setObject:v39 forKeyedSubscript:kMGQDiskUsageTotalDataAvailable];
      uint64_t v40 = v51[0];
LABEL_26:
      uint64_t v48 = +[NSNumber numberWithLongLong:v40];
      [v12 setObject:v48 forKeyedSubscript:kMGQDiskUsageTotalDiskCapacity];
      return v12;
    }
  }
  return [(UMEventRecorder *)self _getGestaltValue:@"DiskUsage"];
}

- (id)_currentOSVersion
{
  id result = [(UMEventRecorder *)self _getGestaltString:@"SupplementalBuildVersion" default:0];
  if (!result)
  {
    return [(UMEventRecorder *)self _currentBaseOSVersion];
  }
  return result;
}

- (id)_currentBaseOSVersion
{
  return [(UMEventRecorder *)self _getGestaltString:@"BuildVersion"];
}

- (id)_currentTimeInMilliseconds
{
  [+[NSDate date] timeIntervalSince1970];
  return +[NSString stringWithFormat:@"%llu", (unint64_t)(v2 * 1000.0)];
}

- (int64_t)_uptime
{
  *(void *)uint64_t v6 = 0x1500000001;
  v4[0] = 0;
  v4[1] = 0;
  size_t v5 = 16;
  int v2 = sysctl(v6, 2u, v4, &v5, 0, 0);
  int64_t result = 0;
  if (!v2) {
    return time(0) - v4[0];
  }
  return result;
}

- (id)_currentEAPFSMode
{
  if (_currentEAPFSMode_onceToken != -1) {
    dispatch_once(&_currentEAPFSMode_onceToken, &__block_literal_global_16);
  }
  return _currentEAPFSMode_eapfsMode;
}

void __36__UMEventRecorder__currentEAPFSMode__block_invoke(id a1)
{
  bzero(v2, 0x40CuLL);
  v1[2] = 0;
  v1[0] = 5;
  v1[1] = 2147491840;
  if (getattrlist("/private/var/mobile", v1, v2, 0x40CuLL, 0) != -1)
  {
    if ([+[NSString stringWithCString:(char *)v3 + v3[0] encoding:4] isEqualToString:@"User"])
    {
      _currentEAPFSMode_eapfsMode = @"YES";
    }
  }
}

- (void)_saveEvent:(id)a3
{
  id v5 = objc_msgSend(-[UMEventRecorder _serverURL](self, "_serverURL"), "absoluteString");
  if (v5)
  {
    id v12 = v5;
    uint64_t v13 = [(UMEventRecorder *)self uuid];
    if (v13)
    {
      uint64_t v14 = v13;
      v55[0] = @"Event Data";
      v55[1] = @"Install Id";
      v56[0] = a3;
      v56[1] = v13;
      v55[2] = @"Submission URL";
      v56[2] = v12;
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
      uint64_t v16 = &APFSContainerGetSpaceInfo_ptr;
      id v17 = objc_msgSend(-[UMEventRecorder _eventDirectory](self, "_eventDirectory"), "URLByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%@-%@-%d.plist", v14, objc_msgSend(a3, "objectForKey:", @"event"), objc_msgSend(a3, "objectForKey:", @"eventTime"), 0));
      if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [v17 path]))
      {
        uint64_t v18 = 1;
        do
        {
          uint64_t v19 = v16;
          id v17 = objc_msgSend(-[UMEventRecorder _eventDirectory](self, "_eventDirectory"), "URLByAppendingPathComponent:", objc_msgSend(v16[432], "stringWithFormat:", @"%@-%@-%@-%d.plist", v14, objc_msgSend(a3, "objectForKey:", @"event"), objc_msgSend(a3, "objectForKey:", @"eventTime"), v18));
          uint64_t v20 = +[NSFileManager defaultManager];
          id v21 = [v17 path];
          uint64_t v22 = v20;
          uint64_t v16 = v19;
          uint64_t v18 = (v18 + 1);
        }
        while ([(NSFileManager *)v22 fileExistsAtPath:v21]);
      }
      unsigned __int8 v23 = +[NSPropertyListSerialization dataWithPropertyList:v15 format:200 options:0 error:0];
      if (v23)
      {
        uint64_t v54 = 0;
        uint64_t v30 = [(NSData *)v23 writeToURL:v17 options:1 error:&v54];
        if (v30)
        {
          [(UMEventRecorder *)self _setPermissionsOnURL:v17];
        }
        else
        {
          _log(v30, @"ERROR - unable to write event to file: '%@'", v31, v32, v33, v34, v35, v36, v54);
          _log(v45, @"will try to keep the event in memory and send later", v46, v47, v48, v49, v50, v51, v53);
          [(NSMutableArray *)[(UMEventRecorder *)self droppedEvents] addObject:v15];
        }
      }
      else
      {
        _log(0, @"ERROR - unable to create property list from dictionary: %@", v24, v25, v26, v27, v28, v29, (uint64_t)v15);
        _log(v38, @"discarding event", v39, v40, v41, v42, v43, v44, v52);
      }
      return;
    }
    CFStringRef v37 = @"Malformed UUID for update metrics event reporting - discarding event";
  }
  else
  {
    CFStringRef v37 = @"Malformed URL for update metrics event reporting - discarding event";
  }
  _log(0, (uint64_t)v37, v6, v7, v8, v9, v10, v11, v58);
}

- (void)_recordEvent:(id)a3 information:(id)a4 callback:(id)a5
{
}

- (void)_recordEvent:(id)a3 getPowerLog:(BOOL)a4 information:(id)a5 callback:(id)a6
{
  BOOL v8 = a4;
  if (![(UMEventRecorder *)self baseServerURL])
  {
    _log(0, @"event reporting is not enabled, discarding event (%@) - %@\n", v11, v12, v13, v14, v15, v16, (uint64_t)a3);
    return;
  }
  if ([(UMEventRecorder *)self attributeDict]) {
    id v17 = [(NSMutableDictionary *)[(UMEventRecorder *)self attributeDict] mutableCopy];
  }
  else {
    id v17 = +[NSMutableDictionary dictionary];
  }
  uint64_t v18 = v17;
  if (a5) {
    [v17 addEntriesFromDictionary:a5];
  }
  objc_msgSend(v18, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1), @"reportVersion");
  [v18 setObject:a3 forKey:@"event"];
  objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder installType](self, "installType"), @"type");
  objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _currentTimeInMilliseconds](self, "_currentTimeInMilliseconds"), @"eventTime");
  objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _getGestaltString:](self, "_getGestaltString:", @"DeviceClass"), @"deviceClass");
  objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _getDeviceModel](self, "_getDeviceModel"), @"deviceModel");
  objc_msgSend(v18, "setObject:forKey:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", -[UMEventRecorder _uptime](self, "_uptime")), @"uptime");
  CFStringRef v19 = [(UMEventRecorder *)self _getGestaltValue:@"BatteryCurrentCapacity"];
  if (!v19 || (CFStringRef v20 = v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    CFStringRef v20 = @"unknown";
  }
  [v18 setObject:v20 forKey:@"batteryLevel"];
  CFStringRef v21 = [(UMEventRecorder *)self _getGestaltValue:@"BatteryIsCharging"];
  if (!v21 || (CFStringRef v22 = v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    CFStringRef v22 = @"unknown";
  }
  [v18 setObject:v22 forKey:@"batteryIsCharging"];
  id v23 = [(UMEventRecorder *)self _getDiskUsage];
  if (v23 && (id v24 = v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _getGestaltDiskUsageKey:inDictionary:](self, "_getGestaltDiskUsageKey:inDictionary:", kMGQDiskUsageTotalDiskCapacity, v24), @"storageCapacity");
    objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _getGestaltDiskUsageKey:inDictionary:](self, "_getGestaltDiskUsageKey:inDictionary:", kMGQDiskUsageTotalSystemCapacity, v24), @"systemFsCapacity");
    objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _getGestaltDiskUsageKey:inDictionary:](self, "_getGestaltDiskUsageKey:inDictionary:", kMGQDiskUsageTotalSystemAvailable, v24), @"systemFsFree");
    objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _getGestaltDiskUsageKey:inDictionary:](self, "_getGestaltDiskUsageKey:inDictionary:", kMGQDiskUsageTotalDataCapacity, v24), @"dataFsCapacity");
    CFStringRef v25 = [(UMEventRecorder *)self _getGestaltDiskUsageKey:kMGQDiskUsageTotalDataAvailable inDictionary:v24];
    uint64_t v26 = v18;
  }
  else
  {
    [v18 setObject:@"unknown" forKey:@"storageCapacity"];
    [v18 setObject:@"unknown" forKey:@"systemFsCapacity"];
    [v18 setObject:@"unknown" forKey:@"systemFsFree"];
    [v18 setObject:@"unknown" forKey:@"dataFsCapacity"];
    uint64_t v26 = v18;
    CFStringRef v25 = @"unknown";
  }
  [v26 setObject:v25 forKey:@"dataFsFree"];
  objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _currentOSVersion](self, "_currentOSVersion"), @"currentOSVersion");
  objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _currentBaseOSVersion](self, "_currentBaseOSVersion"), @"currentBaseOSVersion");
  CFStringRef v27 = [(UMEventRecorder *)self _getGestaltString:@"ProductVersionExtra" default:0];
  if (v27) {
    CFStringRef v28 = v27;
  }
  else {
    CFStringRef v28 = @"unknown";
  }
  if (v27) {
    CFStringRef v29 = @"true";
  }
  else {
    CFStringRef v29 = @"false";
  }
  [v18 setObject:v28 forKey:@"currentProductVersionExtra"];
  [v18 setObject:v29 forKey:@"rapidSecurityResponseInstalled"];
  id v30 = [(UMEventRecorder *)self _getGestaltString:@"ReleaseType" default:@"user"];
  [v18 setObject:v30 forKey:@"currentOSType"];
  if ([(UMEventRecorder *)self targetOSVersion]) {
    objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder targetOSVersion](self, "targetOSVersion"), @"targetOSVersion");
  }
  if ([v18 objectForKeyedSubscript:@"installTonight"])
  {
    [v18 objectForKeyedSubscript:@"installTonight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UMEventRecorder setInstallTonight:](self, "setInstallTonight:", [v18 objectForKeyedSubscript:@"installTonight"]);
    }
  }
  objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder _currentEAPFSMode](self, "_currentEAPFSMode"), @"eapfsMode");
  if ([(UMEventRecorder *)self context]) {
    objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder context](self, "context"), @"context");
  }
  if ([(UMEventRecorder *)self brainVersion]) {
    objc_msgSend(v18, "setObject:forKey:", -[UMEventRecorder brainVersion](self, "brainVersion"), @"brainVersion");
  }
  id v31 = [(UMEventRecorder *)self _nvramValue:@"usermanagerd"];
  if (v31) {
    [v18 setObject:v31 forKeyedSubscript:@"usermanagerdNVRAM"];
  }
  uint64_t v32 = (NSString *)[v18 objectForKeyedSubscript:@"MobileAssetAssetAudience"];
  if (v32 && (objc_opt_class(), uint64_t isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) != 0))
  {
    _log(isKindOfClass, @"Using assetAudience passed in by upper layer(%@) for splunk event", v34, v35, v36, v37, v38, v39, (uint64_t)v32);
    id v40 = [v18 setObject:v32 forKey:@"MobileAssetAssetAudience"];
  }
  else
  {
    TypeID = CFPreferencesCopyAppValue(@"MobileAssetAssetAudience", @"com.apple.MobileAsset");
    uint64_t v54 = TypeID;
    if (TypeID && (CFTypeID v55 = CFGetTypeID(TypeID), TypeID = (const void *)CFStringGetTypeID(), (const void *)v55 == TypeID))
    {
      _log((uint64_t)TypeID, @"Asset audience default is %@", v48, v49, v50, v51, v52, v53, (uint64_t)v54);
      [v18 setObject:v54 forKey:@"MobileAssetAssetAudience"];
    }
    else
    {
      _log((uint64_t)TypeID, @"Unable to determine asset audience from defaults. Assuming default audience for build in use", v48, v49, v50, v51, v52, v53, v56);
      if (!v32) {
        uint64_t v32 = +[NSString stringWithFormat:@"DefaultAssetAudienceForReleaseType%@", v30];
      }
      id v40 = [v18 setObject:v32 forKey:@"MobileAssetAssetAudience"];
      if (!v54) {
        goto LABEL_45;
      }
    }
    CFRelease(v54);
  }
LABEL_45:
  _log((uint64_t)v40, @"[%s] (%@) - %@\n", v41, v42, v43, v44, v45, v46, (uint64_t)"-[UMEventRecorder _recordEvent:getPowerLog:information:callback:]");
  [(UMEventRecorder *)self _saveEvent:v18];
  if (v8) {
    [(UMEventRecorder *)self _recordPowerLog:a3 information:v18];
  }
  if (a6) {
    (*((void (**)(id, void *))a6 + 2))(a6, v18);
  }
}

- (void)_recordPowerLog:(id)a3 information:(id)a4
{
  id v6 = +[NSMutableDictionary dictionary];
  objc_msgSend(v6, "setObject:forKey:", -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"), @"RequestUUID");
  if (a4) {
    [v6 addEntriesFromDictionary:a4];
  }
  if (a3) {
    objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[UMEventRecorder eventForEventString:](UMEventRecorder, "eventForEventString:", a3)), @"event");
  }
  if (&_PLLogRegisteredEvent)
  {
    logfunction(", 1, @"Sending event to PowerLog: %@\n"", v7, v8, v9, v10, v11, (char)v6);
    PLLogRegisteredEvent();
  }
}

+ (int64_t)eventForEventString:(id)a3
{
  if ([a3 isEqualToString:@"purge"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"preflightScan"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"preflightDownload"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"preflightPersonalize"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"preflightFDR"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"preflightWakeup"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"preflightPrerequisiteCheck"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"prepareStarted"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"prepareFinished"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"applyStarted"]) {
    return 9;
  }
  if ([a3 isEqualToString:@"applyFinished"]) {
    return 10;
  }
  if ([a3 isEqualToString:@"CryptegraftStarted"]) {
    return 11;
  }
  if ([a3 isEqualToString:@"CryptegraftFinshed"]) {
    return 12;
  }
  if ([a3 isEqualToString:@"updateFinished"]) {
    return 13;
  }
  return 100;
}

- (id)_nvramValue:(id)a3
{
  nvramDict = self->_nvramDict;
  if (nvramDict) {
    CFTypeRef v5 = [(NSDictionary *)nvramDict objectForKey:a3];
  }
  else {
    CFTypeRef v5 = copy_nvram_variable((const __CFString *)a3);
  }
  id v6 = (void *)v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (const char *)[v6 bytes];
    id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v7, strnlen(v7, (size_t)objc_msgSend(v6, "length")), 4);
LABEL_8:
    uint64_t v16 = v8;
    goto LABEL_12;
  }
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v8 = [v6 copy];
    goto LABEL_8;
  }
  if (v6) {
    _log(isKindOfClass, @"NVRAM variable %@ has unexpected value '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)a3);
  }
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

- (BOOL)_setNvramValue:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    uint64_t v9 = set_nvram_object((const __CFString *)a4, (BOOL)a3, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
    if (v9) {
      return 1;
    }
  }
  else
  {
    uint64_t v9 = delete_nvram_variable((const __CFString *)a4);
    if (v9) {
      return 1;
    }
  }
  _log(v9, @"unable to set %@ to %@", v10, v11, v12, v13, v14, v15, (uint64_t)a4);
  return 0;
}

- (BOOL)_syncNvram
{
  BOOL v8 = msu_sync_nvram(1, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  BOOL v15 = v8;
  if (!v8) {
    _log(v8, @"unable to sync nvram", v9, v10, v11, v12, v13, v14, v17);
  }
  return v15;
}

- (BOOL)_installInProgress
{
  return !access((const char *)objc_msgSend(-[UMEventRecorder _installInfoFile](self, "_installInfoFile"), "fileSystemRepresentation"), 0)|| -[UMEventRecorder uuid](self, "uuid") != 0;
}

- (BOOL)_installInProgressAfterApply
{
  CFTypeRef v2 = copy_nvram_variable(@"ota-uuid");
  uint64_t v9 = v2;
  if (v2)
  {
    _log((uint64_t)v2, @"InstallInProgressAfterApply is true", v3, v4, v5, v6, v7, v8, v11);
    CFRelease(v9);
  }
  else
  {
    _log(0, @"InstallInProgressAfterApply is false\n", v3, v4, v5, v6, v7, v8, v11);
  }
  return v9 != 0;
}

- (void)_cleanupInstallState
{
  BOOL v3 = msu_nvram_exists(@"ota-uuid");
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-uuid"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-result"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-failure-reason"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-breadcrumbs"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-submission-url"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-os-version"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-original-os-version"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-original-base-os-version"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-install-tonight"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-context"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-brain-version"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"OTA-pre-conversion"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"OTA-post-conversion"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-conv-panic-indicator"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"OTA-fsck-metrics"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"OTA-sealvolume-metrics"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"OTA-migrator-metrics"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"OTA-converter-metrics"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-forced-reset-uptime"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-initial-forced-reset-uptime"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ramrod-nvram-sequence"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-snapshot-update"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"pre-recovery-ota-failure-uuid"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"recoveryos-initiated-update"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-controllerVersion"];
  [(UMEventRecorder *)self _setNvramValue:0 forKey:@"ota-updateType"];
  if (v3)
  {
    BOOL v4 = msu_nvram_exists(@"ota-uuid");
    if (v4)
    {
      _log(v4, @"Value for %@ was not cleared, not syncing", v5, v6, v7, v8, v9, v10, @"ota-uuid");
    }
    else
    {
      _log(v4, @"syncing nvram to clear %@", v5, v6, v7, v8, v9, v10, @"ota-uuid");
      [(UMEventRecorder *)self _syncNvram];
    }
  }
  [(UMEventRecorder *)self setUuid:0];
  [(UMEventRecorder *)self setBaseServerURL:0];
  [(UMEventRecorder *)self setTargetOSVersion:0];
  [(UMEventRecorder *)self setContext:0];
  [(UMEventRecorder *)self setAttributeDict:0];
  if (unlink((const char *)objc_msgSend(-[UMEventRecorder _installInfoFile](self, "_installInfoFile"), "fileSystemRepresentation"))&& *__error() != 2)
  {
    id v11 = [(UMEventRecorder *)self _installInfoFile];
    uint64_t v12 = __error();
    CFStringRef v27 = strerror(*v12);
    _log((uint64_t)v27, @"unable to remove %@: %s", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
  }
  if (unlink((const char *)objc_msgSend(-[UMEventRecorder _legacyInstallInfoFile](self, "_legacyInstallInfoFile"), "fileSystemRepresentation")))
  {
    if (*__error() != 2)
    {
      id v19 = [(UMEventRecorder *)self _installInfoFile];
      CFStringRef v20 = __error();
      CFStringRef v28 = strerror(*v20);
      _log((uint64_t)v28, @"unable to remove %@: %s", v21, v22, v23, v24, v25, v26, (uint64_t)v19);
    }
  }
}

- (void)_writeInfoFile
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(UMEventRecorder *)self baseServerURL]) {
    objc_msgSend(v3, "setObject:forKey:", -[UMEventRecorder baseServerURL](self, "baseServerURL"), @"Submission URL");
  }
  if ([(UMEventRecorder *)self uuid]) {
    objc_msgSend(v3, "setObject:forKey:", -[UMEventRecorder uuid](self, "uuid"), @"UUID");
  }
  if ([(UMEventRecorder *)self targetOSVersion]) {
    objc_msgSend(v3, "setObject:forKey:", -[UMEventRecorder targetOSVersion](self, "targetOSVersion"), @"Target OS Version");
  }
  if ([(UMEventRecorder *)self context]) {
    objc_msgSend(v3, "setObject:forKey:", -[UMEventRecorder context](self, "context"), @"Context");
  }
  if ([(UMEventRecorder *)self attributeDict]
    && [(NSMutableDictionary *)[(UMEventRecorder *)self attributeDict] count])
  {
    objc_msgSend(v3, "setObject:forKey:", -[UMEventRecorder attributeDict](self, "attributeDict"), @"Persistent Attributes");
  }
  id v4 = objc_msgSend(v3, "writeToURL:atomically:", -[UMEventRecorder _installInfoFile](self, "_installInfoFile"), 1);
  if (v4)
  {
    id v11 = [(UMEventRecorder *)self _installInfoFile];
    [(UMEventRecorder *)self _setPermissionsOnURL:v11];
  }
  else
  {
    _log((uint64_t)v4, @"unable to write install info file", v5, v6, v7, v8, v9, v10, v13);
  }
}

- (void)startRecordingInstall:(id)a3
{
  id v5 = [a3 objectForKey:@"Build"];
  if (v5 || (id v5 = [a3 objectForKey:@"TargetUpdate"]) != 0)
  {
    if ([(UMEventRecorder *)self _installInProgress])
    {
      uint64_t v12 = [(NSString *)self->_targetOSVersion isEqualToString:v5];
      if ((v12 & 1) == 0)
      {
        _log(v12, @"startRecordingInstall for %@ found an install currently in progress for %@", v13, v14, v15, v16, v17, v18, (uint64_t)v5);
        [(UMEventRecorder *)self recordEvent:@"incompleteInstall" information:0 installIsComplete:1];
      }
    }
    id v19 = [a3 objectForKey:@"BrainVersion"];
    if (v19) {
      [(UMEventRecorder *)self setBrainVersion:v19];
    }
    CFStringRef v20 = (const __CFString *)objc_msgSend(-[UMEventRecorder _defaults](self, "_defaults"), "stringForKey:", @"EventRecordingServiceURL");
    if (!v20)
    {
      CFStringRef v20 = (const __CFString *)[a3 objectForKey:@"_EventRecordingServiceURL"];
      if (!v20)
      {
        CFStringRef v20 = @"https://xp.apple.com/report";
        _log(0, @"no url provided - defaulting to %@", v21, v22, v23, v24, v25, v26, @"https://xp.apple.com/report");
      }
    }
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      [(UMEventRecorder *)self setBaseServerURL:v20];
      if (!v20) {
        return;
      }
      [(UMEventRecorder *)self setTargetOSVersion:v5];
      uint64_t v34 = (NSString *)[a3 objectForKey:@"UpdateUUID"];
      if (v34)
      {
        uint64_t v35 = v34;
        objc_opt_class();
        uint64_t v36 = objc_opt_isKindOfClass();
        if ((v36 & 1) == 0)
        {
LABEL_26:
          _log(v36, @"setting uuid in startRecordingInstall to %@", v37, v38, v39, v40, v41, v42, (uint64_t)v35);
          [(UMEventRecorder *)self setUuid:v35];
          -[UMEventRecorder setContext:](self, "setContext:", objc_msgSend(-[UMEventRecorder _defaults](self, "_defaults"), "stringForKey:", @"Context"));
          [(UMEventRecorder *)self _writeInfoFile];
          return;
        }
        id v43 = [objc_alloc((Class)NSUUID) initWithUUIDString:v35];
        if (v43)
        {

          goto LABEL_26;
        }
        _log(0, @"unable to convert provided uuid string (%@) to a valid NSUUID class, setting uuid to nil", v44, v45, v46, v47, v48, v49, (uint64_t)v35);
      }
      uint64_t v35 = [+[NSUUID UUID] UUIDString];
      _log((uint64_t)v35, @"generated a new uuid string %@", v50, v51, v52, v53, v54, v55, (uint64_t)v35);
      goto LABEL_26;
    }
    _log(isKindOfClass, @"bogus event service URL %@", v28, v29, v30, v31, v32, v33, (uint64_t)v20);
    [(UMEventRecorder *)self setBaseServerURL:0];
  }
  else
  {
    _log(0, @"asset attributes do not include build - update metrics disabled", v6, v7, v8, v9, v10, v11, v57);
  }
}

- (void)addPersistentAttribute:(id)a3 forKey:(id)a4
{
  uint64_t v7 = [(UMEventRecorder *)self _installInProgress];
  if (v7)
  {
    if ([(UMEventRecorder *)self attributeDict]) {
      [(NSMutableDictionary *)[(UMEventRecorder *)self attributeDict] setObject:a3 forKey:a4];
    }
    else {
      [(UMEventRecorder *)self setAttributeDict:+[NSMutableDictionary dictionaryWithObject:a3 forKey:a4]];
    }
    [(UMEventRecorder *)self _writeInfoFile];
  }
  else
  {
    _log(v7, @"Attempt to save attribute %@ when install not in progres", v8, v9, v10, v11, v12, v13, (uint64_t)a4);
  }
}

- (void)removePersistentAttributeKey:(id)a3
{
  if ([(UMEventRecorder *)self attributeDict])
  {
    [(NSMutableDictionary *)[(UMEventRecorder *)self attributeDict] removeObjectForKey:a3];
    [(UMEventRecorder *)self _writeInfoFile];
  }
}

- (void)recordEvent:(id)a3 information:(id)a4 installIsComplete:(BOOL)a5
{
  BOOL v5 = a5;
  [(UMEventRecorder *)self recordEvent:a3 information:a4];
  if (v5)
  {
    [(UMEventRecorder *)self _cleanupInstallState];
  }
}

- (void)recordEvent:(id)a3 information:(id)a4
{
}

- (void)recordPostUpdateEvent:(id)a3 additionalInfo:(id)a4
{
}

- (void)recordPostUpdateEvent:(id)a3 additionalInfo:(id)a4 withCallback:(id)a5
{
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = [a4 objectForKeyedSubscript:@"rapidSecurityResponseUpdate"];
  id v11 = [a4 objectForKeyedSubscript:@"rapidSecurityResponseRollback"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v10 BOOLValue] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v11 BOOLValue])
  {
    id v88 = a3;
    id v89 = a5;
    id v12 = [a4 objectForKeyedSubscript:@"result"];
    id v83 = a4;
    id v13 = [a4 objectForKeyedSubscript:@"failureReason"];
    id v81 = 0;
    id v82 = 0;
    id v14 = 0;
    id v79 = 0;
    id v80 = 0;
    id v86 = 0;
    id v78 = 0;
    id v87 = 0;
    id v77 = 0;
    id v90 = 0;
    CFStringRef v84 = 0;
    CFStringRef v85 = 0;
    CFStringRef v15 = 0;
    CFStringRef v76 = 0;
    id v91 = 0;
    id v16 = 0;
    id v17 = 0;
    id v18 = 0;
    id v19 = 0;
    if (v12) {
      goto LABEL_6;
    }
    goto LABEL_80;
  }
  uint64_t v34 = [(UMEventRecorder *)self _installInProgressAfterApply];
  if (v34)
  {
    id v88 = a3;
    id v89 = a5;
    id v41 = (id)objc_opt_new();
    objc_msgSend(v41, "setFormatterBehavior:", +[NSNumberFormatter defaultFormatterBehavior](NSNumberFormatter, "defaultFormatterBehavior"));
    id v12 = [(UMEventRecorder *)self _nvramValue:@"ota-result"];
    id v71 = [(UMEventRecorder *)self _nvramValue:@"ota-failure-reason"];
    id v72 = [(UMEventRecorder *)self _nvramValue:@"ota-breadcrumbs"];
    id v73 = [(UMEventRecorder *)self _nvramValue:@"ota-original-os-version"];
    id v74 = [(UMEventRecorder *)self _nvramValue:@"ota-original-base-os-version"];
    id v42 = [(UMEventRecorder *)self _nvramValue:@"ota-install-tonight"];
    id v91 = [(UMEventRecorder *)self _nvramValue:@"ota-brain-version"];
    CFStringRef v43 = [(UMEventRecorder *)self _nvramValue:@"OTA-pre-conversion"];
    CFStringRef v75 = [(UMEventRecorder *)self _nvramValue:@"OTA-post-conversion"];
    CFStringRef v84 = [(UMEventRecorder *)self _nvramValue:@"ota-conv-panic-indicator"];
    CFStringRef v85 = [(UMEventRecorder *)self _nvramValue:@"OTA-fsck-metrics"];
    id v90 = [(UMEventRecorder *)self _nvramValue:@"OTA-sealvolume-metrics"];
    id v77 = [(UMEventRecorder *)self _nvramValue:@"OTA-migrator-metrics"];
    id v87 = [(UMEventRecorder *)self _nvramValue:@"OTA-converter-metrics"];
    id v78 = [(UMEventRecorder *)self _nvramValue:@"ota-forced-reset-uptime"];
    id v44 = [(UMEventRecorder *)self _nvramValue:@"ota-initial-forced-reset-uptime"];
    id v86 = [(UMEventRecorder *)self _nvramValue:@"ota-snapshot-update"];
    id v79 = [(UMEventRecorder *)self _nvramValue:@"pre-recovery-ota-failure-uuid"];
    id v45 = [(UMEventRecorder *)self _nvramValue:@"recoveryos-initiated-update"];
    id v81 = [(UMEventRecorder *)self _nvramValue:@"ota-controllerVersion"];
    CFStringRef v76 = v43;
    id v82 = [(UMEventRecorder *)self _nvramValue:@"ota-updateType"];
    id v83 = a4;
    id v80 = v44;
    id v14 = v45;
    if (v42) {
      id v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(objc_msgSend(v41, "numberFromString:", v42), "BOOLValue"));
    }
    else {
      id v19 = 0;
    }
    id v16 = v74;
    CFStringRef v15 = v75;
    id v18 = v72;
    id v17 = v73;
    id v13 = v71;
    if (v12)
    {
LABEL_6:
      [v9 setObject:v12 forKey:@"result"];
      id v20 = v13;
      id v22 = v90;
      id v21 = v91;
      if (v20) {
        [v9 setObject:v20 forKey:@"failureReason"];
      }
      if (v18) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }
LABEL_80:
    if (objc_msgSend(-[UMEventRecorder _currentOSVersion](self, "_currentOSVersion"), "isEqualToString:", -[UMEventRecorder targetOSVersion](self, "targetOSVersion")))
    {
      id v22 = v90;
      if ([(UMEventRecorder *)self _nvramValue:@"ota-uuid"])
      {
        [v9 setObject:@"unexpected error" forKey:@"result"];
        CFStringRef v67 = @"no result set in NVRAM after update";
        CFStringRef v68 = @"failureReason";
      }
      else
      {
        CFStringRef v67 = @"OTA update not performed";
        CFStringRef v68 = @"result";
      }
      [v9 setObject:v67 forKey:v68];
    }
    else
    {
      [v9 setObject:@"unexpected error" forKey:@"result"];
      [v9 setObject:@"no result set in NVRAM reporting from non-target OS" forKey:@"failureReason"];
      id v22 = v90;
    }
    id v21 = v91;
    if (v18) {
LABEL_9:
    }
      [v9 setObject:v18 forKey:@"breadcrumbs"];
LABEL_10:
    if (v17) {
      [v9 setObject:v17 forKey:@"originalOSVersion"];
    }
    if (v16) {
      [v9 setObject:v16 forKey:@"originalBaseOSVersion"];
    }
    if (v19) {
      [v9 setObject:v19 forKey:@"installTonight"];
    }
    if (v21) {
      [v9 setObject:v21 forKey:@"brainVersion"];
    }
    CFStringRef v23 = v84;
    if (v78) {
      [v9 setObject:v78 forKey:@"forcedResetUptime"];
    }
    if (v80) {
      [v9 setObject:v80 forKey:@"initialForcedResetUptime"];
    }
    if (v79) {
      [v9 setObject:v79 forKey:@"preRecoveryClientId"];
    }
    if (v14) {
      [v9 setObject:v14 forKey:@"recoveryInitiated"];
    }
    CFStringRef v24 = v85;
    if (v81) {
      [v9 setObject:v81 forKey:@"controllerVersion"];
    }
    if (v82) {
      [v9 setObject:v82 forKey:@"updateType"];
    }
    uint64_t v25 = +[UMEventRecorder diagnosticsAndUsageAllowed:[(UMEventRecorder *)self dataMountPoint]];
    if (v25)
    {
      _log(v25, @"Diagnostic log submission enabled", v26, v27, v28, v29, v30, v31, v69);
      uint64_t v32 = v77;
      CFStringRef v33 = v76;
      if (!v76) {
        goto LABEL_47;
      }
    }
    else
    {
      _log(v25, @"Diagnostic log submission disabled", v26, v27, v28, v29, v30, v31, v69);
      CFStringRef v33 = @"<Redacted>";
      if (v15) {
        CFStringRef v15 = @"<Redacted>";
      }
      else {
        CFStringRef v15 = 0;
      }
      if (v84) {
        CFStringRef v23 = @"<Redacted>";
      }
      else {
        CFStringRef v23 = 0;
      }
      if (v85) {
        CFStringRef v24 = @"<Redacted>";
      }
      else {
        CFStringRef v24 = 0;
      }
      uint64_t v32 = v77;
      if (!v76)
      {
LABEL_47:
        if (v15) {
          [v9 setObject:v15 forKey:@"postConv"];
        }
        if (v23) {
          [v9 setObject:v23 forKey:@"convPanic"];
        }
        if (v24) {
          [v9 setObject:v24 forKey:@"fsckMetrics"];
        }
        if (v22) {
          [v9 setObject:v22 forKey:@"sealvolumeMetrics"];
        }
        if (objc_msgSend(v32, "length", v33))
        {
          id v46 = [v32 cStringUsingEncoding:4];
          if (&_APFSDecodeMetricsString && v46)
          {
            uint64_t v53 = (void *)APFSDecodeMetricsString();
            if ([v53 length])
            {
              [v9 setObject:v53 forKey:@"migratorMetrics"];

              if (!v87) {
                goto LABEL_67;
              }
            }
            else
            {
              _log(0, @"%s: bad decoded metrics", v54, v55, v56, v57, v58, v59, (uint64_t)"-[UMEventRecorder recordPostUpdateEvent:additionalInfo:withCallback:]");
              if (!v87) {
                goto LABEL_67;
              }
            }
            goto LABEL_66;
          }
          _log((uint64_t)v46, @"%s: failed to find APFSDecodeMetricsString, reporting encoded metrics", v47, v48, v49, v50, v51, v52, (uint64_t)"-[UMEventRecorder recordPostUpdateEvent:additionalInfo:withCallback:]");
          [v9 setObject:v32 forKey:@"migratorMetrics"];
        }
        if (!v87)
        {
LABEL_67:
          if (v86) {
            [v9 setObject:v86 forKey:@"snapshotUpdate"];
          }
          if ([(UMEventRecorder *)self eventAttributes]) {
            objc_msgSend(v9, "addEntriesFromDictionary:", -[UMEventRecorder eventAttributes](self, "eventAttributes"));
          }
          id v60 = [+[UMEventCheckpoint sharedInstance] checkpointNvramInfo:self->_nvramDict];
          if (v60) {
            id v60 = [v9 addEntriesFromDictionary:v60];
          }
          if (v83)
          {
            _log((uint64_t)v60, @"Adding dictionary to splunk object", v61, v62, v63, v64, v65, v66, v70);
            [v9 addEntriesFromDictionary:v83];
          }
          [(UMEventRecorder *)self _recordEvent:v88 information:v9 callback:v89];
          [(UMEventRecorder *)self _cleanupInstallState];
          return;
        }
LABEL_66:
        [v9 setObject:v87 forKey:@"converterMetrics"];
        goto LABEL_67;
      }
    }
    [v9 setObject:v33 forKey:@"preConv"];
    goto LABEL_47;
  }
  _log(v34, @"ignoring call to recordPostUpdateEvent when no install is in progress or we haven't performed the apply operation", v35, v36, v37, v38, v39, v40, v93);
}

- (id)_copyEscapeStringsForEventData:(id)a3
{
  id v4 = +[NSMutableCharacterSet characterSetWithCharactersInString:@"%\\""];
  [(NSMutableCharacterSet *)v4 formUnionWithCharacterSet:+[NSCharacterSet controlCharacterSet]];
  [(NSMutableCharacterSet *)v4 formUnionWithCharacterSet:+[NSCharacterSet newlineCharacterSet]];
  BOOL v5 = +[NSMutableCharacterSet characterSetWithRange:](NSMutableCharacterSet, "characterSetWithRange:", 0, 127);
  [(NSMutableCharacterSet *)v5 formIntersectionWithCharacterSet:[(NSMutableCharacterSet *)v4 invertedSet]];
  id v6 = [a3 allKeys];
  id v7 = objc_msgSend(objc_msgSend(a3, "objectsForKeys:notFoundMarker:", v6, +[NSNull null](NSNull, "null")), "mutableCopy");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3254779904;
  v10[2] = __50__UMEventRecorder__copyEscapeStringsForEventData___block_invoke;
  v10[3] = &__block_descriptor_48_e8_32o40o_e15_v32__0_8Q16_B24l;
  v10[4] = v7;
  v10[5] = v5;
  [v7 enumerateObjectsUsingBlock:v10];
  id v8 = [objc_alloc((Class)NSDictionary) initWithObjects:v7 forKeys:v6];

  return v8;
}

uint64_t __50__UMEventRecorder__copyEscapeStringsForEventData___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [a2 stringByAddingPercentEncodingWithAllowedCharacters:*(void *)(a1 + 40)];
    return (uint64_t)[v8 replaceObjectAtIndex:a3 withObject:v9];
  }
  return result;
}

- (id)_submissionBodyForEvents:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "objectForKey:", @"Install Id");
  id v6 = +[NSMutableArray array];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3254779904;
  v24[2] = __44__UMEventRecorder__submissionBodyForEvents___block_invoke;
  v24[3] = &__block_descriptor_48_e8_32o40o_e29_v32__0__NSDictionary_8Q16_B24l;
  v24[4] = self;
  v24[5] = v6;
  [a3 enumerateObjectsUsingBlock:v24];
  v25[0] = @"clientId";
  v25[1] = @"events";
  v26[0] = v5;
  v26[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  uint64_t v8 = +[NSJSONSerialization isValidJSONObject:v7];
  if (v8) {
    return +[NSJSONSerialization dataWithJSONObject:v7 options:0 error:0];
  }
  _log(v8, @"unable to convert event to JSON", v9, v10, v11, v12, v13, v14, v23);
  _log(v16, @"event: %@", v17, v18, v19, v20, v21, v22, (uint64_t)v7);
  return 0;
}

void __44__UMEventRecorder__submissionBodyForEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_copyEscapeStringsForEventData:", objc_msgSend(a2, "objectForKey:", @"Event Data"));
  [*(id *)(a1 + 40) addObject:v3];
}

- (void)_submitIndividualEvents:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = dispatch_group_create();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  id v11 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v14);
        dispatch_group_enter(v10);
        uint64_t v26 = v15;
        uint64_t v16 = +[NSArray arrayWithObjects:&v26 count:1];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3254779904;
        v21[2] = __79__UMEventRecorder__submitIndividualEvents_toURL_withOptions_completionHandler___block_invoke;
        v21[3] = &__block_descriptor_40_e8_32o_e5_v8__0l;
        void v21[4] = v10;
        [(UMEventRecorder *)self _submitEvents:v16 toURL:a4 withOptions:a5 completionHandler:v21];
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v12);
  }
  global_queue = dispatch_get_global_queue(9, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __79__UMEventRecorder__submitIndividualEvents_toURL_withOptions_completionHandler___block_invoke_2;
  block[3] = &__block_descriptor_40_e8_32b_e5_v8__0l;
  block[4] = a6;
  dispatch_group_notify(v10, global_queue, block);
  dispatch_release(v10);
}

void __79__UMEventRecorder__submitIndividualEvents_toURL_withOptions_completionHandler___block_invoke(uint64_t a1)
{
}

uint64_t __79__UMEventRecorder__submitIndividualEvents_toURL_withOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_scheduleEventSubmissionRetry
{
  if (![(UMEventRecorder *)self submissionPending])
  {
    [(UMEventRecorder *)self setSubmissionPending:1];
    uint64_t v3 = os_transaction_create();
    [(UMEventRecorder *)self _retryInterval];
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    global_queue = dispatch_get_global_queue(9, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3254779904;
    v7[2] = __48__UMEventRecorder__scheduleEventSubmissionRetry__block_invoke;
    v7[3] = &__block_descriptor_48_e8_32o40o_e5_v8__0l;
    v7[4] = self;
    v7[5] = v3;
    dispatch_after(v5, global_queue, v7);
  }
}

void __48__UMEventRecorder__scheduleEventSubmissionRetry__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSubmissionPending:0];
  [*(id *)(a1 + 32) submitEventsInBackground:1];
  CFTypeRef v2 = *(void **)(a1 + 40);
}

- (BOOL)_updateRetryInformationForEvents:(id)a3
{
  double v4 = +[NSDate date];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  BOOL v7 = 0;
  uint64_t v8 = *(void *)v25;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(a3);
      }
      uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      id v11 = [v10 objectForKey:@"Local Path"];
      int v12 = objc_msgSend(objc_msgSend(v10, "objectForKey:", @"Submission Attempts"), "intValue");
      if (v12 < 4)
      {
        uint64_t v20 = (v12 + 1);
        id v21 = [v10 mutableCopy];
        objc_msgSend(v21, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20), @"Submission Attempts");
        [v21 setObject:v4 forKey:@"Last Submission Attempt"];
        [v21 removeObjectForKey:@"Local Path"];
        BOOL v7 = 1;
        [v21 writeToFile:v11 atomically:1];
      }
      else if (unlink((const char *)[v11 fileSystemRepresentation]))
      {
        uint64_t v13 = __error();
        long long v23 = strerror(*v13);
        _log((uint64_t)v23, @"unable to remove %@: %s", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
      }
    }
    id v6 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v6);
  return v7;
}

- (void)_removeEvents:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(a3);
        }
        id v8 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v7) objectForKey:@"Local Path"];
        if (unlink((const char *)[v8 fileSystemRepresentation]))
        {
          uint64_t v9 = __error();
          uint64_t v16 = strerror(*v9);
          _log((uint64_t)v16, @"unable to remove %@: %s", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
        }
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (void)_submitEvents:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  id v11 = -[UMEventRecorder _submissionBodyForEvents:](self, "_submissionBodyForEvents:");
  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3254779904;
    v13[2] = __69__UMEventRecorder__submitEvents_toURL_withOptions_completionHandler___block_invoke;
    v13[3] = &__block_descriptor_72_e8_32o40o48o56o64b_e39_v24__0__NSHTTPURLResponse_8__NSError_16l;
    v13[4] = self;
    v13[5] = a3;
    v13[6] = a4;
    v13[7] = a5;
    v13[8] = a6;
    [(UMEventSubmitter *)[(UMEventRecorder *)self submitter] submitEventData:v11 toURL:a4 withOptions:a5 completionHandler:v13];
  }
  else if ((unint64_t)[a3 count] < 2)
  {
    [(UMEventRecorder *)self _removeEvents:a3];
    uint64_t v12 = (void (*)(id))*((void *)a6 + 2);
    v12(a6);
  }
  else
  {
    [(UMEventRecorder *)self _submitIndividualEvents:a3 toURL:a4 withOptions:a5 completionHandler:a6];
  }
}

__n128 __69__UMEventRecorder__submitEvents_toURL_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[1] = 3254779904;
  block[2] = __69__UMEventRecorder__submitEvents_toURL_withOptions_completionHandler___block_invoke_2;
  block[3] = &__block_descriptor_88_e8_32o40o48o56o64o72o80b_e5_v8__0l;
  block[4] = a3;
  void block[5] = a2;
  long long v8 = v3;
  long long v9 = v4;
  uint64_t v10 = *(void *)(a1 + 64);
  dispatch_async(v5, block);
  return result;
}

id __69__UMEventRecorder__submitEvents_toURL_withOptions_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 32))
  {
    _log(a1, @"POST failed: %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
LABEL_6:
    long long v25 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
    return (id)v25();
  }
  id v9 = [*(id *)(a1 + 40) statusCode];
  if (v9 == (id)200)
  {
    id v16 = [*(id *)(a1 + 56) count];
    _log((uint64_t)v16, @"%d events successfully submitted", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    long long v23 = *(void **)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 56);
LABEL_5:
    [v23 _removeEvents:v24];
    goto LABEL_6;
  }
  uint64_t v27 = (uint64_t)v9;
  _log((uint64_t)v9, @"server rejected submission: %d", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  _log(v28, @"response: %@", v29, v30, v31, v32, v33, v34, *(void *)(a1 + 40));
  if (v27 >= 500)
  {
    if ([*(id *)(a1 + 48) _updateRetryInformationForEvents:*(void *)(a1 + 56)]) {
      [*(id *)(a1 + 48) _scheduleEventSubmissionRetry];
    }
    goto LABEL_6;
  }
  id v35 = [*(id *)(a1 + 56) count];
  long long v23 = *(void **)(a1 + 48);
  uint64_t v24 = *(void *)(a1 + 56);
  if ((unint64_t)v35 < 2) {
    goto LABEL_5;
  }
  uint64_t v36 = *(void *)(a1 + 64);
  uint64_t v37 = *(void *)(a1 + 72);
  uint64_t v38 = *(void *)(a1 + 80);
  return [v23 _submitIndividualEvents:v24 toURL:v36 withOptions:v37 completionHandler:v38];
}

- (double)_timeIntervalUntilRetry:(id)a3
{
  int v4 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"Submission Attempts"), "intValue");
  if (v4 > 4) {
    id v5 = +[NSDate distantFuture];
  }
  else {
    id v5 = (NSDate *)objc_msgSend(objc_msgSend(a3, "objectForKey:", @"Last Submission Attempt"), "dateByAddingTimeInterval:", (double)(60 << v4));
  }
  [(NSDate *)v5 timeIntervalSinceNow];
  return result;
}

- (void)submitEventsInBackground:(BOOL)a3
{
}

- (void)submitEventsInBackground:(BOOL)a3 withOptions:(id)a4
{
  BOOL v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke;
  block[3] = &__block_descriptor_49_e8_32o40o_e5_v8__0l;
  if (a3) {
    dispatch_qos_class_t v6 = QOS_CLASS_BACKGROUND;
  }
  else {
    dispatch_qos_class_t v6 = QOS_CLASS_UTILITY;
  }
  block[4] = a4;
  void block[5] = self;
  BOOL v10 = a3;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v6, 0, block);
  submitQueue = self->_submitQueue;
  if (v4) {
    dispatch_async((dispatch_queue_t)submitQueue, v7);
  }
  else {
    dispatch_sync((dispatch_queue_t)submitQueue, v7);
  }
  _Block_release(v7);
}

void __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _log(a1, @"submitEventsInBackground running", a3, a4, a5, a6, a7, a8, v80);
  id v9 = *(NSMutableDictionary **)(a1 + 32);
  BOOL v10 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [*(id *)(a1 + 40) droppedEvents]);
  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "droppedEvents"), "removeAllObjects");
  id v11 = [*(id *)(a1 + 40) _eventDirectory];
  id v12 = [*(id *)(a1 + 40) _legacyEventDirectory];
  if (*(unsigned char *)(a1 + 48))
  {
    id v82 = (id)os_transaction_create();
    uint64_t v13 = *(void **)(a1 + 32);
    if (v13) {
      uint64_t v14 = (NSMutableDictionary *)[v13 mutableCopy];
    }
    else {
      uint64_t v14 = +[NSMutableDictionary dictionaryWithCapacity:1];
    }
    id v9 = v14;
    [(NSMutableDictionary *)v14 setValue:+[NSNumber numberWithBool:1] forKey:@"IsBackgroundSubmission"];
  }
  else
  {
    id v82 = 0;
  }
  v85[0] = 0;
  BOOL v20 = ![*(id *)(a1 + 32) objectForKey:@"forceEventResubmission"]
     || (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"forceEventResubmission"), "BOOLValue") & 1) == 0;
  logfunction(", 1, @"%s: Previously submitted events will %s resubmitted\n\n", v15, v16, v17, v18, v19, (char)"-[UMEventRecorder submitEventsInBackground:withOptions:]_block_invoke"");
  id v21 = [*(id *)(a1 + 40) _copyUnsubmittedEventsFromDirectory:v11 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:v20 previouslySubmittedEventSkipped:(char *)v85 + 1];
  if (v21)
  {
    uint64_t v28 = v21;
    if ([v21 count])
    {
      id v29 = [v28 count];
      _log((uint64_t)v29, @"Found %lu unsubmitted events in update volume", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
      [(NSMutableArray *)v10 addObjectsFromArray:v28];
    }
    CFRelease(v28);
  }
  else
  {
    _log(0, @"Unable to check for unsubmitted events on the update volume", v22, v23, v24, v25, v26, v27, v81);
  }
  if (HIBYTE(v85[0])) {
    _log(v36, @"Some events from the update volume were skipped since we had previously attempted to submit them and we are within the retry period", v37, v38, v39, v40, v41, v42, v81);
  }
  id v43 = [*(id *)(a1 + 40) _copyUnsubmittedEventsFromDirectory:v12 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:v20 previouslySubmittedEventSkipped:v85];
  if (v43)
  {
    uint64_t v50 = v43;
    if ([v43 count])
    {
      id v51 = [v50 count];
      _log((uint64_t)v51, @"Found %lu unsubmitted events in data volume", v52, v53, v54, v55, v56, v57, (uint64_t)v51);
      [(NSMutableArray *)v10 addObjectsFromArray:v50];
    }
    CFRelease(v50);
  }
  else
  {
    _log(0, @"Unable to check for events from the data volume", v44, v45, v46, v47, v48, v49, v81);
  }
  if (LOBYTE(v85[0]))
  {
    _log(v58, @"Some events from the data volume were skipped since we had previously attempted to submit them and we are within the retry period", v59, v60, v61, v62, v63, v64, v81);
    BOOL v65 = LOBYTE(v85[0]) == 0;
  }
  else
  {
    BOOL v65 = 1;
  }
  if (HIBYTE(v85[0]) || !v65)
  {
    _log(v58, @"Continuing with submissions but scheduling retry for skipped events", v59, v60, v61, v62, v63, v64, v81);
    [*(id *)(a1 + 40) _scheduleEventSubmissionRetry];
  }
  uint64_t v66 = dispatch_group_create();
  while ([(NSMutableArray *)v10 count])
  {
    id v67 = [(NSMutableArray *)v10 objectAtIndex:0];
    id v68 = [v67 objectForKey:@"Submission URL"];
    uint64_t v69 = +[NSURL URLWithString:v68];
    if (v69)
    {
      CFStringRef v76 = v69;
      id v77 = +[NSMutableArray array];
      id v78 = [v67 objectForKey:@"Install Id"];
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3254779904;
      v84[2] = __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke_2;
      v84[3] = &__block_descriptor_56_e8_32o40o48o_e29_v32__0__NSDictionary_8Q16_B24l;
      v84[4] = v78;
      v84[5] = v68;
      v84[6] = v77;
      [(NSMutableArray *)v10 enumerateObjectsUsingBlock:v84];
      dispatch_group_enter(v66);
      id v79 = *(void **)(a1 + 40);
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3254779904;
      v83[2] = __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke_706;
      v83[3] = &__block_descriptor_40_e8_32o_e5_v8__0l;
      v83[4] = v66;
      [v79 _submitEvents:v77 toURL:v76 withOptions:v9 completionHandler:v83];
      [(NSMutableArray *)v10 removeObjectsInArray:v77];
    }
    else
    {
      _log(0, @"invalid url string %@", v70, v71, v72, v73, v74, v75, (uint64_t)v68);
      [(NSMutableArray *)v10 removeObjectAtIndex:0];
    }
  }
  dispatch_group_wait(v66, 0xFFFFFFFFFFFFFFFFLL);
  if (*(unsigned char *)(a1 + 48)) {

  }
  dispatch_release(v66);
}

id __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(a2, "objectForKey:", @"Install Id"));
  if (result)
  {
    id result = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", objc_msgSend(a2, "objectForKey:", @"Submission URL"));
    if (result)
    {
      id v5 = *(void **)(a1 + 48);
      return [v5 addObject:a2];
    }
  }
  return result;
}

void __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke_706(uint64_t a1)
{
}

- (void)submitEvents
{
}

- (void)submitEventsWithUpdateOptions:(id)a3
{
  if (a3)
  {
    id v5 = [a3 objectForKey:@"SocksProxySettings"];
    if (v5)
    {
      id v6 = v5;
      dispatch_block_t v7 = +[NSMutableDictionary dictionaryWithCapacity:2];
      [(NSMutableDictionary *)v7 setObject:v6 forKey:@"ProxySettings"];
    }
    else
    {
      dispatch_block_t v7 = 0;
    }
    if ([a3 objectForKey:@"forceEventResubmission"]) {
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"forceEventResubmission"), "BOOLValue")), @"forceEventResubmission");
    }
  }
  else
  {
    dispatch_block_t v7 = 0;
  }
  [(UMEventRecorder *)self submitEventsInBackground:0 withOptions:v7];
}

- (id)_copyUnsubmittedEventsFromDirectory:(id)a3 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:(BOOL)a4 previouslySubmittedEventSkipped:(BOOL *)a5
{
  if (!a3)
  {
    _log((uint64_t)self, @"Invalid directory passed to %s", 0, a4, (uint64_t)a5, v5, v6, v7, (uint64_t)"-[UMEventRecorder _copyUnsubmittedEventsFromDirectory:skipEventsIfPreviouslySubmittedAndWithinBackoffTime:previouslySubmittedEventSkipped:]");
    return 0;
  }
  BOOL v9 = a4;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v13 = -[NSFileManager enumeratorAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "enumeratorAtPath:", [a3 path]);
  if (!v13)
  {
    id v14 = [a3 path];
    _log((uint64_t)v14, @"failed to create enumerator of path: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
  }
  id v21 = [(NSDirectoryEnumerator *)v13 nextObject];
  if (v21)
  {
    id v22 = v21;
    v98 = v12;
    v95 = a5;
    v96 = self;
    BOOL v97 = v9;
    CFStringRef v23 = @"failed to create url to event file";
    CFStringRef v24 = @"plist";
    uint64_t v25 = &APFSContainerGetSpaceInfo_ptr;
    while (1)
    {
      objc_opt_class();
      uint64_t isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0) {
        break;
      }
      uint64_t isKindOfClass = (uint64_t)[a3 URLByAppendingPathComponent:v22];
      if (!isKindOfClass)
      {
        CFStringRef v91 = v23;
        goto LABEL_32;
      }
      uint64_t v33 = (void *)isKindOfClass;
      if ((objc_msgSend(objc_msgSend((id)isKindOfClass, "lastPathComponent"), "hasPrefix:", @".") & 1) != 0
        || !objc_msgSend(objc_msgSend(v33, "pathExtension"), "isEqualToString:", v24))
      {
        goto LABEL_33;
      }
      id v34 = [v25[422] dictionaryWithContentsOfURL:v33];
      if (v34)
      {
        uint64_t v41 = v34;
        CFStringRef v42 = v23;
        CFStringRef v43 = v24;
        uint64_t v44 = (uint64_t)[v34 objectForKey:@"Install Id"];
        if (v44 && (objc_opt_class(), uint64_t v44 = objc_opt_isKindOfClass(), (v44 & 1) != 0))
        {
          uint64_t v51 = (uint64_t)[v41 objectForKey:@"Event Data"];
          if (v51 && (objc_opt_class(), uint64_t v51 = objc_opt_isKindOfClass(), (v51 & 1) != 0))
          {
            uint64_t v58 = (uint64_t)[v41 objectForKey:@"Submission URL"];
            if (v58 && (objc_opt_class(), uint64_t v58 = objc_opt_isKindOfClass(), (v58 & 1) != 0))
            {
              id v65 = [v41 objectForKey:@"Submission Attempts"];
              if (v65 && (objc_opt_class(), uint64_t v66 = objc_opt_isKindOfClass(), (v66 & 1) == 0))
              {
                _log(v66, @"%@ has bogus submission attempt count", v67, v68, v69, v70, v71, v72, (uint64_t)v33);
              }
              else
              {
                uint64_t v73 = (uint64_t)[v41 objectForKey:@"Last Submission Attempt"];
                uint64_t v80 = v73;
                if (!v73 || (v94 = v73, objc_opt_class(), uint64_t v73 = objc_opt_isKindOfClass(), v80 = v94, (v73 & 1) != 0))
                {
                  BOOL v81 = v65 != 0;
                  if (v80)
                  {
                    BOOL v81 = 0;
                    BOOL v82 = v65 == 0;
                  }
                  else
                  {
                    BOOL v82 = 0;
                  }
                  CFStringRef v24 = v43;
                  if (!v82 && !v81)
                  {
                    CFStringRef v23 = v42;
                    if (v80)
                    {
                      if (v97)
                      {
                        id v83 = [(UMEventRecorder *)v96 _timeIntervalUntilRetry:v41];
                        if (v90 > 0.0)
                        {
                          _log((uint64_t)v83, @"Skipped copying of %@ since it was previoulsy submitted and we are within the retry timeout", v84, v85, v86, v87, v88, v89, (uint64_t)v33);
                          uint64_t v25 = &APFSContainerGetSpaceInfo_ptr;
                          if (v95) {
                            BOOL *v95 = 1;
                          }
                          goto LABEL_33;
                        }
                      }
                    }
                    objc_msgSend(v41, "setObject:forKey:", objc_msgSend(v33, "path"), @"Local Path");
                    [v98 addObject:v41];
                    goto LABEL_41;
                  }
                  _log(v73, @"%@ has incomplete last submission attempt data", v74, v75, v76, v77, v78, v79, (uint64_t)v33);
LABEL_40:
                  CFStringRef v23 = v42;
LABEL_41:
                  uint64_t v25 = &APFSContainerGetSpaceInfo_ptr;
                  goto LABEL_33;
                }
                _log(v73, @"%@ has bogus last submission attempt date", v74, v75, v76, v77, v78, v79, (uint64_t)v33);
              }
            }
            else
            {
              _log(v58, @"%@ has missing or bogus submission URL", v59, v60, v61, v62, v63, v64, (uint64_t)v33);
            }
          }
          else
          {
            _log(v51, @"%@ has missing or bogus event data", v52, v53, v54, v55, v56, v57, (uint64_t)v33);
          }
        }
        else
        {
          _log(v44, @"%@ has missing or bogus install identifier", v45, v46, v47, v48, v49, v50, (uint64_t)v33);
        }
        CFStringRef v24 = v43;
        goto LABEL_40;
      }
      _log(0, @"unable to load event from %@", v35, v36, v37, v38, v39, v40, (uint64_t)v33);
LABEL_33:
      id v22 = [(NSDirectoryEnumerator *)v13 nextObject];
      if (!v22) {
        return v98;
      }
    }
    CFStringRef v91 = @"file in enumerator is nil or not a string";
LABEL_32:
    _log(isKindOfClass, (uint64_t)v91, v27, v28, v29, v30, v31, v32, v93);
    goto LABEL_33;
  }
  return v12;
}

- (id)_loadUnsubmittedEvents
{
  id v3 = +[NSMutableArray array];
  id v4 = [(UMEventRecorder *)self _eventDirectory];
  id v5 = [(UMEventRecorder *)self _legacyEventDirectory];
  _log((uint64_t)v5, @"Loading unsubmitted events from update volume", v6, v7, v8, v9, v10, v11, v60);
  id v12 = [(UMEventRecorder *)self _copyUnsubmittedEventsFromDirectory:v4 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:0 previouslySubmittedEventSkipped:0];
  if (v12)
  {
    uint64_t v19 = v12;
    if ([v12 count])
    {
      id v26 = [v19 count];
      _log((uint64_t)v26, @"Found %lu unsubmitted events in update volume", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
      [v3 addObjectsFromArray:v19];
    }
    else
    {
      _log(0, @"No unsubmitted events found in update volume", v20, v21, v22, v23, v24, v25, v61);
    }
    CFRelease(v19);
  }
  else
  {
    _log(0, @"Unable to determine state of unsubmitted events(if any) on update volume", v13, v14, v15, v16, v17, v18, v61);
  }
  id v33 = [(UMEventRecorder *)self _copyUnsubmittedEventsFromDirectory:v5 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:0 previouslySubmittedEventSkipped:0];
  if (v33)
  {
    uint64_t v40 = v33;
    if ([v33 count])
    {
      id v47 = [v40 count];
      _log((uint64_t)v47, @"Found %lu unsubmitted events in data volume", v48, v49, v50, v51, v52, v53, (uint64_t)v47);
      [v3 addObjectsFromArray:v40];
    }
    else
    {
      _log(0, @"No unsubmitted events found in data volume", v41, v42, v43, v44, v45, v46, v62);
    }
    CFRelease(v40);
  }
  else
  {
    _log(0, @"Unable to determine state of unsubmitted events(if any) on data volume", v34, v35, v36, v37, v38, v39, v62);
  }
  [v3 count];
  logfunction(", 1, @"[%s] total numUnsubmittedEvents = %lu\n\n", v54, v55, v56, v57, v58, (char)"-[UMEventRecorder _loadUnsubmittedEvents]"");
  return v3;
}

- (unint64_t)numUnsubmittedEvents
{
  id v2 = [(UMEventRecorder *)self _loadUnsubmittedEvents];
  return (unint64_t)[v2 count];
}

- (void)commitMetadataToPersistentStorage
{
}

- (void)commitMetadataToPersistentStorage:(id)a3
{
  if ([(UMEventRecorder *)self uuid] && [(UMEventRecorder *)self baseServerURL])
  {
    id v5 = (id)objc_opt_new();
    objc_msgSend(v5, "setFormatterBehavior:", +[NSNumberFormatter defaultFormatterBehavior](NSNumberFormatter, "defaultFormatterBehavior"));
    [(UMEventRecorder *)self _setNvramValue:[(UMEventRecorder *)self uuid] forKey:@"ota-uuid"];
    [(UMEventRecorder *)self _setNvramValue:[(UMEventRecorder *)self baseServerURL] forKey:@"ota-submission-url"];
    [(UMEventRecorder *)self _setNvramValue:[(UMEventRecorder *)self targetOSVersion] forKey:@"ota-os-version"];
    [(UMEventRecorder *)self _setNvramValue:[(UMEventRecorder *)self _currentOSVersion] forKey:@"ota-original-os-version"];
    [(UMEventRecorder *)self _setNvramValue:[(UMEventRecorder *)self _currentBaseOSVersion] forKey:@"ota-original-base-os-version"];
    -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", objc_msgSend(v5, "stringFromNumber:", -[UMEventRecorder installTonight](self, "installTonight")), @"ota-install-tonight");
    [(UMEventRecorder *)self _setNvramValue:[(UMEventRecorder *)self context] forKey:@"ota-context"];
    if ([(UMEventRecorder *)self brainVersion]) {
      [(UMEventRecorder *)self _setNvramValue:[(UMEventRecorder *)self brainVersion] forKey:@"ota-brain-version"];
    }
    -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", [a3 valueForKey:@"controllerVersion"], @"ota-controllerVersion");
    if ([a3 valueForKey:@"updateType"]) {
      -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", [a3 valueForKey:@"updateType"], @"ota-updateType");
    }
    [(UMEventRecorder *)self _setNvramValue:@"IONVRAM-FORCESYNCNOW-PROPERTY" forKey:@"IONVRAM-FORCESYNCNOW-PROPERTY"];
  }
}

- (id)_getDeviceModel
{
  return [(UMEventRecorder *)self _getGestaltString:@"HWModelStr"];
}

- (NSString)installType
{
  return self->_installType;
}

- (void)setInstallType:(id)a3
{
}

- (UMEventSubmitter)submitter
{
  return self->_submitter;
}

- (void)setSubmitter:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)baseServerURL
{
  return self->_baseServerURL;
}

- (void)setBaseServerURL:(id)a3
{
}

- (NSString)targetOSVersion
{
  return self->_targetOSVersion;
}

- (void)setTargetOSVersion:(id)a3
{
}

- (NSNumber)installTonight
{
  return self->_installTonight;
}

- (void)setInstallTonight:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)submissionPending
{
  return self->_submissionPending;
}

- (void)setSubmissionPending:(BOOL)a3
{
  self->_submissionPending = a3;
}

- (NSString)systemMountPoint
{
  return self->_systemMountPoint;
}

- (void)setSystemMountPoint:(id)a3
{
}

- (NSString)dataMountPoint
{
  return self->_dataMountPoint;
}

- (void)setDataMountPoint:(id)a3
{
}

- (NSString)updateMountPoint
{
  return self->_updateMountPoint;
}

- (void)setUpdateMountPoint:(id)a3
{
}

- (NSString)nvramPath
{
  return self->_nvramPath;
}

- (void)setNvramPath:(id)a3
{
}

- (NSDictionary)eventAttributes
{
  return self->_eventAttributes;
}

- (void)setEventAttributes:(id)a3
{
}

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (void)setBrainVersion:(id)a3
{
}

- (NSDictionary)nvramDict
{
  return self->_nvramDict;
}

- (void)setNvramDict:(id)a3
{
}

- (NSMutableDictionary)attributeDict
{
  return self->_attributeDict;
}

- (void)setAttributeDict:(id)a3
{
}

- (NSMutableArray)droppedEvents
{
  return self->_droppedEvents;
}

- (void)setDroppedEvents:(id)a3
{
}

@end