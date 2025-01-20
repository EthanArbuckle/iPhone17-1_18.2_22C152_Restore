@interface TransparencyConfigBag
- (BOOL)configurationExpired;
- (BOOL)configureFromNetworkBagData:(id)a3 error:(id *)a4;
- (BOOL)configureWithDisk:(id *)a3;
- (BOOL)configured;
- (BOOL)overrideReversePushConfig;
- (BOOL)processConfigBagData:(id)a3 error:(id *)a4;
- (BOOL)shouldSetInternalHeader;
- (BOOL)tapToRadarEnabled;
- (BOOL)validateConfigBagCertificates:(id)a3 error:(id *)a4;
- (BOOL)validateConfigBagEntries:(id)a3 error:(id *)a4;
- (BOOL)validateConfigBagSignature:(id)a3 error:(id *)a4;
- (BOOL)validateConfigEntries:(id)a3 error:(id *)a4;
- (BOOL)writeConfigToDisk:(id)a3 error:(id *)a4;
- (NSDictionary)config;
- (NSDictionary)requiredKeys;
- (NSString)swtCFUDetailsURL;
- (NSURL)directory;
- (SWTSettingsProtocol)swtSettings;
- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6;
- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6 swtSettings:(id)a7;
- (TransparencySettingsProtocol)settings;
- (double)doubleForKey:(id)a3;
- (double)expirationTime;
- (id)checkBagKeyClass:(id)a3 keys:(id)a4;
- (id)checkMissingBagKeys:(id)a3 keys:(id)a4;
- (id)configBagFileName;
- (id)configBagRequest;
- (id)configBagURL;
- (id)copyConfigurationBag:(id *)a3;
- (id)readConfigFromDisk:(id *)a3;
- (id)stringForKey:(id)a3;
- (id)urlForKey:(id)a3;
- (unint64_t)configApp;
- (unint64_t)currentEnvironment;
- (unint64_t)getConfigBagEnvironment;
- (unint64_t)overrideReversePushPercentage;
- (unint64_t)percentageForKey:(id)a3;
- (unint64_t)uintegerForKey:(id)a3;
- (void)clearState:(id *)a3;
- (void)configureFromNetworkWithFetcher:(id)a3 completionHandler:(id)a4;
- (void)configureWithFetcher:(id)a3 completionHandler:(id)a4;
- (void)getSettings;
- (void)setConfig:(id)a3;
- (void)setConfigApp:(unint64_t)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setCurrentEnvironment:(unint64_t)a3;
- (void)setDirectory:(id)a3;
- (void)setExpirationTime:(double)a3;
- (void)setOverrideReversePushConfig:(BOOL)a3;
- (void)setOverrideReversePushPercentage:(unint64_t)a3;
- (void)setRequiredKeys:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSwtSettings:(id)a3;
@end

@implementation TransparencyConfigBag

- (unint64_t)getConfigBagEnvironment
{
  unint64_t result = [(TransparencyConfigBag *)self configApp];
  if (result == 2)
  {
    v6 = [(TransparencyConfigBag *)self swtSettings];
    unint64_t v7 = (unint64_t)[v6 atEnvironment];

    if (v7 > 9) {
      return 1;
    }
    else {
      return qword_10010A448[v7];
    }
  }
  else if (result == 1)
  {
    v4 = [(TransparencyConfigBag *)self settings];
    id v5 = [v4 getEnvironment];

    return (unint64_t)v5;
  }
  return result;
}

- (id)configBagURL
{
  id v3 = [objc_alloc((Class)NSURLComponents) initWithString:@"https://init-kt.apple.com/init/getBag"];
  unint64_t v4 = [(TransparencyConfigBag *)self currentEnvironment];
  if (v4 == 2)
  {
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136D50);
    }
    unint64_t v7 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "requesting QA2 configuration bag", v15, 2u);
    }
    CFStringRef v6 = @"init-kt-qa2.ess.apple.com";
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_14;
    }
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136D30);
    }
    id v5 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "requesting QA1 configuration bag", v15, 2u);
    }
    CFStringRef v6 = @"init-kt-qa1.ess.apple.com";
  }
  [v3 setHost:v6];
LABEL_14:
  id v8 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ix" value:@"3"];
  v9 = [(TransparencyConfigBag *)self settings];
  v10 = [v9 devicePlatform];

  id v11 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"p" value:v10];
  v16[0] = v8;
  v16[1] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:2];
  [v3 setQueryItems:v12];

  v13 = [v3 URL];

  return v13;
}

- (id)configBagFileName
{
  unint64_t v2 = [(TransparencyConfigBag *)self currentEnvironment];
  if (v2 == 2)
  {
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136D90);
    }
    id v5 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "using QA2 configuration bag", v6, 2u);
    }
    return @"KTConfig-qa2.plist";
  }
  else if (v2 == 1)
  {
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136D70);
    }
    id v3 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "using QA1 configuration bag", buf, 2u);
    }
    return @"KTConfig-qa1.plist";
  }
  else
  {
    return @"KTConfig.plist";
  }
}

- (id)configBagRequest
{
  id v3 = [(TransparencyConfigBag *)self configBagURL];
  unint64_t v4 = [(TransparencyConfigBag *)self settings];
  [v4 uiBlockingNetworkTimeout];
  id v5 = +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v3, 0);

  CFStringRef v6 = [(TransparencyConfigBag *)self settings];
  LODWORD(v4) = [v6 getBool:kTransparencyFlagUseTestConfig];

  if (v4)
  {
    [v5 setValue:@"true" forHTTPHeaderField:@"X-Apple-Test-Application"];
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136DB0);
    }
    unint64_t v7 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = 0;
      id v8 = "requesting test configuration bag";
      v9 = (uint8_t *)&v18;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
    }
  }
  else if ([(TransparencyConfigBag *)self shouldSetInternalHeader])
  {
    [v5 setValue:@"true" forHTTPHeaderField:@"x-internal"];
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136DD0);
    }
    unint64_t v7 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v8 = "requesting carry configuration bag";
      v9 = buf;
      goto LABEL_11;
    }
  }
  v10 = [(TransparencyConfigBag *)self settings];
  id v11 = [v10 transparencyVersionStr];
  [v5 setValue:v11 forHTTPHeaderField:off_100156DA8];

  v12 = [(TransparencyConfigBag *)self settings];
  v13 = [v12 automatedDeviceGroup];

  if (v13) {
    [v5 setValue:v13 forHTTPHeaderField:off_100156DA0];
  }
  if ((id)[(TransparencyConfigBag *)self configApp] == (id)2
    && ![(TransparencyConfigBag *)self currentEnvironment])
  {
    [v5 _setPrivacyProxyFailClosed:1];
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136DF0);
    }
    v14 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Enforcing privacy proxy", v16, 2u);
    }
  }

  return v5;
}

- (BOOL)shouldSetInternalHeader
{
  id v3 = [(TransparencyConfigBag *)self settings];
  unsigned int v4 = [v3 allowsInternalSecurityPolicies];

  if (!v4) {
    return 0;
  }
  if ((id)[(TransparencyConfigBag *)self configApp] != (id)2) {
    return 1;
  }
  id v5 = [(TransparencyConfigBag *)self swtSettings];
  BOOL v6 = [v5 atEnvironment] != (id)7;

  return v6;
}

- (void)getSettings
{
  id v3 = +[TransparencySettings getOverride:kTransparencyOverrideReversePushPercentage];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 unsignedIntegerValue];
    if ((unint64_t)v4 <= 0x64)
    {
      id v5 = v4;
      if (qword_10015B3C0 != -1) {
        dispatch_once(&qword_10015B3C0, &stru_100136E10);
      }
      BOOL v6 = qword_10015B3C8;
      if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        id v8 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Overriding bag reverse push percentage with %lu", (uint8_t *)&v7, 0xCu);
      }
      [(TransparencyConfigBag *)self setOverrideReversePushConfig:1];
      [(TransparencyConfigBag *)self setOverrideReversePushPercentage:v5];
    }
  }
}

- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6 swtSettings:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TransparencyConfigBag;
  v16 = [(TransparencyConfigBag *)&v21 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_6;
  }
  [(TransparencyConfigBag *)v16 getSettings];
  [(TransparencyConfigBag *)v17 setSettings:v13];
  [(TransparencyConfigBag *)v17 setConfigApp:a6];
  if (a6 != 2 || v15)
  {
    [(TransparencyConfigBag *)v17 setSwtSettings:v15];
    [(TransparencyConfigBag *)v17 setCurrentEnvironment:[(TransparencyConfigBag *)v17 getConfigBagEnvironment]];
    v19 = +[NSMutableDictionary dictionaryWithDictionary:v12];
    [v19 setObject:objc_opt_class() forKeyedSubscript:@"bag-expiry-timestamp"];
    [(TransparencyConfigBag *)v17 setRequiredKeys:v19];
    [(TransparencyConfigBag *)v17 setDirectory:v14];

LABEL_6:
    __int16 v18 = v17;
    goto LABEL_7;
  }
  __int16 v18 = 0;
LABEL_7:

  return v18;
}

- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6
{
  return [(TransparencyConfigBag *)self initWithRequiredKeys:a3 settings:a4 directory:a5 configApp:a6 swtSettings:0];
}

- (unint64_t)percentageForKey:(id)a3
{
  unint64_t result = [(TransparencyConfigBag *)self uintegerForKey:a3];
  if (result >= 0x64) {
    return 100;
  }
  return result;
}

- (unint64_t)uintegerForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyConfigBag *)self config];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ((unint64_t)[v6 integerValue] & 0x8000000000000000) != 0)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v6 unsignedIntegerValue];
  }

  return (unint64_t)v7;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyConfigBag *)self config];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)urlForKey:(id)a3
{
  id v3 = [(TransparencyConfigBag *)self stringForKey:a3];
  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (double)doubleForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyConfigBag *)self config];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  double v7 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v6 doubleValue];
    double v7 = v8;
  }

  return v7;
}

- (id)checkMissingBagKeys:(id)a3 keys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [v5 objectForKeyedSubscript:v13];

        if (!v14) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)checkBagKeyClass:(id)a3 keys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v5 objectForKeyedSubscript:v13];
        [v8 objectForKeyedSubscript:v13];
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)validateConfigEntries:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(TransparencyConfigBag *)self requiredKeys];
  id v8 = [(TransparencyConfigBag *)self checkMissingBagKeys:v6 keys:v7];

  if ([v8 count])
  {
    if (a4)
    {
      *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-114 description:@"Missing required field in config bag data"];
    }
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136E30);
    }
    id v9 = (void *)qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      uint64_t v11 = [v8 componentsJoinedByString:@","];
      int v20 = 138412290;
      objc_super v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Missing required field in config bag data: %@", (uint8_t *)&v20, 0xCu);
    }
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v13 = [(TransparencyConfigBag *)self requiredKeys];
    id v14 = [(TransparencyConfigBag *)self checkBagKeyClass:v6 keys:v13];

    id v15 = [v14 count];
    BOOL v12 = v15 == 0;
    if (v15)
    {
      if (a4)
      {
        *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-115 description:@"Required field has unexpected class"];
      }
      if (qword_10015B3C0 != -1) {
        dispatch_once(&qword_10015B3C0, &stru_100136E50);
      }
      long long v16 = (void *)qword_10015B3C8;
      if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
      {
        long long v17 = v16;
        long long v18 = [v14 componentsJoinedByString:@","];
        int v20 = 138412290;
        objc_super v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Required field has unexpected class: %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  return v12;
}

- (BOOL)processConfigBagData:(id)a3 error:(id *)a4
{
  id v6 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:0 error:a4];
  if (v6 && [(TransparencyConfigBag *)self validateConfigEntries:v6 error:a4])
  {
    BOOL v7 = 1;
    [(TransparencyConfigBag *)self setConfigured:1];
    [(TransparencyConfigBag *)self setCurrentEnvironment:[(TransparencyConfigBag *)self getConfigBagEnvironment]];
    id v8 = [v6 objectForKeyedSubscript:@"bag-expiry-timestamp"];
    -[TransparencyConfigBag setExpirationTime:](self, "setExpirationTime:", (double)(uint64_t)[v8 longLongValue]);

    [(TransparencyConfigBag *)self setConfig:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateConfigBagCertificates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(TransparencyConfigBag *)self settings];
  if ([v7 allowsInternalSecurityPolicies])
  {
    id v8 = [(TransparencyConfigBag *)self settings];
    unsigned __int8 v9 = [v8 getBool:kTransparencyFlagDisableVerifyBagCertificate];

    if (v9)
    {
      BOOL v10 = 1;
      goto LABEL_25;
    }
  }
  else
  {
  }
  if ([v6 count])
  {
    [(TransparencyConfigBag *)self currentEnvironment];
    AppleIDSService = (const void *)SecPolicyCreateAppleIDSService();
    BOOL v12 = [v6 objectAtIndexedSubscript:0];
    int v20 = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:&v20 count:1];
    BOOL v10 = +[TransparencyCertificateHelper verifyCertificates:v13 intermediates:v6 policy:AppleIDSService error:a4];

    if (!v10)
    {
      if (a4)
      {
        *a4 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-28 underlyingError:*a4 description:@"bag certificates failed trust evaluation"];
      }
      if (qword_10015B3C0 != -1) {
        dispatch_once(&qword_10015B3C0, &stru_100136E90);
      }
      id v14 = qword_10015B3C8;
      if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
      {
        if (a4) {
          id v15 = *a4;
        }
        else {
          id v15 = 0;
        }
        int v18 = 138412290;
        id v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "bag certificates failed trust evaluation: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    if (AppleIDSService) {
      CFRelease(AppleIDSService);
    }
  }
  else
  {
    if (a4)
    {
      *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-113 description:@"Config bag missing certificates"];
    }
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136E70);
    }
    long long v16 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Config bag missing certificates", (uint8_t *)&v18, 2u);
    }
    BOOL v10 = 0;
  }
LABEL_25:

  return v10;
}

- (BOOL)validateConfigBagSignature:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(TransparencyConfigBag *)self settings];
  if ([v7 allowsInternalSecurityPolicies])
  {
    id v8 = [(TransparencyConfigBag *)self settings];
    unsigned __int8 v9 = [v8 getBool:kTransparencyFlagDisableVerifyBagSignature];

    if (v9)
    {
      BOOL v10 = 1;
      goto LABEL_38;
    }
  }
  else
  {
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:@"bag"];
  BOOL v12 = [v6 objectForKeyedSubscript:@"signature"];
  uint64_t v13 = [v6 objectForKeyedSubscript:@"certs"];
  id v14 = [v13 objectAtIndexedSubscript:0];
  id v15 = +[TransparencyCertificateHelper certificateFromData:v14 error:a4];

  if (v15)
  {
    long long v16 = (void *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
    if (v16)
    {
      id v17 = +[TransparencyCertificateHelper copyTrustedKeysFromDataArray:v13 error:a4];
      if (v17)
      {
        BOOL v10 = +[TransparencySignatureVerifier verifyMessage:v11 signature:v12 spkiHash:v16 trustedKeys:v17 algorithm:kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256 error:a4];
        if (!v10)
        {
          if (qword_10015B3C0 != -1) {
            dispatch_once(&qword_10015B3C0, &stru_100136F10);
          }
          int v18 = qword_10015B3C8;
          if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
          {
            if (a4) {
              id v19 = *a4;
            }
            else {
              id v19 = 0;
            }
            int v24 = 138412290;
            id v25 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Config bag signature verification failed: %@", (uint8_t *)&v24, 0xCu);
          }
        }
      }
      else
      {
        if (a4)
        {
          *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-7 description:@"Failed to decode certs in bag"];
        }
        if (qword_10015B3C0 != -1) {
          dispatch_once(&qword_10015B3C0, &stru_100136EF0);
        }
        v22 = qword_10015B3C8;
        if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to decode certs in bag", (uint8_t *)&v24, 2u);
        }
        BOOL v10 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      if (a4)
      {
        *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-30 description:@"Failed to get SPKI hash from cert"];
      }
      if (qword_10015B3C0 != -1) {
        dispatch_once(&qword_10015B3C0, &stru_100136ED0);
      }
      objc_super v21 = qword_10015B3C8;
      if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to get SPKI hash from cert", (uint8_t *)&v24, 2u);
      }
      CFRelease(v15);
      BOOL v10 = 0;
    }
  }
  else
  {
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136EB0);
    }
    int v20 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to decode config bag leaf cert", (uint8_t *)&v24, 2u);
    }
    BOOL v10 = 0;
  }

LABEL_38:
  return v10;
}

- (BOOL)validateConfigBagEntries:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [v6 objectForKeyedSubscript:@"bag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 objectForKeyedSubscript:@"certs"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count])
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v30 = v8;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v32;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-114 description:@"cert wrong type"];
              }
              id v8 = v30;
              if (qword_10015B3C0 != -1) {
                dispatch_once(&qword_10015B3C0, &stru_100136F70);
              }
              v23 = (void *)qword_10015B3C8;
              if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
              {
                int v24 = v23;
                ClassName = object_getClassName(v14);
                *(_DWORD *)buf = 136315138;
                v37 = ClassName;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "cert wrong type): %s", buf, 0xCu);
              }
              goto LABEL_35;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v15 = [v6 objectForKeyedSubscript:@"signature"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v16 = [v6 objectForKeyedSubscript:@"certs"];
        unsigned int v17 = [(TransparencyConfigBag *)self validateConfigBagCertificates:v16 error:a4];

        if (v17) {
          BOOL v18 = [(TransparencyConfigBag *)self validateConfigBagSignature:v6 error:a4];
        }
        else {
          BOOL v18 = 0;
        }
        id v8 = v30;
      }
      else
      {
        if (a4)
        {
          *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-114 description:@"sigature missing required field or type"];
        }
        if (qword_10015B3C0 != -1) {
          dispatch_once(&qword_10015B3C0, &stru_100136F90);
        }
        id v8 = v30;
        v27 = (void *)qword_10015B3C8;
        if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
        {
          v28 = v27;
          v29 = object_getClassName(v15);
          *(_DWORD *)buf = 136315138;
          v37 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "sigature bag missing (or wrong type): %s", buf, 0xCu);
        }
        BOOL v18 = 0;
      }
    }
    else
    {
      if (a4)
      {
        *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-114 description:@"certs missing required field or type"];
      }
      if (qword_10015B3C0 != -1) {
        dispatch_once(&qword_10015B3C0, &stru_100136F50);
      }
      objc_super v21 = (void *)qword_10015B3C8;
      if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        *(_DWORD *)buf = 136315138;
        v37 = object_getClassName(v8);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "certs bag missing (or wrong type): %s", buf, 0xCu);
      }
LABEL_35:
      BOOL v18 = 0;
    }
  }
  else
  {
    if (a4)
    {
      *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-114 description:@"bag missing required field or type"];
    }
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136F30);
    }
    id v19 = (void *)qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
    {
      int v20 = v19;
      *(_DWORD *)buf = 136315138;
      v37 = object_getClassName(v7);
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "bag missing (or wrong type): %s", buf, 0xCu);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)configureFromNetworkBagData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:a4];
  id v8 = self;
  objc_sync_enter(v8);
  if (v7 && [(TransparencyConfigBag *)v8 validateConfigBagEntries:v7 error:a4])
  {
    id v9 = [v7 objectForKeyedSubscript:@"bag"];
    unsigned int v10 = [(TransparencyConfigBag *)v8 processConfigBagData:v9 error:a4];

    if (v10)
    {
      id v15 = 0;
      unsigned __int8 v11 = [(TransparencyConfigBag *)v8 writeConfigToDisk:v7 error:&v15];
      id v12 = v15;
      if ((v11 & 1) == 0)
      {
        if (qword_10015B3C0 != -1) {
          dispatch_once(&qword_10015B3C0, &stru_100136FB0);
        }
        uint64_t v13 = qword_10015B3C8;
        if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to write config bag to disk: %@", buf, 0xCu);
        }
      }
    }
    objc_sync_exit(v8);
  }
  else
  {
    objc_sync_exit(v8);

    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)configurationExpired
{
  +[NSDate kt_currentTimeMs];
  double v4 = v3;
  [(TransparencyConfigBag *)self expirationTime];
  double v6 = v5;
  if (v4 > v5)
  {
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100136FD0);
    }
    BOOL v7 = (void *)qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      [(TransparencyConfigBag *)self expirationTime];
      int v11 = 134217984;
      uint64_t v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Configuration bag expired at %f", (uint8_t *)&v11, 0xCu);
    }
    [(TransparencyConfigBag *)self setConfigured:0];
  }
  return v4 > v6;
}

- (id)readConfigFromDisk:(id *)a3
{
  double v5 = [(TransparencyConfigBag *)self configBagFileName];
  double v6 = [(TransparencyConfigBag *)self directory];
  id v12 = 0;
  BOOL v7 = +[TransparencyFileSupport readDictionaryFromFile:v5 inDirectory:v6 error:&v12];
  id v8 = v12;

  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = a3 == 0;
  }
  if (!v9 && v8 != 0) {
    *a3 = v8;
  }

  return v7;
}

- (BOOL)writeConfigToDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(TransparencyConfigBag *)self configBagFileName];
  id v8 = [(TransparencyConfigBag *)self directory];
  LOBYTE(a4) = +[TransparencyFileSupport writeDictionaryToFile:v6 fileName:v7 inDirectory:v8 error:a4];

  return (char)a4;
}

- (BOOL)configureWithDisk:(id *)a3
{
  double v5 = -[TransparencyConfigBag readConfigFromDisk:](self, "readConfigFromDisk:");
  if (v5 && [(TransparencyConfigBag *)self validateConfigBagEntries:v5 error:a3])
  {
    id v6 = [v5 objectForKeyedSubscript:@"bag"];
    BOOL v7 = [(TransparencyConfigBag *)self processConfigBagData:v6 error:a3];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)configureFromNetworkWithFetcher:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TransparencyConfigBag *)self configBagRequest];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B63C;
  v10[3] = &unk_100136FF8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 fetchConfigBag:v8 completionHandler:v10];
}

- (void)configureWithFetcher:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(TransparencyConfigBag *)self getConfigBagEnvironment];
  if ([(TransparencyConfigBag *)self configured]
    && (void *)[(TransparencyConfigBag *)self currentEnvironment] == v8
    && (v6 || ![(TransparencyConfigBag *)self configurationExpired]))
  {
    if ([(TransparencyConfigBag *)self configurationExpired])
    {
      if (qword_10015B3C0 != -1) {
        dispatch_once(&qword_10015B3C0, &stru_100137018);
      }
      id v14 = qword_10015B3C8;
      if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Configuration already loaded, but need to kick off config bag fetch because configuration expired", buf, 2u);
      }
      [v6 triggerConfigBagFetch:0.0];
    }
    v7[2](v7, 0);
  }
  else
  {
    id v9 = self;
    objc_sync_enter(v9);
    id v16 = 0;
    unsigned int v10 = [(TransparencyConfigBag *)v9 configureWithDisk:&v16];
    id v11 = v16;
    if (!v10) {
      goto LABEL_13;
    }
    if ([(TransparencyConfigBag *)v9 configurationExpired])
    {
      if (qword_10015B3C0 != -1) {
        dispatch_once(&qword_10015B3C0, &stru_100137038);
      }
      id v12 = qword_10015B3C8;
      if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Configuration loaded from disk, but need to kick off config bag fetch because configuration expired", buf, 2u);
      }
      [v6 triggerConfigBagFetch:0.0];
    }
    if (!v11)
    {
      if (qword_10015B3C0 != -1) {
        dispatch_once(&qword_10015B3C0, &stru_100137058);
      }
      id v15 = qword_10015B3C8;
      if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded configuration bag from disk", buf, 2u);
      }
      v7[2](v7, 0);
      objc_sync_exit(v9);
    }
    else
    {
LABEL_13:

      objc_sync_exit(v9);
      if (qword_10015B3C0 != -1) {
        dispatch_once(&qword_10015B3C0, &stru_100137078);
      }
      uint64_t v13 = qword_10015B3C8;
      if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating configuration from network", buf, 2u);
      }
      [(TransparencyConfigBag *)v9 configureFromNetworkWithFetcher:v6 completionHandler:v7];
    }
  }
}

- (id)copyConfigurationBag:(id *)a3
{
  double v5 = -[TransparencyConfigBag readConfigFromDisk:](self, "readConfigFromDisk:");
  if (v5 && [(TransparencyConfigBag *)self validateConfigBagEntries:v5 error:a3]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)clearState:(id *)a3
{
  double v4 = self;
  objc_sync_enter(v4);
  double v5 = [(TransparencyConfigBag *)v4 configBagFileName];
  id v6 = [(TransparencyConfigBag *)v4 directory];
  unsigned __int8 v7 = +[TransparencyFileSupport deleteFile:v5 inDirectory:v6 error:a3];

  if (v7)
  {
    [(TransparencyConfigBag *)v4 setConfigured:0];
    [(TransparencyConfigBag *)v4 setExpirationTime:0.0];
    [(TransparencyConfigBag *)v4 setConfig:0];
  }
  else
  {
    if (qword_10015B3C0 != -1) {
      dispatch_once(&qword_10015B3C0, &stru_100137098);
    }
    id v8 = qword_10015B3C8;
    if (os_log_type_enabled((os_log_t)qword_10015B3C8, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        id v9 = *a3;
      }
      else {
        id v9 = 0;
      }
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to delete KTLogClient configuration state: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  objc_sync_exit(v4);
}

- (BOOL)tapToRadarEnabled
{
  unint64_t v2 = [(TransparencyConfigBag *)self config];
  double v3 = [v2 objectForKeyedSubscript:@"ttr-enabled"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (NSString)swtCFUDetailsURL
{
  unint64_t v2 = [(TransparencyConfigBag *)self config];
  double v3 = [v2 objectForKeyedSubscript:@"swt-cfu-url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (unint64_t)currentEnvironment
{
  return self->_currentEnvironment;
}

- (void)setCurrentEnvironment:(unint64_t)a3
{
  self->_currentEnvironment = a3;
}

- (unint64_t)overrideReversePushPercentage
{
  return self->_overrideReversePushPercentage;
}

- (void)setOverrideReversePushPercentage:(unint64_t)a3
{
  self->_overrideReversePushPercentage = a3;
}

- (BOOL)overrideReversePushConfig
{
  return self->_overrideReversePushConfig;
}

- (void)setOverrideReversePushConfig:(BOOL)a3
{
  self->_overrideReversePushConfig = a3;
}

- (NSURL)directory
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDirectory:(id)a3
{
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConfig:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettings:(id)a3
{
}

- (SWTSettingsProtocol)swtSettings
{
  return (SWTSettingsProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSwtSettings:(id)a3
{
}

- (NSDictionary)requiredKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRequiredKeys:(id)a3
{
}

- (unint64_t)configApp
{
  return self->_configApp;
}

- (void)setConfigApp:(unint64_t)a3
{
  self->_configApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredKeys, 0);
  objc_storeStrong((id *)&self->_swtSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_directory, 0);
}

@end