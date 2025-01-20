@interface IPAAdjustmentVersionInfo
+ (id)_frameworkVersion;
+ (id)currentVersionInfo;
+ (id)frameworkVersion;
+ (id)systemBuildVersion;
+ (id)versionInfoFromArchivalRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVersionInfo:(id)a3;
- (NSString)appVersion;
- (NSString)buildNumber;
- (NSString)platform;
- (id)archivalRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)schemaRevision;
- (void)setAppVersion:(id)a3;
- (void)setBuildNumber:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setSchemaRevision:(int64_t)a3;
@end

@implementation IPAAdjustmentVersionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

- (void)setSchemaRevision:(int64_t)a3
{
  self->_schemaRevision = a3;
}

- (int64_t)schemaRevision
{
  return self->_schemaRevision;
}

- (void)setAppVersion:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setBuildNumber:(id)a3
{
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (void)setPlatform:(id)a3
{
}

- (NSString)platform
{
  return self->_platform;
}

- (BOOL)isEqualToVersionInfo:(id)a3
{
  id v5 = a3;
  v6 = [(IPAAdjustmentVersionInfo *)self platform];
  if (v6 || ([v5 platform], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = [v5 platform];
    v8 = [(IPAAdjustmentVersionInfo *)self platform];
    int v9 = [v7 isEqual:v8];

    if (v6)
    {

      if (!v9) {
        goto LABEL_19;
      }
    }
    else
    {

      if ((v9 & 1) == 0) {
        goto LABEL_19;
      }
    }
  }
  v10 = [(IPAAdjustmentVersionInfo *)self buildNumber];
  if (v10 || ([v5 buildNumber], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = [v5 buildNumber];
    v12 = [(IPAAdjustmentVersionInfo *)self buildNumber];
    int v13 = [v11 isEqual:v12];

    if (v10)
    {

      if (!v13) {
        goto LABEL_19;
      }
    }
    else
    {

      if ((v13 & 1) == 0) {
        goto LABEL_19;
      }
    }
  }
  v14 = [(IPAAdjustmentVersionInfo *)self appVersion];
  if (!v14)
  {
    v3 = [v5 appVersion];
    if (!v3) {
      goto LABEL_17;
    }
  }
  v15 = [v5 appVersion];
  v16 = [(IPAAdjustmentVersionInfo *)self appVersion];
  int v17 = [v15 isEqual:v16];

  if (!v14)
  {

    if (v17) {
      goto LABEL_17;
    }
LABEL_19:
    BOOL v19 = 0;
    goto LABEL_20;
  }

  if (!v17) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v18 = [v5 schemaRevision];
  BOOL v19 = v18 == [(IPAAdjustmentVersionInfo *)self schemaRevision];
LABEL_20:

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(IPAAdjustmentVersionInfo *)self isEqualToVersionInfo:v4];

  return v5;
}

- (id)archivalRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(IPAAdjustmentVersionInfo *)self platform];

  if (v4)
  {
    BOOL v5 = [(IPAAdjustmentVersionInfo *)self platform];
    [v3 setObject:v5 forKeyedSubscript:@"platform"];
  }
  v6 = [(IPAAdjustmentVersionInfo *)self buildNumber];

  if (v6)
  {
    v7 = [(IPAAdjustmentVersionInfo *)self buildNumber];
    [v3 setObject:v7 forKeyedSubscript:@"buildNumber"];
  }
  v8 = [(IPAAdjustmentVersionInfo *)self appVersion];

  if (v8)
  {
    int v9 = [(IPAAdjustmentVersionInfo *)self appVersion];
    [v3 setObject:v9 forKeyedSubscript:@"appVersion"];
  }
  if ([(IPAAdjustmentVersionInfo *)self schemaRevision])
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[IPAAdjustmentVersionInfo schemaRevision](self, "schemaRevision"));
    [v3 setObject:v10 forKeyedSubscript:@"schemaRevision"];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  BOOL v5 = [(IPAAdjustmentVersionInfo *)self platform];
  [v4 setPlatform:v5];

  v6 = [(IPAAdjustmentVersionInfo *)self buildNumber];
  [v4 setBuildNumber:v6];

  v7 = [(IPAAdjustmentVersionInfo *)self appVersion];
  [v4 setAppVersion:v7];

  objc_msgSend(v4, "setSchemaRevision:", -[IPAAdjustmentVersionInfo schemaRevision](self, "schemaRevision"));
  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(IPAAdjustmentVersionInfo *)self platform];
  v6 = [(IPAAdjustmentVersionInfo *)self buildNumber];
  v7 = [(IPAAdjustmentVersionInfo *)self appVersion];
  v8 = [v3 stringWithFormat:@"<%@:%p platform=%@ buildNumber=%@ appVersion=%@ schemaRevision=%ld>", v4, self, v5, v6, v7, -[IPAAdjustmentVersionInfo schemaRevision](self, "schemaRevision")];

  return v8;
}

+ (id)versionInfoFromArchivalRepresentation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_opt_new();
    BOOL v5 = [v3 objectForKeyedSubscript:@"platform"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setPlatform:v5];
    }
    v6 = [v3 objectForKeyedSubscript:@"buildNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setBuildNumber:v6];
    }
    v7 = [v3 objectForKeyedSubscript:@"appVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setAppVersion:v7];
    }
    v8 = [v3 objectForKeyedSubscript:@"schemaRevision"];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v4, "setSchemaRevision:", objc_msgSend(v8, "integerValue"));
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)_frameworkVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  uint64_t v4 = v3;
  if (!v3)
  {
    v6 = IPAAdjustmentGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = a1;
      _os_log_impl(&dword_1DD3FD000, v6, OS_LOG_TYPE_ERROR, "Bundle not found for class: %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_13;
  }
  BOOL v5 = [v3 infoDictionary];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F1D020]];
    if (v7)
    {
      v8 = (void *)v7;
      goto LABEL_14;
    }
    int v9 = IPAAdjustmentGetLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v10 = [v4 bundlePath];
    int v13 = 138412290;
    id v14 = v10;
    v11 = "Failed to get version for bundle at path: %@";
    goto LABEL_11;
  }
  int v9 = IPAAdjustmentGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = [v4 bundlePath];
    int v13 = 138412290;
    id v14 = v10;
    v11 = "Failed to load Info.plist for bundle at path: %@";
LABEL_11:
    _os_log_impl(&dword_1DD3FD000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0xCu);
  }
LABEL_12:

LABEL_13:
  v8 = 0;
LABEL_14:

  return v8;
}

+ (id)frameworkVersion
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__IPAAdjustmentVersionInfo_frameworkVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (frameworkVersion_onceToken != -1) {
    dispatch_once(&frameworkVersion_onceToken, block);
  }
  v2 = (void *)frameworkVersion_version;
  return v2;
}

uint64_t __44__IPAAdjustmentVersionInfo_frameworkVersion__block_invoke(uint64_t a1)
{
  frameworkVersion_version = [*(id *)(a1 + 32) _frameworkVersion];
  return MEMORY[0x1F41817F8]();
}

+ (id)systemBuildVersion
{
  if (systemBuildVersion_onceToken != -1) {
    dispatch_once(&systemBuildVersion_onceToken, &__block_literal_global);
  }
  v2 = (void *)systemBuildVersion_buildVersion;
  return v2;
}

uint64_t __46__IPAAdjustmentVersionInfo_systemBuildVersion__block_invoke()
{
  systemBuildVersion_buildVersion = _CFCopySystemVersionDictionaryValue();
  return MEMORY[0x1F41817F8]();
}

+ (id)currentVersionInfo
{
  id v3 = objc_opt_new();
  [v3 setPlatform:@"OSX"];
  uint64_t v4 = [a1 systemBuildVersion];
  [v3 setBuildNumber:v4];

  BOOL v5 = [a1 frameworkVersion];
  [v3 setAppVersion:v5];

  [v3 setSchemaRevision:1];
  return v3;
}

@end