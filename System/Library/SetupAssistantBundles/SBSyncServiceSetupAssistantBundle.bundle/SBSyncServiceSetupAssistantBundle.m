void sub_32CC(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  __CFDictionary *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void v15[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v2 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyAppleID];
  [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyAuthToken];
  v3 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyRealmUserID];
  v4 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyProfileID];
  [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyStatus];
  [*(id *)(a1 + 32) objectForKey:IDSAuthenticationServerResponseKeyHandles];
  if ([v3 length]) {
    v4 = v3;
  }
  if (v2) {
    v5 = v4 == 0;
  }
  else {
    v5 = 1;
  }
  if (v5)
  {
    v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v17 = v2;
      v18 = 2048;
      v19 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Missing either the appleID [%p] or profileID[%p]", buf, 0x16u);
    }
  }
  else
  {
    v7 = (void *)IDSParseAuthDictionary();
    v8 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = [v7 objectForKey:IDSAuthenticationDictionaryKeyAppleID];
    if (v9) {
      CFDictionarySetValue(v8, kIDSServiceDefaultsAppleIDKey, v9);
    }
    CFDictionarySetValue(v8, kIDSServiceDefaultsAuthorizationIDKey, v4);
    v10 = objc_msgSend(objc_msgSend(v7, "objectForKey:", IDSAuthenticationDictionaryKeySelfHandle), "objectForKey:", @"uri");
    v11 = [v10 length];
    if (v10 && v11) {
      CFDictionarySetValue(v8, kIDSServiceDefaultsSelfHandleKey, v10);
    }
    v12 = objc_alloc_init((Class)NSMutableArray);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_35E4;
    v15[3] = &unk_4120;
    v15[4] = v12;
    v13 = objc_msgSend(objc_msgSend(v7, "objectForKey:", IDSAuthenticationDictionaryKeyHandles), "__imArrayByApplyingBlock:", v15);
    if ([v12 count])
    {
      v14 = [v12 copy];
      if (v14) {
        CFDictionarySetValue(v8, kIDSServiceDefaultsInvisibleAliasesKey, v14);
      }
    }
    if ([v13 count])
    {
      if (v13) {
        CFDictionarySetValue(v8, kIDSServiceDefaultsVettedAliasesKey, v13);
      }
    }
    IDSiCloudSignIn();
  }
}

id sub_35E4(uint64_t a1, void *a2)
{
  id v4 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"uri"), "_stripFZIDPrefix");
  unsigned int v5 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"status"), "intValue");
  id v6 = [a2 objectForKey:@"is-user-visible"];
  if (v6 && ([v6 BOOLValue] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v4];
  }
  if (v5 == 5051) {
    return v4;
  }
  else {
    return 0;
  }
}

void sub_3674(uint64_t a1)
{
  v2 = +[IMRGLog registration];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "... dispatching completion", buf, 2u);
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "... not dispatching completion, cancelled", v4, 2u);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

uint64_t IDSAuthenticationDelegatePrintLoginDelegatesBag()
{
  return _IDSAuthenticationDelegatePrintLoginDelegatesBag();
}

uint64_t IDSParseAuthDictionary()
{
  return _IDSParseAuthDictionary();
}

uint64_t IDSiCloudSignIn()
{
  return _IDSiCloudSignIn();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

uint64_t im_dispatch_after()
{
  return _im_dispatch_after();
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__stripFZIDPrefix(void *a1, const char *a2, ...)
{
  return [a1 _stripFZIDPrefix];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_registration(void *a1, const char *a2, ...)
{
  return [a1 registration];
}