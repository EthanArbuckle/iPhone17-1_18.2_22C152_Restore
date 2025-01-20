@interface PSSystemConfigurationDynamicStoreWifiWatcher
+ (BOOL)wifiEnabled;
+ (id)sharedInstance;
- (PSSystemConfigurationDynamicStoreWifiWatcher)init;
- (id)_wifiNameWithState:(id)a3;
- (id)_wifiPowerWithState:(id)a3;
- (id)_wifiTetheringWithState:(id)a3;
- (id)wifiConfig;
- (void)dealloc;
- (void)findKeysAirPortState:(id *)a3 andTetheringState:(id *)a4;
@end

@implementation PSSystemConfigurationDynamicStoreWifiWatcher

+ (id)sharedInstance
{
  if (sharedInstance_cacheOnce_71 != -1) {
    dispatch_once(&sharedInstance_cacheOnce_71, &__block_literal_global_73);
  }
  v2 = (void *)sharedInstance___dynamicStoreSharedInstance;
  return v2;
}

uint64_t __62__PSSystemConfigurationDynamicStoreWifiWatcher_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PSSystemConfigurationDynamicStoreWifiWatcher);
  uint64_t v1 = sharedInstance___dynamicStoreSharedInstance;
  sharedInstance___dynamicStoreSharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)wifiEnabled
{
  v2 = +[PSSystemConfigurationDynamicStoreWifiWatcher sharedInstance];
  v3 = [v2 wifiConfig];
  v4 = [v3 objectForKey:@"wifiPower"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)findKeysAirPortState:(id *)a3 andTetheringState:(id *)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F41AC8];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F41AF0];
  NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41AF0]);
  if (NetworkInterfaceEntity)
  {
    CFArrayRef v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:NetworkInterfaceEntity];
    SCDynamicStoreSetNotificationKeys(self->_prefs, v10, 0);
  }
  CFStringRef NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, v7);
  if (!NetworkInterface) {
    goto LABEL_33;
  }
  CFStringRef v12 = NetworkInterface;
  CFPropertyListRef v13 = SCDynamicStoreCopyValue(self->_prefs, NetworkInterface);
  CFRelease(v12);
  if (!v13) {
    goto LABEL_33;
  }
  CFTypeID v14 = CFGetTypeID(v13);
  if (v14 != CFDictionaryGetTypeID()
    || (v15 = (const void *)*MEMORY[0x1E4F41AD0],
        !CFDictionaryContainsKey((CFDictionaryRef)v13, (const void *)*MEMORY[0x1E4F41AD0]))
    || (CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v13, v15)) == 0
    || (CFArrayRef v17 = Value, v18 = CFGetTypeID(Value), v18 != CFArrayGetTypeID()))
  {
    CFRelease(v13);
    goto LABEL_33;
  }
  v63 = a3;
  v66 = self;
  v62 = a4;
  if (CFArrayGetCount(v17))
  {
    int v19 = socket(2, 2, 0);
    if (v19 == -1)
    {
      v61 = _PSLoggingFacility();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v81 = 136315138;
        *(void *)&v81[4] = "__WiFiManagerCopyAirPortInterfaces";
        _os_log_impl(&dword_1A6597000, v61, OS_LOG_TYPE_DEFAULT, "Socket creation failed at %s", v81, 0xCu);
      }

      v25 = 0;
      goto LABEL_26;
    }
    int v20 = v19;
    theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if (theArray)
    {
      if (CFArrayGetCount(v17) >= 1)
      {
        CFIndex v21 = 0;
        do
        {
          *(_OWORD *)v81 = 0u;
          memset(v82, 0, 28);
          *(void *)buffer = 0;
          uint64_t v80 = 0;
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v17, v21);
          if (ValueAtIndex)
          {
            CFStringRef v23 = ValueAtIndex;
            CFStringGetCString(ValueAtIndex, buffer, 16, 0);
            if (buffer[0])
            {
              __strcpy_chk();
              if (!ioctl(v20, 0xC02C6938uLL, v81) && (v82[0] & 0xE0) == 0x80) {
                CFArrayAppendValue(theArray, v23);
              }
            }
            else
            {
              v24 = _PSLoggingFacility();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v78 = "__WiFiManagerCopyAirPortInterfaces";
                _os_log_impl(&dword_1A6597000, v24, OS_LOG_TYPE_DEFAULT, "%s, interfaceCName is zero length.", buf, 0xCu);
              }
            }
          }
          ++v21;
        }
        while (v21 < CFArrayGetCount(v17));
      }
      v25 = theArray;
      CFIndex Count = CFArrayGetCount(theArray);
      close(v20);
      if (Count) {
        goto LABEL_26;
      }
      CFRelease(theArray);
    }
    else
    {
      close(v20);
    }
  }
  v25 = 0;
LABEL_26:
  CFRelease(v13);
  wifiKey = self->_wifiKey;
  CFMutableArrayRef theArraya = v25;
  if (wifiKey)
  {
    CFPropertyListRef v28 = SCDynamicStoreCopyValue(self->_prefs, wifiKey);
    if (v28)
    {
      v29 = (void *)v28;
      if (v63)
      {
        CFTypeID v30 = CFGetTypeID(v28);
        if (v30 == CFDictionaryGetTypeID()) {
          id *v63 = v29;
        }
      }
      CFRelease(v29);
    }
  }
  else
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v31 = v25;
    uint64_t v32 = [(__CFArray *)v31 countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v72;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v72 != v34) {
            objc_enumerationMutation(v31);
          }
          CFStringRef v36 = *(const __CFString **)(*((void *)&v71 + 1) + 8 * i);
          CFTypeID v37 = CFGetTypeID(v36);
          if (v37 == CFStringGetTypeID() && CFStringFind(v36, @"lo", 8uLL).location == -1)
          {
            CFStringRef v38 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, v7, v36, v8);
            if (v38)
            {
              v39 = (__CFString *)v38;
              CFPropertyListRef v40 = SCDynamicStoreCopyValue(v66->_prefs, v38);
              if (v40)
              {
                v41 = (void *)v40;
                v42 = v66->_wifiKey;
                if (v42) {
                  CFRelease(v42);
                }
                wifiInterface = v66->_wifiInterface;
                if (wifiInterface) {
                  CFRelease(wifiInterface);
                }
                v66->_wifiKey = v39;
                v66->_wifiInterface = (__CFString *)CFRetain(v36);
                if (v63)
                {
                  CFTypeID v44 = CFGetTypeID(v41);
                  if (v44 == CFDictionaryGetTypeID()) {
                    id *v63 = v41;
                  }
                }
                CFRelease(v41);
                goto LABEL_55;
              }
              CFRelease(v39);
            }
          }
        }
        uint64_t v33 = [(__CFArray *)v31 countByEnumeratingWithState:&v71 objects:v76 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }
LABEL_55:

    v25 = theArraya;
    self = v66;
  }
  if (self->_wifiInterface)
  {
    -[__CFArray removeObjectIdenticalTo:](v25, "removeObjectIdenticalTo:");
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v45 = v25;
    uint64_t v46 = [(__CFArray *)v45 countByEnumeratingWithState:&v67 objects:v75 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v68;
      CFStringRef v49 = (const __CFString *)*MEMORY[0x1E4F41B28];
      while (2)
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v68 != v48) {
            objc_enumerationMutation(v45);
          }
          CFStringRef v51 = *(const __CFString **)(*((void *)&v67 + 1) + 8 * j);
          CFTypeID v52 = CFGetTypeID(v51);
          if (v52 == CFStringGetTypeID() && CFStringFind(v51, @"lo", 8uLL).location == -1)
          {
            CFStringRef v53 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, v7, v51, v49);
            if (v53)
            {
              v54 = (__CFString *)v53;
              CFPropertyListRef v55 = SCDynamicStoreCopyValue(v66->_prefs, v53);
              if (v55)
              {
                v56 = (void *)v55;
                tetheringLink = v66->_tetheringLink;
                if (tetheringLink) {
                  CFRelease(tetheringLink);
                }
                v66->_tetheringLink = v54;
                if (v62)
                {
                  CFTypeID v58 = CFGetTypeID(v56);
                  if (v58 == CFDictionaryGetTypeID()) {
                    id *v62 = v56;
                  }
                }
                CFRelease(v56);
                goto LABEL_76;
              }
              CFRelease(v54);
            }
          }
        }
        uint64_t v47 = [(__CFArray *)v45 countByEnumeratingWithState:&v67 objects:v75 count:16];
        if (v47) {
          continue;
        }
        break;
      }
    }
LABEL_76:

    v25 = theArraya;
    self = v66;
  }
  v59 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v60 = v59;
  if (self->_wifiKey)
  {
    objc_msgSend(v59, "addObject:");
    if (self->_tetheringLink) {
      objc_msgSend(v60, "addObject:");
    }
    SCDynamicStoreSetNotificationKeys(self->_prefs, (CFArrayRef)v60, 0);
  }

LABEL_33:
}

- (id)_wifiTetheringWithState:(id)a3
{
  v3 = [a3 objectForKey:*MEMORY[0x1E4F41D30]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [NSNumber numberWithBool:0];
  }
  char v5 = v4;

  return v5;
}

- (id)_wifiPowerWithState:(id)a3
{
  v3 = [a3 objectForKey:@"POWER"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    id v4 = [v3 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  id v4 = [NSNumber numberWithBool:0];
LABEL_6:

  return v4;
}

- (id)_wifiNameWithState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"WiFiNetworkType"];
  char v5 = v4;
  if (v4 && [v4 intValue] == 1)
  {
    v6 = 0;
  }
  else
  {
    v6 = [v3 objectForKey:@"SSID_STR"];
  }

  return v6;
}

- (id)wifiConfig
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  wifiKey = self->_wifiKey;
  if (wifiKey && self->_tetheringLink)
  {
    CFPropertyListRef v5 = SCDynamicStoreCopyValue(self->_prefs, wifiKey);
    id v6 = (id)v5;
    if (v5)
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 != CFDictionaryGetTypeID())
      {
        CFRelease(v6);
        id v6 = 0;
      }
    }
    CFPropertyListRef v8 = SCDynamicStoreCopyValue(self->_prefs, self->_tetheringLink);
    id v9 = (id)v8;
    if (v8)
    {
      CFTypeID v10 = CFGetTypeID(v8);
      if (v10 != CFDictionaryGetTypeID())
      {
        CFRelease(v9);
        id v9 = 0;
      }
    }
  }
  else
  {
    id v15 = 0;
    id v16 = 0;
    [(PSSystemConfigurationDynamicStoreWifiWatcher *)self findKeysAirPortState:&v16 andTetheringState:&v15];
    id v6 = v16;
    id v9 = v15;
  }
  v11 = [(PSSystemConfigurationDynamicStoreWifiWatcher *)self _wifiNameWithState:v6];
  if (v11) {
    [v3 setObject:v11 forKey:@"wifiName"];
  }
  CFStringRef v12 = [(PSSystemConfigurationDynamicStoreWifiWatcher *)self _wifiPowerWithState:v6];
  if (v12) {
    [v3 setObject:v12 forKey:@"wifiPower"];
  }
  CFPropertyListRef v13 = [(PSSystemConfigurationDynamicStoreWifiWatcher *)self _wifiTetheringWithState:v9];
  if (v13) {
    [v3 setObject:v13 forKey:@"wifiTethering"];
  }

  return v3;
}

- (PSSystemConfigurationDynamicStoreWifiWatcher)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSSystemConfigurationDynamicStoreWifiWatcher;
  v2 = [(PSSystemConfigurationDynamicStoreWifiWatcher *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    v7.version = 0;
    memset(&v7.retain, 0, 24);
    v7.info = v2;
    id v4 = SCDynamicStoreCreateWithOptions(0, @"com.apple.preferences", 0, (SCDynamicStoreCallBack)WifiStateChanged, &v7);
    v3->_prefs = v4;
    if (!v4)
    {
      CFPropertyListRef v5 = 0;
      goto LABEL_6;
    }
    SCDynamicStoreSetDispatchQueue(v4, MEMORY[0x1E4F14428]);
  }
  CFPropertyListRef v5 = v3;
LABEL_6:

  return v5;
}

- (void)dealloc
{
  prefs = self->_prefs;
  if (prefs)
  {
    SCDynamicStoreSetDispatchQueue(prefs, 0);
    CFRelease(self->_prefs);
  }
  wifiKey = self->_wifiKey;
  if (wifiKey) {
    CFRelease(wifiKey);
  }
  wifiInterface = self->_wifiInterface;
  if (wifiInterface) {
    CFRelease(wifiInterface);
  }
  tetheringLink = self->_tetheringLink;
  if (tetheringLink) {
    CFRelease(tetheringLink);
  }
  v7.receiver = self;
  v7.super_class = (Class)PSSystemConfigurationDynamicStoreWifiWatcher;
  [(PSSystemConfigurationDynamicStoreWifiWatcher *)&v7 dealloc];
}

@end