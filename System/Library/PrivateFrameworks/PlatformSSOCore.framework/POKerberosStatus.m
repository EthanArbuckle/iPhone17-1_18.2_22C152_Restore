@interface POKerberosStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)exchangeRequired;
- (BOOL)failedToConnect;
- (BOOL)importSuccessful;
- (NSString)cacheName;
- (NSString)realm;
- (NSString)ticketKeyPath;
- (NSString)upn;
- (POKerberosStatus)initWithCoder:(id)a3;
- (POKerberosStatus)initWithData:(id)a3;
- (POKerberosStatus)initWithDictionary:(id)a3;
- (id)dataRepresentation;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheName:(id)a3;
- (void)setExchangeRequired:(BOOL)a3;
- (void)setFailedToConnect:(BOOL)a3;
- (void)setImportSuccessful:(BOOL)a3;
- (void)setRealm:(id)a3;
- (void)setTicketKeyPath:(id)a3;
- (void)setUpn:(id)a3;
@end

@implementation POKerberosStatus

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  ticketKeyPath = self->_ticketKeyPath;
  v5 = NSStringFromSelector(sel_ticketKeyPath);
  [v3 setObject:ticketKeyPath forKeyedSubscript:v5];

  realm = self->_realm;
  v7 = NSStringFromSelector(sel_realm);
  [v3 setObject:realm forKeyedSubscript:v7];

  cacheName = self->_cacheName;
  v9 = NSStringFromSelector(sel_cacheName);
  [v3 setObject:cacheName forKeyedSubscript:v9];

  upn = self->_upn;
  v11 = NSStringFromSelector("upn");
  [v3 setObject:upn forKeyedSubscript:v11];

  v12 = [NSNumber numberWithBool:self->_importSuccessful];
  v13 = NSStringFromSelector(sel_importSuccessful);
  [v3 setObject:v12 forKeyedSubscript:v13];

  v14 = [NSNumber numberWithBool:self->_exchangeRequired];
  v15 = NSStringFromSelector(sel_exchangeRequired);
  [v3 setObject:v14 forKeyedSubscript:v15];

  v16 = [NSNumber numberWithBool:self->_failedToConnect];
  v17 = NSStringFromSelector(sel_failedToConnect);
  [v3 setObject:v16 forKeyedSubscript:v17];

  return v3;
}

- (id)dataRepresentation
{
  v2 = (void *)MEMORY[0x263F08900];
  id v3 = [(POKerberosStatus *)self dictionaryRepresentation];
  id v11 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:11 error:&v11];
  id v5 = v11;

  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__POKerberosStatus_dataRepresentation__block_invoke;
    v9[3] = &unk_265463860;
    id v10 = v5;
    id v6 = __38__POKerberosStatus_dataRepresentation__block_invoke((uint64_t)v9);

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

id __38__POKerberosStatus_dataRepresentation__block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error serializing kerberos status"];
  v2 = PO_LOG_POUserConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (POKerberosStatus)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(POKerberosStatus *)self init];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_ticketKeyPath);
    uint64_t v7 = [v4 objectForKeyedSubscript:v6];
    ticketKeyPath = v5->_ticketKeyPath;
    v5->_ticketKeyPath = (NSString *)v7;

    v9 = NSStringFromSelector(sel_realm);
    uint64_t v10 = [v4 objectForKeyedSubscript:v9];
    realm = v5->_realm;
    v5->_realm = (NSString *)v10;

    v12 = NSStringFromSelector(sel_cacheName);
    uint64_t v13 = [v4 objectForKeyedSubscript:v12];
    cacheName = v5->_cacheName;
    v5->_cacheName = (NSString *)v13;

    v15 = NSStringFromSelector("upn");
    uint64_t v16 = [v4 objectForKeyedSubscript:v15];
    upn = v5->_upn;
    v5->_upn = (NSString *)v16;

    v18 = NSStringFromSelector(sel_importSuccessful);
    v19 = [v4 objectForKeyedSubscript:v18];
    v5->_importSuccessful = [v19 BOOLValue];

    v20 = NSStringFromSelector(sel_exchangeRequired);
    v21 = [v4 objectForKeyedSubscript:v20];
    v5->_exchangeRequired = [v21 BOOLValue];

    v22 = NSStringFromSelector(sel_failedToConnect);
    v23 = [v4 objectForKeyedSubscript:v22];
    v5->_failedToConnect = [v23 BOOLValue];
  }
  return v5;
}

- (POKerberosStatus)initWithData:(id)a3
{
  id v12 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:16 error:&v12];
  id v5 = v12;
  id v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __33__POKerberosStatus_initWithData___block_invoke;
    v10[3] = &unk_265463860;
    id v11 = v5;
    id v7 = __33__POKerberosStatus_initWithData___block_invoke((uint64_t)v10);

    v8 = 0;
  }
  else
  {
    self = [(POKerberosStatus *)self initWithDictionary:v4];
    v8 = self;
  }

  return v8;
}

id __33__POKerberosStatus_initWithData___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing kerberos status"];
  v2 = PO_LOG_POUserConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(POKerberosStatus *)self dataRepresentation];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POKerberosStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_dataRepresentation);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = [(POKerberosStatus *)self initWithData:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(POKerberosStatus *)self dataRepresentation];
  uint64_t v5 = NSStringFromSelector(sel_dataRepresentation);
  [v4 encodeObject:v6 forKey:v5];
}

- (NSString)ticketKeyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTicketKeyPath:(id)a3
{
}

- (NSString)realm
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRealm:(id)a3
{
}

- (NSString)cacheName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCacheName:(id)a3
{
}

- (NSString)upn
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpn:(id)a3
{
}

- (BOOL)importSuccessful
{
  return self->_importSuccessful;
}

- (void)setImportSuccessful:(BOOL)a3
{
  self->_importSuccessful = a3;
}

- (BOOL)exchangeRequired
{
  return self->_exchangeRequired;
}

- (void)setExchangeRequired:(BOOL)a3
{
  self->_exchangeRequired = a3;
}

- (BOOL)failedToConnect
{
  return self->_failedToConnect;
}

- (void)setFailedToConnect:(BOOL)a3
{
  self->_failedToConnect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upn, 0);
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_ticketKeyPath, 0);
}

@end