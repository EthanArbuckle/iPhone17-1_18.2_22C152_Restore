void sub_1000050E4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;

  v3 = a2;
  v4 = [*(id *)(a1 + 32) clDurianMobileAssetUpdater];
  v5 = [v4 assetAvailable];

  v6 = [*(id *)(a1 + 32) clDurianMobileAssetUpdater];
  v7 = [v6 assetDownloaded] ^ 1;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109634;
    v16[1] = v5;
    v17 = 1024;
    v18 = v7;
    v19 = 2112;
    v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Query to MobileAsset completed - updateAvailable: %d needsDownload: %d error: %@", (uint8_t *)v16, 0x18u);
  }
  v8 = *(void **)(a1 + 32);
  if (v3)
  {
    [v8 notifySPFirmwareUpdateState:1 error:v3];
    v9 = [*(id *)(a1 + 32) fudPluginDelegate];
    v10 = v9;
    v11 = 0;
    v12 = v5;
    v13 = v7;
    v14 = v3;
  }
  else
  {
    if (v5) {
      v15 = 0;
    }
    else {
      v15 = 4;
    }
    [v8 notifySPFirmwareUpdateState:v15 error:0];
    v9 = [*(id *)(a1 + 32) fudPluginDelegate];
    v10 = v9;
    v11 = 1;
    v12 = v5;
    v13 = v7;
    v14 = 0;
  }
  [v9 didFind:v11 info:0 updateAvailable:v12 needsDownload:v13 error:v14];
}

void sub_10000538C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Asset download completed - error: %@", (uint8_t *)&v5, 0xCu);
  }
  if (v3) {
    [*(id *)(a1 + 32) notifySPFirmwareUpdateState:1 error:v3];
  }
  v4 = [*(id *)(a1 + 32) fudPluginDelegate];
  [v4 didDownload:v3 == 0 info:0 error:v3];
}

void sub_100006408(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Candidate beacons to update: %@", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) setCandidateBeaconsToUpdate:v3];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100006638(id a1, BOOL a2)
{
  if (!a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100007FA4();
  }
}

BOOL sub_100007108(uint64_t a1, void *a2)
{
  id v3 = [a2 attributes];
  int v4 = [v3 objectForKey:@"FirmwareVersionMajor"];
  id v5 = [v4 unsignedLongLongValue];
  id v6 = [v3 objectForKey:@"FirmwareVersionMinor"];

  id v7 = [v6 unsignedLongLongValue];
  v8 = [v3 objectForKey:@"FirmwareVersionRelease"];

  id v9 = [v8 unsignedLongLongValue];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [*(id *)(a1 + 32) currentMajorVersion];
    id v11 = [*(id *)(a1 + 32) currentMajorVersion];
    id v12 = [*(id *)(a1 + 32) currentMinorVersion];
    id v13 = [*(id *)(a1 + 32) currentMinorVersion];
    id v14 = [*(id *)(a1 + 32) currentReleaseVersion];
    int v17 = 134219008;
    id v18 = v10;
    __int16 v19 = 2048;
    id v20 = v11;
    __int16 v21 = 2048;
    id v22 = v12;
    __int16 v23 = 2048;
    id v24 = v13;
    __int16 v25 = 2048;
    id v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Applying predicate: ((majorVersion > %llu) || ((majorVersion == %llu) && ((minorVersion > %llu) || ((minorVersion == %llu) && (releaseVersion > %llu)))))", (uint8_t *)&v17, 0x34u);
  }
  BOOL v15 = v5 > [*(id *)(a1 + 32) currentMajorVersion]
     || v5 == [*(id *)(a1 + 32) currentMajorVersion]
     && (v7 > [*(id *)(a1 + 32) currentMinorVersion]
      || v7 == [*(id *)(a1 + 32) currentMinorVersion]
      && v9 > [*(id *)(a1 + 32) currentReleaseVersion]);

  return v15;
}

void sub_100007ED8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

void sub_100007F18(uint64_t a1, uint64_t a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "#durian Firmware update to durian failed - error: %@ device: %@", (uint8_t *)&v2, 0x16u);
}

void sub_100007FA4()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "#durian Unable to signal SearchParty of firmware update state change!", v0, 2u);
}

void sub_100007FEC()
{
  int v0 = 136315138;
  v1 = "-[CLDurianMobileAssetUpdater validateAsset]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Firmware Bundle not writable error", (uint8_t *)&v0, 0xCu);
}

void sub_100008074()
{
  sub_100007EC4();
  sub_100007ED8((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Firmware Bundle Copy Error : %@", v1, v2, v3, v4, 2u);
}

void sub_1000080F0()
{
  sub_100007EC4();
  sub_100007ED8((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to remove existing bundle URL : %@", v1, v2, v3, v4, 2u);
}

void sub_10000816C()
{
  sub_100007EC4();
  sub_100007ED8((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to create cache dir %@", v1, v2, v3, v4, 2u);
}

void sub_1000081E8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "#durian Firmware bundle is not readable!", v0, 2u);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t parseSuperBinaryAndPayloadHeaders()
{
  return _parseSuperBinaryAndPayloadHeaders();
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
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

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_candidateBeaconToUpdate(void *a1, const char *a2, ...)
{
  return [a1 candidateBeaconToUpdate];
}

id objc_msgSend_candidateBeaconsToUpdate(void *a1, const char *a2, ...)
{
  return [a1 candidateBeaconsToUpdate];
}

id objc_msgSend_candidatePersonalizationState(void *a1, const char *a2, ...)
{
  return [a1 candidatePersonalizationState];
}

id objc_msgSend_clDurianMobileAssetUpdater(void *a1, const char *a2, ...)
{
  return [a1 clDurianMobileAssetUpdater];
}

id objc_msgSend_clFirmwareUpdateManager(void *a1, const char *a2, ...)
{
  return [a1 clFirmwareUpdateManager];
}

id objc_msgSend_currentMajorVersion(void *a1, const char *a2, ...)
{
  return [a1 currentMajorVersion];
}

id objc_msgSend_currentMinorVersion(void *a1, const char *a2, ...)
{
  return [a1 currentMinorVersion];
}

id objc_msgSend_currentReleaseVersion(void *a1, const char *a2, ...)
{
  return [a1 currentReleaseVersion];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deploymentAllowed(void *a1, const char *a2, ...)
{
  return [a1 deploymentAllowed];
}

id objc_msgSend_filePathURL(void *a1, const char *a2, ...)
{
  return [a1 filePathURL];
}

id objc_msgSend_firmwareBundleFilename(void *a1, const char *a2, ...)
{
  return [a1 firmwareBundleFilename];
}

id objc_msgSend_firmwareBundleURL(void *a1, const char *a2, ...)
{
  return [a1 firmwareBundleURL];
}

id objc_msgSend_firmwareUpdateSession(void *a1, const char *a2, ...)
{
  return [a1 firmwareUpdateSession];
}

id objc_msgSend_fudPluginDelegate(void *a1, const char *a2, ...)
{
  return [a1 fudPluginDelegate];
}

id objc_msgSend_getAssetURL(void *a1, const char *a2, ...)
{
  return [a1 getAssetURL];
}

id objc_msgSend_getBuildIdentities(void *a1, const char *a2, ...)
{
  return [a1 getBuildIdentities];
}

id objc_msgSend_getCandidateBeaconsToUpdate(void *a1, const char *a2, ...)
{
  return [a1 getCandidateBeaconsToUpdate];
}

id objc_msgSend_getFTAB(void *a1, const char *a2, ...)
{
  return [a1 getFTAB];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_getUpdatedSystemVersion(void *a1, const char *a2, ...)
{
  return [a1 getUpdatedSystemVersion];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_spFirmwareUpdateSession(void *a1, const char *a2, ...)
{
  return [a1 spFirmwareUpdateSession];
}

id objc_msgSend_splitSuperBinary(void *a1, const char *a2, ...)
{
  return [a1 splitSuperBinary];
}

id objc_msgSend_startService(void *a1, const char *a2, ...)
{
  return [a1 startService];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return [a1 systemVersion];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}