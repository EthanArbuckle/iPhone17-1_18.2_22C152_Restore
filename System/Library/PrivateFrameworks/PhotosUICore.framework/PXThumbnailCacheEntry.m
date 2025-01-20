@interface PXThumbnailCacheEntry
- (NSData)data;
- (NSManagedObjectID)objectID;
- (PHAssetResourceTableDataSpecification)dataSpec;
- (PXThumbnailCacheEntry)initWithObjectID:(id)a3 dataSpec:(const PHAssetResourceTableDataSpecification *)a4 data:(id)a5;
@end

@implementation PXThumbnailCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

- (NSData)data
{
  return self->_data;
}

- (PHAssetResourceTableDataSpecification)dataSpec
{
  long long v3 = *(_OWORD *)&self[1].bytesPerRow;
  *(_OWORD *)&retstr->width = *(_OWORD *)&self->kind;
  *(_OWORD *)&retstr->dataHeight = v3;
  return self;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (PXThumbnailCacheEntry)initWithObjectID:(id)a3 dataSpec:(const PHAssetResourceTableDataSpecification *)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXThumbnailCacheEntry;
  v11 = [(PXThumbnailCacheEntry *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_objectID, a3);
    long long v13 = *(_OWORD *)&a4->width;
    *(_OWORD *)&v12->_dataSpec.dataHeight = *(_OWORD *)&a4->dataHeight;
    *(_OWORD *)&v12->_dataSpec.width = v13;
    objc_storeStrong((id *)&v12->_data, a5);
  }

  return v12;
}

@end