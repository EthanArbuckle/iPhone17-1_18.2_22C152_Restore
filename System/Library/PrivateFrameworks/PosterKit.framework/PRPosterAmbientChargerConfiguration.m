@interface PRPosterAmbientChargerConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)decodeObjectWithJSON:(id)a3;
- (BOOL)isAssociatedWithChargerIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChargerConfiguration:(id)a3;
- (NSSet)associatedChargerIdentifiers;
- (NSString)attributeType;
- (NSString)description;
- (PRPosterAmbientChargerConfiguration)init;
- (PRPosterAmbientChargerConfiguration)initWithAssociatedChargerIdentifiers:(id)a3;
- (PRPosterAmbientChargerConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterAmbientChargerConfiguration)initWithCoder:(id)a3;
- (id)encodeJSON;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedChargerIdentifiers:(id)a3;
@end

@implementation PRPosterAmbientChargerConfiguration

- (PRPosterAmbientChargerConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)PRPosterAmbientChargerConfiguration;
  v2 = [(PRPosterAmbientChargerConfiguration *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    associatedChargerIdentifiers = v2->_associatedChargerIdentifiers;
    v2->_associatedChargerIdentifiers = (NSSet *)v3;
  }
  return v2;
}

- (PRPosterAmbientChargerConfiguration)initWithAssociatedChargerIdentifiers:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRPosterAmbientChargerConfiguration;
  v5 = [(PRPosterAmbientChargerConfiguration *)&v11 init];
  if (v5)
  {
    objc_super v6 = (void *)[v4 copy];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CAD0] set];
    }
    associatedChargerIdentifiers = v5->_associatedChargerIdentifiers;
    v5->_associatedChargerIdentifiers = v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterAmbientChargerConfiguration *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0
      && [(PRPosterAmbientChargerConfiguration *)self isEqualToChargerConfiguration:v4];
  }

  return v7;
}

- (BOOL)isEqualToChargerConfiguration:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  else {
    return [*((id *)a3 + 1) isEqualToSet:self->_associatedChargerIdentifiers];
  }
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NSSet *)self->_associatedChargerIdentifiers allObjects];
  v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  [v3 appendArraySection:v5 withName:@"associatedChargerIdentifiers" skipIfEmpty:1];
  objc_super v6 = [v3 build];

  return (NSString *)v6;
}

- (BOOL)isAssociatedWithChargerIdentifier:(id)a3
{
  return [(NSSet *)self->_associatedChargerIdentifiers containsObject:a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PRMutablePosterAmbientChargerConfiguration allocWithZone:a3];
  associatedChargerIdentifiers = self->_associatedChargerIdentifiers;
  return [(PRPosterAmbientChargerConfiguration *)v4 initWithAssociatedChargerIdentifiers:associatedChargerIdentifiers];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterAmbientChargerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRPosterAmbientChargerConfiguration;
  v5 = [(PRPosterAmbientChargerConfiguration *)&v12 init];
  if (v5)
  {
    objc_super v6 = self;
    BOOL v7 = [v4 decodeObjectOfClass:v6 forKey:@"_associatedChargerIdentifiers"];
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CAD0] set];
    }
    associatedChargerIdentifiers = v5->_associatedChargerIdentifiers;
    v5->_associatedChargerIdentifiers = v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  associatedChargerIdentifiers = self->_associatedChargerIdentifiers;
  if (associatedChargerIdentifiers)
  {
    id v6 = a3;
    [v6 encodeObject:associatedChargerIdentifiers forKey:@"_associatedChargerIdentifiers"];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = a3;
    id v6 = [v4 set];
    objc_msgSend(v5, "encodeObject:forKey:");
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterAmbientChargerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PRPosterAmbientChargerConfiguration;
  id v5 = [(PRPosterAmbientChargerConfiguration *)&v10 init];
  if (v5)
  {
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_associatedChargerIdentifiers"];
    associatedChargerIdentifiers = v5->_associatedChargerIdentifiers;
    v5->_associatedChargerIdentifiers = (NSSet *)v7;
  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (id)encodeJSON
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PRPosterAmbientChargerConfiguration *)self associatedChargerIdentifiers];
  id v5 = [v4 allObjects];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, @"associatedChargerIdentifiers");

  id v6 = [(PRPosterAmbientChargerConfiguration *)self attributeType];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, @"attributeType");

  id v11 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v11];
  id v8 = v11;
  if (v8)
  {
    v9 = PRLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(PRPosterMetadata *)(uint64_t)self encodeJSON];
    }
  }
  return v7;
}

+ (id)decodeObjectWithJSON:(id)a3
{
  id v10 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v10];
  id v4 = v10;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !v4)
  {
    id v5 = [v3 objectForKey:@"associatedChargerIdentifiers"];
    id v6 = objc_alloc((Class)objc_opt_class());
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    id v8 = (void *)[v6 initWithAssociatedChargerIdentifiers:v7];
  }
  else
  {
    id v5 = PRLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PRPosterMetadata decodeObjectWithJSON:]((uint64_t)v4, v5);
    }
    id v8 = 0;
  }

  return v8;
}

- (NSString)attributeType
{
  return (NSString *)@"PRPosterRoleAttributeTypeAmbientChargerConfiguration";
}

- (NSSet)associatedChargerIdentifiers
{
  return self->_associatedChargerIdentifiers;
}

- (void)setAssociatedChargerIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end