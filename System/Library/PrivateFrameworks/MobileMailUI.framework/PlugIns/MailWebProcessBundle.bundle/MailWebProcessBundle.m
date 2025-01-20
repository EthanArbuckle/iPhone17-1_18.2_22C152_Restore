void sub_1918(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

BOOL sub_214C(id a1, NSURL *a2)
{
  v2 = a2;
  if ([(NSURL *)v2 ef_hasScheme:@"https"]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [(NSURL *)v2 ef_hasScheme:@"http"];
  }

  return v3;
}

void sub_21A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_22D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_2494(id a1)
{
  v1 = +[JSContext currentThis];
  v2 = +[JSContext currentContext];
  unsigned __int8 v3 = +[WKWebProcessPlugInRangeHandle rangeHandleWithJSValue:v1 inContext:v2];
  v4 = [v3 text];

  return (NSString *)v4;
}

void sub_2528(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2970(_Unwind_Exception *a1)
{
  v9 = v5;

  _Unwind_Resume(a1);
}

void sub_2A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2B60(_Unwind_Exception *exception_object)
{
}

void sub_2B7C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) currentJSContext];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

void sub_2BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_2E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_3068(id a1)
{
  v1 = MFLogGeneral();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_3D8C(v1);
  }

  +[NSObject doesNotRecognizeSelector:NSSelectorFromString(@"SIMULATE_CRASH")];
}

void sub_313C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_31A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_320C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_33A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_36C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_37A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_38B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3C44(_Unwind_Exception *a1)
{
  v9 = v6;

  _Unwind_Resume(a1);
}

void sub_3D34(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "MailWebProcess: failed to load resource. Error: %{public}@", buf, 0xCu);
}

void sub_3D8C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "MailWebProcess: Got USR1, simulating crash", v1, 2u);
}

uint64_t MFCreateURLForContentID()
{
  return _MFCreateURLForContentID();
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__remoteObjectRegistry(void *a1, const char *a2, ...)
{
  return [a1 _remoteObjectRegistry];
}

id objc_msgSend__synchronizeGlobalObjectContext(void *a1, const char *a2, ...)
{
  return [a1 _synchronizeGlobalObjectContext];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_additionalMarkup(void *a1, const char *a2, ...)
{
  return [a1 additionalMarkup];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return [a1 contentID];
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return [a1 currentContext];
}

id objc_msgSend_currentJSContext(void *a1, const char *a2, ...)
{
  return [a1 currentJSContext];
}

id objc_msgSend_currentThis(void *a1, const char *a2, ...)
{
  return [a1 currentThis];
}

id objc_msgSend_dictionaryWrappers(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWrappers];
}

id objc_msgSend_didSynchronize(void *a1, const char *a2, ...)
{
  return [a1 didSynchronize];
}

id objc_msgSend_externalConstants(void *a1, const char *a2, ...)
{
  return [a1 externalConstants];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_globalObject(void *a1, const char *a2, ...)
{
  return [a1 globalObject];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isMailPrivacyProtectionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isMailPrivacyProtectionAllowed];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailDelegate(void *a1, const char *a2, ...)
{
  return [a1 mailDelegate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_normalWorld(void *a1, const char *a2, ...)
{
  return [a1 normalWorld];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_remoteContentNoProxySchemePrefix(void *a1, const char *a2, ...)
{
  return [a1 remoteContentNoProxySchemePrefix];
}

id objc_msgSend_remoteContentProxySchemePrefix(void *a1, const char *a2, ...)
{
  return [a1 remoteContentProxySchemePrefix];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_toString(void *a1, const char *a2, ...)
{
  return [a1 toString];
}

id objc_msgSend_webProcessDidCreateBrowserContextControllerLoadDelegate(void *a1, const char *a2, ...)
{
  return [a1 webProcessDidCreateBrowserContextControllerLoadDelegate];
}

id objc_msgSend_webProcessDidFinishLoadForURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webProcessDidFinishLoadForURL:");
}