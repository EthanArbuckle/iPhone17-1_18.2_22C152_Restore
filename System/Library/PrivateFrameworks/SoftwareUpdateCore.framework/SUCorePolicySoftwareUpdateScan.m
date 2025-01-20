@interface SUCorePolicySoftwareUpdateScan
+ (BOOL)supportsSecureCoding;
+ (id)nameForScanUpdateType:(int64_t)a3;
- (BOOL)allowSameVersion;
- (BOOL)allowsCellular;
- (BOOL)disableUI;
- (BOOL)discretionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)liveServerCatalogOnly;
- (BOOL)requiresPowerPluggedIn;
- (BOOL)restrictToFull;
- (BOOL)restrictToIncremental;
- (BOOL)shouldScanForMajorUpdates;
- (BOOL)shouldScanForMinorUpdates;
- (NSDictionary)additionalOptions;
- (NSDictionary)additionalServerParams;
- (NSString)rampingScanType;
- (NSString)sessionId;
- (SUCorePolicySoftwareUpdateScan)init;
- (SUCorePolicySoftwareUpdateScan)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int)downloadTimeoutSecs;
- (int64_t)scanUpdateType;
- (int64_t)specifiedFields;
- (void)backToDefaults;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setAdditionalServerParams:(id)a3;
- (void)setAllowSameVersion:(BOOL)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setDisableUI:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadTimeoutSecs:(int)a3;
- (void)setLiveServerCatalogOnly:(BOOL)a3;
- (void)setRampingScanType:(id)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setRestrictToFull:(BOOL)a3;
- (void)setRestrictToIncremental:(BOOL)a3;
- (void)setScanUpdateType:(int64_t)a3;
- (void)setSessionId:(id)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicySoftwareUpdateScan

- (SUCorePolicySoftwareUpdateScan)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUCorePolicySoftwareUpdateScan;
  v2 = [(SUCorePolicySoftwareUpdateScan *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SUCorePolicySoftwareUpdateScan *)v2 backToDefaults];
  }
  return v3;
}

- (void)backToDefaults
{
  self->_specifiedFields = 0;
  *(_DWORD *)&self->_allowsCellular = 0;
  *(_DWORD *)&self->_requiresPowerPluggedIn = 0;
  self->_downloadTimeoutSecs = 120;
  v3 = (NSString *)[[NSString alloc] initWithString:@"Foreground"];
  rampingScanType = self->_rampingScanType;
  self->_rampingScanType = v3;

  sessionId = self->_sessionId;
  self->_sessionId = 0;

  additionalServerParams = self->_additionalServerParams;
  self->_scanUpdateType = 0;
  self->_additionalServerParams = 0;
  self->_liveServerCatalogOnly = 0;

  additionalOptions = self->_additionalOptions;
  self->_additionalOptions = 0;
}

- (void)setAllowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
  self->_specifiedFields |= 2uLL;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
  self->_specifiedFields |= 4uLL;
}

- (void)setDisableUI:(BOOL)a3
{
  self->_disableUI = a3;
  self->_specifiedFields |= 0x1000uLL;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
  self->_specifiedFields |= 8uLL;
}

- (void)setRestrictToIncremental:(BOOL)a3
{
  self->_restrictToIncremental = a3;
  self->_specifiedFields |= 0x10uLL;
}

- (void)setRestrictToFull:(BOOL)a3
{
  self->_restrictToFull = a3;
  self->_specifiedFields |= 0x20uLL;
}

- (void)setAllowSameVersion:(BOOL)a3
{
  self->_allowSameVersion = a3;
  self->_specifiedFields |= 0x40uLL;
}

- (void)setDownloadTimeoutSecs:(int)a3
{
  self->_downloadTimeoutSecs = a3;
  self->_specifiedFields |= 0x80uLL;
}

- (void)setSessionId:(id)a3
{
  self->_specifiedFields |= 0x100uLL;
}

- (void)setRampingScanType:(id)a3
{
  uint64_t v4 = [a3 compare:@"Background" options:1];
  id v5 = [NSString alloc];
  if (v4) {
    v6 = @"Foreground";
  }
  else {
    v6 = @"Background";
  }
  v7 = (NSString *)[v5 initWithString:v6];
  rampingScanType = self->_rampingScanType;
  self->_rampingScanType = v7;

  self->_specifiedFields |= 0x200uLL;
}

- (void)setScanUpdateType:(int64_t)a3
{
  self->_scanUpdateType = a3;
  self->_specifiedFields |= 0x400uLL;
}

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_liveServerCatalogOnly = a3;
  self->_specifiedFields |= 0x800uLL;
}

- (BOOL)shouldScanForMajorUpdates
{
  if ([(SUCorePolicySoftwareUpdateScan *)self scanUpdateType])
  {
    int64_t v3 = [(SUCorePolicySoftwareUpdateScan *)self scanUpdateType];
    if (v3 != 1) {
      LOBYTE(v3) = [(SUCorePolicySoftwareUpdateScan *)self scanUpdateType] == 2;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)shouldScanForMinorUpdates
{
  if ([(SUCorePolicySoftwareUpdateScan *)self scanUpdateType])
  {
    int64_t v3 = [(SUCorePolicySoftwareUpdateScan *)self scanUpdateType];
    if (v3 != 1) {
      LOBYTE(v3) = [(SUCorePolicySoftwareUpdateScan *)self scanUpdateType] == 3;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicySoftwareUpdateScan)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUCorePolicySoftwareUpdateScan;
  id v5 = [(SUCorePolicySoftwareUpdateScan *)&v13 init];
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_allowsCellular = [v4 decodeBoolForKey:@"AllowsCellular"];
    v5->_discretionary = [v4 decodeBoolForKey:@"Discretionary"];
    v5->_disableUI = [v4 decodeBoolForKey:@"DisableUI"];
    v5->_requiresPowerPluggedIn = [v4 decodeBoolForKey:@"RequiresPowerPluggedIn"];
    v5->_restrictToIncremental = [v4 decodeBoolForKey:@"RestrictToIncremental"];
    v5->_restrictToFull = [v4 decodeBoolForKey:@"RestrictToFull"];
    v5->_allowSameVersion = [v4 decodeBoolForKey:@"AllowSameVersion"];
    v5->_downloadTimeoutSecs = [v4 decodeIntForKey:@"DownloadTimeoutSecs"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SessionID"];
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RampingScanType"];
    rampingScanType = v5->_rampingScanType;
    v5->_rampingScanType = (NSString *)v8;

    v5->_scanUpdateType = [v4 decodeInt64ForKey:@"ScanUpdateType"];
    v5->_liveServerCatalogOnly = [v4 decodeBoolForKey:@"LiveServerCatalogOnly"];
    additionalServerParams = v5->_additionalServerParams;
    v5->_additionalServerParams = 0;

    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", -[SUCorePolicySoftwareUpdateScan specifiedFields](self, "specifiedFields"), @"SpecifiedFields");
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan allowsCellular](self, "allowsCellular"), @"AllowsCellular");
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan discretionary](self, "discretionary"), @"Discretionary");
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan disableUI](self, "disableUI"), @"DisableUI");
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"), @"RequiresPowerPluggedIn");
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan restrictToIncremental](self, "restrictToIncremental"), @"RestrictToIncremental");
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan restrictToFull](self, "restrictToFull"), @"RestrictToFull");
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan allowSameVersion](self, "allowSameVersion"), @"AllowSameVersion");
  objc_msgSend(v6, "encodeInt:forKey:", -[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](self, "downloadTimeoutSecs"), @"DownloadTimeoutSecs");
  id v4 = [(SUCorePolicySoftwareUpdateScan *)self sessionId];
  [v6 encodeObject:v4 forKey:@"SessionID"];

  id v5 = [(SUCorePolicySoftwareUpdateScan *)self rampingScanType];
  [v6 encodeObject:v5 forKey:@"RampingScanType"];

  objc_msgSend(v6, "encodeInt64:forKey:", -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"), @"ScanUpdateType");
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan liveServerCatalogOnly](self, "liveServerCatalogOnly"), @"LiveServerCatalogOnly");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicySoftwareUpdateScan allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicySoftwareUpdateScan discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicySoftwareUpdateScan disableUI](self, "disableUI"));
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", -[SUCorePolicySoftwareUpdateScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setRestrictToIncremental:", -[SUCorePolicySoftwareUpdateScan restrictToIncremental](self, "restrictToIncremental"));
  objc_msgSend(v5, "setRestrictToFull:", -[SUCorePolicySoftwareUpdateScan restrictToFull](self, "restrictToFull"));
  objc_msgSend(v5, "setAllowSameVersion:", -[SUCorePolicySoftwareUpdateScan allowSameVersion](self, "allowSameVersion"));
  objc_msgSend(v5, "setDownloadTimeoutSecs:", -[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  id v6 = [(SUCorePolicySoftwareUpdateScan *)self sessionId];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setSessionId:v7];

  uint64_t v8 = [(SUCorePolicySoftwareUpdateScan *)self rampingScanType];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setRampingScanType:v9];

  objc_msgSend(v5, "setScanUpdateType:", -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"));
  objc_msgSend(v5, "setLiveServerCatalogOnly:", -[SUCorePolicySoftwareUpdateScan liveServerCatalogOnly](self, "liveServerCatalogOnly"));
  v10 = [(SUCorePolicySoftwareUpdateScan *)self additionalServerParams];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setAdditionalServerParams:v11];

  v12 = [(SUCorePolicySoftwareUpdateScan *)self additionalOptions];
  objc_super v13 = (void *)[v12 copyWithZone:a3];
  [v5 setAdditionalOptions:v13];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicySoftwareUpdateScan specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicySoftwareUpdateScan *)a3;
  if (v4 == self)
  {
    BOOL v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = [(SUCorePolicySoftwareUpdateScan *)v5 allowsCellular];
      if (v6 == [(SUCorePolicySoftwareUpdateScan *)self allowsCellular]
        && (BOOL v7 = [(SUCorePolicySoftwareUpdateScan *)v5 discretionary],
            v7 == [(SUCorePolicySoftwareUpdateScan *)self discretionary])
        && (BOOL v8 = [(SUCorePolicySoftwareUpdateScan *)v5 disableUI],
            v8 == [(SUCorePolicySoftwareUpdateScan *)self disableUI])
        && (BOOL v9 = [(SUCorePolicySoftwareUpdateScan *)v5 requiresPowerPluggedIn],
            v9 == [(SUCorePolicySoftwareUpdateScan *)self requiresPowerPluggedIn])
        && (BOOL v10 = [(SUCorePolicySoftwareUpdateScan *)v5 restrictToIncremental],
            v10 == [(SUCorePolicySoftwareUpdateScan *)self restrictToIncremental])
        && (BOOL v11 = [(SUCorePolicySoftwareUpdateScan *)v5 restrictToFull],
            v11 == [(SUCorePolicySoftwareUpdateScan *)self restrictToFull])
        && (BOOL v12 = [(SUCorePolicySoftwareUpdateScan *)v5 allowSameVersion],
            v12 == [(SUCorePolicySoftwareUpdateScan *)self allowSameVersion])
        && (int v13 = [(SUCorePolicySoftwareUpdateScan *)v5 downloadTimeoutSecs],
            v13 == [(SUCorePolicySoftwareUpdateScan *)self downloadTimeoutSecs]))
      {
        v14 = (void *)MEMORY[0x263F77D78];
        v15 = [(SUCorePolicySoftwareUpdateScan *)v5 sessionId];
        v16 = [(SUCorePolicySoftwareUpdateScan *)self sessionId];
        if ([v14 stringIsEqual:v15 to:v16])
        {
          v17 = (void *)MEMORY[0x263F77D78];
          v18 = [(SUCorePolicySoftwareUpdateScan *)v5 rampingScanType];
          v19 = [(SUCorePolicySoftwareUpdateScan *)self rampingScanType];
          if ([v17 stringIsEqual:v18 to:v19]
            && (uint64_t v20 = [(SUCorePolicySoftwareUpdateScan *)v5 scanUpdateType],
                v20 == [(SUCorePolicySoftwareUpdateScan *)self scanUpdateType])
            && (BOOL v21 = [(SUCorePolicySoftwareUpdateScan *)v5 liveServerCatalogOnly],
                v21 == [(SUCorePolicySoftwareUpdateScan *)self liveServerCatalogOnly]))
          {
            uint64_t v24 = [(SUCorePolicySoftwareUpdateScan *)v5 specifiedFields];
            BOOL v22 = v24 == [(SUCorePolicySoftwareUpdateScan *)self specifiedFields];
          }
          else
          {
            BOOL v22 = 0;
          }
        }
        else
        {
          BOOL v22 = 0;
        }
      }
      else
      {
        BOOL v22 = 0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

- (id)description
{
  id v38 = [NSString alloc];
  int64_t v37 = [(SUCorePolicySoftwareUpdateScan *)self specifiedFields];
  if ([(SUCorePolicySoftwareUpdateScan *)self allowsCellular]) {
    int64_t v3 = @"YES";
  }
  else {
    int64_t v3 = @"NO";
  }
  v36 = v3;
  if ([(SUCorePolicySoftwareUpdateScan *)self discretionary]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v35 = v4;
  if ([(SUCorePolicySoftwareUpdateScan *)self disableUI]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  v34 = v5;
  if ([(SUCorePolicySoftwareUpdateScan *)self requiresPowerPluggedIn]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  v33 = v6;
  if ([(SUCorePolicySoftwareUpdateScan *)self restrictToIncremental]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  v31 = v7;
  if ([(SUCorePolicySoftwareUpdateScan *)self restrictToFull]) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  v30 = v8;
  if ([(SUCorePolicySoftwareUpdateScan *)self allowSameVersion]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  v29 = v9;
  uint64_t v28 = [(SUCorePolicySoftwareUpdateScan *)self downloadTimeoutSecs];
  BOOL v10 = [(SUCorePolicySoftwareUpdateScan *)self sessionId];
  if (v10)
  {
    BOOL v11 = [(SUCorePolicySoftwareUpdateScan *)self sessionId];
  }
  else
  {
    BOOL v11 = @"none";
  }
  BOOL v12 = [(SUCorePolicySoftwareUpdateScan *)self rampingScanType];
  v32 = v11;
  if (v12)
  {
    int v13 = [(SUCorePolicySoftwareUpdateScan *)self rampingScanType];
  }
  else
  {
    int v13 = @"none";
  }
  v14 = +[SUCorePolicySoftwareUpdateScan nameForScanUpdateType:[(SUCorePolicySoftwareUpdateScan *)self scanUpdateType]];
  if ([(SUCorePolicySoftwareUpdateScan *)self liveServerCatalogOnly]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  v16 = [(SUCorePolicySoftwareUpdateScan *)self additionalServerParams];
  if (v16)
  {
    v17 = [(SUCorePolicySoftwareUpdateScan *)self additionalServerParams];
  }
  else
  {
    v17 = @"none";
  }
  v18 = [(SUCorePolicySoftwareUpdateScan *)self additionalOptions];
  if (v18)
  {
    v19 = [(SUCorePolicySoftwareUpdateScan *)self additionalOptions];
    v26 = v15;
    uint64_t v20 = v13;
    uint64_t v24 = v13;
    BOOL v21 = v32;
    BOOL v22 = (void *)[v38 initWithFormat:@"SUCorePolicySoftwareUpdateScan(\n        specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|UIDisabled:%@|requiresPowerPluggedIn:%@|\n        restrictToIncremental:%@|restrictToFull:%@|allowSameVersion:%@|\n        downloadTimeoutSecs:%d|sessionId:%@|rampingScanType:%@|scanUpdateType:%@|liveServerCatalogOnly:%@|\n        additionalServerParams:%@|\n        additionalOptions:%@)", v37, v36, v35, v34, v33, v31, v30, v29, v28, v32, v24, v14, v26, v17, v19];
  }
  else
  {
    v27 = v15;
    uint64_t v20 = v13;
    v25 = v13;
    BOOL v21 = v32;
    BOOL v22 = (void *)[v38 initWithFormat:@"SUCorePolicySoftwareUpdateScan(\n        specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|UIDisabled:%@|requiresPowerPluggedIn:%@|\n        restrictToIncremental:%@|restrictToFull:%@|allowSameVersion:%@|\n        downloadTimeoutSecs:%d|sessionId:%@|rampingScanType:%@|scanUpdateType:%@|liveServerCatalogOnly:%@|\n        additionalServerParams:%@|\n        additionalOptions:%@)", v37, v36, v35, v34, v33, v31, v30, v29, v28, v32, v25, v14, v27, v17, @"none"];
  }

  if (v16) {
  if (v12)
  }

  if (v10) {

  }
  return v22;
}

- (id)summary
{
  if ([(SUCorePolicySoftwareUpdateScan *)self specifiedFields])
  {
    int64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"|fields=%llX", -[SUCorePolicySoftwareUpdateScan specifiedFields](self, "specifiedFields"));
    id v4 = [&stru_26C1810A0 stringByAppendingString:v3];
  }
  else
  {
    id v4 = &stru_26C1810A0;
  }
  if ([(SUCorePolicySoftwareUpdateScan *)self allowsCellular])
  {
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"|cellular"];

    id v4 = (__CFString *)v5;
  }
  if ([(SUCorePolicySoftwareUpdateScan *)self discretionary]) {
    BOOL v6 = @"|discretionary";
  }
  else {
    BOOL v6 = @"|non-discretionary";
  }
  BOOL v7 = [(__CFString *)v4 stringByAppendingString:v6];

  if ([(SUCorePolicySoftwareUpdateScan *)self disableUI]) {
    BOOL v8 = @"|UIDisabled";
  }
  else {
    BOOL v8 = @"|UIEnabled";
  }
  BOOL v9 = [v7 stringByAppendingString:v8];

  if ([(SUCorePolicySoftwareUpdateScan *)self requiresPowerPluggedIn])
  {
    uint64_t v10 = [v9 stringByAppendingString:@"|power"];

    BOOL v9 = (void *)v10;
  }
  if ([(SUCorePolicySoftwareUpdateScan *)self restrictToIncremental])
  {
    uint64_t v11 = [v9 stringByAppendingString:@"|restrictIncr"];

    BOOL v9 = (void *)v11;
  }
  if ([(SUCorePolicySoftwareUpdateScan *)self restrictToFull])
  {
    uint64_t v12 = [v9 stringByAppendingString:@"|restrictFull"];

    BOOL v9 = (void *)v12;
  }
  if ([(SUCorePolicySoftwareUpdateScan *)self allowSameVersion])
  {
    uint64_t v13 = [v9 stringByAppendingString:@"|allowSame"];

    BOOL v9 = (void *)v13;
  }
  if ([(SUCorePolicySoftwareUpdateScan *)self downloadTimeoutSecs] != 120)
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"|catalogTimeout=%d", -[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
    uint64_t v15 = [v9 stringByAppendingString:v14];

    BOOL v9 = (void *)v15;
  }
  v16 = [(SUCorePolicySoftwareUpdateScan *)self sessionId];

  if (v16)
  {
    id v17 = [NSString alloc];
    v18 = [(SUCorePolicySoftwareUpdateScan *)self sessionId];
    v19 = (void *)[v17 initWithFormat:@"|sesionID=%@", v18];
    uint64_t v20 = [v9 stringByAppendingString:v19];

    BOOL v9 = (void *)v20;
  }
  BOOL v21 = [(SUCorePolicySoftwareUpdateScan *)self rampingScanType];

  if (v21)
  {
    id v22 = [NSString alloc];
    v23 = [(SUCorePolicySoftwareUpdateScan *)self rampingScanType];
    uint64_t v24 = (void *)[v22 initWithFormat:@"|rampScan=%@", v23];
    uint64_t v25 = [v9 stringByAppendingString:v24];

    BOOL v9 = (void *)v25;
  }
  if ([(SUCorePolicySoftwareUpdateScan *)self scanUpdateType])
  {
    id v26 = [NSString alloc];
    v27 = +[SUCorePolicySoftwareUpdateScan nameForScanUpdateType:[(SUCorePolicySoftwareUpdateScan *)self scanUpdateType]];
    uint64_t v28 = (void *)[v26 initWithFormat:@"|scanUpdateType=%@", v27];
    uint64_t v29 = [v9 stringByAppendingString:v28];

    BOOL v9 = (void *)v29;
  }
  if ([(SUCorePolicySoftwareUpdateScan *)self liveServerCatalogOnly])
  {
    uint64_t v30 = [v9 stringByAppendingString:@"|liveServerCatalogOnly"];

    BOOL v9 = (void *)v30;
  }
  v31 = [(SUCorePolicySoftwareUpdateScan *)self additionalServerParams];
  if (v31) {
    v32 = @"|withServerParams";
  }
  else {
    v32 = @"|noServerParams";
  }
  v33 = [v9 stringByAppendingString:v32];

  v34 = [(SUCorePolicySoftwareUpdateScan *)self additionalOptions];
  if (v34) {
    v35 = @"|withAdditionalOptions";
  }
  else {
    v35 = @"|noAdditionalOptions";
  }
  v36 = [v33 stringByAppendingString:v35];

  if (([v36 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v37 = [v36 stringByAppendingString:@"|"];

    v36 = (void *)v37;
  }

  return v36;
}

+ (id)nameForScanUpdateType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_2640DD028[a3];
  }
}

- (int64_t)specifiedFields
{
  return self->_specifiedFields;
}

- (void)setSpecifiedFields:(int64_t)a3
{
  self->_specifiedFields = a3;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (BOOL)disableUI
{
  return self->_disableUI;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (BOOL)restrictToIncremental
{
  return self->_restrictToIncremental;
}

- (BOOL)restrictToFull
{
  return self->_restrictToFull;
}

- (BOOL)allowSameVersion
{
  return self->_allowSameVersion;
}

- (int)downloadTimeoutSecs
{
  return self->_downloadTimeoutSecs;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (NSString)rampingScanType
{
  return self->_rampingScanType;
}

- (int64_t)scanUpdateType
{
  return self->_scanUpdateType;
}

- (BOOL)liveServerCatalogOnly
{
  return self->_liveServerCatalogOnly;
}

- (NSDictionary)additionalServerParams
{
  return self->_additionalServerParams;
}

- (void)setAdditionalServerParams:(id)a3
{
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptions, 0);
  objc_storeStrong((id *)&self->_additionalServerParams, 0);
  objc_storeStrong((id *)&self->_rampingScanType, 0);

  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end