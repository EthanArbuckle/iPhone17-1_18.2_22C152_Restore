uint64_t sub_10000351C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

void sub_100003530(uint64_t a1, void *a2)
{
  uint64_t v3 = WFHandoffSourceKey;
  id v4 = a2;
  uint64_t v5 = [v4 objectForKey:v3];
  v6 = (void *)v5;
  v7 = (void *)WFWorkflowRunSourceHandoff;
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = [v4 objectForKey:WFHandoffWorkflowControllerStateKey];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003F80(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 parameters];
  id v4 = [v3 objectForKey:@"type"];
  uint64_t v5 = [v3 objectForKey:@"webpageURL"];
  v6 = [v3 objectForKey:@"userInfoURL"];
  v7 = +[NSURL URLWithString:v6];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000040C8;
  v12[3] = &unk_100008360;
  id v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v9;
  id v13 = v4;
  id v10 = v5;
  id v11 = v4;
  [v8 deserializeUserInfoAtURL:v7 completionHandler:v12];
}

uint64_t sub_1000040C8(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

id sub_10000421C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithOutput:0 error:*(void *)(a1 + 40) cancelled:*(unsigned __int8 *)(a1 + 48)];
}

void sub_1000044C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000044E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (([a3 conformsToProtocol:&OBJC_PROTOCOL___NSSecureCoding] & 1) == 0) {
    [*(id *)(a1 + 32) removeObjectForKey:v5];
  }
}

id sub_100004548(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100004574(uint64_t a1)
{
}

void sub_10000457C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000047B8;
    v9[3] = &unk_100008538;
    dispatch_semaphore_t v10 = v3;
    id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
    v6 = v3;
    v5(v4, v9);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void sub_100004660(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[WFBackgroundAssertion backgroundAssertionWithName:@"is.workflow.my.app.actionextension.cancelcleanup" expirationHandler:0];
  id v5 = [*(id *)(a1 + 32) extensionContext];
  [v5 cancelRequestWithError:*(void *)(a1 + 40)];

  uint64_t v6 = *(void *)(a1 + 48);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004764;
  v10[3] = &unk_100008588;
  id v11 = v4;
  id v12 = v3;
  uint64_t v7 = *(void (**)(uint64_t, void *))(v6 + 16);
  id v8 = v3;
  id v9 = v4;
  v7(v6, v10);
}

uint64_t sub_100004764(uint64_t a1)
{
  [*(id *)(a1 + 32) end];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

intptr_t sub_1000047B8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000047C0(id a1, id a2)
{
  if (a2) {
    (*((void (**)(id))a2 + 2))(a2);
  }
}

NSExtensionItem *__cdecl sub_100004868(id a1, WFContentItem *a2, unint64_t a3)
{
  id v3 = a2;
  NSClassFromString(@"WFEvernoteContentItem");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (NSClassFromString(@"WFDropboxItemContentItem"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(WFContentItem *)v3 minimalExtensionItem];
  }

  return (NSExtensionItem *)v4;
}

void sub_1000049E8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v18 = v6;
  if (v6)
  {
    id v8 = [v7 runnerClient];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) runnerClient];
      [v9 stop];
    }
    id v10 = objc_alloc((Class)WFActionExtensionWorkflowRunnerClient);
    id v11 = [*(id *)(a1 + 40) workflowID];
    id v12 = [v10 initWithWorkflowIdentifier:v11 input:v18 javaScriptRunners:*(void *)(a1 + 48)];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 24);
    *(void *)(v13 + 24) = v12;

    id v15 = *(void **)(a1 + 32);
    v16 = [v15 runnerClient];
    [v16 setDelegate:v15];

    v17 = [*(id *)(a1 + 32) runnerClient];
    [v17 start];
  }
  else
  {
    [v7 finishWithOutput:0 error:a4 cancelled:0];
  }
}

void sub_100004DC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100004DE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addEntriesFromDictionary:*(void *)(*((void *)&v13 + 1) + 8 * (void)v9) v13];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = [WeakRetained contentItems];
  id v12 = +[WFContentCollection collectionWithItems:v11];

  [WeakRetained runWorkflow:*(void *)(a1 + 32) withInput:v12 javaScriptRunners:v4];
}

void sub_100004F54(id a1, WFNSExtensionItemContentItem *a2, unint64_t a3, id a4)
{
}

id sub_100005488(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_1000054F4();
  id v3 = [v2 localizedStringForKey:v1 value:v1 table:0];

  return v3;
}

id sub_1000054F4()
{
  if (qword_10000CC88 != -1) {
    dispatch_once(&qword_10000CC88, &stru_100008618);
  }
  v0 = (void *)qword_10000CC80;

  return v0;
}

void sub_100005548(id a1)
{
  memset(&v5, 0, sizeof(v5));
  if (dladdr(sub_1000054F4, &v5) && v5.dli_fname)
  {
    id v1 = [objc_alloc((Class)NSURL) initFileURLWithFileSystemRepresentation:v5.dli_fname isDirectory:0 relativeToURL:0];
    uint64_t v2 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    uint64_t v3 = +[NSBundle bundleWithURL:v2];
    uint64_t v4 = (void *)qword_10000CC80;
    qword_10000CC80 = v3;
  }
  else
  {
    id v1 = getWFGeneralLogObject();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = "WFCurrentBundle_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s WFLocalizedString failed to locate current bundle", buf, 0xCu);
    }
  }
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

uint64_t getWFGeneralLogObject()
{
  return _getWFGeneralLogObject();
}

uint64_t getWFWorkflowExecutionLogObject()
{
  return _getWFWorkflowExecutionLogObject();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retainAutoreleaseReturnValue(id a1)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend__extensionHostAuditToken(void *a1, const char *a2, ...)
{
  return [a1 _extensionHostAuditToken];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_associatedAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 associatedAppBundleIdentifier];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_attributedContentText(void *a1, const char *a2, ...)
{
  return [a1 attributedContentText];
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return [a1 attributedTitle];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contentItems(void *a1, const char *a2, ...)
{
  return [a1 contentItems];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultDatabase(void *a1, const char *a2, ...)
{
  return [a1 defaultDatabase];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_effectiveInputClasses(void *a1, const char *a2, ...)
{
  return [a1 effectiveInputClasses];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_mappedData(void *a1, const char *a2, ...)
{
  return [a1 mappedData];
}

id objc_msgSend_minimalExtensionItem(void *a1, const char *a2, ...)
{
  return [a1 minimalExtensionItem];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_registeredTypeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 registeredTypeIdentifiers];
}

id objc_msgSend_runnerClient(void *a1, const char *a2, ...)
{
  return [a1 runnerClient];
}

id objc_msgSend_sharedAppGroupDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 sharedAppGroupDirectoryURL];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_systemShortcutsUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 systemShortcutsUserDefaults];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_workflowID(void *a1, const char *a2, ...)
{
  return [a1 workflowID];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}