void STStart()
{
  id v0;
  uint64_t vars8;

  v0 = +[STStorageAppsMonitor sharedMonitor];
  [v0 sync];
}

void sub_218152F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21815329C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218153C90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 40));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_218153D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

uint64_t STStorageAppSortByNameBlock_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

uint64_t STStorageAppSortBySizeBlock_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 appSize];
  uint64_t v7 = [v6 userTotal];

  v8 = [v5 appSize];
  uint64_t v9 = [v8 userTotal];

  if (v7 <= v9)
  {
    if (v7 < v9)
    {
      uint64_t v10 = 1;
    }
    else
    {
      v11 = [v4 name];
      v12 = [v5 name];
      uint64_t v10 = [v11 localizedCaseInsensitiveCompare:v12];
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

void AppendSizeInfo(void *a1, void *a2, uint64_t a3)
{
  id v8 = a1;
  id v5 = a2;
  if (a3 >= 0) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = -a3;
  }
  if (v6 >= 0xFA0)
  {
    uint64_t v7 = STFormattedSize(v6);
    [v8 appendFormat:@" %@:%@", v5, v7];

    if (a3 < 0) {
      [v8 appendFormat:@"*"];
    }
  }
}

id STStorageLog()
{
  if (STStorageLog_onceToken != -1) {
    dispatch_once(&STStorageLog_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)STStorageLog__gSharedLog;

  return v0;
}

uint64_t __STStorageLog_block_invoke()
{
  STStorageLog__gSharedLog = (uint64_t)os_log_create("com.apple.storage", "log");

  return MEMORY[0x270F9A758]();
}

void STTokenLogSize(uint64_t a1, void *a2)
{
  id v3 = a2;
  STFormattedSize(a1);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  STLog(4, @"%@: %@", v4, v5, v6, v7, v8, v9, (uint64_t)v10);
}

void STLog(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = (objc_class *)NSString;
  id v11 = a2;
  v12 = (__CFString *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  switch(a1)
  {
    case 2:
      v13 = STStorageLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        STLog_cold_1((uint64_t)v12, v13);
      }
      break;
    case 3:
      v13 = STStorageLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        STLog_cold_2((uint64_t)v12, v13);
      }
      break;
    case 4:
      v13 = STStorageLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = @"StorageLogInvestigation";
        __int16 v19 = 2114;
        v20 = v12;
        v14 = "%@ - %{public}@";
        v15 = v13;
        uint32_t v16 = 22;
LABEL_12:
        _os_log_impl(&dword_218150000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
      break;
    default:
      v13 = STStorageLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v12;
        v14 = "%{public}@";
        v15 = v13;
        uint32_t v16 = 12;
        goto LABEL_12;
      }
      break;
  }
}

id STFormattedSize(uint64_t a1)
{
  v2 = NSLocalizedFileSizeDescription();
  id v3 = v2;
  if (a1 < 0)
  {
    id v4 = [NSString stringWithFormat:@"-%@", v2];
  }
  else
  {
    id v4 = v2;
  }
  uint64_t v5 = v4;

  return v5;
}

void STLogDuration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void STLogSize(uint64_t a1, void *a2)
{
  id v3 = a2;
  STFormattedSize(a1);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  STLog(1, @"%@: %@", v4, v5, v6, v7, v8, v9, (uint64_t)v10);
}

void STLogSizeVector(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  STFormattedSize([v4 userTotal]);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = STFormattedSize([v4 docsAndData]);
  uint64_t v6 = STFormattedSize([v4 purgeable]);
  uint64_t v7 = STFormattedSize([v4 fixed]);
  uint64_t v8 = [v4 dynamic];

  v15 = STFormattedSize(v8);
  STLog(1, @"%@: UT: %@ / DD: %@ / PG: %@ / FX: %@ / DY: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v3);
}

id STFormattedShortDate(void *a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __STFormattedShortDate_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v7 = a2;
  uint64_t v2 = STFormattedShortDate_onceToken;
  id v3 = a1;
  if (v2 != -1) {
    dispatch_once(&STFormattedShortDate_onceToken, block);
  }
  id v4 = [(id)STFormattedShortDate__formatter stringFromDate:v3];

  return v4;
}

uint64_t __STFormattedShortDate_block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  id v3 = (void *)STFormattedShortDate__formatter;
  STFormattedShortDate__formatter = (uint64_t)v2;

  [(id)STFormattedShortDate__formatter setDateStyle:1];
  [(id)STFormattedShortDate__formatter setTimeStyle:*(unsigned __int8 *)(a1 + 32)];
  [(id)STFormattedShortDate__formatter setDoesRelativeDateFormatting:1];
  id v4 = (void *)STFormattedShortDate__formatter;

  return [v4 setFormattingContext:2];
}

id STMakeDirPath(void *a1)
{
  id v1 = a1;
  if ([v1 length] && (objc_msgSend(v1, "hasSuffix:", @"/") & 1) == 0)
  {
    id v2 = [v1 stringByAppendingString:@"/"];
  }
  else
  {
    id v2 = v1;
  }
  id v3 = v2;

  return v3;
}

uint64_t STSizeOfSystemVolume()
{
  if (STSizeOfSystemVolume_onceToken != -1) {
    dispatch_once(&STSizeOfSystemVolume_onceToken, &__block_literal_global_138);
  }
  return STSizeOfSystemVolume__gSystemSize;
}

void __STSizeOfSystemVolume_block_invoke()
{
  uint64_t v0 = STVolumeSize("/");
  uint64_t v1 = STVolumeSize("/private/preboot") + v0;
  STSizeOfPathWithOptions(@"/private/var/.overprovisioning_file", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  STSizeOfSystemVolume__gSystemSize = v1 + [v2 unsignedLongLongValue];
}

uint64_t STVolumeSize(const char *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset(v9, 0, 20);
  uint64_t v12 = 0;
  uint64_t v10 = 5;
  uint64_t v11 = 2155872256;
  int v2 = getattrlist(a1, &v10, v9, 0x14uLL, 0);
  id v3 = STStorageLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      STVolumeSize_cold_2((uint64_t)a1, v4);
    }

    LODWORD(v11) = -2147483628;
    if (getattrlist(a1, &v10, v9, 0x14uLL, 0))
    {
      uint64_t v5 = STStorageLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        STVolumeSize_cold_1((uint64_t)a1, v5);
      }

      return 0;
    }
    else
    {
      uint64_t v6 = *(void *)&v9[1] - *(void *)&v9[3];
      char v7 = STStorageLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v14 = a1;
        __int16 v15 = 2048;
        uint64_t v16 = v6;
        _os_log_impl(&dword_218150000, v7, OS_LOG_TYPE_INFO, "STVolumeSize: %{public}s volume: %lld", buf, 0x16u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v14 = a1;
      __int16 v15 = 2048;
      uint64_t v16 = *(void *)&v9[1];
      _os_log_impl(&dword_218150000, v4, OS_LOG_TYPE_INFO, "STVolumeSize: %{public}s volume: %lld", buf, 0x16u);
    }

    return *(void *)&v9[1];
  }
  return v6;
}

id STSizeOfPath(void *a1)
{
  return STSizeOfPathWithOptions(a1, 0);
}

id STSizeOfPathWithOptions(void *a1, int a2)
{
  v49[2] = *(char **)MEMORY[0x263EF8340];
  id v3 = a1;
  if (![v3 length]) {
    goto LABEL_32;
  }
  id v4 = v3;
  v49[0] = (char *)[v4 fileSystemRepresentation];
  v49[1] = 0;
  uint64_t v5 = fts_open(v49, 81, 0);
  if (!v5)
  {
    STLog(2, @"Failed to open path: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
LABEL_32:
    v41 = 0;
    goto LABEL_36;
  }
  uint64_t v12 = v5;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = fts_read(v12);
  if (!v14)
  {
    fts_close(v12);
    uint64_t v40 = 0;
LABEL_34:
    v41 = [NSNumber numberWithLongLong:v40];
    goto LABEL_35;
  }
  uint64_t v21 = v14;
  char v43 = 0;
  uint64_t v45 = 0;
  uint64_t v44 = *MEMORY[0x263EFF770];
  do
  {
    v22 = v21;
    while (v22->fts_info == 8)
    {
      if (!a2)
      {
        v22 = v21;
        goto LABEL_23;
      }
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      if (fsctl(v22->fts_path, 0x40104A0EuLL, &v47, 0) == -1 || v47 != 2) {
        goto LABEL_23;
      }
      uint64_t v24 = v48;
      v25 = [NSNumber numberWithUnsignedLongLong:v48];
      char v26 = [v13 containsObject:v25];

      if ((v26 & 1) == 0)
      {
        v34 = [NSNumber numberWithUnsignedLongLong:v24];
        [v13 addObject:v34];

LABEL_23:
        fts_statp = v22->fts_statp;
        if ((fts_statp->st_flags & 0x20) != 0)
        {
          v36 = (void *)MEMORY[0x21D463BC0]();
          v37 = NSURL;
          v38 = [NSString stringWithUTF8String:v22->fts_path];
          v39 = [v37 fileURLWithPath:v38];

          id v46 = 0;
          [v39 getResourceValue:&v46 forKey:v44 error:0];
          v45 += [v46 longLongValue];
        }
        else
        {
          uint64_t v47 = 0;
          if (v22->fts_info != 8 || (fsctl(v22->fts_path, 0x40084A47uLL, &v47, 0), !v47)) {
            v45 += fts_statp->st_blocks << 9;
          }
        }
        goto LABEL_28;
      }
      v22 = fts_read(v12);
      if (!v22) {
        goto LABEL_29;
      }
    }
    switch(v22->fts_info)
    {
      case 4u:
        STLog(2, @"path is unreadable: %s", v15, v16, v17, v18, v19, v20, (uint64_t)v22->fts_path);
        break;
      case 7u:
        v27 = __error();
        STLog(3, @"error %d sizing %s", v28, v29, v30, v31, v32, v33, *v27);
        char v43 = 1;
        break;
      case 0xAu:
        STLog(2, @"stat failed for %s", v15, v16, v17, v18, v19, v20, (uint64_t)v22->fts_path);
        break;
      case 0xCu:
      case 0xDu:
        goto LABEL_23;
      default:
        break;
    }
LABEL_28:
    uint64_t v21 = fts_read(v12);
  }
  while (v21);
LABEL_29:
  fts_close(v12);
  uint64_t v40 = v45;
  if ((v43 & 1) == 0) {
    goto LABEL_34;
  }
  v41 = 0;
LABEL_35:

LABEL_36:

  return v41;
}

id STSharedConcurrentQueue()
{
  if (STSharedConcurrentQueue_token != -1) {
    dispatch_once(&STSharedConcurrentQueue_token, &__block_literal_global_160);
  }
  uint64_t v0 = (void *)STSharedConcurrentQueue_queue;

  return v0;
}

void __STSharedConcurrentQueue_block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("shared_concurrent", v0);
  int v2 = (void *)STSharedConcurrentQueue_queue;
  STSharedConcurrentQueue_queue = (uint64_t)v1;
}

id STSharedConcurrentOpQueue()
{
  if (STSharedConcurrentOpQueue_token != -1) {
    dispatch_once(&STSharedConcurrentOpQueue_token, &__block_literal_global_163);
  }
  uint64_t v0 = (void *)STSharedConcurrentOpQueue_opQueue;

  return v0;
}

uint64_t __STSharedConcurrentOpQueue_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  dispatch_queue_t v1 = (void *)STSharedConcurrentOpQueue_opQueue;
  STSharedConcurrentOpQueue_opQueue = (uint64_t)v0;

  int v2 = STSharedConcurrentQueue();
  [(id)STSharedConcurrentOpQueue_opQueue setUnderlyingQueue:v2];

  id v3 = (void *)STSharedConcurrentOpQueue_opQueue;

  return [v3 setMaxConcurrentOperationCount:4];
}

id STSharedContainerSizingQueue()
{
  if (STSharedContainerSizingQueue_token != -1) {
    dispatch_once(&STSharedContainerSizingQueue_token, &__block_literal_global_166);
  }
  id v0 = (void *)STSharedContainerSizingQueue_queue;

  return v0;
}

void __STSharedContainerSizingQueue_block_invoke()
{
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.settings.storage.containersizing", attr);
  int v2 = (void *)STSharedContainerSizingQueue_queue;
  STSharedContainerSizingQueue_queue = (uint64_t)v1;
}

id STSharedPathSizingOpQueue()
{
  if (STSharedPathSizingOpQueue_token != -1) {
    dispatch_once(&STSharedPathSizingOpQueue_token, &__block_literal_global_169);
  }
  id v0 = (void *)STSharedPathSizingOpQueue_opQueue;

  return v0;
}

uint64_t __STSharedPathSizingOpQueue_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  dispatch_queue_t v1 = (void *)STSharedPathSizingOpQueue_opQueue;
  STSharedPathSizingOpQueue_opQueue = (uint64_t)v0;

  int v2 = STSharedConcurrentQueue();
  [(id)STSharedPathSizingOpQueue_opQueue setUnderlyingQueue:v2];

  id v3 = (void *)STSharedPathSizingOpQueue_opQueue;

  return [v3 setMaxConcurrentOperationCount:8];
}

id STSharedSerialQueue()
{
  if (STSharedSerialQueue_token != -1) {
    dispatch_once(&STSharedSerialQueue_token, &__block_literal_global_171);
  }
  id v0 = (void *)STSharedSerialQueue_queue;

  return v0;
}

void __STSharedSerialQueue_block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("shared_serial", v0);
  int v2 = (void *)STSharedSerialQueue_queue;
  STSharedSerialQueue_queue = (uint64_t)v1;
}

id STSharedSerialOpQueue()
{
  if (STSharedSerialOpQueue_token != -1) {
    dispatch_once(&STSharedSerialOpQueue_token, &__block_literal_global_174);
  }
  id v0 = (void *)STSharedSerialOpQueue_opQueue;

  return v0;
}

uint64_t __STSharedSerialOpQueue_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  dispatch_queue_t v1 = (void *)STSharedSerialOpQueue_opQueue;
  STSharedSerialOpQueue_opQueue = (uint64_t)v0;

  int v2 = STSharedSerialQueue();
  [(id)STSharedSerialOpQueue_opQueue setUnderlyingQueue:v2];

  id v3 = (void *)STSharedSerialOpQueue_opQueue;

  return [v3 setMaxConcurrentOperationCount:1];
}

id STStorageDataLocStr(void *a1)
{
  uint64_t v1 = STStorageDataLocStr_strToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&STStorageDataLocStr_strToken, &__block_literal_global_176);
  }
  id v3 = [(id)STStorageDataLocStr_strBundle localizedStringForKey:v2 value:v2 table:0];

  return v3;
}

uint64_t __STStorageDataLocStr_block_invoke()
{
  STStorageDataLocStr_strBundle = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Ststorageapp.isa)];

  return MEMORY[0x270F9A758]();
}

uint64_t STStorageIsInternalInstall()
{
  if (STStorageIsInternalInstall_onceToken != -1) {
    dispatch_once(&STStorageIsInternalInstall_onceToken, &__block_literal_global_182);
  }
  return STStorageIsInternalInstall_isInternal;
}

void __STStorageIsInternalInstall_block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  STStorageIsInternalInstall_isInternal = [v0 BOOLValue];
}

uint64_t STStorageIsDeveloperRelease()
{
  if (STStorageIsDeveloperRelease_onceToken != -1) {
    dispatch_once(&STStorageIsDeveloperRelease_onceToken, &__block_literal_global_187);
  }
  return STStorageIsDeveloperRelease_isDeveloperRelease;
}

void __STStorageIsDeveloperRelease_block_invoke()
{
  MGGetStringAnswer();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  STStorageIsDeveloperRelease_isDeveloperRelease = [v0 isEqualToString:@"Beta"];
}

uint64_t STStorageDeviceIsiPad()
{
  if (STStorageDeviceIsiPad_onceToken != -1) {
    dispatch_once(&STStorageDeviceIsiPad_onceToken, &__block_literal_global_195);
  }
  return STStorageDeviceIsiPad_isiPad;
}

void __STStorageDeviceIsiPad_block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  STStorageDeviceIsiPad_isiPad = [v0 intValue] == 3;
}

uint64_t STStorageComputePercentage(void *a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = a2;
  [a1 floatValue];
  float v6 = v5;
  [v4 floatValue];
  float v8 = v7;

  return [v3 numberWithInt:(int)(float)((float)(v6 / v8) * 100.0)];
}

uint64_t STPersonasAreSupported()
{
  if (STPersonasAreSupported_onceToken != -1) {
    dispatch_once(&STPersonasAreSupported_onceToken, &__block_literal_global_3);
  }
  return STPersonasAreSupported_personasSupported;
}

void __STPersonasAreSupported_block_invoke()
{
  id v0 = [MEMORY[0x263F841B0] sharedManager];
  STPersonasAreSupported_personasSupported = [v0 isMultiUser] ^ 1;

  char v1 = STPersonasAreSupported_personasSupported;
  if (STPersonasAreSupported_personasSupported) {
    char v1 = MGGetBoolAnswer() ^ 1;
  }
  STPersonasAreSupported_personasSupported = v1;
}

id STPersonaCopyPersonaUniqueStrings()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (STPersonasAreSupported_onceToken != -1) {
    dispatch_once(&STPersonasAreSupported_onceToken, &__block_literal_global_3);
  }
  if (STPersonasAreSupported_personasSupported)
  {
    id v0 = [MEMORY[0x263F841B0] sharedManager];
    id v32 = 0;
    uint64_t v1 = [v0 personaGenerationIdentifierWithError:&v32];
    id v2 = v32;

    if (v1)
    {
      if (v1 == STPersonaCopyPersonaUniqueStrings_previousGenerationId
        && STPersonaCopyPersonaUniqueStrings_personaUniqueStrings != 0)
      {
        id v24 = (id)STPersonaCopyPersonaUniqueStrings_personaUniqueStrings;

        goto LABEL_31;
      }
      STPersonaCopyPersonaUniqueStrings_previousGenerationId = v1;
    }
    id v4 = [MEMORY[0x263F841B0] sharedManager];
    id v31 = v2;
    float v5 = [v4 listAllPersonaAttributesWithError:&v31];
    id v6 = v31;

    if (v5)
    {
      id v26 = v6;
      uint64_t v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      uint64_t v14 = (void *)STPersonaCopyPersonaUniqueStrings_personaUniqueStrings;
      STPersonaCopyPersonaUniqueStrings_personaUniqueStrings = v13;

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = v5;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (!v16) {
        goto LABEL_27;
      }
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      while (1)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v21 = [v20 userPersonaUniqueString];
          if ([v20 isPersonalPersona])
          {
            uint64_t v22 = 1;
            if (v21) {
              goto LABEL_24;
            }
          }
          else
          {
            if ([v20 isEnterprisePersona]) {
              uint64_t v22 = 2;
            }
            else {
              uint64_t v22 = 0;
            }
            if (v21)
            {
LABEL_24:
              v23 = [NSNumber numberWithUnsignedInteger:v22];
              [(id)STPersonaCopyPersonaUniqueStrings_personaUniqueStrings setObject:v23 forKeyedSubscript:v21];
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (!v17)
        {
LABEL_27:

          id v6 = v26;
          goto LABEL_29;
        }
      }
    }
    STLog(2, @"Could not fetch persona attributes from UserManagement %@\n", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
LABEL_29:
  }
  id v24 = (id)[(id)STPersonaCopyPersonaUniqueStrings_personaUniqueStrings copy];
LABEL_31:

  return v24;
}

id DataContainersFromAppRecordWithPersonas(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  float v5 = [v3 bundleIdentifier];
  id v6 = [v3 managedPersonas];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if ([v7 count])
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", 2 * objc_msgSend(v7, "count"));
    while ([v7 count])
    {
      uint64_t v9 = [v7 lastObject];
      [v7 removeLastObject];
      uint64_t v10 = [v4 objectForKeyedSubscript:v9];
      uint64_t v11 = [v10 unsignedIntegerValue];

      if ((unint64_t)(v11 - 1) > 1)
      {
        uint64_t v12 = STPersonaUniqueStringOfType(1, v4);
        uint64_t v13 = STPersonaUniqueStringOfType(2, v4);
        if (v12) {
          [v7 addObject:v12];
        }
        if (v13) {
          [v7 addObject:v13];
        }
      }
      else
      {
        uint64_t v12 = +[STContainer containerWithIdentifier:v5 containerClass:2 personaUniqueString:v9];
        if (v12) {
          [v8 addObject:v12];
        }
      }
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    uint64_t v14 = +[STContainer containerWithIdentifier:v5 containerClass:2 personaUniqueString:0];
    if (v14) {
      [v8 addObject:v14];
    }
  }

  return v8;
}

id STPersonaUniqueStringOfType(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v13);
        uint64_t v10 = [v9 unsignedIntegerValue];

        if (v10 == a1)
        {
          id v11 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

void STMCMDataContainersFromAppProxyWithPersonas(void *a1, void *a2, void *a3, void *a4)
{
  id v30 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 bundleIdentifier];
  uint64_t v11 = [v7 managedPersonas];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    long long v13 = [v7 managedPersonas];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      long long v15 = [v7 managedPersonas];
      long long v16 = (void *)[v15 mutableCopy];
      while (1)
      {
        while (1)
        {

          if (![v16 count]) {
            goto LABEL_17;
          }
          long long v15 = [v16 lastObject];
          [v16 removeLastObject];
          uint64_t v17 = [v30 objectForKeyedSubscript:v15];
          uint64_t v18 = [v17 unsignedIntegerValue];

          if ((unint64_t)(v18 - 1) <= 1) {
            break;
          }
          uint64_t v20 = STPersonaUniqueStringOfType(1, v30);
          v23 = STPersonaUniqueStringOfType(2, v30);
          if (v20) {
            [v16 addObject:v20];
          }
          if (v23) {
            [v16 addObject:v23];
          }
LABEL_13:
        }
        if ([v7 isContainerized])
        {
          uint64_t v19 = +[STContainer containerWithIdentifier:v10 containerClass:2 personaUniqueString:v15];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = [v19 url];
            uint64_t v22 = [v21 path];
            v23 = STMakeDirPath(v22);

            id v24 = STMakeDirPath(v23);
            [v8 setObject:v7 forKey:v24];

            [v9 setObject:v20 forKey:v23];
            goto LABEL_13;
          }
        }
      }
    }
  }
  if ([v7 isContainerized])
  {
    v25 = +[STContainer containerWithIdentifier:v10 containerClass:2 personaUniqueString:0];
    if (v25)
    {
      long long v16 = v25;
      id v26 = [v25 url];
      long long v27 = [v26 path];
      long long v28 = STMakeDirPath(v27);

      long long v29 = STMakeDirPath(v28);
      [v8 setObject:v7 forKey:v29];

      [v9 setObject:v16 forKey:v28];
LABEL_17:
    }
  }
}

id STNameForCategoryKey(void *a1)
{
  id v1 = a1;
  if (STNameForCategoryKey_onceToken != -1) {
    dispatch_once(&STNameForCategoryKey_onceToken, &__block_literal_global_4);
  }
  if ([v1 isEqualToString:@"CAT_SYSTEM"])
  {
    id v2 = (id)STNameForCategoryKey_marketingSystemName;
  }
  else
  {
    STStorageDataLocStr(v1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v3 = v2;

  return v3;
}

uint64_t __STNameForCategoryKey_block_invoke()
{
  STNameForCategoryKey_marketingSystemName = MGCopyAnswer();

  return MEMORY[0x270F9A758]();
}

__CFString *STKeyForCategory(unsigned int a1)
{
  if (a1 > 8) {
    return &stru_26C925718;
  }
  else {
    return off_2643052F0[a1];
  }
}

void _UpdateSize(void *a1, void *a2, uint64_t a3)
{
  if (*a2 != a3)
  {
    *a2 = a3;
    id v3 = a1;
    [v3 setIntSizesVar:0];
    [v3 setAppSizesVar:0];
    [v3 notifyAppSizeChanged];
  }
}

id SizesOfContainers(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    id v2 = +[STMSizer sharedAppSizer];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v1;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v10 = [v9 url];
          uint64_t v11 = [v10 path];

          if ([v11 length])
          {
            uint64_t v12 = STMakeDirPath(v11);

            long long v13 = [v2 updatedSizeOfItemForPath:v12];
            uint64_t v14 = [v13 longLongValue];

            if (v14)
            {
              if ([v9 containerClass] == 1)
              {
                v21 += v14;
              }
              else
              {
                v20 += v14;
                uint64_t v15 = [v12 stringByAppendingString:@"Library/Caches/"];

                long long v16 = [v2 updatedSizeOfItemForPath:v15];
                v6 += [v16 longLongValue];

                uint64_t v12 = (void *)v15;
              }
            }
          }
          else
          {
            uint64_t v12 = v11;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v5);
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v6 = 0;
    }

    uint64_t v17 = +[STSizeVector fixed:v21 dynamic:v20 purgeable:v6];

    id v1 = v19;
  }
  else
  {
    uint64_t v17 = +[STSizeVector zero];
  }

  return v17;
}

void STMSizeOfFileTree(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5 = (void *)MEMORY[0x263F08850];
  id v6 = a1;
  id v13 = [v5 defaultManager];
  if ([v13 fileExistsAtPath:v6])
  {
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    diskUsageList(v6, 0, a2, a3);
  }
  else
  {
    STLog(2, @"STMSizeOfFileTree: Could not get size of %@, file doesn't exist", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(void *)(a3 + 24) = 1;
    *(void *)(a3 + 32) = 0;
  }
}

void diskUsageList(void *a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v168 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v156 = a2;
  memset(v167, 0, 7);
  if (v7)
  {
    if (a3)
    {
      memset(&v161.st_ino, 0, 32);
      *(void *)&v161.st_dev = 1;
      id v14 = v7;
      if (!fsctl((const char *)[v14 fileSystemRepresentation], 0xC0284A20uLL, &v161, 0))
      {
        *(void *)(a4 + 16) = 0;
        *(void *)(a4 + 24) = 0;
        *(void *)(a4 + 32) = 0;
        *(int8x16_t *)a4 = vextq_s8(*(int8x16_t *)&v161.st_uid, *(int8x16_t *)&v161.st_uid, 8uLL);
        goto LABEL_86;
      }
      uint64_t v15 = *__error();
      long long v16 = __error();
      uint64_t v17 = strerror(*v16);
      v143[4093] = v15;
      v143[4094] = v17;
      STLog(0, @"Asked to use fast sizing on %@ but fast sizing failed: %d (%s)", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
    }
    id v24 = (id)objc_opt_new();
    id v25 = [MEMORY[0x263EFF980] array];
    mach_timebase_info info = 0;
    unint64_t v163 = 0xA200000900000005;
    int v164 = 0;
    uint64_t v165 = 0x500000002;
    int v166 = 768;
    mach_timebase_info(&info);
    uint64_t v26 = mach_absolute_time();
    MEMORY[0x270FA5388]();
    bzero(v143, 0x8000uLL);
    id v27 = v7;
    uint64_t v34 = +[PathObject pathObjectWithPath:component:](PathObject, "pathObjectWithPath:component:", [v27 fileSystemRepresentation], 0);
    if (v34)
    {
      v149 = (int *)v143;
      uint64_t v144 = (uint64_t)v27;
      uint64_t v145 = v26;
      id v152 = v24;
      v147 = (void *)a4;
      [v25 addObject:v34];
      uint64_t v35 = [v25 count];
      id v148 = v7;
      v146 = v34;
      if (v35)
      {
        uint64_t v158 = 0;
        uint64_t v159 = 0;
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        id v150 = v25;
        while (1)
        {
          memset(&v161, 0, sizeof(v161));
          v38 = [v25 objectAtIndex:0];
          [v25 removeObjectAtIndex:0];
          int v39 = open((const char *)[v38 path], 256);
          if ((v39 & 0x80000000) == 0) {
            break;
          }
          v54 = __error();
          strerror(*v54);
          STLog(2, @"Failed to open directory %@ : %s", v55, v56, v57, v58, v59, v60, (uint64_t)v38);
          uint64_t v37 = 1;
LABEL_79:

          if (![v25 count]) {
            goto LABEL_84;
          }
        }
        int v40 = v39;
        if (fstat(v39, &v161))
        {
          uint64_t v47 = __error();
          strerror(*v47);
          STLog(2, @"fstat failed for %@ : %s", v48, v49, v50, v51, v52, v53, (uint64_t)v38);
          uint64_t v37 = 1;
LABEL_78:
          close(v40);
          goto LABEL_79;
        }
        int v61 = v161.st_mode & 0xF000;
        if (v61 == 40960 || v61 == 0x8000)
        {
          blkcnt_t v123 = v161.st_blocks << 9;
          ++v159;
          v158 += v161.st_blocks << 9;
          uint64_t v160 = 0;
          fsctl((const char *)[v38 path], 0x40084A47uLL, &v160, 0);
          if (v160) {
            blkcnt_t v124 = v123;
          }
          else {
            blkcnt_t v124 = 0;
          }
          v36 += v124;
          goto LABEL_78;
        }
        if (v61 != 0x4000)
        {
          STLog(1, @"%@ is not a file, link or directory, skipping.", v41, v42, v43, v44, v45, v46, (uint64_t)v38);
          goto LABEL_78;
        }
        uint64_t v157 = v36;
        uint64_t v62 = 0;
LABEL_16:
        v63 = v149;
        do
        {
          int v64 = getattrlistbulk(v40, &v163, v63, 0x8000uLL, 0);
          if (v64 == -1)
          {
            v125 = __error();
            strerror(*v125);
            STLog(2, @"getattrlistbulk on entry %llu in %@ returned error %s", v126, v127, v128, v129, v130, v131, v62);
            uint64_t v37 = 1;
LABEL_77:
            id v25 = v150;
            uint64_t v36 = v157;
            goto LABEL_78;
          }
          int v71 = v64;
          if (!v64) {
            goto LABEL_77;
          }
        }
        while (v64 < 1);
        while (1)
        {
          uint64_t v73 = *v63;
          unsigned int v72 = v63[1];
          unsigned int v74 = v63[4];
          unsigned int v75 = v63[5];
          if ((v72 & 0x20000000) != 0)
          {
            if (v63[6])
            {
              v82 = __error();
              v83 = strerror(*v82);
              STLog(2, @"Got error %s while processing entry %llu in %@", v84, v85, v86, v87, v88, v89, (uint64_t)v83);
              goto LABEL_62;
            }
            v76 = v63 + 7;
            if ((v72 & 1) == 0)
            {
LABEL_22:
              uint64_t v77 = 0;
              if ((v72 & 8) != 0) {
                goto LABEL_23;
              }
              goto LABEL_29;
            }
          }
          else
          {
            v76 = v63 + 6;
            if ((v72 & 1) == 0) {
              goto LABEL_22;
            }
          }
          uint64_t v77 = (uint64_t)v76 + *v76;
          v76 += 2;
          if ((v72 & 8) != 0)
          {
LABEL_23:
            int v79 = *v76++;
            int v78 = v79;
            if ((v72 & 0x2000000) == 0) {
              goto LABEL_30;
            }
            goto LABEL_24;
          }
LABEL_29:
          int v78 = 0;
          if ((v72 & 0x2000000) == 0)
          {
LABEL_30:
            uint64_t v80 = 0;
            goto LABEL_31;
          }
LABEL_24:
          uint64_t v81 = *(void *)v76;
          v76 += 2;
          uint64_t v80 = v81;
LABEL_31:
          if (v78 != 2)
          {
            if (v74)
            {
              int v106 = *v76++;
              int v103 = v106;
              if ((v74 & 4) == 0) {
                goto LABEL_43;
              }
LABEL_41:
              uint64_t v105 = *(void *)v76;
              v76 += 2;
              uint64_t v104 = v105;
            }
            else
            {
              int v103 = 0;
              if ((v74 & 4) != 0) {
                goto LABEL_41;
              }
LABEL_43:
              uint64_t v104 = 0;
            }
            LODWORD(v155) = v37;
            if ((v75 & 0x100) != 0)
            {
              uint64_t v108 = *(void *)v76;
              v76 += 2;
              uint64_t v107 = v108;
            }
            else
            {
              uint64_t v107 = 0;
            }
            uint64_t v154 = v80;
            uint64_t v153 = v77;
            if ((v75 & 0x200) != 0) {
              int v109 = *v76;
            }
            else {
              LOBYTE(v109) = 0;
            }
            if (v156 && (v109 & 1) != 0 && v107)
            {
              int v151 = v103;
              [NSNumber numberWithLongLong:v104];
              v111 = uint64_t v110 = v73;
              v112 = [NSNumber numberWithUnsignedLongLong:v107];
              [v156 setObject:v111 forKeyedSubscript:v112];

              int v103 = v151;
              uint64_t v73 = v110;
            }
            if ((v109 & 8) != 0) {
              uint64_t v113 = v104;
            }
            else {
              uint64_t v113 = 0;
            }
            v157 += v113;
            if (v103 == 1)
            {
              v158 += v104;
              ++v159;
            }
            else
            {
              v114 = (void *)MEMORY[0x21D463BC0]();
              id v115 = v152;
              uint64_t v116 = v154;
              if ([v152 containsIndex:v154])
              {
                STLog(1, @"Skipping hardlinked file at %@/%s", v117, v118, v119, v120, v121, v122, (uint64_t)v38);
              }
              else
              {
                v158 += v104;
                ++v159;
                [v115 addIndex:v116];
              }
            }
            uint64_t v37 = v155;
            goto LABEL_69;
          }
          if ((v63[3] & 2) != 0 && !*v76)
          {
            STLog(1, @"Skipping empty directory at %@/%s", v65, v66, v67, v68, v69, v70, (uint64_t)v38);
            goto LABEL_69;
          }
          if (v77)
          {
            v90 = (void *)MEMORY[0x21D463BC0]();
            v91 = +[PathObject pathObjectWithPath:component:](PathObject, "pathObjectWithPath:component:", [v38 path], v77);
            v98 = v91;
            if (v91)
            {
              v155 = v90;
              uint64_t v99 = v73;
              uint64_t v100 = v37;
              v101 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v91, "path"));
              char v102 = [0 containsObject:v101];

              if ((v102 & 1) == 0) {
                [v150 addObject:v98];
              }
              uint64_t v37 = v100;
              uint64_t v73 = v99;
              v90 = v155;
            }
            else
            {
              STLog(2, @"Failed to create path to child directory by appending \"%s\" to %@", v92, v93, v94, v95, v96, v97, v77);
              uint64_t v37 = 1;
            }

            goto LABEL_69;
          }
          STLog(2, @"Failed to get name for directory item %llu in %@; not counting its children",
            v65,
            v66,
            v67,
            v68,
            v69,
            v70,
            v62);
LABEL_62:
          uint64_t v37 = 1;
LABEL_69:
          v63 = (int *)((char *)v63 + v73);
          ++v62;
          if (!--v71) {
            goto LABEL_16;
          }
        }
      }
      LOBYTE(v37) = 0;
      uint64_t v36 = 0;
      uint64_t v159 = 0;
      uint64_t v158 = 0;
LABEL_84:
      mach_absolute_time();
      uint64_t v132 = v158;
      v133 = [MEMORY[0x263F086F0] stringFromByteCount:v158 countStyle:0];
      v134 = [MEMORY[0x263F086F0] stringFromByteCount:v36 countStyle:0];
      uint64_t v135 = v159;
      STLog(1, @"result for %@: %llu files, %@ total, %@ purgeable, took %lf ms"), v136, v137, v138, v139, v140, v141, v144);

      v142 = v147;
      void *v147 = v132;
      v142[1] = v135;
      v142[2] = v36;
      v142[3] = 0;
      *((unsigned char *)v142 + 32) = v37;
      *(_DWORD *)((char *)v142 + 33) = v167[0];
      *((_DWORD *)v142 + 9) = *(_DWORD *)((char *)v167 + 3);
      id v7 = v148;
      id v24 = v152;
      uint64_t v34 = v146;
    }
    else
    {
      STLog(2, @"unable to create PathObject from %@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);
      free(v143);
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      *(unsigned char *)(a4 + 32) = 1;
      *(_DWORD *)(a4 + 33) = 0;
      *(_DWORD *)(a4 + 36) = 0;
    }
  }
  else
  {
    STLog(2, @"Path is nil", v8, v9, v10, v11, v12, v13, v143[4096]);
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(unsigned char *)(a4 + 32) = 1;
    *(_DWORD *)(a4 + 33) = 0;
    *(_DWORD *)(a4 + 36) = 0;
  }
LABEL_86:
}

id STMSizesOfClones(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263EFF9A0];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithCapacity:1000];
  diskUsageList(v2, v3, 0, (uint64_t)v5);

  return v3;
}

void *_CacheSizeForAppIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v1 allowPlaceholder:1 error:0];
    id v3 = [v2 UIBackgroundModes];
    if ([v3 containsObject:@"continuous"])
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [v2 dataContainerURL];

      if (!v4)
      {
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v5 = [v2 dataContainerURL];
      id v6 = [v5 path];
      id v3 = [v6 stringByAppendingPathComponent:@"Library/Caches/"];

      uint64_t v11 = 0;
      memset(v10, 0, sizeof(v10));
      diskUsageList(v3, 0, 1, (uint64_t)v10);
      uint64_t v7 = *(void *)&v10[0] & ~(*(uint64_t *)&v10[0] >> 63);
      uint64_t v8 = [NSString stringWithFormat:@"CacheSize: %@", v1];
      STLogSize(v7, v8);

      uint64_t v4 = (void *)(_SizeOfOPurgeableAssets(v1) + v7);
    }

    goto LABEL_8;
  }
  uint64_t v4 = 0;
LABEL_9:

  return v4;
}

uint64_t _SizeOfOPurgeableAssets(void *a1)
{
  id v1 = a1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___SizeOfOPurgeableAssets_block_invoke;
  v9[3] = &unk_264305398;
  v9[4] = &v10;
  id v2 = v1;
  id v3 = v9;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v4 = getCacheManagementEnumerateAssetsSymbolLoc_ptr;
  uint64_t v18 = getCacheManagementEnumerateAssetsSymbolLoc_ptr;
  if (!getCacheManagementEnumerateAssetsSymbolLoc_ptr)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getCacheManagementEnumerateAssetsSymbolLoc_block_invoke;
    v14[3] = &unk_2643053C0;
    v14[4] = &v15;
    __getCacheManagementEnumerateAssetsSymbolLoc_block_invoke((uint64_t)v14);
    uint64_t v4 = (void *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (v4)
  {
    ((void (*)(id, void, void *))v4)(v2, 0, v3);

    uint64_t v5 = v11[3];
    id v6 = [NSString stringWithFormat:@"PurgeableAssets: %@", v2];
    STLogSize(v5, v6);

    uint64_t v7 = v11[3];
    _Block_object_dispose(&v10, 8);

    return v7;
  }
  else
  {
    dlerror();
    uint64_t result = abort_report_np();
    __break(1u);
  }
  return result;
}

void sub_21815C9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t STMSizeOfPurgeableAssets(void *a1)
{
  id v1 = a1;
  if ([v1 length]) {
    uint64_t v2 = _SizeOfOPurgeableAssets(v1);
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void *__getCacheManagementEnumerateAssetsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!CacheDeleteLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CacheDeleteLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2643053E0;
    uint64_t v7 = 0;
    CacheDeleteLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)CacheDeleteLibraryCore_frameworkLibrary;
    if (CacheDeleteLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)CacheDeleteLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "CacheManagementEnumerateAssets");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCacheManagementEnumerateAssetsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CacheDeleteLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CacheDeleteLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21815D750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CompressPath(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = [&unk_26C92C498 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v4 + v3;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(&unk_26C92C498);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        if ([v1 hasPrefix:v8])
        {
          uint64_t v10 = [v8 length];
          uint64_t v11 = [&unk_26C92C4B0 objectAtIndexedSubscript:v4 + v6];
          objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", 0, v10, v11);
          id v9 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [&unk_26C92C498 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v4 = v7;
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v9 = v1;
LABEL_11:

  return v9;
}

void sub_218160078(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_218160368(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _FSEventStreamCallback(uint64_t a1, void *a2, uint64_t a3, const char **a4, unsigned int *a5, uint64_t *a6)
{
  id v30 = a2;
  context = (void *)MEMORY[0x21D463BC0]();
  uint64_t v31 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
  if (a3)
  {
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      unsigned int v12 = *a5++;
      uint64_t v11 = v12;
      uint64_t v14 = *a6++;
      uint64_t v13 = v14;
      if ((v11 & 0x10) == 0)
      {
        long long v15 = *a4;
        long long v16 = (__CFString *)CFStringCreateWithFileSystemRepresentation(v10, *a4);
        if (v16)
        {
          uint64_t v23 = v16;
          id v24 = [(__CFString *)v16 lastPathComponent];
          char v25 = [v24 hasPrefix:@"."];

          if ((v25 & 1) == 0)
          {
            if ((v11 & 0x20000) != 0)
            {
              uint64_t v26 = STMakeDirPath(v23);

              uint64_t v23 = (void *)v26;
            }
            id v27 = +[STMSizeCacheEvent eventWithPath:v23 flags:v11 event:v13];
            [v31 addObject:v27];
          }
        }
        else
        {
          STLog(2, @"Error creating filesystem path for: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v15);
        }
      }
      ++a4;
      --a3;
    }
    while (a3);
  }
  if ([v31 count])
  {
    uint64_t v28 = _gSharedUpdateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___FSEventStreamCallback_block_invoke;
    block[3] = &unk_2643050C0;
    id v33 = v30;
    id v34 = v31;
    dispatch_async(v28, block);
  }
}

void sub_218160618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_2181606C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

id STTapToRadarURLWithTitleAndContent(void *a1, void *a2)
{
  v17[7] = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)MEMORY[0x263F08BA0];
  id v4 = a2;
  id v5 = a1;
  id v6 = objc_alloc_init(v3);
  [v6 setScheme:@"tap-to-radar"];
  [v6 setHost:@"new"];
  uint64_t v7 = [MEMORY[0x263F08BD0] queryItemWithName:@"Title" value:v5];

  uint64_t v8 = objc_msgSend(MEMORY[0x263F08BD0], "queryItemWithName:value:", @"Description", v4, v7);

  v17[1] = v8;
  id v9 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:@"Disk Space Triage"];
  v17[2] = v9;
  CFAllocatorRef v10 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentVersion" value:@"iOS"];
  v17[3] = v10;
  uint64_t v11 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentID" value:@"951859"];
  v17[4] = v11;
  unsigned int v12 = [MEMORY[0x263F08BD0] queryItemWithName:@"Classification" value:@"Other Bug"];
  v17[5] = v12;
  uint64_t v13 = [MEMORY[0x263F08BD0] queryItemWithName:@"Reproducibility" value:@"Always"];
  v17[6] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:7];
  [v6 setQueryItems:v14];

  long long v15 = [v6 URL];

  return v15;
}

id STTapToRadarURLWithTitle(void *a1)
{
  return STTapToRadarURLWithTitleAndContent(a1, &stru_26C925718);
}

void sub_218161CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCacheDeleteCopyPurgeableSpaceWithInfoSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CacheDeleteLibrary();
  uint64_t result = dlsym(v2, "CacheDeleteCopyPurgeableSpaceWithInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCacheDeleteCopyPurgeableSpaceWithInfoSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CacheDeleteLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CacheDeleteLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __CacheDeleteLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2643055B8;
    uint64_t v5 = 0;
    CacheDeleteLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = CacheDeleteLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!CacheDeleteLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CacheDeleteLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CacheDeleteLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getCacheDeleteCopyItemizedPurgeableSpaceWithInfoSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CacheDeleteLibrary();
  uint64_t result = dlsym(v2, "CacheDeleteCopyItemizedPurgeableSpaceWithInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCacheDeleteCopyItemizedPurgeableSpaceWithInfoSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

void sub_2181641AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void AddToMultiDict(void *a1, void *a2, void *a3)
{
  id v10 = a1;
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v10 objectForKey:v5];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 addObject:v6];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFF980] arrayWithObject:v6];

    [v10 setObject:v9 forKey:v5];
    id v6 = (id)v9;
  }
}

STStorageApp *getOrCreateApp(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v5 objectForKey:v6];
  if (v8) {
    goto LABEL_15;
  }
  id v9 = v6;
  id v10 = v7;
  id v24 = 0;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v9 allowPlaceholder:1 error:&v24];
  id v12 = v24;
  uint64_t v13 = v12;
  if (v11)
  {
    id v14 = v12;
LABEL_5:
    uint64_t v8 = [[STStorageApp alloc] initWithAppRecord:v11];

    goto LABEL_6;
  }
  id v23 = v12;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifierOfSystemPlaceholder:v9 error:&v23];
  id v14 = v23;

  if (v11) {
    goto LABEL_5;
  }
  uint64_t v8 = [[STStorageApp alloc] initWithBundleIdentifier:v9 name:v9 vendorName:0];
  [(STStorageApp *)v8 setAppKind:3];
LABEL_6:
  long long v15 = +[STStorageDataManager overridesFor:v8];
  long long v16 = [v15 defaultName];

  if (v16)
  {
    uint64_t v17 = [v15 defaultName];
  }
  else
  {
    uint64_t v18 = [v10 name];

    if (!v18) {
      goto LABEL_11;
    }
    uint64_t v17 = [v10 name];
  }
  uint64_t v19 = (void *)v17;
  [(STStorageApp *)v8 setName:v17];

LABEL_11:
  if (![(STStorageApp *)v8 isInstalled])
  {
    uint64_t v20 = [v15 unInstalledName];

    if (v20)
    {
      uint64_t v21 = [v15 unInstalledName];
      [(STStorageApp *)v8 setName:v21];
    }
  }
  -[STStorageApp setForceHidden:](v8, "setForceHidden:", [v15 forceHidden]);
  [(STStorageApp *)v8 setUsageBundle:v10];

  [v5 setObject:v8 forKey:v9];
LABEL_15:

  return v8;
}

STStorageApp *MakePseudoAppForContainer(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v30 = a1;
  id v3 = a2;
  long long v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v12 = [v11 vendorName];
        if ([v12 length])
        {
          uint64_t v13 = [v4 objectForKey:v12];
          id v14 = v13;
          if (v13)
          {
            [v13 addObject:v11];
          }
          else
          {
            long long v15 = [MEMORY[0x263EFF980] arrayWithObject:v11];
            [v4 setObject:v15 forKey:v12];
          }
          unint64_t v16 = [v14 count];
          if (v16 > [v8 count])
          {
            id v17 = v14;

            uint64_t v8 = v17;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  if (v8) {
    uint64_t v18 = v8;
  }
  else {
    uint64_t v18 = v5;
  }
  id v19 = v18;

  uint64_t v20 = [v19 firstObject];
  uint64_t v21 = [v20 vendorName];
  uint64_t v22 = [STStorageApp alloc];
  uint64_t v23 = [v21 length];
  id v24 = v21;
  if (!v23)
  {
    id v24 = STStorageDataLocStr(@"SHARED_DATA");
  }
  char v25 = NSString;
  uint64_t v26 = STStorageDataLocStr(@"SHARED_FMT %ld");
  id v27 = objc_msgSend(v25, "localizedStringWithFormat:", v26, objc_msgSend(v5, "count"));
  uint64_t v28 = [(STStorageApp *)v22 initWithBundleIdentifier:v30 name:v24 vendorName:v27];

  if (!v23) {
  [(STStorageApp *)v28 setAppKind:2];
  }

  return v28;
}

id STMessagesExternalDataSize()
{
  if (STMessagesExternalDataSize_onceToken != -1) {
    dispatch_once(&STMessagesExternalDataSize_onceToken, &__block_literal_global_12);
  }
  if (STMessagesExternalDataSize__messagesPlugin
    && (uint64_t v0 = [(id)STMessagesExternalDataSize__messagesPlugin externDataSizeForApp:@"com.apple.MobileSMS"], v0 >= 1))
  {
    id v1 = +[STSizeVector docsAndData:v0];
  }
  else
  {
    id v1 = +[STSizeVector zero];
  }

  return v1;
}

void __STMessagesExternalDataSize_block_invoke()
{
  uint64_t v0 = [NSURL fileURLWithPath:@"/System/Library/PreferenceBundles/StoragePlugins/CKStoragePlugin.bundle" isDirectory:1];
  id v1 = [MEMORY[0x263F086E0] bundleWithURL:v0];
  id v9 = 0;
  int v2 = [v1 loadAndReturnError:&v9];
  id v3 = v9;
  id v4 = 0;
  if (v2)
  {
    id v5 = (objc_class *)[v1 principalClass];
    if (v5)
    {
      id v6 = objc_alloc_init(v5);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = [v6 externDataSizeAppIdentifiers];
        if ([v7 containsObject:@"com.apple.MobileSMS"]) {
          id v4 = v6;
        }
        else {
          id v4 = 0;
        }
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  uint64_t v8 = (void *)STMessagesExternalDataSize__messagesPlugin;
  STMessagesExternalDataSize__messagesPlugin = (uint64_t)v4;
}

void sub_218167718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21816780C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_218167B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_218167FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSSearchQueryContextClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibrary();
  Class result = objc_getClass("CSSearchQueryContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchQueryContextClass_block_invoke_cold_1();
  }
  getCSSearchQueryContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreSpotlightLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __CoreSpotlightLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264305880;
    uint64_t v3 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CoreSpotlightLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCSSearchQueryClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibrary();
  Class result = objc_getClass("CSSearchQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchQueryClass_block_invoke_cold_1();
  }
  getCSSearchQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void GetDeviceSpace(void *a1, void *a2)
{
  memset(v12, 0, 20);
  v13[2] = 0;
  v13[0] = 5;
  v13[1] = 2147483668;
  if (getattrlist("/", v13, v12, 0x14uLL, 0))
  {
    uint64_t v4 = __error();
    id v5 = strerror(*v4);
    STLog(3, @"Error retreiving the attributes list for / : %s", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }
  else
  {
    *a1 = *(void *)((char *)v12 + 4);
    *a2 = *(void *)((char *)&v12[1] + 4);
  }
}

id STDictLookup(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      uint64_t v8 = 0;
      id v9 = v3;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        objc_msgSend(v9, "objectForKey:", v10, (void)v13);
        id v3 = (id)objc_claimAutoreleasedReturnValue();

        if (!v3)
        {
          id v9 = 0;
LABEL_12:

          uint64_t v11 = 0;
          goto LABEL_13;
        }
        ++v8;
        id v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = v3;
  uint64_t v11 = v9;
LABEL_13:

  return v11;
}

id STDictLookupFromPathString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 componentsSeparatedByString:@":"];
  uint64_t v5 = STDictLookup(v3, v4);

  return v5;
}

void STSyncATCUsage()
{
  id v0 = +[STStorageMediaMonitor sharedMonitor];
  [v0 sync];
}

id STGetCurrentMediaUsage()
{
  id v0 = +[STStorageMediaMonitor sharedMonitor];
  id v1 = [v0 atcDictionary];

  return v1;
}

STMutableSizeDict *STSelectMediaUsage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a2;
  uint64_t v6 = [v4 dictionary];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __STSelectMediaUsage_block_invoke;
  void v13[3] = &unk_264305900;
  id v7 = v6;
  id v14 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v13];

  id v8 = v3;
  id v9 = v7;
  uint64_t v10 = objc_alloc_init(STMutableSizeDict);
  uint64_t v11 = objc_opt_new();
  recursiveComputeMediaUsage(v10, v11, v8, v9, 0);

  return v10;
}

void __STSelectMediaUsage_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [a3 includeMediaUsage];
  id v7 = v6;
  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(a1 + 32) setObject:v5 forKey:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

STMutableSizeDict *STComputeUsageBundleData(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(STMutableSizeDict);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v24 = v3;
  uint64_t v6 = [v3 allAppsWithUsageBundles];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v12 = [v4 objectForKeyedSubscript:v11];
        if (([v12 excludeUsageBundle] & 1) == 0)
        {
          if (![(STMutableSizeDict *)v5 hasKey:v11]) {
            STLog(1, @"Adding %@ because of UsageBundleData", v13, v14, v15, v16, v17, v18, v11);
          }
          id v19 = [v24 usageBundleForIdentifier:v11];
          [v19 totalSize];
          uint64_t v21 = +[STSizeVector docsAndData:(uint64_t)v20];
          [(STMutableSizeDict *)v5 addSize:v21 toKey:v11];
          uint64_t v22 = [NSString stringWithFormat:@"UsageBundleData %@", v11];
          STLogSizeVector(v21, v22);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  return v5;
}

STMutableSizeDict *STComputeFSOverrides(void *a1)
{
  id v1 = a1;
  long long v2 = +[STMSizer sharedAppSizer];
  id v3 = objc_alloc_init(STMutableSizeDict);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __STComputeFSOverrides_block_invoke;
  v9[3] = &unk_264305928;
  id v10 = v2;
  id v4 = v3;
  uint64_t v11 = v4;
  id v5 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v6 = v11;
  uint64_t v7 = v4;

  return v7;
}

void __STComputeFSOverrides_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [a3 includeFsPaths];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = [*(id *)(a1 + 32) itemForPath:v10];
        if (v11)
        {
          long long v12 = (STMSizeCacheEntry *)v11;
          [*(id *)(a1 + 32) updateSizeOfItem:v11 synchronous:1];
        }
        else
        {
          uint64_t v13 = [STMSizeCacheEntry alloc];
          uint64_t v14 = [NSURL fileURLWithPath:v10];
          long long v12 = [(STMSizeCacheEntry *)v13 initWithURL:v14];

          [*(id *)(a1 + 32) addItem:v12 andComputeSizeSynchronously:1];
        }
        uint64_t v21 = [(STMSizeCacheEntry *)v12 itemSize];
        if (v21)
        {
          if (([*(id *)(a1 + 40) hasKey:v5] & 1) == 0) {
            STLog(1, @"Adding %@ because of FSOverride", v22, v23, v24, v25, v26, v27, (uint64_t)v5);
          }
          long long v28 = *(void **)(a1 + 40);
          uint64_t v29 = +[STSizeVector docsAndData:](STSizeVector, "docsAndData:", [v21 longLongValue]);
          [v28 addSize:v29 toKey:v5];

          uint64_t v30 = [v21 longLongValue];
          long long v31 = [NSString stringWithFormat:@"FSOverride: %@ in %@", v5, v10];
          STLogSize(v30, v31);
        }
        else
        {
          STLog(2, @"No size for app %@ in %@", v15, v16, v17, v18, v19, v20, (uint64_t)v5);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }
}

STMutableSizeDict *STComputeCacheDeleteOverrides(void *a1)
{
  id v1 = a1;
  long long v2 = objc_alloc_init(STMutableSizeDict);
  id v3 = +[STStorageCacheDelete sharedMonitor];
  id v4 = [v3 cacheDeleteDict];

  id v5 = [v4 objectForKey:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __STComputeCacheDeleteOverrides_block_invoke;
  void v12[3] = &unk_264305950;
  id v13 = v5;
  id v14 = v4;
  uint64_t v6 = v2;
  uint64_t v15 = v6;
  id v7 = v4;
  id v8 = v5;
  [v1 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v9 = v15;
  uint64_t v10 = v6;

  return v10;
}

void __STComputeCacheDeleteOverrides_block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [a3 includeCacheDeleteKeys];
  if ([v6 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v24 = v5;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v15 = [a1[4] objectForKey:v14];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v9 += [v15 longLongValue];
          }
          uint64_t v11 = [a1[5] objectForKey:v14];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v10 += [v11 longLongValue];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);

      id v5 = v24;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }

    if (v9 | v10)
    {
      if (([a1[6] hasKey:v5] & 1) == 0) {
        STLog(1, @"Adding %@ because of CacheDeleteOverride", v16, v17, v18, v19, v20, v21, (uint64_t)v5);
      }
      uint64_t v22 = +[STSizeVector docsAndData:v9 purgeable:v10];
      [a1[6] addSize:v22 toKey:v5];
      uint64_t v23 = [NSString stringWithFormat:@"CacheDeleteOverride %@", v5];
      STLogSizeVector(v22, v23);
    }
  }
}

STMutableSizeDict *STFileProviderExternalDataSize(void *a1)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v2 = objc_alloc_init(STMutableSizeDict);
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  int v68 = [v3 isiCloudDriveAllowed];

  id v4 = +[STStorageCacheDelete sharedMonitor];
  id v5 = [v4 cacheDeleteDict];

  uint64_t v70 = v5;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"com.apple.FileProvider.cache-delete"];
  uint64_t v69 = v7;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    STLog(3, @"'com.apple.FileProvider.cache-delete' value must be an NSDictionary.\nCACHE_DELETE_ITEMIZED_NONPURGEABLE value: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v63 = objc_alloc_init(STMutableSizeDict);
  }
  else
  {
    uint64_t v66 = v6;
    id v67 = v1;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v1;
    uint64_t v14 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
    int v15 = v68;
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v81;
      uint64_t v71 = *(void *)v81;
      while (2)
      {
        uint64_t v18 = 0;
        uint64_t v72 = v16;
        do
        {
          if (*(void *)v81 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v80 + 1) + 8 * v18);
          if (([v19 isiCloudDriveProvider] ^ 1 | v15) == 1)
          {
            uint64_t v74 = v18;
            uint64_t v20 = [v19 providerID];
            uint64_t v21 = [v19 topLevelBundleIdentifier];
            uint64_t v22 = (void *)v21;
            if (v21) {
              uint64_t v23 = (void *)v21;
            }
            else {
              uint64_t v23 = v20;
            }
            id v24 = v23;

            unsigned int v75 = v20;
            if ([v20 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
            {
              uint64_t v25 = [v19 storageURLs];
              long long v76 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              uint64_t v26 = [(id)v25 countByEnumeratingWithState:&v76 objects:v84 count:16];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = *(void *)v77;
                do
                {
                  for (uint64_t i = 0; i != v27; ++i)
                  {
                    if (*(void *)v77 != v28) {
                      objc_enumerationMutation((id)v25);
                    }
                    uint64_t v30 = [*(id *)(*((void *)&v76 + 1) + 8 * i) path];
                    uint64_t v31 = STSizeOfPathWithOptions(v30, 1);

                    uint64_t v32 = [v31 longLongValue];
                    if (v32)
                    {
                      uint64_t v33 = v32;
                      if (![(STMutableSizeDict *)v2 hasKey:v24]) {
                        STLog(1, @"Adding %@ because of FPOverride", v34, v35, v36, v37, v38, v39, (uint64_t)v24);
                      }
                      int v40 = +[STSizeVector docsAndData:v33 purgeable:0];
                      [(STMutableSizeDict *)v2 addSize:v40 toKey:v24];
                      uint64_t v41 = [NSString stringWithFormat:@"FPExternalData %@", v24];
                      STLogSizeVector(v40, v41);
                    }
                  }
                  uint64_t v27 = [(id)v25 countByEnumeratingWithState:&v76 objects:v84 count:16];
                }
                while (v27);
                uint64_t v7 = v69;
                int v15 = v68;
                uint64_t v17 = v71;
              }
            }
            else
            {
              uint64_t v25 = [v70 objectForKey:v20];
              uint64_t v42 = [v7 objectForKey:v20];
              if (v25 | v42)
              {
                if (![(STMutableSizeDict *)v2 hasKey:v24]) {
                  STLog(1, @"Adding %@ because of FPOverride", v43, v44, v45, v46, v47, v48, (uint64_t)v24);
                }
                if (v25)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    int v64 = v75;
                    STLog(3, @"'%@' value must be an NSNumber.\ncacheDeleteDict value: %@", v49, v50, v51, v52, v53, v54, (uint64_t)v75);
                    uint64_t v6 = v66;
LABEL_41:
                    v63 = objc_alloc_init(STMutableSizeDict);

                    id v1 = v67;
                    goto LABEL_42;
                  }
                }
                if (v42)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    uint64_t v6 = v66;
                    int v64 = v75;
                    STLog(3, @"'%@' value must be an NSNumber.\nCACHE_DELETE_ITEMIZED_NONPURGEABLE value: %@", v55, v56, v57, v58, v59, v60, (uint64_t)v75);
                    goto LABEL_41;
                  }
                }
                int v61 = +[STSizeVector docsAndData:purgeable:](STSizeVector, "docsAndData:purgeable:", [(id)v42 longLongValue], objc_msgSend((id)v25, "longLongValue"));
                [(STMutableSizeDict *)v2 addSize:v61 toKey:v24];
                uint64_t v62 = [NSString stringWithFormat:@"FPExternalData %@", v24];
                STLogSizeVector(v61, v62);

                uint64_t v17 = v71;
              }
            }
            uint64_t v16 = v72;
            uint64_t v18 = v74;
          }
          ++v18;
        }
        while (v18 != v16);
        uint64_t v16 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    v63 = v2;
    uint64_t v6 = v66;
    id v1 = v67;
  }
LABEL_42:

  return v63;
}

void recursiveComputeMediaUsage(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __recursiveComputeMediaUsage_block_invoke;
  v17[3] = &unk_264305978;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v21 = v9;
  id v13 = v9;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [a3 enumerateKeysAndObjectsUsingBlock:v17];
}

void __recursiveComputeMediaUsage_block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v22 = a3;
  [a1[4] addObject:a2];
  id v5 = [a1[4] componentsJoinedByString:@":"];
  id v6 = [a1[5] objectForKeyedSubscript:v5];
  if (!v6) {
    id v6 = a1[6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v22;
    uint64_t v8 = v7;
    if (v6)
    {
      id v9 = [v7 objectForKeyedSubscript:@"_PhysicalSize"];
      id v10 = [v8 objectForKeyedSubscript:@"_PurgeableSize"];
      if (v9)
      {
        uint64_t v11 = [v9 longLongValue];
        uint64_t v12 = v10 ? [v10 longLongValue] : 0;
        uint64_t v13 = v11 - v12;
        if (v13 >= 1)
        {
          if (([a1[7] hasKey:v6] & 1) == 0) {
            STLog(1, @"Adding %@ because of MediaUsage", v14, v15, v16, v17, v18, v19, (uint64_t)v6);
          }
          id v20 = +[STSizeVector docsAndData:v13 purgeable:v12];
          [a1[7] addSize:v20 toKey:v6];
          id v21 = [NSString stringWithFormat:@"MediaUsage %@", v6];
          STLogSizeVector(v20, v21);
        }
      }
    }
    recursiveComputeMediaUsage(a1[7], a1[4], v8, a1[5], v6);
  }
  [a1[4] removeLastObject];
}

void STLog_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218150000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void STLog_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_218150000, a2, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void STVolumeSize_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  __error();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_218150000, a2, OS_LOG_TYPE_ERROR, "Error retrieving the total and available attributes list for %{public}s : %{errno}d", v3, 0x12u);
}

void STVolumeSize_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  __error();
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_218150000, a2, OS_LOG_TYPE_FAULT, "Error retrieving the total attributes list for %{public}s : %{errno}d", v3, 0x12u);
}

void __getCSSearchQueryContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getCSSearchQueryClass_block_invoke_cold_1(v0);
}

void __getCSSearchQueryClass_block_invoke_cold_1()
{
}

uint64_t ALRegisterForPhotosAndVideosCount()
{
  return MEMORY[0x270F537A8]();
}

uint64_t ALUnregisterForPhotosAndVideosCount()
{
  return MEMORY[0x270F537B0]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x270EE5108](alloc, buffer);
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)MEMORY[0x270EE84F0](allocator, callback, context, pathsToWatch, sinceWhen, *(void *)&flags, latency);
}

FSEventStreamEventId FSEventStreamFlushAsync(FSEventStreamRef streamRef)
{
  return MEMORY[0x270EE84F8](streamRef);
}

FSEventStreamEventId FSEventStreamGetLatestEventId(ConstFSEventStreamRef streamRef)
{
  return MEMORY[0x270EE8508](streamRef);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return MEMORY[0x270EE8528](streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
}

FSEventStreamEventId FSEventsGetCurrentEventId(void)
{
  return MEMORY[0x270EE8540]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x270EF2B10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t container_copy_object()
{
  return MEMORY[0x270ED8F78]();
}

uint64_t container_disk_usage()
{
  return MEMORY[0x270ED8FC0]();
}

uint64_t container_free_object()
{
  return MEMORY[0x270ED8FE8]();
}

uint64_t container_get_class()
{
  return MEMORY[0x270ED8FF8]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x270ED9000]();
}

uint64_t container_get_path()
{
  return MEMORY[0x270ED9008]();
}

uint64_t container_query_create()
{
  return MEMORY[0x270ED9060]();
}

uint64_t container_query_free()
{
  return MEMORY[0x270ED9068]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x270ED9078]();
}

uint64_t container_query_iterate_results_sync()
{
  return MEMORY[0x270ED9080]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x270ED9090]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x270ED90A0]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x270ED90B0]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x270ED90B8]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x270ED90C0]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x270ED9B48](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x270ED9B50](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x270ED9B60](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x270ED9BB0](*(void *)&a1, a2, a3, a4, a5);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_resume(int token)
{
  return MEMORY[0x270EDA788](*(void *)&token);
}

uint32_t notify_suspend(int token)
{
  return MEMORY[0x270EDA7A0](*(void *)&token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}