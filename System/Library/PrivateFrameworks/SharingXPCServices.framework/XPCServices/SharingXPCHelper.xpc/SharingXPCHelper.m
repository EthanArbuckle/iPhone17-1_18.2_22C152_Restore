void sub_100004308(uint64_t a1)
{
  NSObject *v2;

  v2 = sharingXPCHelperLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100008534(a1, v2);
  }
}

void sub_100004354(uint64_t a1)
{
  v2 = sharingXPCHelperLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ interrupted", (uint8_t *)&v4, 0xCu);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = sharingXPCHelperLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SharingXPCHelper main", v7, 2u);
  }

  int v4 = objc_opt_new();
  uint64_t v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

double sub_1000050F8()
{
  v0 = +[UIScreen mainScreen];
  [v0 scale];
  double v2 = v1;

  return v2;
}

void sub_100005BF4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_100005C28(uint64_t a1)
{
}

id sub_100005C30(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 80);
  double v4 = *(double *)(a1 + 88);
  double v5 = *(double *)(a1 + 96);
  double v6 = *(double *)(a1 + 104);
  return objc_msgSend(v2, "drawInRect:", v3, v4, v5, v6);
}

void sub_100006228(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) commandBlock];
  v1[2]();
}

SharingXPCHelperImageItem *sub_100006344(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(void **)(a1 + 32);
  double v5 = [v3 imageTitle];
  double v6 = [v4 _imageTitleData:v5 foregroundColor:*(void *)(a1 + 40)];

  if (v6)
  {
    v7 = [SharingXPCHelperImageItem alloc];
    v8 = [v3 imageTitle];
    v9 = [v3 cacheLookupKey];
    v10 = [(SharingXPCHelperImageItem *)v7 initWithImageTitle:v8 imageData:v6 cacheLookupKey:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1000066A0(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) commandBlock];
  v1[2]();
}

void sub_100006998(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) commandBlock];
  v1[2]();
}

void sub_100006C34(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) commandBlock];
  v1[2]();
}

void sub_100006EC8(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) commandBlock];
  v1[2]();
}

void sub_100007AE8(id a1)
{
  BOOL v1 = objc_opt_class() && objc_opt_class() && objc_opt_class() && objc_opt_class() != 0;
  byte_1000119A8 = v1;
}

void sub_1000084AC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@ shouldAcceptNewConnection: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100008534(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ invalidated", (uint8_t *)&v3, 0xCu);
}

void sub_1000085B0(os_log_t log)
{
  *(_WORD *)BOOL v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "getting security scoped url for downloads directory is not supported on this platform!", v1, 2u);
}

void sub_1000085F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "### CallHandoff: Failed to write thumbnail to URL: %@\n", (uint8_t *)&v2, 0xCu);
}

void sub_10000866C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "CGImgDataForUIActivityTitle: No CGImage on %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000086E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "CGImgDataForUIActivityTitle: SFDataFromCGImage returned nil for %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000875C(os_log_t log)
{
  *(_WORD *)BOOL v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Generating persepective data is currently only supported on native visionOS targets.", v1, 2u);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t NSAppendPrintF()
{
  return _NSAppendPrintF();
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return _NSDecodeNSArrayOfClassIfPresent();
}

uint64_t NSDecodeObjectIfPresent()
{
  return _NSDecodeObjectIfPresent();
}

uint64_t NSDecodeStandardContainerIfPresent()
{
  return _NSDecodeStandardContainerIfPresent();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SFCreateCGImageFromData()
{
  return _SFCreateCGImageFromData();
}

uint64_t SFDataFromCGImage()
{
  return _SFDataFromCGImage();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t share_sheet_log()
{
  return _share_sheet_log();
}

uint64_t sharingXPCHelperLog()
{
  return _sharingXPCHelperLog();
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__updateTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 _updateTraitCollection];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cacheLookupKey(void *a1, const char *a2, ...)
{
  return [a1 cacheLookupKey];
}

id objc_msgSend_commandBlock(void *a1, const char *a2, ...)
{
  return [a1 commandBlock];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contacts(void *a1, const char *a2, ...)
{
  return [a1 contacts];
}

id objc_msgSend_contextSize(void *a1, const char *a2, ...)
{
  return [a1 contextSize];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 currentTraitCollection];
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return [a1 defaultSettings];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_hostTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 hostTraitCollection];
}

id objc_msgSend_iconData(void *a1, const char *a2, ...)
{
  return [a1 iconData];
}

id objc_msgSend_iconIndex(void *a1, const char *a2, ...)
{
  return [a1 iconIndex];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageTitle(void *a1, const char *a2, ...)
{
  return [a1 imageTitle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_perspectiveDataSize(void *a1, const char *a2, ...)
{
  return [a1 perspectiveDataSize];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_silhouetteMonogram(void *a1, const char *a2, ...)
{
  return [a1 silhouetteMonogram];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}