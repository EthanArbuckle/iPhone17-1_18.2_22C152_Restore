@interface SBHTestAppIconDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)sbh_isValidWithError:(id *)a3;
- (NSString)bundleIdentifier;
- (SBHTestAppIconDescriptor)init;
- (SBHTestAppIconDescriptor)initWithAppIconBundleIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)sbh_iconDescriptorType;
@end

@implementation SBHTestAppIconDescriptor

- (SBHTestAppIconDescriptor)initWithAppIconBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHTestAppIconDescriptor;
  v5 = [(SBHTestAppIconDescriptor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (SBHTestAppIconDescriptor)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  bundleIdentifier = self->_bundleIdentifier;
  return (id)[v4 initWithAppIconBundleIdentifier:bundleIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBHTestAppIconDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [(SBHTestAppIconDescriptor *)v5 bundleIdentifier];
    char v7 = [v6 isEqual:self->_bundleIdentifier];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)sbh_isValidWithError:(id *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:self->_bundleIdentifier allowPlaceholder:0 error:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 applicationState];
    char v6 = [v5 isValid];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)sbh_iconDescriptorType
{
  return 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end