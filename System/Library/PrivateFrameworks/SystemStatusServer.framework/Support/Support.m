id sub_100002868(void *a1)
{
  id v1;
  id v2;
  void v4[4];
  id v5;
  uint64_t vars8;

  v1 = a1;
  +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v1 count]);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000292C;
  v4[3] = &unk_1000041A8;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  [v1 enumerateWithBlock:v4];

  return v2;
}

void sub_10000292C(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[NSNumber numberWithInteger:a2];
  [v2 addObject:v3];
}

uint64_t start()
{
  id v1 = objc_alloc_init((Class)STLocalStatusServer);
  v2 = [[STStatusServerTransactionManager alloc] initWithServer:v1];
  id v3 = (void *)qword_1000082F0;
  qword_1000082F0 = (uint64_t)v2;

  id v4 = objc_alloc_init((Class)STLocalDynamicActivityAttributionManager);
  v5 = (void *)qword_1000082F8;
  qword_1000082F8 = (uint64_t)v4;

  id v6 = objc_alloc((Class)STDynamicActivityAttributionMonitor);
  id v7 = [v6 initWithServerHandle:qword_1000082F8];
  v8 = (void *)qword_100008300;
  qword_100008300 = (uint64_t)v7;

  id v9 = objc_alloc_init((Class)STLocationStatusDomainDisplayNameTransformerProvider);
  v10 = (void *)qword_100008308;
  qword_100008308 = (uint64_t)v9;

  id v11 = objc_alloc_init((Class)STMediaStatusDomainDisplayNameTransformerProvider);
  v12 = (void *)qword_100008310;
  qword_100008310 = (uint64_t)v11;

  [v1 addClientDataTransformerProvider:qword_100008308 forDomain:5];
  [v1 addClientDataTransformerProvider:qword_100008310 forDomain:6];
  id v13 = objc_alloc_init((Class)STBackgroundActivitiesStatusDomainVisualDescriptorTransformer);
  v14 = (void *)qword_100008318;
  qword_100008318 = (uint64_t)v13;

  [v1 addDataTransformer:qword_100008318 forDomain:1];
  id v15 = objc_alloc_init((Class)STStatusItemsStatusDomainVisualDescriptorTransformer);
  v16 = (void *)qword_100008320;
  qword_100008320 = (uint64_t)v15;

  [v1 addDataTransformer:qword_100008320 forDomain:14];
  if (_BSIsInternalInstall())
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100002E60;
    v39[3] = &unk_100004210;
    id v17 = v1;
    id v40 = v17;
    v18 = objc_retainBlock(v39);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100002E80;
    v37[3] = &unk_100004210;
    id v38 = v17;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100002EA0;
    v34[3] = &unk_100004258;
    id v35 = v18;
    v36 = objc_retainBlock(v37);
    v19 = v36;
    v20 = v18;
    v21 = objc_retainBlock(v34);
    v22 = +[STSystemStatusDefaults standardDefaults];
    id v23 = [v22 observeDefault:@"shouldEnableUnknownBackgroundActivities" onQueue:&_dispatch_main_q withBlock:v20];
    id v24 = [v22 observeDefault:@"shouldEnableUnknownStatusItems" onQueue:&_dispatch_main_q withBlock:v19];

    id v25 = [v22 observeDefault:@"shouldEnableUnknownBundles" onQueue:&_dispatch_main_q withBlock:v21];
  }
  v26 = (void *)qword_100008300;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100002EEC;
  v32[3] = &unk_1000042A8;
  id v33 = v1;
  id v27 = v1;
  [v26 setHandler:v32];
  [(id)qword_100008300 activate];
  v28 = (void *)qword_100008310;
  v29 = [(id)qword_100008300 currentAttributions];
  [v28 setDynamicAttributions:v29];

  notify_post("com.apple.systemstatus.server-launch");
  v30 = +[NSRunLoop currentRunLoop];
  [v30 run];

  return 0;
}

id sub_100002E60(uint64_t a1)
{
  return [*(id *)(a1 + 32) modifyDataTransformer:qword_100008318 forDomain:1 usingBlock:&stru_1000041E8];
}

id sub_100002E80(uint64_t a1)
{
  return [*(id *)(a1 + 32) modifyDataTransformer:qword_100008320 forDomain:14 usingBlock:&stru_100004230];
}

uint64_t sub_100002EA0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void sub_100002EEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = qword_100008310;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002F9C;
  v7[3] = &unk_100004280;
  id v8 = v3;
  id v6 = v3;
  [v4 modifyClientDataTransformerProvider:v5 forDomain:6 usingBlock:v7];
}

id sub_100002F9C(uint64_t a1)
{
  return [(id)qword_100008310 setDynamicAttributions:*(void *)(a1 + 32)];
}

uint64_t STSystemStatusDescriptionForDomain()
{
  return _STSystemStatusDescriptionForDomain();
}

uint64_t _BSIsInternalInstall()
{
  return __BSIsInternalInstall();
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAttributions(void *a1, const char *a2, ...)
{
  return [a1 currentAttributions];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_standardDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardDefaults];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}