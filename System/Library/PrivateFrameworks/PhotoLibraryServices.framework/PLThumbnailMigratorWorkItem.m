@interface PLThumbnailMigratorWorkItem
- (BOOL)succeeded;
- (NSString)masterThumbFilePath;
- (NSString)uuid;
- (PLManagedAsset)asset;
- (unint64_t)destinationThumbnailIndex;
- (void)setAsset:(id)a3;
- (void)setDestinationThumbnailIndex:(unint64_t)a3;
- (void)setMasterThumbFilePath:(id)a3;
- (void)setSucceeded:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation PLThumbnailMigratorWorkItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterThumbFilePath, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setDestinationThumbnailIndex:(unint64_t)a3
{
  self->_destinationThumbnailIndex = a3;
}

- (unint64_t)destinationThumbnailIndex
{
  return self->_destinationThumbnailIndex;
}

- (void)setMasterThumbFilePath:(id)a3
{
}

- (NSString)masterThumbFilePath
{
  return self->_masterThumbFilePath;
}

- (void)setAsset:(id)a3
{
}

- (PLManagedAsset)asset
{
  return self->_asset;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

@end