@interface SUUtility
+ (BOOL)alarmSetBeforeDate:(id)a3;
+ (BOOL)appDemotionIsEnabled;
+ (BOOL)cellularDataIsEnabled;
+ (BOOL)currentReleaseTypeIsInternal;
+ (BOOL)deleteAUKeepAliveFile;
+ (BOOL)deleteKeepAliveFile;
+ (BOOL)deleteKeepAliveFilePath:(id)a3;
+ (BOOL)hasCellularRadio;
+ (BOOL)isCellularDataCapable;
+ (BOOL)isDaemon;
+ (BOOL)isLockdownModeEnabled;
+ (BOOL)isProductionFused;
+ (BOOL)isSplatOnlyUpdateInstalled;
+ (BOOL)isSplatRollbackDirectoryPresent;
+ (BOOL)isVirtualDevice;
+ (BOOL)isWiFiCapable;
+ (BOOL)writeAUKeepAliveFile;
+ (BOOL)writeKeepAliveFile;
+ (BOOL)writeKeepAliveFilePath:(id)a3;
+ (double)autoDownloadTimeInterval;
+ (double)autoScanTimeInterval;
+ (id)URLIfFileExists:(id)a3;
+ (id)addToDate:(id)a3 numberOfDays:(int64_t)a4;
+ (id)appDemotionSettingQueue;
+ (id)autoDownloadExpiredError:(BOOL)a3;
+ (id)bootTime;
+ (id)currentDeviceName;
+ (id)currentHWModelStr;
+ (id)currentProductBuild;
+ (id)currentProductCategory;
+ (id)currentProductType;
+ (id)currentProductVersion;
+ (id)currentReleaseType;
+ (id)documentationDataForInstalledUpdateType:(int)a3 error:(id *)a4;
+ (id)errorRemovingUserInfoKey:(id)a3 originalError:(id)a4;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 originalError:(id)a4;
+ (id)fastWorkQueue;
+ (id)gregorianCalendar;
+ (id)internalRecoveryStringForErrorCode:(int64_t)a3;
+ (id)mainWorkQueue;
+ (id)prettyPrintDate:(id)a3;
+ (id)serialNumber;
+ (id)systemContainerURL;
+ (id)taskQueue;
+ (id)translateError:(id)a3;
+ (id)translateError:(id)a3 withAddedUserInfo:(id)a4;
+ (id)updateError:(id)a3 withAdditionalUserInfo:(id)a4;
+ (int)randomIntWithMinVal:(unsigned int)a3 maxVal:(unsigned int)a4;
+ (int64_t)MADownloadErrorCodeToSUDownloadErrorCode:(int64_t)a3;
+ (int64_t)appDemoteableSpace;
+ (int64_t)compareRestoreVersion:(id)a3 withRestoreVersion:(id)a4;
+ (int64_t)translateErrorCodeFromError:(id)a3;
+ (unint64_t)SUUpdateTypeFromCoreUpdateTypes:(int)a3;
+ (unint64_t)devicePadding:(id)a3;
+ (unint64_t)systemPartitionGrowth:(id)a3;
+ (unint64_t)totalDiskSpaceForUpdate:(id)a3;
+ (unint64_t)totalPurgeableSpace:(id)a3;
+ (void)assignError:(id *)a3 withCode:(int64_t)a4;
+ (void)assignError:(id *)a3 withError:(id)a4 translate:(BOOL)a5;
+ (void)enableAppDemotion:(BOOL)a3;
+ (void)purgeV1SUAssets;
+ (void)setCacheable:(BOOL)a3;
+ (void)setIsDaemon:(BOOL)a3;
+ (void)systemRootStatus:(BOOL *)a3 rootsFound:(BOOL *)a4;
@end

@implementation SUUtility

+ (id)mainWorkQueue
{
  if (mainWorkQueue_queuePredicate != -1) {
    dispatch_once(&mainWorkQueue_queuePredicate, &__block_literal_global_278);
  }
  v2 = (void *)mainWorkQueue___mainWorkQueue;
  return v2;
}

+ (id)taskQueue
{
  if (taskQueue_queuePredicate != -1) {
    dispatch_once(&taskQueue_queuePredicate, &__block_literal_global_15);
  }
  v2 = (void *)taskQueue___taskQueue;
  return v2;
}

uint64_t __22__SUUtility_taskQueue__block_invoke()
{
  taskQueue___taskQueue = (uint64_t)dispatch_queue_create("com.apple.softwareupdateservices.operationTaskQueue", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)appDemotionSettingQueue
{
  if (appDemotionSettingQueue_queuePredicate != -1) {
    dispatch_once(&appDemotionSettingQueue_queuePredicate, &__block_literal_global_275);
  }
  v2 = (void *)appDemotionSettingQueue___appDemotionSettingQueue;
  return v2;
}

uint64_t __36__SUUtility_appDemotionSettingQueue__block_invoke()
{
  appDemotionSettingQueue___appDemotionSettingQueue = (uint64_t)dispatch_queue_create("com.apple.softwareupdateservices.appDemotionSettingQueue", 0);
  return MEMORY[0x270F9A758]();
}

void __26__SUUtility_mainWorkQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.softwareupdateservices.mainWorkQueue", v2);
  v1 = (void *)mainWorkQueue___mainWorkQueue;
  mainWorkQueue___mainWorkQueue = (uint64_t)v0;
}

+ (id)fastWorkQueue
{
  if (fastWorkQueue_queuePredicate != -1) {
    dispatch_once(&fastWorkQueue_queuePredicate, &__block_literal_global_281);
  }
  v2 = (void *)fastWorkQueue___fastWorkQueue;
  return v2;
}

void __26__SUUtility_fastWorkQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.softwareupdateservices.fastWorkQueue", v2);
  v1 = (void *)fastWorkQueue___fastWorkQueue;
  fastWorkQueue___fastWorkQueue = (uint64_t)v0;
}

+ (void)setIsDaemon:(BOOL)a3
{
  __isDaemon = a3;
}

+ (BOOL)isDaemon
{
  return __isDaemon;
}

+ (BOOL)isWiFiCapable
{
  return MGGetBoolAnswer();
}

+ (BOOL)isCellularDataCapable
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasCellularRadio
{
  return MGGetBoolAnswer();
}

+ (BOOL)cellularDataIsEnabled
{
  return CTCellularDataPlanGetIsEnabled() != 0;
}

+ (id)serialNumber
{
  if (serialNumber_serialNumberPredicate != -1) {
    dispatch_once(&serialNumber_serialNumberPredicate, &__block_literal_global_292);
  }
  v2 = (void *)serialNumber___serialNumber;
  return v2;
}

void __25__SUUtility_serialNumber__block_invoke()
{
  dispatch_queue_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)serialNumber___serialNumber;
      serialNumber___serialNumber = (uint64_t)v1;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentProductCategory
{
  if (currentProductCategory_productCategoryPredicate != -1) {
    dispatch_once(&currentProductCategory_productCategoryPredicate, &__block_literal_global_297);
  }
  CFTypeID v2 = (void *)currentProductCategory___currentProductCategory;
  return v2;
}

void __35__SUUtility_currentProductCategory__block_invoke()
{
  dispatch_queue_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentProductCategory___currentProductCategory;
      currentProductCategory___currentProductCategory = (uint64_t)v1;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentHWModelStr
{
  if (currentHWModelStr_modelStrPredicate != -1) {
    dispatch_once(&currentHWModelStr_modelStrPredicate, &__block_literal_global_302);
  }
  CFTypeID v2 = (void *)currentHWModelStr___currentModelStr;
  return v2;
}

void __30__SUUtility_currentHWModelStr__block_invoke()
{
  dispatch_queue_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentHWModelStr___currentModelStr;
      currentHWModelStr___currentModelStr = (uint64_t)v1;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentDeviceName
{
  if (currentDeviceName_deviceNamePredicate != -1) {
    dispatch_once(&currentDeviceName_deviceNamePredicate, &__block_literal_global_307);
  }
  CFTypeID v2 = (void *)currentDeviceName___currentDeviceName;
  return v2;
}

void __30__SUUtility_currentDeviceName__block_invoke()
{
  dispatch_queue_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentDeviceName___currentDeviceName;
      currentDeviceName___currentDeviceName = (uint64_t)v1;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentProductType
{
  if (currentProductType_productTypePredicate != -1) {
    dispatch_once(&currentProductType_productTypePredicate, &__block_literal_global_312);
  }
  CFTypeID v2 = (void *)currentProductType___currentProductType;
  return v2;
}

void __31__SUUtility_currentProductType__block_invoke()
{
  dispatch_queue_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentProductType___currentProductType;
      currentProductType___currentProductType = (uint64_t)v1;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentProductVersion
{
  if (currentProductVersion_productVersionPredicate != -1) {
    dispatch_once(&currentProductVersion_productVersionPredicate, &__block_literal_global_317);
  }
  CFTypeID v2 = (void *)currentProductVersion___currentProductVersion;
  return v2;
}

void __34__SUUtility_currentProductVersion__block_invoke()
{
  dispatch_queue_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentProductVersion___currentProductVersion;
      currentProductVersion___currentProductVersion = (uint64_t)v1;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentProductBuild
{
  if (currentProductBuild_productBuildPredicate != -1) {
    dispatch_once(&currentProductBuild_productBuildPredicate, &__block_literal_global_322);
  }
  CFTypeID v2 = (void *)currentProductBuild___currentProductBuild;
  return v2;
}

void __32__SUUtility_currentProductBuild__block_invoke()
{
  dispatch_queue_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentProductBuild___currentProductBuild;
      currentProductBuild___currentProductBuild = (uint64_t)v1;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentReleaseType
{
  if (currentReleaseType_releaseTypePredicate != -1) {
    dispatch_once(&currentReleaseType_releaseTypePredicate, &__block_literal_global_327);
  }
  CFTypeID v2 = (void *)currentReleaseType___currentReleaseType;
  return v2;
}

void __31__SUUtility_currentReleaseType__block_invoke()
{
  dispatch_queue_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentReleaseType___currentReleaseType;
      currentReleaseType___currentReleaseType = (uint64_t)v1;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (BOOL)currentReleaseTypeIsInternal
{
  CFTypeID v2 = +[SUUtility currentReleaseType];
  char v3 = [v2 isEqualToString:@"Internal"];

  return v3;
}

+ (BOOL)isProductionFused
{
  if (isProductionFused_fusingPredicate != -1) {
    dispatch_once(&isProductionFused_fusingPredicate, &__block_literal_global_335);
  }
  return isProductionFused___isProductionFused;
}

void __30__SUUtility_isProductionFused__block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID()) {
      isProductionFused___isProductionFused = CFBooleanGetValue(v1) != 0;
    }
    CFRelease(v1);
  }
}

+ (BOOL)isVirtualDevice
{
  if (isVirtualDevice_virtualPredicate != -1) {
    dispatch_once(&isVirtualDevice_virtualPredicate, &__block_literal_global_340);
  }
  return isVirtualDevice___isVirtualDevice;
}

void __28__SUUtility_isVirtualDevice__block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID()) {
      isVirtualDevice___isVirtualDevice = CFBooleanGetValue(v1) != 0;
    }
    CFRelease(v1);
  }
}

+ (BOOL)alarmSetBeforeDate:(id)a3
{
  CFDateRef v3 = (const __CFDate *)a3;
  if (!v3 || (CFArrayRef v4 = IOPMCopyScheduledPowerEvents()) == 0)
  {
    BOOL v20 = 0;
    goto LABEL_21;
  }
  CFArrayRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFArrayGetTypeID() || CFArrayGetCount(v5) < 1)
  {
LABEL_18:
    BOOL v20 = 0;
    goto LABEL_19;
  }
  CFIndex v7 = 0;
  v8 = (const void *)*MEMORY[0x263EFFB40];
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v7);
    if (!ValueAtIndex) {
      goto LABEL_17;
    }
    CFDictionaryRef v10 = ValueAtIndex;
    CFTypeID v11 = CFGetTypeID(ValueAtIndex);
    if (v11 != CFDictionaryGetTypeID()) {
      goto LABEL_17;
    }
    Value = CFDictionaryGetValue(v10, @"UserVisible");
    if (!Value) {
      goto LABEL_17;
    }
    v13 = Value;
    CFTypeID v14 = CFGetTypeID(Value);
    if (v14 != CFBooleanGetTypeID()) {
      goto LABEL_17;
    }
    if (v13 != v8) {
      goto LABEL_17;
    }
    CFDateRef v15 = (const __CFDate *)CFDictionaryGetValue(v10, @"time");
    if (!v15) {
      goto LABEL_17;
    }
    CFDateRef v16 = v15;
    CFTypeID v17 = CFGetTypeID(v15);
    if (v17 != CFDateGetTypeID() || CFDateCompare(v16, v3, 0) != kCFCompareLessThan) {
      goto LABEL_17;
    }
    v18 = CFDictionaryGetValue(v10, @"scheduledby");
    v19 = v18;
    if (!v18 || (_eventIsBlacklisted(v18) & 1) == 0) {
      break;
    }

LABEL_17:
    if (CFArrayGetCount(v5) <= ++v7) {
      goto LABEL_18;
    }
  }
  v22 = [NSString stringWithFormat:@"Event is scheduled before provided time"];
  v23 = v22;
  if (v19)
  {
    uint64_t v24 = [v22 stringByAppendingFormat:@"\nEvent name: %@", v19];

    v23 = (void *)v24;
  }
  v25 = [v23 stringByAppendingFormat:@"\nEvent time:  %@", v16];

  SULogInfo(@"%@", v26, v27, v28, v29, v30, v31, v32, (uint64_t)v25);
  BOOL v20 = 1;
LABEL_19:
  CFRelease(v5);
LABEL_21:

  return v20;
}

+ (int)randomIntWithMinVal:(unsigned int)a3 maxVal:(unsigned int)a4
{
  unsigned int v8 = a4 - a3;
  if (a4 >= a3)
  {
    if (randomIntWithMinVal_maxVal__onceToken != -1) {
      dispatch_once(&randomIntWithMinVal_maxVal__onceToken, &__block_literal_global_370);
    }
    return rand() % (v8 + 1) + a3;
  }
  else
  {
    SULogInfo(@"invalid arguments", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7, v11);
    return 0;
  }
}

void __40__SUUtility_randomIntWithMinVal_maxVal___block_invoke()
{
  unsigned int v0 = time(0);
  srand(v0);
}

+ (BOOL)isLockdownModeEnabled
{
  CFTypeID v2 = [MEMORY[0x263F526E0] shared];
  char v3 = [v2 enabled];

  return v3;
}

+ (id)errorWithCode:(int64_t)a3
{
  return +[SUUtility errorWithCode:a3 originalError:0];
}

+ (id)errorWithCode:(int64_t)a3 originalError:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = v6;
  if (v5) {
    [v6 setSafeObject:v5 forKey:*MEMORY[0x263F08608]];
  }
  BOOL v8 = +[SUUtility currentReleaseTypeIsInternal];
  if ((unint64_t)(a3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && v8)
  {
    uint64_t v9 = +[SUUtility internalRecoveryStringForErrorCode:a3];
    CFDictionaryRef v10 = (void *)v9;
    if (v9)
    {
      uint64_t v14 = *MEMORY[0x263F08348];
      v15[0] = v9;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [v7 addEntriesFromDictionary:v11];
    }
  }
  v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:a3 userInfo:v7];

  return v12;
}

+ (id)updateError:(id)a3 withAdditionalUserInfo:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    if (a4)
    {
      BOOL v8 = (void *)MEMORY[0x263EFF9A0];
      id v9 = a4;
      CFDictionaryRef v10 = [v6 userInfo];
      uint64_t v11 = [v8 dictionaryWithDictionary:v10];

      [v11 addEntriesFromDictionary:v9];
      v12 = (void *)MEMORY[0x263F087E8];
      v13 = [v6 domain];
      uint64_t v7 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v6, "code"), v11);
    }
  }

  return v7;
}

+ (id)errorRemovingUserInfoKey:(id)a3 originalError:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    id v7 = a4;
    BOOL v8 = [v7 userInfo];
    id v9 = [v6 dictionaryWithDictionary:v8];

    if (v9)
    {
      uint64_t v10 = *MEMORY[0x263F08608];
      uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F08608]];
      if (v11)
      {
        v12 = +[SUUtility errorRemovingUserInfoKey:v5 originalError:v11];
        [v9 setObject:v12 forKeyedSubscript:v10];
      }
      [v9 setObject:0 forKeyedSubscript:v5];
    }
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = [v7 domain];
    uint64_t v15 = [v7 code];

    CFDateRef v16 = [v13 errorWithDomain:v14 code:v15 userInfo:v9];
  }
  else
  {
    CFDateRef v16 = 0;
  }

  return v16;
}

+ (void)assignError:(id *)a3 withCode:(int64_t)a4
{
  id v5 = +[SUUtility errorWithCode:a4];
  +[SUUtility assignError:a3 withError:v5 translate:0];
}

+ (void)assignError:(id *)a3 withError:(id)a4 translate:(BOOL)a5
{
  id v7 = a4;
  id v8 = v7;
  if (a3 && v7)
  {
    id v11 = v7;
    if (a5)
    {
      id v9 = +[SUUtility translateError:v7];
    }
    else
    {
      id v9 = v7;
    }
    id v10 = v9;
    *a3 = v10;

    id v8 = v11;
  }
  MEMORY[0x270F9A758](v7, v8);
}

+ (id)translateError:(id)a3
{
  return (id)[a1 translateError:a3 withAddedUserInfo:0];
}

+ (id)translateError:(id)a3 withAddedUserInfo:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v13 = 0;
    goto LABEL_13;
  }
  id v8 = [v6 domain];
  int v9 = [v8 isEqualToString:@"com.apple.softwareupdateservices.errors"];

  if (!v9)
  {
    uint64_t v14 = [a1 translateErrorCodeFromError:v6];
    v12 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v7];
    [v12 setSafeObject:v6 forKey:*MEMORY[0x263F08608]];
    if (+[SUUtility currentReleaseTypeIsInternal]
      && (unint64_t)(v14 + 1) >= 2)
    {
      uint64_t v15 = +[SUUtility internalRecoveryStringForErrorCode:v14];
      CFDateRef v16 = (void *)v15;
      if (v15)
      {
        uint64_t v20 = *MEMORY[0x263F08348];
        v21[0] = v15;
        CFTypeID v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
        [v12 addEntriesFromDictionary:v17];
      }
    }
    v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:v14 userInfo:v12];
    id v13 = [MEMORY[0x263F087E8] buildCheckedError:v18];

    goto LABEL_12;
  }
  if (v7)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v11 = [v6 userInfo];
    v12 = (void *)[v10 initWithDictionary:v11];

    [v12 addEntriesFromDictionary:v7];
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.softwareupdateservices.errors", objc_msgSend(v6, "code"), v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  id v13 = v6;
LABEL_13:

  return v13;
}

+ (int64_t)translateErrorCodeFromError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  char v5 = [v4 isEqualToString:@"com.apple.softwareupdateservices.errors"];

  uint64_t v6 = [v3 code];
  uint64_t v7 = v6;
  if (v5)
  {
    int64_t v8 = v6;
    goto LABEL_27;
  }
  int v9 = (void *)*MEMORY[0x263F55900];
  id v10 = [v3 domain];
  LODWORD(v9) = [v9 isEqualToString:v10];

  if (v9)
  {
    if ((unint64_t)(v7 - 1) < 0x16)
    {
      int64_t v8 = qword_21DDCF590[v7 - 1];
      goto LABEL_27;
    }
LABEL_26:
    int64_t v8 = -1;
    goto LABEL_27;
  }
  id v11 = (void *)*MEMORY[0x263F55A90];
  v12 = [v3 domain];
  LODWORD(v11) = [v11 isEqualToString:v12];

  if (v11)
  {
    if (v7 != 812)
    {
      if (v7 == 26)
      {
        int64_t v8 = 47;
        goto LABEL_27;
      }
      if (v7 == 2)
      {
        int64_t v8 = 19;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    uint64_t v15 = [v3 userInfo];
    CFDateRef v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    CFTypeID v17 = [v16 domain];
    if (![v17 isEqualToString:@"com.apple.MobileAssetError.Download"])
    {

      goto LABEL_26;
    }
    uint64_t v18 = [v16 code];

    if (v18 == 59) {
      int64_t v8 = 57;
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    id v13 = [v3 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x263F78050]];

    if (!v14) {
      goto LABEL_26;
    }
    int64_t v8 = -1;
    if (v7 <= 8599)
    {
      switch(v7)
      {
        case 8400:
        case 8402:
        case 8411:
          int64_t v8 = 57;
          break;
        case 8401:
          int64_t v8 = 58;
          break;
        case 8403:
          int64_t v8 = 80;
          break;
        case 8404:
        case 8405:
        case 8408:
        case 8409:
        case 8410:
          break;
        case 8406:
          int64_t v8 = 3;
          break;
        case 8407:
          goto LABEL_16;
        default:
          if ((unint64_t)(v7 - 8102) <= 0xE && ((1 << (v7 + 90)) & 0x5001) != 0)
          {
            int64_t v8 = 22;
          }
          else if (!v7)
          {
            int64_t v8 = 0;
          }
          break;
      }
    }
    else
    {
      switch(v7)
      {
        case 8600:
          int64_t v8 = 43;
          break;
        case 8700:
          int64_t v8 = 59;
          break;
        case 9009:
LABEL_16:
          int64_t v8 = 38;
          break;
      }
    }
  }
LABEL_27:

  return v8;
}

+ (int64_t)MADownloadErrorCodeToSUDownloadErrorCode:(int64_t)a3
{
  int64_t v8 = a3 - 1;
  if (unint64_t)(a3 - 1) < 0xD && ((0x1DFFu >> v8)) {
    return qword_21DDCF640[v8];
  }
  SULogInfo(@"Unknown MAError code: %ld", (uint64_t)a2, a3, v3, v4, v5, v6, v7, a3);
  return 59;
}

+ (id)autoDownloadExpiredError:(BOOL)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  int64_t v8 = @"SUAutoDownloadWillRetry";
  uint64_t v4 = [NSNumber numberWithBool:a3];
  v9[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [v3 errorWithDomain:@"com.apple.softwareupdateservices.errors" code:23 userInfo:v5];

  return v6;
}

+ (id)internalRecoveryStringForErrorCode:(int64_t)a3
{
  CFBooleanRef v4 = (const __CFBoolean *)CFPreferencesCopyValue(@"EnableSso", @"com.apple.MobileSoftwareUpdate", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  if (v4)
  {
    CFBooleanRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v7 = 0;
  }
  id result = @"Insufficient space for update. Please free up space on the device and try again.";
  switch(a3)
  {
    case -1:
      return @"Unknown Error.";
    case 0:
      return @"No Error.";
    case 1:
    case 26:
    case 27:
    case 40:
      return @"There was a networking error during the update attempt. Please verify your device has a valid network connection.";
    case 2:
    case 6:
      return result;
    case 3:
      return @"No update found.";
    case 4:
      return @"Failed to find a SU documentation asset.";
    case 5:
      return @"The device found a malformed Software Update asset on the asset server.";
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 28:
    case 29:
    case 30:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 38:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 55:
    case 56:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 76:
      return 0;
    case 17:
      return @"Failed to prepare update.";
    case 18:
      return @"SU asset is corrupted. Please delete the update from settings and try downloading again.";
    case 19:
      if (+[SUUtility currentReleaseTypeIsInternal]
        && +[SUUtility isProductionFused]
        && !v7)
      {
        return @"Installing an internal build on a production fused device requires AppleConnect for personalization. Enable AppleConnect from:\n Settings > Internal Settings > Mobile Software Update > check Use AppleConnect.";
      }
      else
      {
        return @"Personalization failed. This build might not be nominated for installation yet. Please try installing again later.";
      }
    case 31:
      return @"Download not allowable.";
    case 37:
      return @"Remote connection lost.";
    case 47:
      return @"Missing installation Keybag.";
    case 53:
      return @"Failed to prepare the update because a root is installed or the system is rooted from live fs. Please try downloading again. The device will automatically try downloading a full replacement asset, which has the ability to prepare when a root is installed.";
    case 54:
      return @"Failed to load the update brain. Please try again.";
    case 57:
      return @"Failed to download the Software Update catalog from the internal asset server. Please verify that the device is connected to an internal network or VPN and try again.";
    case 58:
      return @"Failed to query MobileAsset for Software Update asset. Please try again.";
    case 59:
      return @"MobileAsset software update download failure.";
    case 66:
      return @"MobileAsset XPC failure.";
    case 67:
      return @"MobileAsset staging failure.";
    case 68:
      return @"MobileAsset data processing failure.";
    case 69:
      return @"MobileAsset unzip failure.";
    case 70:
      return @"MobileAsset file move failure.";
    case 71:
      return @"MobileAsset asset install failure.";
    case 72:
      return @"mobileassetd exited.";
    case 73:
      return @"StreamingZip extraction error.";
    case 74:
      return @"Missing MobileAsset entitlement.";
    case 75:
      return @"mobileassetd daemon not ready to download. Please try again in a moment.";
    case 77:
      return @"DAS failed to run auto install activity.";
    default:
      if (a3 == 84) {
        return @"client is not authorised, SoftwareUpdateServicesd is in exclusive mode";
      }
      if (a3 == 107) {
        return @"Failed to load the update brain. Please try again.";
      }
      return 0;
  }
}

+ (int64_t)appDemoteableSpace
{
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = objc_opt_new();
  id v11 = v3;
  if (v3)
  {
    [v3 setVolume:@"/private/var"];
    [v11 setUrgency:4];
    v19 = (void *)[objc_alloc(MEMORY[0x263F254D8]) initWithOptions:v11];
    if (v19)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = (uint64_t)__31__SUUtility_appDemoteableSpace__block_invoke;
      v24[3] = (uint64_t)&unk_26447E840;
      uint64_t v26 = &v27;
      uint64_t v20 = v2;
      v25 = v20;
      [v19 startWithCompletionBlock:v24];
      dispatch_time_t v21 = dispatch_time(0, 120000000000);
      dispatch_semaphore_wait(v20, v21);
      int64_t v22 = v28[3];
    }
    else
    {
      SULogInfo(@"Failed to create ASDPurgeableAppRequest", v12, v13, v14, v15, v16, v17, v18, v24[0]);
      int64_t v22 = v28[3];
    }
  }
  else
  {
    SULogInfo(@"Failed to create ASDPurgeableAppRequestOptions", v4, v5, v6, v7, v8, v9, v10, v24[0]);
    int64_t v22 = v28[3];
  }

  _Block_object_dispose(&v27, 8);
  return v22;
}

void __31__SUUtility_appDemoteableSpace__block_invoke(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  id v16 = a3;
  id v14 = a4;
  if (v14) {
    SULogInfo(@"request for purgeable app space failed. Result: %d Error: %@", v7, v8, v9, v10, v11, v12, v13, a2);
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v16 purgeableSize];
  }
  uint64_t v15 = *(NSObject **)(a1 + 32);
  if (v15) {
    dispatch_semaphore_signal(v15);
  }
}

+ (unint64_t)totalPurgeableSpace:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    char v5 = 0;
LABEL_10:
    uint64_t v6 = 4;
    goto LABEL_11;
  }
  if ([v3 siriVoiceDeletionDisabled]) {
    char v5 = [v4 siriVoiceDeletionDisabled];
  }
  else {
    char v5 = 0;
  }
  if (![v4 cdLevel4Disabled]) {
    goto LABEL_10;
  }
  if ([v4 cdLevel4Disabled]) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 4;
  }
LABEL_11:
  v15[0] = @"CACHE_DELETE_VOLUME";
  v15[1] = @"CACHE_DELETE_URGENCY";
  v16[0] = @"/private/var";
  uint64_t v7 = [NSNumber numberWithInt:v6];
  v16[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  uint64_t v9 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
  uint64_t v10 = [v9 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  uint64_t v11 = v10;
  if (!v10)
  {
    unint64_t v12 = 0;
    if (v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unint64_t v12 = [v10 unsignedLongLongValue];
  if ((v5 & 1) == 0)
  {
LABEL_13:
    uint64_t v13 = purgeableAssetSpaceAvailable(&unk_26CEBD278);
    v12 += v13 + purgeableAssetSpaceAvailableV2(&unk_26CEBD278);
  }
LABEL_14:

  return v12;
}

+ (unint64_t)systemPartitionGrowth:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  memset(&v23, 0, 512);
  uint64_t v4 = [v3 minimumSystemPartitionSize];
  char v5 = [v3 systemPartitionPadding];
  unint64_t v6 = +[SUUtility devicePadding:v5];

  if (statfs("/", &v23))
  {
    unint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = v4 + 75497472 + v6;
    void v21[2] = 0;
    memset(v22, 0, 12);
    v21[0] = 5;
    v21[1] = 2155872256;
    if (getattrlist("/", v21, v22, 0xCuLL, 0)) {
      uint64_t v9 = (v23.f_blocks - v23.f_bfree) * v23.f_bsize;
    }
    else {
      uint64_t v9 = *(void *)((char *)v22 + 4);
    }
    BOOL v10 = v8 >= v9;
    unint64_t v11 = v8 - v9;
    if (v10) {
      unint64_t v7 = v11;
    }
    else {
      unint64_t v7 = 0;
    }
  }
  unint64_t v12 = [v3 humanReadableUpdateName];
  SULogInfo(@"Sytem partition growth for [%@] <%p> = %llu bytes", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);

  return v7;
}

+ (unint64_t)totalDiskSpaceForUpdate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 totalRequiredFreeSpace];
  unint64_t v5 = +[SUUtility systemPartitionGrowth:v3];

  return v4 + 104857600 + v5;
}

+ (void)enableAppDemotion:(BOOL)a3
{
  unint64_t v5 = [a1 appDemotionSettingQueue];
  dispatch_assert_queue_not_V2(v5);

  unint64_t v6 = [a1 appDemotionSettingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SUUtility_enableAppDemotion___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v8 = a3;
  dispatch_async(v6, block);
}

uint64_t __31__SUUtility_enableAppDemotion___block_invoke(uint64_t a1)
{
  CFBooleanRef v1 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!*(unsigned char *)(a1 + 32)) {
    CFBooleanRef v1 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"OffloadUnusedApps", *v1, @"com.apple.appstored");
  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

+ (BOOL)appDemotionIsEnabled
{
  id v3 = [a1 appDemotionSettingQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [a1 appDemotionSettingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUUtility_appDemotionIsEnabled__block_invoke;
  block[3] = &unk_26447E2A8;
  void block[4] = &v7;
  dispatch_sync(v4, block);

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v4;
}

uint64_t __33__SUUtility_appDemotionIsEnabled__block_invoke(uint64_t a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"OffloadUnusedApps", @"com.apple.appstored", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = result == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

+ (unint64_t)devicePadding:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  uint64_t valuePtr = 0;
  if (!v3) {
    goto LABEL_42;
  }
  mach_port_t v4 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v5 = IOBSDNameMatching(*MEMORY[0x263F0EC90], 0, "disk0");
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!MatchingService)
  {
    SULogInfo(@"Could not find service for device with BSD name %s", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"disk0");
LABEL_42:
    uint64_t v60 = 0;
    goto LABEL_47;
  }
  io_object_t v14 = MatchingService;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"Size", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  statfs v23 = CFProperty;
  if (!CFProperty || (CFTypeID v24 = CFGetTypeID(CFProperty), v24 != CFNumberGetTypeID()))
  {
    SULogInfo(@"Invalid value '%@' for property key '%@'", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v23);
    uint64_t v60 = 0;
    goto LABEL_39;
  }
  if (!CFNumberGetValue((CFNumberRef)v23, kCFNumberLongLongType, &valuePtr))
  {
    SULogInfo(@"Failed to convert '%@' to primitive value", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v23);
LABEL_45:
    IOObjectRelease(v14);
    uint64_t v60 = 0;
LABEL_46:
    CFRelease(v23);
    goto LABEL_47;
  }
  if (valuePtr >= 0) {
    unint64_t v32 = valuePtr;
  }
  else {
    unint64_t v32 = valuePtr + 0x3FFFFFFF;
  }
  size_t Count = CFDictionaryGetCount(v3);
  if (!Count)
  {
    SULogInfo(@"No padding entries, returning default padding value %llu\n", v34, v35, v36, v37, v38, v39, v40, 0);
    goto LABEL_45;
  }
  int64_t v41 = Count;
  v42 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  v43 = (const void **)malloc_type_calloc(v41, 8uLL, 0x6004044C4A2DFuLL);
  v51 = v43;
  if (!v42 || !v43)
  {
    SULogInfo(@"Failed to allocate key/value buffers to fetch system padding value\n", v44, v45, v46, v47, v48, v49, v50, v69);
    uint64_t v60 = 0;
    if (v42) {
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  CFDictionaryGetKeysAndValues(v3, v42, v43);
  if (v41 < 1)
  {
    uint64_t v60 = 0;
    goto LABEL_51;
  }
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  int v61 = 0;
  unint64_t v70 = v32 >> 30;
  uint64_t v71 = 0;
  do
  {
    CFStringRef v62 = (const __CFString *)v42[v59];
    CFNumberRef v63 = (const __CFNumber *)v51[v59];
    uint64_t v73 = 0;
    unsigned int v72 = 0;
    if (!v62)
    {
      v67 = @"Failed to get marketing size key from padding dict\n";
LABEL_34:
      SULogInfo(v67, v52, v53, v54, v55, v56, v57, v58, v69);
      goto LABEL_35;
    }
    if (!v63)
    {
      v67 = @"Failed to get padding size for key in padding dict\n";
      goto LABEL_34;
    }
    __int16 v76 = 0;
    *(void *)buffer = 0;
    if (!CFStringGetCString(v62, buffer, 10, 0x8000100u))
    {
      v67 = @"Failed to get C string from CFStringRef padding key\n";
      goto LABEL_34;
    }
    if (!sscanf(buffer, "%d", &v72))
    {
      v67 = @"Failed to parse out padding value from capacity string\n";
      goto LABEL_34;
    }
    if (!CFNumberGetValue(v63, kCFNumberSInt64Type, &v73))
    {
      v67 = @"Failed to convert CFNumberRef value into int\n";
      goto LABEL_34;
    }
    int v64 = v70 - v72;
    if ((int)(v70 - v72) < 0) {
      int v64 = v72 - v70;
    }
    BOOL v65 = v59 == 0 || v64 <= v61;
    if (v59 != 0 && v64 > v61) {
      uint64_t v66 = v71;
    }
    else {
      uint64_t v66 = v72;
    }
    uint64_t v71 = v66;
    if (v59 == 0 || v64 <= v61) {
      int v61 = v64;
    }
    if (v65) {
      uint64_t v60 = v73;
    }
LABEL_35:
    ++v59;
  }
  while (v41 != v59);
  if (v61 >= 11) {
    SULogInfo(@"Closest marketing capacity entry for padding was %dGB however this device is %dGB, this might not be optimal\n", v52, v53, v54, v55, v56, v57, v58, v71);
  }
LABEL_51:
  free(v42);
LABEL_52:
  if (v51) {
    free(v51);
  }
LABEL_39:
  IOObjectRelease(v14);
  if (v23) {
    goto LABEL_46;
  }
LABEL_47:

  return v60 << 20;
}

+ (void)purgeV1SUAssets
{
  v3[2] = *MEMORY[0x263EF8340];
  v3[0] = @"com.apple.MobileAsset.SoftwareUpdate";
  v3[1] = @"com.apple.MobileAsset.SoftwareUpdateDocumentation";
  dispatch_semaphore_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:2];
  purgeAssets(v2, 1, 0);
}

+ (void)setCacheable:(BOOL)a3
{
}

+ (id)URLIfFileExists:(id)a3
{
  CFDictionaryRef v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  CFDictionaryRef v5 = [v3 defaultManager];
  unint64_t v6 = [v4 path];
  if ([v5 fileExistsAtPath:v6]) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

+ (id)gregorianCalendar
{
  id v2 = objc_alloc(MEMORY[0x263EFF8F0]);
  CFDictionaryRef v3 = (void *)[v2 initWithCalendarIdentifier:*MEMORY[0x263EFFC90]];
  id v4 = [MEMORY[0x263EFFA18] systemTimeZone];
  [v3 setTimeZone:v4];

  return v3;
}

+ (id)addToDate:(id)a3 numberOfDays:(int64_t)a4
{
  [a3 timeIntervalSinceReferenceDate];
  CFAbsoluteTime at = v5;
  if (CFCalendarAddComponents((CFCalendarRef)+[SUUtility gregorianCalendar], &at, 0, "d", a4))
  {
    uint64_t v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:at];
  }
  else
  {
    SULogDebug(@"addToDate:numberOfDays: unable to add %ld days to date: %f", v6, v7, v8, v9, v10, v11, v12, a4);
    uint64_t v13 = 0;
  }
  return v13;
}

+ (id)prettyPrintDate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)prettyPrintDate____dateFormatter;
  if (!prettyPrintDate____dateFormatter)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = (void *)prettyPrintDate____dateFormatter;
    prettyPrintDate____dateFormatter = v5;

    [(id)prettyPrintDate____dateFormatter setDateStyle:1];
    uint64_t v7 = (void *)prettyPrintDate____dateFormatter;
    uint64_t v8 = [MEMORY[0x263EFFA18] localTimeZone];
    [v7 setTimeZone:v8];

    [(id)prettyPrintDate____dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    id v4 = (void *)prettyPrintDate____dateFormatter;
  }
  uint64_t v9 = [v4 stringFromDate:v3];

  return v9;
}

+ (id)systemContainerURL
{
  id v2 = (void *)systemContainerURL_systemContainerUrl;
  if (!systemContainerURL_systemContainerUrl)
  {
    uint64_t v3 = container_system_path_for_identifier();
    if (v3)
    {
      uint64_t v11 = (void *)v3;
      SULogDebug(@"System container path is %s", v4, v5, v6, v7, v8, v9, v10, v3);
      uint64_t v12 = [NSURL fileURLWithFileSystemRepresentation:v11 isDirectory:1 relativeToURL:0];
      uint64_t v13 = (void *)systemContainerURL_systemContainerUrl;
      systemContainerURL_systemContainerUrl = v12;

      free(v11);
      uint64_t v14 = systemContainerURL_systemContainerUrl;
      uint64_t v15 = [NSNumber numberWithBool:1];
      LOBYTE(v14) = [(id)v14 setResourceValue:v15 forKey:*MEMORY[0x263EFF6B0] error:0];

      if (v14)
      {
LABEL_7:
        id v2 = (void *)systemContainerURL_systemContainerUrl;
        goto LABEL_8;
      }
      uint64_t v16 = @"failed to exclude system container from backup";
    }
    else
    {
      uint64_t v18 = 1;
      uint64_t v16 = @"Error getting system container: %llu";
    }
    SULogDebug(v16, v4, v5, v6, v7, v8, v9, v10, v18);
    goto LABEL_7;
  }
LABEL_8:
  return v2;
}

+ (BOOL)writeKeepAliveFilePath:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  uint64_t v5 = [v3 defaultManager];
  int v6 = [v5 createFileAtPath:v4 contents:0 attributes:0];

  if (v6) {
    uint64_t v14 = @"Successfully wrote keep alive file:%@";
  }
  else {
    uint64_t v14 = @"Failed to write keep alive file:%@";
  }
  SULogDebug(v14, v7, v8, v9, v10, v11, v12, v13, (uint64_t)v4);

  return v6;
}

+ (BOOL)deleteKeepAliveFilePath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  if ([v4 fileExistsAtPath:v3 isDirectory:0])
  {
    id v29 = 0;
    int v12 = [v4 removeItemAtPath:v3 error:&v29];
    id v20 = v29;
    if (v12)
    {
      SULogDebug(@"Successfully deleted keep alive file:%@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v3);
    }
    else
    {
      SULogDebug(@"Failed to delete keep alive file:%@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v3);
      if (v20) {
        SULogDebug(@"Delete error: %@", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);
      }
    }
  }
  else
  {
    SULogDebug(@"No keep alive file found at:%@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v3);
    LOBYTE(v12) = 1;
  }

  return v12;
}

+ (BOOL)writeKeepAliveFile
{
  return +[SUUtility writeKeepAliveFilePath:@"/var/mobile/Library/SoftwareUpdate/susdKeepAlive"];
}

+ (BOOL)deleteKeepAliveFile
{
  return +[SUUtility deleteKeepAliveFilePath:@"/var/mobile/Library/SoftwareUpdate/susdKeepAlive"];
}

+ (BOOL)writeAUKeepAliveFile
{
  return +[SUUtility writeKeepAliveFilePath:@"/var/mobile/Library/SoftwareUpdate/susdAUKeepAlive"];
}

+ (BOOL)deleteAUKeepAliveFile
{
  return +[SUUtility deleteKeepAliveFilePath:@"/var/mobile/Library/SoftwareUpdate/susdAUKeepAlive"];
}

+ (id)bootTime
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  *(void *)uint64_t v8 = 0x1500000001;
  size_t v7 = 16;
  int v2 = sysctl(v8, 2u, &v5, &v7, 0, 0);
  id v3 = 0;
  if (!v2)
  {
    id v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(v5 + (int)v6 / 0xF4240uLL)];
  }
  return v3;
}

+ (BOOL)isSplatRollbackDirectoryPresent
{
  int v2 = [MEMORY[0x263F53618] sharedDataAccessor];
  id v17 = 0;
  id v3 = (void *)[v2 copyPathForPersistentData:112 error:&v17];
  id v4 = v17;

  if (v3)
  {
    char v16 = 0;
    int v12 = [MEMORY[0x263F08850] defaultManager];
    char v13 = [v12 fileExistsAtPath:v3 isDirectory:&v16];
    if (v16) {
      BOOL v14 = v13;
    }
    else {
      BOOL v14 = 0;
    }
  }
  else
  {
    SULogInfo(@"Failed to get path to rollback assets: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)isSplatOnlyUpdateInstalled
{
  int v2 = +[SUPreferences sharedInstance];
  int v3 = [v2 fakeSplatInstalled];

  if (v3)
  {
    SULogInfo(@"Fake splat installed", v4, v5, v6, v7, v8, v9, v10, v14);
    return 1;
  }
  else
  {
    int v12 = [MEMORY[0x263F77D98] sharedDevice];
    int v13 = [v12 hasSplatOnlyUpdateInstalled];

    return v13;
  }
}

+ (id)documentationDataForInstalledUpdateType:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a4) {
    *a4 = 0;
  }
  id v14 = objc_alloc_init(MEMORY[0x263F77B68]);
  if (v14)
  {
    id v37 = 0;
    uint64_t v15 = objc_msgSend(v14, "getDocumentationDataForInstalledUpdateType:withError:", objc_msgSend(a1, "SUUpdateTypeFromCoreUpdateTypes:", v5), &v37);
    id v16 = v37;
    if (!v15)
    {
      uint64_t v28 = SUStringFromOSUpdateType(v5);
      SULogInfo(@"SUCoreDocumentationData not found for updateType: %@", v29, v30, v31, v32, v33, v34, v35, (uint64_t)v28);

      uint64_t v25 = +[SUUtility translateError:v16];

      uint64_t v24 = 0;
      uint64_t v15 = 0;
LABEL_12:
      id v16 = (id)v25;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v24 = [[SUDocumentationData alloc] initWithSUCoreDocumentationData:v15];
    if (!v24)
    {
      SULogInfo(@"Failed to create SUDocumentationData from SUCoreDocumentationData", v17, v18, v19, v20, v21, v22, v23, v36);
      uint64_t v25 = +[SUUtility errorWithCode:38];

      goto LABEL_12;
    }
  }
  else
  {
    SULogInfo(@"SUCoreDocumentationDataManager failed to initialize", v7, v8, v9, v10, v11, v12, v13, v36);
    id v16 = +[SUUtility errorWithCode:95];
    uint64_t v24 = 0;
    uint64_t v15 = 0;
  }
  if (a4) {
LABEL_9:
  }
    *a4 = v16;
LABEL_10:
  uint64_t v26 = v24;

  return v26;
}

+ (int64_t)compareRestoreVersion:(id)a3 withRestoreVersion:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x263F77E10];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[v5 alloc] initWithRestoreVersion:v7];

  uint64_t v9 = [objc_alloc(MEMORY[0x263F77E10]) initWithRestoreVersion:v6];
  if (v8 | v9)
  {
    if (v8) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      int64_t v11 = 1;
    }
    else if (v8 || !v9)
    {
      int64_t v11 = [(id)v8 compare:v9];
    }
    else
    {
      int64_t v11 = -1;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

+ (unint64_t)SUUpdateTypeFromCoreUpdateTypes:(int)a3
{
  return a3 == 1;
}

+ (double)autoScanTimeInterval
{
  SULogInfo(@"[Auto scan] Customer: Scanning every 1 day", (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 86400.0;
}

+ (double)autoDownloadTimeInterval
{
  uint64_t v2 = +[SUUtility currentReleaseType];
  if ([v2 isEqualToString:@"Internal"])
  {
    uint64_t v3 = +[SUPreferences sharedInstance];
    int v4 = [v3 scanWeeklyInternally];

    if (!v4)
    {
      uint64_t v12 = @"[Auto scan] Apple Internal: Downloading every 1 day";
      double v13 = 86400.0;
      goto LABEL_11;
    }
  }
  else
  {
  }
  int v14 = [(id)objc_opt_class() isLockdownModeEnabled];
  BOOL v15 = v14 == 0;
  if (v14) {
    uint64_t v12 = @"[Auto scan]: Lockdown mode enabled: Downloading every 1 day";
  }
  else {
    uint64_t v12 = @"[Auto scan] Customer: Downloading every 5 days";
  }
  if (v15) {
    double v13 = 432000.0;
  }
  else {
    double v13 = 86400.0;
  }
LABEL_11:
  SULogInfo(v12, v5, v6, v7, v8, v9, v10, v11, v17);
  return v13;
}

+ (void)systemRootStatus:(BOOL *)a3 rootsFound:(BOOL *)a4
{
  if (systemRootStatus_rootsFound__onceToken == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&systemRootStatus_rootsFound__onceToken, &__block_literal_global_709);
  if (a3) {
LABEL_3:
  }
    *a3 = systemRootStatus_rootsFound__is_live_fs;
LABEL_4:
  if (a4) {
    *a4 = systemRootStatus_rootsFound__darwinup;
  }
}

void __41__SUUtility_systemRootStatus_rootsFound___block_invoke()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  bzero(&v22, 0x878uLL);
  if (statfs("/", &v22))
  {
    __error();
    SULogInfo(@"%s: statfs(\"/\") failed: %d", v0, v1, v2, v3, v4, v5, v6, (uint64_t)"+[SUUtility systemRootStatus:rootsFound:]_block_invoke");
  }
  else
  {
    uint64_t v7 = [NSString stringWithUTF8String:v22.f_mntfromname];
    if ([v7 containsString:@"darwinup"])
    {
      SULogInfo(@"%s: rooted from darwinup snapshot %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"+[SUUtility systemRootStatus:rootsFound:]_block_invoke");
      systemRootStatus_rootsFound__darwinup = 1;
    }
    if ([v7 hasPrefix:@"/dev/disk"])
    {
      SULogInfo(@"%s: rooted from live fs %@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"+[SUUtility systemRootStatus:rootsFound:]_block_invoke");
      systemRootStatus_rootsFound__is_live_fs = 1;
    }
  }
}

@end