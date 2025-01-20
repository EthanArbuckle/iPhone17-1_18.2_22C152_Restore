void sub_100004B20(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t vars8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [v2 remoteViewControllerProxy];
  [v4 remoteViewControllerDidUpdateVoiceShortcut:v3 error:0];
}

void sub_100004B84(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004C50;
    v6[3] = &unk_100008288;
    id v8 = v4;
    id v7 = v3;
    [v7 generateShortcutRepresentation:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void sub_100004C50(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    id v3 = objc_alloc((Class)INVoiceShortcut);
    id v4 = objc_alloc((Class)NSUUID);
    v5 = [*(id *)(a1 + 32) workflowID];
    id v6 = [v4 initWithUUIDString:v5];
    id v7 = [*(id *)(a1 + 32) name];
    id v8 = [v3 _initWithIdentifier:v6 invocationPhrase:v7 shortcut:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100004EA8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 remoteViewControllerProxy];
  [v4 remoteViewControllerDidCreateVoiceShortcut:v3 error:0];
}

void sub_100005474(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _startAccessingAppBundle];
  id v2 = objc_alloc((Class)WFAddToSiriViewController);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = +[WFDatabase defaultDatabase];
  id v5 = [v2 initWithWorkflow:v3 database:v4];

  [WeakRetained setupWithShortcutViewController:v5];
}

void sub_10000570C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _startAccessingAppBundle];
  uint64_t v3 = [WeakRetained _secureHostApplicationBundleIdentifier];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) shortcutWithActivityBundleIdentifier:v3];
    id v5 = [v4 intent];
    [v5 _setLaunchId:v3];

    id v15 = 0;
    id v6 = [objc_alloc((Class)WFWorkflow) initWithShortcut:v4 error:&v15];
    id v7 = v15;
    if (v6)
    {
      id v8 = objc_alloc((Class)WFAddToSiriViewController);
      id v9 = +[WFDatabase defaultDatabase];
      id v10 = [v8 initWithWorkflow:v6 database:v9];

      [WeakRetained setupWithShortcutViewController:v10];
    }
    else
    {
      v12 = INSiriLogContextIntents;
      if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFShortcutServiceViewController buildForAddingShortcut:]_block_invoke";
        __int16 v19 = 2114;
        uint64_t v20 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Couldn't create shortcut from donation %{public}@", buf, 0x16u);
      }
      INIntentError();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = [WeakRetained remoteViewControllerProxy];
      [v13 remoteViewControllerDidCreateVoiceShortcut:0 error:v10];
    }
  }
  else
  {
    id v4 = +[UIAlertController alertControllerWithTitle:@"Missing application-identifier entitlement." message:@"Make sure to add the application-identifier to the entitlements of your app." preferredStyle:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000059C0;
    v16[3] = &unk_100008210;
    v16[4] = WeakRetained;
    v11 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:v16];
    [v4 addAction:v11];

    [WeakRetained presentViewController:v4 animated:1 completion:0];
  }
}

void sub_1000059C0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) remoteViewControllerProxy];
  [v1 remoteViewControllerDidCancel];
}

uint64_t INIntentError()
{
  return _INIntentError();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return __CFURLAttachSecurityScopeToFileURL();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return [a1 _hostAuditToken];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__secureHostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _secureHostApplicationBundleIdentifier];
}

id objc_msgSend__startAccessingAppBundle(void *a1, const char *a2, ...)
{
  return [a1 _startAccessingAppBundle];
}

id objc_msgSend__stopAccessingAppBundle(void *a1, const char *a2, ...)
{
  return [a1 _stopAccessingAppBundle];
}

id objc_msgSend_associatedAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 associatedAppBundleIdentifier];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_childViewController(void *a1, const char *a2, ...)
{
  return [a1 childViewController];
}

id objc_msgSend_defaultDatabase(void *a1, const char *a2, ...)
{
  return [a1 defaultDatabase];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_reference(void *a1, const char *a2, ...)
{
  return [a1 reference];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_remoteViewControllerDidCancel(void *a1, const char *a2, ...)
{
  return [a1 remoteViewControllerDidCancel];
}

id objc_msgSend_remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteViewControllerProxy];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_workflowID(void *a1, const char *a2, ...)
{
  return [a1 workflowID];
}

id objc_msgSend_workflowWithReference_database_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowWithReference:database:error:");
}