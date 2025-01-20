@interface MADownloadOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowDaemonConnectionRetries;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveAccess;
- (BOOL)canUseLocalCacheServer;
- (BOOL)disableUI;
- (BOOL)discretionary;
- (BOOL)liveServerCatalogOnly;
- (BOOL)liveServerCatalogOnlyIsOverridden;
- (BOOL)prefersInfraWiFi;
- (BOOL)requiresPowerPluggedIn;
- (MADownloadOptions)init;
- (MADownloadOptions)initWithCoder:(id)a3;
- (MADownloadOptions)initWithPlist:(id)a3;
- (NSData)decryptionKey;
- (NSDictionary)analyticsData;
- (NSMutableDictionary)additionalServerParams;
- (NSString)downloadAuthorizationHeader;
- (NSString)sessionId;
- (NSString)sourceDirectory;
- (id)description;
- (id)encodeAsPlist;
- (id)tightSummaryIncludingAdditional:(BOOL)a3;
- (int64_t)timeoutIntervalForResource;
- (void)encodeWithCoder:(id)a3;
- (void)logOptions;
- (void)setAdditionalServerParams:(id)a3;
- (void)setAllowDaemonConnectionRetries:(BOOL)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setAllowsExpensiveAccess:(BOOL)a3;
- (void)setAnalyticsData:(id)a3;
- (void)setCanUseLocalCacheServer:(BOOL)a3;
- (void)setDecryptionKey:(id)a3;
- (void)setDisableUI:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadAuthorizationHeader:(id)a3;
- (void)setLiveServerCatalogOnly:(BOOL)a3;
- (void)setLiveServerCatalogOnlyIsOverridden:(BOOL)a3;
- (void)setPrefersInfraWiFi:(BOOL)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setSourceDirectory:(id)a3;
- (void)setTimeoutIntervalForResource:(int64_t)a3;
@end

@implementation MADownloadOptions

- (void)logOptions
{
  id v6 = [(MADownloadOptions *)self description];
  _MobileAssetLog(0, 6, (uint64_t)"-[MADownloadOptions logOptions]", @"The download options are %@", v2, v3, v4, v5, (uint64_t)v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDirectory, 0);
  objc_storeStrong((id *)&self->_decryptionKey, 0);
  objc_storeStrong((id *)&self->_analyticsData, 0);
  objc_storeStrong((id *)&self->_downloadAuthorizationHeader, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_additionalServerParams, 0);
}

- (void)setDownloadAuthorizationHeader:(id)a3
{
}

- (MADownloadOptions)initWithPlist:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MADownloadOptions;
  uint64_t v5 = [(MADownloadOptions *)&v23 init];
  if (v5)
  {
    id v6 = getPlistString(v4, @"SessionId");
    [(MADownloadOptions *)v5 setSessionId:v6];

    v7 = getPlistData(v4, @"AdditionalServerParams");
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:0];
    v9 = plistDecodeClasses();
    v10 = [v8 decodeObjectOfClasses:v9 forKey:*MEMORY[0x1E4F284E8]];

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      _MobileAssetLog(0, 6, (uint64_t)"-[MADownloadOptions initWithPlist:]", @"Invalid additionalServerParams; not a dictionary. Leaving as nil.",
    }
        v11,
        v12,
        v13,
        v14,
        (uint64_t)v23.receiver);
    else {
      [(MADownloadOptions *)v5 setAdditionalServerParams:v10];
    }
    [v8 finishDecoding];
    v5->_allowsCellularAccess = getPlistNumberAsBool(v4, @"allowsCellularAccess");
    v5->_allowsExpensiveAccess = getPlistNumberAsBool(v4, @"allowsExpensive");
    v5->_requiresPowerPluggedIn = getPlistNumberAsBool(v4, @"requiresPowerPluggedIn");
    v5->_prefersInfraWiFi = getPlistNumberAsBool(v4, @"prefersInfraWiFi");
    v15 = getPlistNumber(v4, @"timeoutIntervalForResource");
    v5->_timeoutIntervalForResource = [v15 longValue];

    v5->_canUseLocalCacheServer = getPlistNumberAsBool(v4, @"canUseLocalCacheServer");
    v5->_discretionary = getPlistNumberAsBool(v4, @"discretionary");
    uint64_t v16 = getPlistData(v4, @"decryptionKey");
    decryptionKey = v5->_decryptionKey;
    v5->_decryptionKey = (NSData *)v16;

    uint64_t v18 = getPlistString(v4, @"sourceDirectory");
    sourceDirectory = v5->_sourceDirectory;
    v5->_sourceDirectory = (NSString *)v18;

    v5->_allowDaemonConnectionRetries = getPlistNumberAsBool(v4, @"allowDaemonConnectionRetries");
    v5->_liveServerCatalogOnly = getPlistNumberAsBool(v4, @"LiveServerOnly");
    v5->_liveServerCatalogOnlyIsOverridden = getPlistNumberAsBool(v4, @"LiveServerOnlyIsOverridden");
    uint64_t v20 = getPlistDictionary(v4, @"AnalyticsData");
    analyticsData = v5->_analyticsData;
    v5->_analyticsData = (NSDictionary *)v20;
  }
  return v5;
}

- (void)setSessionId:(id)a3
{
}

- (void)setAdditionalServerParams:(id)a3
{
}

- (id)description
{
  v21 = NSString;
  BOOL v19 = [(MADownloadOptions *)self allowsCellularAccess];
  int64_t v18 = [(MADownloadOptions *)self timeoutIntervalForResource];
  BOOL v16 = [(MADownloadOptions *)self canUseLocalCacheServer];
  BOOL v15 = [(MADownloadOptions *)self discretionary];
  BOOL v14 = [(MADownloadOptions *)self disableUI];
  uint64_t v20 = [(MADownloadOptions *)self sessionId];
  v17 = [(MADownloadOptions *)self additionalServerParams];
  uint64_t v3 = stringWithoutNewlines((uint64_t)v17);
  BOOL v13 = [(MADownloadOptions *)self allowsExpensiveAccess];
  BOOL v4 = [(MADownloadOptions *)self requiresPowerPluggedIn];
  BOOL v5 = [(MADownloadOptions *)self prefersInfraWiFi];
  if (self->_liveServerCatalogOnlyIsOverridden) {
    uint64_t liveServerCatalogOnly = self->_liveServerCatalogOnly;
  }
  else {
    uint64_t liveServerCatalogOnly = 0xFFFFFFFFLL;
  }
  v7 = [(MADownloadOptions *)self downloadAuthorizationHeader];
  v8 = @"present";
  if (v7) {
    v9 = @"present";
  }
  else {
    v9 = @"not present";
  }
  v10 = [(MADownloadOptions *)self analyticsData];
  if (!v10) {
    v8 = @"not present";
  }
  uint64_t v11 = [v21 stringWithFormat:@"MADownloadOptions allowsCellular: %d resourceTimeout: %ld canUseCacheServer: %d discretionary: %d disableUI: %d sessionId: %@ additionalServerParams:%@ allowsExpensiveAccess:%d requiresPowerPluggedIn: %d prefersInfraWiFi: %d liveServerOnly: %d DownloadAuthorizationHeader: %@ analyticsData: %@ allowDaemonConnectionRetries: %d", v19, v18, v16, v15, v14, v20, v3, v13, v4, v5, liveServerCatalogOnly, v9, v8, -[MADownloadOptions allowDaemonConnectionRetries](self, "allowDaemonConnectionRetries")];

  return v11;
}

- (int64_t)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (BOOL)disableUI
{
  return self->_disableUI;
}

- (BOOL)canUseLocalCacheServer
{
  return self->_canUseLocalCacheServer;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (NSMutableDictionary)additionalServerParams
{
  return self->_additionalServerParams;
}

- (NSDictionary)analyticsData
{
  return self->_analyticsData;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (BOOL)prefersInfraWiFi
{
  return self->_prefersInfraWiFi;
}

- (NSString)downloadAuthorizationHeader
{
  return self->_downloadAuthorizationHeader;
}

- (BOOL)allowsExpensiveAccess
{
  return self->_allowsExpensiveAccess;
}

- (BOOL)allowDaemonConnectionRetries
{
  return self->_allowDaemonConnectionRetries;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (void)setTimeoutIntervalForResource:(int64_t)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (id)encodeAsPlist
{
  uint64_t v3 = objc_opt_new();
  if (self->_additionalServerParams)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_additionalServerParams requiringSecureCoding:1 error:0];
      [v3 setValue:v4 forKey:@"AdditionalServerParams"];
    }
  }
  BOOL v5 = [NSNumber numberWithBool:self->_allowsCellularAccess];
  [v3 setValue:v5 forKey:@"allowsCellularAccess"];

  id v6 = [NSNumber numberWithBool:self->_allowsExpensiveAccess];
  [v3 setValue:v6 forKey:@"allowsExpensive"];

  v7 = [NSNumber numberWithBool:self->_requiresPowerPluggedIn];
  [v3 setValue:v7 forKey:@"requiresPowerPluggedIn"];

  v8 = [NSNumber numberWithBool:self->_prefersInfraWiFi];
  [v3 setValue:v8 forKey:@"prefersInfraWiFi"];

  v9 = [NSNumber numberWithLong:self->_timeoutIntervalForResource];
  [v3 setValue:v9 forKey:@"timeoutIntervalForResource"];

  v10 = [NSNumber numberWithBool:self->_canUseLocalCacheServer];
  [v3 setValue:v10 forKey:@"canUseLocalCacheServer"];

  uint64_t v11 = [NSNumber numberWithBool:self->_discretionary];
  [v3 setValue:v11 forKey:@"discretionary"];

  decryptionKey = self->_decryptionKey;
  if (decryptionKey) {
    [v3 setValue:decryptionKey forKey:@"decryptionKey"];
  }
  sourceDirectory = self->_sourceDirectory;
  if (sourceDirectory) {
    [v3 setValue:sourceDirectory forKey:@"sourceDirectory"];
  }
  BOOL v14 = [NSNumber numberWithBool:self->_allowDaemonConnectionRetries];
  [v3 setValue:v14 forKey:@"allowDaemonConnectionRetries"];

  BOOL v15 = [NSNumber numberWithBool:self->_liveServerCatalogOnly];
  [v3 setValue:v15 forKey:@"LiveServerOnly"];

  BOOL v16 = [NSNumber numberWithBool:self->_liveServerCatalogOnlyIsOverridden];
  [v3 setValue:v16 forKey:@"LiveServerOnlyIsOverridden"];

  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setValue:sessionId forKey:@"SessionId"];
  }
  int64_t v18 = [(MADownloadOptions *)self analyticsData];

  if (v18)
  {
    BOOL v19 = [(MADownloadOptions *)self analyticsData];
    [v3 setValue:v19 forKey:@"AnalyticsData"];
  }
  return v3;
}

- (MADownloadOptions)init
{
  v11.receiver = self;
  v11.super_class = (Class)MADownloadOptions;
  uint64_t v2 = [(MADownloadOptions *)&v11 init];
  uint64_t v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_discretionary = 1;
    additionalServerParams = v2->_additionalServerParams;
    v2->_additionalServerParams = 0;

    sessionId = v3->_sessionId;
    v3->_sessionId = 0;

    *(_WORD *)&v3->_allowsCellularAccess = 0;
    v3->_timeoutIntervalForResource = -1;
    *(_DWORD *)&v3->_allowsExpensiveAccess = 65537;
    v3->_liveServerCatalogOnlyIsOverridden = 0;
    downloadAuthorizationHeader = v3->_downloadAuthorizationHeader;
    v3->_downloadAuthorizationHeader = 0;

    decryptionKey = v3->_decryptionKey;
    v3->_decryptionKey = 0;

    sourceDirectory = v3->_sourceDirectory;
    v3->_sourceDirectory = 0;

    analyticsData = v3->_analyticsData;
    v3->_analyticsData = 0;

    v3->_allowDaemonConnectionRetries = 0;
  }
  return v3;
}

- (void)setAllowsExpensiveAccess:(BOOL)a3
{
  self->_allowsExpensiveAccess = a3;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)liveServerCatalogOnly
{
  return self->_liveServerCatalogOnly;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADownloadOptions)initWithCoder:(id)a3
{
  v38[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MADownloadOptions;
  BOOL v5 = [(MADownloadOptions *)&v37 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SessionId"];
    [(MADownloadOptions *)v5 setSessionId:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AdditionalServerParams"];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:0];
    v9 = plistDecodeClasses();
    v10 = [v8 decodeObjectOfClasses:v9 forKey:*MEMORY[0x1E4F284E8]];

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      _MobileAssetLog(0, 6, (uint64_t)"-[MADownloadOptions initWithCoder:]", @"Invalid additionalServerParams; not a dictionary. Leaving as nil.",
    }
        v11,
        v12,
        v13,
        v14,
        v36);
    else {
      [(MADownloadOptions *)v5 setAdditionalServerParams:v10];
    }
    [v8 finishDecoding];
    BOOL v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsCellularAccess"];
    v5->_allowsCellularAccess = [v15 BOOLValue];

    BOOL v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsExpensive"];
    v5->_allowsExpensiveAccess = [v16 BOOLValue];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiresPowerPluggedIn"];
    v5->_requiresPowerPluggedIn = [v17 BOOLValue];

    int64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prefersInfraWiFi"];
    v5->_prefersInfraWiFi = [v18 BOOLValue];

    BOOL v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeoutIntervalForResource"];
    v5->_timeoutIntervalForResource = [v19 longValue];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"canUseLocalCacheServer"];
    v5->_canUseLocalCacheServer = [v20 BOOLValue];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discretionary"];
    v5->_discretionary = [v21 BOOLValue];

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disableUI"];
    v5->_disableUI = [v22 BOOLValue];

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"decryptionKey"];
    decryptionKey = v5->_decryptionKey;
    v5->_decryptionKey = (NSData *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceDirectory"];
    sourceDirectory = v5->_sourceDirectory;
    v5->_sourceDirectory = (NSString *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowDaemonConnectionRetries"];
    v5->_allowDaemonConnectionRetries = [v27 BOOLValue];

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LiveServerOnly"];
    v5->_uint64_t liveServerCatalogOnly = [v28 BOOLValue];

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LiveServerOnlyIsOverridden"];
    v5->_liveServerCatalogOnlyIsOverridden = [v29 BOOLValue];

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DownloadAuthorizationHeader"];
    [(MADownloadOptions *)v5 setDownloadAuthorizationHeader:v30];

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v38[3] = objc_opt_class();
    v38[4] = objc_opt_class();
    v38[5] = objc_opt_class();
    v38[6] = objc_opt_class();
    v38[7] = objc_opt_class();
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:8];
    v33 = [v31 setWithArray:v32];

    v34 = [v4 decodeObjectOfClasses:v33 forKey:@"AnalyticsData"];
    [(MADownloadOptions *)v5 setAnalyticsData:v34];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  if (self->_additionalServerParams)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_additionalServerParams requiringSecureCoding:1 error:0];
      [v21 encodeObject:v4 forKey:@"AdditionalServerParams"];
    }
  }
  BOOL v5 = [NSNumber numberWithBool:self->_allowsCellularAccess];
  [v21 encodeObject:v5 forKey:@"allowsCellularAccess"];

  id v6 = [NSNumber numberWithBool:self->_allowsExpensiveAccess];
  [v21 encodeObject:v6 forKey:@"allowsExpensive"];

  v7 = [NSNumber numberWithBool:self->_requiresPowerPluggedIn];
  [v21 encodeObject:v7 forKey:@"requiresPowerPluggedIn"];

  v8 = [NSNumber numberWithBool:self->_prefersInfraWiFi];
  [v21 encodeObject:v8 forKey:@"prefersInfraWiFi"];

  v9 = [NSNumber numberWithLong:self->_timeoutIntervalForResource];
  [v21 encodeObject:v9 forKey:@"timeoutIntervalForResource"];

  v10 = [NSNumber numberWithBool:self->_canUseLocalCacheServer];
  [v21 encodeObject:v10 forKey:@"canUseLocalCacheServer"];

  uint64_t v11 = [NSNumber numberWithBool:self->_discretionary];
  [v21 encodeObject:v11 forKey:@"discretionary"];

  uint64_t v12 = [NSNumber numberWithBool:self->_disableUI];
  [v21 encodeObject:v12 forKey:@"disableUI"];

  decryptionKey = self->_decryptionKey;
  if (decryptionKey) {
    [v21 encodeObject:decryptionKey forKey:@"decryptionKey"];
  }
  sourceDirectory = self->_sourceDirectory;
  if (sourceDirectory) {
    [v21 encodeObject:sourceDirectory forKey:@"sourceDirectory"];
  }
  BOOL v15 = [NSNumber numberWithBool:self->_allowDaemonConnectionRetries];
  [v21 encodeObject:v15 forKey:@"allowDaemonConnectionRetries"];

  BOOL v16 = [NSNumber numberWithBool:self->_liveServerCatalogOnly];
  [v21 encodeObject:v16 forKey:@"LiveServerOnly"];

  v17 = [NSNumber numberWithBool:self->_liveServerCatalogOnlyIsOverridden];
  [v21 encodeObject:v17 forKey:@"LiveServerOnlyIsOverridden"];

  int64_t v18 = [(MADownloadOptions *)self downloadAuthorizationHeader];
  [v21 encodeObject:v18 forKey:@"DownloadAuthorizationHeader"];

  sessionId = self->_sessionId;
  if (sessionId) {
    [v21 encodeObject:sessionId forKey:@"SessionId"];
  }
  uint64_t v20 = [(MADownloadOptions *)self analyticsData];
  [v21 encodeObject:v20 forKey:@"AnalyticsData"];
}

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_uint64_t liveServerCatalogOnly = a3;
  self->_liveServerCatalogOnlyIsOverridden = 1;
}

- (id)tightSummaryIncludingAdditional:(BOOL)a3
{
  BOOL v29 = a3;
  v28 = NSString;
  if ([(MADownloadOptions *)self discretionary]) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  if ([(MADownloadOptions *)self allowsCellularAccess]) {
    BOOL v5 = @"Y";
  }
  else {
    BOOL v5 = @"N";
  }
  if ([(MADownloadOptions *)self allowsExpensiveAccess]) {
    id v6 = @"Y";
  }
  else {
    id v6 = @"N";
  }
  if ([(MADownloadOptions *)self requiresPowerPluggedIn]) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  if ([(MADownloadOptions *)self canUseLocalCacheServer]) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if ([(MADownloadOptions *)self prefersInfraWiFi]) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  v10 = @"Y";
  if (![(MADownloadOptions *)self liveServerCatalogOnly])
  {
    if ([(MADownloadOptions *)self liveServerCatalogOnlyIsOverridden]) {
      v10 = @"Y";
    }
    else {
      v10 = @"N";
    }
  }
  if ([(MADownloadOptions *)self allowDaemonConnectionRetries]) {
    uint64_t v11 = @"Y";
  }
  else {
    uint64_t v11 = @"N";
  }
  uint64_t v12 = [v28 stringWithFormat:@"disc:%@,cell:%@,expen:%@,power:%@,cache:%@,pwifi:%@,live:%@,retry:%@", v4, v5, v6, v7, v8, v9, v10, v11];
  if (!v29) {
    goto LABEL_31;
  }
  uint64_t v13 = [(MADownloadOptions *)self additionalServerParams];
  if (!v13) {
    goto LABEL_31;
  }
  uint64_t v14 = (void *)v13;
  BOOL v15 = [(MADownloadOptions *)self additionalServerParams];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    v17 = [(MADownloadOptions *)self sessionId];

    int64_t v18 = NSString;
    BOOL v19 = [(MADownloadOptions *)self additionalServerParams];
    uint64_t v20 = stringWithoutNewlines((uint64_t)v19);
    id v21 = (void *)v20;
    if (v17)
    {
      v22 = [(MADownloadOptions *)self sessionId];
      uint64_t v23 = [v18 stringWithFormat:@"%@,+%@,ssn:%@", v12, v21, v22];

      uint64_t v12 = (void *)v23;
    }
    else
    {
      uint64_t v27 = [v18 stringWithFormat:@"%@,+%@", v12, v20];

      uint64_t v12 = (void *)v27;
    }
  }
  else
  {
LABEL_31:
    v24 = [(MADownloadOptions *)self sessionId];

    if (!v24) {
      goto LABEL_34;
    }
    uint64_t v25 = NSString;
    BOOL v19 = [(MADownloadOptions *)self sessionId];
    [v25 stringWithFormat:@"%@,ssn:%@", v12, v19];
    uint64_t v12 = v21 = v12;
  }

LABEL_34:
  return v12;
}

- (void)setCanUseLocalCacheServer:(BOOL)a3
{
  self->_canUseLocalCacheServer = a3;
}

- (void)setDisableUI:(BOOL)a3
{
  self->_disableUI = a3;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (void)setPrefersInfraWiFi:(BOOL)a3
{
  self->_prefersInfraWiFi = a3;
}

- (BOOL)liveServerCatalogOnlyIsOverridden
{
  return self->_liveServerCatalogOnlyIsOverridden;
}

- (void)setLiveServerCatalogOnlyIsOverridden:(BOOL)a3
{
  self->_liveServerCatalogOnlyIsOverridden = a3;
}

- (void)setAnalyticsData:(id)a3
{
}

- (NSData)decryptionKey
{
  return self->_decryptionKey;
}

- (void)setDecryptionKey:(id)a3
{
}

- (NSString)sourceDirectory
{
  return self->_sourceDirectory;
}

- (void)setSourceDirectory:(id)a3
{
}

- (void)setAllowDaemonConnectionRetries:(BOOL)a3
{
  self->_allowDaemonConnectionRetries = a3;
}

@end