@interface NPSSettingAccessor
+ (id)serializeObject:(id)a3 error:(id *)a4;
+ (id)unserializeObject:(id)a3 error:(id *)a4;
- (BOOL)hasChangesToWrite;
- (BOOL)requiresDeviceUnlockedSinceBoot;
- (BOOL)sizeSafeToLoadInMemory;
- (BOOL)sizeSafeToWrite;
- (BOOL)synchronize;
- (BOOL)synchronizeForWriting;
- (NPSDomainAccessor)nanoDomainAccessor;
- (NPSSettingAccessor)initWithNanoDomain:(id)a3;
- (NPSSettingAccessor)initWithUserDefaultsDomain:(id)a3 container:(id)a4 appGroupContainer:(id)a5;
- (NPSSettingAccessor)initWithUserDefaultsDomain:(id)a3 containerPath:(id)a4;
- (NSString)appGroupContainer;
- (NSString)container;
- (NSString)containerPath;
- (NSString)domain;
- (id)copyKeyList;
- (id)objectForKey:(id)a3;
- (id)serializedObjectForKey:(id)a3 error:(id *)a4;
- (id)typeString;
- (int64_t)type;
- (unint64_t)domainPlistSize;
- (void)setAppGroupContainer:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContainerPath:(id)a3;
- (void)setDomain:(id)a3;
- (void)setHasChangesToWrite:(BOOL)a3;
- (void)setNanoDomainAccessor:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setType:(int64_t)a3;
@end

@implementation NPSSettingAccessor

- (NPSSettingAccessor)initWithUserDefaultsDomain:(id)a3 container:(id)a4 appGroupContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sub_100025CA0(v9, v10);
  v12 = (void *)v11;
  if (!v9 || v11)
  {
    v15 = [(NPSSettingAccessor *)self initWithUserDefaultsDomain:v8 containerPath:v11];
    p_isa = (id *)&v15->super.isa;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_container, a4);
      objc_storeStrong(p_isa + 5, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v13 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not resolve containerPath for container (%@)", (uint8_t *)&v18, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (NPSSettingAccessor)initWithUserDefaultsDomain:(id)a3 containerPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)NPSSettingAccessor;
    id v9 = [(NPSSettingAccessor *)&v13 init];
    id v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_domain, a3);
      objc_storeStrong((id *)&v10->_containerPath, a4);
      v10->_type = 0;
      v10->_hasChangesToWrite = 0;
    }
    self = v10;
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NPSSettingAccessor)initWithNanoDomain:(id)a3
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v5];
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)NPSSettingAccessor;
    id v7 = [(NPSSettingAccessor *)&v11 init];
    id v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_domain, a3);
      objc_storeStrong((id *)&v8->_nanoDomainAccessor, v6);
      v8->_type = 1;
    }
    self = v8;
    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (NSString)containerPath
{
  sub_100025CA0(self->_container, self->_appGroupContainer);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  p_containerPath = (id *)&self->_containerPath;
  containerPath = self->_containerPath;
  if (v3)
  {
    if (![(NSString *)v3 isEqualToString:containerPath])
    {
      id v7 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (NSString *)*p_containerPath;
        int v15 = 138412546;
        v16 = v8;
        __int16 v17 = 2112;
        int v18 = v4;
        id v9 = "Container path changed from (%@) to (%@)";
        id v10 = v7;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else if (containerPath)
  {
    objc_super v11 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      container = self->_container;
      objc_super v13 = self->_containerPath;
      int v15 = 138412546;
      v16 = container;
      __int16 v17 = 2112;
      int v18 = v13;
      id v9 = "Could not resolve containerPath for container (%@), previous containerPath: (%@)";
      id v10 = v11;
      goto LABEL_8;
    }
  }
  objc_storeStrong(p_containerPath, v4);
  return v4;
}

- (BOOL)synchronizeForWriting
{
  if (self->_hasChangesToWrite) {
    return [(NPSSettingAccessor *)self synchronize];
  }
  else {
    return 1;
  }
}

- (BOOL)synchronize
{
  int64_t type = self->_type;
  if (type == 1)
  {
    id v9 = [(NPSDomainAccessor *)self->_nanoDomainAccessor synchronize];
    BOOL v6 = v9 != 0;

    id v10 = nps_daemon_log;
    if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    domain = self->_domain;
    int v16 = 138412546;
    __int16 v17 = domain;
    __int16 v18 = 1024;
    LODWORD(v19) = v9 != 0;
    v12 = "Synchronized nano-setting domain (%@); ret: (%d).";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x12u);
    return v6;
  }
  if (type) {
    return 0;
  }
  v4 = [(NPSSettingAccessor *)self containerPath];
  if (!v4)
  {
    int v13 = CFPreferencesSynchronize((CFStringRef)self->_domain, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    BOOL v6 = v13 != 0;
    id v10 = nps_daemon_log;
    if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    v14 = self->_domain;
    int v16 = 138412546;
    __int16 v17 = v14;
    __int16 v18 = 1024;
    LODWORD(v19) = v13 != 0;
    v12 = "Synchronized user defaults domain (%@); ret: (%d).";
    goto LABEL_12;
  }
  int v5 = _CFPreferencesSynchronizeWithContainer();
  BOOL v6 = v5 != 0;
  id v7 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = self->_domain;
    int v16 = 138412802;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 1024;
    BOOL v21 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Synchronized user defaults domain (%@) for containerPath: (%@); ret: (%d).",
      (uint8_t *)&v16,
      0x1Cu);
  }

  return v6;
}

- (id)objectForKey:(id)a3
{
  v4 = (__CFString *)a3;
  int64_t type = self->_type;
  if (type == 1)
  {
    id v8 = [(NPSDomainAccessor *)self->_nanoDomainAccessor objectForKey:v4];
    v12 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      CFStringRef v14 = @"YES";
      int v19 = 138412802;
      if (!v8) {
        CFStringRef v14 = @"NO";
      }
      __int16 v20 = domain;
      __int16 v21 = 2112;
      v22 = v4;
      __int16 v23 = 2114;
      CFStringRef v24 = v14;
      int v15 = "Read nano-setting <%@, %@>; value: (%{public}@)";
      goto LABEL_17;
    }
LABEL_18:
    id v7 = 0;
    goto LABEL_19;
  }
  if (type)
  {
    id v7 = 0;
    id v8 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = [(NPSSettingAccessor *)self containerPath];
  if (!v6)
  {
    id v8 = (void *)CFPreferencesCopyValue(v4, (CFStringRef)self->_domain, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    v12 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = self->_domain;
      CFStringRef v17 = @"YES";
      int v19 = 138412802;
      if (!v8) {
        CFStringRef v17 = @"NO";
      }
      __int16 v20 = v16;
      __int16 v21 = 2112;
      v22 = v4;
      __int16 v23 = 2114;
      CFStringRef v24 = v17;
      int v15 = "Read user default <%@, %@>; value: (%{public}@)";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, 0x20u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  id v7 = (__CFString *)v6;
  id v8 = (void *)_CFPreferencesCopyValueWithContainer();
  id v9 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_domain;
    CFStringRef v11 = @"YES";
    int v19 = 138413058;
    if (!v8) {
      CFStringRef v11 = @"NO";
    }
    __int16 v20 = v10;
    __int16 v21 = 2112;
    v22 = v4;
    __int16 v23 = 2112;
    CFStringRef v24 = v7;
    __int16 v25 = 2114;
    CFStringRef v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Read containerized user default <%@, %@> for containerPath: (%@); value: (%{public}@)",
      (uint8_t *)&v19,
      0x2Au);
  }
LABEL_19:

  return v8;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if ([(NPSSettingAccessor *)self sizeSafeToWrite])
  {
    int64_t type = self->_type;
    if (type == 1)
    {
      [(NPSDomainAccessor *)self->_nanoDomainAccessor setObject:v6 forKey:v7];
      int v16 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        domain = self->_domain;
        int v20 = 138412802;
        __int16 v21 = domain;
        __int16 v22 = 2112;
        __int16 v23 = v7;
        __int16 v24 = 2112;
        unint64_t v25 = (unint64_t)v6;
        __int16 v18 = "Written nano-setting <%@, %@>; value: (%@)";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0x20u);
      }
    }
    else if (!type)
    {
      uint64_t v9 = [(NPSSettingAccessor *)self containerPath];
      if (v9)
      {
        id v10 = (void *)v9;
        _CFPreferencesSetValueWithContainer();
        CFStringRef v11 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          v12 = self->_domain;
          int v20 = 138413058;
          __int16 v21 = v12;
          __int16 v22 = 2112;
          __int16 v23 = v7;
          __int16 v24 = 2112;
          unint64_t v25 = (unint64_t)v10;
          __int16 v26 = 2112;
          id v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Written containerized user default <%@, %@> for containerPath: (%@); value: (%@)",
            (uint8_t *)&v20,
            0x2Au);
        }

        goto LABEL_15;
      }
      CFPreferencesSetValue(v7, v6, (CFStringRef)self->_domain, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      int v16 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = self->_domain;
        int v20 = 138412802;
        __int16 v21 = v19;
        __int16 v22 = 2112;
        __int16 v23 = v7;
        __int16 v24 = 2112;
        unint64_t v25 = (unint64_t)v6;
        __int16 v18 = "Written user default <%@, %@>; value: (%@)";
        goto LABEL_14;
      }
    }
LABEL_15:
    self->_hasChangesToWrite = 1;
    goto LABEL_16;
  }
  int v13 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = self->_domain;
    int v15 = v13;
    int v20 = 138412802;
    __int16 v21 = v14;
    __int16 v22 = 2112;
    __int16 v23 = v7;
    __int16 v24 = 2048;
    unint64_t v25 = [(NPSSettingAccessor *)self domainPlistSize];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not safe to write value into domain %@ for key %@. (size %lld Bytes is beyond what we can handle)", (uint8_t *)&v20, 0x20u);
  }
LABEL_16:
}

- (id)copyKeyList
{
  int64_t type = self->_type;
  if (type == 1)
  {
    nanoDomainAccessor = self->_nanoDomainAccessor;
    return [(NPSDomainAccessor *)nanoDomainAccessor copyKeyList];
  }
  else
  {
    if (!type)
    {
      int v5 = [(NPSSettingAccessor *)self containerPath];
      if (v5)
      {
        id v6 = (void *)_CFPrefsCopyAppDictionaryWithContainer();
        id v7 = [v6 allKeys];
      }
      else
      {
        id v7 = CFPreferencesCopyKeyList((CFStringRef)self->_domain, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      }
      v2 = +[NSSet setWithArray:v7];
    }
    return v2;
  }
}

- (id)serializedObjectForKey:(id)a3 error:(id *)a4
{
  int v5 = [(NPSSettingAccessor *)self objectForKey:a3];
  id v6 = [(id)objc_opt_class() serializeObject:v5 error:a4];

  return v6;
}

+ (id)serializeObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    CFErrorRef error = 0;
    CFDataRef v6 = CFPropertyListCreateData(kCFAllocatorDefault, v5, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    CFDataRef v7 = v6;
    if (error) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      uint64_t v9 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        CFErrorRef v15 = error;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to serialized value (%@) with error: %@ ", buf, 0x16u);
      }
      if (a4) {
        *a4 = error;
      }
      CFRelease(error);
    }
  }
  else
  {
    CFDataRef v7 = 0;
  }

  return v7;
}

+ (id)unserializeObject:(id)a3 error:(id *)a4
{
  CFDataRef v5 = (const __CFData *)a3;
  if (v5)
  {
    CFErrorRef error = 0;
    CFPropertyListRef v6 = CFPropertyListCreateWithData(kCFAllocatorDefault, v5, 0, 0, &error);
    CFDataRef v7 = (void *)v6;
    if (error) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      uint64_t v9 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFDataRef v13 = v5;
        __int16 v14 = 2112;
        CFErrorRef v15 = error;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to unserialized data (%@) with error: %@", buf, 0x16u);
      }
      if (a4) {
        *a4 = error;
      }
      CFRelease(error);
    }
  }
  else
  {
    CFDataRef v7 = 0;
  }

  return v7;
}

- (unint64_t)domainPlistSize
{
  int64_t type = self->_type;
  if (type == 1)
  {
    nanoDomainAccessor = self->_nanoDomainAccessor;
    return (unint64_t)[(NPSDomainAccessor *)nanoDomainAccessor domainSize];
  }
  else if (type)
  {
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_FAULT)) {
      sub_100029008();
    }
    return 0;
  }
  else
  {
    return (unint64_t)+[NPSPrefPlistSizeUtil prefSizeFor:inContainer:](NPSPrefPlistSizeUtil, "prefSizeFor:inContainer:");
  }
}

- (BOOL)sizeSafeToWrite
{
  unint64_t v3 = [(NPSSettingAccessor *)self domainPlistSize];
  int64_t type = self->_type;
  if (type != 1)
  {
    if (!type) {
      return v3 <= 0x300000;
    }
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_FAULT)) {
      sub_100029008();
    }
  }
  return 1;
}

- (BOOL)sizeSafeToLoadInMemory
{
  unint64_t v3 = [(NPSSettingAccessor *)self domainPlistSize];
  v4 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "domain size: %llu", (uint8_t *)&v6, 0xCu);
  }
  if (self->_type <= 1uLL) {
    return v3 <= 0x19000;
  }
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_FAULT)) {
    sub_100029008();
  }
  return 1;
}

- (id)typeString
{
  int64_t type = self->_type;
  if (!type) {
    return @"UserDefaults";
  }
  if (type == 1) {
    return @"NanoSetting";
  }
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_FAULT)) {
    sub_100029008();
  }
  return @"undefined";
}

- (BOOL)requiresDeviceUnlockedSinceBoot
{
  int64_t type = self->_type;
  if (type == 1)
  {
    unsigned int v9 = [(NPSDomainAccessor *)self->_nanoDomainAccessor requiresDeviceUnlockedSinceBoot];
  }
  else if (type)
  {
    unsigned int v9 = 0;
  }
  else
  {
    int FileProtectionClass = _CFPreferencesGetFileProtectionClass();
    CFDataRef v5 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      containerPath = self->_containerPath;
      int v14 = 136315906;
      CFErrorRef v15 = "-[NPSSettingAccessor requiresDeviceUnlockedSinceBoot]";
      __int16 v16 = 2112;
      CFStringRef v17 = (const __CFString *)domain;
      __int16 v18 = 2112;
      int v19 = containerPath;
      __int16 v20 = 1024;
      int v21 = FileProtectionClass;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Protection Class for %@ at path %@ is %d", (uint8_t *)&v14, 0x26u);
    }
    unsigned int v9 = FileProtectionClass != -1 && FileProtectionClass < 4;
  }
  id v10 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    v12 = self->_domain;
    if (v9) {
      CFStringRef v11 = @"YES";
    }
    int v14 = 138412546;
    CFErrorRef v15 = (const char *)v12;
    __int16 v16 = 2112;
    CFStringRef v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Is user defaults domain %@ protected: %@", (uint8_t *)&v14, 0x16u);
  }
  return v9;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSString)appGroupContainer
{
  return self->_appGroupContainer;
}

- (void)setAppGroupContainer:(id)a3
{
}

- (NPSDomainAccessor)nanoDomainAccessor
{
  return self->_nanoDomainAccessor;
}

- (void)setNanoDomainAccessor:(id)a3
{
}

- (BOOL)hasChangesToWrite
{
  return self->_hasChangesToWrite;
}

- (void)setHasChangesToWrite:(BOOL)a3
{
  self->_hasChangesToWrite = a3;
}

- (void)setContainerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_nanoDomainAccessor, 0);
  objc_storeStrong((id *)&self->_appGroupContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end