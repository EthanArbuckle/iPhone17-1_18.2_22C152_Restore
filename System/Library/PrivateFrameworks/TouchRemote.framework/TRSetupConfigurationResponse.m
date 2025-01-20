@interface TRSetupConfigurationResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)needsNetwork;
- (BOOL)useAIDA;
- (NSSet)unauthenticatedAccountServices;
- (TRSetupConfigurationResponse)initWithCoder:(id)a3;
- (id)_stringFromAccountServices:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setNeedsNetwork:(BOOL)a3;
- (void)setUnauthenticatedAccountServices:(id)a3;
- (void)setUseAIDA:(BOOL)a3;
@end

@implementation TRSetupConfigurationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupConfigurationResponse;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  if (self->_needsNetwork) {
    [v4 encodeBool:1 forKey:@"TRSetupConfigurationMessages_nN"];
  }
  unauthenticatedAccountServices = self->_unauthenticatedAccountServices;
  if (unauthenticatedAccountServices) {
    [v4 encodeObject:unauthenticatedAccountServices forKey:@"TRSetupConfigurationMessages_uAS"];
  }
  if (self->_useAIDA) {
    [v4 encodeBool:1 forKey:@"TRSetupConfigurationMessages_uAIDA"];
  }
}

- (TRSetupConfigurationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRSetupConfigurationResponse;
  v5 = [(TRMessage *)&v12 initWithCoder:v4];
  if (v5)
  {
    v5->_needsNetwork = [v4 decodeBoolForKey:@"TRSetupConfigurationMessages_nN"];
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"TRSetupConfigurationMessages_uAS"];
    unauthenticatedAccountServices = v5->_unauthenticatedAccountServices;
    v5->_unauthenticatedAccountServices = (NSSet *)v9;

    v5->_useAIDA = [v4 decodeBoolForKey:@"TRSetupConfigurationMessages_uAIDA"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  if (self->_needsNetwork) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v5 = [(TRSetupConfigurationResponse *)self _stringFromAccountServices:self->_unauthenticatedAccountServices];
  objc_super v6 = [v3 stringWithFormat:@"needsNetwork:%@ unauthenticatedAccountServices:%@", v4, v5];

  uint64_t v7 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)TRSetupConfigurationResponse;
  v8 = [(TRMessage *)&v11 description];
  uint64_t v9 = [v7 stringWithFormat:@"%@ %@", v8, v6];

  return v9;
}

- (id)_stringFromAccountServices:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F089D8] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = StringFromTRAccountService(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "unsignedIntegerValue", (void)v12));
        [v4 appendString:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)needsNetwork
{
  return self->_needsNetwork;
}

- (void)setNeedsNetwork:(BOOL)a3
{
  self->_needsNetwork = a3;
}

- (NSSet)unauthenticatedAccountServices
{
  return self->_unauthenticatedAccountServices;
}

- (void)setUnauthenticatedAccountServices:(id)a3
{
}

- (BOOL)useAIDA
{
  return self->_useAIDA;
}

- (void)setUseAIDA:(BOOL)a3
{
  self->_useAIDA = a3;
}

- (void).cxx_destruct
{
}

@end