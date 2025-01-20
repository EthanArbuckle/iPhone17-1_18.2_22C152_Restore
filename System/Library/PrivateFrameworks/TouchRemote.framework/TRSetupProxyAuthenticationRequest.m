@interface TRSetupProxyAuthenticationRequest
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (BOOL)shouldUseAIDA;
- (NSSet)targetedAccountServices;
- (NSString)rawPassword;
- (TRSetupProxyAuthenticationRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setRawPassword:(id)a3;
- (void)setShouldUseAIDA:(BOOL)a3;
- (void)setTargetedAccountServices:(id)a3;
@end

@implementation TRSetupProxyAuthenticationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TRSetupProxyAuthenticationRequest;
  [(TRMessage *)&v8 encodeWithCoder:v4];
  account = self->_account;
  if (account) {
    [v4 encodeObject:account forKey:@"TRSetupAuthenticationMessages_ac"];
  }
  rawPassword = self->_rawPassword;
  if (rawPassword) {
    [v4 encodeObject:rawPassword forKey:@"TRSetupAuthenticationMessages_rP"];
  }
  targetedAccountServices = self->_targetedAccountServices;
  if (targetedAccountServices) {
    [v4 encodeObject:targetedAccountServices forKey:@"TRSetupAuthenticationMessages_tAS"];
  }
  [v4 encodeBool:self->_shouldUseAIDA forKey:@"TRSetupAuthenticationMessages_sUA"];
}

- (TRSetupProxyAuthenticationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRSetupProxyAuthenticationRequest;
  v5 = [(TRMessage *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRSetupAuthenticationMessages_ac"];
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRSetupAuthenticationMessages_rP"];
    rawPassword = v5->_rawPassword;
    v5->_rawPassword = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"TRSetupAuthenticationMessages_tAS"];
    targetedAccountServices = v5->_targetedAccountServices;
    v5->_targetedAccountServices = (NSSet *)v13;

    v5->_shouldUseAIDA = [v4 decodeBoolForKey:@"TRSetupAuthenticationMessages_sUA"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  account = self->_account;
  if (self->_rawPassword) {
    v5 = @"present";
  }
  else {
    v5 = @"absent";
  }
  uint64_t v6 = _StringFromAccountServices(self->_targetedAccountServices);
  v7 = (void *)v6;
  if (self->_shouldUseAIDA) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  v9 = [v3 stringWithFormat:@"account:[-%@-] rawPassword:[-%@-] targetedAccountServices:%@ shouldUseAIDA:[-%@-]", account, v5, v6, v8];

  v10 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)TRSetupProxyAuthenticationRequest;
  uint64_t v11 = [(TRMessage *)&v14 description];
  v12 = [v10 stringWithFormat:@"%@ %@", v11, v9];

  return v12;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
}

- (NSSet)targetedAccountServices
{
  return self->_targetedAccountServices;
}

- (void)setTargetedAccountServices:(id)a3
{
}

- (BOOL)shouldUseAIDA
{
  return self->_shouldUseAIDA;
}

- (void)setShouldUseAIDA:(BOOL)a3
{
  self->_shouldUseAIDA = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedAccountServices, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end