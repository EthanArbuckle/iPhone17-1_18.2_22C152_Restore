@interface PDCloudStoreRecordsResponse
- (NSDictionary)deletedRecordsByDatabaseIdentifier;
- (PKCloudRecordArray)cloudStoreRecords;
- (PKCloudRecordArray)conflictingCloudStoreRecords;
- (id)deletedRecordsForAllDatabaseIdentifiers;
- (void)setCloudStoreRecords:(id)a3;
- (void)setConflictingCloudStoreRecords:(id)a3;
- (void)setDeletedRecordsByDatabaseIdentifier:(id)a3;
@end

@implementation PDCloudStoreRecordsResponse

- (id)deletedRecordsForAllDatabaseIdentifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  deletedRecordsByDatabaseIdentifier = self->_deletedRecordsByDatabaseIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100322F2C;
  v8[3] = &unk_10072F3A0;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)deletedRecordsByDatabaseIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (PKCloudRecordArray)cloudStoreRecords
{
  return self->_cloudStoreRecords;
}

- (void)setCloudStoreRecords:(id)a3
{
}

- (PKCloudRecordArray)conflictingCloudStoreRecords
{
  return self->_conflictingCloudStoreRecords;
}

- (void)setConflictingCloudStoreRecords:(id)a3
{
}

- (NSDictionary)deletedRecordsByDatabaseIdentifier
{
  return self->_deletedRecordsByDatabaseIdentifier;
}

- (void)setDeletedRecordsByDatabaseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordsByDatabaseIdentifier, 0);
  objc_storeStrong((id *)&self->_conflictingCloudStoreRecords, 0);
  objc_storeStrong((id *)&self->_cloudStoreRecords, 0);
}

@end