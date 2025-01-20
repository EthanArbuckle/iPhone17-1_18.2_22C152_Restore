@interface PDCloudStoreContainerConfiguration
+ (id)passSyncConfigWithDataSource:(id)a3;
+ (id)passSyncSecureConfigWithDataSource:(id)a3;
- (BOOL)canInitializeContainer;
- (BOOL)isEndToEndEncrypted;
- (NSArray)validScopes;
- (NSString)applicationBundleIdentifier;
- (NSString)containerIdentifier;
- (PDCloudStoreContainerConfiguration)initWithCanInitializeContainer:(BOOL)a3 isEndToEndEncrypted:(BOOL)a4 containerIdentifier:(id)a5 validScopes:(id)a6 environment:(int64_t)a7 applicationBundleIdenifier:(id)a8 dataSource:(id)a9;
- (PDCloudStoreContainerDatabaseDataSource)containerDatabaseDataSource;
- (PDCloudStoreDataSource)dataSource;
- (id)description;
- (id)logDescription;
- (id)stringPrefixedWithContainerName:(id)a3;
- (int64_t)environment;
- (void)setContainerDatabaseDataSource:(id)a3;
@end

@implementation PDCloudStoreContainerConfiguration

+ (id)passSyncConfigWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  if (PKIsPhone() & 1) != 0 || (PKIsWatch() & 1) != 0 || (PKIsPad() & 1) != 0 || (PKIsMac()) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = PKIsVision();
  }
  id v7 = [v5 initWithCanInitializeContainer:v6 isEndToEndEncrypted:0 containerIdentifier:PKCloudStorePassesSyncContainerName validScopes:&off_10078C468 environment:PKPassSyncContainerEnvironment() applicationBundleIdenifier:PKPassdBundleIdentifier dataSource:v4];

  return v7;
}

+ (id)passSyncSecureConfigWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  if (PKIsPhone() & 1) != 0 || (PKIsWatch() & 1) != 0 || (PKIsPad() & 1) != 0 || (PKIsMac()) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = PKIsVision();
  }
  id v7 = [v5 initWithCanInitializeContainer:v6 isEndToEndEncrypted:1 containerIdentifier:PKCloudStorePassesSyncSecureContainerName validScopes:&off_10078C480 environment:PKPassSyncSecureContainerEnvironment() applicationBundleIdenifier:PKPassdBundleIdentifier dataSource:v4];

  return v7;
}

- (PDCloudStoreContainerConfiguration)initWithCanInitializeContainer:(BOOL)a3 isEndToEndEncrypted:(BOOL)a4 containerIdentifier:(id)a5 validScopes:(id)a6 environment:(int64_t)a7 applicationBundleIdenifier:(id)a8 dataSource:(id)a9
{
  id v22 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)PDCloudStoreContainerConfiguration;
  v18 = [(PDCloudStoreContainerConfiguration *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_canInitializeContainer = a3;
    v18->_isEndToEndEncrypted = a4;
    objc_storeStrong((id *)&v18->_containerIdentifier, a5);
    objc_storeStrong((id *)&v19->_validScopes, a6);
    v19->_environment = a7;
    objc_storeStrong((id *)&v19->_applicationBundleIdentifier, a8);
    objc_storeStrong((id *)&v19->_dataSource, a9);
  }

  return v19;
}

- (id)logDescription
{
  if (self->_isEndToEndEncrypted) {
    return @"SyncSecure";
  }
  else {
    return @"Sync";
  }
}

- (id)stringPrefixedWithContainerName:(id)a3
{
  return [(NSString *)self->_containerIdentifier stringByAppendingString:a3];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = +[NSNumber numberWithBool:self->_canInitializeContainer];
  [v3 appendFormat:@"canInitializeContainer: %@", v4];

  id v5 = +[NSNumber numberWithBool:self->_isEndToEndEncrypted];
  [v3 appendFormat:@"isEndToEndEncrypted: %@", v5];

  [v3 appendFormat:@"containerIdentifier: %@", self->_containerIdentifier];
  [v3 appendFormat:@"validScopes: %@", self->_validScopes];
  uint64_t v6 = +[NSNumber numberWithInteger:self->_environment];
  [v3 appendFormat:@"environment: %@", v6];

  [v3 appendFormat:@"applicationBundleIdenifier: %@", self->_applicationBundleIdentifier];
  [v3 appendFormat:@"dataSource: %@", self->_dataSource];
  id v7 = [v3 copy];

  return v7;
}

- (BOOL)canInitializeContainer
{
  return self->_canInitializeContainer;
}

- (BOOL)isEndToEndEncrypted
{
  return self->_isEndToEndEncrypted;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSArray)validScopes
{
  return self->_validScopes;
}

- (int64_t)environment
{
  return self->_environment;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (PDCloudStoreDataSource)dataSource
{
  return self->_dataSource;
}

- (PDCloudStoreContainerDatabaseDataSource)containerDatabaseDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDatabaseDataSource);
  return (PDCloudStoreContainerDatabaseDataSource *)WeakRetained;
}

- (void)setContainerDatabaseDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerDatabaseDataSource);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_validScopes, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end