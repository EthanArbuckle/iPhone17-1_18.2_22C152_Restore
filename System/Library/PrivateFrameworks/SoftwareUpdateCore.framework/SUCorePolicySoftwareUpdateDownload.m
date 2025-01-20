@interface SUCorePolicySoftwareUpdateDownload
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellular;
- (BOOL)disableUI;
- (BOOL)discretionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresInexpensiveAccess;
- (BOOL)requiresPowerPluggedIn;
- (BOOL)skipPhase;
- (NSDictionary)additionalOptions;
- (NSDictionary)basePreflightOptions;
- (SUCorePolicySoftwareUpdateDownload)initWithCoder:(id)a3;
- (SUCorePolicySoftwareUpdateDownload)initWithSkipPhaseSet:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int)downloadTimeoutSecs;
- (int64_t)specifiedFields;
- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setBasePreflightOptions:(id)a3;
- (void)setDisableUI:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadTimeoutSecs:(int)a3;
- (void)setRequiresInexpensiveAccess:(BOOL)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setSkipPhase:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicySoftwareUpdateDownload

- (SUCorePolicySoftwareUpdateDownload)initWithSkipPhaseSet:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicySoftwareUpdateDownload;
  v4 = [(SUCorePolicySoftwareUpdateDownload *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SUCorePolicySoftwareUpdateDownload *)v4 backToDefaultsWithSkipPhaseSet:v3];
  }
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  self->_specifiedFields = 0;
  *(_WORD *)&self->_allowsCellular = 0;
  self->_disableUI = 0;
  *(_WORD *)&self->_requiresPowerPluggedIn = 0;
  self->_downloadTimeoutSecs = 120;
  self->_skipPhase = a3;
  self->_additionalOptions = 0;
  MEMORY[0x270F9A758]();
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
  self->_specifiedFields |= 0x80uLL;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
  self->_specifiedFields |= 0x10uLL;
}

- (void)setDownloadTimeoutSecs:(int)a3
{
  self->_downloadTimeoutSecs = a3;
  self->_specifiedFields |= 0x20uLL;
}

- (void)setRequiresInexpensiveAccess:(BOOL)a3
{
  self->_requiresInexpensiveAccess = a3;
  self->_specifiedFields |= 0x40uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicySoftwareUpdateDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicySoftwareUpdateDownload;
  v5 = [(SUCorePolicySoftwareUpdateDownload *)&v8 init];
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_allowsCellular = [v4 decodeBoolForKey:@"AllowsCellular"];
    v5->_discretionary = [v4 decodeBoolForKey:@"Discretionary"];
    v5->_disableUI = [v4 decodeBoolForKey:@"DisableUI"];
    v5->_requiresPowerPluggedIn = [v4 decodeBoolForKey:@"RequiresPowerPluggedIn"];
    v5->_downloadTimeoutSecs = [v4 decodeIntForKey:@"SoftwareUpdateAssetDownloadTimeoutSecs"];
    v5->_requiresInexpensiveAccess = [v4 decodeBoolForKey:@"RequiresInexpensiveAccess"];
    v5->_skipPhase = [v4 decodeBoolForKey:@"SkipPhase"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicySoftwareUpdateDownload specifiedFields](self, "specifiedFields"), @"SpecifiedFields");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload allowsCellular](self, "allowsCellular"), @"AllowsCellular");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload discretionary](self, "discretionary"), @"Discretionary");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload disableUI](self, "disableUI"), @"DisableUI");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"), @"RequiresPowerPluggedIn");
  objc_msgSend(v4, "encodeInt:forKey:", -[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"), @"SoftwareUpdateAssetDownloadTimeoutSecs");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"), @"RequiresInexpensiveAccess");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload skipPhase](self, "skipPhase"), @"SkipPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicySoftwareUpdateDownload allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicySoftwareUpdateDownload discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicySoftwareUpdateDownload disableUI](self, "disableUI"));
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", -[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setDownloadTimeoutSecs:", -[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  v6 = [(SUCorePolicySoftwareUpdateDownload *)self additionalOptions];
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setAdditionalOptions:v7];

  objc_msgSend(v5, "setRequiresInexpensiveAccess:", -[SUCorePolicySoftwareUpdateDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"));
  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicySoftwareUpdateDownload specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicySoftwareUpdateDownload *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(SUCorePolicySoftwareUpdateDownload *)v5 allowsCellular];
      if (v6 == [(SUCorePolicySoftwareUpdateDownload *)self allowsCellular]
        && (BOOL v7 = [(SUCorePolicySoftwareUpdateDownload *)v5 discretionary],
            v7 == [(SUCorePolicySoftwareUpdateDownload *)self discretionary])
        && (BOOL v8 = [(SUCorePolicySoftwareUpdateDownload *)v5 disableUI],
            v8 == [(SUCorePolicySoftwareUpdateDownload *)self disableUI])
        && (BOOL v9 = [(SUCorePolicySoftwareUpdateDownload *)v5 skipPhase],
            v9 == [(SUCorePolicySoftwareUpdateDownload *)self skipPhase])
        && (BOOL v10 = [(SUCorePolicySoftwareUpdateDownload *)v5 requiresPowerPluggedIn],
            v10 == [(SUCorePolicySoftwareUpdateDownload *)self requiresPowerPluggedIn])
        && (int v11 = [(SUCorePolicySoftwareUpdateDownload *)v5 downloadTimeoutSecs],
            v11 == [(SUCorePolicySoftwareUpdateDownload *)self downloadTimeoutSecs])
        && (BOOL v12 = [(SUCorePolicySoftwareUpdateDownload *)v5 requiresInexpensiveAccess],
            v12 == [(SUCorePolicySoftwareUpdateDownload *)self requiresInexpensiveAccess]))
      {
        uint64_t v15 = [(SUCorePolicySoftwareUpdateDownload *)v5 specifiedFields];
        BOOL v13 = v15 == [(SUCorePolicySoftwareUpdateDownload *)self specifiedFields];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  uint64_t v15 = NSString;
  int64_t v3 = [(SUCorePolicySoftwareUpdateDownload *)self specifiedFields];
  id v4 = @"NO";
  if ([(SUCorePolicySoftwareUpdateDownload *)self skipPhase]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if ([(SUCorePolicySoftwareUpdateDownload *)self allowsCellular]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  if ([(SUCorePolicySoftwareUpdateDownload *)self discretionary]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  if ([(SUCorePolicySoftwareUpdateDownload *)self disableUI]) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  if ([(SUCorePolicySoftwareUpdateDownload *)self requiresPowerPluggedIn]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  uint64_t v10 = [(SUCorePolicySoftwareUpdateDownload *)self downloadTimeoutSecs];
  if ([(SUCorePolicySoftwareUpdateDownload *)self requiresInexpensiveAccess]) {
    id v4 = @"YES";
  }
  int v11 = [(SUCorePolicySoftwareUpdateDownload *)self additionalOptions];
  if (v11)
  {
    BOOL v12 = [(SUCorePolicySoftwareUpdateDownload *)self additionalOptions];
    BOOL v13 = [v15 stringWithFormat:@"SUCorePolicySoftwareUpdateDownload(specifiedFields:0x%llX|skipPhase:%@|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|requiresInexpensiveAccess:%@|additionalOptions:%@)", v3, v5, v6, v7, v8, v9, v10, v4, v12];
  }
  else
  {
    BOOL v13 = [v15 stringWithFormat:@"SUCorePolicySoftwareUpdateDownload(specifiedFields:0x%llX|skipPhase:%@|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|requiresInexpensiveAccess:%@|additionalOptions:%@)", v3, v5, v6, v7, v8, v9, v10, v4, @"none"];
  }

  return v13;
}

- (id)summary
{
  if ([(SUCorePolicySoftwareUpdateDownload *)self specifiedFields])
  {
    int64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"|fields=%llX", -[SUCorePolicySoftwareUpdateDownload specifiedFields](self, "specifiedFields"));
    id v4 = [&stru_26C1810A0 stringByAppendingString:v3];
  }
  else
  {
    id v4 = &stru_26C1810A0;
  }
  if ([(SUCorePolicySoftwareUpdateDownload *)self allowsCellular])
  {
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"|cellular"];

    id v4 = (__CFString *)v5;
  }
  if ([(SUCorePolicySoftwareUpdateDownload *)self discretionary]) {
    BOOL v6 = @"|discretionary";
  }
  else {
    BOOL v6 = @"|non-discretionary";
  }
  BOOL v7 = [(__CFString *)v4 stringByAppendingString:v6];

  if ([(SUCorePolicySoftwareUpdateDownload *)self disableUI]) {
    BOOL v8 = @"UIDisabled";
  }
  else {
    BOOL v8 = @"UIEnabled";
  }
  BOOL v9 = [v7 stringByAppendingString:v8];

  if ([(SUCorePolicySoftwareUpdateDownload *)self skipPhase])
  {
    uint64_t v10 = [v9 stringByAppendingString:@"|skipPhase"];

    BOOL v9 = (void *)v10;
  }
  if ([(SUCorePolicySoftwareUpdateDownload *)self requiresPowerPluggedIn])
  {
    uint64_t v11 = [v9 stringByAppendingString:@"|power"];

    BOOL v9 = (void *)v11;
  }
  if ([(SUCorePolicySoftwareUpdateDownload *)self downloadTimeoutSecs] != 120)
  {
    BOOL v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"|suTimeout=%d", -[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"));
    uint64_t v13 = [v9 stringByAppendingString:v12];

    BOOL v9 = (void *)v13;
  }
  if ([(SUCorePolicySoftwareUpdateDownload *)self requiresInexpensiveAccess])
  {
    uint64_t v14 = [v9 stringByAppendingString:@"|cheapAccess"];

    BOOL v9 = (void *)v14;
  }
  uint64_t v15 = [(SUCorePolicySoftwareUpdateDownload *)self additionalOptions];
  if (v15) {
    v16 = @"|withAdditionalOptions";
  }
  else {
    v16 = @"|noAdditionalOptions";
  }
  v17 = [v9 stringByAppendingString:v16];

  if (([v17 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v18 = [v17 stringByAppendingString:@"|"];

    v17 = (void *)v18;
  }

  return v17;
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

- (BOOL)skipPhase
{
  return self->_skipPhase;
}

- (void)setSkipPhase:(BOOL)a3
{
  self->_skipPhase = a3;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (int)downloadTimeoutSecs
{
  return self->_downloadTimeoutSecs;
}

- (BOOL)requiresInexpensiveAccess
{
  return self->_requiresInexpensiveAccess;
}

- (NSDictionary)basePreflightOptions
{
  return self->_basePreflightOptions;
}

- (void)setBasePreflightOptions:(id)a3
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

  objc_storeStrong((id *)&self->_basePreflightOptions, 0);
}

@end