@interface NUSoftwareVersion
+ (id)_frameworkVersion;
+ (id)currentSoftwareVersion;
+ (id)frameworkVersion;
+ (id)softwareVersionFromArchivalRepresentation:(id)a3;
+ (id)systemBuildVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSoftwareVersion:(id)a3;
- (NSString)appVersion;
- (NSString)buildNumber;
- (NSString)platform;
- (id)archivalRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)schemaRevision;
- (unint64_t)hash;
- (void)setAppVersion:(id)a3;
- (void)setBuildNumber:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setSchemaRevision:(int64_t)a3;
@end

@implementation NUSoftwareVersion

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
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBuildNumber:(id)a3
{
}

- (NSString)buildNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPlatform:(id)a3
{
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqualToSoftwareVersion:(id)a3
{
  id v5 = a3;
  v6 = [(NUSoftwareVersion *)self platform];
  if (v6 || ([v5 platform], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = [v5 platform];
    v8 = [(NUSoftwareVersion *)self platform];
    int v9 = [v7 isEqualToString:v8];

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
  v10 = [(NUSoftwareVersion *)self buildNumber];
  if (v10 || ([v5 buildNumber], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = [v5 buildNumber];
    v12 = [(NUSoftwareVersion *)self buildNumber];
    int v13 = [v11 isEqualToString:v12];

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
  v14 = [(NUSoftwareVersion *)self appVersion];
  if (!v14)
  {
    v3 = [v5 appVersion];
    if (!v3) {
      goto LABEL_17;
    }
  }
  v15 = [v5 appVersion];
  v16 = [(NUSoftwareVersion *)self appVersion];
  int v17 = [v15 isEqualToString:v16];

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
  BOOL v19 = v18 == [(NUSoftwareVersion *)self schemaRevision];
LABEL_20:

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NUSoftwareVersion *)self isEqualToSoftwareVersion:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(NUSoftwareVersion *)self platform];
  uint64_t v4 = 0x191F1574B62ABFLL * [v3 hash];

  BOOL v5 = [(NUSoftwareVersion *)self buildNumber];
  uint64_t v6 = 0x1C0BFE615F565DLL * [v5 hash];

  v7 = [(NUSoftwareVersion *)self appVersion];
  uint64_t v8 = 0x3BB41398110FFLL * [v7 hash];

  return v6 ^ v4 ^ v8 ^ (0x23338B35E717C9 * [(NUSoftwareVersion *)self schemaRevision]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NUSoftwareVersion allocWithZone:a3];
  objc_storeStrong((id *)&v4->_platform, self->_platform);
  objc_storeStrong((id *)&v4->_buildNumber, self->_buildNumber);
  objc_storeStrong((id *)&v4->_appVersion, self->_appVersion);
  v4->_schemaRevision = self->_schemaRevision;
  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(NUSoftwareVersion *)self platform];
  uint64_t v6 = [(NUSoftwareVersion *)self buildNumber];
  v7 = [(NUSoftwareVersion *)self appVersion];
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p platform=%@ buildNumber=%@ appVersion=%@ schemaRevision=%ld>", v4, self, v5, v6, v7, -[NUSoftwareVersion schemaRevision](self, "schemaRevision")];

  return v8;
}

+ (id)_frameworkVersion
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  if (!v3)
  {
    v10 = NUAssertLogger_5020();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [NSString stringWithFormat:@"Bundle not found for class: %@", a1];
      *(_DWORD *)buf = 138543362;
      v65 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int v13 = NUAssertLogger_5020();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v65 = v35;
        __int16 v66 = 2114;
        v67 = v39;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v65 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSoftwareVersion _frameworkVersion]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSoftwareVersion.m", 85, @"Bundle not found for class: %@", v40, v41, v42, v43, (uint64_t)a1);
  }
  uint64_t v4 = v3;
  BOOL v5 = [v3 infoDictionary];
  if (!v5)
  {
    int v17 = NUAssertLogger_5020();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = NSString;
      BOOL v19 = [v4 bundlePath];
      v20 = [v18 stringWithFormat:@"Failed to load Info.plist for bundle at path: %@", v19];
      *(_DWORD *)buf = 138543362;
      v65 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_5020();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v47 = [v45 callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v65 = v44;
        __int16 v66 = 2114;
        v67 = v48;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v65 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v49 = [v4 bundlePath];
    _NUAssertFailHandler((uint64_t)"+[NUSoftwareVersion _frameworkVersion]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSoftwareVersion.m", 88, @"Failed to load Info.plist for bundle at path: %@", v50, v51, v52, v53, v49);
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F1D020]];
  if (!v7)
  {
    v26 = NUAssertLogger_5020();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = NSString;
      v28 = [v4 bundlePath];
      v29 = [v27 stringWithFormat:@"Failed to get version for bundle at path: %@", v28];
      *(_DWORD *)buf = 138543362;
      v65 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_5020();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        v57 = [v55 callStackSymbols];
        v58 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v65 = v54;
        __int16 v66 = 2114;
        v67 = v58;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v65 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v59 = [v4 bundlePath];
    _NUAssertFailHandler((uint64_t)"+[NUSoftwareVersion _frameworkVersion]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSoftwareVersion.m", 91, @"Failed to get version for bundle at path: %@", v60, v61, v62, v63, v59);
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

+ (id)frameworkVersion
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NUSoftwareVersion_frameworkVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (frameworkVersion_onceToken != -1) {
    dispatch_once(&frameworkVersion_onceToken, block);
  }
  v2 = (void *)frameworkVersion_version;

  return v2;
}

uint64_t __37__NUSoftwareVersion_frameworkVersion__block_invoke(uint64_t a1)
{
  frameworkVersion_version = [*(id *)(a1 + 32) _frameworkVersion];

  return MEMORY[0x1F41817F8]();
}

+ (id)systemBuildVersion
{
  if (systemBuildVersion_onceToken != -1) {
    dispatch_once(&systemBuildVersion_onceToken, &__block_literal_global_5046);
  }
  v2 = (void *)systemBuildVersion_buildVersion;

  return v2;
}

uint64_t __39__NUSoftwareVersion_systemBuildVersion__block_invoke()
{
  systemBuildVersion_buildVersion = _CFCopySystemVersionDictionaryValue();

  return MEMORY[0x1F41817F8]();
}

+ (id)currentSoftwareVersion
{
  v3 = objc_opt_new();
  [v3 setPlatform:@"iOS"];
  uint64_t v4 = [a1 systemBuildVersion];
  [v3 setBuildNumber:v4];

  BOOL v5 = [a1 frameworkVersion];
  [v3 setAppVersion:v5];

  [v3 setSchemaRevision:1];

  return v3;
}

- (id)archivalRepresentation
{
  v3 = objc_opt_new();
  uint64_t v4 = [(NUSoftwareVersion *)self platform];

  if (v4)
  {
    BOOL v5 = [(NUSoftwareVersion *)self platform];
    [v3 setObject:v5 forKeyedSubscript:@"platform"];
  }
  uint64_t v6 = [(NUSoftwareVersion *)self buildNumber];

  if (v6)
  {
    uint64_t v7 = [(NUSoftwareVersion *)self buildNumber];
    [v3 setObject:v7 forKeyedSubscript:@"buildNumber"];
  }
  uint64_t v8 = [(NUSoftwareVersion *)self appVersion];

  if (v8)
  {
    int v9 = [(NUSoftwareVersion *)self appVersion];
    [v3 setObject:v9 forKeyedSubscript:@"appVersion"];
  }
  if ([(NUSoftwareVersion *)self schemaRevision])
  {
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[NUSoftwareVersion schemaRevision](self, "schemaRevision"));
    [v3 setObject:v10 forKeyedSubscript:@"schemaRevision"];
  }

  return v3;
}

+ (id)softwareVersionFromArchivalRepresentation:(id)a3
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
    uint64_t v6 = [v3 objectForKeyedSubscript:@"buildNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setBuildNumber:v6];
    }
    uint64_t v7 = [v3 objectForKeyedSubscript:@"appVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setAppVersion:v7];
    }
    uint64_t v8 = [v3 objectForKeyedSubscript:@"schemaRevision"];
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

@end