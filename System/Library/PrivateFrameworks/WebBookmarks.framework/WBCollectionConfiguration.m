@interface WBCollectionConfiguration
+ (id)debugTabCollectionConfiguration;
+ (id)inMemoryBookmarkCollectionConfiguration;
+ (id)inMemoryTabCollectionConfiguration;
+ (id)pptTabCollectionConfiguration;
+ (id)readonlySafariBookmarkCollectionConfiguration;
+ (id)readonlySafariTabCollectionConfiguration;
+ (id)safariBookmarkCollectionConfiguration;
+ (id)safariTabCollectionConfiguration;
+ (id)sharedInMemoryTabCollectionConfiguration;
+ (id)sharedInMemoryTabCollectionConfigurationWithIdentifier:(id)a3;
- (BOOL)createIfNeeded;
- (BOOL)isInMemoryDatabase;
- (BOOL)isReadonly;
- (BOOL)skipsExternalNotifications;
- (NSString)databasePath;
- (NSString)identifier;
- (WBCollectionConfiguration)initWithCollectionType:(int64_t)a3 databasePath:(id)a4 readonly:(BOOL)a5;
- (WBCollectionConfiguration)initWithCollectionType:(int64_t)a3 databasePath:(id)a4 readonly:(BOOL)a5 createIfNeeded:(BOOL)a6;
- (WBSDevice)device;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)collectionType;
- (int64_t)storeOwner;
- (unint64_t)maximumTabsPerTabGroup;
- (void)setDevice:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaximumTabsPerTabGroup:(unint64_t)a3;
- (void)setSkipsExternalNotifications:(BOOL)a3;
- (void)setStoreOwner:(int64_t)a3;
@end

@implementation WBCollectionConfiguration

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (BOOL)isInMemoryDatabase
{
  if ([(NSString *)self->_databasePath isEqualToString:@":memory:"]) {
    return 1;
  }
  databasePath = self->_databasePath;
  return [(NSString *)databasePath containsString:@"mode=memory"];
}

- (BOOL)isReadonly
{
  return self->_isReadonly;
}

- (BOOL)createIfNeeded
{
  return self->_createIfNeeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (void)setMaximumTabsPerTabGroup:(unint64_t)a3
{
  self->_maximumTabsPerTabGroup = a3;
}

- (unint64_t)maximumTabsPerTabGroup
{
  return self->_maximumTabsPerTabGroup;
}

- (WBSDevice)device
{
  return self->_device;
}

- (BOOL)skipsExternalNotifications
{
  return self->_skipsExternalNotifications;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[WBCollectionConfiguration alloc] initWithCollectionType:self->_collectionType databasePath:self->_databasePath readonly:self->_isReadonly createIfNeeded:self->_createIfNeeded];
  [(WBCollectionConfiguration *)v4 setSkipsExternalNotifications:self->_skipsExternalNotifications];
  [(WBCollectionConfiguration *)v4 setStoreOwner:self->_storeOwner];
  [(WBCollectionConfiguration *)v4 setDevice:self->_device];
  [(WBCollectionConfiguration *)v4 setIdentifier:self->_identifier];
  return v4;
}

- (WBCollectionConfiguration)initWithCollectionType:(int64_t)a3 databasePath:(id)a4 readonly:(BOOL)a5 createIfNeeded:(BOOL)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBCollectionConfiguration;
  v11 = [(WBCollectionConfiguration *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_collectionType = a3;
    v11->_createIfNeeded = a6;
    uint64_t v13 = [v10 copy];
    databasePath = v12->_databasePath;
    v12->_databasePath = (NSString *)v13;

    v12->_isReadonly = a5;
    v12->_skipsExternalNotifications = a3 == 1;
    v12->_storeOwner = 0;
    v15 = v12;
  }

  return v12;
}

- (void)setSkipsExternalNotifications:(BOOL)a3
{
  self->_skipsExternalNotifications = a3;
}

- (void)setDevice:(id)a3
{
}

- (void)setStoreOwner:(int64_t)a3
{
  self->_storeOwner = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)storeOwner
{
  return self->_storeOwner;
}

+ (id)safariBookmarkCollectionConfiguration
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCollectionType:0 databasePath:0 readonly:0];
  return v2;
}

+ (id)safariTabCollectionConfiguration
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCollectionType:1 databasePath:0 readonly:0];
  v3 = [MEMORY[0x263F66290] currentDevice];
  [v2 setDevice:v3];

  return v2;
}

+ (id)readonlySafariBookmarkCollectionConfiguration
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCollectionType:0 databasePath:0 readonly:1];
  return v2;
}

- (WBCollectionConfiguration)initWithCollectionType:(int64_t)a3 databasePath:(id)a4 readonly:(BOOL)a5
{
  return [(WBCollectionConfiguration *)self initWithCollectionType:a3 databasePath:a4 readonly:a5 createIfNeeded:!a5];
}

+ (id)inMemoryBookmarkCollectionConfiguration
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCollectionType:0 databasePath:@":memory:" readonly:0];
  return v2;
}

+ (id)readonlySafariTabCollectionConfiguration
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCollectionType:1 databasePath:0 readonly:1 createIfNeeded:1];
  v3 = [MEMORY[0x263F66290] currentDevice];
  [v2 setDevice:v3];

  return v2;
}

+ (id)inMemoryTabCollectionConfiguration
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCollectionType:1 databasePath:@":memory:" readonly:0];
  v3 = [MEMORY[0x263F66290] currentDevice];
  [v2 setDevice:v3];

  v4 = [MEMORY[0x263F08C38] UUID];
  v5 = [v4 UUIDString];
  [v2 setIdentifier:v5];

  return v2;
}

+ (id)sharedInMemoryTabCollectionConfiguration
{
  return (id)[a1 sharedInMemoryTabCollectionConfigurationWithIdentifier:@"default"];
}

+ (id)sharedInMemoryTabCollectionConfigurationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [NSString stringWithFormat:@"file:%@?mode=memory&cache=shared", v4];
  v7 = (void *)[v5 initWithCollectionType:1 databasePath:v6 readonly:0];

  v8 = [MEMORY[0x263F66290] currentDevice];
  [v7 setDevice:v8];

  [v7 setIdentifier:v4];
  return v7;
}

+ (id)pptTabCollectionConfiguration
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCollectionType:1 databasePath:@"/var/mobile/Library/Safari/SafariTabsPPT.db" readonly:1];
  v3 = [MEMORY[0x263F66290] currentDevice];
  [v2 setDevice:v3];

  return v2;
}

+ (id)debugTabCollectionConfiguration
{
  v2 = [a1 safariTabCollectionConfiguration];
  [v2 setStoreOwner:1];
  v3 = [MEMORY[0x263F66290] currentDevice];
  [v2 setDevice:v3];

  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

@end