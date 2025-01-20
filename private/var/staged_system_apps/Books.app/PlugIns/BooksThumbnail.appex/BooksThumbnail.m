id BooksThumbsLog(void)
{
  void *v0;
  uint64_t vars8;

  if (qword_1000081D8 != -1) {
    dispatch_once(&qword_1000081D8, &stru_1000041B0);
  }
  v0 = (void *)qword_1000081D0;

  return v0;
}

void sub_100002764(id a1)
{
  qword_1000081D0 = (uint64_t)os_log_create("com.apple.iBooks", "BooksThumbs");

  _objc_release_x1();
}

void sub_100002C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  _Unwind_Resume(a1);
}

id sub_100002D5C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = [v4 URLByAppendingPathComponent:@"iTunesArtwork" isDirectory:0];
  v6 = +[NSData dataWithContentsOfURL:v5];
  if (!v6)
  {
    id v7 = [v4 path];
    v8 = +[BLLibrary defaultBookLibrary];
    v9 = +[NSURL fileURLWithPath:v7];
    v10 = [v8 _perUserBookURLForBookURL:v9];
    v11 = [v10 path];
    id v12 = [v11 mutableCopy];

    if (([v12 hasSuffix:@"/"] & 1) == 0) {
      [v12 appendString:@"/"];
    }
    operator new();
  }

  return v6;
}

void sub_100003090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000316C(uint64_t a1)
{
  return 1;
}

void sub_1000031B4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000031D4()
{
  sub_10000319C();
  sub_1000031B4((void *)&_mh_execute_header, v0, v1, "Error getting cover image from image data for URL: %@ Error: %@");
}

void sub_10000323C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid src or dst size passed in", v1, 2u);
}

void sub_100003280()
{
  sub_10000319C();
  sub_1000031B4((void *)&_mh_execute_header, v0, v1, "Unable to create '%@' due to %@");
}

void sub_1000032E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Encountered an error while trying to get cover image data: %{public}@", (uint8_t *)&v2, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void ITEpubFolder::ITEpubFolder(ITEpubFolder *this, const __CFString *a2, const __CFString *a3)
{
}

uint64_t ITRetain::release(ITRetain *this)
{
  return ITRetain::release(this);
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultBookLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultBookLibrary];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_maximumSize(void *a1, const char *a2, ...)
{
  return [a1 maximumSize];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_purchasesRepositoryPath(void *a1, const char *a2, ...)
{
  return [a1 purchasesRepositoryPath];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}