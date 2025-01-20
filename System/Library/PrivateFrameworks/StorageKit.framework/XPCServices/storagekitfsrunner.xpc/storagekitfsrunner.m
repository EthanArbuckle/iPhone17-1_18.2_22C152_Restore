void tagQueue(void *a1, const void *a2)
{
  void *v3;
  NSObject *queue;
  uint64_t vars8;

  queue = a1;
  v3 = malloc_type_calloc(8uLL, 1uLL, 0x50B26848uLL);
  *v3 = 1;
  dispatch_queue_set_specific(queue, a2, v3, (dispatch_function_t)&free);
}

void *currentQueueIsMainQueue()
{
  if (qword_10000DBC8 != -1) {
    dispatch_once(&qword_10000DBC8, &stru_1000082C8);
  }
  result = dispatch_get_specific("isMainQueue");
  if (result) {
    return (void *)(*result != 0);
  }
  return result;
}

void sub_1000018C8(id a1)
{
}

uint64_t isValidNSNumber(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

BOOL isValidNSString(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 length] != 0;

  return v2;
}

uint64_t isValidNSDictionary(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t isValidNSArray(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t isValidNSData(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

id NSNumberToBool(void *a1)
{
  id v1 = a1;
  if (isValidNSNumber(v1)) {
    id v2 = [v1 BOOLValue];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id NSNumberToULongLong(void *a1)
{
  id v1 = a1;
  if (isValidNSNumber(v1)) {
    id v2 = [v1 unsignedLongLongValue];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

__CFString *NSStringOrEmpty(void *a1)
{
  id v1 = a1;
  if (isValidNSString(v1)) {
    id v2 = v1;
  }
  else {
    id v2 = &stru_100008530;
  }
  v3 = v2;

  return v3;
}

BOOL isStringValidUUID(void *a1)
{
  id v1 = a1;
  if (isValidNSString(v1))
  {
    id v2 = [objc_alloc((Class)NSUUID) initWithUUIDString:v1];
    BOOL v3 = v2 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t isOptionalString(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isOptionalArray(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isOptionalDict(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isOptionalData(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isOptionalNumber(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isEqualOrBothNil(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return (uint64_t)[(id)a1 isEqual:a2];
  }
  else {
    return 1;
  }
}

id base64Encode(uint64_t a1, uint64_t a2)
{
  id v2 = +[NSString stringWithFormat:@"%s:%d", a1, a2];
  BOOL v3 = [v2 dataUsingEncoding:4];
  v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

id SKGetOSLog()
{
  if (qword_10000DBD0 != -1) {
    dispatch_once(&qword_10000DBD0, &stru_1000082E8);
  }
  if (byte_10000DBD8) {
    v0 = (void **)&off_10000D908;
  }
  else {
    v0 = (void **)&off_10000D900;
  }
  id v1 = *v0;

  return v1;
}

void sub_100001EA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.storagekit", "general");
  id v2 = off_10000D900;
  off_10000D900 = v1;

  off_10000D908 = os_log_create("com.apple.storagekit", "storagekit-install");

  _objc_release_x1();
}

void SKLogSetLogsToConsole()
{
  v0 = SKGetOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "SKLogSetLogsToConsole/Std is deprecated. Please remove this call", v1, 2u);
  }
}

void SKLogSetLogsToStd()
{
  v0 = SKGetOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "SKLogSetLogsToStd is deprecated. Please remove this call", v1, 2u);
  }
}

uint64_t SKLogSetLogsToSys(uint64_t result)
{
  byte_10000DBD8 = result;
  return result;
}

void SKLogArrayRedacted(os_log_type_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = SKGetOSLog();
  if (os_log_type_enabled(v6, a1))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, a1, "%s", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v13 = SKGetOSLog();
        if (os_log_type_enabled(v13, a1))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, a1, "%@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

void SKLogSetRedacted(os_log_type_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = SKGetOSLog();
  if (os_log_type_enabled(v6, a1))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, a1, "%s", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v13 = SKGetOSLog();
        if (os_log_type_enabled(v13, a1))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, a1, "%@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  BOOL v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id commaSeparatedDiskListFromArray(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableString);
  if ([v1 count])
  {
    BOOL v3 = 0;
    do
    {
      v4 = [v1 objectAtIndex:v3];
      id v5 = [v4 volumeName];

      if (v5) {
        [v4 volumeName];
      }
      else {
      v6 = [v4 diskIdentifier];
      }
      [v2 appendString:v6];

      if (v3 != (char *)[v1 count] - 1) {
        [v2 appendString:@", "];
      }
      if (v3 == (char *)[v1 count] - 2) {
        [v2 appendString:@"and "];
      }

      ++v3;
    }
    while ([v1 count] > v3);
  }

  return v2;
}

void sub_1000026D8(id a1)
{
  id v1 = +[NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/StorageKit.framework"];
  uint64_t v2 = +[NSBundle bundleWithURL:v1];
  BOOL v3 = (void *)qword_10000DBE0;
  qword_10000DBE0 = v2;

  if (!qword_10000DBE0)
  {
    v4 = SKGetOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      v6 = "+[SKError frameworkBundle]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s: FATAL ERROR: Failed to get the NSBundle of StorageKit framework", (uint8_t *)&v5, 0xCu);
    }
  }
}

id sub_100003110(void *a1)
{
  if (a1)
  {
    NSErrorUserInfoKey v4 = NSDebugDescriptionErrorKey;
    int v5 = a1;
    id v1 = a1;
    uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_100003730(id a1)
{
  qword_10000DBF0 = [@"\n" dataUsingEncoding:4];

  _objc_release_x1();
}

void sub_100003AE4(id a1)
{
  qword_10000DC00 = [@"<plist" dataUsingEncoding:4];

  _objc_release_x1();
}

void sub_100003B7C(id a1)
{
  qword_10000DC10 = [@"</plist>" dataUsingEncoding:4];

  _objc_release_x1();
}

void sub_100004818(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(SKTask *)a2 task];
  [v4 launch];
}

BOOL sub_10000485C(id a1, SKTask *a2, NSDictionary *a3)
{
  BOOL v3 = [(SKTask *)a2 task];
  unsigned __int8 v4 = [v3 isRunning];

  return v4;
}

void sub_100004898(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v12 = a2;
  unsigned __int8 v4 = [(SKTask *)v12 stdoutParser];

  if (v4)
  {
    int v5 = [(SKTask *)v12 stdoutParser];
    v6 = [(SKTask *)v12 stdoutHandle];
    id v7 = [v6 readDataUpToLength:4096 error:0];
    [v5 parseData:v7];
  }
  id v8 = [(SKTask *)v12 stderrParser];

  if (v8)
  {
    id v9 = [(SKTask *)v12 stderrParser];
    uint64_t v10 = [(SKTask *)v12 stderrHandle];
    v11 = [v10 readDataUpToLength:4096 error:0];
    [v9 parseData:v11];
  }
}

BOOL sub_1000049A4(id a1, SKTask *a2, NSDictionary *a3)
{
  BOOL v3 = [(SKTask *)a2 task];
  unsigned __int8 v4 = [v3 isRunning];

  return v4;
}

void sub_1000049E0(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(SKTask *)a2 task];
  [v4 waitUntilExit];
}

void sub_100004A24(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v12 = a2;
  id v4 = [(SKTask *)v12 stderrParser];

  if (v4)
  {
    int v5 = [(SKTask *)v12 stdoutParser];
    v6 = [(SKTask *)v12 stdoutHandle];
    id v7 = [v6 readDataToEndOfFile];
    [v5 parseData:v7];
  }
  id v8 = [(SKTask *)v12 stderrParser];

  if (v8)
  {
    id v9 = [(SKTask *)v12 stderrParser];
    uint64_t v10 = [(SKTask *)v12 stderrHandle];
    v11 = [v10 readDataToEndOfFile];
    [v9 parseData:v11];
  }
}

BOOL sub_100004B20(id a1, SKTask *a2, NSDictionary *a3)
{
  return ![(SKTask *)a2 endedSuccessfully];
}

void sub_100004FB8(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000506C;
  v5[3] = &unk_1000084C8;
  id v6 = a2;
  BOOL v3 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = v6;
  dispatch_async(v3, v5);
}

id sub_10000506C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) length];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v3 = *(void **)(a1 + 40);
    return [v3 sendStdout:v4];
  }
  return result;
}

void sub_1000050B8(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000516C;
  v5[3] = &unk_1000084C8;
  id v6 = a2;
  BOOL v3 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = v6;
  dispatch_async(v3, v5);
}

id sub_10000516C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) length];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v3 = *(void **)(a1 + 40);
    return [v3 sendStderr:v4];
  }
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return [a1 callback];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_diskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 diskIdentifier];
}

id objc_msgSend_endedSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 endedSuccessfully];
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReading];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return [a1 launch];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineData(void *a1, const char *a2, ...)
{
  return [a1 lineData];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return [a1 pipe];
}

id objc_msgSend_plistEndTag(void *a1, const char *a2, ...)
{
  return [a1 plistEndTag];
}

id objc_msgSend_plistStartTag(void *a1, const char *a2, ...)
{
  return [a1 plistStartTag];
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 readDataToEndOfFile];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_standardError(void *a1, const char *a2, ...)
{
  return [a1 standardError];
}

id objc_msgSend_standardOutput(void *a1, const char *a2, ...)
{
  return [a1 standardOutput];
}

id objc_msgSend_startRange(void *a1, const char *a2, ...)
{
  return [a1 startRange];
}

id objc_msgSend_stderrHandle(void *a1, const char *a2, ...)
{
  return [a1 stderrHandle];
}

id objc_msgSend_stderrParser(void *a1, const char *a2, ...)
{
  return [a1 stderrParser];
}

id objc_msgSend_stdoutHandle(void *a1, const char *a2, ...)
{
  return [a1 stdoutHandle];
}

id objc_msgSend_stdoutParser(void *a1, const char *a2, ...)
{
  return [a1 stdoutParser];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return [a1 tasks];
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return [a1 terminationStatus];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_volumeName(void *a1, const char *a2, ...)
{
  return [a1 volumeName];
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return [a1 waitUntilExit];
}

id objc_msgSend_waitWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitWithError:");
}