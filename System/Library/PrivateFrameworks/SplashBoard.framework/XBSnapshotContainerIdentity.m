@interface XBSnapshotContainerIdentity
+ (id)identityForApplicationInfo:(id)a3;
+ (id)identityForApplicationRecord:(id)a3;
+ (id)identityForBundleProxy:(id)a3;
+ (id)identityForCompatibilityInfo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleContainerPath;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)dataContainerPath;
- (NSString)snapshotContainerPath;
- (XBSnapshotContainerIdentity)init;
- (id)_initWithBundleIdentifier:(id)a3 bundlePath:(id)a4 dataContainerPath:(id)a5 bundleContainerPath:(id)a6;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)snapshotContainerPathForGroupID:(id)a3;
- (id)snapshotContainerPathForSnapshot:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation XBSnapshotContainerIdentity

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (XBSnapshotContainerIdentity)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"XBSnapshotContainerIdentity.m" lineNumber:31 description:@"this constructor is disallowed"];

  return (XBSnapshotContainerIdentity *)[(XBSnapshotContainerIdentity *)self _initWithBundleIdentifier:0 bundlePath:0 dataContainerPath:0 bundleContainerPath:0];
}

- (id)_initWithBundleIdentifier:(id)a3 bundlePath:(id)a4 dataContainerPath:(id)a5 bundleContainerPath:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"XBSnapshotContainerIdentity.m", 39, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)XBSnapshotContainerIdentity;
  v15 = [(XBSnapshotContainerIdentity *)&v29 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    bundleIdentifier = v15->_bundleIdentifier;
    v15->_bundleIdentifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    bundlePath = v15->_bundlePath;
    v15->_bundlePath = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    dataContainerPath = v15->_dataContainerPath;
    v15->_dataContainerPath = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    bundleContainerPath = v15->_bundleContainerPath;
    v15->_bundleContainerPath = (NSString *)v22;

    v24 = XBSnapshotPathForBundleIdentifierWithSandboxPath(v15->_bundleIdentifier, v15->_dataContainerPath);
    uint64_t v25 = [v24 copy];
    snapshotContainerPath = v15->_snapshotContainerPath;
    v15->_snapshotContainerPath = (NSString *)v25;
  }
  return v15;
}

+ (id)identityForApplicationRecord:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"XBSnapshotContainerIdentity.m", 54, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  v6 = [XBSnapshotContainerIdentity alloc];
  v7 = [v5 bundleIdentifier];
  v8 = [v5 URL];
  v9 = [v8 path];
  v10 = [v5 dataContainerURL];
  id v11 = [v10 path];
  id v12 = [v5 bundleContainerURL];
  id v13 = [v12 path];
  id v14 = [(XBSnapshotContainerIdentity *)v6 _initWithBundleIdentifier:v7 bundlePath:v9 dataContainerPath:v11 bundleContainerPath:v13];

  return v14;
}

+ (id)identityForBundleProxy:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"XBSnapshotContainerIdentity.m", 63, @"Invalid parameter not satisfying: %@", @"proxy" object file lineNumber description];
  }
  v6 = [XBSnapshotContainerIdentity alloc];
  v7 = [v5 bundleIdentifier];
  v8 = [v5 bundleURL];
  v9 = [v8 path];
  v10 = [v5 dataContainerURL];
  id v11 = [v10 path];
  id v12 = [v5 bundleContainerURL];
  id v13 = [v12 path];
  id v14 = [(XBSnapshotContainerIdentity *)v6 _initWithBundleIdentifier:v7 bundlePath:v9 dataContainerPath:v11 bundleContainerPath:v13];

  return v14;
}

+ (id)identityForApplicationInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [XBSnapshotContainerIdentity alloc];
    id v5 = [v3 bundleIdentifier];
    v6 = [v3 bundleURL];
    v7 = [v6 path];
    v8 = [v3 dataContainerURL];
    v9 = [v8 path];
    v10 = [v3 bundleContainerURL];

    id v11 = [v10 path];
    id v12 = [(XBSnapshotContainerIdentity *)v4 _initWithBundleIdentifier:v5 bundlePath:v7 dataContainerPath:v9 bundleContainerPath:v11];
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

+ (id)identityForCompatibilityInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [XBSnapshotContainerIdentity alloc];
    id v5 = [v3 bundleIdentifier];
    v6 = [v3 bundlePath];
    v7 = [v3 sandboxPath];
    v8 = [v3 bundleContainerPath];

    id v9 = [(XBSnapshotContainerIdentity *)v4 _initWithBundleIdentifier:v5 bundlePath:v6 dataContainerPath:v7 bundleContainerPath:v8];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)snapshotContainerPathForGroupID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(XBSnapshotContainerIdentity *)self snapshotContainerPath];
    v6 = [v5 stringByAppendingPathComponent:v4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)snapshotContainerPathForSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 groupID];
    v7 = [(XBSnapshotContainerIdentity *)self snapshotContainerPathForGroupID:v6];

    v8 = [v5 variantID];

    if (v8)
    {
      id v9 = [v5 variantID];
      uint64_t v10 = [v7 stringByAppendingPathComponent:v9];

      v7 = (void *)v10;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x263F3F670] builder];
  id v4 = (id)[v3 appendObject:self->_bundleIdentifier];
  id v5 = (id)[v3 appendObject:self->_bundlePath];
  id v6 = (id)[v3 appendObject:self->_dataContainerPath];
  id v7 = (id)[v3 appendObject:self->_bundleContainerPath];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (XBSnapshotContainerIdentity *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(XBSnapshotContainerIdentity *)v4 bundleIdentifier];
      if (BSEqualStrings())
      {
        id v6 = [(XBSnapshotContainerIdentity *)v4 bundlePath];
        if (BSEqualStrings())
        {
          id v7 = [(XBSnapshotContainerIdentity *)v4 dataContainerPath];
          if (BSEqualStrings())
          {
            unint64_t v8 = [(XBSnapshotContainerIdentity *)v4 bundleContainerPath];
            char v9 = BSEqualStrings();
          }
          else
          {
            char v9 = 0;
          }
        }
        else
        {
          char v9 = 0;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  return [(XBSnapshotContainerIdentity *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(XBSnapshotContainerIdentity *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_bundleIdentifier withName:@"identifier"];
  id v5 = (id)[v3 appendBool:self->_dataContainerPath != 0 withName:@"sandboxed"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(XBSnapshotContainerIdentity *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(XBSnapshotContainerIdentity *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__XBSnapshotContainerIdentity_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2646A5BC0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __69__XBSnapshotContainerIdentity_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"bundlePath"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"bundleContainerPath"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"dataContainerPath"];
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)dataContainerPath
{
  return self->_dataContainerPath;
}

- (NSString)bundleContainerPath
{
  return self->_bundleContainerPath;
}

- (NSString)snapshotContainerPath
{
  return self->_snapshotContainerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotContainerPath, 0);
  objc_storeStrong((id *)&self->_bundleContainerPath, 0);
  objc_storeStrong((id *)&self->_dataContainerPath, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end