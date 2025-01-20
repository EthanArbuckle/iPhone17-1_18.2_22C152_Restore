@interface SUCorePolicyDocumentationScan
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellular;
- (BOOL)disableUI;
- (BOOL)discretionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)liveServerCatalogOnly;
- (BOOL)requiresPowerPluggedIn;
- (NSDictionary)additionalOptions;
- (NSDictionary)additionalServerParams;
- (SUCorePolicyDocumentationScan)init;
- (SUCorePolicyDocumentationScan)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int)downloadTimeoutSecs;
- (int64_t)specifiedFields;
- (void)backToDefaults;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setAdditionalServerParams:(id)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setDisableUI:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadTimeoutSecs:(int)a3;
- (void)setLiveServerCatalogOnly:(BOOL)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicyDocumentationScan

- (SUCorePolicyDocumentationScan)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUCorePolicyDocumentationScan;
  v2 = [(SUCorePolicyDocumentationScan *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SUCorePolicyDocumentationScan *)v2 backToDefaults];
  }
  return v3;
}

- (void)backToDefaults
{
  additionalServerParams = self->_additionalServerParams;
  self->_specifiedFields = 0;
  self->_additionalServerParams = 0;
  *(_DWORD *)&self->_allowsCellular = 0;
  self->_downloadTimeoutSecs = 120;
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
  self->_specifiedFields |= 0x40uLL;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
  self->_specifiedFields |= 8uLL;
}

- (void)setDownloadTimeoutSecs:(int)a3
{
  self->_downloadTimeoutSecs = a3;
  self->_specifiedFields |= 0x10uLL;
}

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_liveServerCatalogOnly = a3;
  self->_specifiedFields |= 0x20uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyDocumentationScan)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyDocumentationScan;
  objc_super v5 = [(SUCorePolicyDocumentationScan *)&v9 init];
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_allowsCellular = [v4 decodeBoolForKey:@"AllowsCellular"];
    v5->_discretionary = [v4 decodeBoolForKey:@"Discretionary"];
    v5->_disableUI = [v4 decodeBoolForKey:@"DisableUI"];
    v5->_requiresPowerPluggedIn = [v4 decodeBoolForKey:@"RequiresPowerPluggedIn"];
    v5->_downloadTimeoutSecs = [v4 decodeIntForKey:@"DownloadTimeoutSecs"];
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
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"), @"SpecifiedFields");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular"), @"AllowsCellular");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan discretionary](self, "discretionary"), @"Discretionary");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan disableUI](self, "disableUI"), @"DisableUI");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"), @"RequiresPowerPluggedIn");
  objc_msgSend(v4, "encodeInt:forKey:", -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"), @"DownloadTimeoutSecs");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly"), @"LiveServerCatalogOnly");
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicyDocumentationScan discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicyDocumentationScan disableUI](self, "disableUI"));
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setDownloadTimeoutSecs:", -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  objc_msgSend(v5, "setLiveServerCatalogOnly:", -[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly"));
  v6 = [(SUCorePolicyDocumentationScan *)self additionalServerParams];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setAdditionalServerParams:v7];

  v8 = [(SUCorePolicyDocumentationScan *)self additionalOptions];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyDocumentationScan *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      BOOL v6 = [(SUCorePolicyDocumentationScan *)v5 allowsCellular];
      if (v6 == [(SUCorePolicyDocumentationScan *)self allowsCellular]
        && (BOOL v7 = [(SUCorePolicyDocumentationScan *)v5 discretionary],
            v7 == [(SUCorePolicyDocumentationScan *)self discretionary])
        && (BOOL v8 = [(SUCorePolicyDocumentationScan *)v5 disableUI],
            v8 == [(SUCorePolicyDocumentationScan *)self disableUI])
        && (BOOL v9 = [(SUCorePolicyDocumentationScan *)v5 requiresPowerPluggedIn],
            v9 == [(SUCorePolicyDocumentationScan *)self requiresPowerPluggedIn])
        && (int v10 = [(SUCorePolicyDocumentationScan *)v5 downloadTimeoutSecs],
            v10 == [(SUCorePolicyDocumentationScan *)self downloadTimeoutSecs])
        && (BOOL v11 = [(SUCorePolicyDocumentationScan *)v5 liveServerCatalogOnly],
            v11 == [(SUCorePolicyDocumentationScan *)self liveServerCatalogOnly]))
      {
        uint64_t v14 = [(SUCorePolicyDocumentationScan *)v5 specifiedFields];
        BOOL v12 = v14 == [(SUCorePolicyDocumentationScan *)self specifiedFields];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  v17 = NSString;
  int64_t v16 = [(SUCorePolicyDocumentationScan *)self specifiedFields];
  v3 = @"NO";
  if ([(SUCorePolicyDocumentationScan *)self allowsCellular]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v15 = v4;
  if ([(SUCorePolicyDocumentationScan *)self discretionary]) {
    objc_super v5 = @"YES";
  }
  else {
    objc_super v5 = @"NO";
  }
  if ([(SUCorePolicyDocumentationScan *)self disableUI]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  if ([(SUCorePolicyDocumentationScan *)self requiresPowerPluggedIn]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  uint64_t v8 = [(SUCorePolicyDocumentationScan *)self downloadTimeoutSecs];
  if ([(SUCorePolicyDocumentationScan *)self liveServerCatalogOnly]) {
    v3 = @"YES";
  }
  BOOL v9 = [(SUCorePolicyDocumentationScan *)self additionalServerParams];
  int v10 = @"none";
  if (v9)
  {
    int v10 = [(SUCorePolicyDocumentationScan *)self additionalServerParams];
  }
  BOOL v11 = [(SUCorePolicyDocumentationScan *)self additionalOptions];
  if (v11)
  {
    BOOL v12 = [(SUCorePolicyDocumentationScan *)self additionalOptions];
    v13 = [v17 stringWithFormat:@"SUCorePolicyDocumentationScan(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|liveServerCatalogOnly:%@|additionalServerParams:%@|additionalOptions:%@)", v16, v15, v5, v6, v7, v8, v3, v10, v12];
  }
  else
  {
    v13 = [v17 stringWithFormat:@"SUCorePolicyDocumentationScan(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|liveServerCatalogOnly:%@|additionalServerParams:%@|additionalOptions:%@)", v16, v15, v5, v6, v7, v8, v3, v10, @"none"];
  }

  if (v9) {

  }
  return v13;
}

- (id)summary
{
  if ([(SUCorePolicyDocumentationScan *)self specifiedFields])
  {
    v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"|fields=%llX", -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"));
    id v4 = [&stru_26C1810A0 stringByAppendingString:v3];
  }
  else
  {
    id v4 = &stru_26C1810A0;
  }
  if ([(SUCorePolicyDocumentationScan *)self allowsCellular])
  {
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"|cellular"];

    id v4 = (__CFString *)v5;
  }
  if ([(SUCorePolicyDocumentationScan *)self discretionary]) {
    BOOL v6 = @"|discretionary";
  }
  else {
    BOOL v6 = @"|non-discretionary";
  }
  BOOL v7 = [(__CFString *)v4 stringByAppendingString:v6];

  if ([(SUCorePolicyDocumentationScan *)self disableUI]) {
    uint64_t v8 = @"|UIDisabled";
  }
  else {
    uint64_t v8 = @"|UIEnabled";
  }
  BOOL v9 = [v7 stringByAppendingString:v8];

  if ([(SUCorePolicyDocumentationScan *)self requiresPowerPluggedIn])
  {
    uint64_t v10 = [v9 stringByAppendingString:@"|power"];

    BOOL v9 = (void *)v10;
  }
  if ([(SUCorePolicyDocumentationScan *)self downloadTimeoutSecs] != 120)
  {
    BOOL v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"|catalogTimeout=%d", -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
    uint64_t v12 = [v9 stringByAppendingString:v11];

    BOOL v9 = (void *)v12;
  }
  if ([(SUCorePolicyDocumentationScan *)self liveServerCatalogOnly])
  {
    uint64_t v13 = [v9 stringByAppendingString:@"|liveServerCatalogOnly"];

    BOOL v9 = (void *)v13;
  }
  uint64_t v14 = [(SUCorePolicyDocumentationScan *)self additionalServerParams];
  if (v14) {
    v15 = @"|withAdditionalServerParams";
  }
  else {
    v15 = @"|noAdditionalServerParams";
  }
  int64_t v16 = [v9 stringByAppendingString:v15];

  v17 = [(SUCorePolicyDocumentationScan *)self additionalOptions];
  if (v17) {
    v18 = @"|withAdditionalOptions";
  }
  else {
    v18 = @"|noAdditionalOptions";
  }
  v19 = [v16 stringByAppendingString:v18];

  if (([v19 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v20 = [v19 stringByAppendingString:@"|"];

    v19 = (void *)v20;
  }

  return v19;
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

- (int)downloadTimeoutSecs
{
  return self->_downloadTimeoutSecs;
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
}

@end