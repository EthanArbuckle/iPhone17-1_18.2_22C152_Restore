@interface SBSwitcherShelf
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (SBSwitcherShelf)initWithBundleIdentifier:(id)a3 layoutRole:(int64_t)a4 displayMode:(unint64_t)a5;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)layoutRole;
- (unint64_t)displayMode;
- (unint64_t)hash;
- (unint64_t)switcherLayoutElementType;
@end

@implementation SBSwitcherShelf

- (SBSwitcherShelf)initWithBundleIdentifier:(id)a3 layoutRole:(int64_t)a4 displayMode:(unint64_t)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSwitcherShelf;
  v10 = [(SBSwitcherShelf *)&v17 init];
  if (v10)
  {
    if (!v9)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v10, @"SBSwitcherShelf.m", 25, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
    }
    uint64_t v11 = [v9 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    v10->_layoutRole = a4;
    v10->_displayMode = a5;
    uint64_t v13 = [NSString stringWithFormat:@"%@-%ld-%ld", v10->_bundleIdentifier, a4, a5];
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSString *)v13;
  }
  return v10;
}

- (unint64_t)switcherLayoutElementType
{
  return 7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSwitcherShelf *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      v6 = [(SBSwitcherShelf *)v4 uniqueIdentifier];
      char v7 = [(NSString *)uniqueIdentifier isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uniqueIdentifier hash];
}

- (NSString)description
{
  return (NSString *)[(SBSwitcherShelf *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSwitcherShelf *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(SBSwitcherShelf *)self bundleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"bundleIdentifier"];

  v6 = [(SBSwitcherShelf *)self uniqueIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"uniqueIdentifier"];

  v8 = SBLayoutRoleDescription([(SBSwitcherShelf *)self layoutRole]);
  id v9 = (id)[v3 appendObject:v8 withName:@"layoutRole"];

  if ([(SBSwitcherShelf *)self displayMode]) {
    v10 = @"scenes";
  }
  else {
    v10 = @"spaces";
  }
  id v11 = (id)[v3 appendObject:v10 withName:@"displayMode"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSwitcherShelf *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end