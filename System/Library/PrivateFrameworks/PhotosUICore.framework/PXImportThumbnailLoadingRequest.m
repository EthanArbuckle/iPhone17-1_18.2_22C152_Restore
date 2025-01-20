@interface PXImportThumbnailLoadingRequest
- (PHImportAssetDataRequest)assetDataRequest;
- (PXImportItemViewModel)importItem;
- (PXImportThumbnailLoadingRequest)initWithImportItem:(id)a3 requestID:(int64_t)a4 requestSize:(unint64_t)a5 completionBlock:(id)a6;
- (id)completionBlock;
- (int64_t)requestID;
- (unint64_t)requestSize;
- (void)setAssetDataRequest:(id)a3;
@end

@implementation PXImportThumbnailLoadingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDataRequest, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_importItem);
}

- (void)setAssetDataRequest:(id)a3
{
}

- (PHImportAssetDataRequest)assetDataRequest
{
  return (PHImportAssetDataRequest *)objc_getProperty(self, a2, 40, 1);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (unint64_t)requestSize
{
  return self->_requestSize;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (PXImportItemViewModel)importItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importItem);
  return (PXImportItemViewModel *)WeakRetained;
}

- (PXImportThumbnailLoadingRequest)initWithImportItem:(id)a3 requestID:(int64_t)a4 requestSize:(unint64_t)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PXImportThumbnailLoadingRequest;
  v12 = [(PXImportThumbnailLoadingRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_importItem, v10);
    v13->_requestID = a4;
    v13->_requestSize = a5;
    uint64_t v14 = [v11 copy];
    id completionBlock = v13->_completionBlock;
    v13->_id completionBlock = (id)v14;
  }
  return v13;
}

@end