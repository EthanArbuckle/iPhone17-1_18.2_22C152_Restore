@interface BKPlistImportingOperationAttributes
- (BKPlistImportingAsset)asset;
- (BKPlistImportingOperationAttributes)initWithAssetID:(id)a3 contentType:(signed __int16)a4;
- (BKPlistImportingOperationAttributes)initWithTemporaryAssetID:(id)a3 contentType:(signed __int16)a4;
- (BOOL)isZipArchive;
- (NSString)assetID;
- (NSString)assetSourcePath;
- (NSString)temporaryAssetID;
- (id)importCompletionBlock;
- (signed)contentType;
- (void)setAsset:(id)a3;
- (void)setAssetSourcePath:(id)a3;
- (void)setImportCompletionBlock:(id)a3;
- (void)setIsZipArchive:(BOOL)a3;
@end

@implementation BKPlistImportingOperationAttributes

- (BKPlistImportingOperationAttributes)initWithAssetID:(id)a3 contentType:(signed __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKPlistImportingOperationAttributes;
  v8 = [(BKPlistImportingOperationAttributes *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_assetID, a3);
    v9->_contentType = a4;
  }

  return v9;
}

- (BKPlistImportingOperationAttributes)initWithTemporaryAssetID:(id)a3 contentType:(signed __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKPlistImportingOperationAttributes;
  v8 = [(BKPlistImportingOperationAttributes *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_temporaryAssetID, a3);
    v9->_contentType = a4;
  }

  return v9;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSString)temporaryAssetID
{
  return self->_temporaryAssetID;
}

- (signed)contentType
{
  return self->_contentType;
}

- (BKPlistImportingAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (id)importCompletionBlock
{
  return self->_importCompletionBlock;
}

- (void)setImportCompletionBlock:(id)a3
{
}

- (NSString)assetSourcePath
{
  return self->_assetSourcePath;
}

- (void)setAssetSourcePath:(id)a3
{
}

- (BOOL)isZipArchive
{
  return self->_isZipArchive;
}

- (void)setIsZipArchive:(BOOL)a3
{
  self->_isZipArchive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSourcePath, 0);
  objc_storeStrong(&self->_importCompletionBlock, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end