@interface BMSyncCKRecord
- (BMSyncCKRecord)initWithFMResultSet:(id)a3;
- (NSData)localMergeableValue;
- (NSNumber)locationID;
- (NSString)recordName;
- (NSString)streamIdentifier;
@end

@implementation BMSyncCKRecord

- (BMSyncCKRecord)initWithFMResultSet:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BMSyncCKRecord;
  v5 = [(BMSyncCKRecord *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringForColumn:@"record_name"];
    recordName = v5->_recordName;
    v5->_recordName = (NSString *)v6;

    uint64_t v8 = [v4 stringForColumn:@"stream_identifier"];
    streamIdentifier = v5->_streamIdentifier;
    v5->_streamIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 dataForColumn:@"local_mergeable_value"];
    localMergeableValue = v5->_localMergeableValue;
    v5->_localMergeableValue = (NSData *)v10;

    uint64_t v12 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 longForColumn:@"location_id"]);
    locationID = v5->_locationID;
    v5->_locationID = (NSNumber *)v12;
  }
  return v5;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (NSData)localMergeableValue
{
  return self->_localMergeableValue;
}

- (NSNumber)locationID
{
  return self->_locationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationID, 0);
  objc_storeStrong((id *)&self->_localMergeableValue, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);

  objc_storeStrong((id *)&self->_recordName, 0);
}

@end