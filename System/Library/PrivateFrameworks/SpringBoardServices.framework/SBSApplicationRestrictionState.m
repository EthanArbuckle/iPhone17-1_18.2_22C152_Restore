@interface SBSApplicationRestrictionState
+ (BOOL)supportsSecureCoding;
- (NSSet)allowedBundleIdentifiers;
- (NSSet)restrictedBundleIdentifiers;
- (SBSApplicationRestrictionState)initWithAllowedIdentifiers:(id)a3 restrictedIdentifiers:(id)a4;
- (SBSApplicationRestrictionState)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSApplicationRestrictionState

- (SBSApplicationRestrictionState)initWithAllowedIdentifiers:(id)a3 restrictedIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSApplicationRestrictionState;
  v8 = [(SBSApplicationRestrictionState *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    allowedBundleIdentifiers = v8->_allowedBundleIdentifiers;
    v8->_allowedBundleIdentifiers = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    restrictedBundleIdentifiers = v8->_restrictedBundleIdentifiers;
    v8->_restrictedBundleIdentifiers = (NSSet *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  allowedBundleIdentifiers = self->_allowedBundleIdentifiers;
  id v5 = a3;
  [v5 encodeObject:allowedBundleIdentifiers forKey:@"allowedBundleIdentifiers"];
  [v5 encodeObject:self->_restrictedBundleIdentifiers forKey:@"restrictedBundleIdentifiers"];
}

- (SBSApplicationRestrictionState)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = self;
  id v7 = self;
  v8 = [v4 setWithObjects:v6, v7];
  uint64_t v9 = [v5 decodeObjectOfClasses:v8 forKey:@"allowedBundleIdentifiers"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = self;
  v12 = self;
  v13 = [v10 setWithObjects:v11, v12];
  objc_super v14 = [v5 decodeObjectOfClasses:v13 forKey:@"restrictedBundleIdentifiers"];

  v15 = [(SBSApplicationRestrictionState *)self initWithAllowedIdentifiers:v9 restrictedIdentifiers:v14];
  return v15;
}

- (NSSet)allowedBundleIdentifiers
{
  return self->_allowedBundleIdentifiers;
}

- (NSSet)restrictedBundleIdentifiers
{
  return self->_restrictedBundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedBundleIdentifiers, 0);
}

@end