void sub_100002604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000261C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100002AD8;
  v25 = sub_100002AE8;
  id v26 = 0;
  v6 = +[NSString stringWithFormat:@"identifier == %@", v4];
  v27[0] = @"identifier";
  v27[1] = @"title";
  v27[2] = @"contributors";
  v27[3] = @"contentType";
  v27[4] = @"thumbnailURL";
  v27[5] = @"thumbnailData";
  v27[6] = @"contentType";
  v27[7] = @"contentURL";
  v27[8] = @"fileSize";
  v27[9] = @"com_apple_iBooks_storeURL";
  v27[10] = @"com_apple_iBooks_localFileURL";
  v7 = +[NSArray arrayWithObjects:v27 count:11];
  id v8 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v6 attributes:v7];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100002AF0;
  v19[3] = &unk_100004270;
  id v9 = v5;
  id v20 = v9;
  [v8 setFoundItemsHandler:v19];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100002AFC;
  v15[3] = &unk_100004298;
  id v11 = v9;
  id v16 = v11;
  v18 = &v21;
  v12 = v10;
  v17 = v12;
  [v8 setCompletionHandler:v15];
  [v8 start];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v13 = [(id)v22[5] attributeSet];

  _Block_object_dispose(&v21, 8);

  return v13;
}

void sub_100002908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100002A40()
{
  if (qword_100008248 != -1) {
    dispatch_once(&qword_100008248, &stru_100004248);
  }
  v0 = (void *)qword_100008240;

  return v0;
}

void sub_100002A94(id a1)
{
  qword_100008240 = (uint64_t)os_log_create("com.apple.iBooks", "Spotlight Extension");

  _objc_release_x1();
}

uint64_t sub_100002AD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002AE8(uint64_t a1)
{
}

id sub_100002AF0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

intptr_t sub_100002AFC(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (![*(id *)(a1 + 32) count] || (unint64_t)objc_msgSend(*v2, "count") >= 2)
  {
    id v3 = sub_100002A40();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100002FF0(v2, v3);
    }
  }
  if (![*v2 count]) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  uint64_t v4 = [*(id *)(a1 + 32) firstObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if ((unint64_t)[*(id *)(a1 + 32) count] < 2) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *v2;
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v7) {
    goto LABEL_26;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v23;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      v12 = [v11 attributeSet];
      v13 = [v12 contentType];
      if ([v13 length]) {
        goto LABEL_24;
      }
      uint64_t v14 = [v12 attributeForKey:@"com_apple_iBooks_storeURL"];
      if (v14)
      {
        v15 = (void *)v14;
LABEL_23:

LABEL_24:
LABEL_25:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);

        goto LABEL_26;
      }
      v15 = [v12 attributeForKey:@"com_apple_iBooks_localFileURL"];
      if (v15) {
        goto LABEL_23;
      }
      id v16 = [v12 contentURL];
      if (v16)
      {

        goto LABEL_23;
      }
      v17 = [v12 fileSize];
      [v17 doubleValue];
      double v19 = v18;

      if (v19 > 0.0) {
        goto LABEL_25;
      }
    }
    id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_26:

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100002D64(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100002DDC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100002DFC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Index extension wants to reindex everything. searchableIndex: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100002E74()
{
  sub_100002DC4();
  sub_100002DDC((void *)&_mh_execute_header, v0, v1, "Index extension wants to reindex. searchableIndex: %@, identifiers: %@");
}

void sub_100002EDC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Requesting URL but no URL is available.", v1, 2u);
}

void sub_100002F20()
{
  sub_100002DC4();
  sub_100002DDC((void *)&_mh_execute_header, v0, v1, "Asked for data for %@ with type %@");
}

void sub_100002F88()
{
  sub_100002DC4();
  sub_100002DDC((void *)&_mh_execute_header, v0, v1, "Asked for file URL for %@ with type %@");
}

void sub_100002FF0(id *a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*a1 count]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "unexpected item count found for %@", (uint8_t *)&v4, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_retainAutoreleaseReturnValue(id a1)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return [a1 attributeSet];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_contentURL(void *a1, const char *a2, ...)
{
  return [a1 contentURL];
}

id objc_msgSend_contributors(void *a1, const char *a2, ...)
{
  return [a1 contributors];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return [a1 preferredFilenameExtension];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}