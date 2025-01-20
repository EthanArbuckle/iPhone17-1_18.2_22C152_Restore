@interface XBSnapshotManifestIdentity
+ (id)identityWithBundleIdentifier:(id)a3 store:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)defaultGroupIdentifier;
- (XBSnapshotManifestIdentity)init;
- (XBSnapshotManifestIdentity)initWithBundleIdentifier:(id)a3 store:(id)a4;
- (XBSnapshotManifestStore)store;
- (id)description;
- (unint64_t)hash;
@end

@implementation XBSnapshotManifestIdentity

- (XBSnapshotManifestStore)store
{
  return self->_store;
}

- (NSString)defaultGroupIdentifier
{
  return (NSString *)[NSString stringWithFormat:@"%@ - {DEFAULT GROUP}", self->_bundleIdentifier];
}

+ (id)identityWithBundleIdentifier:(id)a3 store:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[XBSnapshotManifestIdentity alloc] initWithBundleIdentifier:v6 store:v5];

  return v7;
}

- (XBSnapshotManifestIdentity)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"XBSnapshotManifestIdentity.m" lineNumber:30 description:@"init is not allowed"];

  return 0;
}

- (XBSnapshotManifestIdentity)initWithBundleIdentifier:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"XBSnapshotManifestIdentity.m", 35, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"XBSnapshotManifestIdentity.m", 36, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)XBSnapshotManifestIdentity;
  v10 = [(XBSnapshotManifestIdentity *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_store, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  [v3 appendString:self->_bundleIdentifier withName:@"bundleIdentifier"];
  id v4 = (id)[v3 appendObject:self->_store withName:@"store"];
  id v5 = [v3 build];

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F3F670] builder];
  id v4 = (id)[v3 appendObject:self->_bundleIdentifier];
  id v5 = (id)[v3 appendObject:self->_store];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (XBSnapshotManifestIdentity *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    id v5 = [MEMORY[0x263F3F668] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    bundleIdentifier = self->_bundleIdentifier;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __38__XBSnapshotManifestIdentity_isEqual___block_invoke;
    v18[3] = &unk_2646A5A98;
    id v7 = v4;
    v19 = v7;
    id v8 = (id)[v5 appendString:bundleIdentifier counterpart:v18];
    store = self->_store;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __38__XBSnapshotManifestIdentity_isEqual___block_invoke_2;
    objc_super v16 = &unk_2646A5AC0;
    v17 = v7;
    id v10 = (id)[v5 appendObject:store counterpart:&v13];
    char v11 = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);
  }
  return v11;
}

uint64_t __38__XBSnapshotManifestIdentity_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

uint64_t __38__XBSnapshotManifestIdentity_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) store];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end