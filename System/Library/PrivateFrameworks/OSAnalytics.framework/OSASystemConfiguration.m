@interface OSASystemConfiguration
+ (id)automatedDeviceGroup;
+ (id)ensureUsablePath:(id)a3 component:(id)a4 options:(id)a5;
+ (id)sharedInstance;
+ (id)uidForUser:(id)a3;
+ (int64_t)fastLane;
+ (void)ensureConformanceOfFile:(int)a3 options:(id)a4;
+ (void)fastLane;
+ (void)setAutomatedDeviceGroup:(id)a3;
- ($A7169D069963E6D826465C174652914F)logDomain;
- (BOOL)appleInternal;
- (BOOL)carrierInstall;
- (BOOL)isAllowed:(id)a3 forDomain:(id)a4;
- (BOOL)isComputeController;
- (BOOL)isComputeNode;
- (BOOL)isConfigEnabled:(id)a3;
- (BOOL)isProxy;
- (BOOL)isWhitelisted:(id)a3 forDomain:(id)a4;
- (BOOL)multiUserMode;
- (BOOL)optIn3rdParty;
- (BOOL)optInApple;
- (BOOL)setPrefsKey:(id)a3 value:(id)a4 forDomain:(id)a5 withSync:(BOOL)a6;
- (BOOL)usesLegacySubmission:(id)a3;
- (NSMutableDictionary)submissionMetadata;
- (NSString)automatedDeviceGroup;
- (NSString)pathAWDTasking;
- (NSString)pathCATasking;
- (NSString)pathContainerRoot;
- (NSString)pathDiagnostics;
- (NSString)pathPreferences;
- (NSString)pathRoot;
- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4;
- (id)automatedContextURL;
- (id)awdReporterKey;
- (id)buildVersion;
- (id)crashReporterKey;
- (id)createReportMetadata:(id)a3 with:(id)a4 at:(double)a5 usingOptions:(id)a6;
- (id)currentTaskingIDByRouting;
- (id)experimentGroup;
- (id)getLogBlacklist;
- (id)getPrefsKey:(id)a3 forDomain:(id)a4 withOptions:(id)a5;
- (id)getPropsForLogType:(id)a3;
- (id)getTaskingKey:(id)a3;
- (id)identifier;
- (id)internalKey;
- (id)logExt:(id)a3;
- (id)logPathForType:(id)a3 at:(double)a4 options:(id)a5;
- (id)logPrefix:(id)a3;
- (id)modelCode;
- (id)osTrain;
- (id)pairedWatchOS;
- (id)pathSubmission;
- (id)pathSubmissionDataVault;
- (id)pathSubmissionSubdirDiagnosticLogs;
- (id)pathSubmissionWithHomeDirectory:(id)a3;
- (id)productBuildString;
- (id)productName;
- (id)productNameVersionBuildString;
- (id)productReleaseString;
- (id)productVersion;
- (id)releaseType;
- (id)seedGroup;
- (id)serialNumber;
- (id)submissionParam:(id)a3;
- (id)systemId;
- (id)targetAudience;
- (id)uiCountryCode;
- (void)onceConfig;
- (void)saveToPath:(id)a3;
- (void)setAutomatedDeviceGroup:(id)a3;
- (void)setPathRoot:(id)a3;
- (void)sysVersionData;
@end

@implementation OSASystemConfiguration

- (id)targetAudience
{
  [(OSASystemConfiguration *)self sysVersionData];
  targetAudience = self->super._targetAudience;
  return targetAudience;
}

- (void)sysVersionData
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__OSASystemConfiguration_sysVersionData__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (sysVersionData_pred != -1) {
    dispatch_once(&sysVersionData_pred, block);
  }
}

+ (void)ensureConformanceOfFile:(int)a3 options:(id)a4
{
  memset(&v35, 0, sizeof(v35));
  id v5 = a4;
  fstat(a3, &v35);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.7();
  }
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", @"file-owner-uid", *(_OWORD *)&v35.st_dev);

  uint64_t v7 = [v6 intValue];
  if (!geteuid() && v7)
  {
    uid_t st_uid = v35.st_uid;
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (st_uid == v7)
    {
      if (v9) {
        +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.5(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      if (v9) {
        +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.6(v7, v10, v11, v12, v13, v14, v15, v16);
      }
      fchown(a3, v7, 0xFFFFFFFF);
    }
  }
  gid_t st_gid = v35.st_gid;
  BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (st_gid == 250)
  {
    if (v18) {
      +[OSASystemConfiguration ensureConformanceOfFile:options:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    if (v18) {
      +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    fchown(a3, 0xFFFFFFFF, 0xFAu);
  }
  int st_mode = v35.st_mode;
  BOOL v27 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (st_mode == 432)
  {
    if (v27) {
      +[OSASystemConfiguration ensureConformanceOfFile:options:](v27, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  else
  {
    if (v27) {
      +[OSASystemConfiguration ensureConformanceOfFile:options:](v27, v28, v29, v30, v31, v32, v33, v34);
    }
    fchmod(a3, 0x1B0u);
  }
}

+ (id)ensureUsablePath:(id)a3 component:(id)a4 options:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  uint64_t v11 = v10;
  id v12 = v10;
  if (v8)
  {
    id v12 = [v10 stringByAppendingPathComponent:v8];
  }
  uint64_t v13 = [v9 objectForKeyedSubscript:kPathOptionUntrusted];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    uint64_t v15 = +[OSASystemConfiguration sharedInstance];
    uint64_t v16 = [v15 pathSubmission];
    v17 = [v16 stringByAppendingPathComponent:@"ProxiedDevice-"];

    id v12 = v12;
    if (realpath_DARWIN_EXTSN((const char *)[v12 UTF8String], (char *)v55) || *__error() == 2)
    {
      BOOL v18 = [NSString stringWithUTF8String:v55];
      if (([v12 containsString:@".."] & 1) == 0
        && v18
        && ([v18 hasPrefix:v17] & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      [v12 containsString:@".."];
      BOOL v18 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *__error();
      uint64_t v20 = __error();
      uint64_t v21 = strerror(*v20);
      *(_DWORD *)buf = 138544386;
      id v46 = v12;
      __int16 v47 = 2114;
      v48 = v18;
      __int16 v49 = 2114;
      v50 = v17;
      __int16 v51 = 1024;
      int v52 = v19;
      __int16 v53 = 2080;
      v54 = v21;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "FAILED untrusted path validation '%{public}@' -> '%{public}@' [%{public}@]. Error: %d %s", buf, 0x30u);
    }

    id v12 = 0;
    goto LABEL_14;
  }
LABEL_15:
  if ([v12 length])
  {
    uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v22 fileExistsAtPath:v12])
    {
      id v23 = v12;
      uint64_t v24 = [v23 fileSystemRepresentation];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke;
      v42[3] = &unk_1E5D1FB70;
      v43 = (OSASafeCreateDirectoryOptions *)v9;
      id v12 = v23;
      id v44 = v12;
      OSASafeOpenReadOnly(v24, v42);

      id v25 = 0;
      v26 = v43;
    }
    else
    {
      v26 = objc_alloc_init(OSASafeCreateDirectoryOptions);
      [(OSASafeCreateDirectoryOptions *)v26 setCreateIntermediates:1];
      BOOL v27 = [v9 objectForKeyedSubscript:@"file-owner-uid"];
      [(OSASafeCreateDirectoryOptions *)v26 setUserID:v27];

      [(OSASafeCreateDirectoryOptions *)v26 setGroupID:&unk_1EFE25580];
      [(OSASafeCreateDirectoryOptions *)v26 setFileProtectionNone:1];
      uint64_t v28 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
      id v41 = 0;
      BOOL v29 = OSASafeCreateDirectory(v28, 504, v26, &v41);
      id v25 = v41;

      BOOL v30 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
      if (v29)
      {
        if (v30)
        {
          *(_DWORD *)v55 = 138543362;
          id v56 = v12;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "created directory '%{public}@'", v55, 0xCu);
        }
      }
      else
      {
        if (v30)
        {
          *(_DWORD *)v55 = 138543618;
          id v56 = v12;
          __int16 v57 = 2114;
          id v58 = v25;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failed to create directory '%{public}@': %{public}@", v55, 0x16u);
        }

        id v12 = 0;
      }
    }

    if (v12)
    {
      if ([v22 isWritableFileAtPath:v12])
      {
        uint64_t v31 = [v9 objectForKeyedSubscript:kPathOptionNoBackup];
        int v32 = [v31 BOOLValue];

        if (v32)
        {
          uint64_t v33 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
          id v40 = 0;
          uint64_t v34 = *MEMORY[0x1E4F1C630];
          [v33 getResourceValue:&v40 forKey:*MEMORY[0x1E4F1C630] error:0];
          id v35 = v40;
          if ([v35 BOOLValue])
          {
            id v36 = v25;
          }
          else
          {
            id v39 = v25;
            char v37 = [v33 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v34 error:&v39];
            id v36 = v39;

            if ((v37 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v55 = 138543618;
              id v56 = v12;
              __int16 v57 = 2114;
              id v58 = v36;
              _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failed to set NSURLIsExcludedFromBackupKey '%{public}@': %{public}@", v55, 0x16u);
            }
          }

          id v25 = v36;
        }
      }
    }
  }
  return v12;
}

- (id)logPathForType:(id)a3 at:(double)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v9 objectForKeyedSubscript:@"override-fileName"];

  if (v10)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:@"override-fileName"];
  }
  else
  {
    if (logPathForType_at_options__lastAbsoluteTimeSeconds == (unint64_t)a4) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 3;
    }
    uint64_t v13 = OSADateFormat(v12, a4);
    if (logPathForType_at_options__lastAbsoluteTimeSeconds == (unint64_t)a4) {
      uint64_t v14 = logPathForType_at_options__collisionCount + 1;
    }
    else {
      uint64_t v14 = 0;
    }
    logPathForType_at_options__collisionCount = v14;
    logPathForType_at_options__lastAbsoluteTimeSeconds = (unint64_t)a4;
    uint64_t v15 = [v9 objectForKeyedSubscript:@"override-fileExt"];
    if (!v15
      || (uint64_t v16 = (void *)v15,
          [v9 objectForKeyedSubscript:@"override-fileExt"],
          v17 = objc_claimAutoreleasedReturnValue(),
          v16,
          !v17))
    {
      v17 = [(OSASystemConfiguration *)self logExt:v8];
    }
    BOOL v18 = [v9 objectForKeyedSubscript:@"override-filePrefix"];
    if (v18) {
      [v9 objectForKeyedSubscript:@"override-filePrefix"];
    }
    else {
    int v19 = [(OSASystemConfiguration *)self logPrefix:v8];
    }

    if (![v19 length])
    {
      id v20 = v8;

      int v19 = v20;
    }
    uint64_t v21 = NSString;
    unint64_t v22 = logPathForType_at_options__collisionCount;
    if ((unint64_t)logPathForType_at_options__collisionCount < 2)
    {
      id v23 = &stru_1EFE17BD0;
    }
    else
    {
      id v23 = [NSNumber numberWithUnsignedLong:logPathForType_at_options__collisionCount];
    }
    uint64_t v24 = [v21 stringWithFormat:@"%@-%@%@", v19, v13, v23];
    uint64_t v11 = [v24 stringByAppendingPathExtension:v17];

    if (v22 >= 2) {
  }
    }
  id v25 = [v11 stringByStandardizingPath];
  v26 = [v25 pathComponents];

  BOOL v27 = [v9 objectForKeyedSubscript:@"override-filePath"];

  if (v27)
  {
    uint64_t v28 = [v9 objectForKeyedSubscript:@"override-filePath"];
LABEL_27:
    uint64_t v31 = (void *)v28;
    goto LABEL_28;
  }
  BOOL v29 = [v9 objectForKeyedSubscript:@"datavault-filePath"];
  int v30 = [v29 BOOLValue];

  if (v30)
  {
    uint64_t v28 = [(OSASystemConfiguration *)self pathSubmissionDataVault];
    goto LABEL_27;
  }
  uint64_t v34 = [v9 objectForKeyedSubscript:@"file-owner"];
  uint64_t v31 = [(OSASystemConfiguration *)self pathSubmissionForOwner:v34];

LABEL_28:
  if ([v26 count] == 1)
  {
    int v32 = [v31 stringByAppendingPathComponent:v11];
  }
  else
  {
    int v32 = 0;
  }

  return v32;
}

- (id)logExt:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(OSASystemConfiguration *)self onceConfig];
  id v5 = [(OSASystemConfiguration *)self getPropsForLogType:v4];
  v6 = [v5 objectForKeyedSubscript:@"ext"];

  id v7 = [(OSASystemConfiguration *)self getPropsForLogType:v4];
  id v8 = [v7 objectForKeyedSubscript:@"routing"];

  id v9 = [(OSASystemConfiguration *)self getPropsForLogType:v4];

  id v10 = [v9 objectForKeyedSubscript:@"subrouting"];

  uint64_t v11 = v6;
  if (!v6)
  {
    if (v8 && v10)
    {
      v15[0] = v10;
      v15[1] = v8;
      unsigned int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
      uint64_t v13 = [v12 componentsJoinedByString:@"."];

      goto LABEL_8;
    }
    uint64_t v11 = @"ips";
    if (v8) {
      uint64_t v11 = v8;
    }
  }
  uint64_t v13 = v11;
LABEL_8:

  return v13;
}

- (id)getPropsForLogType:(id)a3
{
  id v4 = a3;
  [(OSASystemConfiguration *)self onceConfig];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
  {
    id v5 = [(NSString *)self->_pairedWatchOS objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)onceConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__OSASystemConfiguration_onceConfig__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (onceConfig_pred != -1) {
    dispatch_once(&onceConfig_pred, block);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke(uint64_t a1, int a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v4 setUsesSignificantDigits:1];
  [v4 setMaximumSignificantDigits:2];
  memset(&v34, 0, sizeof(v34));
  if (!fstat(a2, &v34) && (v34.st_mode & 0xF000) == 0x4000)
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"file-owner-uid"];
    stat buf = v34;
    BOOL v6 = OSASetOwnership(a2, (uint64_t)&buf, v5, &unk_1EFE25580);

    if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_2();
    }
    if (v34.st_gid == 250)
    {
      if ((v34.st_mode & 0x1FF) == 0x1F8) {
        goto LABEL_12;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        gid_t st_gid = v34.st_gid;
        if (v6)
        {
          uint64_t v11 = "";
        }
        else
        {
          unsigned int v12 = __error();
          uint64_t v11 = strerror(*v12);
        }
        buf.st_dev = 138544386;
        *(void *)&buf.int st_mode = v9;
        WORD2(buf.st_ino) = 1024;
        *(_DWORD *)((char *)&buf.st_ino + 6) = st_gid;
        HIWORD(buf.st_uid) = 1024;
        buf.gid_t st_gid = 250;
        LOWORD(buf.st_rdev) = 1024;
        *(dev_t *)((char *)&buf.st_rdev + 2) = v6;
        *((_WORD *)&buf.st_rdev + 3) = 2082;
        buf.st_atimespec.tv_sec = (__darwin_time_t)v11;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "=== Attempted change gid on existing path: %{public}@ from %d to _analyticsusers (%u) with result %d %{public}s", (uint8_t *)&buf, 0x28u);
      }

      if ((v34.st_mode & 0x1FF) == 0x1F8) {
        goto LABEL_27;
      }
    }
    int v13 = fchmod(a2, 0x1F8u);
    if (v13 == -1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_1();
    }
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      int st_mode = v34.st_mode;
      if (v13)
      {
        BOOL v18 = __error();
        int v19 = strerror(*v18);
      }
      else
      {
        int v19 = "";
      }
      buf.st_dev = 138544386;
      *(void *)&buf.int st_mode = v16;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = st_mode;
      HIWORD(buf.st_uid) = 1024;
      buf.gid_t st_gid = 504;
      LOWORD(buf.st_rdev) = 1024;
      *(dev_t *)((char *)&buf.st_rdev + 2) = v13 == 0;
      *((_WORD *)&buf.st_rdev + 3) = 2082;
      buf.st_atimespec.tv_sec = (__darwin_time_t)v19;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "=== Attempted change perms on existing path: %{public}@ from 0x%X to 0x%X with result %d %{public}s", (uint8_t *)&buf, 0x28u);
    }

LABEL_27:
    getprogname();
    id v20 = OSAGetBootTime();
    if (v20)
    {
      uint64_t v21 = NSNumber;
      unint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
      [v22 timeIntervalSinceDate:v20];
      id v23 = objc_msgSend(v21, "numberWithDouble:");
      uint64_t v24 = [v4 stringForObjectValue:v23];
    }
    else
    {
      uint64_t v24 = @"-1";
    }
    id v25 = OSAGetProcessUptime();
    if (v25)
    {
      v26 = NSNumber;
      BOOL v27 = [MEMORY[0x1E4F1C9C8] date];
      [v27 timeIntervalSinceDate:v25];
      uint64_t v28 = objc_msgSend(v26, "numberWithDouble:");
      BOOL v29 = [v4 stringForObjectValue:v28];
    }
    else
    {
      BOOL v29 = @"-1";
    }
    id v33 = *(id *)(a1 + 40);
    int v30 = v29;
    uint64_t v31 = v24;
    id v32 = v33;
    AnalyticsSendEventLazy();

    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_3(a1);
  }
LABEL_12:
}

- (BOOL)usesLegacySubmission:(id)a3
{
  return 0;
}

- (id)productNameVersionBuildString
{
  [(OSASystemConfiguration *)self sysVersionData];
  productNameVersionBuildString = self->super._productNameVersionBuildString;
  return productNameVersionBuildString;
}

- (id)pathSubmission
{
  v3 = [(OSASystemConfiguration *)self pathRoot];
  if ([(OSASystemConfiguration *)self multiUserMode]) {
    id v4 = @"Library/Logs/DiagnosticReports";
  }
  else {
    id v4 = @"Logs/CrashReporter";
  }
  id v5 = +[OSASystemConfiguration ensureUsablePath:v3 component:v4 options:0];

  return v5;
}

- (NSString)pathRoot
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__OSASystemConfiguration_pathRoot__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (pathRoot_onceToken != -1) {
    dispatch_once(&pathRoot_onceToken, block);
  }
  return (NSString *)self->_whitelistedDomains;
}

- (BOOL)multiUserMode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_multiUserMode__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (multiUserMode_pred != -1) {
    dispatch_once(&multiUserMode_pred, block);
  }
  return *(&self->super._isComputeNode + 3);
}

- (id)logPrefix:(id)a3
{
  id v4 = a3;
  [(OSASystemConfiguration *)self onceConfig];
  id v5 = [(OSASystemConfiguration *)self getPropsForLogType:v4];

  if (v5)
  {
    BOOL v6 = [v5 objectForKeyedSubscript:@"name"];
  }
  else
  {
    BOOL v6 = @"Unknown";
  }

  return v6;
}

- (id)createReportMetadata:(id)a3 with:(id)a4 at:(double)a5 usingOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11) {
    int v13 = (void *)[v11 mutableCopy];
  }
  else {
    int v13 = objc_opt_new();
  }
  uint64_t v14 = v13;
  id v15 = [v13 objectForKeyedSubscript:@"os_version"];

  if (!v15)
  {
    uint64_t v16 = [(OSASystemConfiguration *)self productNameVersionBuildString];
    [v14 setObject:v16 forKeyedSubscript:@"os_version"];
  }
  [v14 setObject:v10 forKeyedSubscript:@"bug_type"];
  if ([v10 isEqualToString:@"211"]) {
    a5 = OSATimeIntervalApproximate(a5);
  }
  v17 = OSADateFormat(1u, a5);
  [v14 setObject:v17 forKeyedSubscript:@"timestamp"];

  BOOL v18 = [v14 objectForKeyedSubscript:@"incident_id"];

  if (!v18)
  {
    int v19 = [MEMORY[0x1E4F29128] UUID];
    id v20 = [v19 UUIDString];
    [v14 setObject:v20 forKeyedSubscript:@"incident_id"];
  }
  return v14;
}

- (BOOL)appleInternal
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_appleInternal__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (appleInternal_pred != -1) {
    dispatch_once(&appleInternal_pred, block);
  }
  return *(&self->super._isComputeNode + 1);
}

+ (id)automatedDeviceGroup
{
  v2 = +[OSASystemConfiguration sharedInstance];
  v3 = [v2 automatedDeviceGroup];

  return v3;
}

+ (void)setAutomatedDeviceGroup:(id)a3
{
  id v3 = a3;
  id v4 = +[OSASystemConfiguration sharedInstance];
  [v4 setAutomatedDeviceGroup:v3];
}

- (BOOL)isProxy
{
  return 0;
}

- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)OSASystemConfiguration;
  id v5 = [(OSAProxyConfiguration *)&v10 assembleMetadataAt:*(void *)&a4 withOptions:a3];
  BOOL v6 = [(OSASystemConfiguration *)self pairedWatchOS];
  [v5 setValue:v6 forKey:@"pairedWatchOS"];

  if ([(OSASystemConfiguration *)self multiUserMode]) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = 0;
  }
  [v5 setValue:v7 forKey:@"multi_user_mode"];
  id v8 = [(OSASystemConfiguration *)self submissionMetadata];
  [v5 addEntriesFromDictionary:v8];

  return v5;
}

uint64_t __40__OSASystemConfiguration_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = objc_alloc_init(OSASystemConfiguration);
  return MEMORY[0x1F41817F8]();
}

- (NSMutableDictionary)submissionMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__OSASystemConfiguration_submissionMetadata__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (submissionMetadata_pred != -1) {
    dispatch_once(&submissionMetadata_pred, block);
  }
  return (NSMutableDictionary *)*(id *)&self->_appleInternal;
}

uint64_t __44__OSASystemConfiguration_submissionMetadata__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 200) = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (id)identifier
{
  return @"Primary";
}

uint64_t __39__OSASystemConfiguration_appleInternal__block_invoke(uint64_t a1)
{
  uint64_t result = os_variant_has_internal_diagnostics();
  *(unsigned char *)(*(void *)(a1 + 32) + 194) = result;
  return result;
}

- (BOOL)carrierInstall
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__OSASystemConfiguration_carrierInstall__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (carrierInstall_pred != -1) {
    dispatch_once(&carrierInstall_pred, block);
  }
  return *(&self->super._isComputeNode + 2);
}

uint64_t __40__OSASystemConfiguration_carrierInstall__block_invoke(uint64_t a1)
{
  uint64_t result = MGGetBoolAnswer();
  *(unsigned char *)(*(void *)(a1 + 32) + 195) = result;
  return result;
}

void __39__OSASystemConfiguration_multiUserMode__block_invoke(uint64_t a1)
{
  memset(&v3, 0, sizeof(v3));
  if ([*(id *)(a1 + 32) appleInternal] && !stat("/var/db/forceMultiUserMode", &v3))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v2[0]) = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Forcing Multi User Mode behavior due to the presence of /var/db/forceMultiUserMode", (uint8_t *)v2, 2u);
    }
    goto LABEL_8;
  }
  v2[0] = 0;
  if (!host_check_multiuser_mode(0, v2) && v2[0]) {
LABEL_8:
  }
    *(unsigned char *)(*(void *)(a1 + 32) + 196) = 1;
}

- (id)pairedWatchOS
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_pairedWatchOS__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (pairedWatchOS_pred != -1) {
    dispatch_once(&pairedWatchOS_pred, block);
  }
  return self->_submissionMetadata;
}

void __39__OSASystemConfiguration_pairedWatchOS__block_invoke(uint64_t a1)
{
  if (MGGetBoolAnswer())
  {
    v2 = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 4);
    if (v2)
    {
      stat v3 = v2;
      Class Class = objc_getClass("NRPairedDeviceRegistry");
      if (Class)
      {
        id v5 = [(objc_class *)Class sharedInstance];
        if ([v5 isPaired])
        {
          BOOL v6 = [v5 getActivePairedDevice];
          uint64_t v7 = [v6 valueForProperty:@"systemBuildVersion"];
          uint64_t v8 = *(void *)(a1 + 32);
          uint64_t v9 = *(void **)(v8 + 208);
          *(void *)(v8 + 208) = v7;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to dynamically link NRPairedDeviceRegistry from NanoRegistry", buf, 2u);
      }
      dlclose(v3);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to dynamically load NanoRegistry framework", v10, 2u);
    }
  }
}

- (id)modelCode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__OSASystemConfiguration_modelCode__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (modelCode_pred != -1) {
    dispatch_once(&modelCode_pred, block);
  }
  return self->super._modelCode;
}

void __35__OSASystemConfiguration_modelCode__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)uint64_t v7 = 0x100000006;
  memset(v6, 0, sizeof(v6));
  size_t v5 = 64;
  sysctl(v7, 2u, v6, &v5, 0, 0);
  uint64_t v2 = [NSString stringWithUTF8String:v6];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

void __40__OSASystemConfiguration_sysVersionData__block_invoke(uint64_t a1)
{
  id v34 = (id)_CFCopySupplementalVersionDictionary();
  uint64_t v2 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F1CD30]];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  uint64_t v8 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F1CD18]];
  uint64_t v9 = *(void *)(a1 + 32);
  objc_super v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v8;

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(__CFString **)(v11 + 32);
  if (!v12) {
    id v12 = @"???";
  }
  int v13 = *(__CFString **)(v11 + 48);
  if (!v13) {
    int v13 = @"???";
  }
  uint64_t v14 = [NSString stringWithFormat:@"%@:%@", v12, v13];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 64);
  *(void *)(v15 + 64) = v14;

  v17 = *(void **)(a1 + 32);
  BOOL v18 = (__CFString *)v17[9];
  if (!v18) {
    BOOL v18 = @"???";
  }
  int v19 = (__CFString *)v17[4];
  if (!v19) {
    int v19 = @"???";
  }
  id v20 = (__CFString *)v17[6];
  if (!v20) {
    id v20 = @"???";
  }
  uint64_t v21 = [NSString stringWithFormat:@"%@ %@ (%@)", v18, v19, v20];
  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = *(void **)(v22 + 80);
  *(void *)(v22 + 80) = v21;

  uint64_t v24 = *(void **)(a1 + 32);
  if (!v24[4])
  {
    v24[4] = @"<unknown>";

    uint64_t v24 = *(void **)(a1 + 32);
  }
  if (!v24[6])
  {
    v24[6] = @"<unknown>";

    uint64_t v24 = *(void **)(a1 + 32);
  }
  if (!v24[9])
  {
    v24[9] = @"<unknown>";

    uint64_t v24 = *(void **)(a1 + 32);
  }
  if ([v24 appleInternal])
  {
    uint64_t v25 = [NSString stringWithFormat:@"%@-internal", *(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v26 = *(void *)(a1 + 32);
    BOOL v27 = *(void **)(v26 + 88);
    *(void *)(v26 + 88) = v25;

    uint64_t v28 = *(void *)(a1 + 32);
    BOOL v29 = *(void **)(v28 + 40);
    int v30 = @"Internal";
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(*(void *)(a1 + 32) + 32));
    uint64_t v28 = *(void *)(a1 + 32);
    BOOL v29 = *(void **)(v28 + 40);
    int v30 = @"GM";
  }
  *(void *)(v28 + 40) = v30;

  uint64_t v31 = [NSString stringWithFormat:@"%@ %@", *(void *)(*(void *)(a1 + 32) + 72), *(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v32 = *(void *)(a1 + 32);
  id v33 = *(void **)(v32 + 56);
  *(void *)(v32 + 56) = v31;
}

- (id)productVersion
{
  [(OSASystemConfiguration *)self sysVersionData];
  productVersion = self->super._productVersion;
  return productVersion;
}

- (id)buildVersion
{
  [(OSASystemConfiguration *)self sysVersionData];
  buildVersion = self->super._buildVersion;
  return buildVersion;
}

- (id)productBuildString
{
  [(OSASystemConfiguration *)self sysVersionData];
  productBuildString = self->super._productBuildString;
  return productBuildString;
}

- (id)productName
{
  [(OSASystemConfiguration *)self sysVersionData];
  productName = self->super._productName;
  return productName;
}

- (id)productReleaseString
{
  [(OSASystemConfiguration *)self sysVersionData];
  productReleaseString = self->super._productReleaseString;
  return productReleaseString;
}

- (id)osTrain
{
  [(OSASystemConfiguration *)self sysVersionData];
  osTrain = self->super._osTrain;
  return osTrain;
}

- (id)uiCountryCode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_uiCountryCode__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (uiCountryCode_onceToken != -1) {
    dispatch_once(&uiCountryCode_onceToken, block);
  }
  if (self->super._uiCountryCode) {
    uiCountryCode = (__CFString *)self->super._uiCountryCode;
  }
  else {
    uiCountryCode = @"en";
  }
  return uiCountryCode;
}

void __39__OSASystemConfiguration_uiCountryCode__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v5 = v2;
  if (v2)
  {
    uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F1C400]];
  }
  else
  {
    uint64_t v3 = @"en";
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v3);
  id v4 = v5;
  if (v5)
  {

    id v4 = v5;
  }
}

- (id)systemId
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__OSASystemConfiguration_systemId__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (systemId_pred != -1) {
    dispatch_once(&systemId_pred, block);
  }
  return self->super._systemId;
}

void __34__OSASystemConfiguration_systemId__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) appleInternal];
  if (v2) {
    uint64_t v3 = (void *)MGCopyAnswer();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v3);
  if (v2)
  {
  }
}

- (id)serialNumber
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__OSASystemConfiguration_serialNumber__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (serialNumber_pred != -1) {
    dispatch_once(&serialNumber_pred, block);
  }
  return self->super._serialNumber;
}

void __38__OSASystemConfiguration_serialNumber__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) appleInternal];
  if (v2) {
    uint64_t v3 = (__CFString *)MGCopyAnswer();
  }
  else {
    uint64_t v3 = &stru_1EFE17BD0;
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v3);
  if (v2)
  {
  }
}

- (id)crashReporterKey
{
  uint64_t v3 = [MEMORY[0x1E4F83920] sharedClient];
  id v4 = [v3 crashreporterKey];
  crashReporterKey = self->super._crashReporterKey;
  self->super._crashReporterKey = v4;

  uint64_t v6 = self->super._crashReporterKey;
  return v6;
}

- (id)awdReporterKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__OSASystemConfiguration_awdReporterKey__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (awdReporterKey_pred != -1) {
    dispatch_once(&awdReporterKey_pred, block);
  }
  return self->super._awdReporterKey;
}

uint64_t __40__OSASystemConfiguration_awdReporterKey__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 128) = MGCopyAnswer();
  return MEMORY[0x1F41817F8]();
}

- (BOOL)setPrefsKey:(id)a3 value:(id)a4 forDomain:(id)a5 withSync:(BOOL)a6
{
  BOOL v6 = a6;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int v13 = [(OSASystemConfiguration *)self pathPreferences];
  uint64_t v14 = [v13 stringByAppendingPathComponent:@"/Library/Preferences/com.apple.OTACrashCopier.plist"];

  id v15 = v14;
  int v16 = open_dprotected_np((const char *)[v15 fileSystemRepresentation], 0, 0, 1);
  if (v16 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:]();
    }
LABEL_11:
    BOOL v32 = v6;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "setPrefs: delete old prefs and create placeholder", buf, 2u);
    }
    id v19 = v15;
    unlink((const char *)[v19 fileSystemRepresentation]);
    id v20 = [(OSASystemConfiguration *)self pathPreferences];
    uint64_t v41 = kPathOptionNoBackup;
    v42[0] = MEMORY[0x1E4F1CC38];
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    uint64_t v22 = +[OSASystemConfiguration ensureUsablePath:v20 component:@"/Library/Preferences" options:v21];

    if (v22)
    {
      id v23 = v19;
      uint64_t v24 = open_dprotected_np((const char *)[v23 UTF8String], 2561, 4, 0, 432);
      if ((v24 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v25 = *__error();
          uint64_t v26 = __error();
          BOOL v27 = strerror(*v26);
          *(_DWORD *)stat buf = 138413058;
          id v34 = v23;
          __int16 v35 = 1024;
          int v36 = v24;
          __int16 v37 = 1024;
          int v38 = v25;
          __int16 v39 = 2080;
          id v40 = v27;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "setPrefs: not created '%@' returned %d: %d %s", buf, 0x22u);
        }
      }
      else
      {
        +[OSASystemConfiguration ensureConformanceOfFile:v24 options:0];
        close(v24);
      }
    }

    BOOL v6 = v32;
    goto LABEL_19;
  }
  int v17 = v16;
  if (fcntl(v16, 63) == 4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:]();
    }
    close(v17);
    goto LABEL_19;
  }
  int v18 = fcntl(v17, 64, 4);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:]();
  }
  close(v17);
  if (v18 == -1) {
    goto LABEL_11;
  }
LABEL_19:
  uint64_t v28 = [(OSASystemConfiguration *)self pathPreferences];
  _CFPreferencesSetAppValueWithContainer();

  if (v6)
  {
    BOOL v29 = [(OSASystemConfiguration *)self pathPreferences];
    BOOL v30 = _CFPreferencesAppSynchronizeWithContainer() != 0;
  }
  else
  {
    BOOL v30 = 1;
  }

  return v30;
}

- (id)getPrefsKey:(id)a3 forDomain:(id)a4 withOptions:(id)a5
{
  uint64_t v7 = (__CFString *)a3;
  uint64_t v8 = (__CFString *)a4;
  uint64_t v9 = [(OSASystemConfiguration *)self pathPreferences];

  if (!v9
    || ([(OSASystemConfiguration *)self pathPreferences],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = (void *)_CFPreferencesCopyAppValueWithContainer(),
        v10,
        !v11))
  {
    if (xpc_user_sessions_enabled())
    {
      int v17 = 0;
      if (!xpc_user_sessions_get_foreground_uid())
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.4((uint64_t)v7, &v17);
        }
        goto LABEL_15;
      }
      UserIdentifierForUID = (__CFString *)_CFPreferencesGetUserIdentifierForUID();
      if (!UserIdentifierForUID)
      {
LABEL_15:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:]((uint64_t)v7);
        }
        UserIdentifierForUID = 0;
        goto LABEL_18;
      }
    }
    else
    {
      UserIdentifierForUID = @"mobile";
    }
    CFPropertyListRef v13 = CFPreferencesCopyValue(v7, v8, UserIdentifierForUID, (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    if (v13)
    {
      id v11 = (void *)v13;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:]();
      }
      goto LABEL_21;
    }
LABEL_18:

    uint64_t v14 = [(__CFString *)v8 stringByAppendingPathExtension:@"plist"];
    UserIdentifierForUID = [@"/Library/Managed Preferences/mobile/" stringByAppendingPathComponent:v14];

    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:UserIdentifierForUID];
    id v11 = [v15 objectForKeyedSubscript:v7];

    if (v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:]();
    }
LABEL_21:

    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.5(self);
  }
LABEL_22:

  return v11;
}

- (id)getTaskingKey:(id)a3
{
  return [(OSASystemConfiguration *)self getPrefsKey:a3 forDomain:@"com.apple.da" withOptions:0];
}

+ (int64_t)fastLane
{
  int v2 = +[OSASystemConfiguration sharedInstance];
  uint64_t v3 = [v2 getTaskingKey:@"fastLane"];

  if (!v3)
  {
LABEL_7:
    int64_t v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        +[OSASystemConfiguration fastLane]((uint64_t)v3);
      }
      goto LABEL_7;
    }
  }
  int64_t v4 = [v3 integerValue];
LABEL_8:

  return v4;
}

- (id)experimentGroup
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__OSASystemConfiguration_experimentGroup__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (experimentGroup_onceToken != -1) {
    dispatch_once(&experimentGroup_onceToken, block);
  }
  return self->super._experimentGroup;
}

void __41__OSASystemConfiguration_experimentGroup__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) getPrefsKey:@"ExperimentGroup" forDomain:@"com.apple.da" withOptions:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v2 = v3;
  }
  else {
    int v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), v2);
}

- (NSString)automatedDeviceGroup
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__OSASystemConfiguration_automatedDeviceGroup__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (automatedDeviceGroup_onceToken != -1) {
    dispatch_once(&automatedDeviceGroup_onceToken, block);
  }
  return self->super._automatedDeviceGroup;
}

void __46__OSASystemConfiguration_automatedDeviceGroup__block_invoke(uint64_t a1)
{
  int v2 = +[OSADefaults objectForKey:@"AutomatedDeviceGroup"];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) getPrefsKey:@"AutomatedDeviceGroup" forDomain:@"com.apple.da" withOptions:0];
  }
  id v6 = v4;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v6;
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), v5);
}

- (void)setAutomatedDeviceGroup:(id)a3
{
  id v4 = (NSString *)a3;
  +[OSADefaults setObject:v4 forKey:@"AutomatedDeviceGroup"];
  automatedDeviceGroup = self->super._automatedDeviceGroup;
  self->super._automatedDeviceGroup = v4;
}

- (id)automatedContextURL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__OSASystemConfiguration_automatedContextURL__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (automatedContextURL_onceToken != -1) {
    dispatch_once(&automatedContextURL_onceToken, block);
  }
  return self->super._automatedContextURL;
}

void __45__OSASystemConfiguration_automatedContextURL__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) getPrefsKey:@"AutomatedContextURL" forDomain:@"com.apple.da" withOptions:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v2 = v3;
  }
  else {
    int v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), v2);
}

- (id)releaseType
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__OSASystemConfiguration_releaseType__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (releaseType_pred != -1) {
    dispatch_once(&releaseType_pred, block);
  }
  if (self->super._releaseType) {
    releaseType = (__CFString *)self->super._releaseType;
  }
  else {
    releaseType = @"User";
  }
  return releaseType;
}

uint64_t __37__OSASystemConfiguration_releaseType__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 144) = MGCopyAnswer();
  return MEMORY[0x1F41817F8]();
}

- (id)seedGroup
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__OSASystemConfiguration_seedGroup__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (seedGroup_pred != -1) {
    dispatch_once(&seedGroup_pred, block);
  }
  return self->super._seedGroup;
}

uint64_t __35__OSASystemConfiguration_seedGroup__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = CFPreferencesCopyAppValue(@"SeedGroup", @".GlobalPreferences");
  return MEMORY[0x1F41817F8]();
}

- (id)currentTaskingIDByRouting
{
  return +[OSATasking getInstalledTaskIds];
}

- (id)internalKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__OSASystemConfiguration_internalKey__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (internalKey_pred != -1) {
    dispatch_once(&internalKey_pred, block);
  }
  return self->super._internalKey;
}

void __37__OSASystemConfiguration_internalKey__block_invoke(uint64_t a1)
{
  v44[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) appleInternal])
  {
    uint64_t v29 = 0;
    BOOL v30 = &v29;
    uint64_t v31 = 0x3032000000;
    BOOL v32 = __Block_byref_object_copy__2;
    id v33 = __Block_byref_object_dispose__2;
    id v34 = 0;
    if (AccountsLibraryCore())
    {
      dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
      uint64_t v40 = 0;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x2050000000;
      id v3 = (void *)getACAccountStoreClass_softClass;
      uint64_t v43 = getACAccountStoreClass_softClass;
      if (!getACAccountStoreClass_softClass)
      {
        uint64_t v35 = MEMORY[0x1E4F143A8];
        uint64_t v36 = 3221225472;
        __int16 v37 = __getACAccountStoreClass_block_invoke;
        int v38 = &unk_1E5D1F8E0;
        __int16 v39 = &v40;
        __getACAccountStoreClass_block_invoke((uint64_t)&v35);
        id v3 = (void *)v41[3];
      }
      id v4 = v3;
      _Block_object_dispose(&v40, 8);
      id v5 = objc_alloc_init(v4);
      uint64_t v40 = 0;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x2020000000;
      id v6 = (id *)getACAccountTypeIdentifierIMAPSymbolLoc_ptr;
      uint64_t v43 = getACAccountTypeIdentifierIMAPSymbolLoc_ptr;
      if (!getACAccountTypeIdentifierIMAPSymbolLoc_ptr)
      {
        uint64_t v35 = MEMORY[0x1E4F143A8];
        uint64_t v36 = 3221225472;
        __int16 v37 = __getACAccountTypeIdentifierIMAPSymbolLoc_block_invoke;
        int v38 = &unk_1E5D1F8E0;
        __int16 v39 = &v40;
        uint64_t v7 = (void *)AccountsLibrary();
        uint64_t v8 = dlsym(v7, "ACAccountTypeIdentifierIMAP");
        *(void *)(v39[1] + 24) = v8;
        getACAccountTypeIdentifierIMAPSymbolLoc_ptr = *(void *)(v39[1] + 24);
        id v6 = (id *)v41[3];
      }
      _Block_object_dispose(&v40, 8);
      if (!v6)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      id v9 = *v6;
      v44[0] = v9;
      id v10 = getACAccountTypeIdentifierExchange();
      v44[1] = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      int v25 = __37__OSASystemConfiguration_internalKey__block_invoke_331;
      uint64_t v26 = &unk_1E5D1FB20;
      uint64_t v28 = &v29;
      id v12 = v2;
      BOOL v27 = v12;
      [v5 visibleTopLevelAccountsWithAccountTypeIdentifiers:v11 completion:&v23];

      dispatch_time_t v13 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v12, v13);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __37__OSASystemConfiguration_internalKey__block_invoke_cold_1();
    }
    uint64_t v14 = [*(id *)(a1 + 32) serialNumber];
    id v15 = NSString;
    int v16 = (__CFString *)v30[5];
    uint64_t v17 = [(__CFString *)v14 length];
    int v18 = &stru_1EFE17BD0;
    if (v16) {
      int v18 = v16;
    }
    id v19 = @"<no_sn>";
    if (v17) {
      id v19 = v14;
    }
    uint64_t v20 = [v15 stringWithFormat:@"%@;%@", v18, v19, v23, v24, v25, v26];
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void **)(v21 + 136);
    *(void *)(v21 + 136) = v20;

    _Block_object_dispose(&v29, 8);
  }
}

void __37__OSASystemConfiguration_internalKey__block_invoke_331(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v24 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v50 count:16];
  if (v27)
  {
    id v6 = MEMORY[0x1E4F14500];
    uint64_t v26 = *(void *)v33;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v33 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * v7);
      if (!DataAccessLibraryCore()) {
        goto LABEL_48;
      }
      id v9 = [v8 accountType];
      id v10 = [v9 identifier];
      id v11 = getACAccountTypeIdentifierExchange();
      int v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl(&dword_1A7C6D000, v6, OS_LOG_TYPE_DEFAULT, "Using kDAAccountEmailAddress to fetch Exchange email addresses.", buf, 2u);
        }
        uint64_t v41 = 0;
        uint64_t v42 = &v41;
        uint64_t v43 = 0x2020000000;
        dispatch_time_t v13 = (void *)getkDAAccountEmailAddressSymbolLoc_ptr;
        uint64_t v44 = getkDAAccountEmailAddressSymbolLoc_ptr;
        if (!getkDAAccountEmailAddressSymbolLoc_ptr)
        {
          *(void *)stat buf = MEMORY[0x1E4F143A8];
          uint64_t v37 = 3221225472;
          int v38 = __getkDAAccountEmailAddressSymbolLoc_block_invoke;
          __int16 v39 = &unk_1E5D1F8E0;
          uint64_t v40 = &v41;
          __getkDAAccountEmailAddressSymbolLoc_block_invoke((uint64_t)buf);
          dispatch_time_t v13 = (void *)v42[3];
        }
        _Block_object_dispose(&v41, 8);
        if (!v13) {
          goto LABEL_45;
        }
      }
      else
      {
LABEL_48:
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl(&dword_1A7C6D000, v6, OS_LOG_TYPE_DEFAULT, "Using ACAccountPropertyIdentityEmailAddress to fetch email addresses.", buf, 2u);
        }
        uint64_t v41 = 0;
        uint64_t v42 = &v41;
        uint64_t v43 = 0x2020000000;
        dispatch_time_t v13 = (void *)getACEmailAliasKeyEmailAddressesSymbolLoc_ptr;
        uint64_t v44 = getACEmailAliasKeyEmailAddressesSymbolLoc_ptr;
        if (!getACEmailAliasKeyEmailAddressesSymbolLoc_ptr)
        {
          *(void *)stat buf = MEMORY[0x1E4F143A8];
          uint64_t v37 = 3221225472;
          int v38 = __getACEmailAliasKeyEmailAddressesSymbolLoc_block_invoke;
          __int16 v39 = &unk_1E5D1F8E0;
          uint64_t v40 = &v41;
          uint64_t v14 = (void *)AccountsLibrary();
          id v15 = dlsym(v14, "ACEmailAliasKeyEmailAddresses");
          *(void *)(v40[1] + 24) = v15;
          getACEmailAliasKeyEmailAddressesSymbolLoc_ptr = *(void *)(v40[1] + 24);
          dispatch_time_t v13 = (void *)v42[3];
        }
        _Block_object_dispose(&v41, 8);
        if (!v13)
        {
LABEL_45:
          getACAccountTypeIdentifierExchange_cold_1();
          __break(1u);
        }
      }
      int v16 = [v8 objectForKeyedSubscript:*v13];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __37__OSASystemConfiguration_internalKey__block_invoke_331_cold_3(v48, v16, &v49);
      }
      if (!v16)
      {
        int v16 = [v8 username];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          __37__OSASystemConfiguration_internalKey__block_invoke_331_cold_2(v46, v16, &v47);
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = [v16 allKeys];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = [v16 componentsSeparatedByString:@","];
          }
          else
          {
            id v17 = 0;
          }
        }
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ([v22 hasSuffix:@"@apple.com"])
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v22);
              goto LABEL_41;
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v45 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
LABEL_41:

      BOOL v23 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0;
      if (!v23) {
        break;
      }
      if (++v7 == v27)
      {
        uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v50 count:16];
        if (v27) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isComputeController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__OSASystemConfiguration_isComputeController__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (isComputeController_onceToken != -1) {
    dispatch_once(&isComputeController_onceToken, block);
  }
  return self->super._isComputeController;
}

uint64_t __45__OSASystemConfiguration_isComputeController__block_invoke(uint64_t a1)
{
  uint64_t result = MGCopyAnswer();
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = result == *MEMORY[0x1E4F1CFD0];
  return result;
}

- (BOOL)isComputeNode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_isComputeNode__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (isComputeNode_onceToken != -1) {
    dispatch_once(&isComputeNode_onceToken, block);
  }
  return self->super._isComputeNode;
}

uint64_t __39__OSASystemConfiguration_isComputeNode__block_invoke(uint64_t a1)
{
  uint64_t result = MGCopyAnswer();
  *(unsigned char *)(*(void *)(a1 + 32) + 193) = result == *MEMORY[0x1E4F1CFD0];
  return result;
}

- (void)saveToPath:(id)a3
{
  id v4 = a3;
  id v6 = [(OSAProxyConfiguration *)self metadata];
  id v5 = [v4 stringByAppendingPathComponent:@"deviceMetadata.proxy"];

  [v6 writeToFile:v5 atomically:1];
}

void __36__OSASystemConfiguration_onceConfig__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 pathForResource:@"submissionConfig" ofType:@"plist"];

  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"/System/Library/PrivateFrameworks/OSAnalytics.framework/submissionConfig.plist";
  }
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"log_types"];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 216);
    *(void *)(v8 + 216) = v7;

    if ([*(id *)(a1 + 32) multiUserMode]
      && (getpid(), int v25 = "/private/var/mobile/Library/OSAnalytics/Preferences", sandbox_check()))
    {
      id v10 = 0;
    }
    else
    {
      id v11 = +[OSASystemConfiguration sharedInstance];
      id v10 = [v11 getTaskingKey:@"disabledLogs"];

      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            int v12 = [v10 componentsJoinedByString:@", "];
            *(_DWORD *)stat buf = 138412290;
            uint64_t v27 = v12;
            dispatch_time_t v13 = MEMORY[0x1E4F14500];
            uint64_t v14 = "tasked blacklist: %@";
            os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
            _os_log_impl(&dword_1A7C6D000, v13, v15, v14, buf, 0xCu);
          }
LABEL_15:
          uint64_t v16 = objc_msgSend(v10, "copy", v25);
          uint64_t v17 = *(void *)(a1 + 32);
          id v18 = *(void **)(v17 + 224);
          *(void *)(v17 + 224) = v16;

          uint64_t v19 = [v6 objectForKeyedSubscript:@"submission_params"];
          uint64_t v20 = *(void *)(a1 + 32);
          uint64_t v21 = *(void **)(v20 + 232);
          *(void *)(v20 + 232) = v19;

          uint64_t v22 = [v6 objectForKeyedSubscript:@"whitelisted_domains"];
          uint64_t v23 = *(void *)(a1 + 32);
          id v24 = *(void **)(v23 + 240);
          *(void *)(v23 + 240) = v22;

          goto LABEL_18;
        }
      }
    }

    id v10 = &unk_1EFE25E20;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v12 = [&unk_1EFE25E20 componentsJoinedByString:@", "];
      *(_DWORD *)stat buf = 138412290;
      uint64_t v27 = v12;
      dispatch_time_t v13 = MEMORY[0x1E4F14500];
      uint64_t v14 = "no blacklist tasking: applying default: %@";
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138412290;
    uint64_t v27 = v4;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to load %@", buf, 0xCu);
  }
LABEL_18:
}

- (id)getLogBlacklist
{
  [(OSASystemConfiguration *)self onceConfig];
  logConfig = self->_logConfig;
  return logConfig;
}

- (BOOL)isConfigEnabled:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"eOS"];
  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"eOS"];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

id __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_416(uint64_t a1)
{
  v15[14] = *MEMORY[0x1E4F143B8];
  v14[0] = @"progname";
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2)
  {
    id v3 = [NSString stringWithUTF8String:v2];
  }
  else
  {
    id v3 = @"<unknown>";
  }
  v15[0] = v3;
  v15[1] = MEMORY[0x1E4F1CC28];
  v14[1] = @"create_dir";
  v14[2] = @"path";
  id v4 = *(__CFString **)(a1 + 32);
  if (!v4) {
    id v4 = @"path sanitize failed";
  }
  v15[2] = v4;
  v14[3] = @"original_perms";
  id v5 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 68)];
  void v15[3] = v5;
  v14[4] = @"modify_perms";
  char v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 208)];
  v15[4] = v6;
  v14[5] = @"modify_perms_success";
  uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 209)];
  v15[5] = v7;
  v15[6] = &unk_1EFE25598;
  v14[6] = @"modify_perms_value";
  v14[7] = @"original_gid";
  uint64_t v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
  v15[7] = v8;
  v14[8] = @"modify_gid";
  id v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 210)];
  v15[8] = v9;
  v14[9] = @"modify_gid_success";
  id v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 211)];
  v15[9] = v10;
  v15[10] = &unk_1EFE25580;
  v14[10] = @"modify_gid_value";
  v14[11] = @"boot_time_appx";
  uint64_t v11 = *(void *)(a1 + 48);
  v15[11] = *(void *)(a1 + 40);
  v15[12] = v11;
  v14[12] = @"proc_uptime_appx";
  v14[13] = @"framework";
  v15[13] = @"OSAnalytics";
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:14];

  if (v2) {
  return v12;
  }
}

- (void)setPathRoot:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  int v7[2] = __38__OSASystemConfiguration_setPathRoot___block_invoke;
  v7[3] = &unk_1E5D1FB98;
  v7[4] = self;
  id v8 = v4;
  uint64_t v5 = setPathRoot__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&setPathRoot__onceToken, v7);
  }
}

void __38__OSASystemConfiguration_setPathRoot___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) appleInternal] || (uint64_t v2 = *(void **)(a1 + 32), v2[31]))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 248);
    int v8 = 138412290;
    uint64_t v9 = v3;
    id v4 = MEMORY[0x1E4F14500];
    uint64_t v5 = "unable to override default log root location because already set as %@";
    goto LABEL_5;
  }
  id v6 = (id)[v2 pathRoot];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), *(id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 248);
    int v8 = 138412290;
    uint64_t v9 = v7;
    id v4 = MEMORY[0x1E4F14500];
    uint64_t v5 = "overriding default log root location to %@";
LABEL_5:
    _os_log_impl(&dword_1A7C6D000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, 0xCu);
  }
}

uint64_t __34__OSASystemConfiguration_pathRoot__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) multiUserMode];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(*(void *)(a1 + 32) + 248) = [v3 pathContainerRoot];
  }
  else
  {
    v3[31] = @"/private/var/mobile/Library";
  }
  return MEMORY[0x1F41817F8]();
}

- (NSString)pathContainerRoot
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__OSASystemConfiguration_pathContainerRoot__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (pathContainerRoot_onceToken != -1) {
    dispatch_once(&pathContainerRoot_onceToken, block);
  }
  return self->_pathRoot;
}

void __43__OSASystemConfiguration_pathContainerRoot__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = container_system_group_path_for_identifier();
  if (v2)
  {
    uint64_t v3 = (char *)v2;
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [v4 stringWithFileSystemRepresentation:v3 length:strlen(v3)];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 256);
    *(void *)(v6 + 256) = v5;

    free(v3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 134217984;
    uint64_t v11 = 1;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error getting system group container: %llu", buf, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 256))
  {
    *(void *)(v8 + 256) = @"/tmp";
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 256);
    *(_DWORD *)stat buf = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Using system group container: '%{public}@'", buf, 0xCu);
  }
}

- (id)pathSubmissionDataVault
{
  uint64_t v2 = [(OSASystemConfiguration *)self pathContainerRoot];
  uint64_t v3 = +[OSASystemConfiguration ensureUsablePath:v2 component:@"DiagnosticReports" options:0];

  return v3;
}

- (id)pathSubmissionWithHomeDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(OSASystemConfiguration *)self pathSubmission];
  if (v5)
  {
    uint64_t v6 = [v4 stringByStandardizingPath];
    uint64_t v7 = [(OSASystemConfiguration *)self pathSubmission];
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)pathSubmissionSubdirDiagnosticLogs
{
  uint64_t v2 = [(OSASystemConfiguration *)self pathSubmission];
  uint64_t v3 = +[OSASystemConfiguration ensureUsablePath:v2 component:@"DiagnosticLogs" options:0];

  return v3;
}

+ (id)uidForUser:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = getpwnam((const char *)[v3 UTF8String]);
  if (v4)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInt:v4->pw_uid];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to fetch UID from unknown user '%@'", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (NSString)pathPreferences
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__OSASystemConfiguration_pathPreferences__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (pathPreferences_onceToken != -1) {
    dispatch_once(&pathPreferences_onceToken, block);
  }
  return self->_pathContainerRoot;
}

void __41__OSASystemConfiguration_pathPreferences__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) pathRoot];
  if ([*(id *)(a1 + 32) multiUserMode]) {
    id v3 = @"Preferences";
  }
  else {
    id v3 = @"OSAnalytics/Preferences";
  }
  uint64_t v8 = kPathOptionNoBackup;
  v9[0] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v5 = +[OSASystemConfiguration ensureUsablePath:v2 component:v3 options:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v5;
}

- (NSString)pathDiagnostics
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__OSASystemConfiguration_pathDiagnostics__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (pathDiagnostics_onceToken != -1) {
    dispatch_once(&pathDiagnostics_onceToken, block);
  }
  return self->_pathPreferences;
}

void __41__OSASystemConfiguration_pathDiagnostics__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) pathRoot];
  if ([*(id *)(a1 + 32) multiUserMode]) {
    id v3 = @"Diagnostics";
  }
  else {
    id v3 = @"OSAnalytics/Diagnostics";
  }
  uint64_t v8 = kPathOptionNoBackup;
  v9[0] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v5 = +[OSASystemConfiguration ensureUsablePath:v2 component:v3 options:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v5;
}

- (NSString)pathCATasking
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__OSASystemConfiguration_pathCATasking__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (pathCATasking_onceToken != -1) {
    dispatch_once(&pathCATasking_onceToken, block);
  }
  return self->_pathDiagnostics;
}

void __39__OSASystemConfiguration_pathCATasking__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) pathContainerRoot];
  uint64_t v7 = kPathOptionNoBackup;
  v8[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v4 = +[OSASystemConfiguration ensureUsablePath:v2 component:@"/Library/CoreAnalytics" options:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v4;
}

- (NSString)pathAWDTasking
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__OSASystemConfiguration_pathAWDTasking__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (pathAWDTasking_onceToken != -1) {
    dispatch_once(&pathAWDTasking_onceToken, block);
  }
  return self->_pathCATasking;
}

void __40__OSASystemConfiguration_pathAWDTasking__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) pathRoot];
  uint64_t v7 = kPathOptionNoBackup;
  v8[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v4 = +[OSASystemConfiguration ensureUsablePath:v2 component:@"/Library/AWD" options:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v4;
}

- (id)submissionParam:(id)a3
{
  id v4 = a3;
  [(OSASystemConfiguration *)self onceConfig];
  uint64_t v5 = [(NSSet *)self->_logBlacklist objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)isWhitelisted:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(OSASystemConfiguration *)self onceConfig];
  if ([(OSASystemConfiguration *)self appleInternal])
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [(NSDictionary *)self->_submissionParams objectForKeyedSubscript:v7];
    char v8 = [v9 containsObject:v6];
  }
  return v8;
}

- (BOOL)isAllowed:(id)a3 forDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(OSASystemConfiguration *)self onceConfig];
  char v8 = [(NSDictionary *)self->_submissionParams objectForKeyedSubscript:v6];

  LOBYTE(v6) = [v8 containsObject:v7];
  return (char)v6;
}

- ($A7169D069963E6D826465C174652914F)logDomain
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__OSASystemConfiguration_logDomain__block_invoke;
  block[3] = &unk_1E5D1F5F0;
  block[4] = self;
  if (logDomain_onceToken != -1) {
    dispatch_once(&logDomain_onceToken, block);
  }
  return ($A7169D069963E6D826465C174652914F)self->_pathAWDTasking;
}

uint64_t __35__OSASystemConfiguration_logDomain__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 296) = os_log_create("com.apple.osanalytics.daFlow", "reports");
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathCATasking, 0);
  objc_storeStrong((id *)&self->_pathDiagnostics, 0);
  objc_storeStrong((id *)&self->_pathPreferences, 0);
  objc_storeStrong((id *)&self->_pathContainerRoot, 0);
  objc_storeStrong((id *)&self->_pathRoot, 0);
  objc_storeStrong((id *)&self->_whitelistedDomains, 0);
  objc_storeStrong((id *)&self->_submissionParams, 0);
  objc_storeStrong((id *)&self->_logBlacklist, 0);
  objc_storeStrong((id *)&self->_logConfig, 0);
  objc_storeStrong((id *)&self->_pairedWatchOS, 0);
  objc_storeStrong((id *)&self->_submissionMetadata, 0);
  objc_storeStrong((id *)&self->_appleInternal, 0);
}

- (BOOL)optInApple
{
  return checkMCFeature("MCFeatureDiagnosticsSubmissionAllowed", &optInApple_featureDiagnosticsSubmissionAllowed);
}

- (BOOL)optIn3rdParty
{
  return checkMCFeature("MCFeatureAppAnalyticsAllowed", &optIn3rdParty_featureAppAnalyticsAllowed);
}

- (void)setPrefsKey:value:forDomain:withSync:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

- (void)setPrefsKey:value:forDomain:withSync:.cold.2()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x22u);
}

- (void)setPrefsKey:value:forDomain:withSync:.cold.3()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x1Cu);
}

- (void)getPrefsKey:forDomain:withOptions:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7C6D000, MEMORY[0x1E4F14500], v0, "found ManagedPreferences pref %@: %@", v1, v2, v3, v4, v5);
}

- (void)getPrefsKey:(uint64_t)a1 forDomain:withOptions:.cold.2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to retrieve a valid user to access preferences container for key %{public}@", (uint8_t *)&v1, 0xCu);
}

- (void)getPrefsKey:forDomain:withOptions:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7C6D000, MEMORY[0x1E4F14500], v0, "found fallback user defaults %@: %@", v1, v2, v3, v4, v5);
}

- (void)getPrefsKey:(uint64_t)a1 forDomain:(int *)a2 withOptions:.cold.4(uint64_t a1, int *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = *a2;
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 1026;
  int v6 = v2;
  __int16 v7 = 2082;
  uint64_t v8 = xpc_strerror();
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempted xpc_user_sessions_get_foreground_uid() while fetching preferences for key %{public}@ but failed with error %{public}d - %{public}s", (uint8_t *)&v3, 0x1Cu);
}

- (void)getPrefsKey:(void *)a1 forDomain:withOptions:.cold.5(void *a1)
{
  uint64_t v1 = [a1 pathPreferences];
  OUTLINED_FUNCTION_1(&dword_1A7C6D000, MEMORY[0x1E4F14500], v2, "found containerized defaults from %@: %@", v3, v4, v5, v6, 2u);
}

+ (void)fastLane
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  _os_log_fault_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unexpected tasking value type for key 'fastLane' (type: %{public}@, value: %{public}@) encountered", (uint8_t *)&v4, 0x16u);
}

void __37__OSASystemConfiguration_internalKey__block_invoke_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to load Accounts framework", v0, 2u);
}

void __37__OSASystemConfiguration_internalKey__block_invoke_331_cold_2(uint8_t *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "No addresses fetched. So using username. %@", a1, 0xCu);
}

void __37__OSASystemConfiguration_internalKey__block_invoke_331_cold_3(uint8_t *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Fetched addresses: %@", a1, 0xCu);
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to modify permissions of %@: %s", v1, 0x16u);
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to modify ownership of %@: %s", v1, 0x16u);
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@ is valid but couldn't stat or it's not a directory", (uint8_t *)&v2, 0xCu);
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:options:.cold.7()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x14u);
}

@end