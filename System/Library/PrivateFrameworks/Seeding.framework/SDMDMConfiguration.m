@interface SDMDMConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultConfigurationForSetupAssistantFlowWithTokens:(id)a3;
- (BOOL)disableBetaEnrollment;
- (BOOL)restrictUserPrograms;
- (NSSet)tokens;
- (SDMDMConfiguration)initWithCoder:(id)a3;
- (SDMDMConfiguration)initWithPolicy:(int64_t)a3;
- (int64_t)policy;
- (void)encodeWithCoder:(id)a3;
- (void)setDisableBetaEnrollment:(BOOL)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setRestrictUserPrograms:(BOOL)a3;
- (void)setTokens:(id)a3;
@end

@implementation SDMDMConfiguration

- (SDMDMConfiguration)initWithPolicy:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SDMDMConfiguration;
  v4 = [(SDMDMConfiguration *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_policy = a3;
    *(_WORD *)&v4->_restrictUserPrograms = 0;
    uint64_t v6 = objc_opt_new();
    tokens = v5->_tokens;
    v5->_tokens = (NSSet *)v6;
  }
  return v5;
}

+ (id)defaultConfigurationForSetupAssistantFlowWithTokens:(id)a3
{
  id v3 = a3;
  v4 = [[SDMDMConfiguration alloc] initWithPolicy:1];
  [(SDMDMConfiguration *)v4 setTokens:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SDMDMConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SDMDMConfiguration;
  v5 = [(SDMDMConfiguration *)&v14 init];
  if (v5)
  {
    v5->_restrictUserPrograms = [v4 decodeBoolForKey:@"restrictUserPrograms"];
    v5->_disableBetaEnrollment = [v4 decodeBoolForKey:@"disableBetaEnrollment"];
    v5->_policy = [v4 decodeIntegerForKey:@"policy"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"tokens"];
    v10 = v9;
    if (v9) {
      v11 = v9;
    }
    else {
      v11 = (NSSet *)objc_opt_new();
    }
    tokens = v5->_tokens;
    v5->_tokens = v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SDMDMConfiguration restrictUserPrograms](self, "restrictUserPrograms"), @"restrictUserPrograms");
  objc_msgSend(v4, "encodeBool:forKey:", -[SDMDMConfiguration disableBetaEnrollment](self, "disableBetaEnrollment"), @"disableBetaEnrollment");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SDMDMConfiguration policy](self, "policy"), @"policy");
  id v5 = [(SDMDMConfiguration *)self tokens];
  [v4 encodeObject:v5 forKey:@"tokens"];
}

- (NSSet)tokens
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTokens:(id)a3
{
}

- (BOOL)restrictUserPrograms
{
  return self->_restrictUserPrograms;
}

- (void)setRestrictUserPrograms:(BOOL)a3
{
  self->_restrictUserPrograms = a3;
}

- (BOOL)disableBetaEnrollment
{
  return self->_disableBetaEnrollment;
}

- (void)setDisableBetaEnrollment:(BOOL)a3
{
  self->_disableBetaEnrollment = a3;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (void).cxx_destruct
{
}

@end