@interface MCNewGlobalHTTPProxyPayloadHandler
- (BOOL)_install;
- (BOOL)_remove;
- (BOOL)_sendSystemConfigurationProxyChangeNotification;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (id)userInputFields;
- (void)_applyProxyCredential:(id)a3;
- (void)_recoverProxyCredential;
- (void)_removeProxyCredential;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNewGlobalHTTPProxyPayloadHandler

- (id)userInputFields
{
  v3 = +[NSMutableArray array];
  v4 = [(MCNewPayloadHandler *)self payload];
  v5 = [v4 proxyUsername];
  if ([v5 length])
  {
    v6 = [v4 proxyPassword];
    id v7 = [v6 length];

    if (v7) {
      goto LABEL_5;
    }
    v5 = MCLocalizedFormat();
    v8 = MCLocalizedFormat();
    v9 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"password", v5, v8, 0, 0, 0, 0, 0, 0x100000003);
    [v3 addObject:v9];
  }
LABEL_5:

  return v3;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = [(MCNewPayloadHandler *)self payload];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v31;
    uint64_t v12 = kMCIDUUIDKey;
    uint64_t v13 = kMCIDResponseKey;
    *(void *)&long long v9 = 138543618;
    long long v28 = v9;
    do
    {
      v14 = 0;
      id v29 = v10;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v7);
        }
        v15 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v14);
        v16 = [v15 objectForKey:v12, v28];
        v17 = [v15 objectForKey:v13];
        if ([v16 isEqualToString:@"password"])
        {
          [v6 setProxyPassword:v17];
        }
        else
        {
          os_log_t v18 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            v19 = v18;
            v20 = objc_opt_class();
            *(_DWORD *)buf = v28;
            v35 = v20;
            __int16 v36 = 2114;
            v37 = v16;
            uint64_t v21 = v13;
            uint64_t v22 = v12;
            uint64_t v23 = v11;
            id v24 = v7;
            v25 = v6;
            id v26 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

            v6 = v25;
            id v7 = v24;
            uint64_t v11 = v23;
            uint64_t v12 = v22;
            uint64_t v13 = v21;
            id v10 = v29;
          }
        }

        v14 = (char *)v14 + 1;
      }
      while (v10 != v14);
      id v10 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v10);
  }

  return 1;
}

- (BOOL)_install
{
  v2 = self;
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = +[NSMutableDictionary dictionary];
  if ([v3 proxyType] == 1)
  {
    id v5 = [v3 proxyServer];

    if (v5)
    {
      v6 = [v3 proxyServer];
      [v4 setObject:v6 forKey:kSCPropNetProxiesHTTPProxy];

      id v7 = [v3 proxyServer];
      [v4 setObject:v7 forKey:kSCPropNetProxiesHTTPSProxy];
    }
    id v8 = [v3 proxyServerPort];
    if (v8)
    {
      [v4 setObject:v8 forKey:kSCPropNetProxiesHTTPPort];
    }
    else
    {
      v17 = +[NSNumber numberWithInt:80];
      [v4 setObject:v17 forKey:kSCPropNetProxiesHTTPPort];
    }
    long long v28 = v2;

    uint64_t v12 = [v3 proxyServerPort];
    if (v12)
    {
      [v4 setObject:v12 forKey:kSCPropNetProxiesHTTPSPort];
    }
    else
    {
      os_log_t v18 = +[NSNumber numberWithInt:80];
      [v4 setObject:v18 forKey:kSCPropNetProxiesHTTPSPort];
    }
    v15 = &kSCPropNetProxiesHTTPSEnable;
    v16 = &kSCPropNetProxiesHTTPEnable;
    uint64_t v13 = 1;
    uint64_t v14 = 1;
  }
  else
  {
    if ([v3 proxyType]) {
      goto LABEL_19;
    }
    long long v28 = v2;
    long long v9 = [v3 proxyPACURLString];

    if (v9)
    {
      id v10 = [v3 proxyPACURLString];
      [v4 setObject:v10 forKey:kSCPropNetProxiesProxyAutoConfigURLString];
    }
    if ([v3 proxyPACFallbackAllowed]) {
      uint64_t v11 = &off_1000F52A8;
    }
    else {
      uint64_t v11 = &off_1000F52C0;
    }
    [v4 setObject:v11 forKeyedSubscript:kSCPropNetProxiesFallBackAllowed];
    uint64_t v12 = +[NSNumber numberWithInt:0];
    [v4 setObject:v12 forKey:kSCPropNetProxiesHTTPEnable];
    uint64_t v13 = 0;
    uint64_t v14 = 2;
    v15 = &kSCPropNetProxiesProxyAutoConfigEnable;
    v16 = &kSCPropNetProxiesHTTPSEnable;
  }

  v19 = +[NSNumber numberWithInt:v13];
  [v4 setObject:v19 forKey:*v16];

  v20 = +[NSNumber numberWithInt:1];
  [v4 setObject:v20 forKey:*v15];

  uint64_t v21 = +[NSNumber numberWithInt:v14];
  [v4 setObject:v21 forKey:@"HTTPProxyType"];

  v2 = v28;
LABEL_19:
  if ([v3 proxyCaptiveLoginAllowed]) {
    uint64_t v22 = &off_1000F52A8;
  }
  else {
    uint64_t v22 = &off_1000F52C0;
  }
  [v4 setObject:v22 forKeyedSubscript:kSCPropNetProxiesBypassAllowed];
  CFStringRef v30 = @"Proxies";
  long long v31 = v4;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  unsigned __int8 v24 = +[MCManagedPreferencesManager setManagedPreferences:v23 forDomain:@"com.apple.SystemConfiguration"];

  if (v24)
  {
    unsigned __int8 v25 = [(MCNewGlobalHTTPProxyPayloadHandler *)v2 _sendSystemConfigurationProxyChangeNotification];
  }
  else
  {
    id v26 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "MCNewGlobalHTTPProxyPayloadHandler cannot install proxy settings.", buf, 2u);
    }
    unsigned __int8 v25 = 0;
  }

  return v25;
}

- (BOOL)_remove
{
  if (+[MCManagedPreferencesManager setManagedPreferences:&__NSDictionary0__struct forDomain:@"com.apple.SystemConfiguration"])
  {
    return [(MCNewGlobalHTTPProxyPayloadHandler *)self _sendSystemConfigurationProxyChangeNotification];
  }
  else
  {
    v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "MCNewGlobalHTTPProxyPayloadHandler cannot remove proxy settings.", v5, 2u);
    }
    return 0;
  }
}

- (void)_applyProxyCredential:(id)a3
{
  id v4 = a3;
  id v17 = [(MCNewPayloadHandler *)self payload];
  id v5 = +[NSURLCredentialStorage sharedCredentialStorage];
  v6 = [(MCNewPayloadHandler *)self profileHandler];
  id v7 = [v6 profile];
  [v5 set_useSystemKeychain:[v7 isInstalledForSystem]];

  id v8 = [v17 proxyServerPort];
  if (v8)
  {
    long long v9 = [v17 proxyServerPort];
    uint64_t v10 = (uint64_t)[v9 integerValue];
  }
  else
  {
    uint64_t v10 = 80;
  }

  id v11 = objc_alloc((Class)NSURLProtectionSpace);
  uint64_t v12 = [v17 proxyServer];
  id v13 = [v11 initWithProxyHost:v12 port:v10 type:NSURLProtectionSpaceHTTP realm:0 authenticationMethod:NSURLAuthenticationMethodDefault];

  id v14 = objc_alloc((Class)NSURLProtectionSpace);
  v15 = [v17 proxyServer];
  id v16 = [v14 initWithProxyHost:v15 port:v10 type:NSURLProtectionSpaceHTTPS realm:0 authenticationMethod:NSURLAuthenticationMethodDefault];

  [v5 setDefaultCredential:v4 forProtectionSpace:v13];
  [v5 setDefaultCredential:v4 forProtectionSpace:v16];
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = [(MCNewPayloadHandler *)self payload];
  if ([v8 proxyType] == 1)
  {
    long long v9 = [v8 proxyUsername];
    uint64_t v10 = [v8 proxyPassword];
    id v11 = +[NSURLCredential credentialWithUser:v9 password:v10 persistence:2];

    [(MCNewGlobalHTTPProxyPayloadHandler *)self _applyProxyCredential:v11];
    uint64_t v12 = [v8 proxyUsername];
    id v13 = [v8 proxyPassword];
    id v14 = (const void *)CFURLCredentialCreate();

    if (v14)
    {
      Archive = (const void *)_CFURLCredentialCreateArchive();
      if (Archive)
      {
        id v16 = Archive;
        CFDataRef Data = CFPropertyListCreateData(0, Archive, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          os_log_t v18 = +[NSString MCMakeUUID];
          v19 = [(MCNewPayloadHandler *)self profileHandler];
          v20 = [v19 profile];
          +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:useSystemKeychain:outError:", Data, @"MCGlobalProxy", v18, 0, 0, [v20 isInstalledForSystem], 0);

          [v8 setCredentialUUID:v18];
        }
        CFRelease(v16);

        CFRelease(v14);
LABEL_10:

        goto LABEL_11;
      }
      CFRelease(v14);
    }
    uint64_t v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Cannot serialize credential. Ignoring.", buf, 2u);
    }
    goto LABEL_10;
  }
LABEL_11:
  if ([(MCNewGlobalHTTPProxyPayloadHandler *)self _install])
  {

    id v22 = 0;
    BOOL v23 = 1;
  }
  else
  {
    uint64_t v24 = MCGlobalHTTPProxyErrorDomain;
    unsigned __int8 v25 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v24, 31001, v25, MCErrorTypeFatal, 0);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v23 = v22 == 0;
    if (a6 && v22)
    {
      id v22 = v22;
      BOOL v23 = 0;
      *a6 = v22;
    }
  }

  return v23;
}

- (void)_removeProxyCredential
{
  v3 = [(MCNewPayloadHandler *)self payload];
  if ([v3 proxyType] == 1)
  {
    id v4 = [v3 proxyServerPort];
    if (v4)
    {
      id v5 = [v3 proxyServerPort];
      uint64_t v6 = (int)[v5 intValue];
    }
    else
    {
      uint64_t v6 = 80;
    }

    id v7 = +[NSURLCredentialStorage sharedCredentialStorage];
    id v8 = [(MCNewPayloadHandler *)self profileHandler];
    long long v9 = [v8 profile];
    [v7 set_useSystemKeychain:[v9 isInstalledForSystem]];

    id v10 = objc_alloc((Class)NSURLProtectionSpace);
    id v11 = [v3 proxyServer];
    id v12 = [v10 initWithProxyHost:v11 port:v6 type:NSURLProtectionSpaceHTTP realm:0 authenticationMethod:NSURLAuthenticationMethodDefault];

    id v13 = [v7 defaultCredentialForProtectionSpace:v12];
    if (v13)
    {
      id v22 = NSURLCredentialStorageRemoveSynchronizableCredentials;
      BOOL v23 = &__kCFBooleanTrue;
      id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      [v7 removeCredential:v13 forProtectionSpace:v12 options:v14];
    }
    id v15 = objc_alloc((Class)NSURLProtectionSpace);
    id v16 = [v3 proxyServer];
    id v17 = [v15 initWithProxyHost:v16 port:v6 type:NSURLProtectionSpaceHTTPS realm:0 authenticationMethod:NSURLAuthenticationMethodDefault];

    os_log_t v18 = [v7 defaultCredentialForProtectionSpace:v17];
    if (v18)
    {
      v20 = NSURLCredentialStorageRemoveSynchronizableCredentials;
      uint64_t v21 = &__kCFBooleanTrue;
      v19 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      [v7 removeCredential:v18 forProtectionSpace:v17 options:v19];
    }
  }
}

- (void)_recoverProxyCredential
{
  id v16 = [(MCNewPayloadHandler *)self payload];
  BOOL v3 = [v16 proxyType] == 1;
  id v4 = v16;
  if (v3)
  {
    id v5 = [v16 credentialUUID];
    if (v5)
    {
      uint64_t v6 = [(MCNewPayloadHandler *)self profileHandler];
      id v7 = [v6 profile];
      +[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:useSystemKeychain:outError:", @"MCGlobalProxy", v5, 0, 0, [v7 isInstalledForSystem], 0);
      CFDataRef v8 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        CFPropertyListRef v9 = CFPropertyListCreateWithData(0, v8, 0, 0, 0);
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = _CFURLCredentialCreateFromArchive();
          if (v11)
          {
            id v12 = (const void *)v11;
            id v13 = CFURLCredentialGetUsername();
            id v14 = (void *)CFURLCredentialCopyPassword();
            id v15 = +[NSURLCredential credentialWithUser:v13 password:v14 persistence:2];
            [(MCNewGlobalHTTPProxyPayloadHandler *)self _applyProxyCredential:v15];
            CFRelease(v12);
          }
          CFRelease(v10);
        }
      }
    }
    id v4 = v16;
  }
}

- (void)setAside
{
  [(MCNewGlobalHTTPProxyPayloadHandler *)self _removeProxyCredential];

  [(MCNewGlobalHTTPProxyPayloadHandler *)self _remove];
}

- (void)unsetAside
{
  [(MCNewGlobalHTTPProxyPayloadHandler *)self _recoverProxyCredential];

  [(MCNewGlobalHTTPProxyPayloadHandler *)self _install];
}

- (void)remove
{
  id v8 = [(MCNewPayloadHandler *)self payload];
  BOOL v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    [(MCNewGlobalHTTPProxyPayloadHandler *)self _remove];
    [(MCNewGlobalHTTPProxyPayloadHandler *)self _removeProxyCredential];
  }
  id v5 = [v8 credentialUUID];
  if (v5)
  {
    uint64_t v6 = [(MCNewPayloadHandler *)self profileHandler];
    id v7 = [v6 profile];
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", @"MCGlobalProxy", v5, 0, 0, [v7 isInstalledForSystem], 0);
  }
}

- (BOOL)_sendSystemConfigurationProxyChangeNotification
{
  SCDynamicStoreRef v2 = SCDynamicStoreCreate(0, @"ManagedConfiguration", 0, 0);
  if (v2)
  {
    BOOL v3 = v2;
    CFStringRef Proxies = SCDynamicStoreKeyCreateProxies(0);
    BOOL v5 = Proxies != 0;
    uint64_t v6 = _MCLogObjects[0];
    if (Proxies)
    {
      CFStringRef v7 = Proxies;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending proxy change notification.", v11, 2u);
      }
      CFStringRef v12 = @"com.apple.SystemConfiguration";
      id v8 = +[NSArray arrayWithObjects:&v12 count:1];
      +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:v8];

      SCDynamicStoreNotifyValue(v3, v7);
      CFRelease(v7);
    }
    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Cannot create System Configuration proxy key.", v11, 2u);
    }
    CFRelease(v3);
  }
  else
  {
    CFPropertyListRef v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Cannot create System Configuration dynamic store reference.", v11, 2u);
    }
    return 0;
  }
  return v5;
}

@end