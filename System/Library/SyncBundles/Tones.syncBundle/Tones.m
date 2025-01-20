void sub_431C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_4370(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [objc_alloc((Class)NSMutableString) initWithString:&stru_8460];
  uint64_t v7 = 0;
  char v8 = 1;
  do
  {
    char v9 = v8;
    v10 = &qword_8230[2 * v7];
    if ((*v10 & a3) != 0)
    {
      uint64_t v11 = v10[1];
      if ([v6 length]) {
        [v6 appendString:@","];
      }
      objc_msgSend(v6, "appendFormat:", @"%s", v11);
    }
    char v8 = 0;
    uint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
  if (![v6 length]) {
    [v6 appendString:@"none"];
  }
  v12 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = a1[4];
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    id v20 = v5;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Backing up \"%{public}@\" with attributes: %{public}@.", buf, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    v14 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = a1[4];
      v16 = (void *)a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2114;
      id v20 = v16;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Enumeration of paths for backup of type \"%{public}@\" was just interrupted.", buf, 0x16u);
    }
  }
}

void sub_47CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4800(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4810(uint64_t a1)
{
}

void sub_4818(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id v14 = v5;
  if (a3)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v6) {
      goto LABEL_7;
    }
    id v11 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v10 = *(void *)(a1 + 32);
  }
  else
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v6) {
      goto LABEL_7;
    }
    id v7 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(a1 + 40);
  }
  id v6 = *(void **)(*(void *)(v10 + 8) + 40);
  id v5 = v14;
LABEL_7:
  [v6 addObject:v5];
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _ATLogCategorySyncBundle()
{
  return __ATLogCategorySyncBundle();
}

uint64_t _ATLogCategorySyncBundle_Oversize()
{
  return __ATLogCategorySyncBundle_Oversize();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_msgSend__allSyncedTones(void *a1, const char *a2, ...)
{
  return [a1 _allSyncedTones];
}

id objc_msgSend__deviceITunesRingtoneDirectory(void *a1, const char *a2, ...)
{
  return [a1 _deviceITunesRingtoneDirectory];
}

id objc_msgSend__deviceITunesRingtoneInformationPlist(void *a1, const char *a2, ...)
{
  return [a1 _deviceITunesRingtoneInformationPlist];
}

id objc_msgSend__iTunesRingtoneDirectory(void *a1, const char *a2, ...)
{
  return [a1 _iTunesRingtoneDirectory];
}

id objc_msgSend__iTunesRingtoneInformationPlist(void *a1, const char *a2, ...)
{
  return [a1 _iTunesRingtoneInformationPlist];
}

id objc_msgSend__installedTones(void *a1, const char *a2, ...)
{
  return [a1 _installedTones];
}

id objc_msgSend__installedTonesSize(void *a1, const char *a2, ...)
{
  return [a1 _installedTonesSize];
}

id objc_msgSend__registerDidRequestResetSyncPostAccidentalToneDeletion(void *a1, const char *a2, ...)
{
  return [a1 _registerDidRequestResetSyncPostAccidentalToneDeletion];
}

id objc_msgSend__removeSyncPlists(void *a1, const char *a2, ...)
{
  return [a1 _removeSyncPlists];
}

id objc_msgSend__rootDirectory(void *a1, const char *a2, ...)
{
  return [a1 _rootDirectory];
}

id objc_msgSend__syncPlistPaths(void *a1, const char *a2, ...)
{
  return [a1 _syncPlistPaths];
}

id objc_msgSend__toneSyncAnchorFilePath(void *a1, const char *a2, ...)
{
  return [a1 _toneSyncAnchorFilePath];
}

id objc_msgSend__toneSyncMediaPath(void *a1, const char *a2, ...)
{
  return [a1 _toneSyncMediaPath];
}

id objc_msgSend__toneSyncPlistFolderPath(void *a1, const char *a2, ...)
{
  return [a1 _toneSyncPlistFolderPath];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artworkFile(void *a1, const char *a2, ...)
{
  return [a1 artworkFile];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isDownload(void *a1, const char *a2, ...)
{
  return [a1 isDownload];
}

id objc_msgSend_isPurchased(void *a1, const char *a2, ...)
{
  return [a1 isPurchased];
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

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_syncIdentifier(void *a1, const char *a2, ...)
{
  return [a1 syncIdentifier];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}