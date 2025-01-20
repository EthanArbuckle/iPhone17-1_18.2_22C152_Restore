id sub_100004530(uint64_t a1, int a2)
{
  void *v3;
  const CFBooleanRef *v4;
  CFBooleanRef v6;

  v3 = *(void **)(a1 + 32);
  v4 = &kCFBooleanTrue;
  if (!a2) {
    v4 = &kCFBooleanFalse;
  }
  v6 = *v4;
  [v3 callWithArguments:[NSArray arrayWithObjects:count:&v6, 1]];
  return [*(id *)(a1 + 32) setThisObject:0];
}

uint64_t sub_1000045D4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(@"Failed to enable cloud library with error: %@", a2);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

id sub_1000047AC(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = &kCFBooleanTrue;
  if (!a2) {
    v4 = &kCFBooleanFalse;
  }
  CFBooleanRef v6 = *v4;
  [v3 callWithArguments:[NSArray arrayWithObjects:count:&v6, 1]];
  return [*(id *)(a1 + 32) setThisObject:0];
}

uint64_t sub_100004850(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(@"Failed to disable cloud library with error: %@", a2);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100004B58(id a1)
{
  +[MusicSubscriptionStatusHacks setupSubscriptionStatusHacks];
  v1 = objc_alloc_init(MusicStoreFlowScriptingClientController);
  v2 = (void *)qword_100011BB0;
  qword_100011BB0 = (uint64_t)v1;

  id v4 = objc_alloc_init((Class)SUClientInterface);
  [v4 setClientIdentifier:ISClientIdentifierMusicPlayer];
  v3 = objc_alloc_init(MusicStoreFlowViewControllerFactory);
  [v4 setViewControllerFactory:v3];
  [(id)qword_100011BB0 setClientInterface:v4];
  +[SUClientController setSharedController:qword_100011BB0];
}

void sub_100005728(id a1)
{
  v1 = (objc_class *)objc_opt_class();
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000058EC;
  v17[3] = &unk_10000C460;
  v17[4] = &v18;
  v17[5] = "getStatusWithOptions:statusBlock:";
  v2 = objc_retainBlock(v17);
  v3 = imp_implementationWithBlock(v2);
  InstanceMethod = class_getInstanceMethod(v1, "getStatusWithOptions:statusBlock:");
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  IMP v6 = class_replaceMethod(v1, "getStatusWithOptions:statusBlock:", v3, TypeEncoding);

  v19[3] = (uint64_t)v6;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000059D8;
  v12[3] = &unk_10000C4A8;
  v12[4] = &v13;
  v12[5] = "modifyLastKnownStatusUsingBlock:";
  v7 = objc_retainBlock(v12);
  v8 = imp_implementationWithBlock(v7);
  v9 = class_getInstanceMethod(v1, "modifyLastKnownStatusUsingBlock:");
  v10 = method_getTypeEncoding(v9);
  IMP v11 = class_replaceMethod(v1, "modifyLastKnownStatusUsingBlock:", v8, v10);

  v14[3] = (uint64_t)v11;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v18, 8);
}

void sub_1000058D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000058EC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 objectForKey:SSVSubscriptionStatusOptionIgnoreCache];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    IMP v11 = +[ICMusicSubscriptionStatusController sharedStatusController];
    [v11 invalidateCachedSubscriptionStatusWithCompletionHandler:&stru_10000C438];
  }
  v12 = *(void (**)(id, void, id, id))(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v12) {
    v12(v13, *(void *)(a1 + 40), v7, v8);
  }
}

void sub_1000059D8(uint64_t a1, uint64_t a2)
{
  v2 = *(void (**)(uint64_t, void))(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2) {
    v2(a2, *(void *)(a1 + 40));
  }
  id v3 = +[ICMusicSubscriptionStatusController sharedStatusController];
  [v3 invalidateCachedSubscriptionStatusWithCompletionHandler:&stru_10000C480];
}

void sub_10000607C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006098(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      [WeakRetained _reloadWithCloudServiceSetupURL:v8 forReloadContext:*(void *)(a1 + 32)];
    }
    else
    {
      NSLog(@"Error: Failed to resolve cloud service setup URL for %@. %@", *(void *)(a1 + 40), v5);
      [v7 _didFinishLoadingWithSuccess:0 error:v5];
    }
  }
}

uint64_t sub_100006438(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100006520(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100006A48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100006B38;
      v8[3] = &unk_10000C520;
      id v9 = *(id *)(a1 + 32);
      [v5 enumerateKeysAndObjectsUsingBlock:v8];
    }
  }
}

void sub_100006B38(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = v5;
      id v8 = [v9 lowercaseString];
      [v6 setObject:v7 forKey:v8];
    }
  }
}

id sub_100006BFC(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [*(id *)(a1 + 32) name];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t sub_100006E34(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000742C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007458(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007570;
  v9[3] = &unk_10000C570;
  objc_copyWeak(&v15, a1 + 7);
  id v10 = v6;
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = v5;
  id v14 = a1[6];
  id v7 = v5;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v15);
}

void sub_100007570(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (!v3)
    {
      id v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 48) queryItems];
      id v4 = [v10 _cloudServiceSetupURLForAction:v11 queryItems:v12 bagDictionary:*(void *)(a1 + 56)];

      if (v4)
      {
        id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_9:
        v6();

        goto LABEL_10;
      }
      id v3 = *(void **)(a1 + 32);
    }
    id v4 = v3;
    if (!*(void *)(a1 + 32))
    {
      uint64_t v5 = SSError();

      id v4 = (id)v5;
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  uint64_t v7 = *(void *)(a1 + 64);
  NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
  CFStringRef v14 = @"Unexpected.";
  id v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v9 = +[NSError errorWithDomain:NSCocoaErrorDomain code:0 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v9);

LABEL_10:
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SSError()
{
  return _SSError();
}

uint64_t SUWebScriptNameForSelector2()
{
  return _SUWebScriptNameForSelector2();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_replaceMethod(cls, name, imp, types);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

IMP imp_implementationWithBlock(id block)
{
  return _imp_implementationWithBlock(block);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return _method_getTypeEncoding(m);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLRequestProperties(void *a1, const char *a2, ...)
{
  return [a1 URLRequestProperties];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_applicationVersion(void *a1, const char *a2, ...)
{
  return [a1 applicationVersion];
}

id objc_msgSend_becomeActive(void *a1, const char *a2, ...)
{
  return [a1 becomeActive];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return [a1 clientInterface];
}

id objc_msgSend_cloudServiceSetupURL(void *a1, const char *a2, ...)
{
  return [a1 cloudServiceSetupURL];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyDefaultScriptProperties(void *a1, const char *a2, ...)
{
  return [a1 copyDefaultScriptProperties];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isCloudLibraryEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCloudLibraryEnabled];
}

id objc_msgSend_isSafeExternalURL(void *a1, const char *a2, ...)
{
  return [a1 isSafeExternalURL];
}

id objc_msgSend_isSkLoaded(void *a1, const char *a2, ...)
{
  return [a1 isSkLoaded];
}

id objc_msgSend_isSkLoading(void *a1, const char *a2, ...)
{
  return [a1 isSkLoading];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_referrerURL(void *a1, const char *a2, ...)
{
  return [a1 referrerURL];
}

id objc_msgSend_resignActive(void *a1, const char *a2, ...)
{
  return [a1 resignActive];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serializedUserInfo(void *a1, const char *a2, ...)
{
  return [a1 serializedUserInfo];
}

id objc_msgSend_setupSubscriptionStatusHacks(void *a1, const char *a2, ...)
{
  return [a1 setupSubscriptionStatusHacks];
}

id objc_msgSend_sharedBagLoadingController(void *a1, const char *a2, ...)
{
  return [a1 sharedBagLoadingController];
}

id objc_msgSend_sharedCloudController(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudController];
}

id objc_msgSend_sharedScriptingClientController(void *a1, const char *a2, ...)
{
  return [a1 sharedScriptingClientController];
}

id objc_msgSend_sharedStatusController(void *a1, const char *a2, ...)
{
  return [a1 sharedStatusController];
}

id objc_msgSend_sourceApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceApplicationBundleIdentifier];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_targetsFinanceApplication(void *a1, const char *a2, ...)
{
  return [a1 targetsFinanceApplication];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsPointerArray];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}