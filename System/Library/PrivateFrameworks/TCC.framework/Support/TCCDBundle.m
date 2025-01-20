@interface TCCDBundle
+ (TCCDBundle)bundleWithIdentifier:(id)a3;
+ (TCCDBundle)bundleWithURL:(id)a3;
- (BOOL)isASKCapable;
- (BOOL)isLSUIElement;
- (BOOL)isPathContainedWithin:(id)a3;
- (BOOL)isPathTheMainExecutable:(id)a3;
- (BOOL)isRunsIndependentlyOfCompanionApp;
- (BOOL)isWatchKitApp;
- (BOOL)isWatchOnly;
- (NSDictionary)infoDictionary;
- (NSDictionary)localizedInfoDictionary;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)bundleVersion;
- (NSString)executablePath;
- (NSString)extensionPointIdentifier;
- (NSURL)bundleURL;
- (NSURL)executableURL;
- (TCCDBundle)initWithIdentifier:(id)a3;
- (TCCDBundle)initWithURL:(id)a3;
- (id)description;
- (id)localizedUsageDescriptionForKey:(id)a3;
- (void)dealloc;
@end

@implementation TCCDBundle

- (void)dealloc
{
  cfBundle = self->_cfBundle;
  if (cfBundle) {
    CFRelease(cfBundle);
  }
  v4.receiver = self;
  v4.super_class = (Class)TCCDBundle;
  [(TCCDBundle *)&v4 dealloc];
}

- (NSString)bundleIdentifier
{
  return (NSString *)CFBundleGetIdentifier(self->_cfBundle);
}

- (NSURL)bundleURL
{
  CFURLRef v2 = CFBundleCopyBundleURL(self->_cfBundle);
  return (NSURL *)v2;
}

+ (TCCDBundle)bundleWithURL:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[TCCDBundle alloc] initWithURL:v3];

  return v4;
}

- (TCCDBundle)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCCDBundle;
  v5 = [(TCCDBundle *)&v10 init];
  if (v5 && (uint64_t Unique = _CFBundleCreateUnique(), (v5->_cfBundle = (__CFBundle *)Unique) == 0))
  {
    v8 = tcc_access_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000364F4((uint64_t)v4, v8);
    }

    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (TCCDBundle)initWithIdentifier:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  v5 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v4 allowPlaceholder:0 error:&v10];
  id v6 = v10;
  if (v6)
  {
    v7 = tcc_access_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003656C();
    }
    v8 = 0;
  }
  else
  {
    v7 = [v5 URL];
    self = [(TCCDBundle *)self initWithURL:v7];
    v8 = self;
  }

  return v8;
}

+ (TCCDBundle)bundleWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[TCCDBundle alloc] initWithIdentifier:v3];

  return v4;
}

- (NSString)bundlePath
{
  CFURLRef v2 = [(TCCDBundle *)self bundleURL];
  id v3 = [v2 path];

  return (NSString *)v3;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(TCCDBundle *)self bundleIdentifier];
  v5 = [(TCCDBundle *)self bundleVersion];
  id v6 = [(TCCDBundle *)self bundlePath];
  v7 = +[NSString stringWithFormat:@"<%@: bundleID=%@, version=%@, path=%@>", v3, v4, v5, v6];

  return v7;
}

- (NSString)executablePath
{
  CFURLRef v2 = [(TCCDBundle *)self executableURL];
  uint64_t v3 = [v2 path];

  return (NSString *)v3;
}

- (NSURL)executableURL
{
  CFURLRef v2 = CFBundleCopyExecutableURL(self->_cfBundle);
  return (NSURL *)v2;
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)CFBundleGetInfoDictionary(self->_cfBundle);
}

- (NSDictionary)localizedInfoDictionary
{
  return (NSDictionary *)CFBundleGetLocalInfoDictionary(self->_cfBundle);
}

- (NSString)bundleVersion
{
  CFURLRef v2 = [(TCCDBundle *)self infoDictionary];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"CFBundleVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (NSString)extensionPointIdentifier
{
  uint64_t v3 = [(TCCDBundle *)self infoDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"EXAppExtensionAttributes"];

  if (v4)
  {
    CFStringRef v5 = @"EXExtensionPointIdentifier";
  }
  else
  {
    id v6 = [(TCCDBundle *)self infoDictionary];
    id v4 = [v6 objectForKeyedSubscript:@"NSExtension"];

    CFStringRef v5 = @"NSExtensionPointIdentifier";
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v4 objectForKeyedSubscript:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v7;
      v8 = v7;
      goto LABEL_13;
    }
    v9 = tcc_access_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543874;
      v12 = self;
      __int16 v13 = 2112;
      CFStringRef v14 = v5;
      __int16 v15 = 2114;
      v16 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@: Info.plist is missing or has invalid value for %@ key: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    v7 = tcc_access_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000365DC();
    }
  }
  v8 = 0;
LABEL_13:

  return (NSString *)v8;
}

- (BOOL)isLSUIElement
{
  CFURLRef v2 = [(TCCDBundle *)self infoDictionary];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"LSUIElement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)localizedUsageDescriptionForKey:(id)a3
{
  ValueForInfoDictionaryKey = (void *)CFBundleGetValueForInfoDictionaryKey(self->_cfBundle, (CFStringRef)a3);
  if (ValueForInfoDictionaryKey)
  {
    unsigned __int8 v4 = ValueForInfoDictionaryKey;
    CFTypeID v5 = CFGetTypeID(ValueForInfoDictionaryKey);
    if (v5 == CFStringGetTypeID()) {
      ValueForInfoDictionaryKey = v4;
    }
    else {
      ValueForInfoDictionaryKey = 0;
    }
  }
  return ValueForInfoDictionaryKey;
}

- (BOOL)isWatchKitApp
{
  CFURLRef v2 = [(TCCDBundle *)self infoDictionary];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"WKApplication"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isWatchOnly
{
  CFURLRef v2 = [(TCCDBundle *)self infoDictionary];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"WKWatchOnly"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isRunsIndependentlyOfCompanionApp
{
  CFURLRef v2 = [(TCCDBundle *)self infoDictionary];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"WKRunsIndependentlyOfCompanionApp"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isASKCapable
{
  CFURLRef v2 = [(TCCDBundle *)self infoDictionary];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"NSAccessorySetupKitSupports"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 containsObject:@"Bluetooth"];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isPathTheMainExecutable:(id)a3
{
  id v4 = a3;
  CFTypeID v5 = [(TCCDBundle *)self executablePath];
  id v11 = 0;
  id v6 = [v5 stringByResolvingRealPathWithError:&v11];
  id v7 = v11;

  if (v6)
  {
    unsigned __int8 v8 = [v6 isEqualToString:v4];
  }
  else
  {
    v9 = tcc_access_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003664C(self, (uint64_t)v7, v9);
    }

    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isPathContainedWithin:(id)a3
{
  id v4 = a3;
  CFTypeID v5 = [(TCCDBundle *)self bundlePath];
  id v11 = 0;
  id v6 = [v5 stringByResolvingRealPathWithError:&v11];
  id v7 = v11;

  if (v6)
  {
    unsigned __int8 v8 = [v4 hasPrefix:v6];
  }
  else
  {
    v9 = tcc_access_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000366E4(self, (uint64_t)v7, v9);
    }

    unsigned __int8 v8 = 0;
  }

  return v8;
}

@end