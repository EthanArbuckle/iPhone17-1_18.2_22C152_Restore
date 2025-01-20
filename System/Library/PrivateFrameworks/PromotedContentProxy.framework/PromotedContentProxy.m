void sub_2397A58EC(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t vars8;

  v6 = a3;
  objc_msgSend__userAgent(a1, v7, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_composeUserAgentString_adIdentifier_maxRequestCount_(APProxyURLUtilities, v11, (uint64_t)v16, (uint64_t)v6, a4);

  objc_msgSend_setCustomUserAgent_(a1, v13, (uint64_t)v12, v14, v15);
}

void sub_2397A5F34(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_lock(*(void **)(a1 + 32), a2, a3, a4, a5);
  objc_msgSend_lock(v6, v7, v8, v9, v10);
  v15 = objc_msgSend_sessionDemultiplexerForIdentifier(*(void **)(a1 + 32), v11, v12, v13, v14);
  objc_msgSend_removeObjectForKey_(v15, v16, *(void *)(a1 + 40), v17, v18);

  objc_msgSend__unregisterOldSessionIfRequired(*(void **)(a1 + 32), v19, v20, v21, v22);
  objc_msgSend_unlock(v6, v23, v24, v25, v26);
  v27 = APLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = *(void *)(a1 + 40);
    int v29 = 138543362;
    uint64_t v30 = v28;
    _os_log_impl(&dword_2397A4000, v27, OS_LOG_TYPE_INFO, "Removed demultiplexer session '%{public}@'.", (uint8_t *)&v29, 0xCu);
  }
}

void sub_2397A7664()
{
  v32[1] = *MEMORY[0x263EF8340];
  v0 = objc_alloc_init(APProxyProtocolProperties);
  v1 = (void *)qword_26AB71E90;
  qword_26AB71E90 = (uint64_t)v0;

  v5 = objc_msgSend_URLWithString_(NSURL, v2, @"https://webproxy.advp.apple.com:443", v3, v4);
  v6 = [APProxySessionConfigurationProvider alloc];
  uint64_t v10 = objc_msgSend_initWithDefaultProxyURL_(v6, v7, (uint64_t)v5, v8, v9);
  v32[0] = objc_opt_class();
  uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, (uint64_t)v32, 1, v12);
  objc_msgSend_addProtocolClasses_(v10, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_setProxySessionConfigurationProvider_((void *)qword_26AB71E90, v17, (uint64_t)v10, v18, v19);
  uint64_t v20 = [APNSURLSessionDemultiplexerManager alloc];
  uint64_t v24 = objc_msgSend_initWithProxySessionConfigProvider_(v20, v21, (uint64_t)v10, v22, v23);
  objc_msgSend_setSessionDemultiplexerManager_((void *)qword_26AB71E90, v25, (uint64_t)v24, v26, v27);

  uint64_t v28 = objc_alloc_init(APProxyURLCredentialService);
  objc_msgSend_setProxyURLCredentialService_((void *)qword_26AB71E90, v29, (uint64_t)v28, v30, v31);
}

void sub_2397A9A04(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLSession_dataTask_didReceiveResponse_completionHandler_(v7, v6, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

void sub_2397A9B90(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLSession_dataTask_didReceiveData_(v7, v6, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

uint64_t sub_2397A9DAC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6 = objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  objc_msgSend_URLSession_task_didCompleteWithError_(v6, v7, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));

  uint64_t v12 = *(void **)(a1 + 32);

  return objc_msgSend_invalidate(v12, v8, v9, v10, v11);
}

void sub_2397A9F94(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler_(v7, v6, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
}

void sub_2397AA1D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLSession_task_didReceiveChallenge_completionHandler_(v7, v6, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

id sub_2397AA32C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!v6)
  {
    id v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    uint64_t v9 = objc_opt_class();
    objc_msgSend_raise_format_(v7, v10, v8, @"%@ key cannot be nil", v11, v9);
  }
  uint64_t v12 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x263F08BA0], v4, a1, 1, v5);
  uint64_t v17 = objc_msgSend_queryItems(v12, v13, v14, v15, v16);

  uint64_t v21 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v18, @"name = %@", v19, v20, v6);
  uint64_t v25 = objc_msgSend_filteredArrayUsingPredicate_(v17, v22, (uint64_t)v21, v23, v24);
  uint64_t v30 = objc_msgSend_firstObject(v25, v26, v27, v28, v29);

  v35 = objc_msgSend_value(v30, v31, v32, v33, v34);

  return v35;
}

id sub_2397AA448(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!v6)
  {
    id v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    uint64_t v9 = objc_opt_class();
    objc_msgSend_raise_format_(v7, v10, v8, @"%@ key cannot be nil", v11, v9);
  }
  uint64_t v12 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x263F08BA0], v4, a1, 0, v5);
  uint64_t v17 = objc_msgSend_queryItems(v12, v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v18, @"name != %@", v19, v20, v6);
  uint64_t v25 = objc_msgSend_filteredArrayUsingPredicate_(v17, v22, (uint64_t)v21, v23, v24);
  if (objc_msgSend_count(v25, v26, v27, v28, v29)) {
    objc_msgSend_setQueryItems_(v12, v30, (uint64_t)v25, v31, v32);
  }
  else {
    objc_msgSend_setQueryItems_(v12, v30, 0, v31, v32);
  }
  v37 = objc_msgSend_URL(v12, v33, v34, v35, v36);

  return v37;
}

id sub_2397AA568(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v11 = a4;
  if (v11)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x263EFF940];
    uint64_t v26 = *MEMORY[0x263EFF4A0];
    uint64_t v27 = objc_opt_class();
    objc_msgSend_raise_format_(v25, v28, v26, @"%@ key cannot be nil", v29, v27);
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v30 = (void *)MEMORY[0x263EFF940];
  uint64_t v31 = *MEMORY[0x263EFF4A0];
  uint64_t v32 = objc_opt_class();
  objc_msgSend_raise_format_(v30, v33, v31, @"%@ value cannot be nil", v34, v32);
LABEL_3:
  if (objc_msgSend_length(v11, v7, v8, v9, v10))
  {
    uint64_t v14 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x263F08BA0], v12, (uint64_t)a1, 0, v13);
    uint64_t v23 = objc_msgSend_queryItems(v14, v15, v16, v17, v18);
    if (v23)
    {
      uint64_t v24 = objc_msgSend_queryItems(v14, v19, v20, v21, v22);
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x263EFFA68];
    }

    v39 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v36, @"name != %@", v37, v38, v11);
    v43 = objc_msgSend_filteredArrayUsingPredicate_(v24, v40, (uint64_t)v39, v41, v42);
    v46 = objc_msgSend_queryItemWithName_value_(MEMORY[0x263F08BD0], v44, (uint64_t)v11, (uint64_t)v6, v45);
    v50 = objc_msgSend_arrayByAddingObject_(v43, v47, (uint64_t)v46, v48, v49);
    objc_msgSend_setQueryItems_(v14, v51, (uint64_t)v50, v52, v53);

    objc_msgSend_URL(v14, v54, v55, v56, v57);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v35 = a1;
  }

  return v35;
}

uint64_t sub_2397AA74C(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend_setProperty_forKey_inRequest_(MEMORY[0x263EFC628], a2, a3, @"maximumRequestCount", a1);
  }
  else {
    return MEMORY[0x270F9A6D0](MEMORY[0x263EFC628], sel_removePropertyForKey_inRequest_, @"maximumRequestCount", a1, a1);
  }
}

uint64_t sub_2397AA778(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend_setProperty_forKey_inRequest_(MEMORY[0x263EFC628], a2, a3, @"adIdentifier", a1);
  }
  else {
    return MEMORY[0x270F9A6D0](MEMORY[0x263EFC628], sel_removePropertyForKey_inRequest_, @"adIdentifier", a1, a1);
  }
}

void sub_2397AA7A4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = (void *)MEMORY[0x263EFC628];
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, a4, a5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProperty_forKey_inRequest_(v6, v7, (uint64_t)v8, @"requestType", a1);
}

uint64_t sub_2397AA818(uint64_t a1, const char *a2)
{
  return objc_msgSend_setProperty_forKey_inRequest_(MEMORY[0x263EFC628], a2, MEMORY[0x263EFFA88], @"com.apple.ap.pc.proxy-is-recursive", a1);
}

uint64_t sub_2397AA83C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263EFC628], sel_removePropertyForKey_inRequest_, @"com.apple.ap.pc.proxy-is-recursive", a1, a5);
}

uint64_t sub_2397AA858(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_propertyForKey_inRequest_(MEMORY[0x263EFC628], a2, @"maximumRequestCount", a1, a5);
}

uint64_t sub_2397AA874(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_propertyForKey_inRequest_(MEMORY[0x263EFC628], a2, @"adIdentifier", a1, a5);
}

uint64_t sub_2397AA890(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_propertyForKey_inRequest_(MEMORY[0x263EFC628], a2, @"com.apple.ap.pc.proxy-is-recursive", a1, a5);
  uint64_t v10 = objc_msgSend_BOOLValue(v5, v6, v7, v8, v9);

  return v10;
}

BOOL sub_2397AA8E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_propertyForKey_inRequest_(MEMORY[0x263EFC628], a2, @"com.apple.ap.pc.proxy-is-recursive", a1, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

uint64_t sub_2397AA92C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_propertyForKey_inRequest_(MEMORY[0x263EFC628], a2, @"requestType", a1, a5);
  uint64_t v10 = v5;
  if (v5) {
    uint64_t v11 = objc_msgSend_integerValue(v5, v6, v7, v8, v9);
  }
  else {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t sub_2397AA98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](a1, sel_queryItemForKey_, @"videoAdvertisingIdentifier", a4, a5);
}

uint64_t sub_2397AA99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](a1, sel_removeQueryItemForKey_, @"videoAdvertisingIdentifier", a4, a5);
}

uint64_t sub_2397AA9AC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_scheme(a1, a2, a3, a4, a5);
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v5, v6, @"http", v7, v8);

  return isEqualToString;
}

id sub_2397AA9EC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  switch(a3)
  {
    case 0:
      uint64_t v5 = off_264DA2E28;
      goto LABEL_7;
    case 1:
      uint64_t v5 = off_264DA2E30;
      goto LABEL_7;
    case 2:
      uint64_t v5 = off_264DA2E38;
LABEL_7:
      objc_msgSend_changeSchemeToString_(a1, a2, (uint64_t)*v5, a4, a5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
  }
  id v6 = a1;
LABEL_9:

  return v6;
}

id sub_2397AAA58(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7, v8))
  {
    uint64_t v13 = objc_msgSend_absoluteString(a1, v9, v10, v11, v12);
    uint64_t v18 = objc_msgSend_scheme(a1, v14, v15, v16, v17);
    uint64_t v23 = objc_msgSend_length(v18, v19, v20, v21, v22);
    uint64_t v27 = objc_msgSend_substringFromIndex_(v13, v24, v23, v25, v26);

    uint64_t v28 = NSURL;
    uint64_t v32 = objc_msgSend_stringByAppendingString_(v4, v29, (uint64_t)v27, v30, v31);
    objc_msgSend_URLWithString_(v28, v33, (uint64_t)v32, v34, v35);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v36 = a1;
  }

  return v36;
}

uint64_t APLogForCategory()
{
  return MEMORY[0x270F08BC8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}