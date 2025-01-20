id UARPStringDynamicAssetsFilepath()
{
  void *v0;
  uint64_t vars8;

  if (qword_100041DD8 != -1) {
    dispatch_once(&qword_100041DD8, &stru_100030EF0);
  }
  v0 = (void *)qword_100041DD0;
  return v0;
}

void sub_100004124(id a1)
{
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"dynamicassets"];
  v2 = (void *)qword_100041DD0;
  qword_100041DD0 = v1;
}

id UARPStringSupplementalAssetsFilepath()
{
  if (qword_100041DE8 != -1) {
    dispatch_once(&qword_100041DE8, &stru_100030F10);
  }
  v0 = (void *)qword_100041DE0;
  return v0;
}

void sub_1000041F4(id a1)
{
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"supplementalassets"];
  v2 = (void *)qword_100041DE0;
  qword_100041DE0 = v1;
}

id UARPStringTempFilesFilepath()
{
  if (qword_100041DF8 != -1) {
    dispatch_once(&qword_100041DF8, &stru_100030F30);
  }
  v0 = (void *)qword_100041DF0;
  return v0;
}

void sub_1000042C4(id a1)
{
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"tmpfiles"];
  v2 = (void *)qword_100041DF0;
  qword_100041DF0 = v1;
}

id UARPStringPcapFilesFilepath()
{
  if (qword_100041E08 != -1) {
    dispatch_once(&qword_100041E08, &stru_100030F50);
  }
  v0 = (void *)qword_100041E00;
  return v0;
}

void sub_100004394(id a1)
{
  uint64_t v1 = InternalStorageDirectoryPath();
  id v4 = +[NSArray arrayWithObjects:v1, @"pcapfiles", 0];

  uint64_t v2 = +[NSString pathWithComponents:v4];
  id v3 = (void *)qword_100041E00;
  qword_100041E00 = v2;
}

id UARPPayloadHashAlgorithmStringToValue(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"SHA-256"])
  {
    if ([v1 caseInsensitiveCompare:@"SHA-384"])
    {
      if ([v1 caseInsensitiveCompare:@"SHA-512"]) {
        uint64_t v2 = 0;
      }
      else {
        uint64_t v2 = 3;
      }
    }
    else
    {
      uint64_t v2 = 2;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }
  id v3 = +[NSNumber numberWithUnsignedShort:v2];

  return v3;
}

id UARPStringTmapDirectoryPath()
{
  if (qword_100041E18 != -1) {
    dispatch_once(&qword_100041E18, &stru_1000310D0);
  }
  v0 = (void *)qword_100041E10;
  return v0;
}

void sub_100004534(id a1)
{
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"tmap"];
  uint64_t v2 = (void *)qword_100041E10;
  qword_100041E10 = v1;
}

id UARPStringTmapDatabaseFilePath()
{
  if (qword_100041E28 != -1) {
    dispatch_once(&qword_100041E28, &stru_1000310F0);
  }
  v0 = (void *)qword_100041E20;
  return v0;
}

void sub_100004604(id a1)
{
  UARPStringTmapDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"tmapdatabase"];
  uint64_t v2 = (void *)qword_100041E20;
  qword_100041E20 = v1;
}

id UARPStringTapToRadarFilePath()
{
  if (qword_100041E38 != -1) {
    dispatch_once(&qword_100041E38, &stru_100031118);
  }
  v0 = (void *)qword_100041E30;
  return v0;
}

void sub_1000046D4(id a1)
{
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"taptoradar"];
  uint64_t v2 = (void *)qword_100041E30;
  qword_100041E30 = v1;
}

id UARPStringLogsDirectoryFilePath()
{
  if (qword_100041E48 != -1) {
    dispatch_once(&qword_100041E48, &stru_100031140);
  }
  v0 = (void *)qword_100041E40;
  return v0;
}

void sub_1000047A4(id a1)
{
  UARPStringTapToRadarFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"logs"];
  uint64_t v2 = (void *)qword_100041E40;
  qword_100041E40 = v1;
}

id UARPStringCrashAnalyticsDirectoryFilePath()
{
  if (qword_100041E58 != -1) {
    dispatch_once(&qword_100041E58, &stru_100031168);
  }
  v0 = (void *)qword_100041E50;
  return v0;
}

void sub_100004874(id a1)
{
  UARPStringTapToRadarFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"crsh"];
  uint64_t v2 = (void *)qword_100041E50;
  qword_100041E50 = v1;
}

id UARPStringCmapDirectoryPath()
{
  if (qword_100041E68 != -1) {
    dispatch_once(&qword_100041E68, &stru_100031248);
  }
  v0 = (void *)qword_100041E60;
  return v0;
}

void sub_100004944(id a1)
{
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"cmap"];
  uint64_t v2 = (void *)qword_100041E60;
  qword_100041E60 = v1;
}

id UARPStringCmapDatabaseFilePath()
{
  if (qword_100041E78 != -1) {
    dispatch_once(&qword_100041E78, &stru_100031268);
  }
  v0 = (void *)qword_100041E70;
  return v0;
}

void sub_100004A14(id a1)
{
  UARPStringCmapDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"cmapdatabase"];
  uint64_t v2 = (void *)qword_100041E70;
  qword_100041E70 = v1;
}

id UARPStringSysdiagnoseDirectoryFilePath()
{
  if (qword_100041E88 != -1) {
    dispatch_once(&qword_100041E88, &stru_100031298);
  }
  v0 = (void *)qword_100041E80;
  return v0;
}

void sub_100004AE4(id a1)
{
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"sysdiagnose"];
  uint64_t v2 = (void *)qword_100041E80;
  qword_100041E80 = v1;
}

id UARPStringPifMetricsFilePath()
{
  if (qword_100041E98 != -1) {
    dispatch_once(&qword_100041E98, &stru_1000312C0);
  }
  v0 = (void *)qword_100041E90;
  return v0;
}

void sub_100004BB4(id a1)
{
  UARPStringSysdiagnoseDirectoryFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSString stringWithFormat:@"%@/%@", v3, @"com.apple.Bluetooth.AccessoryCase.pif_daily"];
  uint64_t v2 = (void *)qword_100041E90;
  qword_100041E90 = v1;
}

id generateSHA256HashForDataAtLocationAsData(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocationAsData(a1, 10, a2);
}

id generateHashForDataAtLocationAsData(void *a1, int a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = +[NSFileHandle fileHandleForReadingFromURL:v5 error:a3];
  v7 = (void *)v6;
  id v8 = 0;
  if (a2 && v6)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    CCDigestInit();
    do
    {
      objc_msgSend(v7, "uarpReadDataUpToLength:error:", 0x4000, a3, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29,
        v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42,
        v43,
        (void)v44);
      id v10 = objc_claimAutoreleasedReturnValue();
      [v10 bytes];
      [v10 length];
      CCDigestUpdate();
      unint64_t v11 = (unint64_t)[v10 length];
    }
    while (v11 >> 14);
    uint64_t OutputSize = CCDigestGetOutputSize();
    v13 = (char *)&v15 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    CCDigestFinal();
    if ([v7 uarpCloseAndReturnError:a3]) {
      id v8 = [objc_alloc((Class)NSData) initWithBytes:v13 length:OutputSize];
    }
    else {
      id v8 = 0;
    }
  }

  return v8;
}

id generateSHA256HashForDataAtLocation(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocation(a1, 10, a2);
}

id generateHashForDataAtLocation(void *a1, int a2, uint64_t a3)
{
  id v3 = generateHashForDataAtLocationAsData(a1, a2, a3);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = (unsigned __int8 *)[v5 bytes];
    id v7 = objc_alloc_init((Class)NSMutableString);
    if ([v5 length])
    {
      unint64_t v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", @"%02x", v6[v8++]);
      while (v8 < (unint64_t)[v5 length]);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id generateBase64HashForDataAtLocation(void *a1, int a2, uint64_t a3)
{
  id v3 = generateHashForDataAtLocationAsData(a1, a2, a3);
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void CFDictionaryBuildKeySetInt64(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void CFDictionaryBuildKeySetInt32(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void CFDictionaryBuildKeySetTag(__CFDictionary *a1, const void *a2, const __CFString *a3, const __CFString *a4)
{
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppend(Mutable, a3);
  CFStringAppend(Mutable, @",");
  CFStringAppend(Mutable, a4);
  CFDictionarySetValue(a1, a2, Mutable);
  CFRelease(Mutable);
}

void CFDictionaryBuildKeySetTicket(__CFDictionary *a1, const void *a2, const __CFString *a3, const __CFString *a4)
{
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppend(Mutable, @"@");
  CFStringAppend(Mutable, a3);
  CFStringAppend(Mutable, @",");
  CFStringAppend(Mutable, a4);
  CFDictionarySetValue(a1, a2, Mutable);
  CFRelease(Mutable);
}

void sub_10000559C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000055B8(uint64_t a1, uint64_t a2)
{
}

void sub_1000055C8(uint64_t a1)
{
}

void sub_1000055D4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) personalizeWithServer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)] & 1) == 0&& objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "useSSOCredentials"))
  {
    unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 88) showPersonalizationRequiredDialogAndGetResponse];
    FudLog();
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "freePersonalizationData", "-[FudPersonalizer doPersonalization:]_block_invoke", v2);
      [*(id *)(a1 + 32) personalizeWithServer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
    else
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "personalizationDone:response:error:", *(void *)(a1 + 40), 0, FUDError(), "-[FudPersonalizer doPersonalization:]_block_invoke", 0);
    }
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
}

void sub_100006374(uint64_t a1, uint64_t a2)
{
  id v3 = FudLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100006474(id a1)
{
  qword_100041EA0 = objc_alloc_init(AUDeveloperSettingsDatabase);
  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = os_log_create("com.apple.accessoryupdater.uarp", "legacyAudioUpdater");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Legacy Audio updater started", v8, 2u);
  }
  int v4 = AUSandboxPlatformInit(v3, 0);
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = +[NSXPCListener serviceListener];
    [v6 setDelegate:v5];
    [v6 resume];
  }
  return v4;
}

id sub_100007460(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) deviceClassesForEAIdentifier:*(void *)(a1 + 40)];
  id v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) firstObject];
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;

  id v9 = [*(id *)(a1 + 48) copy];
  uint64_t v10 = *(void *)(a1 + 32);
  unint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  id result = [*(id *)(a1 + 32) startFirmwareUpdateStates];
  if ((result & 1) == 0)
  {
    v13 = *(void **)(a1 + 32);
    return [v13 updateCompleteForActiveDeviceClass];
  }
  return result;
}

id sub_100007CC0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "updateCompleteForAccessory:");
  }
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 findFirmwareWithOptions:0 remote:1];
}

void sub_100007EA8(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 32) containsString:@"multiasset"] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 32) containsString:@"ANC"] & 1) != 0)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 32) containsString:@"ANC"]) {
      goto LABEL_7;
    }
    uint64_t v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"existingFWVersionOnAccessory"];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v2;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"existingFWVersionOnAccessory"];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v6 + 88);
    *(void *)(v6 + 88) = v5;
  }

LABEL_7:
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 49))
    {
      id v13 = [*(id *)(v7 + 72) objectForKeyedSubscript:*(void *)(v7 + 32)];
      if (v13)
      {
        unint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"newFWVersion"];
        [v13 setPostedFirmwareVersion:v8];

        [*(id *)(*(void *)(a1 + 32) + 72) setObject:v13 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
      }
      id v9 = *(void **)(*(void *)(a1 + 32) + 16);
      if (*(unsigned char *)(a1 + 50)) {
        [v9 downloadFirmwareWithOptions:0];
      }
      else {
        [v9 prepareFirmwareWithOptions:0];
      }
    }
    else
    {
      unint64_t v11 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 32);
        *(_DWORD *)buf = 136315394;
        long long v15 = "-[LegacyAudioAccessory didFind:info:updateAvailable:needsDownload:error:]_block_invoke";
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: No new firmware updates available for %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) updateCompleteForActiveDeviceClass];
    }
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 32);
    [v10 updateCompleteForActiveDeviceClass];
  }
}

void sub_100008250(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
  id v3 = v2;
  if (*(unsigned char *)(a1 + 40))
  {
    if (v2)
    {
      [v2 setDownloadStatus:1];
      [*(id *)(*(void *)(a1 + 32) + 72) setObject:v3 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
    }
    [*(id *)(*(void *)(a1 + 32) + 16) prepareFirmwareWithOptions:0];
  }
  else
  {
    if (v2)
    {
      [v2 setDownloadStatus:2];
      [*(id *)(*(void *)(a1 + 32) + 72) setObject:v3 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
    }
    [*(id *)(a1 + 32) updateCompleteForActiveDeviceClass];
  }
}

id sub_100008468(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(id **)(a1 + 32);
  if (v1) {
    return [v2[2] applyFirmwareWithOptions:0];
  }
  else {
    return [v2 updateCompleteForActiveDeviceClass];
  }
}

void sub_1000085F0(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
  if (v4)
  {
    [v4 setActiveFirmwareVersion:*(void *)(*(void *)(a1 + 32) + 88)];
    [v4 setStagingIterations:&off_100038C98];
    uint64_t v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"currentSessionTimeTaken"];
    [v4 setStagingDuration:v2];

    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v3 = 6;
    }
    else {
      uint64_t v3 = 8;
    }
    [v4 setStagingStatus:v3];
    [*(id *)(*(void *)(a1 + 32) + 72) setObject:v4 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) finishWithOptions:0];
}

id sub_1000088F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCompleteForActiveDeviceClass];
}

id sub_100008990(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    uint64_t v3 = [[FudPersonalizer alloc] initWithDelegate:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 doPersonalization:v6];
}

void sub_100009A40(id a1)
{
}

void sub_100009E5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009F74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A104(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000AA18(uint64_t a1, void *a2)
{
  id result = [a2 attributes];
  if (result)
  {
    uint64_t v4 = result;
    id result = [result objectForKey:@"FirmwareVersionMajor"];
    if (result)
    {
      id v5 = [result unsignedLongLongValue];
      id result = [v4 objectForKey:@"FirmwareVersionMinor"];
      if (result)
      {
        id v6 = [result unsignedLongLongValue];
        id result = [v4 objectForKey:@"FirmwareVersionRelease"];
        if (result)
        {
          id v7 = [result unsignedLongLongValue];
          id result = [v4 objectForKey:@"FormatVersion"];
          if (result)
          {
            id v8 = [result unsignedLongLongValue];
            [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater queryPredicate]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Applying predicate: ((majorVersion > %llu) ||                                ((majorVersion == %llu) && ((minorVersion > %llu) || ((minorVersion == %llu) && (releaseVersion > %llu))))) &&                                (formatVersion == %d))", *(void *)(*(void *)(a1 + 32) + 152), *(void *)(*(void *)(a1 + 32) + 152), *(void *)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 168), 1 format]);
            id result = 0;
            if ((unint64_t)v8 <= *(void *)(a1 + 40))
            {
              id v9 = *(void **)(a1 + 32);
              id v10 = (id)v9[19];
              if (v5 > v10) {
                return (id)1;
              }
              if (v5 == v10)
              {
                id v11 = (id)v9[20];
                if (v6 > v11 || v6 == v11 && (unint64_t)v7 > v9[21]) {
                  return (id)1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

NSError *sub_10000AF34(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = [objc_alloc((Class)NSString) initWithFormat:a3 arguments:&a9];
  id v11 = +[NSMutableDictionary dictionaryWithCapacity:1];
  if (v10)
  {
    NSLog(@"%@", v10);
    [(NSMutableDictionary *)v11 setObject:v10 forKey:NSLocalizedDescriptionKey];
  }
  return +[NSError errorWithDomain:@"com.apple.MobileAccessoryUpdater.EAFirmwareUpdater" code:a2 userInfo:v11];
}

id sub_10000C15C(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

id sub_10000C594(uint64_t a1)
{
  [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater personalizationResponse:error:]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"(%@): personalizationResponse Error from FUD = %@, responseData = %@", objc_msgSend(*(id *)(a1 + 32), "protocolString"), *(void *)(a1 + 40), *(void *)(a1 + 48)) format];
  [*(id *)(a1 + 32) closeSession];
  CFStringRef v3 = @"Event";
  CFStringRef v4 = @"com.apple.fud.updateFailed";
  return objc_msgSend(*(id *)(a1 + 32), "updateComplete:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1), *(void *)(a1 + 40));
}

id sub_10000C790(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

unsigned char *sub_10000CBBC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) openSession];
  if (v2)
  {
    CFStringRef v4 = v2;
    goto LABEL_8;
  }
  id result = *(unsigned char **)(a1 + 32);
  if (!result[466])
  {
    id result = objc_msgSend(objc_msgSend(result, "protocolString"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "appProtocol"));
    if (result)
    {
      if ([*(id *)(a1 + 32) skipDFUMode]) {
        return [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Skipping DFU mode as requested for %@", objc_msgSend(*(id *)(a1 + 32), "protocolString")) format];
      }
      [*(id *)(a1 + 32) startReconnectTimer:1];
      BYTE4(v5) = -65;
      LODWORD(v5) = 1073807486;
      [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Sending COMMAND_SetBootloaderEntry to %@", objc_msgSend(*(id *)(a1 + 32), "protocolString")), v5 format];
      id result = objc_msgSend(*(id *)(a1 + 32), "writeData:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v5, 5));
      if (result)
      {
        CFStringRef v4 = result;
        [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Error writing data to %@ NSError=%@", objc_msgSend(*(id *)(a1 + 32), "protocolString"), result) format];
        [*(id *)(a1 + 32) stopReconnectTimer];
LABEL_8:
        CFStringRef v6 = @"Event";
        CFStringRef v7 = @"com.apple.fud.updateFailed";
        return objc_msgSend(*(id *)(a1 + 32), "updateComplete:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1), v4);
      }
    }
  }
  return result;
}

id sub_10000DA48(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

void sub_10000DD14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000DD2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

id sub_10000DEF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInputData];
}

id sub_10000DEF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushOutput];
}

void sub_10000E570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10000E58C(uint64_t a1, uint64_t a2)
{
}

void sub_10000E59C(uint64_t a1)
{
}

id sub_10000E5A8(uint64_t a1)
{
  [*(id *)(a1 + 32) setAccessory:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 openSession];
}

void *sub_10000E5E4(void *result)
{
  if (*(unsigned char *)(result[4] + 448))
  {
    int v1 = result;
    CFStringRef v2 = @"Event";
    CFStringRef v3 = @"com.apple.fud.updateCompleted";
    *(void *)(*(void *)(result[5] + 8) + 40) = +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
    return [(id)v1[4] updateComplete:*(void *)(*(void *)(v1[5] + 8) + 40) error:0];
  }
  return result;
}

void sub_10000E898(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000E8AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectionID];
  id v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "accessory"), "connectionID");
  CFStringRef v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) connectionID];
  id v6 = [*(id *)(a1 + 40) accessory];
  if (v2 == v3)
  {
    uint64_t v20 = (uint64_t)v5;
    [v4 log:5 format:@"disconnection for acc connectionID %u matches current accessory %@"];
    [*(id *)(a1 + 40) setAccessory:0];
    CFStringRef v7 = *(unsigned int **)(a1 + 40);
    uint64_t v8 = v7[113];
    if (v8 == 3)
    {
      v7[113] = 0;
      [*(id *)(a1 + 40) log:5, @"Accessory did not reconnect after staging complete %@", objc_msgSend(*(id *)(a1 + 32), "protocolStrings") format];
      CFStringRef v21 = @"Event";
      CFStringRef v22 = @"com.apple.fud.updateCompleted";
      long long v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v17 = *(void **)(a1 + 40);
      __int16 v16 = 0;
    }
    else
    {
      if (v8)
      {
        [v7 log:5, @"Waiting for acc to reconnect in mode %d - %@", v8, objc_msgSend(*(id *)(a1 + 32), "protocolStrings") format];
        return [*(id *)(*(void *)(a1 + 40) + 432) accessoryDisconnected];
      }
      CFStringRef v23 = @"Event";
      CFStringRef v24 = @"com.apple.fud.updateInterrupted";
      id v9 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v10 = *(void **)(a1 + 40);
      __int16 v16 = sub_10000AF34(0, 20, @"Device unexpectedly disconnected", v11, v12, v13, v14, v15, v20);
      uint64_t v17 = v10;
      long long v18 = v9;
    }
    [v17 updateComplete:v18 error:v16];
  }
  else
  {
    [v4 log:5, @"disconnection for acc connectionID %u does not apply, currently updating %@", v5, v6 format];
  }
  return [*(id *)(*(void *)(a1 + 40) + 432) accessoryDisconnected];
}

uint64_t sub_10000F85C(uint64_t a1)
{
  qword_100041EB0 = (uint64_t)[objc_allocWithZone(*(Class *)(a1 + 32)) init];
  return _objc_release_x1();
}

void sub_10000F8D4(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001B784((uint64_t)a2);
  }
}

uint64_t sub_10000FB8C(uint64_t a1)
{
  qword_100041EC0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

uint64_t sub_10000FDD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000FDE8(uint64_t a1)
{
}

void sub_10000FDF0(void *a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1[4] + 16);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        CFStringRef v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "serialNumber", (void)v10);
        unsigned int v9 = [v8 isEqualToString:a1[5]];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

id sub_10000FFC4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

id sub_100010068(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v3 addObject:v2];
}

id sub_100010144(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

uint64_t sub_100010240(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSArray arrayWithArray:*(void *)(*(void *)(a1 + 32) + 8)];
  return _objc_release_x1();
}

void sub_100010330(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  unsigned int v3 = [v2 isEqualToString:@"PeriodicLaunchActivity"];

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 sendActiveFirmwareAnalyticsEvent];
  }
}

void sub_10001043C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serialNumber];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v9 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
    id v5 = v9;
    id v6 = [*(id *)(a1 + 40) cachedActiveFirmwareAccessories];
    id v7 = [v6 mutableCopy];

    uint64_t v8 = [*(id *)(a1 + 32) serialNumber];
    [v7 setObject:v4 forKeyedSubscript:v8];

    [*(id *)(a1 + 40) setCachedActiveFirmwareAccessories:v7];
  }
}

const char *AUDeveloperSettingsAccessoryFusingTypeToString(unint64_t a1)
{
  if (a1 > 3) {
    return "unrecognized";
  }
  else {
    return off_100031820[a1];
  }
}

uint64_t AUDeveloperSettingsAccessoryFusingStringToType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSString stringWithUTF8String:"Dev"];
  unsigned __int8 v3 = [v1 isEqualToString:v2];

  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = +[NSString stringWithUTF8String:"Prod"];
    unsigned __int8 v6 = [v1 isEqualToString:v5];

    if (v6)
    {
      uint64_t v4 = 1;
    }
    else
    {
      id v7 = +[NSString stringWithUTF8String:"Unfused"];
      unsigned __int8 v8 = [v1 isEqualToString:v7];

      if (v8)
      {
        uint64_t v4 = 2;
      }
      else
      {
        id v9 = +[NSString stringWithUTF8String:"Pending"];
        unsigned int v10 = [v1 isEqualToString:v9];

        if (v10) {
          uint64_t v4 = 3;
        }
        else {
          uint64_t v4 = 4;
        }
      }
    }
  }

  return v4;
}

const char *AUDeveloperSettingsURLTypeToString(unint64_t a1)
{
  if (a1 > 6) {
    return "unrecognized";
  }
  else {
    return off_100031840[a1];
  }
}

uint64_t AUDeveloperSettingsURLStringToType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSString stringWithUTF8String:"Livability"];
  unsigned __int8 v3 = [v1 isEqualToString:v2];

  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = +[NSString stringWithUTF8String:"Internal Seed"];
    unsigned __int8 v6 = [v1 isEqualToString:v5];

    if (v6)
    {
      uint64_t v4 = 1;
    }
    else
    {
      id v7 = +[NSString stringWithUTF8String:"Customer"];
      unsigned __int8 v8 = [v1 isEqualToString:v7];

      if (v8)
      {
        uint64_t v4 = 2;
      }
      else
      {
        id v9 = +[NSString stringWithUTF8String:"Public Seed"];
        unsigned __int8 v10 = [v1 isEqualToString:v9];

        if (v10)
        {
          uint64_t v4 = 3;
        }
        else
        {
          long long v11 = +[NSString stringWithUTF8String:"Basejumper"];
          unsigned __int8 v12 = [v1 isEqualToString:v11];

          if (v12)
          {
            uint64_t v4 = 4;
          }
          else
          {
            long long v13 = +[NSString stringWithUTF8String:"Custom Basejumper"];
            unsigned __int8 v14 = [v1 isEqualToString:v13];

            if (v14)
            {
              uint64_t v4 = 5;
            }
            else
            {
              uint64_t v15 = +[NSString stringWithUTF8String:"Mesu Staging"];
              unsigned int v16 = [v1 isEqualToString:v15];

              if (v16) {
                uint64_t v4 = 6;
              }
              else {
                uint64_t v4 = 7;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

id getInfoForAccessory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[AUDeveloperSettingsDatabase sharedDatabase];
  unsigned __int8 v3 = [v2 accessoriesDictionary];
  uint64_t v4 = [v3 objectForKeyedSubscript:v1];

  return v4;
}

BOOL configuredToDefaultAssetLocationForAccessory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"fusing"];
  BOOL v3 = (AUDeveloperSettingsAccessoryFusingStringToType(v2) & 5) != 0;
  uint64_t v4 = [v1 objectForKeyedSubscript:@"assetLocation"];

  uint64_t v5 = AUDeveloperSettingsURLStringToType(v4);
  return v5 == 2 * v3;
}

__CFString *getURLForAssetURLType(unint64_t a1)
{
  if (a1 <= 6 && ((0x75u >> a1) & 1) != 0)
  {
    uint64_t v2 = *off_100031878[a1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

void cleanupPersonalizedUpdateAvailable(void *a1)
{
  id v1 = a1;
  id v7 = +[AUDeveloperSettingsDatabase sharedDatabase];
  uint64_t v2 = [v7 accessoriesDictionary];
  BOOL v3 = [v2 objectForKey:v1];
  id v4 = [v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:@"downloadedVersion"];
  [v4 setObject:0 forKeyedSubscript:@"personalizationRequired"];
  uint64_t v5 = +[AUDeveloperSettingsDatabase sharedDatabase];
  unsigned __int8 v6 = +[NSDictionary dictionaryWithDictionary:v4];
  [v5 addAccessoryWithSerialNumber:v1 info:v6];
}

id findPartnerSerialNumbersInDatabase(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSMutableArray array];
  BOOL v3 = +[AUDeveloperSettingsDatabase sharedDatabase];
  id v4 = [v3 accessoriesDictionary];

  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  long long v11 = sub_100011448;
  unsigned __int8 v12 = &unk_100031800;
  id v13 = v1;
  id v14 = v2;
  id v5 = v2;
  id v6 = v1;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];
  id v7 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5, v9, v10, v11, v12);

  return v7;
}

void sub_100011448(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 objectForKeyedSubscript:@"partnerSerialNumbers"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isEqualToString:", *(void *)(a1 + 32), (void)v11)&& (objc_msgSend(v5, "isEqualToString:", *(void *)(a1 + 32)) & 1) == 0)
        {
          [*(id *)(a1 + 40) addObject:v5];
          goto LABEL_12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

id findPartnerSerialNumberForAccessory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 partnerSerialNumbers];
  if (![v2 count])
  {
    BOOL v3 = [v1 serialNumber];
    uint64_t v4 = findPartnerSerialNumbersInDatabase(v3);

    uint64_t v2 = (void *)v4;
  }
  long long v19 = [v1 hwFusingType];
  uint64_t v20 = +[AUDeveloperSettingsDatabase sharedDatabase];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v20 accessoriesDictionary];
        long long v11 = [v10 objectForKey:v9];

        long long v12 = [v11 objectForKey:@"fusing"];
        if (v12)
        {
          [v1 serialNumber];
          v14 = id v13 = v1;
          unsigned __int8 v15 = [v9 isEqualToString:v14];

          id v1 = v13;
          if ((v15 & 1) == 0
            && (![v12 caseInsensitiveCompare:v19]
             || ([v19 isEqualToString:@"prod"] & 1) == 0
             && [v12 caseInsensitiveCompare:@"prod"]))
          {
            id v16 = v9;

            goto LABEL_17;
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_17:

  return v16;
}

id getAccessoryDatabaseKeyForAccessoryID(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 modelNumber];
  BOOL v3 = +[UARPSupportedAccessory findByAppleModelNumber:v2];

  if ([v3 supportsInternalSettings]
    && ([v1 serialNumber], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    id v5 = +[AUDeveloperSettingsDatabase sharedDatabase];
    id v6 = [v5 accessoriesDictionary];
    uint64_t v7 = [v1 serialNumber];
    id v8 = [v6 objectForKey:v7];

    if (v8)
    {
      id v9 = [v1 serialNumber];
    }
    else
    {
      long long v11 = findPartnerSerialNumberForAccessory(v1);
      long long v12 = [v5 accessoriesDictionary];
      id v8 = [v12 objectForKey:v11];

      if (v8) {
        id v9 = v11;
      }
      else {
        id v9 = 0;
      }
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id isOTAUpdateDisabledForAccessoryID(void *a1)
{
  id v1 = getAccessoryDatabaseKeyForAccessoryID(a1);
  if (v1)
  {
    uint64_t v2 = +[AUDeveloperSettingsDatabase sharedDatabase];
    BOOL v3 = [v2 accessoriesDictionary];
    uint64_t v4 = [v3 objectForKey:v1];

    if (v4)
    {
      id v5 = [v4 objectForKeyedSubscript:@"isOTADisabled"];
      id v6 = [v5 BOOLValue];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void dropboxFileUpdateForAccessoryID(void *a1, void *a2)
{
  id v9 = a2;
  BOOL v3 = getAccessoryDatabaseKeyForAccessoryID(a1);
  if (v3)
  {
    uint64_t v4 = +[AUDeveloperSettingsDatabase sharedDatabase];
    id v5 = [v4 accessoriesDictionary];
    id v6 = [v5 objectForKey:v3];

    if (v6)
    {
      uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];
      [v7 setObject:v9 forKeyedSubscript:@"dropboxVersion"];
      id v8 = +[NSDictionary dictionaryWithDictionary:v7];
      [v4 addAccessoryWithSerialNumber:v3 info:v8];
    }
  }
}

void updateReachabilityForAccessoryID(void *a1, unsigned int a2)
{
  id v2 = a1;
  BOOL v3 = +[AUDeveloperSettingsDatabase sharedDatabase];
  uint64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = getAccessoryDatabaseKeyForAccessoryID(v2);
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = +[AUDeveloperSettingsDatabase sharedDatabase];
      id v8 = [v7 accessoriesDictionary];
      id v9 = [v8 objectForKey:v6];

      if (v9)
      {
        id v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];
        long long v11 = +[NSNumber numberWithBool:a2];
        [v10 setObject:v11 forKeyedSubscript:@"accessoryReachable"];

        long long v12 = +[NSDictionary dictionaryWithDictionary:v10];
        [v7 addAccessoryWithSerialNumber:v6 info:v12];
      }
    }
  }
  else
  {
    id v13 = [v3 accessoriesDictionary];
    long long v14 = [v13 allKeys];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          long long v21 = [v4 accessoriesDictionary];
          long long v22 = [v21 objectForKey:v20];

          if (v22)
          {
            long long v23 = +[NSMutableDictionary dictionaryWithDictionary:v22];
            long long v24 = +[NSNumber numberWithBool:a2];
            [v23 setObject:v24 forKeyedSubscript:@"accessoryReachable"];

            long long v25 = +[NSDictionary dictionaryWithDictionary:v23];
            [v4 addAccessoryWithSerialNumber:v20 info:v25];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v17);
    }

    id v2 = 0;
  }
}

void sub_100014714(id *a1)
{
  if (a1[4]) {
    id v2 = "valid";
  }
  else {
    id v2 = "nil";
  }
  if (a1[5]) {
    BOOL v3 = "valid";
  }
  else {
    BOOL v3 = "nil";
  }
  NSLog(@"%s(): newModel=%s fallbackModel=%s error=%@\n", "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v2, v3, a1[6]);
  uint64_t v4 = a1[7];
  if (v4[4] != 5)
  {
    NSLog(@"[HS Callback] Invalid State=%s\n", objc_msgSend(v4, "serverStateString:"));
    goto LABEL_53;
  }
  if (a1[6]) {
    goto LABEL_9;
  }
  id v5 = a1[4];
  BOOL v6 = v5
    && [v5 modelData]
    && [a1[4] modelHash]
    && [a1[4] modelLocale] != 0;
  id v7 = a1[5];
  BOOL v8 = v7 && [v7 modelHash] && objc_msgSend(a1[5], "modelLocale") != 0;
  BOOL v34 = v8;
  BOOL v32 = v6;
  if (v6)
  {
    id v9 = objc_msgSend(objc_msgSend(a1[4], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
    id v10 = objc_msgSend(objc_msgSend(a1[4], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
    id v33 = objc_msgSend(objc_msgSend(a1[4], "modelData"), "length");
    *((void *)a1[7] + 4) = -[FirmwareBundle initWithData:hashData:signatureData:certData:]([FirmwareBundle alloc], "initWithData:hashData:signatureData:certData:", [a1[4] modelData], objc_msgSend(a1[4], "digest"), objc_msgSend(a1[4], "signature"), objc_msgSend(a1[4], "certificate"));
    long long v11 = (void *)*((void *)a1[7] + 4);
    if (!v11)
    {
      NSLog(@"[HS Callback] Failed to create firmware bundle\n", v30);
      goto LABEL_9;
    }
    size_t v35 = (size_t)v10;
    size_t v36 = (size_t)v9;
    uint64_t v12 = (v9 + v10 + 4);
    if ([v11 firmwareImage]) {
      id v13 = "valid";
    }
    else {
      id v13 = "nil";
    }
    long long v31 = v13;
    id v14 = [*((id *)a1[7] + 4) firmwareImageSize];
    if ([*((id *)a1[7] + 4) hash]) {
      id v15 = "valid";
    }
    else {
      id v15 = "nil";
    }
    if ([*((id *)a1[7] + 4) signature]) {
      id v16 = "valid";
    }
    else {
      id v16 = "nil";
    }
    if ([*((id *)a1[7] + 4) certificate]) {
      id v17 = "valid";
    }
    else {
      id v17 = "nil";
    }
    NSLog(@"FimrwareBundle created [image=%s imageSize=%d hash=%s signature=%s cert=%s productID=%d baseAddress=%d]\n", v31, v14, v15, v16, v17, [*((id *)a1[7] + 4) productIDCode], objc_msgSend(*((id *)a1[7] + 4), "firmwareImageBaseAddress"));
    if (!v34) {
      goto LABEL_35;
    }
  }
  else
  {
    size_t v35 = 0;
    size_t v36 = 0;
    id v33 = 0;
    uint64_t v12 = 2;
    if (!v8)
    {
LABEL_35:
      id v18 = 0;
      id v19 = 0;
      id v20 = 0;
      goto LABEL_38;
    }
  }
  id v18 = objc_msgSend(objc_msgSend(a1[5], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
  id v19 = objc_msgSend(objc_msgSend(a1[5], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
  id v20 = objc_msgSend(objc_msgSend(a1[5], "modelData"), "length");
  uint64_t v12 = (v18 + v19 + v12 + 2);
LABEL_38:
  if ([a1[4] modelData]) {
    long long v21 = "valid";
  }
  else {
    long long v21 = "nil";
  }
  NSLog(@"%s(): newModel=[data[%lu]=%s locale[%lu]=%@ hash[%lu]=%@]\n", "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v33, v21, v35, [a1[4] modelLocale], v36, objc_msgSend(a1[4], "modelHash"));
  if ([a1[5] modelData]) {
    long long v22 = "valid";
  }
  else {
    long long v22 = "nil";
  }
  NSLog(@"%s(): fbModel=[data[%lu]=%s locale[%lu]=%@ hash[%lu]=%@]\n", "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v20, v22, v19, [a1[5] modelLocale], v18, objc_msgSend(a1[5], "modelHash"));
  NSLog(@"%s(): returnPayloadSize=%d\n", "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v12);
  long long v23 = malloc_type_calloc(v12, 1uLL, 0x97229F3EuLL);
  if (!v23)
  {
    NSLog(@"[HS Callback] Error allocating return payload buf size=%d\n", v12);
LABEL_9:
    [a1[7] setServerState:3];
    __int16 v37 = 0;
    objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 99, &v37, 2);
    objc_msgSend(*((id *)a1[7] + 1), "handleSessionError:message:", objc_msgSend(a1[6], "code"), @"Failed to retrieve HS Asset Info");
    goto LABEL_53;
  }
  long long v24 = v23;
  *long long v23 = 0;
  unsigned int v25 = 2;
  if (v34) {
    char v26 = 2;
  }
  else {
    char v26 = 0;
  }
  v23[1] = v26 | v32;
  if (v32)
  {
    v23[2] = v35;
    memcpy(v23 + 3, objc_msgSend(objc_msgSend(a1[4], "modelLocale"), "cStringUsingEncoding:", 1), v35);
    v24[(v35 + 3)] = v36;
    memcpy(&v24[(v35 + 4)], objc_msgSend(objc_msgSend(a1[4], "modelHash"), "cStringUsingEncoding:", 1), v36);
    unsigned int v25 = v35 + 4 + v36;
  }
  if (v34)
  {
    uint64_t v27 = v25 + 1;
    v24[v25] = (_BYTE)v19;
    memcpy(&v24[v27], objc_msgSend(objc_msgSend(a1[5], "modelLocale"), "cStringUsingEncoding:", 1), (size_t)v19);
    int v28 = v27 + v19;
    uint64_t v29 = (v27 + v19 + 1);
    v24[v28] = (_BYTE)v18;
    memcpy(&v24[v29], objc_msgSend(objc_msgSend(a1[5], "modelHash"), "cStringUsingEncoding:", 1), (size_t)v18);
    LOWORD(v25) = v29 + (_WORD)v18;
  }
  objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 97, v24, (unsigned __int16)v25);
  [a1[7] setServerState:6];
  free(v24);
LABEL_53:

  *((void *)a1[7] + 5) = 0;
}

void sub_1000150A0(uint64_t a1)
{
}

void sub_10001548C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_100015694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000156B4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (CFPreferencesGetAppBooleanValue(@"simulateCoreSpeechNotRespoding", @"com.apple.UARPUpdaterServiceLegacyAudio", 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Simulating CoreSpeech not responding", buf, 2u);
    }
  }
  else
  {
    if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Download Model %@", buf, 0xCu);
    }
    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Fallback Model %@", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = *(NSObject **)(v10 + 16);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000158C8;
    v12[3] = &unk_100031960;
    v12[4] = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v12);
  }
}

void sub_1000158C8(void *a1)
{
  id v2 = *(void **)(a1[4] + 8);
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    [v2 setHSModel:v3 fallbackModel:v4 error:v5];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: delegate is nil", (uint8_t *)&v6, 0xCu);
  }
}

void sub_1000159F4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CSVoiceTriggerRTModel");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100041ED0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10001B8EC();
    sub_100015A4C();
  }
}

void sub_100015A4C()
{
  v1[0] = 0;
  if (!qword_100041ED8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100015B48;
    v1[4] = &unk_100031748;
    v1[5] = v1;
    long long v2 = off_1000319D0;
    uint64_t v3 = 0;
    qword_100041ED8 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_100041ED8)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100015B48()
{
  uint64_t result = _sl_dlopen();
  qword_100041ED8 = result;
  return result;
}

void sub_100015BBC(uint64_t a1)
{
  sub_100015A4C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CSCoreSpeechServices");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100041EE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (void *)sub_10001B914();
    +[NSUserDefaults AUDeveloperSettingsSetObject:v4 withKey:v5];
  }
}

void sub_100015E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015E9C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100015EAC(uint64_t a1)
{
}

void sub_100015EB4(uint64_t a1, void *a2)
{
}

CFStringRef MapPreferenceSuiteToString(uint64_t a1)
{
  CFStringRef v1 = @"com.apple.accessoryupdaterd";
  if (a1) {
    CFStringRef v1 = 0;
  }
  if (a1 == 1) {
    return @"com.apple.AUDeveloperSettings";
  }
  else {
    return v1;
  }
}

NSDictionary *sub_100016018(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  SEL v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    [v2 setObject:v5 forKeyedSubscript:@"manufacturerName"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v6 = *(void *)(v4 + 24);
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"modelName"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v7 = *(void *)(v4 + 32);
  if (v7)
  {
    [v3 setObject:v7 forKeyedSubscript:@"activeFirmwareVersion"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(void *)(v4 + 40))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPAccessoryTransportToString()), @"transportType");
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v8 = *(void *)(v4 + 48);
  if (v8)
  {
    [v3 setObject:v8 forKeyedSubscript:@"countryCode"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v9 = *(void *)(v4 + 56);
  if (v9)
  {
    [v3 setObject:v9 forKeyedSubscript:@"postedFirmwareVersion"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v10 = *(void *)(v4 + 64);
  if (v10)
  {
    [v3 setObject:v10 forKeyedSubscript:@"downloadURL"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(void *)(v4 + 72))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPAnalyticsAssetChannelTypeToString()), @"channel");
    uint64_t v4 = *(void *)(a1 + 32);
  }
  long long v11 = *(void **)(v4 + 80);
  if (v11)
  {
    [v3 setObject:UARPAnalyticsDurationToBucket(v11) forKeyedSubscript:@"downloadConsentDuration"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v12 = *(void *)(v4 + 88);
  if (v12)
  {
    [v3 setObject:v12 forKeyedSubscript:@"downloadUserInitiated"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(void *)(v4 + 96))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPAnalyticsAssetDownloadStatusToString()), @"downloadStatus");
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v13 = *(void *)(v4 + 104);
  if (v13)
  {
    [v3 setObject:v13 forKeyedSubscript:@"stagingUserInitiated"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  id v14 = *(void **)(v4 + 112);
  if (v14)
  {
    [v3 setObject:UARPAnalyticsDurationToBucket(v14) forKeyedSubscript:@"stagingDuration"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  id v15 = *(void **)(v4 + 120);
  if (v15)
  {
    [v3 setObject:UARPAnalyticsIterationCountToBucket(v15) forKeyedSubscript:@"stagingIterations"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(void *)(v4 + 128))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPAnalyticsStagingStatusToString()), @"stagingStatus");
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v16 = *(void *)(v4 + 136);
  if (v16)
  {
    [v3 setObject:v16 forKeyedSubscript:@"stagingVendorError"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v17 = *(void *)(v4 + 144);
  if (v17)
  {
    [v3 setObject:v17 forKeyedSubscript:@"applyUserInitiated"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  id v18 = *(void **)(v4 + 152);
  if (v18)
  {
    [v3 setObject:UARPAnalyticsDurationToBucket(v18) forKeyedSubscript:@"applyDuration"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(void *)(v4 + 160))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPAnalyticsApplyStatusToString()), @"applyStatus");
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v19 = *(void *)(v4 + 168);
  if (v19)
  {
    [v3 setObject:v19 forKeyedSubscript:@"applyVendorError"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(v4 + 8)), @"share3rdParty");
  return +[NSDictionary dictionaryWithDictionary:v3];
}

uint64_t AUSandboxPlatformInitWithBundleIdentifier(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v1 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  id v3 = v1;
  bzero(v7, 0x400uLL);
  id v4 = v3;
  if (_set_user_dir_suffix())
  {
    if (confstr(65537, v7, 0x400uLL))
    {
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_10001B93C();
    }
  }
  else if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    sub_10001B9BC();
  }

  uint64_t v5 = 1;
LABEL_11:

  return v5;
}

void sub_100016878(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

NSDictionary *sub_100016978(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    [v2 setObject:v5 forKeyedSubscript:@"manufacturerName"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v6 = *(void *)(v4 + 24);
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"modelName"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v7 = *(void *)(v4 + 32);
  if (v7)
  {
    [v3 setObject:v7 forKeyedSubscript:@"countryCode"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v8 = *(void *)(v4 + 40);
  if (v8)
  {
    [v3 setObject:v8 forKeyedSubscript:@"downloadURL"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v9 = *(void *)(v4 + 48);
  if (v9)
  {
    [v3 setObject:v9 forKeyedSubscript:@"activeFirmwareVersion"];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(void *)(v4 + 56))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPAccessoryTransportToString()), @"transportType");
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(void *)(v4 + 64))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPAnalyticsAssetChannelTypeToString()), @"channel");
    uint64_t v4 = *(void *)(a1 + 32);
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(v4 + 8)), @"share3rdParty");
  return +[NSDictionary dictionaryWithDictionary:v3];
}

id copyPlistDeviceEntryFromDeviceClass(void *a1)
{
  id v2 = +[NSBundle mainBundle];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = (const void *)MGCopyAnswer();
    if (![(id)(id)CFMakeCollectable(v4) BOOLValue]) {
      goto LABEL_11;
    }
    if ([a1 containsString:@"com.apple.UARP."]) {
      CFStringRef v5 = @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUPLegacyAudio.plist";
    }
    else {
      CFStringRef v5 = @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUP.plist";
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Use Alternate Accessory List from %@", buf, 0xCu);
    }
    id v6 = [+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", +[NSURL fileURLWithPath:v5]) objectForKeyedSubscript:@"MobileAccessoryUpdaterProperties"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loaded Alternate Accessory List from %@", buf, 0xCu);
    }
    if (!v6)
    {
LABEL_11:
      id v6 = [(NSBundle *)v3 objectForInfoDictionaryKey:@"MobileAccessoryUpdaterProperties"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loaded Native iAUP Accessory List", buf, 2u);
      }
    }
    id v2 = (NSBundle *)[v6 objectForKey:@"MatchingDevices"];
    if (v2)
    {
      id v7 = [(NSBundle *)v2 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"DeviceClass = %@", a1]];
      if (v7 && (uint64_t v8 = v7, [v7 count]))
      {
        id v2 = (NSBundle *)[v8 objectAtIndexedSubscript:0];
      }
      else
      {
        NSLog(@"huh? deviceClass %@ not found", a1);
        id v2 = 0;
      }
    }
  }
  return [(NSBundle *)v2 copy];
}

id isSkipDFUModeInBundleInfoPlist(id result)
{
  if (result)
  {
    id v1 = [result objectForKey:@"skipDFUMode"];
    return [v1 BOOLValue];
  }
  return result;
}

id isByteEscapingDisabledInBundleInfoPlist(id result)
{
  if (result)
  {
    id v1 = [result objectForKey:@"disableByteEscaping"];
    return [v1 BOOLValue];
  }
  return result;
}

id isSkipReconnectBundleInfoPlist(id result)
{
  if (result)
  {
    id v1 = [result objectForKey:@"skipReconnect"];
    return [v1 BOOLValue];
  }
  return result;
}

id isSkipMinimumFirmwareVersionCheckInOptions(id result)
{
  if (result)
  {
    id v1 = [result objectForKey:@"skipMinimumFirmwareVersionCheck"];
    return [v1 BOOLValue];
  }
  return result;
}

void sub_100019390(id a1)
{
  id v1 = "$SIDEBUILD_PARENT_TRAIN";
  if (!-[NSString isEqualToString:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "$SIDEBUILD_PARENT_TRAIN"), "isEqualToString:", &stru_100035320)&& !-[NSString isEqualToString:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "$SIDEBUILD_PARENT_TRAIN"), "isEqualToString:", @"$SIDEBUILD_PARENT_TRAIN")|| (id v1 = "CrystalC", !-[NSString isEqualToString:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "CrystalC"), "isEqualToString:",
           &stru_100035320))
    && ![+[NSString stringWithFormat:@"%s", "CrystalC"] isEqualToString:@"$RC_RELEASE"])
  {
    qword_100041EF0 = (uint64_t)v1;
  }
}

int64_t sub_100019AF0(id a1, NSURL *a2, NSURL *a3)
{
  uint64_t v6 = 0;
  [(NSURL *)a2 getResourceValue:&v6 forKey:NSURLLocalizedNameKey error:0];
  id v5 = 0;
  [(NSURL *)a3 getResourceValue:&v5 forKey:NSURLLocalizedNameKey error:0];
  return (int64_t)[v5 compare:v6];
}

id sub_10001A110(uint64_t a1, void *a2)
{
  id v4 = +[NSMutableDictionary dictionary];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 72))
  {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"SilentUpdateNoUI");
    uint64_t v5 = *(void *)(a1 + 32);
  }
  if ([*(id *)(v5 + 16) currentFirmwareVersionOnAcc]) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "currentFirmwareVersionOnAcc"), @"existingFWVersionOnAccessory");
  }
  if (a2)
  {
    CFStringRef v6 = (const __CFString *)objc_msgSend(objc_msgSend(a2, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
    if (v6) {
      CFStringRef v7 = v6;
    }
    else {
      CFStringRef v7 = @"GeneralError";
    }
    [v4 setObject:v7 forKey:@"error"];
    [v4 setObject:@"FailureStateFind" forKey:@"failureState"];
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 16) assetAvailable])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 16) firmwareVersionAvailable]) {
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "firmwareVersionAvailable"), @"newFWVersion");
    }
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%@", @"/var/run/fud/seed/", [*(id *)(*(void *)(a1 + 32) + 16) modelNumber]);
      [*(id *)(*(void *)(a1 + 32) + 8) log:7, @"%s: Consent Required for updating %@", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]_block_invoke", *(void *)(*(void *)(a1 + 32) + 24) format];
      objc_msgSend(v4, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), @"SilentUpdateNoUI");
      objc_msgSend(v4, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"SeedConsentRequired");
      [v4 setValue:*(void *)(a1 + 40) forKey:@"AccessoryName"];
      [v4 setValue:v8 forKey:@"SeedUpdateDeclinedPath"];
      if ([*(id *)(*(void *)(a1 + 32) + 16) serialNumber]) {
        objc_msgSend(v4, "setValue:forKey:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "serialNumber"), @"SerialNumber");
      }
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 8);
  id v11 = [*(id *)(v9 + 16) assetAvailable];
  if ([*(id *)(*(void *)(a1 + 32) + 16) assetAvailable]) {
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 16) assetDownloaded] ^ 1;
  }
  else {
    uint64_t v12 = 0;
  }
  return [v10 didFind:a2 == 0 info:v4 updateAvailable:v11 needsDownload:v12 error:a2];
}

void sub_10001A4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001A510(uint64_t a1, uint64_t a2)
{
}

void sub_10001A520(uint64_t a1)
{
}

id sub_10001A52C(uint64_t a1, void *a2)
{
  if (a2)
  {
    CFStringRef v4 = (const __CFString *)objc_msgSend(objc_msgSend(a2, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
    v9[0] = @"failureState";
    v9[1] = @"error";
    CFStringRef v5 = @"GeneralError";
    if (v4) {
      CFStringRef v5 = v4;
    }
    v10[0] = @"FailureStateDownload";
    v10[1] = v5;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    if (*(unsigned char *)(a1 + 48)) {
      [*(id *)(*(void *)(a1 + 32) + 16) purgeAsset];
    }
  }
  else if (*(unsigned char *)(*(void *)(a1 + 32) + 72))
  {
    CFStringRef v7 = @"SilentUpdateNoUI";
    uint64_t v8 = +[NSNumber numberWithBool:1];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) didDownload:a2 == 0 info:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:a2];
}

id sub_10001A8C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) consentRequired]) {
    [*(id *)(*(void *)(a1 + 32) + 16) purgeAsset];
  }
  CFStringRef v6 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v6 didApply:a3 == 0 info:a2 error:a3];
}

id sub_10001A934(uint64_t a1, double a2)
{
  id result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "log:format:", 7, @"Update Progress: %f", *(void *)&a2);
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 48) || !*(unsigned char *)(v5 + 72))
  {
    CFStringRef v6 = *(void **)(v5 + 8);
    return [v6 progress:a2];
  }
  return result;
}

id sub_10001A9C4(uint64_t a1, void *a2)
{
  [*(id *)(*(void *)(a1 + 32) + 8) log:7, @"Update info: %@", a2 format];
  id v4 = [a2 objectForKey:@"Event"];
  CFStringRef v5 = @"com.apple.fud.updateStarted";
  if (([v4 isEqualToString:@"com.apple.fud.updateStarted"] & 1) != 0
    || (CFStringRef v5 = @"com.apple.fud.updateResumed",
        id result = [v4 isEqualToString:@"com.apple.fud.updateResumed"],
        result))
  {
    CFStringRef v7 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v7 reportAnalytics:v5 info:a2];
  }
  return result;
}

id sub_10001AA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(*(void *)(a1 + 32) + 8) log:3, @"%s: Error:%@ to get create FudPersonalizationRequest for %@", "-[EAAccessoryUpdater applyFirmwareWithOptions:]_block_invoke_4", *(void *)(*(void *)(a1 + 32) + 24) format];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  if (!a2) {
    return [v4 log:3, @"%s: Error: FudPersonalizationRequest = NULL for %@", "-[EAAccessoryUpdater applyFirmwareWithOptions:]_block_invoke_4", *(void *)(v3 + 24) format];
  }
  return [v4 personalizationRequest:a2];
}

void sub_10001AD28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_10001AD40(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", +[NSURL URLWithString:](NSURL, "URLWithString:", a2));
  if (result)
  {
    id result = [*(id *)(*(void *)(a1 + 40) + 8) log:7, @"%s: Pointing to Seed Location for %@, need to prompt for Consent", "-[EAAccessoryUpdater consentRequired]_block_invoke", *(void *)(*(void *)(a1 + 40) + 24) format];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

_UNKNOWN **UARPAnalyticsDurationToBucket(void *a1)
{
  id v1 = [a1 unsignedIntegerValue];
  uint64_t v2 = 0;
  while ((unint64_t)v1 > qword_100029608[v2])
  {
    if (++v2 == 73) {
      return &off_100038CF8;
    }
  }
  return (_UNKNOWN **)+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
}

_UNKNOWN **UARPAnalyticsIterationCountToBucket(void *a1)
{
  id v1 = [a1 unsignedIntegerValue];
  if ((unint64_t)v1 > 0x32) {
    return &off_100038D10;
  }
  return (_UNKNOWN **)+[NSNumber numberWithUnsignedInteger:v1];
}

void sub_10001B3A0(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[AUDeveloperSettingsDatabase setAccessoriesDictionary:]";
  __int16 v4 = 2112;
  CFStringRef v5 = @"accessories";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: seting %@:%@", (uint8_t *)&v2, 0x20u);
}

void sub_10001B43C()
{
  v1[0] = 136315394;
  sub_100006EAC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: dictionary = %@", (uint8_t *)v1, 0x16u);
}

void sub_10001B4BC()
{
  v1[0] = 136315394;
  sub_100006EAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: received unknown object = %@", (uint8_t *)v1, 0x16u);
}

void sub_10001B53C()
{
  v1[0] = 136315394;
  sub_100006EAC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: dictionary = %@", (uint8_t *)v1, 0x16u);
}

void sub_10001B5BC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  __int16 v4 = "-[LegacyAudioAccessory startFirmwareUpdateStates]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to create EAAccessoryUpdater for %@", (uint8_t *)&v3, 0x16u);
}

void sub_10001B64C(uint64_t a1, id *a2)
{
  uint64_t v2 = [*a2 activeAccessories];
  sub_10000F724();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Added accessory %@, active accessories %@", v3, 0x16u);
}

void sub_10001B6E8(uint64_t a1, id *a2)
{
  uint64_t v2 = [*a2 activeAccessories];
  sub_10000F724();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Removed accessory %@, active accessories %@", v3, 0x16u);
}

void sub_10001B784(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[AUHelperInstance remoteObject]_block_invoke";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Failed to get remote object: %@", (uint8_t *)&v1, 0x16u);
}

void sub_10001B818()
{
  int v0 = 136315138;
  int v1 = "+[AUHelperInstance xpcConnectionToHelper]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Failed to get xpc connection", (uint8_t *)&v0, 0xCu);
}

void sub_10001B8A0(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid accessoryData error %@", buf, 0xCu);
}

uint64_t sub_10001B8EC()
{
  uint64_t v0 = abort_report_np();
  return sub_10001B914(v0);
}

uint64_t sub_10001B914()
{
  uint64_t v0 = abort_report_np();
  return sub_10001B93C(v0);
}

void sub_10001B93C()
{
  __error();
  sub_100016878((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
}

void sub_10001B9BC()
{
  __error();
  sub_100016878((void *)&_mh_execute_header, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
}

void sub_10001BA3C(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Invalid firmwareURL %@", (uint8_t *)&v1, 0x16u);
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return _AMAuthInstallApCreatePersonalizedResponse();
}

uint64_t AMAuthInstallApImg4CreateStitchTicket()
{
  return _AMAuthInstallApImg4CreateStitchTicket();
}

uint64_t AMAuthInstallApSetParameters()
{
  return _AMAuthInstallApSetParameters();
}

uint64_t AMAuthInstallCreate()
{
  return _AMAuthInstallCreate();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return _AMAuthInstallLogSetHandler();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return _AMAuthInstallSetSigningServerURL();
}

uint64_t AMAuthInstallSsoEnable()
{
  return _AMAuthInstallSsoEnable();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return _AMAuthInstallSsoInitialize();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t CCDigestFinal()
{
  return _CCDigestFinal();
}

uint64_t CCDigestGetOutputSize()
{
  return _CCDigestGetOutputSize();
}

uint64_t CCDigestInit()
{
  return _CCDigestInit();
}

uint64_t CCDigestUpdate()
{
  return _CCDigestUpdate();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return _CFDataCreateMutableCopy(allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return _CFGetAllocator(cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t FUDError()
{
  return _FUDError();
}

uint64_t FudLog()
{
  return _FudLog();
}

uint64_t FudLogger()
{
  return _FudLogger();
}

uint64_t InternalStorageDirectoryPath()
{
  return _InternalStorageDirectoryPath();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t UARPAccessoryTransportToString()
{
  return _UARPAccessoryTransportToString();
}

uint64_t UARPAnalyticsApplyStatusToString()
{
  return _UARPAnalyticsApplyStatusToString();
}

uint64_t UARPAnalyticsAssetChannelTypeToString()
{
  return _UARPAnalyticsAssetChannelTypeToString();
}

uint64_t UARPAnalyticsAssetDownloadStatusToString()
{
  return _UARPAnalyticsAssetDownloadStatusToString();
}

uint64_t UARPAnalyticsStagingStatusToString()
{
  return _UARPAnalyticsStagingStatusToString();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccdigest_init()
{
  return _ccdigest_init();
}

uint64_t ccdigest_update()
{
  return _ccdigest_update();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return _getuid();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint64_t metadataTLVGetNext()
{
  return _metadataTLVGetNext();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t parseSuperBinaryAndPayloadHeaders()
{
  return _parseSuperBinaryAndPayloadHeaders();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

uint64_t updateSuperBinaryPayload()
{
  return _updateSuperBinaryPayload();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_accessoriesDictionary(void *a1, const char *a2, ...)
{
  return [a1 accessoriesDictionary];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return [a1 accessory];
}

id objc_msgSend_accessoryDisconnected(void *a1, const char *a2, ...)
{
  return [a1 accessoryDisconnected];
}

id objc_msgSend_accessorySerialNumber(void *a1, const char *a2, ...)
{
  return [a1 accessorySerialNumber];
}

id objc_msgSend_activeANCVersion(void *a1, const char *a2, ...)
{
  return [a1 activeANCVersion];
}

id objc_msgSend_activeAccessories(void *a1, const char *a2, ...)
{
  return [a1 activeAccessories];
}

id objc_msgSend_activeFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 activeFirmwareVersion];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowConditionalDownloadOnCellular(void *a1, const char *a2, ...)
{
  return [a1 allowConditionalDownloadOnCellular];
}

id objc_msgSend_appProtocol(void *a1, const char *a2, ...)
{
  return [a1 appProtocol];
}

id objc_msgSend_applyCompletion(void *a1, const char *a2, ...)
{
  return [a1 applyCompletion];
}

id objc_msgSend_applyDuration(void *a1, const char *a2, ...)
{
  return [a1 applyDuration];
}

id objc_msgSend_applyStatus(void *a1, const char *a2, ...)
{
  return [a1 applyStatus];
}

id objc_msgSend_applyUserInitiated(void *a1, const char *a2, ...)
{
  return [a1 applyUserInitiated];
}

id objc_msgSend_applyVendorError(void *a1, const char *a2, ...)
{
  return [a1 applyVendorError];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_assetAvailable(void *a1, const char *a2, ...)
{
  return [a1 assetAvailable];
}

id objc_msgSend_assetDownloaded(void *a1, const char *a2, ...)
{
  return [a1 assetDownloaded];
}

id objc_msgSend_assetLocation(void *a1, const char *a2, ...)
{
  return [a1 assetLocation];
}

id objc_msgSend_assetVersion(void *a1, const char *a2, ...)
{
  return [a1 assetVersion];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_boardID(void *a1, const char *a2, ...)
{
  return [a1 boardID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootloaderProtocol(void *a1, const char *a2, ...)
{
  return [a1 bootloaderProtocol];
}

id objc_msgSend_buildManifest(void *a1, const char *a2, ...)
{
  return [a1 buildManifest];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachedActiveFirmwareAccessories(void *a1, const char *a2, ...)
{
  return [a1 cachedActiveFirmwareAccessories];
}

id objc_msgSend_calculateHash(void *a1, const char *a2, ...)
{
  return [a1 calculateHash];
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return [a1 certificate];
}

id objc_msgSend_chipEpoch(void *a1, const char *a2, ...)
{
  return [a1 chipEpoch];
}

id objc_msgSend_chipID(void *a1, const char *a2, ...)
{
  return [a1 chipID];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeSession(void *a1, const char *a2, ...)
{
  return [a1 closeSession];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_connectionID(void *a1, const char *a2, ...)
{
  return [a1 connectionID];
}

id objc_msgSend_consentRequired(void *a1, const char *a2, ...)
{
  return [a1 consentRequired];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentFirmwareVersionOnAcc(void *a1, const char *a2, ...)
{
  return [a1 currentFirmwareVersionOnAcc];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultBundlePath(void *a1, const char *a2, ...)
{
  return [a1 defaultBundlePath];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deploymentAllowed(void *a1, const char *a2, ...)
{
  return [a1 deploymentAllowed];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_digest(void *a1, const char *a2, ...)
{
  return [a1 digest];
}

id objc_msgSend_doneWithAsset(void *a1, const char *a2, ...)
{
  return [a1 doneWithAsset];
}

id objc_msgSend_eaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 eaIdentifier];
}

id objc_msgSend_ecID(void *a1, const char *a2, ...)
{
  return [a1 ecID];
}

id objc_msgSend_effectiveProductionMode(void *a1, const char *a2, ...)
{
  return [a1 effectiveProductionMode];
}

id objc_msgSend_effectiveSecurityMode(void *a1, const char *a2, ...)
{
  return [a1 effectiveSecurityMode];
}

id objc_msgSend_enableMixMatch(void *a1, const char *a2, ...)
{
  return [a1 enableMixMatch];
}

id objc_msgSend_extEcID(void *a1, const char *a2, ...)
{
  return [a1 extEcID];
}

id objc_msgSend_filePathURL(void *a1, const char *a2, ...)
{
  return [a1 filePathURL];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_findAccessory(void *a1, const char *a2, ...)
{
  return [a1 findAccessory];
}

id objc_msgSend_firmwareBundle(void *a1, const char *a2, ...)
{
  return [a1 firmwareBundle];
}

id objc_msgSend_firmwareBundleFilename(void *a1, const char *a2, ...)
{
  return [a1 firmwareBundleFilename];
}

id objc_msgSend_firmwareBundleURL(void *a1, const char *a2, ...)
{
  return [a1 firmwareBundleURL];
}

id objc_msgSend_firmwareImage(void *a1, const char *a2, ...)
{
  return [a1 firmwareImage];
}

id objc_msgSend_firmwareImageBaseAddress(void *a1, const char *a2, ...)
{
  return [a1 firmwareImageBaseAddress];
}

id objc_msgSend_firmwareImageSize(void *a1, const char *a2, ...)
{
  return [a1 firmwareImageSize];
}

id objc_msgSend_firmwareLocalURL(void *a1, const char *a2, ...)
{
  return [a1 firmwareLocalURL];
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return [a1 firmwareRevision];
}

id objc_msgSend_firmwareRevisionActive(void *a1, const char *a2, ...)
{
  return [a1 firmwareRevisionActive];
}

id objc_msgSend_firmwareRevisionPending(void *a1, const char *a2, ...)
{
  return [a1 firmwareRevisionPending];
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 firmwareVersion];
}

id objc_msgSend_firmwareVersionAvailable(void *a1, const char *a2, ...)
{
  return [a1 firmwareVersionAvailable];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_forceSilentUpdate(void *a1, const char *a2, ...)
{
  return [a1 forceSilentUpdate];
}

id objc_msgSend_freePersonalizationData(void *a1, const char *a2, ...)
{
  return [a1 freePersonalizationData];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_getNumberOfBytesDownloadedInCurrentSession(void *a1, const char *a2, ...)
{
  return [a1 getNumberOfBytesDownloadedInCurrentSession];
}

id objc_msgSend_getPersonalizationID(void *a1, const char *a2, ...)
{
  return [a1 getPersonalizationID];
}

id objc_msgSend_getWhitelistedPersonalizationFields(void *a1, const char *a2, ...)
{
  return [a1 getWhitelistedPersonalizationFields];
}

id objc_msgSend_globalSigning(void *a1, const char *a2, ...)
{
  return [a1 globalSigning];
}

id objc_msgSend_hasBytesAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasBytesAvailable];
}

id objc_msgSend_hasSpaceAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasSpaceAvailable];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hwFusingType(void *a1, const char *a2, ...)
{
  return [a1 hwFusingType];
}

id objc_msgSend_iAUPVersion(void *a1, const char *a2, ...)
{
  return [a1 iAUPVersion];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return [a1 inputStream];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isChipEpochSet(void *a1, const char *a2, ...)
{
  return [a1 isChipEpochSet];
}

id objc_msgSend_isEffectiveProductionModeSet(void *a1, const char *a2, ...)
{
  return [a1 isEffectiveProductionModeSet];
}

id objc_msgSend_isEffectiveSecurityModeSet(void *a1, const char *a2, ...)
{
  return [a1 isEffectiveSecurityModeSet];
}

id objc_msgSend_isMultiAssetSession(void *a1, const char *a2, ...)
{
  return [a1 isMultiAssetSession];
}

id objc_msgSend_isProductionModeSet(void *a1, const char *a2, ...)
{
  return [a1 isProductionModeSet];
}

id objc_msgSend_isRestartRequired(void *a1, const char *a2, ...)
{
  return [a1 isRestartRequired];
}

id objc_msgSend_isRoamingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRoamingEnabled];
}

id objc_msgSend_isSecurityModeSet(void *a1, const char *a2, ...)
{
  return [a1 isSecurityModeSet];
}

id objc_msgSend_isSleepWakeRequired(void *a1, const char *a2, ...)
{
  return [a1 isSleepWakeRequired];
}

id objc_msgSend_isTrustedSet(void *a1, const char *a2, ...)
{
  return [a1 isTrustedSet];
}

id objc_msgSend_isUrgentUpdate(void *a1, const char *a2, ...)
{
  return [a1 isUrgentUpdate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadFirmwareImage(void *a1, const char *a2, ...)
{
  return [a1 loadFirmwareImage];
}

id objc_msgSend_loadMatchingAccessoriesList(void *a1, const char *a2, ...)
{
  return [a1 loadMatchingAccessoriesList];
}

id objc_msgSend_loadMatchingBSDNotificationsList(void *a1, const char *a2, ...)
{
  return [a1 loadMatchingBSDNotificationsList];
}

id objc_msgSend_loadMatchingDASActivityList(void *a1, const char *a2, ...)
{
  return [a1 loadMatchingDASActivityList];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return [a1 manufacturer];
}

id objc_msgSend_matchingAccessoriesList(void *a1, const char *a2, ...)
{
  return [a1 matchingAccessoriesList];
}

id objc_msgSend_matchingBSDNotificationsList(void *a1, const char *a2, ...)
{
  return [a1 matchingBSDNotificationsList];
}

id objc_msgSend_matchingDASActivityList(void *a1, const char *a2, ...)
{
  return [a1 matchingDASActivityList];
}

id objc_msgSend_migrateExistingDefaults(void *a1, const char *a2, ...)
{
  return [a1 migrateExistingDefaults];
}

id objc_msgSend_modelAnalytics(void *a1, const char *a2, ...)
{
  return [a1 modelAnalytics];
}

id objc_msgSend_modelData(void *a1, const char *a2, ...)
{
  return [a1 modelData];
}

id objc_msgSend_modelHash(void *a1, const char *a2, ...)
{
  return [a1 modelHash];
}

id objc_msgSend_modelLocale(void *a1, const char *a2, ...)
{
  return [a1 modelLocale];
}

id objc_msgSend_modelName(void *a1, const char *a2, ...)
{
  return [a1 modelName];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_multiAssetAppProtocol(void *a1, const char *a2, ...)
{
  return [a1 multiAssetAppProtocol];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nonceHash(void *a1, const char *a2, ...)
{
  return [a1 nonceHash];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectList(void *a1, const char *a2, ...)
{
  return [a1 objectList];
}

id objc_msgSend_objectTag(void *a1, const char *a2, ...)
{
  return [a1 objectTag];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_openSession(void *a1, const char *a2, ...)
{
  return [a1 openSession];
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return [a1 outputStream];
}

id objc_msgSend_overrideProtocol(void *a1, const char *a2, ...)
{
  return [a1 overrideProtocol];
}

id objc_msgSend_overrideUpdaterOptions(void *a1, const char *a2, ...)
{
  return [a1 overrideUpdaterOptions];
}

id objc_msgSend_parserState(void *a1, const char *a2, ...)
{
  return [a1 parserState];
}

id objc_msgSend_partnerSerialNumbers(void *a1, const char *a2, ...)
{
  return [a1 partnerSerialNumbers];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_personalizationComplete(void *a1, const char *a2, ...)
{
  return [a1 personalizationComplete];
}

id objc_msgSend_processInTelegram(void *a1, const char *a2, ...)
{
  return [a1 processInTelegram];
}

id objc_msgSend_productIDCode(void *a1, const char *a2, ...)
{
  return [a1 productIDCode];
}

id objc_msgSend_productionMode(void *a1, const char *a2, ...)
{
  return [a1 productionMode];
}

id objc_msgSend_protocolDetails(void *a1, const char *a2, ...)
{
  return [a1 protocolDetails];
}

id objc_msgSend_protocolString(void *a1, const char *a2, ...)
{
  return [a1 protocolString];
}

id objc_msgSend_protocolStrings(void *a1, const char *a2, ...)
{
  return [a1 protocolStrings];
}

id objc_msgSend_purgeAsset(void *a1, const char *a2, ...)
{
  return [a1 purgeAsset];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
}

id objc_msgSend_remoteObject(void *a1, const char *a2, ...)
{
  return [a1 remoteObject];
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectInterface];
}

id objc_msgSend_remoteURL(void *a1, const char *a2, ...)
{
  return [a1 remoteURL];
}

id objc_msgSend_requestName(void *a1, const char *a2, ...)
{
  return [a1 requestName];
}

id objc_msgSend_requestPrefix(void *a1, const char *a2, ...)
{
  return [a1 requestPrefix];
}

id objc_msgSend_resetParser(void *a1, const char *a2, ...)
{
  return [a1 resetParser];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return [a1 resourcePath];
}

id objc_msgSend_responseAlignment(void *a1, const char *a2, ...)
{
  return [a1 responseAlignment];
}

id objc_msgSend_responseFormat(void *a1, const char *a2, ...)
{
  return [a1 responseFormat];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_securityDomain(void *a1, const char *a2, ...)
{
  return [a1 securityDomain];
}

id objc_msgSend_securityMode(void *a1, const char *a2, ...)
{
  return [a1 securityMode];
}

id objc_msgSend_seedParticipationDictionary(void *a1, const char *a2, ...)
{
  return [a1 seedParticipationDictionary];
}

id objc_msgSend_send(void *a1, const char *a2, ...)
{
  return [a1 send];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serverState(void *a1, const char *a2, ...)
{
  return [a1 serverState];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setSeedParticipationStatusAndContinue(void *a1, const char *a2, ...)
{
  return [a1 setSeedParticipationStatusAndContinue];
}

id objc_msgSend_shareAnalyticsEventsWithThirdParty(void *a1, const char *a2, ...)
{
  return [a1 shareAnalyticsEventsWithThirdParty];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedDatabase(void *a1, const char *a2, ...)
{
  return [a1 sharedDatabase];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showPersonalizationRequiredDialogAndGetResponse(void *a1, const char *a2, ...)
{
  return [a1 showPersonalizationRequiredDialogAndGetResponse];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_skipDFUMode(void *a1, const char *a2, ...)
{
  return [a1 skipDFUMode];
}

id objc_msgSend_stagingDuration(void *a1, const char *a2, ...)
{
  return [a1 stagingDuration];
}

id objc_msgSend_stagingIterations(void *a1, const char *a2, ...)
{
  return [a1 stagingIterations];
}

id objc_msgSend_stagingStatus(void *a1, const char *a2, ...)
{
  return [a1 stagingStatus];
}

id objc_msgSend_stagingUserInitiated(void *a1, const char *a2, ...)
{
  return [a1 stagingUserInitiated];
}

id objc_msgSend_stagingVendorError(void *a1, const char *a2, ...)
{
  return [a1 stagingVendorError];
}

id objc_msgSend_startFirmwareUpdateStates(void *a1, const char *a2, ...)
{
  return [a1 startFirmwareUpdateStates];
}

id objc_msgSend_stopReconnectTimer(void *a1, const char *a2, ...)
{
  return [a1 stopReconnectTimer];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_supportsInternalSettings(void *a1, const char *a2, ...)
{
  return [a1 supportsInternalSettings];
}

id objc_msgSend_trainName(void *a1, const char *a2, ...)
{
  return [a1 trainName];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_trusted(void *a1, const char *a2, ...)
{
  return [a1 trusted];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateCompleteForActiveDeviceClass(void *a1, const char *a2, ...)
{
  return [a1 updateCompleteForActiveDeviceClass];
}

id objc_msgSend_updateRequiresPersonalization(void *a1, const char *a2, ...)
{
  return [a1 updateRequiresPersonalization];
}

id objc_msgSend_updateRequiresSuperBinary(void *a1, const char *a2, ...)
{
  return [a1 updateRequiresSuperBinary];
}

id objc_msgSend_useSSOCredentials(void *a1, const char *a2, ...)
{
  return [a1 useSSOCredentials];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_xpcConnectionToHelper(void *a1, const char *a2, ...)
{
  return [a1 xpcConnectionToHelper];
}