@interface WFIPMonitor
- (BOOL)globalProxyIsEnabled;
- (BOOL)hasValidIPAddress;
- (BOOL)hasValidIPv4Address;
- (BOOL)hasValidIPv6Address;
- (BOOL)httpProxyAutoConfigured;
- (BOOL)httpProxyIsAuthenticated;
- (BOOL)isUsingCustomDNSSettings;
- (BOOL)isUsingCustomProxySetting;
- (BOOL)monitorNetworkServiceID:(id)a3;
- (BOOL)personalHotspotHasClients;
- (BOOL)renewLease;
- (NSString)bundleIdentifier;
- (NSString)interfaceName;
- (NSString)serviceID;
- (OS_dispatch_queue)queue;
- (WFIPMonitor)init;
- (WFIPMonitor)initWithInterfaceName:(id)a3;
- (__SCDynamicStore)networkServiceStore;
- (__SCDynamicStore)storeRef;
- (__SCPreferences)prefsRef;
- (id)DHCPLeaseExpirationDate;
- (id)__dhcpInfo;
- (id)__dnsSetupConfig;
- (id)__dnsStateConfig;
- (id)__ipv4InterfaceStateConfig;
- (id)__ipv4SetupConfig;
- (id)__ipv4StateConfig;
- (id)__ipv6SetupConfig;
- (id)__ipv6StateConfig;
- (id)__proxiesSetupConfig;
- (id)__wifiServiceID;
- (id)dnsDomainName;
- (id)dnsSearchDomains;
- (id)dnsServerAddresses;
- (id)httpProxyAutoConfigURL;
- (id)httpProxyPort;
- (id)httpProxyServer;
- (id)httpProxyUsername;
- (id)ipv4Addresses;
- (id)ipv4DHCPClientID;
- (id)ipv4Router;
- (id)ipv4SubnetMasks;
- (id)ipv6Addresses;
- (id)ipv6PrefixLengths;
- (id)ipv6Router;
- (int64_t)ipv4ConfigMethod;
- (int64_t)ipv6ConfigMethod;
- (void)_postChangesNotification:(id)a3;
- (void)dealloc;
- (void)setBundleIdentifier:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setNetworkServiceStore:(__SCDynamicStore *)a3;
- (void)setPrefsRef:(__SCPreferences *)a3;
- (void)setQueue:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setStoreRef:(__SCDynamicStore *)a3;
@end

@implementation WFIPMonitor

- (id)__wifiServiceID
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v42 = [MEMORY[0x263EFF980] array];
  v41 = self;
  v4 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)self->_bundleIdentifier, 0, 0);
  v5 = v4;
  if (!v4)
  {
    CFArrayRef v8 = 0;
    v7 = 0;
LABEL_45:
    if ([(__CFString *)v3 count])
    {
      v32 = WFLogForCategory(0);
      os_log_type_t v33 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v32 && os_log_type_enabled(v32, v33))
      {
        interfaceName = v41->_interfaceName;
        *(_DWORD *)buf = 136315906;
        v44 = "-[WFIPMonitor __wifiServiceID]";
        __int16 v45 = 2114;
        v46 = (__CFString *)interfaceName;
        __int16 v47 = 2114;
        v48 = v3;
        __int16 v49 = 2114;
        v50 = v42;
        _os_log_impl(&dword_226071000, v32, v33, "%s Failed to return a service ID. None of the available SCNetworkInterfaceRefs matched the IEEE80211 type. _interfaceName: %{public}@, BSD names compared: %{public}@, types: %{public}@", buf, 0x2Au);
      }
    }
    InterfaceType = 0;
    goto LABEL_52;
  }
  v6 = SCNetworkSetCopyCurrent(v4);
  v7 = v6;
  if (!v6)
  {
    CFArrayRef v8 = 0;
    goto LABEL_45;
  }
  CFArrayRef v8 = SCNetworkSetCopyServices(v6);
  if (!v8) {
    goto LABEL_45;
  }
  CFArrayRef ServiceOrder = SCNetworkSetGetServiceOrder(v7);
  if (!ServiceOrder) {
    goto LABEL_45;
  }
  CFArrayRef v10 = ServiceOrder;
  if (CFArrayGetCount(ServiceOrder) < 1) {
    goto LABEL_45;
  }
  v37 = v7;
  v38 = v5;
  CFIndex v12 = 0;
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x263F1BCA8];
  *(void *)&long long v11 = 136315906;
  long long v36 = v11;
  v39 = v3;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v10, v12);
    if (ValueAtIndex)
    {
      v14 = ValueAtIndex;
      if (CFArrayGetCount(v8) >= 1)
      {
        CFIndex v15 = 0;
        while (1)
        {
          v16 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v8, v15);
          if (!v16) {
            goto LABEL_32;
          }
          v17 = v16;
          if (!SCNetworkServiceGetEnabled(v16)) {
            goto LABEL_32;
          }
          CFStringRef ServiceID = SCNetworkServiceGetServiceID(v17);
          if (!ServiceID) {
            goto LABEL_32;
          }
          v19 = (__CFString *)ServiceID;
          if (!CFEqual(ServiceID, v14)) {
            goto LABEL_32;
          }
          Interface = SCNetworkServiceGetInterface(v17);
          if (!Interface) {
            goto LABEL_32;
          }
          do
          {
            v21 = Interface;
            Interface = SCNetworkInterfaceGetInterface(Interface);
          }
          while (Interface);
          BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(v21);
          v23 = BSDName;
          if (BSDName)
          {
            v24 = (void *)[(__CFString *)BSDName copy];
            [(__CFString *)v3 addObject:v24];

            int v25 = [(__CFString *)v23 isEqualToString:v41->_interfaceName];
          }
          else
          {
            int v25 = 0;
          }
          InterfaceType = (__CFString *)SCNetworkInterfaceGetInterfaceType(v21);
          if (!InterfaceType) {
            goto LABEL_33;
          }
          [(NSString *)v42 addObject:InterfaceType];
          int v27 = CFEqual(InterfaceType, cf2) ? v25 : 0;
          if (v27 == 1)
          {
            if ([(__CFString *)v23 rangeOfString:@"en"] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v28 = WFLogForCategory(0);
              os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
              InterfaceType = 0;
              if (WFCurrentLogLevel() && v28)
              {
                if (os_log_type_enabled(v28, v29))
                {
                  *(_DWORD *)buf = 136315650;
                  v44 = "-[WFIPMonitor __wifiServiceID]";
                  __int16 v45 = 2112;
                  v46 = v23;
                  __int16 v47 = 2112;
                  v48 = v19;
                  _os_log_impl(&dword_226071000, v28, v29, "%s: skipping non-Infra WiFi service bsdName='%@' (serviceID='%@')", buf, 0x20u);
                }
                InterfaceType = 0;
              }
              v3 = v39;
LABEL_31:

              goto LABEL_33;
            }
            InterfaceType = (__CFString *)[(__CFString *)v19 copy];
            if (InterfaceType)
            {
              v28 = WFLogForCategory(0);
              os_log_type_t v30 = OSLogForWFLogLevel(3uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 3 && v28 && os_log_type_enabled(v28, v30))
              {
                v31 = v41->_interfaceName;
                *(_DWORD *)buf = v36;
                v44 = "-[WFIPMonitor __wifiServiceID]";
                __int16 v45 = 2112;
                v46 = InterfaceType;
                __int16 v47 = 2112;
                v48 = v23;
                __int16 v49 = 2112;
                v50 = v31;
                _os_log_impl(&dword_226071000, v28, v30, "%s: wifi serviceID: %@, bsdName: %@, _interfaceName: %@", buf, 0x2Au);
              }
              goto LABEL_31;
            }
          }
          else
          {
LABEL_32:
            InterfaceType = 0;
          }
LABEL_33:
          if (CFArrayGetCount(v8) <= ++v15 || InterfaceType) {
            goto LABEL_42;
          }
        }
      }
    }
    InterfaceType = 0;
LABEL_42:
    ++v12;
  }
  while (CFArrayGetCount(v10) > v12 && !InterfaceType);
  v7 = v37;
  v5 = v38;
  if (!InterfaceType) {
    goto LABEL_45;
  }
LABEL_52:
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v5) {
    CFRelease(v5);
  }

  return InterfaceType;
}

- (BOOL)monitorNetworkServiceID:(id)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  v4 = (__CFString *)a3;
  storeRef = self->_storeRef;
  if (storeRef)
  {
    SCDynamicStoreSetDispatchQueue(storeRef, 0);
    v6 = self->_storeRef;
    if (v6)
    {
      CFRelease(v6);
      self->_storeRef = 0;
    }
  }
  v7 = [MEMORY[0x263EFF980] array];
  CFArrayRef v8 = (_WFIPMonitorObserver *)objc_opt_new();
  dynamicStoreInfo = self->_dynamicStoreInfo;
  self->_dynamicStoreInfo = v8;

  [(_WFIPMonitorObserver *)self->_dynamicStoreInfo setIpMonitor:self];
  CFArrayRef v10 = self->_dynamicStoreInfo;
  context.version = 0;
  context.info = v10;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x263EFF3B8];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x263EFF3B0];
  context.copyDescription = 0;
  if (!v4 || (CFStringRef v11 = WFCopyProcessIdentifier()) == 0)
  {
    BOOL v35 = 0;
    goto LABEL_29;
  }
  CFStringRef v12 = v11;
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v14 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, (SCDynamicStoreCallBack)__ipStoreCallback, &context);
  if (v14)
  {
    self->_storeRef = v14;
    CFStringRef v15 = (const __CFString *)*MEMORY[0x263F1BC08];
    v16 = (__CFString *)SCDynamicStoreKeyCreate(v13, (CFStringRef)*MEMORY[0x263F1BC08]);
    if (v16)
    {
      [(__CFString *)v7 addObject:v16];
      CFStringRef v17 = (const __CFString *)*MEMORY[0x263F1BC10];
      NetworkServiceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(v13, (CFStringRef)*MEMORY[0x263F1BC10], v4, (CFStringRef)*MEMORY[0x263F1BC50]);
      if (NetworkServiceEntity
        && ([(__CFString *)v7 addObject:NetworkServiceEntity],
            (CFStringRef v19 = SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v17, v4, (CFStringRef)*MEMORY[0x263F1BC58])) != 0))
      {
        v39 = (__CFString *)v19;
        [(__CFString *)v7 addObject:v19];
        CFStringRef v20 = SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v17, v4, (CFStringRef)*MEMORY[0x263F1BC30]);
        if (v20)
        {
          v38 = (__CFString *)v20;
          [(__CFString *)v7 addObject:v20];
          v21 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v17, v4, (CFStringRef)*MEMORY[0x263F1BC38]);
          if (v21)
          {
            [(__CFString *)v7 addObject:v21];
            v22 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v17, v4, (CFStringRef)*MEMORY[0x263F1BC88]);
            if (v22)
            {
              [(__CFString *)v7 addObject:v22];
              CFStringRef v23 = SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v15, v4, (CFStringRef)*MEMORY[0x263F1BBF0]);
              v24 = (__CFString *)v23;
              if (v23)
              {
                v37 = NetworkServiceEntity;
                int v25 = v16;
                CFStringRef v26 = v12;
                int v27 = self->_storeRef;
                v43[0] = v23;
                CFArrayRef v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
                LODWORD(v27) = SCDynamicStoreSetNotificationKeys(v27, (CFArrayRef)v7, v28);

                if (v27)
                {
                  SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_queue);
                  os_log_type_t v29 = WFLogForCategory(0);
                  os_log_type_t v30 = OSLogForWFLogLevel(4uLL);
                  CFStringRef v12 = v26;
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v29 && os_log_type_enabled(v29, v30))
                  {
                    *(_DWORD *)buf = 138412290;
                    v42 = v4;
                    _os_log_impl(&dword_226071000, v29, v30, "Monitoring service ID %@", buf, 0xCu);
                  }

                  v31 = WFLogForCategory(0);
                  os_log_type_t v32 = OSLogForWFLogLevel(4uLL);
                  v16 = v25;
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v31 && os_log_type_enabled(v31, v32))
                  {
                    *(_DWORD *)buf = 138412290;
                    v42 = v7;
                    _os_log_impl(&dword_226071000, v31, v32, "SC Keys: %@", buf, 0xCu);
                  }

                  os_log_type_t v33 = WFLogForCategory(0);
                  os_log_type_t v34 = OSLogForWFLogLevel(4uLL);
                  NetworkServiceEntity = v37;
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v33 && os_log_type_enabled(v33, v34))
                  {
                    *(_DWORD *)buf = 138412290;
                    v42 = v24;
                    _os_log_impl(&dword_226071000, v33, v34, "SC Match Pattern: %@", buf, 0xCu);
                  }

                  BOOL v35 = 1;
                }
                else
                {
                  BOOL v35 = 0;
                  CFStringRef v12 = v26;
                  v16 = v25;
                  NetworkServiceEntity = v37;
                }
                goto LABEL_28;
              }
            }
            else
            {
              v24 = 0;
            }
          }
          else
          {
            v24 = 0;
            v22 = 0;
          }
        }
        else
        {
          v24 = 0;
          v22 = 0;
          v21 = 0;
          v38 = 0;
        }
      }
      else
      {
        v24 = 0;
        v22 = 0;
        v21 = 0;
        v38 = 0;
        v39 = 0;
      }
    }
    else
    {
      v24 = 0;
      v22 = 0;
      v21 = 0;
      v38 = 0;
      v39 = 0;
      NetworkServiceEntity = 0;
    }
  }
  else
  {
    v24 = 0;
    v22 = 0;
    v21 = 0;
    v38 = 0;
    v39 = 0;
    NetworkServiceEntity = 0;
    v16 = 0;
  }
  BOOL v35 = 0;
LABEL_28:
  CFRelease(v12);

LABEL_29:
  return v35;
}

- (WFIPMonitor)initWithInterfaceName:(id)a3
{
  id v5 = a3;
  id location = 0;
  v26.receiver = self;
  v26.super_class = (Class)WFIPMonitor;
  id v6 = [(WFIPMonitor *)&v26 init];
  if (!v6
    || (objc_storeWeak(&location, v6), !v5)
    || (objc_storeStrong((id *)v6 + 4, a3),
        [NSString stringWithFormat:@"com.apple.WiFiKit.ipmonitor-%@", v5],
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = 0;
LABEL_10:
    NetworkServiceEntity = 0;
    goto LABEL_11;
  }
  id v8 = v7;
  dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
  CFArrayRef v10 = (void *)*((void *)v6 + 8);
  *((void *)v6 + 8) = v9;

  CFStringRef v11 = WFCopyProcessIdentifier();
  CFStringRef v12 = (void *)*((void *)v6 + 9);
  *((void *)v6 + 9) = v11;

  if (!*((void *)v6 + 9)) {
    goto LABEL_10;
  }
  uint64_t v13 = objc_opt_new();
  v14 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v13;

  [*((id *)v6 + 2) setIpMonitor:v6];
  CFStringRef v15 = (void *)*((void *)v6 + 2);
  context.version = 0;
  context.info = v15;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x263EFF3B8];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x263EFF3B0];
  context.copyDescription = 0;
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  SCDynamicStoreRef v17 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], *((CFStringRef *)v6 + 9), (SCDynamicStoreCallBack)_netServiceCallback, &context);
  *((void *)v6 + 7) = v17;
  if (!v17) {
    goto LABEL_10;
  }
  NetworkServiceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(v16, (CFStringRef)*MEMORY[0x263F1BC08], (CFStringRef)*MEMORY[0x263F1BBF0], 0);
  CFStringRef v19 = (const __SCDynamicStore *)*((void *)v6 + 7);
  CFArrayRef v20 = [MEMORY[0x263EFF8C0] arrayWithObject:NetworkServiceEntity];
  LODWORD(v19) = SCDynamicStoreSetNotificationKeys(v19, 0, v20);

  if (!v19)
  {
LABEL_11:

    v22 = 0;
    id v6 = 0;
    goto LABEL_8;
  }
  SCDynamicStoreSetDispatchQueue(*((SCDynamicStoreRef *)v6 + 7), *((dispatch_queue_t *)v6 + 8));
  v21 = objc_msgSend(v6, "__wifiServiceID");
  v22 = (void *)[v21 copy];

  objc_storeStrong((id *)v6 + 3, v22);
  [v6 monitorNetworkServiceID:*((void *)v6 + 3)];
LABEL_8:
  CFStringRef v23 = (WFIPMonitor *)v6;
  objc_destroyWeak(&location);

  return v23;
}

- (WFIPMonitor)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WFIPMonitor init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (void)dealloc
{
  storeRef = self->_storeRef;
  if (storeRef)
  {
    SCDynamicStoreSetDispatchQueue(storeRef, 0);
    SCDynamicStoreSetNotificationKeys(self->_storeRef, 0, 0);
  }
  networkServiceStore = self->_networkServiceStore;
  if (networkServiceStore)
  {
    SCDynamicStoreSetDispatchQueue(networkServiceStore, 0);
    SCDynamicStoreSetNotificationKeys(self->_networkServiceStore, 0, 0);
  }
  prefsRef = self->_prefsRef;
  if (prefsRef)
  {
    CFRelease(prefsRef);
    self->_prefsRef = 0;
  }
  id v6 = self->_storeRef;
  if (v6)
  {
    CFRelease(v6);
    self->_storeRef = 0;
  }
  v7 = self->_networkServiceStore;
  if (v7)
  {
    CFRelease(v7);
    self->_networkServiceStore = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)WFIPMonitor;
  [(WFIPMonitor *)&v8 dealloc];
}

- (void)_postChangesNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__WFIPMonitor__postChangesNotification___block_invoke;
  v6[3] = &unk_26478E7D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __40__WFIPMonitor__postChangesNotification___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  v3 = (void *)MEMORY[0x263F089F8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  objc_super v8 = @"changedKeys";
  v9[0] = v4;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [v3 notificationWithName:@"WFIPMonitorStateChangedNotification" object:v5 userInfo:v6];

  [v2 postNotification:v7];
}

- (BOOL)hasValidIPAddress
{
  if ([(WFIPMonitor *)self ipv4ConfigMethod] == 4)
  {
    v3 = [(WFIPMonitor *)self ipv4Router];

    if (v3) {
      return 1;
    }
  }
  if ([(WFIPMonitor *)self hasValidIPv4Address]) {
    return 1;
  }
  return [(WFIPMonitor *)self hasValidIPv6Address];
}

- (BOOL)hasValidIPv4Address
{
  v3 = [(WFIPMonitor *)self ipv4Addresses];
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v5 = [(WFIPMonitor *)self ipv4SubnetMasks];
    if (v5)
    {
      id v6 = [v4 objectAtIndex:0];
      id v7 = [v5 objectAtIndex:0];
      char valid = WFIsValidIPv4Address(v6, v7);
    }
    else
    {
      char valid = 0;
    }
  }
  else
  {
    char valid = 0;
  }

  return valid;
}

- (BOOL)hasValidIPv6Address
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [(WFIPMonitor *)self ipv6Addresses];
  v3 = v2;
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if (WFIsValidIPv6Address(*(void **)(*((void *)&v9 + 1) + 8 * i)))
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)renewLease
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v27 = 136315138;
    CFArrayRef v28 = "-[WFIPMonitor renewLease]";
    _os_log_impl(&dword_226071000, v3, v4, "%s: renewing lease", (uint8_t *)&v27, 0xCu);
  }

  if (![(WFIPMonitor *)self prefsRef]) {
    return 0;
  }
  uint64_t v5 = SCNetworkSetCopyCurrent([(WFIPMonitor *)self prefsRef]);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  CFArrayRef v7 = SCNetworkSetCopyServices(v5);
  if (!v7)
  {
    BOOL v23 = 0;
    CFArrayRef v8 = v6;
    goto LABEL_24;
  }
  CFArrayRef v8 = v7;
  CFIndex Count = CFArrayGetCount(v7);
  if (!Count) {
    goto LABEL_13;
  }
  CFIndex v10 = Count;
  CFIndex v11 = 0;
  uint64_t v12 = *MEMORY[0x263F1BCA8];
  while (1)
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v8, v11);
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    CFStringRef v15 = SCNetworkInterfaceGetInterfaceType(Interface);
    if ([v15 isEqualToString:v12])
    {
      CFAllocatorRef v16 = SCNetworkInterfaceGetBSDName(Interface);
      char v17 = [v16 isEqualToString:self->_interfaceName];

      if (v17) {
        break;
      }
    }

    if (v10 == ++v11) {
      goto LABEL_13;
    }
  }

  if (!Interface)
  {
LABEL_13:
    v18 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v18) {
      goto LABEL_19;
    }
    v18 = v18;
    if (!os_log_type_enabled(v18, v19)) {
      goto LABEL_18;
    }
    int v20 = SCError();
    v21 = SCErrorString(v20);
    int v27 = 136315138;
    CFArrayRef v28 = v21;
    v22 = "WiFi: renewLease failed. Couldn't find WiFi interface. %s";
    goto LABEL_17;
  }
  if (SCNetworkInterfaceForceConfigurationRefresh(Interface))
  {
    BOOL v23 = 1;
    goto LABEL_23;
  }
  v18 = WFLogForCategory(0);
  os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v18)
  {
    v18 = v18;
    if (!os_log_type_enabled(v18, v19)) {
      goto LABEL_18;
    }
    int v25 = SCError();
    objc_super v26 = SCErrorString(v25);
    int v27 = 136315138;
    CFArrayRef v28 = v26;
    v22 = "renewLease failed: %s";
LABEL_17:
    _os_log_impl(&dword_226071000, v18, v19, v22, (uint8_t *)&v27, 0xCu);
LABEL_18:
  }
LABEL_19:

  BOOL v23 = 0;
LABEL_23:
  CFRelease(v6);
LABEL_24:
  CFRelease(v8);
  return v23;
}

- (int64_t)ipv6ConfigMethod
{
  uint64_t v6 = 0;
  CFArrayRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__WFIPMonitor_ipv6ConfigMethod__block_invoke;
  v5[3] = &unk_26478EE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__WFIPMonitor_ipv6ConfigMethod__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig");
  id v6 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BD70]];

  if ([v6 isEqualToString:*MEMORY[0x263F1BE78]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 1;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F1BE80]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 2;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F1BE88]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 3;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F1BE90]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 4;
  }
  else
  {
    int v5 = [v6 isEqualToString:*MEMORY[0x263F1BE70]];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v5) {
      uint64_t v4 = 5;
    }
    else {
      uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  *(void *)(v3 + 24) = v4;
}

- (int64_t)ipv4ConfigMethod
{
  uint64_t v6 = 0;
  CFArrayRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__WFIPMonitor_ipv4ConfigMethod__block_invoke;
  v5[3] = &unk_26478EE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__WFIPMonitor_ipv4ConfigMethod__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
  id v6 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BD40]];

  if ([v6 isEqualToString:*MEMORY[0x263F1BE38]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 1;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F1BE58]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 2;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F1BE48]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 3;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F1BE60]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 4;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F1BE40]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 5;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F1BE50]])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = 7;
  }
  else
  {
    int v5 = [v6 isEqualToString:*MEMORY[0x263F1BE68]];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v5) {
      uint64_t v4 = 6;
    }
    else {
      uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  *(void *)(v3 + 24) = v4;
}

- (id)__ipv4StateConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC10], serviceID, (CFStringRef)*MEMORY[0x263F1BC50])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFArrayRef v7 = v6;
      uint64_t v8 = (void *)[v6 copy];
      CFRelease(v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)__ipv4InterfaceStateConfig
{
  CFStringRef interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC10], interfaceName, (CFStringRef)*MEMORY[0x263F1BC50])) != 0)
  {
    CFStringRef v5 = NetworkInterfaceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      CFArrayRef v7 = v6;
      uint64_t v8 = (void *)[v6 copy];
      CFRelease(v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)__ipv6StateConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC10], serviceID, (CFStringRef)*MEMORY[0x263F1BC58])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFArrayRef v7 = v6;
      uint64_t v8 = (void *)[v6 copy];
      CFRelease(v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)__ipv4SetupConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC08], serviceID, (CFStringRef)*MEMORY[0x263F1BC50])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFArrayRef v7 = v6;
      uint64_t v8 = (void *)[v6 copy];
      CFRelease(v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)__ipv6SetupConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC08], serviceID, (CFStringRef)*MEMORY[0x263F1BC58])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFArrayRef v7 = v6;
      uint64_t v8 = (void *)[v6 copy];
      CFRelease(v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)__dnsStateConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC10], serviceID, (CFStringRef)*MEMORY[0x263F1BC38])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFArrayRef v7 = v6;
      uint64_t v8 = (void *)[v6 copy];
      CFRelease(v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)__dnsSetupConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC08], serviceID, (CFStringRef)*MEMORY[0x263F1BC38])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFArrayRef v7 = v6;
      uint64_t v8 = (void *)[v6 copy];
      CFRelease(v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)ipv4Router
{
  uint64_t v6 = 0;
  CFArrayRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  CFIndex v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__WFIPMonitor_ipv4Router__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__WFIPMonitor_ipv4Router__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__ipv4StateConfig");
  uint64_t v3 = *MEMORY[0x263F1BD58];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BD58]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v10 objectForKeyedSubscript:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)ipv4SubnetMasks
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__WFIPMonitor_ipv4SubnetMasks__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__WFIPMonitor_ipv4SubnetMasks__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__ipv4StateConfig");
  uint64_t v3 = *MEMORY[0x263F1BD60];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BD60]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v10 objectForKeyedSubscript:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)ipv4Addresses
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__WFIPMonitor_ipv4Addresses__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__WFIPMonitor_ipv4Addresses__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__ipv4StateConfig");
  uint64_t v3 = *MEMORY[0x263F1BD38];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BD38]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v10 objectForKeyedSubscript:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)ipv4DHCPClientID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__WFIPMonitor_ipv4DHCPClientID__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__WFIPMonitor_ipv4DHCPClientID__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__ipv4StateConfig");
  uint64_t v3 = *MEMORY[0x263F1BD48];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BD48]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v10 objectForKeyedSubscript:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)DHCPLeaseExpirationDate
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__8;
  CFStringRef v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  uint64_t v3 = [(WFIPMonitor *)self __dhcpInfo];
  uint64_t v4 = v3;
  if (v3)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__WFIPMonitor_DHCPLeaseExpirationDate__block_invoke;
    v8[3] = &unk_26478EF18;
    id v10 = &v11;
    id v9 = v3;
    dispatch_sync(queue, v8);
  }
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __38__WFIPMonitor_DHCPLeaseExpirationDate__block_invoke(uint64_t a1)
{
  uint64_t v2 = DHCPInfoGetLeaseExpirationTime(*(CFDictionaryRef *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)ipv6Router
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__WFIPMonitor_ipv6Router__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__WFIPMonitor_ipv6Router__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__ipv6StateConfig");
  uint64_t v3 = *MEMORY[0x263F1BD90];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BD90]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v10 objectForKeyedSubscript:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)ipv6Addresses
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__WFIPMonitor_ipv6Addresses__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__WFIPMonitor_ipv6Addresses__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__ipv6StateConfig");
  uint64_t v3 = *MEMORY[0x263F1BD68];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BD68]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v10 objectForKeyedSubscript:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)ipv6PrefixLengths
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__WFIPMonitor_ipv6PrefixLengths__block_invoke;
  v5[3] = &unk_26478EF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__WFIPMonitor_ipv6PrefixLengths__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__ipv6StateConfig");
  uint64_t v3 = *MEMORY[0x263F1BD88];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BD88]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v10 objectForKeyedSubscript:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)dnsDomainName
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__8;
  uint64_t v14 = __Block_byref_object_dispose__8;
  id v15 = 0;
  if ([(WFIPMonitor *)self isUsingCustomDNSSettings])
  {
    uint64_t v3 = [(WFIPMonitor *)self __dnsSetupConfig];
    uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F1BCE0]];
    uint64_t v5 = (void *)v11[5];
    v11[5] = v4;
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __28__WFIPMonitor_dnsDomainName__block_invoke;
  v9[3] = &unk_26478EF18;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __28__WFIPMonitor_dnsDomainName__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__dnsStateConfig");
    uint64_t v3 = *MEMORY[0x263F1BCE0];
    uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BCE0]];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v10 objectForKeyedSubscript:v3];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

- (id)dnsSearchDomains
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__8;
  uint64_t v14 = __Block_byref_object_dispose__8;
  id v15 = 0;
  if ([(WFIPMonitor *)self isUsingCustomDNSSettings])
  {
    uint64_t v3 = [(WFIPMonitor *)self __dnsSetupConfig];
    uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F1BCE8]];
    uint64_t v5 = (void *)v11[5];
    v11[5] = v4;
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __31__WFIPMonitor_dnsSearchDomains__block_invoke;
  v9[3] = &unk_26478EF18;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __31__WFIPMonitor_dnsSearchDomains__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__dnsStateConfig");
    uint64_t v3 = *MEMORY[0x263F1BCE8];
    uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BCE8]];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v10 objectForKeyedSubscript:v3];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

- (id)dnsServerAddresses
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__8;
  uint64_t v14 = __Block_byref_object_dispose__8;
  id v15 = 0;
  if ([(WFIPMonitor *)self isUsingCustomDNSSettings])
  {
    uint64_t v3 = [(WFIPMonitor *)self __dnsSetupConfig];
    uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F1BCF0]];
    uint64_t v5 = (void *)v11[5];
    v11[5] = v4;
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __33__WFIPMonitor_dnsServerAddresses__block_invoke;
  v9[3] = &unk_26478EF18;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __33__WFIPMonitor_dnsServerAddresses__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__dnsStateConfig");
    uint64_t v3 = *MEMORY[0x263F1BCF0];
    uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1BCF0]];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v10 objectForKeyedSubscript:v3];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

- (BOOL)isUsingCustomDNSSettings
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__WFIPMonitor_isUsingCustomDNSSettings__block_invoke;
  v5[3] = &unk_26478EE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__WFIPMonitor_isUsingCustomDNSSettings__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__dnsSetupConfig");
  if (v2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)httpProxyServer
{
  uint64_t v2 = [(WFIPMonitor *)self __proxiesSetupConfig];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKey:*MEMORY[0x263F1BDF8]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)httpProxyPort
{
  id v2 = [(WFIPMonitor *)self __proxiesSetupConfig];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKey:*MEMORY[0x263F1BDF0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v4;
      uint64_t v4 = v2;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue"));
        id v2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v2 = 0;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = v2;

  return v5;
}

- (BOOL)httpProxyIsAuthenticated
{
  id v2 = [(WFIPMonitor *)self __proxiesSetupConfig];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKey:@"HTTPProxyAuthenticated"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)httpProxyUsername
{
  id v2 = [(WFIPMonitor *)self __proxiesSetupConfig];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKey:@"HTTPProxyUsername"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)httpProxyAutoConfigured
{
  id v2 = [(WFIPMonitor *)self __proxiesSetupConfig];
  char v3 = v2;
  if (v2
    && ([v2 objectForKey:*MEMORY[0x263F1BE18]],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v5 = v4;
    char v6 = [v4 BOOLValue];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)httpProxyAutoConfigURL
{
  id v2 = [(WFIPMonitor *)self __proxiesSetupConfig];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKey:*MEMORY[0x263F1BE20]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)__proxiesSetupConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC08], serviceID, (CFStringRef)*MEMORY[0x263F1BC88])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    char v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = (void *)[v6 copy];
      CFRelease(v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (BOOL)isUsingCustomProxySetting
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__WFIPMonitor_isUsingCustomProxySetting__block_invoke;
  v5[3] = &unk_26478EE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __40__WFIPMonitor_isUsingCustomProxySetting__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__proxiesSetupConfig");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if ([v4 count] == 2)
  {
    id v2 = +[WFSettingsProxy defaultProxyConfiguration];
    int v3 = [v4 isEqualToDictionary:v2];

    if (v3) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

- (BOOL)globalProxyIsEnabled
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263F1BC88];
  CFPropertyListRef v3 = CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x263F1BC88], @"com.apple.SystemConfiguration");
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  BOOL v5 = CFPreferencesAppValueIsForced(v2, @"com.apple.SystemConfiguration") != 0;
  CFRelease(v4);
  return v5;
}

- (id)__dhcpInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__WFIPMonitor___dhcpInfo__block_invoke;
  v5[3] = &unk_26478EE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__WFIPMonitor___dhcpInfo__block_invoke(uint64_t a1)
{
  CFStringRef v2 = (const __SCDynamicStore *)[*(id *)(a1 + 32) storeRef];
  id v3 = [*(id *)(a1 + 32) serviceID];
  CFDictionaryRef v4 = SCDynamicStoreCopyDHCPInfo(v2, v3);

  if (v4)
  {
    uint64_t v5 = [NSDictionary dictionaryWithDictionary:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    CFRelease(v4);
  }
}

- (BOOL)personalHotspotHasClients
{
  CFStringRef v2 = (void *)SCDynamicStoreCopyValue(self->_storeRef, @"com.apple.MobileInternetSharing");
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  CFDictionaryRef v4 = [v2 objectForKey:@"Hosts"];
  uint64_t v5 = v4;
  if (v4
    && ([v4 objectForKey:@"Type"], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v6 objectForKey:@"AirPort"];
    char v9 = v8;
    if (v8) {
      int v10 = [v8 intValue];
    }
    else {
      int v10 = 0;
    }
    id v11 = [v7 objectForKey:@"Bluetooth"];
    uint64_t v12 = v11;
    if (v11) {
      v10 += [v11 intValue];
    }
    BOOL v13 = v10 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  CFRelease(v3);

  return v13;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (__SCDynamicStore)storeRef
{
  return self->_storeRef;
}

- (void)setStoreRef:(__SCDynamicStore *)a3
{
  self->_storeRef = a3;
}

- (__SCPreferences)prefsRef
{
  return self->_prefsRef;
}

- (void)setPrefsRef:(__SCPreferences *)a3
{
  self->_prefsRef = a3;
}

- (__SCDynamicStore)networkServiceStore
{
  return self->_networkServiceStore;
}

- (void)setNetworkServiceStore:(__SCDynamicStore *)a3
{
  self->_networkServiceStore = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_dynamicStoreInfo, 0);
}

@end