@interface SUCorePolicyExtensionManagedUpdates
+ (BOOL)supportsSecureCoding;
+ (id)nameForMDMSoftwareUpdatePath:(unint64_t)a3;
- (BOOL)MDMUseDelayPeriod;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRequestedPMVSupervisedPolicy;
- (BOOL)supervised;
- (NSString)requestedPMV;
- (SUCorePolicyExtensionManagedUpdates)init;
- (SUCorePolicyExtensionManagedUpdates)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)mdmPathName;
- (id)summary;
- (int64_t)delayPeriodDays;
- (int64_t)delayPeriodSecs;
- (unint64_t)mdmSoftwareUpdatePath;
- (void)encodeWithCoder:(id)a3;
- (void)extendMADocumentationCatalogDownloadOptions:(id)a3 descriptor:(id)a4;
- (void)extendMASoftwareUpdateAssetDownloadOptions:(id)a3;
- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3;
- (void)extendMSUApplyOptions:(id)a3;
- (void)setDelayPeriodSecs:(int64_t)a3;
- (void)setMDMUseDelayPeriod:(BOOL)a3;
- (void)setMdmSoftwareUpdatePath:(unint64_t)a3;
- (void)setRequestedPMV:(id)a3;
- (void)setSupervised:(BOOL)a3;
@end

@implementation SUCorePolicyExtensionManagedUpdates

- (SUCorePolicyExtensionManagedUpdates)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUCorePolicyExtensionManagedUpdates;
  v2 = [(SUCorePolicyExtension *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_supervised = 0;
    requestedPMV = v2->_requestedPMV;
    v2->_requestedPMV = 0;

    v3->_MDMUseDelayPeriod = 0;
    v3->_delayPeriodSecs = 0;
    v3->_mdmSoftwareUpdatePath = 0;
  }
  return v3;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 supervised];
    objc_super v6 = @"NO";
    if (v5) {
      objc_super v6 = @"YES";
    }
    v7 = [@"|" stringByAppendingFormat:@"supervised:%@|", v6];
    if ([(SUCorePolicyExtensionManagedUpdates *)self supervised])
    {
      objc_msgSend(v4, "setSupervised:", -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"));
      v8 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];

      if (v8)
      {
        v9 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];
        [v4 setRequestedProductVersion:v9];

        v10 = [v4 requestedProductVersion];
        uint64_t v11 = [(__CFString *)v7 stringByAppendingFormat:@"requestedPMV:%@|", v10];

        v7 = (__CFString *)v11;
      }
      if ([(SUCorePolicyExtensionManagedUpdates *)self MDMUseDelayPeriod])
      {
        if ([(SUCorePolicyExtensionManagedUpdates *)self delayPeriodSecs] < 0)
        {
          v12 = [MEMORY[0x263F77DA8] sharedDiag];
          v17 = (void *)[[NSString alloc] initWithFormat:@"%@ with MDMUseDelayPeriod, yet delayPeriodSecs < 0 (ignoring delay period)", self];
          [v12 trackAnomaly:@"[POLICY] DOWNLOAD_OPTIONS" forReason:v17 withResult:8102 withError:0];
        }
        else
        {
          objc_msgSend(v4, "setDelayPeriod:", -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs") / 86400);
          -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", @"delayPeriod:%ld|", [v4 delayPeriod]);
          v12 = v7;
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      v18 = [v4 additionalServerParams];
      v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      [v18 setSafeObject:v19 forKey:@"MDMSoftwareUpdatePath"];

      v20 = [v4 additionalServerParams];
      v21 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:[(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath]];
      [v20 setSafeObject:v21 forKey:@"MDMSoftwareUpdatePathName"];

      v22 = [v4 additionalServerParams];
      v23 = -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", @"%@:%lld|", @"MDMSoftwareUpdatePath", [v22 safeULLForKey:@"MDMSoftwareUpdatePath"]);

      v15 = [v4 additionalServerParams];
      v16 = [v15 safeStringForKey:@"MDMSoftwareUpdatePathName"];
      v7 = [v23 stringByAppendingFormat:@"%@:%@|", @"MDMSoftwareUpdatePathName", v16];
    }
    else
    {
      v15 = [MEMORY[0x263F77DA8] sharedDiag];
      v16 = (void *)[[NSString alloc] initWithFormat:@"%@ without supervised = YES, yet calling extendMASoftwareUpdateCatalogDownloadOptions (no extended download options will be added)", self];
      [v15 trackAnomaly:@"[POLICY] DOWNLOAD_OPTIONS" forReason:v16 withResult:8102 withError:0];
    }

    v24 = [MEMORY[0x263F77DE8] sharedLogger];
    v14 = [v24 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      __int16 v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading software update catalog with extended download options: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v13 = [MEMORY[0x263F77DE8] sharedLogger];
    v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "Options class is not MAMsuDownloadOptions, so unable to set managed options.", buf, 2u);
    }
    v7 = @"|";
  }
}

- (void)extendMADocumentationCatalogDownloadOptions:(id)a3 descriptor:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(SUCorePolicyExtensionManagedUpdates *)self supervised])
    {
      objc_msgSend(v6, "setSupervised:", -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"));
      int v8 = [v6 supervised];
      v9 = @"NO";
      if (v8) {
        v9 = @"YES";
      }
      v10 = [@"|" stringByAppendingFormat:@"supervised:%@|", v9];
      uint64_t v11 = [v7 productVersion];
      [v6 setRequestedProductVersion:v11];

      v12 = [v6 requestedProductVersion];
      v13 = [v10 stringByAppendingFormat:@"requestedPMV:%@|", v12];

      v14 = [v6 additionalServerParams];
      v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      [v14 setSafeObject:v15 forKey:@"MDMSoftwareUpdatePath"];

      v16 = [v6 additionalServerParams];
      v17 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:[(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath]];
      [v16 setSafeObject:v17 forKey:@"MDMSoftwareUpdatePathName"];

      v18 = [v6 additionalServerParams];
      v19 = [v13 stringByAppendingFormat:@"%@:%lld|", @"MDMSoftwareUpdatePath", objc_msgSend(v18, "safeULLForKey:", @"MDMSoftwareUpdatePath"];

      v20 = [v6 additionalServerParams];
      v21 = [v20 safeStringForKey:@"MDMSoftwareUpdatePathName"];
      v22 = [v19 stringByAppendingFormat:@"%@:%@|", @"MDMSoftwareUpdatePathName", v21];
    }
    else
    {
      v22 = @"|";
    }
    v25 = [MEMORY[0x263F77DE8] sharedLogger];
    v24 = [v25 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v27 = self;
      __int16 v28 = 2114;
      uint64_t v29 = v22;
      _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading documentation catalog with extended download options: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v23 = [MEMORY[0x263F77DE8] sharedLogger];
    v24 = [v23 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "Options class is not MAMsuDownloadOptions, so unable to set managed options.", buf, 2u);
    }
    v22 = @"|";
  }
}

- (void)extendMASoftwareUpdateAssetDownloadOptions:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];

  if (v5)
  {
    id v6 = [v4 additionalServerParams];
    id v7 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];
    [v6 setSafeObject:v7 forKey:@"RequestedProductVersion"];

    int v8 = [v4 additionalServerParams];
    v9 = [v8 safeStringForKey:@"RequestedProductVersion"];
    v10 = [@"|" stringByAppendingFormat:@"%@:%@|", @"RequestedProductVersion", v9];
  }
  else
  {
    v10 = @"|";
  }
  if ([(SUCorePolicyExtensionManagedUpdates *)self MDMUseDelayPeriod])
  {
    if ([(SUCorePolicyExtensionManagedUpdates *)self delayPeriodSecs] < 0)
    {
      v13 = [MEMORY[0x263F77DA8] sharedDiag];
      v14 = (void *)[[NSString alloc] initWithFormat:@"%@ with MDMUseDelayPeriod, yet delayPeriodSecs < 0 (ignoring delay period)", self];
      [v13 trackAnomaly:@"[POLICY] DOWNLOAD_OPTIONS" forReason:v14 withResult:8102 withError:0];
    }
    else
    {
      uint64_t v11 = [v4 additionalServerParams];
      v12 = objc_msgSend(NSNumber, "numberWithLong:", -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"));
      [v11 setSafeObject:v12 forKey:@"DelayPeriod"];

      v13 = [v4 additionalServerParams];
      v14 = [v13 safeObjectForKey:@"DelayPeriod" ofClass:objc_opt_class()];
      uint64_t v15 = [(__CFString *)v10 stringByAppendingFormat:@"%@:%@|", @"DelayPeriod", v14];

      v10 = (__CFString *)v15;
    }
  }
  v16 = [v4 additionalServerParams];
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
  [v16 setSafeObject:v17 forKey:@"MDMSoftwareUpdatePath"];

  v18 = [v4 additionalServerParams];
  v19 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:[(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath]];
  [v18 setSafeObject:v19 forKey:@"MDMSoftwareUpdatePathName"];

  v20 = [v4 additionalServerParams];
  if ([(SUCorePolicyExtensionManagedUpdates *)self MDMUseDelayPeriod]) {
    v21 = @"true";
  }
  else {
    v21 = @"false";
  }
  [v20 setSafeObject:v21 forKey:@"DelayRequested"];

  v22 = [v4 additionalServerParams];
  if ([(SUCorePolicyExtensionManagedUpdates *)self supervised]) {
    v23 = @"true";
  }
  else {
    v23 = @"false";
  }
  [v22 setSafeObject:v23 forKey:@"Supervised"];

  v24 = [v4 additionalServerParams];
  v25 = [v24 safeStringForKey:@"DelayRequested"];
  v26 = [(__CFString *)v10 stringByAppendingFormat:@"%@:%@|", @"DelayRequested", v25];

  __int16 v27 = [v4 additionalServerParams];
  __int16 v28 = [v27 safeStringForKey:@"Supervised"];
  uint64_t v29 = [v26 stringByAppendingFormat:@"%@:%@|", @"Supervised", v28];

  uint64_t v30 = [v4 additionalServerParams];
  v31 = [v29 stringByAppendingFormat:@"%@:%lld|", @"MDMSoftwareUpdatePath", objc_msgSend(v30, "safeULLForKey:", @"MDMSoftwareUpdatePath"];

  v32 = [v4 additionalServerParams];
  v33 = [v32 safeStringForKey:@"MDMSoftwareUpdatePathName"];
  v34 = [v31 stringByAppendingFormat:@"%@:%@|", @"MDMSoftwareUpdatePathName", v33];

  v35 = [MEMORY[0x263F77DE8] sharedLogger];
  v36 = [v35 oslog];

  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v34;
    _os_log_impl(&dword_20C8EA000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading software update asset with extended download options: %{public}@", buf, 0x16u);
  }
}

- (void)extendMSUApplyOptions:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (__CFDictionary *)a3;
  if ([(SUCorePolicyExtensionManagedUpdates *)self supervised])
  {
    CFDictionaryAddValue(v4, (const void *)*MEMORY[0x263F55B48], (const void *)*MEMORY[0x263EFFB40]);
    int v5 = (void *)[[NSString alloc] initWithFormat:@"enabledManagedRequest|"];
    id v6 = [@"|" stringByAppendingString:v5];
  }
  else
  {
    id v6 = @"|";
  }
  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  int v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    v10 = self;
    __int16 v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU apply options with extended options: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (BOOL)isRequestedPMVSupervisedPolicy
{
  if (![(SUCorePolicyExtensionManagedUpdates *)self supervised]) {
    return 0;
  }
  id v3 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)delayPeriodDays
{
  if ([(SUCorePolicyExtensionManagedUpdates *)self MDMUseDelayPeriod]) {
    return [(SUCorePolicyExtensionManagedUpdates *)self delayPeriodSecs] / 86400;
  }
  else {
    return 0;
  }
}

- (id)mdmPathName
{
  id v3 = [(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3)
    {
      BOOL v4 = [MEMORY[0x263F77DA8] sharedDiag];
      int v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown mdmPath value: %lu", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      [v4 trackAnomaly:@"[POLICY] SCAN_OPTIONS" forReason:v5 withResult:8102 withError:0];

      id v3 = 0;
    }
  }
  else
  {
    id v3 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:[(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath]];
  }

  return v3;
}

- (SUCorePolicyExtensionManagedUpdates)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyExtensionManagedUpdates;
  int v5 = [(SUCorePolicyExtension *)&v9 init];
  if (v5)
  {
    v5->_supervised = [v4 decodeBoolForKey:@"Supervised"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequestedPMV"];
    requestedPMV = v5->_requestedPMV;
    v5->_requestedPMV = (NSString *)v6;

    v5->_MDMUseDelayPeriod = [v4 decodeBoolForKey:@"MDMUseDelayPeriod"];
    v5->_delayPeriodSecs = [v4 decodeIntegerForKey:@"DelayPeriodSecs"];
    v5->_mdmSoftwareUpdatePath = [v4 decodeIntegerForKey:@"MDMSoftwareUpdatePath"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"), @"Supervised");
  id v4 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];
  [v5 encodeObject:v4 forKey:@"RequestedPMV"];

  objc_msgSend(v5, "encodeBool:forKey:", -[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"), @"MDMUseDelayPeriod");
  objc_msgSend(v5, "encodeInteger:forKey:", -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"), @"DelayPeriodSecs");
  objc_msgSend(v5, "encodeInteger:forKey:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"), @"MDMSoftwareUpdatePath");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyExtensionManagedUpdates *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = [(SUCorePolicyExtensionManagedUpdates *)v5 supervised];
      if (v6 == [(SUCorePolicyExtensionManagedUpdates *)self supervised])
      {
        int v8 = (void *)MEMORY[0x263F77D78];
        objc_super v9 = [(SUCorePolicyExtensionManagedUpdates *)v5 requestedPMV];
        v10 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];
        if ([v8 stringIsEqual:v9 to:v10]
          && (BOOL v11 = [(SUCorePolicyExtensionManagedUpdates *)v5 MDMUseDelayPeriod],
              v11 == [(SUCorePolicyExtensionManagedUpdates *)self MDMUseDelayPeriod])
          && (uint64_t v12 = [(SUCorePolicyExtensionManagedUpdates *)v5 delayPeriodSecs],
              v12 == [(SUCorePolicyExtensionManagedUpdates *)self delayPeriodSecs]))
        {
          uint64_t v13 = [(SUCorePolicyExtensionManagedUpdates *)v5 mdmSoftwareUpdatePath];
          BOOL v7 = v13 == [(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath];
        }
        else
        {
          BOOL v7 = 0;
        }
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)extensionName
{
  return @"SUCorePolicyExtensionManagedUpdates";
}

+ (id)nameForMDMSoftwareUpdatePath:(unint64_t)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"SUCoreMDMSoftwareUpdatePathUnknown(%ld)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_2640DD880[a3];
  }

  return v3;
}

- (id)summary
{
  if ([(SUCorePolicyExtensionManagedUpdates *)self supervised])
  {
    id v3 = [&stru_26C1810A0 stringByAppendingString:@"|supervised"];
  }
  else
  {
    id v3 = &stru_26C1810A0;
  }
  id v4 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];

  if (v4)
  {
    id v5 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];
    uint64_t v6 = [(__CFString *)v3 stringByAppendingFormat:@"|requestedPMV=%@", v5];

    id v3 = (__CFString *)v6;
  }
  if ([(SUCorePolicyExtensionManagedUpdates *)self MDMUseDelayPeriod])
  {
    uint64_t v7 = [(__CFString *)v3 stringByAppendingFormat:@"|MDMDelay=%ld", [(SUCorePolicyExtensionManagedUpdates *)self delayPeriodSecs]];

    id v3 = (__CFString *)v7;
  }
  if ([(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath])
  {
    int v8 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:[(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath]];
    uint64_t v9 = [(__CFString *)v3 stringByAppendingFormat:@"|mdmSoftwareUpdatePath=%@", v8];

    id v3 = (__CFString *)v9;
  }
  if (([(__CFString *)v3 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v10 = [(__CFString *)v3 stringByAppendingString:@"|"];

    id v3 = (__CFString *)v10;
  }

  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(SUCorePolicyExtensionManagedUpdates *)self extensionName];
  if ([(SUCorePolicyExtensionManagedUpdates *)self supervised]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  uint64_t v6 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];
  if ([(SUCorePolicyExtensionManagedUpdates *)self MDMUseDelayPeriod]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  int64_t v8 = [(SUCorePolicyExtensionManagedUpdates *)self delayPeriodSecs];
  uint64_t v9 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:[(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath]];
  uint64_t v10 = (void *)[v3 initWithFormat:@"%@(supervised:%@|requestedPMV:%@|MDMUseDelayPeriod:%@|delayPeriodSecs:%ld|mdmSoftwareUpdatePath:%@)", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(SUCorePolicyExtensionManagedUpdates);
  [(SUCorePolicyExtensionManagedUpdates *)v5 setSupervised:[(SUCorePolicyExtensionManagedUpdates *)self supervised]];
  uint64_t v6 = [(SUCorePolicyExtensionManagedUpdates *)self requestedPMV];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [(SUCorePolicyExtensionManagedUpdates *)v5 setRequestedPMV:v7];

  [(SUCorePolicyExtensionManagedUpdates *)v5 setMDMUseDelayPeriod:[(SUCorePolicyExtensionManagedUpdates *)self MDMUseDelayPeriod]];
  [(SUCorePolicyExtensionManagedUpdates *)v5 setDelayPeriodSecs:[(SUCorePolicyExtensionManagedUpdates *)self delayPeriodSecs]];
  [(SUCorePolicyExtensionManagedUpdates *)v5 setMdmSoftwareUpdatePath:[(SUCorePolicyExtensionManagedUpdates *)self mdmSoftwareUpdatePath]];
  return v5;
}

- (BOOL)supervised
{
  return self->_supervised;
}

- (void)setSupervised:(BOOL)a3
{
  self->_supervised = a3;
}

- (NSString)requestedPMV
{
  return self->_requestedPMV;
}

- (void)setRequestedPMV:(id)a3
{
}

- (BOOL)MDMUseDelayPeriod
{
  return self->_MDMUseDelayPeriod;
}

- (void)setMDMUseDelayPeriod:(BOOL)a3
{
  self->_MDMUseDelayPeriod = a3;
}

- (int64_t)delayPeriodSecs
{
  return self->_delayPeriodSecs;
}

- (void)setDelayPeriodSecs:(int64_t)a3
{
  self->_delayPeriodSecs = a3;
}

- (unint64_t)mdmSoftwareUpdatePath
{
  return self->_mdmSoftwareUpdatePath;
}

- (void)setMdmSoftwareUpdatePath:(unint64_t)a3
{
  self->_mdmSoftwareUpdatePath = a3;
}

- (void).cxx_destruct
{
}

@end