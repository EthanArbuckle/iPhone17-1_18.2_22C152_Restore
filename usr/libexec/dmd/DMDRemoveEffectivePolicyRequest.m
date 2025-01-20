@interface DMDRemoveEffectivePolicyRequest
+ (BOOL)supportsSecureCoding;
- (DMDRemoveEffectivePolicyRequest)initWithCoder:(id)a3;
- (NSString)declarationIdentifier;
- (NSString)organizationIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setDeclarationIdentifier:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
@end

@implementation DMDRemoveEffectivePolicyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMDRemoveEffectivePolicyRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMDRemoveEffectivePolicyRequest;
  v5 = [(DMDRemoveEffectivePolicyRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"organizationIdentifier"];
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v7;

    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"declarationIdentifier"];
    declarationIdentifier = v5->_declarationIdentifier;
    v5->_declarationIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMDRemoveEffectivePolicyRequest;
  id v4 = a3;
  [(DMDRemoveEffectivePolicyRequest *)&v7 encodeWithCoder:v4];
  v5 = [(DMDRemoveEffectivePolicyRequest *)self organizationIdentifier];
  [v4 encodeObject:v5 forKey:@"organizationIdentifier"];

  v6 = [(DMDRemoveEffectivePolicyRequest *)self declarationIdentifier];
  [v4 encodeObject:v6 forKey:@"declarationIdentifier"];
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (void)setDeclarationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);

  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end