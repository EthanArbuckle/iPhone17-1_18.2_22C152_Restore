@interface PSSystemConfiguration
+ (id)sharedInstance;
- (__CFString)dataServiceID;
- (__CFString)getServiceIDForPDPContext:(unsigned int)a3;
- (__CFString)voicemailServiceID;
- (id)interfaceConfigurationValueForKey:(__CFString *)a3 serviceID:(__CFString *)a4;
- (id)protocolConfiguration:(__CFString *)a3 serviceID:(__CFString *)a4;
- (id)protocolConfigurationValueForKey:(__CFString *)a3 protocolType:(__CFString *)a4 serviceID:(__CFString *)a5;
- (unsigned)synchronizeForWriting:(BOOL)a3;
- (void)cleanupPrefs;
- (void)dealloc;
- (void)setInterfaceConfigurationValue:(id)a3 forKey:(__CFString *)a4 serviceID:(__CFString *)a5;
- (void)setProtocolConfiguration:(id)a3 protocolType:(__CFString *)a4 serviceID:(__CFString *)a5;
- (void)setProtocolConfigurationValue:(id)a3 forKey:(__CFString *)a4 protocolType:(__CFString *)a5 serviceID:(__CFString *)a6;
@end

@implementation PSSystemConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_cacheOnce != -1) {
    dispatch_once(&sharedInstance_cacheOnce, &__block_literal_global_37);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __39__PSSystemConfiguration_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PSSystemConfiguration);
  uint64_t v1 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)dealloc
{
  prefs = self->_prefs;
  if (prefs) {
    CFRelease(prefs);
  }
  v4.receiver = self;
  v4.super_class = (Class)PSSystemConfiguration;
  [(PSSystemConfiguration *)&v4 dealloc];
}

- (unsigned)synchronizeForWriting:(BOOL)a3
{
  prefs = self->_prefs;
  if (!prefs)
  {
    v7 = SCPreferencesCreateWithAuthorization(0, @"com.apple.preferences", 0, 0);
    self->_prefs = v7;
    if (a3) {
      goto LABEL_6;
    }
LABEL_10:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (!a3)
  {
    SCPreferencesSynchronize(prefs);
    goto LABEL_10;
  }
  int v6 = SCPreferencesLock(prefs, 1u);
  if (v6) {
    goto LABEL_7;
  }
  SCPreferencesSynchronize(self->_prefs);
  v7 = self->_prefs;
LABEL_6:
  int v6 = SCPreferencesLock(v7, 1u);
LABEL_7:
  if (!v6)
  {
    int v8 = SCError();
    v9 = SCErrorString(v8);
    NSLog(&cfstr_Scpreferencesl.isa, v9);
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)cleanupPrefs
{
  prefs = self->_prefs;
  if (prefs)
  {
    CFRelease(prefs);
    self->_prefs = 0;
  }
}

- (__CFString)dataServiceID
{
  [(PSSystemConfiguration *)self synchronizeForWriting:0];
  v3 = SCNetworkSetCopyCurrent(self->_prefs);
  if (!v3)
  {
    v17 = 0;
    goto LABEL_17;
  }
  objc_super v4 = v3;
  CFArrayRef v5 = SCNetworkSetCopyServices(v3);
  if (!v5)
  {
    v17 = 0;
    goto LABEL_16;
  }
  CFArrayRef v6 = v5;
  CFIndex Count = CFArrayGetCount(v5);
  if (Count < 1)
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  CFIndex v8 = Count;
  CFIndex v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v6, v9);
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    if (!Interface) {
      goto LABEL_11;
    }
    v12 = Interface;
    CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
    if (!InterfaceType || !CFEqual(InterfaceType, @"com.apple.CommCenter")) {
      goto LABEL_11;
    }
    v14 = SCNetworkInterfaceGetConfiguration(v12);
    v15 = [v14 objectForKey:@"AllowNetworkAccess"];
    v16 = v15;
    if (v15)
    {
      if ([v15 BOOLValue]) {
        break;
      }
    }

LABEL_11:
    if (v8 == ++v9) {
      goto LABEL_12;
    }
  }
  v17 = (__CFString *)(id)[(__CFString *)(id)SCNetworkServiceGetServiceID(ValueAtIndex) copy];

LABEL_13:
  CFRelease(v6);
LABEL_16:
  CFRelease(v4);
LABEL_17:
  [(PSSystemConfiguration *)self cleanupPrefs];
  return v17;
}

- (__CFString)voicemailServiceID
{
  [(PSSystemConfiguration *)self synchronizeForWriting:0];
  v3 = SCNetworkSetCopyCurrent(self->_prefs);
  if (!v3)
  {
    v17 = 0;
    goto LABEL_17;
  }
  objc_super v4 = v3;
  CFArrayRef v5 = SCNetworkSetCopyServices(v3);
  if (!v5)
  {
    v17 = 0;
    goto LABEL_16;
  }
  CFArrayRef v6 = v5;
  CFIndex Count = CFArrayGetCount(v5);
  if (Count < 1)
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  CFIndex v8 = Count;
  CFIndex v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v6, v9);
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    if (!Interface) {
      goto LABEL_11;
    }
    v12 = Interface;
    CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
    if (!InterfaceType || !CFEqual(InterfaceType, @"com.apple.CommCenter")) {
      goto LABEL_11;
    }
    v14 = SCNetworkInterfaceGetConfiguration(v12);
    v15 = [v14 objectForKey:@"AllowNetworkAccess"];
    v16 = v15;
    if (v15)
    {
      if (![v15 BOOLValue]) {
        break;
      }
    }

LABEL_11:
    if (v8 == ++v9) {
      goto LABEL_12;
    }
  }
  v17 = (__CFString *)(id)[(__CFString *)(id)SCNetworkServiceGetServiceID(ValueAtIndex) copy];

LABEL_13:
  CFRelease(v6);
LABEL_16:
  CFRelease(v4);
LABEL_17:
  [(PSSystemConfiguration *)self cleanupPrefs];
  return v17;
}

- (__CFString)getServiceIDForPDPContext:(unsigned int)a3
{
  CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"ip%d", a3);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  [(PSSystemConfiguration *)self synchronizeForWriting:0];
  CFArrayRef v6 = SCNetworkSetCopyCurrent(self->_prefs);
  if (v6)
  {
    v7 = v6;
    CFArrayRef v8 = SCNetworkSetCopyServices(v6);
    if (v8)
    {
      CFArrayRef v9 = v8;
      CFIndex Count = CFArrayGetCount(v8);
      if (Count < 1)
      {
LABEL_12:
        v18 = 0;
      }
      else
      {
        CFIndex v11 = Count;
        CFIndex v12 = 0;
        while (1)
        {
          ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v9, v12);
          Interface = SCNetworkServiceGetInterface(ValueAtIndex);
          if (Interface)
          {
            v15 = Interface;
            CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
            if (InterfaceType)
            {
              if (CFEqual(InterfaceType, @"com.apple.CommCenter"))
              {
                CFStringRef BSDName = SCNetworkInterfaceGetBSDName(v15);
                if (BSDName)
                {
                  if (CFEqual(v5, BSDName)) {
                    break;
                  }
                }
              }
            }
          }
          if (v11 == ++v12) {
            goto LABEL_12;
          }
        }
        v18 = (__CFString *)(id)[(__CFString *)(id)SCNetworkServiceGetServiceID(ValueAtIndex) copy];
      }
      CFRelease(v9);
    }
    else
    {
      v18 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v18 = 0;
  }
  CFRelease(v5);
  [(PSSystemConfiguration *)self cleanupPrefs];
  return v18;
}

- (id)interfaceConfigurationValueForKey:(__CFString *)a3 serviceID:(__CFString *)a4
{
  if (a4)
  {
    [(PSSystemConfiguration *)self synchronizeForWriting:0];
    v7 = SCNetworkServiceCopy(self->_prefs, a4);
    if (v7)
    {
      CFArrayRef v8 = v7;
      Interface = SCNetworkServiceGetInterface(v7);
      if (Interface)
      {
        v10 = SCNetworkInterfaceGetConfiguration(Interface);
        CFIndex v11 = v10;
        if (v10)
        {
          CFIndex v12 = [v10 objectForKey:a3];
          v13 = (void *)[v12 copy];
        }
        else
        {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v13 = 0;
    }
    [(PSSystemConfiguration *)self cleanupPrefs];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)setInterfaceConfigurationValue:(id)a3 forKey:(__CFString *)a4 serviceID:(__CFString *)a5
{
  id v18 = a3;
  if (a5 && [(PSSystemConfiguration *)self synchronizeForWriting:1])
  {
    CFArrayRef v8 = SCNetworkServiceCopy(self->_prefs, a5);
    if (!v8)
    {
LABEL_17:
      [(PSSystemConfiguration *)self cleanupPrefs];
      goto LABEL_18;
    }
    CFArrayRef v9 = v8;
    Interface = SCNetworkServiceGetInterface(v8);
    if (!Interface)
    {
LABEL_16:
      CFRelease(v9);
      goto LABEL_17;
    }
    CFIndex v11 = Interface;
    CFIndex v12 = SCNetworkInterfaceGetConfiguration(Interface);
    v13 = v12;
    if (!v12)
    {
      NSLog(&cfstr_Setinterfaceco.isa, a4, v18);
LABEL_15:

      goto LABEL_16;
    }
    v14 = (void *)[v12 mutableCopy];
    [v14 setObject:v18 forKey:a4];
    [v14 setObject:*MEMORY[0x1E4F1CFD0] forKey:@"SettingsHaveBeenAlteredByPreferences"];
    if (SCNetworkInterfaceSetConfiguration(v11, (CFDictionaryRef)v14))
    {
      if (SCPreferencesCommitChanges(self->_prefs))
      {
        if (SCPreferencesApplyChanges(self->_prefs))
        {
LABEL_14:

          goto LABEL_15;
        }
        v15 = @"SCPreferencesApplyChanges failed: %s";
      }
      else
      {
        v15 = @"SCPreferencesCommitChanges failed: %s";
      }
    }
    else
    {
      v15 = @"SCNetworkInterfaceSetConfiguration failed: %s";
    }
    int v16 = SCError();
    v17 = SCErrorString(v16);
    NSLog(&v15->isa, v17);
    goto LABEL_14;
  }
LABEL_18:
}

- (id)protocolConfiguration:(__CFString *)a3 serviceID:(__CFString *)a4
{
  if (a4)
  {
    [(PSSystemConfiguration *)self synchronizeForWriting:0];
    v7 = SCNetworkServiceCopy(self->_prefs, a4);
    if (v7)
    {
      CFArrayRef v8 = v7;
      CFArrayRef v9 = SCNetworkServiceCopyProtocol(v7, a3);
      if (v9)
      {
        v10 = v9;
        CFIndex v11 = SCNetworkProtocolGetConfiguration(v9);
        CFIndex v12 = v11;
        if (v11) {
          v13 = (void *)[v11 copy];
        }
        else {
          v13 = 0;
        }
        CFRelease(v10);
      }
      else
      {
        v13 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v13 = 0;
    }
    [(PSSystemConfiguration *)self cleanupPrefs];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)setProtocolConfiguration:(id)a3 protocolType:(__CFString *)a4 serviceID:(__CFString *)a5
{
  CFDictionaryRef config = (const __CFDictionary *)a3;
  if (a5 && [(PSSystemConfiguration *)self synchronizeForWriting:1])
  {
    CFArrayRef v8 = SCNetworkServiceCopy(self->_prefs, a5);
    if (!v8)
    {
LABEL_14:
      [(PSSystemConfiguration *)self cleanupPrefs];
      goto LABEL_15;
    }
    CFArrayRef v9 = v8;
    v10 = SCNetworkServiceCopyProtocol(v8, a4);
    if (!v10)
    {
LABEL_13:
      CFRelease(v9);
      goto LABEL_14;
    }
    CFIndex v11 = v10;
    if (SCNetworkProtocolSetConfiguration(v10, config))
    {
      if (SCPreferencesCommitChanges(self->_prefs))
      {
        if (SCPreferencesApplyChanges(self->_prefs))
        {
LABEL_12:
          CFRelease(v11);
          goto LABEL_13;
        }
        CFIndex v12 = @"SCPreferencesApplyChanges failed: %s";
      }
      else
      {
        CFIndex v12 = @"SCPreferencesCommitChanges failed: %s";
      }
    }
    else
    {
      CFIndex v12 = @"SCNetworkProtocolSetConfiguration failed: %s";
    }
    int v13 = SCError();
    v14 = SCErrorString(v13);
    NSLog(&v12->isa, v14);
    goto LABEL_12;
  }
LABEL_15:
}

- (id)protocolConfigurationValueForKey:(__CFString *)a3 protocolType:(__CFString *)a4 serviceID:(__CFString *)a5
{
  if (a5)
  {
    [(PSSystemConfiguration *)self synchronizeForWriting:0];
    CFArrayRef v9 = SCNetworkServiceCopy(self->_prefs, a5);
    if (v9)
    {
      v10 = v9;
      CFIndex v11 = SCNetworkServiceCopyProtocol(v9, a4);
      if (v11)
      {
        CFIndex v12 = v11;
        int v13 = SCNetworkProtocolGetConfiguration(v11);
        v14 = v13;
        if (v13)
        {
          v15 = [v13 objectForKey:a3];
          int v16 = (void *)[v15 copy];
        }
        else
        {
          int v16 = 0;
        }
        CFRelease(v12);
      }
      else
      {
        int v16 = 0;
      }
      CFRelease(v10);
    }
    else
    {
      int v16 = 0;
    }
    [(PSSystemConfiguration *)self cleanupPrefs];
  }
  else
  {
    int v16 = 0;
  }
  return v16;
}

- (void)setProtocolConfigurationValue:(id)a3 forKey:(__CFString *)a4 protocolType:(__CFString *)a5 serviceID:(__CFString *)a6
{
  id v20 = a3;
  if (a6 && [(PSSystemConfiguration *)self synchronizeForWriting:1])
  {
    v10 = SCNetworkServiceCopy(self->_prefs, a6);
    if (!v10)
    {
LABEL_17:
      [(PSSystemConfiguration *)self cleanupPrefs];
      goto LABEL_18;
    }
    CFIndex v11 = v10;
    CFIndex v12 = SCNetworkServiceCopyProtocol(v10, a5);
    if (!v12)
    {
LABEL_16:
      CFRelease(v11);
      goto LABEL_17;
    }
    int v13 = v12;
    v14 = SCNetworkProtocolGetConfiguration(v12);
    v15 = v14;
    if (!v14)
    {
      NSLog(&cfstr_Setprotocolcon.isa, a4, v20);
LABEL_15:
      CFRelease(v13);

      goto LABEL_16;
    }
    int v16 = (void *)[v14 mutableCopy];
    [v16 setObject:v20 forKey:a4];
    if (SCNetworkProtocolSetConfiguration(v13, (CFDictionaryRef)v16))
    {
      if (SCPreferencesCommitChanges(self->_prefs))
      {
        if (SCPreferencesApplyChanges(self->_prefs))
        {
LABEL_14:

          goto LABEL_15;
        }
        v17 = @"SCPreferencesApplyChanges failed: %s";
      }
      else
      {
        v17 = @"SCPreferencesCommitChanges failed: %s";
      }
    }
    else
    {
      v17 = @"SCNetworkProtocolSetConfiguration failed: %s";
    }
    int v18 = SCError();
    v19 = SCErrorString(v18);
    NSLog(&v17->isa, v19);
    goto LABEL_14;
  }
LABEL_18:
}

@end