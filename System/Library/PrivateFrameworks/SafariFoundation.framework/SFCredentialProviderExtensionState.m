@interface SFCredentialProviderExtensionState
+ (BOOL)supportsSecureCoding;
+ (id)credentialProviderExtensionWithDisabledState;
- (BOOL)isEnabled;
- (BOOL)supportsIncrementalUpdates;
- (NSString)localizedDisplayName;
- (NSString)providerBundleID;
- (SFCredentialProviderExtensionState)initWithCoder:(id)a3;
- (SFCredentialProviderExtensionState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4;
- (SFCredentialProviderExtensionState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4 localizedDisplayName:(id)a5 credentialIdentityStoreIdentifier:(id)a6 providerBundleID:(id)a7;
- (SFCredentialProviderExtensionState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4 localizedDisplayName:(id)a5 providerBundleID:(id)a6;
- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFCredentialProviderExtensionState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)credentialProviderExtensionWithDisabledState
{
  v2 = (void *)[objc_alloc((Class)a1) initWithEnabledState:0 supportsIncrementalUpdates:0];
  return v2;
}

- (SFCredentialProviderExtensionState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4
{
  return [(SFCredentialProviderExtensionState *)self initWithEnabledState:a3 supportsIncrementalUpdates:a4 localizedDisplayName:0 credentialIdentityStoreIdentifier:0 providerBundleID:0];
}

- (SFCredentialProviderExtensionState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4 localizedDisplayName:(id)a5 providerBundleID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SFCredentialProviderExtensionState;
  v12 = [(SFCredentialProviderExtensionState *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_enabled = a3;
    v12->_supportsIncrementalUpdates = a4;
    uint64_t v14 = [v10 copy];
    localizedDisplayName = v13->_localizedDisplayName;
    v13->_localizedDisplayName = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    providerBundleID = v13->_providerBundleID;
    v13->_providerBundleID = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (SFCredentialProviderExtensionState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4 localizedDisplayName:(id)a5 credentialIdentityStoreIdentifier:(id)a6 providerBundleID:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SFCredentialProviderExtensionState;
  v15 = [(SFCredentialProviderExtensionState *)&v25 init];
  uint64_t v16 = v15;
  if (v15)
  {
    v15->_enabled = a3;
    v15->_supportsIncrementalUpdates = a4;
    uint64_t v17 = [v12 copy];
    localizedDisplayName = v16->_localizedDisplayName;
    v16->_localizedDisplayName = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    credentialIdentityStoreIdentifier = v16->_credentialIdentityStoreIdentifier;
    v16->_credentialIdentityStoreIdentifier = (SFExternalCredentialIdentityStoreIdentifier *)v19;

    uint64_t v21 = [v14 copy];
    providerBundleID = v16->_providerBundleID;
    v16->_providerBundleID = (NSString *)v21;

    v23 = v16;
  }

  return v16;
}

- (SFCredentialProviderExtensionState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"enabled"];
  uint64_t v6 = [v4 decodeBoolForKey:@"supportsIncrementalUpdates"];
  uint64_t v7 = objc_opt_class();
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"localizedDisplayName"];
  v9 = [v4 decodeObjectOfClass:v7 forKey:@"credentialIdentityStoreIdentifier"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerBundleID"];

  id v11 = [(SFCredentialProviderExtensionState *)self initWithEnabledState:v5 supportsIncrementalUpdates:v6 localizedDisplayName:v8 credentialIdentityStoreIdentifier:v9 providerBundleID:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL enabled = self->_enabled;
  id v5 = a3;
  [v5 encodeBool:enabled forKey:@"enabled"];
  [v5 encodeBool:self->_supportsIncrementalUpdates forKey:@"supportsIncrementalUpdates"];
  [v5 encodeObject:self->_localizedDisplayName forKey:@"localizedDisplayName"];
  [v5 encodeObject:self->_credentialIdentityStoreIdentifier forKey:@"credentialIdentityStoreIdentifier"];
  [v5 encodeObject:self->_providerBundleID forKey:@"providerBundleID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  BOOL enabled = self->_enabled;
  BOOL supportsIncrementalUpdates = self->_supportsIncrementalUpdates;
  localizedDisplayName = self->_localizedDisplayName;
  credentialIdentityStoreIdentifier = self->_credentialIdentityStoreIdentifier;
  providerBundleID = self->_providerBundleID;
  return (id)[v4 initWithEnabledState:enabled supportsIncrementalUpdates:supportsIncrementalUpdates localizedDisplayName:localizedDisplayName credentialIdentityStoreIdentifier:credentialIdentityStoreIdentifier providerBundleID:providerBundleID];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)supportsIncrementalUpdates
{
  return self->_supportsIncrementalUpdates;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier
{
  return self->_credentialIdentityStoreIdentifier;
}

- (NSString)providerBundleID
{
  return self->_providerBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleID, 0);
  objc_storeStrong((id *)&self->_credentialIdentityStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end