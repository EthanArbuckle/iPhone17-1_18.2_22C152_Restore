@interface WFSettingsProxy
+ (id)defaultProxyConfiguration;
+ (id)offConfig;
- (BOOL)authenticated;
- (BOOL)autoConfigured;
- (BOOL)autoDiscoveryEnabled;
- (BOOL)customProxy;
- (BOOL)isAutomatic;
- (NSDictionary)items;
- (NSString)autoConfigureURL;
- (NSString)description;
- (NSString)password;
- (NSString)port;
- (NSString)server;
- (NSString)username;
- (WFSettingsProxy)initWithAutoConfigureURL:(id)a3;
- (WFSettingsProxy)initWithDictionary:(id)a3;
- (WFSettingsProxy)initWithManualServer:(id)a3 port:(id)a4 username:(id)a5 password:(id)a6;
- (id)initDefaultConfig;
- (id)protocol;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAutoConfigureURL:(id)a3;
- (void)setAutoConfigured:(BOOL)a3;
- (void)setAutoDiscoveryEnabled:(BOOL)a3;
- (void)setCustomProxy:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPort:(id)a3;
- (void)setServer:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation WFSettingsProxy

- (WFSettingsProxy)initWithManualServer:(id)a3 port:(id)a4 username:(id)a5 password:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v23 = a6;
  v24.receiver = self;
  v24.super_class = (Class)WFSettingsProxy;
  v14 = [(WFSettingsProxy *)&v24 init];
  if (!v14) {
    goto LABEL_13;
  }
  v15 = (void *)MEMORY[0x263EFF9A0];
  v16 = +[WFSettingsProxy defaultProxyConfiguration];
  v17 = [v15 dictionaryWithDictionary:v16];

  v14->_customProxy = 1;
  objc_storeStrong((id *)&v14->_server, a3);
  if (v11)
  {
    [(NSDictionary *)v17 setObject:v11 forKey:*MEMORY[0x263F1BDF8]];
    [(NSDictionary *)v17 setObject:v11 forKey:*MEMORY[0x263F1BE10]];
  }
  objc_storeStrong((id *)&v14->_port, a4);
  if (v12)
  {
    v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
    [(NSDictionary *)v17 setObject:v18 forKey:*MEMORY[0x263F1BDF0]];
    [(NSDictionary *)v17 setObject:v18 forKey:*MEMORY[0x263F1BE08]];
  }
  if ([v13 length])
  {
    v14->_authenticated = 1;
LABEL_9:
    [(NSDictionary *)v17 setObject:&unk_26D9E1E88 forKey:@"HTTPProxyAuthenticated"];
    goto LABEL_10;
  }
  uint64_t v19 = [v23 length];
  v14->_authenticated = v19 != 0;
  if (v19) {
    goto LABEL_9;
  }
LABEL_10:
  objc_storeStrong((id *)&v14->_username, a5);
  if (v13) {
    [(NSDictionary *)v17 setObject:v13 forKey:@"HTTPProxyUsername"];
  }
  [(NSDictionary *)v17 setObject:&unk_26D9E1E88 forKey:*MEMORY[0x263F1BDE8]];
  [(NSDictionary *)v17 setObject:&unk_26D9E1E88 forKey:*MEMORY[0x263F1BE00]];
  objc_storeStrong((id *)&v14->_password, a6);
  items = v14->_items;
  v14->_items = v17;
  v21 = v17;

LABEL_13:
  return v14;
}

- (WFSettingsProxy)initWithAutoConfigureURL:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFSettingsProxy;
  v6 = [(WFSettingsProxy *)&v15 init];
  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFF9A0];
    v8 = +[WFSettingsProxy defaultProxyConfiguration];
    v9 = [v7 dictionaryWithDictionary:v8];

    v6->_customProxy = 1;
    objc_storeStrong((id *)&v6->_autoConfigureURL, a3);
    if (v5) {
      v10 = v5;
    }
    else {
      v10 = &unk_26D9E1E88;
    }
    id v11 = (void *)MEMORY[0x263F1BE28];
    if (v5) {
      id v11 = (void *)MEMORY[0x263F1BE20];
    }
    [(NSDictionary *)v9 setObject:v10 forKey:*v11];
    [(NSDictionary *)v9 setObject:&unk_26D9E1E88 forKey:*MEMORY[0x263F1BE18]];
    items = v6->_items;
    v6->_items = v9;
    id v13 = v9;
  }
  return v6;
}

+ (id)offConfig
{
  id v2 = [[WFSettingsProxy alloc] initDefaultConfig];
  return v2;
}

- (id)initDefaultConfig
{
  v8.receiver = self;
  v8.super_class = (Class)WFSettingsProxy;
  id v2 = [(WFSettingsProxy *)&v8 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263EFF9A0];
    v4 = +[WFSettingsProxy defaultProxyConfiguration];
    id v5 = [v3 dictionaryWithDictionary:v4];

    if (v5)
    {
      id v5 = v5;
      items = v2->_items;
      v2->_items = v5;
    }
    else
    {
      items = v2;
      id v2 = 0;
    }
  }
  else
  {
    id v5 = 0;
    items = 0;
  }

  return v2;
}

- (WFSettingsProxy)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v13 = 0;
    v26 = self;
    self = 0;
    goto LABEL_13;
  }
  p_items = &self->_items;
  objc_storeStrong((id *)&self->_items, a3);
  items = self->_items;
  objc_super v8 = +[WFSettingsProxy defaultProxyConfiguration];
  LOBYTE(items) = [(NSDictionary *)items isEqualToDictionary:v8];

  self->_customProxy = items ^ 1;
  v9 = [(NSDictionary *)self->_items objectForKey:@"HTTPProxyAuthenticated"];

  if (v9)
  {
    v10 = [(NSDictionary *)*p_items objectForKey:@"HTTPProxyAuthenticated"];
    LOBYTE(v9) = [v10 BOOLValue];
  }
  self->_authenticated = (char)v9;
  id v11 = [(NSDictionary *)self->_items objectForKey:*MEMORY[0x263F1BDF8]];
  server = self->_server;
  self->_server = v11;

  id v13 = [(NSDictionary *)self->_items objectForKey:*MEMORY[0x263F1BDF0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v13 stringValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    v14 = v13;
  }
  port = self->_port;
  self->_port = v14;

LABEL_9:
  v16 = [(NSDictionary *)self->_items objectForKey:@"HTTPProxyUsername"];
  username = self->_username;
  self->_username = v16;

  v18 = [(NSDictionary *)self->_items objectForKey:*MEMORY[0x263F1BE20]];
  autoConfigureURL = self->_autoConfigureURL;
  self->_autoConfigureURL = v18;

  uint64_t v20 = *MEMORY[0x263F1BE18];
  v21 = [(NSDictionary *)self->_items objectForKey:*MEMORY[0x263F1BE18]];

  if (v21)
  {
    v22 = [(NSDictionary *)self->_items objectForKey:v20];
    self->_autoConfigured = [v22 BOOLValue];
  }
  id v23 = *p_items;
  uint64_t v24 = *MEMORY[0x263F1BE28];
  v25 = [(NSDictionary *)v23 objectForKey:*MEMORY[0x263F1BE28]];

  if (v25)
  {
    v26 = [(NSDictionary *)self->_items objectForKey:v24];
    self->_autoDiscoveryEnabled = [v26 BOOLValue];
LABEL_13:
  }
  return self;
}

- (BOOL)isAutomatic
{
  if ([(WFSettingsProxy *)self autoConfigured]) {
    return 1;
  }
  return [(WFSettingsProxy *)self autoDiscoveryEnabled];
}

- (id)protocol
{
  return (id)*MEMORY[0x263F1BC88];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@- ", v5];

  v6 = [(WFSettingsProxy *)self server];
  [v3 appendFormat:@"Server: %@ ", v6];

  v7 = [(WFSettingsProxy *)self port];
  [v3 appendFormat:@" Port: %@ ", v7];

  if ([(WFSettingsProxy *)self authenticated])
  {
    objc_super v8 = [(WFSettingsProxy *)self username];
    [v3 appendFormat:@" Username: %@ ", v8];

    v9 = [(WFSettingsProxy *)self password];
    uint64_t v10 = [v9 length];
    id v11 = @"<not nil>";
    if (!v10) {
      id v11 = @"<nil>";
    }
    [v3 appendFormat:@" Password: %@", v11];
  }
  else
  {
    id v12 = [(WFSettingsProxy *)self autoConfigureURL];

    if (!v12) {
      goto LABEL_8;
    }
    v9 = [(WFSettingsProxy *)self autoConfigureURL];
    [v3 appendFormat:@" AutoConfigureURL: %@", v9];
  }

LABEL_8:
  return (NSString *)v3;
}

+ (id)defaultProxyConfiguration
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F1BDD8];
  v5[0] = *MEMORY[0x263F1BDD0];
  v5[1] = v2;
  v6[0] = &unk_26D9E2230;
  v6[1] = &unk_26D9E1E88;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (NSString)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)autoConfigureURL
{
  return self->_autoConfigureURL;
}

- (void)setAutoConfigureURL:(id)a3
{
}

- (BOOL)customProxy
{
  return self->_customProxy;
}

- (void)setCustomProxy:(BOOL)a3
{
  self->_customProxy = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)autoConfigured
{
  return self->_autoConfigured;
}

- (void)setAutoConfigured:(BOOL)a3
{
  self->_autoConfigured = a3;
}

- (BOOL)autoDiscoveryEnabled
{
  return self->_autoDiscoveryEnabled;
}

- (void)setAutoDiscoveryEnabled:(BOOL)a3
{
  self->_autoDiscoveryEnabled = a3;
}

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_autoConfigureURL, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end