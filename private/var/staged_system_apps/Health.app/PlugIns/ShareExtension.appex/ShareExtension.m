void sub_100004424(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t vars8;

  v6 = a2;
  v5 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    [*(id *)(a1 + 32) _extractZipContent:v6];
  }
  else {
    [*(id *)(a1 + 32) _logError:v5 message:@"Failed to deliver zip contents to share extension"];
  }
  [*(id *)(a1 + 32) _shareProviderFinished];
}

void sub_1000044C8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    [*(id *)(a1 + 32) _prepareXMLData:v6];
  }
  else {
    [*(id *)(a1 + 32) _logError:v5 message:@"Failed to deliver XML content to share extension"];
  }
  [*(id *)(a1 + 32) _shareProviderFinished];
}

void sub_10000466C(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 pathname];
  v4 = [v3 lowercaseString];
  unsigned int v5 = [v4 hasSuffix:@".xml"];

  id v6 = v10;
  if (v5)
  {
    v7 = [v10 dataWithMaxSizeBytes:4999999 error:0];
    unsigned __int8 v8 = [*(id *)(a1 + 32) _containsPasswordProtectedData:v7];
    v9 = *(void **)(a1 + 32);
    if (v8) {
      [v9 _passwordProtectedZip];
    }
    else {
      [v9 _prepareXMLData:v7];
    }

    id v6 = v10;
  }
}

id sub_100004EC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postDocumentPreview];
}

id sub_100004EC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissShareExtension];
}

id sub_100004ED0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissShareExtension];
}

id sub_100004ED8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissShareExtension];
}

void sub_1000051E8(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) view];
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v3[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v3[1] = v2;
  v3[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v1 setTransform:v3];
}

void sub_10000531C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000053C0;
  block[3] = &unk_1000082A8;
  char v9 = a2;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000053C0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      [v3 _logError:v4 message:@"Failed to save documents in health kit"];
      id v5 = *(void **)(a1 + 32);
      id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
      v7 = [v6 localizedStringForKey:@"CDA_SHARE_ALERT_TITLE" value:&stru_100008528 table:@"HealthUI-Localizable"];
      id v8 = [*(id *)(a1 + 40) localizedDescription];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100005510;
      v9[3] = &unk_100008280;
      v9[4] = *(void *)(a1 + 32);
      [v5 _importAlertWithTitle:v7 message:v8 doneHandler:v9];

      return;
    }
    [v3 _logError:0 message:@"Failed to save documents in health kit -- no error provided"];
  }
  long long v2 = *(void **)(a1 + 32);

  [v2 _dismissShareExtension];
}

id sub_100005510(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissShareExtension];
}

void sub_1000055DC(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) view];
  [v2 frame];
  CGAffineTransformMakeTranslation(&v6, 0.0, v3);
  uint64_t v4 = [*(id *)(a1 + 32) view];
  CGAffineTransform v5 = v6;
  [v4 setTransform:&v5];
}

void sub_100005658(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) extensionContext];
  [v1 completeRequestReturningItems:0 completionHandler:0];
}

uint64_t sub_1000057FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100005930(uint64_t result)
{
  return result;
}

uint64_t *sub_1000059C0(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 24);
  uint64_t result = *(uint64_t **)(a1 + 32);
  if (result[3] <= 0) {
    return (uint64_t *)[result _allShareProvidersFinished];
  }
  return result;
}

id sub_100005A88(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

uint64_t sub_100005B10(uint64_t result)
{
  return result;
}

uint64_t sub_100005BA0(uint64_t result)
{
  return result;
}

id sub_100005DDC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) startAnimating];
}

void sub_100005E38(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error enumerating contents of %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100005EC0(uint64_t a1, void *a2, void *a3)
{
  __int16 v5 = a2;
  uint64_t v6 = [a3 localizedDescription];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Share extension problem: %@: %@", (uint8_t *)&v7, 0x16u);
}

void sub_100005F80(void *a1, void *a2)
{
  int v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Share extension problem: %@", (uint8_t *)&v5, 0xCu);
}

void sub_100006028(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Share extension problem: %@", (uint8_t *)&v2, 0xCu);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

uint64_t HKHealthTintColor()
{
  return _HKHealthTintColor();
}

uint64_t HKLocalizedStringForNumberWithTemplate()
{
  return _HKLocalizedStringForNumberWithTemplate();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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
  return [super a2];
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__dismissShareExtension(void *a1, const char *a2, ...)
{
  return [a1 _dismissShareExtension];
}

id objc_msgSend__fetchShareData(void *a1, const char *a2, ...)
{
  return [a1 _fetchShareData];
}

id objc_msgSend__incomingDocument(void *a1, const char *a2, ...)
{
  return [a1 _incomingDocument];
}

id objc_msgSend__passwordProtectedZip(void *a1, const char *a2, ...)
{
  return [a1 _passwordProtectedZip];
}

id objc_msgSend__shareProviderFinished(void *a1, const char *a2, ...)
{
  return [a1 _shareProviderFinished];
}

id objc_msgSend__shareProviderLoading(void *a1, const char *a2, ...)
{
  return [a1 _shareProviderLoading];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultSource(void *a1, const char *a2, ...)
{
  return [a1 defaultSource];
}

id objc_msgSend_enabledSamples(void *a1, const char *a2, ...)
{
  return [a1 enabledSamples];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathname(void *a1, const char *a2, ...)
{
  return [a1 pathname];
}

id objc_msgSend_registeredTypeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 registeredTypeIdentifiers];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}