@interface SUCorePolicyDocumentationDownload
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellular;
- (BOOL)disableUI;
- (BOOL)discretionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresInexpensiveAccess;
- (BOOL)requiresPowerPluggedIn;
- (NSDictionary)additionalOptions;
- (SUCorePolicyDocumentationDownload)init;
- (SUCorePolicyDocumentationDownload)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int)downloadTimeoutSecs;
- (int64_t)specifiedFields;
- (void)backToDefaults;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setDisableUI:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadTimeoutSecs:(int)a3;
- (void)setRequiresInexpensiveAccess:(BOOL)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicyDocumentationDownload

- (SUCorePolicyDocumentationDownload)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUCorePolicyDocumentationDownload;
  v2 = [(SUCorePolicyDocumentationDownload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SUCorePolicyDocumentationDownload *)v2 backToDefaults];
  }
  return v3;
}

- (void)backToDefaults
{
  self->_specifiedFields = 0;
  self->_additionalOptions = 0;
  *(_DWORD *)&self->_allowsCellular = 0;
  self->_requiresInexpensiveAccess = 0;
  self->_downloadTimeoutSecs = 120;
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

- (void)setRequiresInexpensiveAccess:(BOOL)a3
{
  self->_requiresInexpensiveAccess = a3;
  self->_specifiedFields |= 0x20uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyDocumentationDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicyDocumentationDownload;
  objc_super v5 = [(SUCorePolicyDocumentationDownload *)&v8 init];
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_allowsCellular = [v4 decodeBoolForKey:@"AllowsCellular"];
    v5->_discretionary = [v4 decodeBoolForKey:@"Discretionary"];
    v5->_disableUI = [v4 decodeBoolForKey:@"DisableUI"];
    v5->_requiresPowerPluggedIn = [v4 decodeBoolForKey:@"RequiresPowerPluggedIn"];
    v5->_downloadTimeoutSecs = [v4 decodeIntForKey:@"DownloadTimeoutSecs"];
    v5->_requiresInexpensiveAccess = [v4 decodeBoolForKey:@"RequiresInexpensiveAccess"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicyDocumentationDownload specifiedFields](self, "specifiedFields"), @"SpecifiedFields");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload allowsCellular](self, "allowsCellular"), @"AllowsCellular");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload discretionary](self, "discretionary"), @"Discretionary");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload disableUI](self, "disableUI"), @"DisableUI");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"), @"RequiresPowerPluggedIn");
  objc_msgSend(v4, "encodeInt:forKey:", -[SUCorePolicyDocumentationDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"), @"DownloadTimeoutSecs");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"), @"RequiresInexpensiveAccess");
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicyDocumentationDownload allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicyDocumentationDownload discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicyDocumentationDownload disableUI](self, "disableUI"));
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", -[SUCorePolicyDocumentationDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setDownloadTimeoutSecs:", -[SUCorePolicyDocumentationDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  v6 = [(SUCorePolicyDocumentationDownload *)self additionalOptions];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setAdditionalOptions:v7];

  objc_msgSend(v5, "setRequiresInexpensiveAccess:", -[SUCorePolicyDocumentationDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"));
  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyDocumentationDownload specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyDocumentationDownload *)a3;
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
      BOOL v6 = [(SUCorePolicyDocumentationDownload *)v5 allowsCellular];
      if (v6 == [(SUCorePolicyDocumentationDownload *)self allowsCellular]
        && (BOOL v7 = [(SUCorePolicyDocumentationDownload *)v5 discretionary],
            v7 == [(SUCorePolicyDocumentationDownload *)self discretionary])
        && (BOOL v8 = [(SUCorePolicyDocumentationDownload *)v5 disableUI],
            v8 == [(SUCorePolicyDocumentationDownload *)self disableUI])
        && (BOOL v9 = [(SUCorePolicyDocumentationDownload *)v5 requiresPowerPluggedIn],
            v9 == [(SUCorePolicyDocumentationDownload *)self requiresPowerPluggedIn])
        && (int v10 = [(SUCorePolicyDocumentationDownload *)v5 downloadTimeoutSecs],
            v10 == [(SUCorePolicyDocumentationDownload *)self downloadTimeoutSecs])
        && (BOOL v11 = [(SUCorePolicyDocumentationDownload *)v5 requiresInexpensiveAccess],
            v11 == [(SUCorePolicyDocumentationDownload *)self requiresInexpensiveAccess]))
      {
        uint64_t v14 = [(SUCorePolicyDocumentationDownload *)v5 specifiedFields];
        BOOL v12 = v14 == [(SUCorePolicyDocumentationDownload *)self specifiedFields];
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
  v3 = NSString;
  int64_t v4 = [(SUCorePolicyDocumentationDownload *)self specifiedFields];
  objc_super v5 = @"YES";
  if ([(SUCorePolicyDocumentationDownload *)self allowsCellular]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  if ([(SUCorePolicyDocumentationDownload *)self discretionary]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  if ([(SUCorePolicyDocumentationDownload *)self disableUI]) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  if ([(SUCorePolicyDocumentationDownload *)self requiresPowerPluggedIn]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  uint64_t v10 = [(SUCorePolicyDocumentationDownload *)self downloadTimeoutSecs];
  if (![(SUCorePolicyDocumentationDownload *)self requiresInexpensiveAccess]) {
    objc_super v5 = @"NO";
  }
  BOOL v11 = [(SUCorePolicyDocumentationDownload *)self additionalOptions];
  if (v11)
  {
    BOOL v12 = [(SUCorePolicyDocumentationDownload *)self additionalOptions];
    v13 = [v3 stringWithFormat:@"SUCorePolicyDocumentationDownload(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|requiresInexpensiveAccess:%@|additionalOptions:%@)", v4, v6, v7, v8, v9, v10, v5, v12];
  }
  else
  {
    v13 = [v3 stringWithFormat:@"SUCorePolicyDocumentationDownload(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|requiresInexpensiveAccess:%@|additionalOptions:%@)", v4, v6, v7, v8, v9, v10, v5, @"none"];
  }

  return v13;
}

- (id)summary
{
  if ([(SUCorePolicyDocumentationDownload *)self specifiedFields])
  {
    v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"|fields=%llX", -[SUCorePolicyDocumentationDownload specifiedFields](self, "specifiedFields"));
    int64_t v4 = [&stru_26C1810A0 stringByAppendingString:v3];
  }
  else
  {
    int64_t v4 = &stru_26C1810A0;
  }
  if ([(SUCorePolicyDocumentationDownload *)self allowsCellular])
  {
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"|cellular"];

    int64_t v4 = (__CFString *)v5;
  }
  if ([(SUCorePolicyDocumentationDownload *)self discretionary]) {
    BOOL v6 = @"|discretionary";
  }
  else {
    BOOL v6 = @"|non-discretionary";
  }
  BOOL v7 = [(__CFString *)v4 stringByAppendingString:v6];

  if ([(SUCorePolicyDocumentationDownload *)self disableUI]) {
    BOOL v8 = @"|UIDisabled";
  }
  else {
    BOOL v8 = @"|UIEnabled";
  }
  BOOL v9 = [v7 stringByAppendingString:v8];

  if ([(SUCorePolicyDocumentationDownload *)self requiresPowerPluggedIn])
  {
    uint64_t v10 = [v9 stringByAppendingString:@"|power"];

    BOOL v9 = (void *)v10;
  }
  if ([(SUCorePolicyDocumentationDownload *)self downloadTimeoutSecs] != 120)
  {
    BOOL v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"|documentationDownloadTimeout=%d", -[SUCorePolicyDocumentationDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"));
    uint64_t v12 = [v9 stringByAppendingString:v11];

    BOOL v9 = (void *)v12;
  }
  if ([(SUCorePolicyDocumentationDownload *)self requiresInexpensiveAccess])
  {
    uint64_t v13 = [v9 stringByAppendingString:@"|cheapAccess"];

    BOOL v9 = (void *)v13;
  }
  uint64_t v14 = [(SUCorePolicyDocumentationDownload *)self additionalOptions];
  if (v14) {
    v15 = @"|withAdditionalOptions";
  }
  else {
    v15 = @"|noAdditionalOptions";
  }
  v16 = [v9 stringByAppendingString:v15];

  if (([v16 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v17 = [v16 stringByAppendingString:@"|"];

    v16 = (void *)v17;
  }

  return v16;
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

- (BOOL)requiresInexpensiveAccess
{
  return self->_requiresInexpensiveAccess;
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
}

@end