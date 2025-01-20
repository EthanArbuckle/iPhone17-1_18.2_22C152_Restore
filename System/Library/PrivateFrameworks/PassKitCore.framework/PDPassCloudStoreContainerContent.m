@interface PDPassCloudStoreContainerContent
- (NSArray)cloudPassCatalogs;
- (NSArray)cloudPasses;
- (NSArray)cloudRecordIDs;
- (NSError)errorEncounered;
- (PDPassCloudStoreContainerContent)init;
- (id)description;
- (int64_t)typeOfSyncPerformed;
- (void)appendCatalog:(id)a3;
- (void)appendPass:(id)a3;
- (void)appendPassID:(id)a3;
- (void)noteEnounteredError:(id)a3;
- (void)noteTypeOfSyncPerformed:(int64_t)a3;
@end

@implementation PDPassCloudStoreContainerContent

- (PDPassCloudStoreContainerContent)init
{
  v10.receiver = self;
  v10.super_class = (Class)PDPassCloudStoreContainerContent;
  v2 = [(PDPassCloudStoreContainerContent *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cloudPasses = v2->_cloudPasses;
    v2->_cloudPasses = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cloudPassCatalogs = v2->_cloudPassCatalogs;
    v2->_cloudPassCatalogs = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cloudRecordIDs = v2->_cloudRecordIDs;
    v2->_cloudRecordIDs = v7;
  }
  return v2;
}

- (void)appendPass:(id)a3
{
}

- (void)appendPassID:(id)a3
{
  cloudRecordIDs = self->_cloudRecordIDs;
  id v4 = [a3 uniqueID];
  [(NSMutableArray *)cloudRecordIDs addObject:v4];
}

- (void)appendCatalog:(id)a3
{
}

- (void)noteEnounteredError:(id)a3
{
}

- (void)noteTypeOfSyncPerformed:(int64_t)a3
{
  self->_syncType = a3;
}

- (NSArray)cloudPasses
{
  id v2 = [(NSMutableArray *)self->_cloudPasses copy];
  return (NSArray *)v2;
}

- (NSArray)cloudPassCatalogs
{
  id v2 = [(NSMutableArray *)self->_cloudPassCatalogs copy];
  return (NSArray *)v2;
}

- (NSArray)cloudRecordIDs
{
  id v2 = [(NSMutableArray *)self->_cloudRecordIDs copy];
  return (NSArray *)v2;
}

- (NSError)errorEncounered
{
  return self->_error;
}

- (int64_t)typeOfSyncPerformed
{
  return self->_syncType;
}

- (id)description
{
  v3 = [(PDPassCloudStoreContainerContent *)self cloudPasses];
  id v4 = [(PDPassCloudStoreContainerContent *)self cloudPassCatalogs];
  v5 = [(PDPassCloudStoreContainerContent *)self cloudRecordIDs];
  v6 = [(PDPassCloudStoreContainerContent *)self errorEncounered];
  v7 = +[NSString stringWithFormat:@"cloudPasses: %@\ncloudPassCatalogs: %@\nrecordIDs: %@\nerror: %@", v3, v4, v5, v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cloudRecordIDs, 0);
  objc_storeStrong((id *)&self->_cloudPassCatalogs, 0);
  objc_storeStrong((id *)&self->_cloudPasses, 0);
}

@end