uint64_t start()
{
  void *v0;
  SCRSSyncDaemon *v1;
  void *v2;
  void *v3;

  v1 = objc_alloc_init(SCRSSyncDaemon);
  v2 = (void *)qword_100008B48;
  qword_100008B48 = (uint64_t)v1;

  v3 = +[NSRunLoop mainRunLoop];
  [v3 run];

  return 0;
}

void sub_1000018D0(uint64_t a1)
{
  id v3 = +[PHAssetCreationRequest creationRequestForAssetFromScreenshotImage:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"c"];
  [v3 setCreationDate:v2];
}

void sub_10000194C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Finished with success: %d and error: %@", (uint8_t *)v7, 0x12u);
  }
}

void sub_100001D18(uint64_t a1)
{
  id v4 = +[PHAssetCreationRequest creationRequestForAsset];
  v2 = [*(id *)(a1 + 32) URL];
  [v4 addResourceWithType:2 fileURL:v2 options:0];

  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"c"];
  [v4 setCreationDate:v3];
}

void sub_100001DB8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Finished with success: %d and error: %@", (uint8_t *)v7, 0x12u);
  }
  [*(id *)(a1 + 40) unlinkURL];
}

void sub_1000021BC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Did not generate image.", v1, 2u);
}

void sub_100002200(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected message for CSLSSnapshotTypeWatchFace from %@. %@", (uint8_t *)&v3, 0x16u);
}

void sub_100002288(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive screenshot data with error: %@", (uint8_t *)&v2, 0xCu);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int link(const char *a1, const char *a2)
{
  return _link(a1, a2);
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_creationRequestForAsset(void *a1, const char *a2, ...)
{
  return [a1 creationRequestForAsset];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoLibrary];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_unlinkURL(void *a1, const char *a2, ...)
{
  return [a1 unlinkURL];
}