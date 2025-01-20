@interface SBSHomeScreenItemApplication
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (SBSHomeScreenItemApplication)initWithBSXPCCoder:(id)a3;
- (SBSHomeScreenItemApplication)initWithBundleIdentifier:(id)a3;
- (id)description;
- (int64_t)kind;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation SBSHomeScreenItemApplication

- (SBSHomeScreenItemApplication)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSHomeScreenItemApplication;
  v5 = [(SBSHomeScreenItemApplication *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (int64_t)kind
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSHomeScreenItemApplication;
  id v4 = a3;
  [(SBSHomeScreenItem *)&v5 encodeWithBSXPCCoder:v4];
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier" in:v5.receiver super:v5.super_class];
}

- (SBSHomeScreenItemApplication)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSHomeScreenItemApplication;
  objc_super v5 = [(SBSHomeScreenItem *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = (id)[v3 appendObject:self->_bundleIdentifier];
  v8.receiver = self;
  v8.super_class = (Class)SBSHomeScreenItemApplication;
  unint64_t v5 = [(SBSHomeScreenItem *)&v8 hash];
  unint64_t v6 = [v3 hash] ^ v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  bundleIdentifier = self->_bundleIdentifier;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__SBSHomeScreenItemApplication_isEqual___block_invoke;
  v12[3] = &unk_1E566B958;
  id v7 = v4;
  id v13 = v7;
  id v8 = (id)[v5 appendObject:bundleIdentifier counterpart:v12];
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenItemApplication;
  if ([(SBSHomeScreenItem *)&v11 isEqual:v7]) {
    char v9 = [v5 isEqual];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

id __40__SBSHomeScreenItemApplication_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_bundleIdentifier withName:@"bundleIdentifier"];
  unint64_t v5 = [v3 build];

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end