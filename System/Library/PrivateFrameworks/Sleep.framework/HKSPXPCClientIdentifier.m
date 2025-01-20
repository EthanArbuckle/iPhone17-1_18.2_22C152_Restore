@interface HKSPXPCClientIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSPXPCClientIdentifier)initWithCoder:(id)a3;
- (HKSPXPCClientIdentifier)initWithUniqueIdentifier:(id)a3 loggingIdentifier:(id)a4;
- (NSString)description;
- (NSString)loggingIdentifier;
- (NSUUID)uniqueIdentifier;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPXPCClientIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKSPXPCClientIdentifier *)self uniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"uniqueIdentifier"];

  id v6 = [(HKSPXPCClientIdentifier *)self loggingIdentifier];
  [v4 encodeObject:v6 forKey:@"loggingIdentifier"];
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)loggingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HKSPXPCClientIdentifier)initWithUniqueIdentifier:(id)a3 loggingIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPXPCClientIdentifier;
  v8 = [(HKSPXPCClientIdentifier *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSUUID *)v9;

    uint64_t v11 = [v7 copy];
    loggingIdentifier = v8->_loggingIdentifier;
    v8->_loggingIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSPXPCClientIdentifier *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(HKSPXPCClientIdentifier *)self uniqueIdentifier];
      id v7 = [(HKSPXPCClientIdentifier *)v5 uniqueIdentifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (HKSPXPCClientIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loggingIdentifier"];

  id v7 = [(HKSPXPCClientIdentifier *)self initWithUniqueIdentifier:v5 loggingIdentifier:v6];
  return v7;
}

- (NSString)description
{
  return (NSString *)[(HKSPXPCClientIdentifier *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(HKSPXPCClientIdentifier *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(HKSPXPCClientIdentifier *)self uniqueIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"uuid" skipIfNil:1];

  id v6 = [(HKSPXPCClientIdentifier *)self loggingIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"id" skipIfNil:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPXPCClientIdentifier *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end