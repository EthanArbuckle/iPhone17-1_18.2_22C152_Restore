int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  TLServiceAgent *v5;

  v4 = +[NSXPCListener serviceListener];
  v5 = objc_alloc_init(TLServiceAgent);
  [v4 setDelegate:v5];
  [v4 resume];
  [v4 setDelegate:0];

  return 0;
}

void sub_100002EAC(uint64_t a1, void *a2, void *a3, const __CFString **a4)
{
  if (a2 && a3 && a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = *(id *)(a1 + 32);
      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v24;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *a3 = v13;
              CFStringRef v22 = @"key of user generated vibration pattern wrapper";
              goto LABEL_29;
            }
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      id v8 = [*(id *)(a1 + 32) objectForKey:@"Name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [*(id *)(a1 + 32) objectForKey:@"Pattern"];
        if (!+[TLVibrationPattern isValidVibrationPatternPropertyListRepresentation:v14])
        {
          *a2 = +[NSError tl_errorWithDomain:@"TLServiceValidationErrorDomain", @"Invalid vibration pattern: %@", *(void *)(a1 + 32) description];
        }
      }
      else
      {
        *a3 = v8;
        CFStringRef v22 = @"name of user generated vibration pattern";
LABEL_29:
        *a4 = v22;
      }
    }
    else
    {
      *a3 = *(id *)(a1 + 32);
      *a4 = @"user generated vibration pattern wrapper";
    }
  }
  else
  {
    v15 = TLLogGeneral();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

    if (v16)
    {
      v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Vibrations/TLVibrationPersistenceUtilities.m"];
      v18 = TLLogGeneral();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v17 lastPathComponent];
        v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 136381443;
        v29 = "+[TLVibrationPersistenceUtilities _objectIsValidUserGeneratedVibrationPattern:error:]_block_invoke";
        __int16 v30 = 2113;
        v31 = v19;
        __int16 v32 = 2049;
        uint64_t v33 = 71;
        __int16 v34 = 2113;
        v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
      }
    }
    else
    {
      v17 = TLLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10000575C();
      }
    }

    v21 = TLLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100005728();
    }
  }
}

void sub_1000032D4(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (!a2 || !a3 || !a4)
  {
    v17 = TLLogGeneral();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (v18)
    {
      v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Vibrations/TLVibrationPersistenceUtilities.m"];
      v20 = TLLogGeneral();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v19 lastPathComponent];
        CFStringRef v22 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 136381443;
        __int16 v32 = "+[TLVibrationPersistenceUtilities objectIsValidUserGeneratedVibrationPatternsDictionary:error:]_block_invoke";
        __int16 v33 = 2113;
        __int16 v34 = v21;
        __int16 v35 = 2049;
        uint64_t v36 = 109;
        __int16 v37 = 2113;
        v38 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
      }
    }
    else
    {
      v19 = TLLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10000575C();
      }
    }

    long long v23 = TLLogGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100005728();
    }

    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a3 = *(id *)(a1 + 32);
    *a4 = @"root object";
    return;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = *(id *)(a1 + 32);
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9) {
    goto LABEL_31;
  }
  id v10 = v9;
  long long v24 = a2;
  uint64_t v11 = *(void *)v27;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *a3 = v13;
        *a4 = @"key object";
        goto LABEL_31;
      }
      if (![v13 hasPrefix:@"usergeneratedvibration:"])
      {
        id v16 = +[NSError tl_errorWithDomain:@"TLServiceValidationErrorDomain", @"Invalid key object: %@. All key objects need to start with \"%@\"", v13, @"usergeneratedvibration:" description];

        if (!v16) {
          return;
        }
        goto LABEL_30;
      }
      v14 = *(void **)(a1 + 40);
      v15 = [*(id *)(a1 + 32) objectForKey:v13];
      id v25 = 0;
      [v14 _objectIsValidUserGeneratedVibrationPattern:v15 error:&v25];
      id v16 = v25;

      if (v16)
      {

LABEL_30:
        id v8 = v16;
        *long long v24 = v8;
        goto LABEL_31;
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_31:
}

void sub_1000036D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003930(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v11;
      *((unsigned char *)v11 + 24) = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v7 = v11;
      if (isKindOfClass)
      {
        *((unsigned char *)v11 + 24) = 1;
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100003A98;
        v9[3] = &unk_1000082C0;
        v9[4] = &v10;
        [v6 enumerateKeysAndObjectsUsingBlock:v9];
        v7 = v11;
      }
    }
    if (*((unsigned char *)v7 + 24)) {
      [*(id *)(a1 + 32) setObject:v6 forKey:v5];
    }
    _Block_object_dispose(&v10, 8);
  }
}

void sub_100003A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003A98(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

BOOL sub_100003EEC(uint64_t a1, uint64_t a2)
{
  BOOL result = +[TLVibrationPersistenceUtilities objectIsValidUserGeneratedVibrationPatternsDictionary:*(void *)(a1 + 32) error:a2];
  if (result)
  {
    v4 = +[TLVibrationPersistenceUtilities userGeneratedVibrationStoreFileURL];
    id v5 = [*(id *)(a1 + 32) writeToURL:v4 atomically:1];

    return (BOOL)v5;
  }
  return result;
}

BOOL sub_100003F60(id a1, id *a2)
{
  v3 = +[TLVibrationPersistenceUtilities userGeneratedVibrationStoreFileURL];
  v4 = +[NSFileManager defaultManager];
  LOBYTE(a2) = [v4 removeItemAtURL:v3 error:a2];

  return (char)a2;
}

uint64_t TLLogGeneral()
{
  if (qword_10000CBE8 != -1) {
    dispatch_once(&qword_10000CBE8, &stru_1000083A8);
  }
  return qword_10000CBC8;
}

uint64_t TLLogVibrationManagement()
{
  if (qword_10000CBE8 != -1) {
    dispatch_once(&qword_10000CBE8, &stru_1000083A8);
  }
  return qword_10000CBE0;
}

void sub_100004520(id a1)
{
  qword_10000CBC8 = (uint64_t)os_log_create("com.apple.ToneLibrary", "General");
  qword_10000CBD0 = (uint64_t)os_log_create("com.apple.ToneLibrary", "Playback");
  qword_10000CBD8 = (uint64_t)os_log_create("com.apple.ToneLibrary", "ToneManagement");
  qword_10000CBE0 = (uint64_t)os_log_create("com.apple.ToneLibrary", "VibrationManagement");
}

BOOL sub_10000565C(void *a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__s2, uint64_t a10)
{
  id v11 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v13 = 0;
  if (a2 && (isKindOfClass & 1) != 0)
  {
    v14 = (const char *)[v11 objCType];
    if (!strcmp(v14, a2))
    {
      BOOL v13 = 1;
    }
    else
    {
      v19 = (const char **)&a10;
      v15 = __s2;
      if (__s2)
      {
        do
        {
          int v16 = strcmp(v14, v15);
          BOOL v13 = v16 == 0;
          if (!v16) {
            break;
          }
          v17 = v19++;
          v15 = *v17;
        }
        while (*v17);
      }
      else
      {
        BOOL v13 = 0;
      }
    }
  }

  return v13;
}

void sub_100005728()
{
  sub_1000036F0();
  sub_1000036D4((void *)&_mh_execute_header, v0, v1, "Pointers of validation block can't be NULL.", v2, v3, v4, v5, v6);
}

void sub_10000575C()
{
  sub_1000036F0();
  sub_1000036D4((void *)&_mh_execute_header, v0, v1, "*** Assertion failure.", v2, v3, v4, v5, v6);
}

void sub_100005790(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to build path to directory containing user generated vibration store file.", v1, 2u);
}

void sub_1000057D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "What is going on!? The directory containing user generated vibration store file was created successfully, but somehow it still doesn't exist.", v1, 2u);
}

void sub_100005818(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create directory containing user generated vibration store file. Error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100005890(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  uint64_t v4 = (int)[a1 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Rejecting connection with process identifier %ld because it doesn't have any of the possible required entitlements to use the ToneLibrary service agent.", (uint8_t *)&v3, 0xCu);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

id objc_msgSend__computedDuration(void *a1, const char *a2, ...)
{
  return [a1 _computedDuration];
}

id objc_msgSend__postUserGeneratedVibrationPatternsDidChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _postUserGeneratedVibrationPatternsDidChangeNotification];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_propertyListRepresentation(void *a1, const char *a2, ...)
{
  return [a1 propertyListRepresentation];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_userGeneratedVibrationStoreFileURL(void *a1, const char *a2, ...)
{
  return [a1 userGeneratedVibrationStoreFileURL];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}