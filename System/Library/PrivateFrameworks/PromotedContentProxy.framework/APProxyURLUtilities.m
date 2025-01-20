@interface APProxyURLUtilities
+ (BOOL)_shouldProxyRequestToHost:(id)a3;
+ (BOOL)shouldProxyRequestToHost:(id)a3;
+ (id)_proxyURLForVideoURL:(id)a3 adIdentifier:(id)a4 changeScheme:(BOOL)a5;
+ (id)composeUserAgentString:(id)a3 adIdentifier:(id)a4 maxRequestCount:(int64_t)a5;
+ (id)proxyURLForVideoURL:(id)a3 adIdentifier:(id)a4 changeScheme:(BOOL)a5;
+ (void)changeSchemeTo:(int64_t)a3 forUrlRequest:(id)a4;
@end

@implementation APProxyURLUtilities

+ (BOOL)shouldProxyRequestToHost:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_isAppleInternalInstall(MEMORY[0x263F20B88], v5, v6, v7, v8)) {
    goto LABEL_6;
  }
  v13 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v9, v10, v11, v12);
  v17 = objc_msgSend_objectForKey_(v13, v14, @"APProxyURLMockSettings.proxyDisabled", v15, v16);

  if (!v17 || (objc_msgSend_BOOLValue(v17, v18, v19, v20, v21) & 1) == 0)
  {

LABEL_6:
    char shouldProxyRequestToHost = objc_msgSend__shouldProxyRequestToHost_(a1, v9, (uint64_t)v4, v11, v12);
    goto LABEL_7;
  }

  char shouldProxyRequestToHost = 0;
LABEL_7:

  return shouldProxyRequestToHost;
}

+ (BOOL)_shouldProxyRequestToHost:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    uint64_t v12 = objc_msgSend_lowercaseString(v3, v8, v9, v10, v11);
    if ((objc_msgSend_isEqualToString_(v12, v13, @"localhost", v14, v15) & 1) != 0
      || (objc_msgSend_isEqualToString_(v12, v16, @"apple.com", v17, v18) & 1) != 0
      || (objc_msgSend_hasSuffix_(v12, v19, @".apple.com", v20, v21) & 1) != 0
      || (objc_msgSend_isEqualToString_(v12, v22, @"qwapi.com", v23, v24) & 1) != 0
      || (objc_msgSend_hasSuffix_(v12, v25, @".qwapi.com", v26, v27) & 1) != 0
      || (objc_msgSend_isEqualToString_(v12, v28, @"mzstatic.com", v29, v30) & 1) != 0)
    {
      LOBYTE(v34) = 0;
    }
    else
    {
      int v34 = objc_msgSend_hasSuffix_(v12, v31, @".mzstatic.com", v32, v33) ^ 1;
    }
  }
  else
  {
    LOBYTE(v34) = 0;
  }

  return v34;
}

+ (id)composeUserAgentString:(id)a3 adIdentifier:(id)a4 maxRequestCount:(int64_t)a5
{
  uint64_t v7 = (__CFString *)a3;
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &stru_26ECD2AE8;
  }
  id v9 = a4;
  v13 = objc_msgSend_componentsSeparatedByString_(v8, v10, @"##", v11, v12);
  uint64_t v18 = objc_msgSend_firstObject(v13, v14, v15, v16, v17);

  v22 = objc_msgSend_stringByAppendingFormat_(v18, v19, @"##%@##%@##%@##%ld", v20, v21, @"ad-x-identifier", v9, @"max-request-count", a5);

  return v22;
}

+ (void)changeSchemeTo:(int64_t)a3 forUrlRequest:(id)a4
{
  id v5 = a4;
  objc_msgSend_URL(v5, v6, v7, v8, v9);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_changeSchemeTo_(v17, v10, a3, v11, v12);
  objc_msgSend_setURL_(v5, v14, (uint64_t)v13, v15, v16);
}

+ (id)proxyURLForVideoURL:(id)a3 adIdentifier:(id)a4 changeScheme:(BOOL)a5
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__proxyURLForVideoURL_adIdentifier_changeScheme_, a3, a4, a5);
}

+ (id)_proxyURLForVideoURL:(id)a3 adIdentifier:(id)a4 changeScheme:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = objc_msgSend_setQueryItem_forKey_(a3, a2, (uint64_t)a4, @"videoAdvertisingIdentifier", a5);
  uint64_t v11 = v6;
  if (v5)
  {
    if (objc_msgSend_isHTTP(v6, v7, v8, v9, v10)) {
      objc_msgSend_changeSchemeTo_(v11, v12, 1, v13, v14);
    }
    else {
    uint64_t v15 = objc_msgSend_changeSchemeTo_(v11, v12, 2, v13, v14);
    }

    uint64_t v11 = (void *)v15;
  }

  return v11;
}

@end