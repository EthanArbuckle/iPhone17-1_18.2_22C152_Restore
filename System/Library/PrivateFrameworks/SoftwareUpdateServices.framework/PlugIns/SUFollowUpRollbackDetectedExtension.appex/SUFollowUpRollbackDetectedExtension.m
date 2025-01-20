void sub_100002BF4(id a1)
{
  void *v1;

  v1 = (void *)qword_1000081B8;
  qword_1000081B8 = (uint64_t)&off_100004448;
}

void sub_100002E44(uint64_t a1)
{
  id v2 = [objc_alloc((Class)SUManagerClient) initWithDelegate:0 queue:&_dispatch_main_q clientType:1];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)SURollbackOptions);
    [v3 setPromptForConsent:1];
    [v3 setPromptForPasscode:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100002F84;
    v6[3] = &unk_1000041C0;
    v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    id v8 = v2;
    id v9 = *(id *)(a1 + 48);
    [v8 rollbackUpdateWithOptions:v3 withResult:v6];
  }
  else
  {
    SULogInfo();
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
  }
}

void sub_100002F84(uint64_t a1, char a2, void *a3, void *a4)
{
  id v15 = a3;
  id v7 = a4;
  SULogInfo();
  if (a2)
  {
    id v8 = objc_alloc((Class)SUAnalyticsEvent);
    id v9 = [v8 initWithEventName:kSUAnalyticsUsageEventName];
    uint64_t v10 = kSUAnalyticsUserInteractionType;
    v11 = *(void **)(a1 + 32);
    v12 = [*(id *)(a1 + 40) userInfo];
    v13 = [v11 rollbackSuggestionTypeFromUserInfo:v12];
    [v9 setEventPayloadEntry:v10 stringValue:v13];

    [*(id *)(a1 + 48) submitSUAnalyticsEvent:v9];
    [*(id *)(a1 + 32) clearFollowUpItem:*(void *)(a1 + 40)];
  }
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, 1);
  }
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t SULogInfo()
{
  return _SULogInfo();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_jumpTable(void *a1, const char *a2, ...)
{
  return [a1 jumpTable];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}