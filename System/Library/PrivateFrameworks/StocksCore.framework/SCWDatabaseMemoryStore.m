@interface SCWDatabaseMemoryStore
- (BOOL)isCloudBackupEnabled;
- (CKServerChangeToken)serverChangeToken;
- (NSDate)lastDirtyDate;
- (NSDate)lastSyncDate;
- (NSMutableDictionary)zoneStoresByName;
- (SCWDatabaseMemoryStore)init;
- (id)zoneStoreForSchema:(id)a3;
- (void)setCloudBackupEnabled:(BOOL)a3;
- (void)setLastDirtyDate:(id)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setZoneStoresByName:(id)a3;
@end

@implementation SCWDatabaseMemoryStore

- (SCWDatabaseMemoryStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCWDatabaseMemoryStore;
  v2 = [(SCWDatabaseMemoryStore *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    zoneStoresByName = v2->_zoneStoresByName;
    v2->_zoneStoresByName = v3;
  }
  return v2;
}

- (id)zoneStoreForSchema:(id)a3
{
  id v4 = a3;
  v5 = [(SCWDatabaseMemoryStore *)self zoneStoresByName];
  objc_super v6 = [v4 zoneName];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v7 = objc_alloc_init(SCWZoneMemoryStore);
    v8 = [(SCWDatabaseMemoryStore *)self zoneStoresByName];
    v9 = [v4 zoneName];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
}

- (NSDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
}

- (BOOL)isCloudBackupEnabled
{
  return self->_cloudBackupEnabled;
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->_cloudBackupEnabled = a3;
}

- (NSMutableDictionary)zoneStoresByName
{
  return self->_zoneStoresByName;
}

- (void)setZoneStoresByName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneStoresByName, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);

  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

@end