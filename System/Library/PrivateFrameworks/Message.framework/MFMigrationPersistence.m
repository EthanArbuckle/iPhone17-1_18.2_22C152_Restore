@interface MFMigrationPersistence
+ (BOOL)migrateDatabaseAtPath:(id)a3;
- (BOOL)canRegisterForAPSPush;
- (BOOL)canUseSpotlightIndex;
- (BOOL)isAllowedToAccessProtectedData;
- (BOOL)isForeground;
- (BOOL)isMaild;
- (BOOL)isMobileMail;
- (MFMigrationPersistence)init;
@end

@implementation MFMigrationPersistence

- (MFMigrationPersistence)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFMigrationPersistence;
  v2 = [(MFMigrationPersistence *)&v5 init];
  v3 = v2;
  if (v2) {
    MFSetUserAgent(v2);
  }
  return v3;
}

+ (BOOL)migrateDatabaseAtPath:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F60B98]);
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F60EE0]) initWithAllowedProtocolPrefixes:0x1EFF4FFF8];
  [MEMORY[0x1E4F60B90] registerAdditionalPropertiesForPropertyMapper:v5];
  v6 = [(EDProtectedDatabasePersistence *)[MFProtectedDatabasePersistence_iOS alloc] initWithBasePath:v3 hookRegistry:v4];
  v7 = [MFPersistenceDatabase_iOS alloc];
  v8 = +[EDPersistenceDatabaseSchema schema];
  v9 = +[EDPersistenceDatabaseSchema protectedSchema];
  v10 = [(MFPersistenceDatabase_iOS *)v7 initWithBasePath:v3 databaseName:@"Envelope Index" maxConcurrentReaders:3 schema:v8 protectedSchema:v9 propertyMapper:v5 protectedDatabasePersistence:v6];

  v11 = (void *)MEMORY[0x1AD0E3E00]();
  v12 = [(MFPersistenceDatabase_iOS *)v10 openConnectionIsWriter:0];
  v13 = v12;
  if (v12) {
    [v12 close];
  }

  return v13 != 0;
}

- (BOOL)canRegisterForAPSPush
{
  return 0;
}

- (BOOL)canUseSpotlightIndex
{
  return 0;
}

- (BOOL)isAllowedToAccessProtectedData
{
  return 1;
}

- (BOOL)isForeground
{
  return 0;
}

- (BOOL)isMaild
{
  return 0;
}

- (BOOL)isMobileMail
{
  return 0;
}

@end