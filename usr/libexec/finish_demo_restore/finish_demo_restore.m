void sub_100001B0C(id a1)
{
  uint64_t vars8;

  qword_10000C730 = objc_alloc_init(MSDLogModel);

  _objc_release_x1();
}

void sub_100001E74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002268(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002278(uint64_t a1)
{
}

void sub_100002280(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v14 = [*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2];
  v6 = [*(id *)(a1 + 40) description];
  NSLog(@"Checking existing log file (full path) %@ against %@", v14, v6);

  uint64_t v7 = [*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
  id v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == (id)-1)
  {
    v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
    v13 = [v12 description];
    NSLog(@"Removing %@ whose creation date is %@.", v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }
  *a4 = 0;
}

void sub_100002598(id a1)
{
  qword_10000C740 = objc_alloc_init(MSDDemoVolumeManager);

  _objc_release_x1();
}

id sub_100003470(void *a1)
{
  id v1 = a1;
  v2 = +[NSFileManager defaultManager];
  id v3 = [v2 fileExistsAtPath:v1];

  return v3;
}

uint64_t start()
{
  if (sub_100003470(@"/private/var/demo_bundle"))
  {
    v0 = off_100008298;
LABEL_5:
    id v1 = [(__objc2_class *)*v0 sharedInstance];
    [v1 finishInstallContent];

    return 0;
  }
  if (sub_100003470(@"/private/var/demo_backup"))
  {
    v0 = &off_1000082A0;
    goto LABEL_5;
  }
  return 0;
}

void sub_10000358C(id a1)
{
  qword_10000C750 = objc_alloc_init(FDRContentInstaller);

  _objc_release_x1();
}

void sub_100003CD4(id a1)
{
  qword_10000C760 = objc_alloc_init(MSDContentInstaller);

  _objc_release_x1();
}

void sub_100004BF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004C1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004C2C(uint64_t a1)
{
}

void sub_100004C34(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  v9 = +[MSDLogModel sharedInstance];
  [v9 logMessage:1, @"[INF]", @"%s - intermediatePath:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) prefix message];

  if ([*(id *)(a1 + 32) fileExistsAtPath:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)])return; {
  v10 = [@"/private/var/demo_backup/backup" stringByAppendingPathComponent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  id v11 = *(void **)(a1 + 32);
  id v24 = 0;
  v12 = [v11 attributesOfItemAtPath:v10 error:&v24];
  id v13 = v24;
  if (!v12)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    v20 = +[MSDLogModel sharedInstance];
    v22 = [v13 localizedDescription];
    [v20 logMessage:1, @"[INF]", @"%s - Failed to read attributes of folder:  %@ - Error:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", v10, v22 prefix message];

    goto LABEL_8;
  }
  id v14 = [v12 fileType];
  unsigned int v15 = [v14 isEqualToString:NSFileTypeDirectory];

  if (!v15)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    v20 = +[MSDLogModel sharedInstance];
    [v20 logMessage:1, @"[INF]", @"%s - Intermediate path:  %@ must be folder.", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) prefix message];
    goto LABEL_8;
  }
  v16 = +[MSDLogModel sharedInstance];
  [v16 logMessage:1, @"[INF]", @"%s - Creating directory:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) prefix message];

  v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v23 = v13;
  LOBYTE(v16) = [v17 createDirectoryAtPath:v18 withIntermediateDirectories:0 attributes:v12 error:&v23];
  id v19 = v23;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)v16;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v20 = +[MSDLogModel sharedInstance];
    v21 = [v19 localizedDescription];
    [v20 logMessage:1, @"[INF]", @"%s - Failed to create directory:  %@ - Error:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", v21 prefix message];

    id v13 = v19;
LABEL_8:

    id v19 = v13;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return _NSHomeDirectoryForUser(userName);
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return _acl_get_entry(acl, entry_id, entry_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return _acl_get_file(path_p, type);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return _acl_get_flag_np(flagset_d, flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return _acl_get_flagset_np(obj_p, flagset_p);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return _getmntinfo_r_np(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return _mount(a1, a2, a3, a4);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return _pthread_threadid_np(a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_finishInstallContent(void *a1, const char *a2, ...)
{
  return [a1 finishInstallContent];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mountDemoVolume(void *a1, const char *a2, ...)
{
  return [a1 mountDemoVolume];
}

id objc_msgSend_moveDataFromShelterToFinal(void *a1, const char *a2, ...)
{
  return [a1 moveDataFromShelterToFinal];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_userHomePath(void *a1, const char *a2, ...)
{
  return [a1 userHomePath];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}