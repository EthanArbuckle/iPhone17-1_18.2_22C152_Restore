@interface BAApplicationConfigurationOverrides
+ (BOOL)clearAllOverrides;
+ (BOOL)clearOverridesForAppBundleIdentifier:(id)a3;
+ (BOOL)setOverrides:(id)a3 forAppBundleIdentifier:(id)a4;
+ (id)overridesForAppBundleIdentifier:(id)a3;
- (NSArray)domainAllowlist;
- (NSNumber)downloadAllowance;
- (NSNumber)essentialDownloadAllowance;
- (NSNumber)essentialMaxInstallSize;
- (NSNumber)maxInstallSize;
- (NSString)manifestURL;
- (void)setDomainAllowlist:(id)a3;
- (void)setDownloadAllowance:(id)a3;
- (void)setEssentialDownloadAllowance:(id)a3;
- (void)setEssentialMaxInstallSize:(id)a3;
- (void)setManifestURL:(id)a3;
- (void)setMaxInstallSize:(id)a3;
@end

@implementation BAApplicationConfigurationOverrides

- (void)setEssentialMaxInstallSize:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && [(NSNumber *)v4 integerValue] < 0)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7) {
      sub_10003817C(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([essentialMaxInstallSize integerVal"
                               "ue] >= 0), essentialMaxInstallSize must be >= 0.";
    __break(1u);
  }
  else
  {
    essentialMaxInstallSize = self->_essentialMaxInstallSize;
    self->_essentialMaxInstallSize = v5;
  }
}

- (void)setMaxInstallSize:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && [(NSNumber *)v4 integerValue] < 0)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7) {
      sub_1000381F8(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([maxInstallSize integerValue] >= 0)"
                               ", maxInstallSize must be >= 0.";
    __break(1u);
  }
  else
  {
    maxInstallSize = self->_maxInstallSize;
    self->_maxInstallSize = v5;
  }
}

- (void)setEssentialDownloadAllowance:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && [(NSNumber *)v4 integerValue] < 0)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7) {
      sub_100038274(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([essentialDownloadAllowance integer"
                               "Value] >= 0), essentialDownloadAllowance must be >= 0.";
    __break(1u);
  }
  else
  {
    essentialDownloadAllowance = self->_essentialDownloadAllowance;
    self->_essentialDownloadAllowance = v5;
  }
}

- (void)setDownloadAllowance:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && [(NSNumber *)v4 integerValue] < 0)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7) {
      sub_1000382F0(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([downloadAllowance integerValue] >="
                               " 0), downloadAllowance must be >= 0.";
    __break(1u);
  }
  else
  {
    downloadAllowance = self->_downloadAllowance;
    self->_downloadAllowance = v5;
  }
}

- (void)setManifestURL:(id)a3
{
  v4 = (NSString *)a3;
  v5 = v4;
  if (v4 && ![(NSString *)v4 length])
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7) {
      sub_10003836C(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([manifestURL length] > 0), manifest"
                               "URL cannot be empty.";
    __break(1u);
  }
  else
  {
    manifestURL = self->_manifestURL;
    self->_manifestURL = v5;
  }
}

- (void)setDomainAllowlist:(id)a3
{
  v4 = (NSArray *)a3;
  v5 = v4;
  if (!v4)
  {
LABEL_12:
    domainAllowlist = self->_domainAllowlist;
    self->_domainAllowlist = v5;

    return;
  }
  if ([(NSArray *)v4 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v6 = v5;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "length", (void)v28))
          {
            BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
            if (v12) {
              sub_100038464(v12, v13, v14, v15, v16, v17, v18, v19);
            }
            qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([item length] > 0), domainA"
                                       "llowlist items cannot be empty.";
            __break(1u);
          }
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }

    goto LABEL_12;
  }
  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if (v20) {
    sub_1000383E8(v20, v21, v22, v23, v24, v25, v26, v27);
  }
  qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([domainAllowlist count] > 0), domainA"
                             "llowlist cannot be empty.";
  __break(1u);
}

+ (id)overridesForAppBundleIdentifier:(id)a3
{
  return sub_1000055C4((uint64_t)a1, a3);
}

+ (BOOL)setOverrides:(id)a3 forAppBundleIdentifier:(id)a4
{
  return sub_100005768((uint64_t)a1, a3, a4);
}

+ (BOOL)clearOverridesForAppBundleIdentifier:(id)a3
{
  return sub_100005768((uint64_t)a1, 0, a3);
}

+ (BOOL)clearAllOverrides
{
  v2 = +[NSDictionary dictionary];
  CFPreferencesSetAppValue(@"InternalAppOverrides", v2, @"com.apple.backgroundassets");
  BOOL v3 = CFPreferencesAppSynchronize(@"com.apple.backgroundassets") != 0;

  return v3;
}

- (NSNumber)essentialMaxInstallSize
{
  return self->_essentialMaxInstallSize;
}

- (NSNumber)maxInstallSize
{
  return self->_maxInstallSize;
}

- (NSString)manifestURL
{
  return self->_manifestURL;
}

- (NSNumber)essentialDownloadAllowance
{
  return self->_essentialDownloadAllowance;
}

- (NSNumber)downloadAllowance
{
  return self->_downloadAllowance;
}

- (NSArray)domainAllowlist
{
  return self->_domainAllowlist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAllowlist, 0);
  objc_storeStrong((id *)&self->_downloadAllowance, 0);
  objc_storeStrong((id *)&self->_essentialDownloadAllowance, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_maxInstallSize, 0);

  objc_storeStrong((id *)&self->_essentialMaxInstallSize, 0);
}

@end