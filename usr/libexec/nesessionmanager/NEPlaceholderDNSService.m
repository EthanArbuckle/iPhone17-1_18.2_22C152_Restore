@interface NEPlaceholderDNSService
- (NEPlaceholderDNSService)init;
- (void)dealloc;
@end

@implementation NEPlaceholderDNSService

- (void).cxx_destruct
{
}

- (void)dealloc
{
  if (self)
  {
    placeholderServiceStore = self->_placeholderServiceStore;
    if (placeholderServiceStore)
    {
      CFRelease(placeholderServiceStore);
      self->_placeholderServiceStore = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NEPlaceholderDNSService;
  [(NEPlaceholderDNSService *)&v4 dealloc];
}

- (NEPlaceholderDNSService)init
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ installing placeholder DNS entry to the dynamic store", buf, 0xCu);
  }

  v20.receiver = self;
  v20.super_class = (Class)NEPlaceholderDNSService;
  objc_super v4 = [(NEPlaceholderDNSService *)&v20 init];
  if (v4)
  {
    v5 = +[NSUUID UUID];
    v6 = [v5 UUIDString];

    if (v6)
    {
      CFStringRef v28 = kSCDynamicStoreUseSessionKeys;
      CFBooleanRef v29 = kCFBooleanTrue;
      CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      v8 = SCDynamicStoreCreateWithOptions(kCFAllocatorDefault, @"NEPlaceholderDNSService", v7, 0, 0);
      v9 = ne_log_obj();
      NetworkServiceEntity = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v4;
          __int16 v26 = 2112;
          v27 = v6;
          _os_log_debug_impl((void *)&_mh_execute_header, NetworkServiceEntity, OS_LOG_TYPE_DEBUG, "%@ adding placeholder DNS entry for service %@ to the dynamic store", buf, 0x16u);
        }

        NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v6, kSCEntNetDNS);
        v11 = +[NSString stringWithFormat:@"placeholder-%u.hostname.internal", (unsigned __int16)(arc4random_uniform(0x9C40u) + 10000)];
        v22[0] = kSCPropNetDNSServerAddresses;
        v22[1] = kSCPropNetDNSServerPort;
        v23[0] = &off_1000C96C0;
        v23[1] = &off_1000C97E0;
        v23[2] = v11;
        v22[2] = kSCPropNetDNSDomainName;
        v22[3] = kSCPropNetDNSSupplementalMatchDomains;
        v21 = v11;
        v12 = +[NSArray arrayWithObjects:&v21 count:1];
        v23[3] = v12;
        v13 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

        int v14 = SCDynamicStoreSetValue(v8, (CFStringRef)NetworkServiceEntity, v13);
        v15 = ne_log_obj();
        v16 = v15;
        if (v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v25 = v4;
            __int16 v26 = 2112;
            v27 = v6;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@ successfully added placeholder DNS entry with key uuid: %@", buf, 0x16u);
          }

          objc_setProperty_atomic(v4, v17, v6, 16);
          v4->_placeholderServiceStore = v8;
          v18 = v4;
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v25 = v4;
            __int16 v26 = 2112;
            v27 = v6;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ failed to add placeholder DNS entry for service %@ to the dynamic store", buf, 0x16u);
          }

          myCFRelease();
          v18 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v4;
          _os_log_error_impl((void *)&_mh_execute_header, NetworkServiceEntity, OS_LOG_TYPE_ERROR, "%@ failed to open dynamic store session", buf, 0xCu);
        }
        v18 = 0;
      }
    }
    else
    {
      ne_log_obj();
      CFDictionaryRef v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_ERROR, "%@ failed to create UUID", buf, 0xCu);
      }
      v18 = 0;
    }
  }
  else
  {
    ne_log_obj();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

@end