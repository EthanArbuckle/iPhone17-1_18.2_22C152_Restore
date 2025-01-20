@interface SPSharedSecretsDataCheck
+ (BOOL)supportsSecureCoding;
- (NSArray)secrets;
- (SPDataIntegrityCheck)completeness;
- (SPSharedSecretsDataCheck)initWithCoder:(id)a3;
- (SPSharedSecretsDataCheck)initWithCompleteness:(id)a3 secrets:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCompleteness:(id)a3;
- (void)setSecrets:(id)a3;
@end

@implementation SPSharedSecretsDataCheck

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSharedSecretsDataCheck)initWithCompleteness:(id)a3 secrets:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPSharedSecretsDataCheck;
  v9 = [(SPSharedSecretsDataCheck *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_completeness, a3);
    objc_storeStrong((id *)&v10->_secrets, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPSharedSecretsDataCheck alloc];
  v5 = [(SPSharedSecretsDataCheck *)self completeness];
  v6 = [(SPSharedSecretsDataCheck *)self secrets];
  id v7 = [(SPSharedSecretsDataCheck *)v4 initWithCompleteness:v5 secrets:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  completeness = self->_completeness;
  id v5 = a3;
  [v5 encodeObject:completeness forKey:@"completeness"];
  [v5 encodeObject:self->_secrets forKey:@"secrets"];
}

- (SPSharedSecretsDataCheck)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completeness"];
  completeness = self->_completeness;
  self->_completeness = v5;

  id v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"secrets"];

  secrets = self->_secrets;
  self->_secrets = v7;

  return self;
}

- (SPDataIntegrityCheck)completeness
{
  return self->_completeness;
}

- (void)setCompleteness:(id)a3
{
}

- (NSArray)secrets
{
  return self->_secrets;
}

- (void)setSecrets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secrets, 0);

  objc_storeStrong((id *)&self->_completeness, 0);
}

@end