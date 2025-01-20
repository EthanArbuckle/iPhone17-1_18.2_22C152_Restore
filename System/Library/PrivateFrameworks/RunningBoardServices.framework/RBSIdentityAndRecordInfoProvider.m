@interface RBSIdentityAndRecordInfoProvider
+ (id)_providerWithIdentity:(id)a3 record:(id)a4;
- (id)_initWithIdentity:(id)a3 record:(id)a4;
- (id)fetchWrappedInfoWithError:(id *)a3;
@end

@implementation RBSIdentityAndRecordInfoProvider

- (id)_initWithIdentity:(id)a3 record:(id)a4
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
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"RBSProcessIdentity.m", 42, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"RBSProcessIdentity.m", 43, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];

LABEL_3:
  v10 = [(RBSIdentityAndRecordInfoProvider *)self init];
  if (v10)
  {
    uint64_t v11 = [v7 personaUniqueString];
    personaString = v10->_personaString;
    v10->_personaString = (NSString *)v11;

    uint64_t v13 = [v9 bundleIdentifier];
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)v13;

    uint64_t v15 = [v9 jobLabel];
    persistentJobLabel = v10->_persistentJobLabel;
    v10->_persistentJobLabel = (NSString *)v15;

    v10->_platform = [v9 platform];
  }

  return v10;
}

+ (id)_providerWithIdentity:(id)a3 record:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[RBSIdentityAndRecordInfoProvider alloc] _initWithIdentity:v6 record:v5];

  return v7;
}

- (id)fetchWrappedInfoWithError:(id *)a3
{
  return +[RBSWrappedLSInfo infoWithBundleID:self->_bundleID personaString:self->_personaString persistentJobLabel:self->_persistentJobLabel platform:self->_platform bundleInode:self->_bundleInode execInode:self->_execInode];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentJobLabel, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_personaString, 0);
}

@end