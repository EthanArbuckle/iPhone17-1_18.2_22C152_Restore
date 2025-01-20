@interface POUserLoginState
+ (BOOL)supportsSecureCoding;
- (NSDate)lastLogin;
- (NSDate)lastUpdated;
- (NSString)uniqueIdentifier;
- (POUserLoginState)initWithCoder:(id)a3;
- (POUserLoginState)initWithData:(id)a3;
- (POUserLoginState)initWithDictionary:(id)a3;
- (POUserLoginState)initWithUniqueIdentifier:(id)a3;
- (id)dataRepresentation;
- (id)dataRepresentationForDisplay:(BOOL)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationForDisplay:(BOOL)a3;
- (unint64_t)loginType;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setLastLogin:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setLoginType:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setlastLogin:(id)a3;
@end

@implementation POUserLoginState

- (POUserLoginState)initWithUniqueIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)POUserLoginState;
  v6 = [(POUserLoginState *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueIdentifier, a3);
    v7->_state = 0;
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    lastUpdated = v7->_lastUpdated;
    v7->_lastUpdated = (NSDate *)v8;
  }
  return v7;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  self->_lastUpdated = [MEMORY[0x263EFF910] date];
  MEMORY[0x270F9A758]();
}

- (void)setlastLogin:(id)a3
{
  objc_storeStrong((id *)&self->_lastLogin, a3);
  id v7 = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  lastUpdated = self->_lastUpdated;
  self->_lastUpdated = v5;
}

- (void)setLoginType:(unint64_t)a3
{
  self->_loginType = a3;
  self->_lastUpdated = [MEMORY[0x263EFF910] date];
  MEMORY[0x270F9A758]();
}

- (id)dictionaryRepresentation
{
  return [(POUserLoginState *)self dictionaryRepresentationForDisplay:0];
}

- (id)dictionaryRepresentationForDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v5 setFormatOptions:1907];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uniqueIdentifier = self->_uniqueIdentifier;
  uint64_t v8 = NSStringFromSelector(sel_uniqueIdentifier);
  [v6 setObject:uniqueIdentifier forKeyedSubscript:v8];

  unint64_t state = self->_state;
  if (v3) {
    +[POConstantCoreUtil stringForLoginPolicyState:state];
  }
  else {
  v10 = [NSNumber numberWithUnsignedInteger:state];
  }
  objc_super v11 = NSStringFromSelector(sel_state);
  [v6 setObject:v10 forKeyedSubscript:v11];

  lastLogin = self->_lastLogin;
  if (lastLogin)
  {
    v13 = [v5 stringFromDate:self->_lastLogin];
  }
  else
  {
    v13 = 0;
  }
  v14 = NSStringFromSelector(sel_lastLogin);
  [v6 setObject:v13 forKeyedSubscript:v14];

  if (lastLogin) {
  unint64_t loginType = self->_loginType;
  }
  if (v3) {
    +[POConstantCoreUtil stringForLoginType:loginType];
  }
  else {
  v16 = [NSNumber numberWithUnsignedInteger:loginType];
  }
  v17 = NSStringFromSelector(sel_loginType);
  [v6 setObject:v16 forKeyedSubscript:v17];

  lastUpdated = self->_lastUpdated;
  if (lastUpdated)
  {
    v19 = [v5 stringFromDate:lastUpdated];
  }
  else
  {
    v19 = 0;
  }
  v20 = NSStringFromSelector(sel_lastUpdated);
  [v6 setObject:v19 forKeyedSubscript:v20];

  if (lastUpdated) {
  v21 = (void *)[v6 copy];
  }

  return v21;
}

- (id)dataRepresentation
{
  return [(POUserLoginState *)self dataRepresentationForDisplay:0];
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  BOOL v3 = [(POUserLoginState *)self dictionaryRepresentationForDisplay:a3];
  id v12 = 0;
  v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:11 error:&v12];
  id v5 = v12;
  id v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__POUserLoginState_dataRepresentationForDisplay___block_invoke;
    v10[3] = &unk_265463860;
    id v11 = v5;
    id v7 = __49__POUserLoginState_dataRepresentationForDisplay___block_invoke((uint64_t)v10);

    id v8 = 0;
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

id __49__POUserLoginState_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error serializing user state."];
  v2 = PO_LOG_POUserLoginState();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2);
  }

  return v1;
}

- (POUserLoginState)initWithData:(id)a3
{
  id v12 = 0;
  v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:16 error:&v12];
  id v5 = v12;
  id v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __33__POUserLoginState_initWithData___block_invoke;
    v10[3] = &unk_265463860;
    id v11 = v5;
    id v7 = __33__POUserLoginState_initWithData___block_invoke((uint64_t)v10);

    id v8 = 0;
  }
  else
  {
    self = [(POUserLoginState *)self initWithDictionary:v4];
    id v8 = self;
  }

  return v8;
}

id __33__POUserLoginState_initWithData___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing user state."];
  v2 = PO_LOG_POUserLoginState();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2);
  }

  return v1;
}

- (POUserLoginState)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v5 setFormatOptions:1907];
  id v6 = NSStringFromSelector(sel_uniqueIdentifier);
  id v7 = [v4 objectForKeyedSubscript:v6];

  id v8 = [(POUserLoginState *)self initWithUniqueIdentifier:v7];
  if (v8)
  {
    v9 = NSStringFromSelector(sel_state);
    v10 = [v4 objectForKeyedSubscript:v9];

    if (v10)
    {
      id v11 = NSStringFromSelector(sel_state);
      id v12 = [v4 objectForKeyedSubscript:v11];

      v8->_unint64_t state = [v12 unsignedIntValue];
    }
    v13 = NSStringFromSelector(sel_lastLogin);
    v14 = [v4 objectForKeyedSubscript:v13];

    if (v14)
    {
      uint64_t v15 = [v5 dateFromString:v14];
      lastLogin = v8->_lastLogin;
      v8->_lastLogin = (NSDate *)v15;
    }
    v17 = NSStringFromSelector(sel_loginType);
    v18 = [v4 objectForKeyedSubscript:v17];
    v8->_unint64_t loginType = (int)[v18 intValue];

    v19 = NSStringFromSelector(sel_lastUpdated);
    v20 = [v4 objectForKeyedSubscript:v19];

    if (v20)
    {
      uint64_t v21 = [v5 dateFromString:v20];
      lastUpdated = v8->_lastUpdated;
      v8->_lastUpdated = (NSDate *)v21;
    }
  }

  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(POUserLoginState *)self dataRepresentationForDisplay:1];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POUserLoginState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_dataRepresentation);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = [(POUserLoginState *)self initWithData:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(POUserLoginState *)self dataRepresentation];
  uint64_t v5 = NSStringFromSelector(sel_dataRepresentation);
  [v4 encodeObject:v6 forKey:v5];
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)loginType
{
  return self->_loginType;
}

- (NSDate)lastLogin
{
  return self->_lastLogin;
}

- (void)setLastLogin:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_lastLogin, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end