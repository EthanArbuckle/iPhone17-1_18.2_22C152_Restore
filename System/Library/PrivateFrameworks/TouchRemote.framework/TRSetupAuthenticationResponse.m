@interface TRSetupAuthenticationResponse
+ (BOOL)supportsSecureCoding;
- (NSDictionary)authenticationResults;
- (NSError)error;
- (NSSet)unauthenticatedAccountServices;
- (TRSetupAuthenticationResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationResults:(id)a3;
- (void)setError:(id)a3;
- (void)setUnauthenticatedAccountServices:(id)a3;
@end

@implementation TRSetupAuthenticationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupAuthenticationResponse;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  unauthenticatedAccountServices = self->_unauthenticatedAccountServices;
  if (unauthenticatedAccountServices)
  {
    [v4 encodeObject:unauthenticatedAccountServices forKey:@"TRSetupAuthenticationMessages_uAS"];
    [v4 encodeObject:self->_error forKey:@"TRSetupAuthenticationMessages_err"];
    [v4 encodeObject:self->_authenticationResults forKey:@"TRSetupAuthenticationMessages_ar"];
  }
}

- (TRSetupAuthenticationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRSetupAuthenticationResponse;
  v5 = [(TRMessage *)&v16 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"TRSetupAuthenticationMessages_uAS"];
    unauthenticatedAccountServices = v5->_unauthenticatedAccountServices;
    v5->_unauthenticatedAccountServices = (NSSet *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRSetupAuthenticationMessages_err"];
    error = v5->_error;
    v5->_error = (NSError *)v11;

    uint64_t v13 = [v4 decodeObjectForKey:@"TRSetupAuthenticationMessages_ar"];
    authenticationResults = v5->_authenticationResults;
    v5->_authenticationResults = (NSDictionary *)v13;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = _StringFromAccountServices(self->_unauthenticatedAccountServices);
  v5 = [v3 stringWithFormat:@"unauthenticatedAccountServices:%@ error:%@ authResults:%@", v4, self->_error, self->_authenticationResults];

  objc_super v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)TRSetupAuthenticationResponse;
  uint64_t v7 = [(TRMessage *)&v10 description];
  v8 = [v6 stringWithFormat:@"%@ %@", v7, v5];

  return v8;
}

- (NSSet)unauthenticatedAccountServices
{
  return self->_unauthenticatedAccountServices;
}

- (void)setUnauthenticatedAccountServices:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void)setAuthenticationResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationResults, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_unauthenticatedAccountServices, 0);
}

@end