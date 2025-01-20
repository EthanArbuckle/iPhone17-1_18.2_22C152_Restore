@interface DMDSetEffectivePolicyRequest
+ (BOOL)supportsSecureCoding;
- (DMDSetEffectivePolicyRequest)initWithCoder:(id)a3;
- (NSArray)identifiers;
- (NSString)declarationIdentifier;
- (NSString)organizationIdentifier;
- (NSString)type;
- (int64_t)policy;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setDeclarationIdentifier:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setType:(id)a3;
@end

@implementation DMDSetEffectivePolicyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMDSetEffectivePolicyRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMDSetEffectivePolicyRequest;
  v5 = [(DMDSetEffectivePolicyRequest *)&v22 initWithCoder:v4];
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

    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"policy"];
    v5->_policy = (int64_t)[v15 integerValue];

    uint64_t v16 = objc_opt_class();
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"identifiers"];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v18;

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priority"];
    v5->_priority = (unint64_t)[v20 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DMDSetEffectivePolicyRequest;
  id v4 = a3;
  [(DMDSetEffectivePolicyRequest *)&v11 encodeWithCoder:v4];
  v5 = [(DMDSetEffectivePolicyRequest *)self organizationIdentifier];
  [v4 encodeObject:v5 forKey:@"organizationIdentifier"];

  v6 = [(DMDSetEffectivePolicyRequest *)self declarationIdentifier];
  [v4 encodeObject:v6 forKey:@"declarationIdentifier"];

  uint64_t v7 = [(DMDSetEffectivePolicyRequest *)self type];
  [v4 encodeObject:v7 forKey:@"type"];

  v8 = +[NSNumber numberWithInteger:[(DMDSetEffectivePolicyRequest *)self policy]];
  [v4 encodeObject:v8 forKey:@"policy"];

  v9 = [(DMDSetEffectivePolicyRequest *)self identifiers];
  [v4 encodeObject:v9 forKey:@"identifiers"];

  uint64_t v10 = +[NSNumber numberWithUnsignedInteger:[(DMDSetEffectivePolicyRequest *)self priority]];
  [v4 encodeObject:v10 forKey:@"priority"];
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

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);

  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end