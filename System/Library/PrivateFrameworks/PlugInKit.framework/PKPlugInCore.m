@interface PKPlugInCore
+ (id)readSDKDictionary:(id)a3 forPlatform:(unsigned int)a4 externalProviders:(id)a5;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isAppExtension;
- (BOOL)isData;
- (BOOL)isDedicated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHybrid;
- (BOOL)isMultiplexed;
- (BOOL)isRBManaged;
- (BOOL)oldStyle;
- (BOOL)onSystemVolume;
- (BOOL)setDictionaries:(id)a3;
- (BOOL)setupWithForm:(id)a3;
- (BOOL)setupWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9;
- (BOOL)shouldTerminateOnHold;
- (BOOL)useBundle:(id)a3 error:(id *)a4;
- (BOOL)usesHostPersona;
- (NSArray)launchPersonas;
- (NSData)cdhash;
- (NSDate)timestamp;
- (NSDictionary)annotations;
- (NSDictionary)attributes;
- (NSDictionary)bundleInfoDictionary;
- (NSDictionary)entitlements;
- (NSDictionary)localizedFileProviderActionNames;
- (NSDictionary)plugInDictionary;
- (NSString)bootInstance;
- (NSString)containingBundleIdentifier;
- (NSString)containingPath;
- (NSString)identifier;
- (NSString)localizedContainingName;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (NSString)originalIdentifier;
- (NSString)path;
- (NSString)principalSpec;
- (NSString)requirement;
- (NSString)sdkSpec;
- (NSString)version;
- (NSURL)containingUrl;
- (NSURL)dataContainerURL;
- (NSURL)url;
- (NSUUID)discoveryInstanceUUID;
- (NSUUID)uuid;
- (PKExternalProviders)external;
- (PKPlugInCore)init;
- (PKPlugInCore)initWithExternalProviders:(id)a3;
- (PKPlugInCore)initWithForm:(id)a3 externalProviders:(id)a4;
- (PKPlugInCore)initWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9 externalProviders:(id)a10;
- (id)_localizedFileProviderActionNamesForPKDict:(id)a3 fromBundle:(id)a4;
- (id)attribute:(id)a3;
- (id)augmentInterface:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)diagnose;
- (id)embeddedCodePath;
- (id)embeddedProtocolSpec;
- (id)export:(id *)a3;
- (id)infoKey:(id)a3;
- (id)mergeSDKDictionary:(id)a3 intoExtensionDictionary:(id)a4;
- (id)mergeSharedResources:(id)a3 into:(id)a4;
- (id)normalizeInfoDictionary:(id)a3;
- (id)pluginKey:(id)a3;
- (id)protocolSpec;
- (id)resolveSDKWithInfoPlist:(id)a3 extensionPointCache:(id)a4;
- (id)sdkOnlyKeyPaths;
- (id)valueForEntitlement:(id)a3;
- (int64_t)lastModified;
- (unint64_t)annotationTimestamp;
- (unint64_t)hash;
- (unint64_t)hubProtocolVersion;
- (unsigned)extensionPointPlatform;
- (void)_loadLocalizedFileProviderActionNames;
- (void)_loadLocalizedNames;
- (void)canonicalize;
- (void)localizedInfoDictionaryForKeys:(id)a3 completion:(id)a4;
- (void)setAnnotation:(id)a3 value:(id)a4;
- (void)setAnnotationTimestamp:(unint64_t)a3;
- (void)setAnnotations:(id)a3;
- (void)setBundleInfoDictionary:(id)a3;
- (void)setCdhash:(id)a3;
- (void)setContainingBundleIdentifier:(id)a3;
- (void)setContainingUrl:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setHubProtocolVersion:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsRBManaged:(BOOL)a3;
- (void)setLastModified:(int64_t)a3;
- (void)setLaunchPersonas:(id)a3;
- (void)setLocalizedContainingName:(id)a3;
- (void)setOnSystemVolume:(BOOL)a3;
- (void)setOriginalIdentifier:(id)a3;
- (void)setPlugInDictionary:(id)a3;
- (void)setRequirement:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateFromForm:(id)a3;
@end

@implementation PKPlugInCore

- (void)updateFromForm:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = pklog_handle_for_category(10);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1B38D3E60((uint64_t)self, (uint64_t)v4, (uint64_t)v5, v6, v7, v8, v9, v10, v24, *(long long *)v26, *(void **)&v26[16], *(long long *)&v26[24], *(uint64_t *)v27, *(uint64_t *)&v27[8], *(uint64_t *)&v27[16], *(uint64_t *)&v27[24], v28, v29, *((uint64_t *)&v29 + 1),
  }
      v30,
      v31,
      v32);

  if (![(PKPlugInCore *)self annotationTimestamp]) {
    goto LABEL_21;
  }
  v11 = [v4 objectForKeyedSubscript:@"annotations"];
  v12 = [v11 objectForKeyedSubscript:@"bootuuid"];

  v13 = [v4 objectForKeyedSubscript:@"annotations"];
  v14 = [v13 objectForKeyedSubscript:@"timestamp"];

  if (v14) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  int v16 = !v15;
  if (v15)
  {
    BOOL v18 = 1;
    if (!v16) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v13 = [(PKPlugInCore *)self bootInstance];
  if ([v12 isEqualToString:v13])
  {
    unint64_t v17 = [v14 unsignedLongLongValue];
    BOOL v18 = v17 <= [(PKPlugInCore *)self annotationTimestamp];
    if (!v16) {
      goto LABEL_16;
    }
LABEL_15:

    goto LABEL_16;
  }
  BOOL v18 = 1;
  if (v16) {
    goto LABEL_15;
  }
LABEL_16:
  if (!v18)
  {

LABEL_21:
    [(PKPlugInCore *)self setAnnotationTimestamp:0];
    v23 = [v4 objectForKeyedSubscript:@"annotations"];
    [(PKPlugInCore *)self setAnnotations:v23];

    goto LABEL_22;
  }
  v19 = pklog_handle_for_category(10);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v26 = [(PKPlugInCore *)self uuid];
    v20 = [(PKPlugInCore *)self identifier];
    v21 = [(PKPlugInCore *)self version];
    uint64_t v25 = [v14 unsignedLongLongValue];
    v22 = [(PKPlugInCore *)self bootInstance];
    *(_DWORD *)&v26[8] = 138545154;
    *(void *)&v26[12] = *(void *)v26;
    *(_WORD *)&v26[20] = 2112;
    *(void *)&v26[22] = v20;
    *(_WORD *)&v26[30] = 2112;
    *(void *)&v26[32] = v21;
    *(_WORD *)v27 = 2080;
    *(void *)&v27[2] = "-[PKPlugInCore updateFromForm:]";
    *(_WORD *)&v27[10] = 2112;
    *(void *)&v27[12] = v12;
    *(_WORD *)&v27[20] = 2048;
    *(void *)&v27[22] = v25;
    *(_WORD *)&v27[30] = 2112;
    uint64_t v28 = (uint64_t)v22;
    LOWORD(v29) = 2048;
    *(void *)((char *)&v29 + 2) = [(PKPlugInCore *)self annotationTimestamp];
    _os_log_impl(&dword_1B38B0000, v19, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] %s ignoring annotation update (%@, %llu) vs. (%@, %llu)", &v26[8], 0x52u);
  }
LABEL_22:
}

- (BOOL)isDedicated
{
  v2 = [(PKPlugInCore *)self pluginKey:@"Dedicated"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isData
{
  v2 = [(PKPlugInCore *)self protocolSpec];
  char v3 = [@"#Data" isEqual:v2];

  return v3;
}

- (id)protocolSpec
{
  char v3 = [(PKPlugInCore *)self pluginKey:@"NSExtensionProtocol"];
  if (!v3)
  {
    if ([(PKPlugInCore *)self isAppExtension]) {
      char v3 = @"NSObject";
    }
    else {
      char v3 = 0;
    }
  }
  return v3;
}

- (id)infoKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKPlugInCore *)self bundleInfoDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = pklog_handle_for_category(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(PKPlugInCore *)self uuid];
    uint64_t v10 = [(PKPlugInCore *)self identifier];
    v11 = [(PKPlugInCore *)self version];
    int v12 = 138544386;
    v13 = v9;
    __int16 v14 = 2112;
    BOOL v15 = v10;
    __int16 v16 = 2112;
    unint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_1B38B0000, v7, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] info [%@] => [%@]", (uint8_t *)&v12, 0x34u);
  }
  return v6;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(PKPlugInCore *)self entitlements];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSString)localizedShortName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedShortName) {
    [(PKPlugInCore *)v2 _loadLocalizedNames];
  }
  objc_sync_exit(v2);

  char v3 = pklog_handle_for_category(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(PKPlugInCore *)v2 uuid];
    v5 = [(PKPlugInCore *)v2 identifier];
    uint64_t v6 = [(PKPlugInCore *)v2 version];
    localizedShortName = v2->_localizedShortName;
    int v10 = 138544130;
    v11 = v4;
    __int16 v12 = 2112;
    v13 = v5;
    __int16 v14 = 2112;
    BOOL v15 = v6;
    __int16 v16 = 2112;
    unint64_t v17 = localizedShortName;
    _os_log_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] got localized short name: %@", (uint8_t *)&v10, 0x2Au);
  }
  uint64_t v8 = v2->_localizedShortName;
  return v8;
}

- (NSString)localizedName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedName) {
    [(PKPlugInCore *)v2 _loadLocalizedNames];
  }
  objc_sync_exit(v2);

  char v3 = pklog_handle_for_category(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(PKPlugInCore *)v2 uuid];
    v5 = [(PKPlugInCore *)v2 identifier];
    uint64_t v6 = [(PKPlugInCore *)v2 version];
    localizedName = v2->_localizedName;
    int v10 = 138544130;
    v11 = v4;
    __int16 v12 = 2112;
    v13 = v5;
    __int16 v14 = 2112;
    BOOL v15 = v6;
    __int16 v16 = 2112;
    unint64_t v17 = localizedName;
    _os_log_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] got localized name: %@", (uint8_t *)&v10, 0x2Au);
  }
  uint64_t v8 = v2->_localizedName;
  return v8;
}

- (void)_loadLocalizedNames
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x1B3EBB4E0](self, a2);
  id v4 = [(PKPlugInCore *)self external];
  v5 = [v4 ls];
  int v6 = [v5 hasLSDatabaseAccess];

  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = [(PKPlugInCore *)self external];
  uint64_t v8 = [v7 ls];
  uint64_t v9 = [(PKPlugInCore *)self uuid];
  int v10 = [v8 plugInRecordForUUID:v9];

  if (v10)
  {
    v11 = [v10 localizedName];
    localizedName = self->_localizedName;
    self->_localizedName = v11;

    v13 = [v10 localizedShortName];
    localizedShortName = self->_localizedShortName;
    self->_localizedShortName = v13;
  }
  else
  {
    localizedShortName = pklog_handle_for_category(3);
    if (os_log_type_enabled(localizedShortName, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4144(self);
    }
  }

  if (!v10)
  {
LABEL_7:
    id v32 = 0;
    BOOL v15 = [(PKPlugInCore *)self useBundle:@"." error:&v32];
    id v16 = v32;
    if (v15)
    {
      unint64_t v17 = [(PKPlugInCore *)self external];
      uint64_t v18 = [v17 filesystem];
      id v19 = [(PKPlugInCore *)self url];
      __int16 v20 = [v18 bundleWithURL:v19];

      v21 = [v20 localizedInfoDictionary];
      uint64_t v22 = [v21 objectForKeyedSubscript:@"CFBundleDisplayName"];
      v23 = v22;
      if (!v22)
      {
        id v19 = [(PKPlugInCore *)self bundleInfoDictionary];
        v23 = [v19 objectForKeyedSubscript:@"CFBundleDisplayName"];
      }
      objc_storeStrong((id *)&self->_localizedName, v23);
      if (!v22)
      {
      }
      uint8_t v24 = [v21 objectForKeyedSubscript:@"CFBundleName"];
      uint64_t v25 = v24;
      if (!v24)
      {
        id v19 = [(PKPlugInCore *)self bundleInfoDictionary];
        uint64_t v25 = [v19 objectForKeyedSubscript:@"CFBundleName"];
      }
      objc_storeStrong((id *)&self->_localizedShortName, v25);
      if (!v24)
      {
      }
      v26 = pklog_handle_for_category(3);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = [(PKPlugInCore *)self uuid];
        uint64_t v28 = [(PKPlugInCore *)self identifier];
        long long v29 = [(PKPlugInCore *)self version];
        uint64_t v30 = self->_localizedName;
        uint64_t v31 = self->_localizedShortName;
        *(_DWORD *)buf = 138544386;
        v34 = v27;
        __int16 v35 = 2112;
        v36 = v28;
        __int16 v37 = 2112;
        v38 = v29;
        __int16 v39 = 2112;
        v40 = v30;
        __int16 v41 = 2112;
        v42 = v31;
        _os_log_debug_impl(&dword_1B38B0000, v26, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] BundleInfo[BundleDisplayName] is [%@], BundleInfo[BundleName] is [%@]", buf, 0x34u);
      }
    }
    else
    {
      __int16 v20 = pklog_handle_for_category(4);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_1B38D40A4(self, v16, v20);
      }
    }
  }
}

- (PKExternalProviders)external
{
  return self->_external;
}

- (unint64_t)hash
{
  char v3 = [(PKPlugInCore *)self uuid];
  if (!v3) {
    sub_1B38D3BC0();
  }

  id v4 = [(PKPlugInCore *)self uuid];
  unint64_t v5 = [v4 hash];

  return v5;
}

- (id)export:(id *)a3
{
  v40[11] = *MEMORY[0x1E4F143B8];
  id v4 = [(PKPlugInCore *)self bundleInfoDictionary];
  unint64_t v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectForKey:@"CFBundleInfoPlistURL"];
  v34 = (void *)MEMORY[0x1E4F1CA60];
  v39[0] = @"hubProtocolVersion";
  __int16 v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[PKPlugInCore hubProtocolVersion](self, "hubProtocolVersion"));
  v40[0] = v37;
  v39[1] = @"path";
  v36 = [(PKPlugInCore *)self path];
  v40[1] = v36;
  v39[2] = @"systemResident";
  __int16 v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PKPlugInCore onSystemVolume](self, "onSystemVolume"));
  v40[2] = v35;
  v39[3] = @"identifier";
  v33 = [(PKPlugInCore *)self identifier];
  v40[3] = v33;
  v39[4] = @"original-identifier";
  id v32 = [(PKPlugInCore *)self originalIdentifier];
  v40[4] = v32;
  v39[5] = @"version";
  int v6 = [(PKPlugInCore *)self version];
  if (v6)
  {
    uint64_t v7 = [(PKPlugInCore *)self version];
  }
  else
  {
    uint64_t v7 = @"<none>";
  }
  v40[5] = v7;
  v40[6] = v5;
  v38 = v5;
  v39[6] = @"bundleInfo";
  v39[7] = @"uuid";
  uint64_t v8 = [(PKPlugInCore *)self uuid];
  uint64_t v9 = [v8 UUIDString];
  v40[7] = v9;
  v39[8] = @"lastmodified";
  int v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", -[PKPlugInCore lastModified](self, "lastModified"));
  v40[8] = v10;
  v39[9] = @"annotations";
  uint64_t v11 = [(PKPlugInCore *)self annotations];
  __int16 v12 = (void *)v11;
  uint64_t v13 = MEMORY[0x1E4F1CC08];
  if (v11) {
    uint64_t v13 = v11;
  }
  v40[9] = v13;
  v39[10] = @"isRBManaged";
  __int16 v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PKPlugInCore isRBManaged](self, "isRBManaged"));
  v40[10] = v14;
  BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:11];
  id v16 = [v34 dictionaryWithDictionary:v15];

  if (v6) {
  unint64_t v17 = [(PKPlugInCore *)self entitlements];
  }

  if (v17)
  {
    uint64_t v18 = [(PKPlugInCore *)self entitlements];
    [v16 setObject:v18 forKeyedSubscript:@"entitlements"];
  }
  id v19 = [(PKPlugInCore *)self containingPath];

  if (v19)
  {
    __int16 v20 = [(PKPlugInCore *)self containingPath];
    [v16 setObject:v20 forKeyedSubscript:@"containingPath"];
  }
  v21 = [(PKPlugInCore *)self containingBundleIdentifier];

  if (v21)
  {
    uint64_t v22 = [(PKPlugInCore *)self containingBundleIdentifier];
    [v16 setObject:v22 forKeyedSubscript:@"containingBundleIdentifier"];
  }
  v23 = [(PKPlugInCore *)self localizedContainingName];

  if (v23)
  {
    uint8_t v24 = [(PKPlugInCore *)self localizedContainingName];
    [v16 setObject:v24 forKeyedSubscript:@"localizedContainingDisplayName"];
  }
  uint64_t v25 = [(PKPlugInCore *)self discoveryInstanceUUID];

  if (v25)
  {
    v26 = [(PKPlugInCore *)self discoveryInstanceUUID];
    v27 = [v26 UUIDString];
    [v16 setObject:v27 forKeyedSubscript:@"discoveryInstanceUUID"];
  }
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[PKPlugInCore extensionPointPlatform](self, "extensionPointPlatform"));
  [v16 setObject:v28 forKeyedSubscript:@"epPlatform"];

  long long v29 = [(PKPlugInCore *)self launchPersonas];

  if (v29)
  {
    uint64_t v30 = [(PKPlugInCore *)self launchPersonas];
    [v16 setObject:v30 forKeyedSubscript:@"launchPersonas"];
  }
  return v16;
}

- (NSString)version
{
  v2 = [(PKPlugInCore *)self attribute:@"NSExtensionVersion"];
  return (NSString *)v2;
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (NSDictionary)bundleInfoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)containingPath
{
  v2 = [(PKPlugInCore *)self containingUrl];
  char v3 = [v2 path];

  return (NSString *)v3;
}

- (NSURL)containingUrl
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)annotations
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (NSUUID)discoveryInstanceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 192, 1);
}

- (id)attribute:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPlugInCore *)self attributes];
  int v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)attributes
{
  v2 = [(PKPlugInCore *)self pluginKey:@"NSExtensionAttributes"];
  return (NSDictionary *)v2;
}

- (id)pluginKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPlugInCore *)self plugInDictionary];
  int v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)plugInDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPlugInCore *)a3;
  unint64_t v5 = [(PKPlugInCore *)self uuid];
  if (!v5) {
    sub_1B38D3B94();
  }

  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v6 = [(PKPlugInCore *)self uuid];
      uint64_t v7 = [(PKPlugInCore *)v4 uuid];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)onSystemVolume
{
  return self->_onSystemVolume;
}

- (NSArray)launchPersonas
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)localizedContainingName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)containingBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)path
{
  v2 = [(PKPlugInCore *)self url];
  char v3 = [v2 path];

  return (NSString *)v3;
}

- (BOOL)isAppExtension
{
  v2 = [(PKPlugInCore *)self url];
  char v3 = [v2 path];
  char v4 = [v3 hasSuffix:@".appex"];

  return v4;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)originalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)lastModified
{
  return self->_lastModified;
}

- (unint64_t)hubProtocolVersion
{
  return self->_hubProtocolVersion;
}

- (unsigned)extensionPointPlatform
{
  return self->_extensionPointPlatform;
}

- (BOOL)setupWithForm:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
  int v6 = [v4 objectForKeyedSubscript:@"path"];
  v44 = (void *)[v5 initFileURLWithPath:v6];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"discoveryInstanceUUID"];
  if (v7) {
    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
  }
  else {
    char v8 = 0;
  }
  uint64_t v9 = [v4 objectForKeyedSubscript:@"epPlatform"];
  uint64_t v15 = [v9 unsignedIntValue];
  int v10 = [v4 objectForKeyedSubscript:@"identifier"];
  uint64_t v11 = [v4 objectForKeyedSubscript:@"bundleInfo"];
  id v12 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v13 = [v4 objectForKeyedSubscript:@"uuid"];
  __int16 v14 = (void *)[v12 initWithUUIDString:v13];
  LODWORD(v15) = [(PKPlugInCore *)self setupWithName:v10 extensionPointPlatform:v15 url:v44 bundleInfo:v11 uuid:v14 discoveryInstanceUUID:v8 extensionPointCache:0];

  if (v15)
  {
    id v16 = [v4 objectForKeyedSubscript:@"hubProtocolVersion"];
    -[PKPlugInCore setHubProtocolVersion:](self, "setHubProtocolVersion:", [v16 unsignedIntegerValue]);

    unint64_t v17 = [v4 objectForKeyedSubscript:@"hubProtocolVersion"];
    if (!v17) {
      [(PKPlugInCore *)self setHubProtocolVersion:1];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"original-identifier"];
    [(PKPlugInCore *)self setOriginalIdentifier:v18];

    id v19 = [v4 objectForKeyedSubscript:@"hash"];
    [(PKPlugInCore *)self setCdhash:v19];

    __int16 v20 = [v4 objectForKeyedSubscript:@"requirement"];
    [(PKPlugInCore *)self setRequirement:v20];

    v21 = [v4 objectForKeyedSubscript:@"lastmodified"];
    -[PKPlugInCore setLastModified:](self, "setLastModified:", [v21 longValue]);

    uint64_t v22 = [v4 objectForKeyedSubscript:@"entitlements"];
    [(PKPlugInCore *)self setEntitlements:v22];

    v23 = [v4 objectForKeyedSubscript:@"containingPath"];
    if (v23)
    {
      uint8_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v23];
      [(PKPlugInCore *)self setContainingUrl:v24];
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"containingBundleIdentifier"];
    [(PKPlugInCore *)self setContainingBundleIdentifier:v25];

    v26 = [v4 objectForKeyedSubscript:@"systemResident"];
    -[PKPlugInCore setOnSystemVolume:](self, "setOnSystemVolume:", [v26 BOOLValue]);

    v27 = [v4 objectForKeyedSubscript:@"annotations"];
    [(PKPlugInCore *)self setAnnotations:v27];

    uint64_t v28 = pklog_handle_for_category(6);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      long long v29 = [(PKPlugInCore *)self identifier];
      [(PKPlugInCore *)self annotations];
      uint64_t v43 = v7;
      uint64_t v30 = v23;
      char v31 = v15;
      uint64_t v15 = (uint64_t)v9;
      id v32 = v8;
      v33 = v17;
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v29;
      __int16 v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_1B38B0000, v28, OS_LOG_TYPE_INFO, "%@: annotations = %@", buf, 0x16u);

      unint64_t v17 = v33;
      char v8 = v32;
      uint64_t v9 = (void *)v15;
      LOBYTE(v15) = v31;
      v23 = v30;
      uint64_t v7 = v43;
    }
    __int16 v35 = [v4 objectForKeyedSubscript:@"localizedContainingDisplayName"];
    [(PKPlugInCore *)self setLocalizedContainingName:v35];

    v36 = [v4 objectForKeyedSubscript:@"isRBManaged"];
    -[PKPlugInCore setIsRBManaged:](self, "setIsRBManaged:", [v36 BOOLValue]);

    __int16 v37 = pklog_handle_for_category(6);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = [(PKPlugInCore *)self identifier];
      BOOL v39 = [(PKPlugInCore *)self isRBManaged];
      v40 = "will not";
      if (v39) {
        v40 = "will";
      }
      *(_DWORD *)buf = 138412546;
      v46 = v38;
      __int16 v47 = 2080;
      v48 = v40;
      _os_log_impl(&dword_1B38B0000, v37, OS_LOG_TYPE_INFO, "%@: %s be managed by runningboard", buf, 0x16u);
    }
    __int16 v41 = [v4 objectForKeyedSubscript:@"launchPersonas"];
    [(PKPlugInCore *)self setLaunchPersonas:v41];
  }
  return v15;
}

- (BOOL)setupWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = v21;
  if (!v17) {
    goto LABEL_22;
  }
  if (v16)
  {
    self->_extensionPointPlatform = a4;
    if (!v18) {
      goto LABEL_16;
    }
    if (v21)
    {
      id v32 = v20;
      v23 = [(PKPlugInCore *)self normalizeInfoDictionary:v18];
      uint64_t v24 = [(PKPlugInCore *)self resolveSDKWithInfoPlist:v23 extensionPointCache:v22];

      v33 = (void *)v24;
      BOOL v25 = [(PKPlugInCore *)self setDictionaries:v24];
      if (v25)
      {
        [(PKPlugInCore *)self canonicalize];
        id v20 = v32;
      }
      else
      {
        log = pklog_handle_for_category(6);
        id v20 = v32;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          id v35 = v32;
          __int16 v36 = 2114;
          id v37 = v16;
          __int16 v38 = 2114;
          id v39 = v17;
          __int16 v40 = 2114;
          id v41 = v18;
          _os_log_error_impl(&dword_1B38B0000, log, OS_LOG_TYPE_ERROR, "[d %@] malformed plugin dictionary in plugin [%{public}@] at [%{public}@]: %{public}@", buf, 0x2Au);
        }
      }
      if (v25) {
        goto LABEL_16;
      }
LABEL_22:
      BOOL v27 = 0;
      goto LABEL_23;
    }
    if ([(PKPlugInCore *)self setDictionaries:v18])
    {
LABEL_16:
      objc_storeStrong((id *)&self->_identifier, a3);
      objc_storeStrong((id *)&self->_url, a5);
      uint64_t v28 = v19;
      if (!v19)
      {
        uint64_t v28 = [MEMORY[0x1E4F29128] UUID];
      }
      objc_storeStrong((id *)&self->_uuid, v28);
      if (!v19) {

      }
      long long v29 = (NSUUID *)v20;
      p_super = &self->_discoveryInstanceUUID->super;
      self->_discoveryInstanceUUID = v29;
      BOOL v27 = 1;
      goto LABEL_21;
    }
    p_super = pklog_handle_for_category(6);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v35 = v20;
      __int16 v36 = 2114;
      id v37 = v16;
      __int16 v38 = 2114;
      id v39 = v17;
      __int16 v40 = 2114;
      id v41 = v18;
      _os_log_error_impl(&dword_1B38B0000, p_super, OS_LOG_TYPE_ERROR, "[d %@] malformed plugin dictionary in plugin [%{public}@] at [%{public}@]: %{public}@", buf, 0x2Au);
      BOOL v27 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    p_super = pklog_handle_for_category(6);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      sub_1B38D3BEC((uint64_t)v20, v17);
      BOOL v27 = 0;
      goto LABEL_21;
    }
  }
  BOOL v27 = 0;
LABEL_21:

LABEL_23:
  return v27;
}

- (void)setRequirement:(id)a3
{
}

- (void)setOriginalIdentifier:(id)a3
{
}

- (void)setOnSystemVolume:(BOOL)a3
{
  self->_onSystemVolume = a3;
}

- (void)setLocalizedContainingName:(id)a3
{
}

- (void)setLaunchPersonas:(id)a3
{
}

- (void)setLastModified:(int64_t)a3
{
  self->_lastModified = a3;
}

- (void)setIsRBManaged:(BOOL)a3
{
  self->_isRBManaged = a3;
}

- (void)setHubProtocolVersion:(unint64_t)a3
{
  self->_hubProtocolVersion = a3;
}

- (void)setEntitlements:(id)a3
{
}

- (BOOL)setDictionaries:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_bundleInfoDictionary, a3);
    int v6 = [v5 objectForKeyedSubscript:@"NSExtension"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&self->_plugInDictionary, v6);
      uint64_t v7 = [v6 objectForKeyedSubscript:@"Multiple"];
      if (v7)
      {
        char v8 = pklog_handle_for_category(6);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [(PKPlugInCore *)self discoveryInstanceUUID];
          uint64_t v9 = [(PKPlugInCore *)self uuid];
          int v10 = [(PKPlugInCore *)self identifier];
          [(PKPlugInCore *)self version];
          *(_DWORD *)buf = 138413314;
          id v17 = v15;
          __int16 v18 = 2114;
          id v19 = v9;
          __int16 v20 = 2112;
          id v21 = v10;
          v23 = __int16 v22 = 2112;
          uint64_t v11 = (void *)v23;
          __int16 v24 = 2114;
          BOOL v25 = @"Multiple";
          _os_log_impl(&dword_1B38B0000, v8, OS_LOG_TYPE_DEFAULT, "[d %@] [u %{public}@] [%@(%@)] multiplexed plug-ins (%{public}@ key) obsolete and ignored", buf, 0x34u);
        }
      }
      id v12 = [(PKPlugInCore *)self plugInDictionary];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)setContainingBundleIdentifier:(id)a3
{
}

- (void)setCdhash:(id)a3
{
}

- (void)setAnnotations:(id)a3
{
}

- (BOOL)isRBManaged
{
  return self->_isRBManaged;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (PKPlugInCore)initWithForm:(id)a3 externalProviders:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(PKPlugInCore *)self initWithExternalProviders:a4];
  char v8 = v7;
  if (v7 && ![(PKPlugInCore *)v7 setupWithForm:v6])
  {

    char v8 = 0;
  }

  return v8;
}

- (PKPlugInCore)initWithExternalProviders:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPlugInCore;
  id v6 = [(PKPlugInCore *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_external, a3);
  }

  return v7;
}

- (void)setContainingUrl:(id)a3
{
}

- (void)setAnnotationTimestamp:(unint64_t)a3
{
  self->_annotationTimestamp = a3;
}

- (unint64_t)annotationTimestamp
{
  return self->_annotationTimestamp;
}

- (PKPlugInCore)init
{
  char v3 = objc_opt_new();
  id v4 = [(PKPlugInCore *)self initWithExternalProviders:v3];

  return v4;
}

- (PKPlugInCore)initWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9 externalProviders:(id)a10
{
  uint64_t v14 = *(void *)&a4;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  __int16 v22 = [(PKPlugInCore *)self initWithExternalProviders:a10];
  uint64_t v23 = v22;
  if (v22
    && ![(PKPlugInCore *)v22 setupWithName:v16 extensionPointPlatform:v14 url:v17 bundleInfo:v18 uuid:v19 discoveryInstanceUUID:v20 extensionPointCache:v21])
  {

    uint64_t v23 = 0;
  }

  return v23;
}

- (id)normalizeInfoDictionary:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)canonicalize
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(PKPlugInCore *)self attributes];
  id v11 = [v3 dictionaryWithDictionary:v4];

  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = [(PKPlugInCore *)self plugInDictionary];
  uint64_t v7 = [v5 dictionaryWithDictionary:v6];

  [v7 setObject:v11 forKeyedSubscript:@"NSExtensionAttributes"];
  [(PKPlugInCore *)self setPlugInDictionary:v7];
  char v8 = [(PKPlugInCore *)self attribute:@"NSExtensionVersion"];

  if (!v8)
  {
    uint64_t v9 = [(PKPlugInCore *)self infoKey:@"CFBundleShortVersionString"];
    if (v9) {
      int v10 = (__CFString *)v9;
    }
    else {
      int v10 = @"1";
    }
    [v11 setObject:v10 forKeyedSubscript:@"NSExtensionVersion"];
  }
}

+ (id)readSDKDictionary:(id)a3 forPlatform:(unsigned int)a4 externalProviders:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = pklog_handle_for_category(3);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v7);

  id v11 = pklog_handle_for_category(3);
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v22 = 138543362;
    id v23 = v7;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "LSSDKDictionary", " name=%{public, signpost.description:attribute}@ ", (uint8_t *)&v22, 0xCu);
  }

  uint64_t v13 = [v8 ls];

  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v6];
  uint64_t v15 = [v13 extensionPointForIdentifier:v7 platform:v14];
  id v16 = [v15 sdkEntry];

  id v17 = pklog_handle_for_category(3);
  id v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v18, OS_SIGNPOST_INTERVAL_END, v10, "LSSDKDictionary", "", (uint8_t *)&v22, 2u);
  }

  if (v16)
  {
    id v19 = v16;
  }
  else
  {
    id v20 = pklog_handle_for_category(3);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1B38D3C98((uint64_t)v7, v6, v20);
    }

    id v19 = 0;
  }

  return v19;
}

- (id)resolveSDKWithInfoPlist:(id)a3 extensionPointCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PKPlugInCore.m" lineNumber:361 description:@"cannot resolve SDK without materialized Info.plist"];
  }
  uint64_t v9 = [(PKPlugInCore *)self sdkDictionaryWithInfoPlist:v7 extensionPointCache:v8];
  id v10 = v7;
  id v11 = v10;
  if (v9)
  {
    id v11 = [(PKPlugInCore *)self mergeSDKDictionary:v9 intoExtensionDictionary:v10];
  }
  return v11;
}

- (id)mergeSDKDictionary:(id)a3 intoExtensionDictionary:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)[a4 mutableCopy];
  id v8 = [(PKPlugInCore *)self sdkOnlyKeyPaths];
  objc_msgSend(v7, "pk_removeItemsAtKeyPaths:", v8);

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  v30[0] = @"NSExtension";
  v30[1] = @"Shared";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, 0);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B38C4F88;
  v19[3] = &unk_1E6059410;
  v19[4] = self;
  objc_msgSend(v7, "pk_overlayDictionary:existingValuesTakePrecedent:exceptKeyPaths:exemptionHandler:", v6, 1, v11, v19);

  id v12 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [(PKPlugInCore *)self uuid];
    uint64_t v15 = [(PKPlugInCore *)self identifier];
    id v16 = [(PKPlugInCore *)self version];
    id v17 = [v7 objectForKeyedSubscript:@"NSExtension"];
    id v18 = [v7 objectForKeyedSubscript:@"XPCService"];
    *(_DWORD *)buf = 138544386;
    id v21 = v14;
    __int16 v22 = 2112;
    id v23 = v15;
    __int16 v24 = 2112;
    BOOL v25 = v16;
    __int16 v26 = 2112;
    BOOL v27 = v17;
    __int16 v28 = 2112;
    long long v29 = v18;
    _os_log_debug_impl(&dword_1B38B0000, v12, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] Merged plugin dictionary; NSExtension = %@, XPCService = %@",
      buf,
      0x34u);
  }
  return v7;
}

- (id)sdkOnlyKeyPaths
{
  if (qword_1EB2BE138 != -1) {
    dispatch_once(&qword_1EB2BE138, &unk_1F0C15470);
  }
  v2 = (void *)qword_1EB2BE130;
  return v2;
}

- (id)mergeSharedResources:(id)a3 into:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a3;
  id v7 = [v5 setWithArray:a4];
  [v7 addObjectsFromArray:v6];

  id v8 = [v7 allObjects];

  return v8;
}

- (id)diagnose
{
  id v4 = [(PKPlugInCore *)self identifier];

  if (!v4)
  {
    BOOL v27 = @"missing identifier (no NSExtensionIdentifier, nor even CFBundleIdentifier)";
LABEL_21:
    pkErrorf(12, v27, v5, v6, v7, v8, v9, v10, (uint64_t)v34);
    goto LABEL_22;
  }
  id v11 = [(PKPlugInCore *)self protocolSpec];

  if (!v11)
  {
    __int16 v28 = PKProtocolInfoKey;
LABEL_10:
    pkErrorf(12, @"missing \"%@\" key in Info.plist or SDK", v12, v13, v14, v15, v16, v17, (uint64_t)*v28);
    id v32 = LABEL_22:;
    goto LABEL_23;
  }
  id v18 = [(PKPlugInCore *)self attributes];

  if (!v18)
  {
    __int16 v28 = PKAttributesInfoKey;
    goto LABEL_10;
  }
  BOOL v25 = [(PKPlugInCore *)self isAppExtension];
  if (!v25)
  {
    int v26 = 0;
    goto LABEL_17;
  }
  v2 = [(PKPlugInCore *)self principalSpec];
  if ([v2 isEqualToString:@"NSObject"])
  {
    int v26 = 0;
    goto LABEL_17;
  }
  if (!pkUseInternalDiagnostics())
  {
    int v26 = 1;
LABEL_17:
    if (v25) {
      goto LABEL_18;
    }
LABEL_13:
    if (!v26) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  long long v29 = [(PKPlugInCore *)self url];
  uint64_t v30 = [v29 path];
  int v26 = [v30 hasPrefix:@"/AppleInternal/"] ^ 1;

  if (!v25) {
    goto LABEL_13;
  }
LABEL_18:

  if (v26)
  {
LABEL_14:
    pkErrorf(12, @"Application Extensions may not use the \"%@\" key", v19, v20, v21, v22, v23, v24, @"PrincipalClass");
    goto LABEL_22;
  }
LABEL_19:
  char v31 = [(PKPlugInCore *)self pluginKey:@"PassProxy"];

  if (v31)
  {
    v34 = @"PassProxy";
    BOOL v27 = @"the \"%@\" key is not supported on this platform";
    goto LABEL_21;
  }
  if ([(PKPlugInCore *)self isHybrid])
  {
    id v32 = pkError(12, @"hybrid plug-ins are not supported on this platform");
  }
  else
  {
    id v32 = 0;
  }
LABEL_23:
  return v32;
}

- (NSString)bootInstance
{
  if (qword_1E9CD2B08 != -1) {
    dispatch_once(&qword_1E9CD2B08, &unk_1F0C155D0);
  }
  v2 = (void *)qword_1E9CD2B38;
  return (NSString *)v2;
}

- (void)setAnnotation:(id)a3 value:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PKPlugInCore *)self setAnnotationTimestamp:mach_continuous_time()];
  uint64_t v8 = [(PKPlugInCore *)self annotations];
  uint64_t v9 = (void *)[v7 copy];
  uint64_t v10 = [v8 dictionaryChanging:v6 to:v9];
  [(PKPlugInCore *)self setAnnotations:v10];

  id v11 = pklog_handle_for_category(10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [(PKPlugInCore *)self uuid];
    uint64_t v13 = [(PKPlugInCore *)self identifier];
    uint64_t v14 = [(PKPlugInCore *)self version];
    int v15 = 138544642;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v13;
    __int16 v19 = 2112;
    __int16 v21 = 2080;
    uint64_t v20 = v14;
    uint64_t v22 = "-[PKPlugInCore setAnnotation:value:]";
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_debug_impl(&dword_1B38B0000, v11, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] %s set annotation %@ : %@", (uint8_t *)&v15, 0x3Eu);
  }
}

- (BOOL)oldStyle
{
  id v4 = [(PKPlugInCore *)self infoKey:@"NSExtension"];

  if (!v4)
  {
    uint64_t v5 = [(PKPlugInCore *)self infoKey:@"PlugInKit"];

    if (!v5)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PKPlugInCore.m" lineNumber:570 description:@"unknown plug-in configuration style"];
    }
  }
  return v4 == 0;
}

- (NSString)principalSpec
{
  id v3 = [(PKPlugInCore *)self pluginKey:@"PrincipalClass"];
  if (!v3)
  {
    if ([(PKPlugInCore *)self isAppExtension]) {
      id v3 = @"NSObject";
    }
    else {
      id v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (NSString)sdkSpec
{
  v2 = [(PKPlugInCore *)self pluginKey:@"NSExtensionPointIdentifier"];
  return (NSString *)v2;
}

- (id)embeddedCodePath
{
  return 0;
}

- (id)embeddedProtocolSpec
{
  id v3 = [(PKPlugInCore *)self pluginKey:@"EmbeddedProtocol"];
  if (!v3)
  {
    id v3 = [(PKPlugInCore *)self protocolSpec];
  }
  return v3;
}

- (BOOL)isMultiplexed
{
  return 0;
}

- (BOOL)isHybrid
{
  v2 = [(PKPlugInCore *)self pluginKey:@"EmbeddedCode"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSDate)timestamp
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)-[PKPlugInCore lastModified](self, "lastModified"));
  return (NSDate *)v2;
}

- (BOOL)shouldTerminateOnHold
{
  v2 = [(PKPlugInCore *)self pluginKey:@"NSExtensionShouldTerminateOnHold"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasEntitlement:(id)a3
{
  char v3 = [(PKPlugInCore *)self valueForEntitlement:a3];
  id v4 = v3;
  if (v3) {
    int v5 = [v3 isEqual:MEMORY[0x1E4F1CC28]] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)usesHostPersona
{
  v2 = [(PKPlugInCore *)self valueForEntitlement:@"com.apple.private.pluginkit.persona"];
  if (!v2)
  {
LABEL_7:
    char v3 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1B38D3F70();
    }

    goto LABEL_7;
  }
  char v3 = [v2 isEqualToString:@"host"];
LABEL_8:

  return v3;
}

- (id)augmentInterface:(id)a3
{
  return 0;
}

- (void)localizedInfoDictionaryForKeys:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = v8;
  if (self->_bundleInfoDictionary)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v6;
    unint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v11)
    {
      uint64_t v27 = v7;
      id v28 = v6;
      uint64_t v30 = 0;
      uint64_t v12 = *(void *)v32;
      uint64_t v29 = *MEMORY[0x1E4F28568];
      while (1)
      {
        uint64_t v13 = 0;
        if (v11 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v11;
        }
        do
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
          if ([v15 isEqualToString:@"CFBundleName"])
          {
            uint64_t v16 = [(PKPlugInCore *)self localizedShortName];
            if (!v16) {
              goto LABEL_14;
            }
          }
          else if (![v15 isEqualToString:@"CFBundleDisplayName"] {
                 || ([(PKPlugInCore *)self localizedName],
          }
                     (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
          {
LABEL_14:
            uint64_t v16 = [(PKPlugInCore *)self infoKey:v15];
            if (!v16)
            {
              uint64_t v16 = [(NSDictionary *)self->_bundleInfoDictionary objectForKey:v15];
              if (!v16) {
                goto LABEL_18;
              }
            }
          }
          if (![v16 conformsToProtocol:&unk_1F0C26088])
          {

            __int16 v17 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v37 = v29;
            id v18 = [NSString stringWithFormat:@"Value of info dictionary key \"%@\" for plugin %@ does not conform to secure coding!", v15, self->_identifier];
            __int16 v38 = v18;
            __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
            [v17 errorWithDomain:@"PlugInKit" code:-1 userInfo:v19];
            v21 = id v20 = v10;

            uint64_t v30 = (void *)v21;
            id v10 = v20;
            uint64_t v9 = 0;

            goto LABEL_22;
          }
          [v9 setObject:v16 forKeyedSubscript:v15];
LABEL_18:

          ++v13;
        }
        while (v14 != v13);
        unint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (!v11)
        {
LABEL_22:
          id v7 = v27;
          id v6 = v28;
          uint64_t v22 = v30;
          goto LABEL_25;
        }
      }
    }
    uint64_t v22 = 0;
  }
  else
  {

    __int16 v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    uint64_t v24 = [NSString stringWithFormat:@"Unable to resolve plugin for %@", self->_identifier];
    uint64_t v36 = v24;
    __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v22 = [v23 errorWithDomain:@"PlugInKit" code:-1 userInfo:v25];

    id v10 = (id)v24;
    uint64_t v9 = 0;
  }
LABEL_25:

  id v26 = pklog_handle_for_category(3);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_1B38D4004(self, v9, v26);
  }

  v7[2](v7, v9, v22);
}

- (NSDictionary)localizedFileProviderActionNames
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedFileProviderActionNames) {
    [(PKPlugInCore *)v2 _loadLocalizedFileProviderActionNames];
  }
  objc_sync_exit(v2);

  localizedFileProviderActionNames = v2->_localizedFileProviderActionNames;
  return localizedFileProviderActionNames;
}

- (BOOL)useBundle:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)_loadLocalizedFileProviderActionNames
{
  char v3 = (void *)MEMORY[0x1B3EBB4E0](self, a2);
  id v14 = 0;
  BOOL v4 = [(PKPlugInCore *)self useBundle:@"." error:&v14];
  id v5 = v14;
  if (v4)
  {
    id v6 = [(PKPlugInCore *)self external];
    id v7 = [v6 filesystem];
    uint64_t v8 = [(PKPlugInCore *)self url];
    uint64_t v9 = [v7 bundleWithURL:v8];

    id v10 = [(PKPlugInCore *)self plugInDictionary];
    unint64_t v11 = [(PKPlugInCore *)self _localizedFileProviderActionNamesForPKDict:v10 fromBundle:v9];
    localizedFileProviderActionNames = self->_localizedFileProviderActionNames;
    self->_localizedFileProviderActionNames = v11;

    uint64_t v13 = pklog_handle_for_category(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1B38D41F8(self, &self->_localizedFileProviderActionNames, v13);
    }
  }
  else
  {
    uint64_t v9 = pklog_handle_for_category(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1B38D42C8(self, v5, v9);
    }
  }
}

- (id)_localizedFileProviderActionNamesForPKDict:(id)a3 fromBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (void *)MEMORY[0x1B3EBB4E0]();
  id v10 = [v6 objectForKeyedSubscript:@"NSExtensionFileProviderActions"];
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B38C6228;
    v14[3] = &unk_1E6059438;
    int v15 = v8;
    id v16 = v7;
    __int16 v17 = self;
    [v10 enumerateObjectsUsingBlock:v14];

    unint64_t v11 = v15;
  }
  else
  {
    unint64_t v11 = pklog_handle_for_category(3);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1B38D4368(self, v11);
    }
  }

  uint64_t v12 = (void *)[v8 copy];

  return v12;
}

- (id)description
{
  id v3 = [NSString alloc];
  BOOL v4 = [(PKPlugInCore *)self uuid];
  id v5 = [(PKPlugInCore *)self identifier];
  id v6 = [(PKPlugInCore *)self version];
  id v7 = [(PKPlugInCore *)self discoveryInstanceUUID];
  uint64_t v8 = [(PKPlugInCore *)self path];
  uint64_t v9 = (void *)[v3 initWithFormat:@"<[u %@] [%@(%@)],[d %@] [%@]>", v4, v5, v6, v7, v8];

  return v9;
}

- (id)debugDescription
{
  id v14 = [NSString alloc];
  id v3 = [(PKPlugInCore *)self uuid];
  BOOL v4 = [(PKPlugInCore *)self identifier];
  id v5 = [(PKPlugInCore *)self version];
  BOOL v6 = [(PKPlugInCore *)self isAppExtension];
  BOOL v7 = [(PKPlugInCore *)self onSystemVolume];
  uint64_t v8 = [(PKPlugInCore *)self containingBundleIdentifier];
  int64_t v9 = [(PKPlugInCore *)self lastModified];
  id v10 = [(PKPlugInCore *)self discoveryInstanceUUID];
  unint64_t v11 = [(PKPlugInCore *)self path];
  uint64_t v12 = objc_msgSend(v14, "initWithFormat:", @"<PKPlugInCore: %p; uuid = [%@], identifier = [%@(%@)], isAppExtension = %d, onSystemVolume = %d, containingBundle = [%@], lastModified = %ld, discoveryInstanceUUID = [%@], path = [%@]>",
                  self,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10,
                  v11);

  return v12;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setUrl:(id)a3
{
}

- (void)setBundleInfoDictionary:(id)a3
{
}

- (void)setPlugInDictionary:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (NSData)cdhash
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)requirement
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_discoveryInstanceUUID, 0);
  objc_storeStrong((id *)&self->_launchPersonas, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_requirement, 0);
  objc_storeStrong((id *)&self->_cdhash, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_localizedFileProviderActionNames, 0);
  objc_storeStrong((id *)&self->_localizedContainingName, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_plugInDictionary, 0);
  objc_storeStrong((id *)&self->_bundleInfoDictionary, 0);
  objc_storeStrong((id *)&self->_containingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containingUrl, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_originalIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end