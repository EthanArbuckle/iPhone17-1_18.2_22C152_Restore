int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  NSObject *v4;
  ICDataStoreServer *v5;

  v4 = os_log_create("com.apple.notes", "DataStoreServer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100002B1C(v4);
  }

  v5 = objc_alloc_init(ICDataStoreServer);
  [(ICDataStoreServer *)v5 startListening];

  return 0;
}

void sub_100002328(id a1)
{
  v1 = +[ICPaths applicationDocumentsURL];
  v2 = [v1 URLByAppendingPathComponent:@"tmp" isDirectory:1];
  if (v1)
  {
    id v3 = [v1 path];
    int v4 = setenv("HOME", (const char *)[v3 fileSystemRepresentation], 1);

    os_log_t v5 = os_log_create("com.apple.notes", "DataStoreServer");
    v6 = v5;
    if (v4)
    {
      v6 = v5;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100002DF4();
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      sub_100002D80();
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "DataStoreServer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100002D40();
    }
  }

  if (v2)
  {
    v7 = +[NSFileManager defaultManager];
    id v16 = 0;
    unsigned __int8 v8 = [v7 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v9 = v16;

    if ((v8 & 1) == 0)
    {
      v10 = os_log_create("com.apple.notes", "DataStoreServer");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100002CD8();
      }
    }
    id v11 = [v2 path];
    int v12 = setenv("TMPDIR", (const char *)[v11 fileSystemRepresentation], 1);

    os_log_t v13 = os_log_create("com.apple.notes", "DataStoreServer");
    os_log_t v14 = v13;
    if (v12)
    {
      v15 = v13;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100002C54();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      sub_100002BE0();
    }
  }
  else
  {
    id v9 = 0;
  }
}

void sub_100002938(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002970(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002998(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100002B1C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Starting data store service", v1, 2u);
}

void sub_100002B60()
{
  sub_10000298C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "storeURL is nil", v1, 2u);
}

void sub_100002BA0()
{
  sub_10000298C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Starting data store server", v1, 2u);
}

void sub_100002BE0()
{
  sub_10000292C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "setenv TMPDIR succeeded: %@", v1, 0xCu);
}

void sub_100002C54()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100002958();
  sub_100002998((void *)&_mh_execute_header, v1, v2, "setenv TMPDIR %@ failed because %s", v3, v4, v5, v6, v7);
}

void sub_100002CD8()
{
  sub_10000292C();
  sub_100002970((void *)&_mh_execute_header, v0, v1, "Error creating temporary directory SQL: %@", v2, v3, v4, v5, v6);
}

void sub_100002D40()
{
  sub_10000298C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Couldn't get group container URL, not setting HOME or TMPDIR", v1, 2u);
}

void sub_100002D80()
{
  sub_10000292C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "setenv HOME succeeded: %@", v1, 0xCu);
}

void sub_100002DF4()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100002958();
  sub_100002998((void *)&_mh_execute_header, v1, v2, "setenv HOME %@ failed because %s", v3, v4, v5, v6, v7);
}

void sub_100002E78()
{
  sub_10000292C();
  sub_100002970((void *)&_mh_execute_header, v0, v1, "Error getting metadata for store: %@", v2, v3, v4, v5, v6);
}

void sub_100002EE0()
{
  sub_10000298C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Loaded persistent store in data store", v1, 2u);
}

void sub_100002F20()
{
  sub_10000292C();
  sub_100002970((void *)&_mh_execute_header, v0, v1, "Error loading persistent store in data store: %@", v2, v3, v4, v5, v6);
}

void sub_100002F88()
{
  dlerror();
  sub_10000292C();
  sub_100002938((void *)&_mh_execute_header, v0, v1, "Error loading MapKit framework before CoreData migration: %s", v2, v3, v4, v5, v6);
}

void sub_100003000()
{
  dlerror();
  sub_10000292C();
  sub_100002938((void *)&_mh_execute_header, v0, v1, "Error loading CoreLocation framework before CoreData migration: %s", v2, v3, v4, v5, v6);
}

void sub_100003078()
{
  dlerror();
  sub_10000292C();
  sub_100002938((void *)&_mh_execute_header, v0, v1, "Error loading CloudKit framework before CoreData migration: %s", v2, v3, v4, v5, v6);
}

uint64_t ICGroupContainerIdentifier()
{
  return _ICGroupContainerIdentifier();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void exit(int a1)
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

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_applicationDocumentsURL(void *a1, const char *a2, ...)
{
  return [a1 applicationDocumentsURL];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_entityVersionHashesByName(void *a1, const char *a2, ...)
{
  return [a1 entityVersionHashesByName];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return [a1 managedObjectModel];
}

id objc_msgSend_managedObjectModelURL(void *a1, const char *a2, ...)
{
  return [a1 managedObjectModelURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_persistentStoreURL(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreURL];
}

id objc_msgSend_setupEnvironment(void *a1, const char *a2, ...)
{
  return [a1 setupEnvironment];
}

id objc_msgSend_standardStoreOptions(void *a1, const char *a2, ...)
{
  return [a1 standardStoreOptions];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_storeNeedsMigrationAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeNeedsMigrationAtURL:");
}