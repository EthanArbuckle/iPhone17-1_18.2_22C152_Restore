@interface POUserLoginConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)setCustomAssertionRequestBodyClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomAssertionRequestHeaderClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomLoginRequestBodyClaims:(id)a3 returningError:(id *)a4;
- (BOOL)setCustomLoginRequestHeaderClaims:(id)a3 returningError:(id *)a4;
- (NSDictionary)customAssertionRequestBodyClaims;
- (NSDictionary)customAssertionRequestHeaderClaims;
- (NSDictionary)customLoginRequestBodyClaims;
- (NSDictionary)customLoginRequestHeaderClaims;
- (NSString)loginUserName;
- (POUserLoginConfiguration)initWithCoder:(id)a3;
- (POUserLoginConfiguration)initWithData:(id)a3;
- (POUserLoginConfiguration)initWithDictionary:(id)a3;
- (POUserLoginConfiguration)initWithLoginUserName:(id)a3;
- (id)dataRepresentation;
- (id)dataRepresentationForDisplay:(BOOL)a3;
- (id)description;
- (id)dictionaryRepresentationForDisplay:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomAssertionRequestBodyClaims:(id)a3;
- (void)setCustomAssertionRequestHeaderClaims:(id)a3;
- (void)setCustomLoginRequestBodyClaims:(id)a3;
- (void)setCustomLoginRequestHeaderClaims:(id)a3;
- (void)setLoginUserName:(id)a3;
@end

@implementation POUserLoginConfiguration

- (POUserLoginConfiguration)initWithLoginUserName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POUserLoginConfiguration;
  v6 = [(POUserLoginConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_loginUserName, a3);
  }

  return v7;
}

- (BOOL)setCustomAssertionRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POUserLoginConfiguration *)self setCustomAssertionRequestHeaderClaims:v8];
  }
  else
  {
    objc_super v9 = __81__POUserLoginConfiguration_setCustomAssertionRequestHeaderClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __81__POUserLoginConfiguration_setCustomAssertionRequestHeaderClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Request header claims are not valid JSON."];
  v1 = PO_LOG_POUserLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomAssertionRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POUserLoginConfiguration *)self setCustomAssertionRequestBodyClaims:v8];
  }
  else
  {
    objc_super v9 = __79__POUserLoginConfiguration_setCustomAssertionRequestBodyClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __79__POUserLoginConfiguration_setCustomAssertionRequestBodyClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Request body claims are not valid JSON."];
  v1 = PO_LOG_POUserLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomLoginRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POUserLoginConfiguration *)self setCustomLoginRequestHeaderClaims:v8];
  }
  else
  {
    objc_super v9 = __77__POUserLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

id __77__POUserLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Login request header claims are not valid JSON."];
  v1 = PO_LOG_POUserLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setCustomLoginRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x263F08900] isValidJSONObject:v6];
  if (v7)
  {
    id v8 = (id)[v6 copy];
    [(POUserLoginConfiguration *)self setCustomLoginRequestBodyClaims:v8];
  }
  else
  {
    objc_super v9 = __77__POUserLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke();
    id v8 = v9;
    if (a4)
    {
      id v8 = v9;
      *a4 = v8;
    }
  }

  return v7;
}

- (id)dataRepresentation
{
  return [(POUserLoginConfiguration *)self dataRepresentationForDisplay:0];
}

- (id)dictionaryRepresentationForDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v3)
  {
    loginUserName = +[POCredentialUtil maskName:self->_loginUserName];
  }
  else
  {
    loginUserName = self->_loginUserName;
  }
  int v7 = NSStringFromSelector(sel_loginUserName);
  [v5 setObject:loginUserName forKeyedSubscript:v7];

  if (v3) {
  customAssertionRequestHeaderClaims = self->_customAssertionRequestHeaderClaims;
  }
  objc_super v9 = NSStringFromSelector(sel_customAssertionRequestHeaderClaims);
  [v5 setObject:customAssertionRequestHeaderClaims forKeyedSubscript:v9];

  customAssertionRequestBodyClaims = self->_customAssertionRequestBodyClaims;
  v11 = NSStringFromSelector(sel_customAssertionRequestBodyClaims);
  [v5 setObject:customAssertionRequestBodyClaims forKeyedSubscript:v11];

  customLoginRequestHeaderClaims = self->_customLoginRequestHeaderClaims;
  v13 = NSStringFromSelector(sel_customLoginRequestHeaderClaims);
  [v5 setObject:customLoginRequestHeaderClaims forKeyedSubscript:v13];

  customLoginRequestBodyClaims = self->_customLoginRequestBodyClaims;
  v15 = NSStringFromSelector(sel_customLoginRequestBodyClaims);
  [v5 setObject:customLoginRequestBodyClaims forKeyedSubscript:v15];

  id v16 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v16 setFormatOptions:1907];
  v17 = [MEMORY[0x263EFF910] date];
  v18 = [v16 stringFromDate:v17];
  [v5 setObject:v18 forKeyedSubscript:@"created"];

  return v5;
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  BOOL v3 = [(POUserLoginConfiguration *)self dictionaryRepresentationForDisplay:a3];
  id v13 = 0;
  v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:11 error:&v13];
  id v5 = v13;
  id v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__POUserLoginConfiguration_dataRepresentationForDisplay___block_invoke;
    v11[3] = &unk_265463860;
    id v12 = v5;
    id v7 = __57__POUserLoginConfiguration_dataRepresentationForDisplay___block_invoke((uint64_t)v11);

    id v8 = 0;
  }
  else
  {
    objc_super v9 = PO_LOG_POUserLoginConfiguration();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POUserLoginConfiguration dataRepresentationForDisplay:]((uint64_t)v4, v9);
    }

    id v8 = v4;
  }

  return v8;
}

id __57__POUserLoginConfiguration_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error serializing user login config."];
  v2 = PO_LOG_POUserLoginConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (POUserLoginConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(sel_loginUserName);
  id v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = [(POUserLoginConfiguration *)self initWithLoginUserName:v6];
  if (v7)
  {
    id v8 = NSStringFromSelector(sel_customAssertionRequestHeaderClaims);
    uint64_t v9 = [v4 objectForKeyedSubscript:v8];
    customAssertionRequestHeaderClaims = v7->_customAssertionRequestHeaderClaims;
    v7->_customAssertionRequestHeaderClaims = (NSDictionary *)v9;

    v11 = NSStringFromSelector(sel_customAssertionRequestBodyClaims);
    uint64_t v12 = [v4 objectForKeyedSubscript:v11];
    customAssertionRequestBodyClaims = v7->_customAssertionRequestBodyClaims;
    v7->_customAssertionRequestBodyClaims = (NSDictionary *)v12;

    v14 = NSStringFromSelector(sel_customLoginRequestHeaderClaims);
    uint64_t v15 = [v4 objectForKeyedSubscript:v14];
    customLoginRequestHeaderClaims = v7->_customLoginRequestHeaderClaims;
    v7->_customLoginRequestHeaderClaims = (NSDictionary *)v15;

    v17 = NSStringFromSelector(sel_customLoginRequestBodyClaims);
    uint64_t v18 = [v4 objectForKeyedSubscript:v17];
    customLoginRequestBodyClaims = v7->_customLoginRequestBodyClaims;
    v7->_customLoginRequestBodyClaims = (NSDictionary *)v18;
  }
  return v7;
}

- (POUserLoginConfiguration)initWithData:(id)a3
{
  uint64_t v8 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:16 error:&v8];
  if (v8)
  {
    id v5 = __41__POUserLoginConfiguration_initWithData___block_invoke();
    id v6 = 0;
  }
  else
  {
    self = [(POUserLoginConfiguration *)self initWithDictionary:v4];
    id v6 = self;
  }

  return v6;
}

id __41__POUserLoginConfiguration_initWithData___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error deserializing user login config."];
  v1 = PO_LOG_POUserLoginConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(POUserLoginConfiguration *)self dataRepresentation];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POUserLoginConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_dataRepresentation);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = [(POUserLoginConfiguration *)self initWithData:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(POUserLoginConfiguration *)self dataRepresentation];
  uint64_t v5 = NSStringFromSelector(sel_dataRepresentation);
  [v4 encodeObject:v6 forKey:v5];
}

- (NSString)loginUserName
{
  return self->_loginUserName;
}

- (void)setLoginUserName:(id)a3
{
}

- (NSDictionary)customAssertionRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCustomAssertionRequestHeaderClaims:(id)a3
{
}

- (NSDictionary)customAssertionRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCustomAssertionRequestBodyClaims:(id)a3
{
}

- (NSDictionary)customLoginRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCustomLoginRequestHeaderClaims:(id)a3
{
}

- (NSDictionary)customLoginRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCustomLoginRequestBodyClaims:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLoginRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customLoginRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customAssertionRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customAssertionRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_loginUserName, 0);
}

- (void)dataRepresentationForDisplay:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = (void *)[[NSString alloc] initWithData:a1 encoding:4];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "serialized configuration: %{public}@", v4, 0xCu);
}

@end