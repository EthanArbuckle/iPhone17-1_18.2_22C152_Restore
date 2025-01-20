@interface WFLibraryRecord
- (NSData)cloudKitRecordMetadata;
- (NSData)data;
- (NSString)identifier;
- (NSString)version;
- (int64_t)computedSyncHash;
- (int64_t)lastSyncedHash;
- (void)setCloudKitRecordMetadata:(id)a3;
- (void)setData:(id)a3;
- (void)setLastSyncedHash:(int64_t)a3;
@end

@implementation WFLibraryRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitRecordMetadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setLastSyncedHash:(int64_t)a3
{
  self->_lastSyncedHash = a3;
}

- (int64_t)lastSyncedHash
{
  return self->_lastSyncedHash;
}

- (void)setCloudKitRecordMetadata:(id)a3
{
}

- (NSData)cloudKitRecordMetadata
{
  return self->_cloudKitRecordMetadata;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)computedSyncHash
{
  v3 = objc_opt_new();
  v4 = [(WFLibraryRecord *)self version];

  if (v4)
  {
    v5 = [(WFLibraryRecord *)self version];
    id v6 = (id)[v3 combineContentsOfPropertyListObject:v5];
  }
  v7 = [(WFLibraryRecord *)self data];

  if (v7)
  {
    v8 = [(WFLibraryRecord *)self data];
    id v9 = (id)[v3 combineContentsOfPropertyListObject:v8];
  }
  int64_t v10 = [v3 finalize];

  return v10;
}

@end