@interface PUAssetReference
- (BOOL)isEqual:(id)a3;
- (NSIndexPath)indexPath;
- (NSString)dataSourceIdentifier;
- (NSString)description;
- (PUAssetReference)init;
- (PUAssetReference)initWithAsset:(id)a3 assetCollection:(id)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6;
- (PUDisplayAsset)asset;
- (PUDisplayAssetCollection)assetCollection;
- (PXAssetReference)pxAssetReference;
- (PXSimpleIndexPath)simpleIndexPath;
- (unint64_t)hash;
@end

@implementation PUAssetReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (PUDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PXAssetReference)pxAssetReference
{
  if (pxAssetReference_onceToken != -1) {
    dispatch_once(&pxAssetReference_onceToken, &__block_literal_global_11783);
  }
  v3 = [(PUAssetReference *)self indexPath];
  PXSimpleIndexPathFromIndexPath();

  id v4 = objc_alloc(MEMORY[0x1E4F91220]);
  v5 = [(PUAssetReference *)self assetCollection];
  v6 = [(PUAssetReference *)self asset];
  memset(v9, 0, sizeof(v9));
  v7 = (void *)[v4 initWithSectionObject:v5 itemObject:v6 subitemObject:0 indexPath:v9];

  return (PXAssetReference *)v7;
}

uint64_t __36__PUAssetReference_pxAssetReference__block_invoke()
{
  uint64_t result = PXDataSourceIdentifierMakeUnique();
  pxAssetReference_unknownDataSourceIdentifier = result;
  return result;
}

- (PXSimpleIndexPath)simpleIndexPath
{
  id v5 = [(PUAssetReference *)self indexPath];
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXSimpleIndexPathFromIndexPath();

  return result;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)PUAssetReference;
  v3 = [(PUAssetReference *)&v10 description];
  id v4 = [(PUAssetReference *)self asset];
  id v5 = [(PUAssetReference *)self assetCollection];
  v6 = [(PUAssetReference *)self indexPath];
  v7 = [(PUAssetReference *)self dataSourceIdentifier];
  v8 = [v3 stringByAppendingFormat:@" asset=%@ assetCollection=%@ indexPath=%@ dataSourceIdentifier=%@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(NSIndexPath *)self->_indexPath isEqual:v4[3]]
    && [(NSString *)self->_dataSourceIdentifier isEqual:v4[4]])
  {
    char v5 = [(PUDisplayAsset *)self->_asset isEqual:v4[1]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PUAssetReference *)self asset];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (PUAssetReference)initWithAsset:(id)a3 assetCollection:(id)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PUAssetReference;
  v16 = [(PUAssetReference *)&v25 init];
  if (v16)
  {
    if (!v12)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v16, @"PUAssetReference.m", 19, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)&v16->_asset, a3);
    if (v15)
    {
      if (!v14)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2, v16, @"PUAssetReference.m", 24, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];
      }
      v17 = (NSString *)v15;
      dataSourceIdentifier = v16->_dataSourceIdentifier;
      v16->_dataSourceIdentifier = v17;
    }
    else
    {
      dataSourceIdentifier = [MEMORY[0x1E4F29128] UUID];
      v19 = [dataSourceIdentifier UUIDString];
      uint64_t v20 = [@"random-" stringByAppendingString:v19];
      v21 = v16->_dataSourceIdentifier;
      v16->_dataSourceIdentifier = (NSString *)v20;
    }
    objc_storeStrong((id *)&v16->_assetCollection, a4);
    objc_storeStrong((id *)&v16->_indexPath, a5);
  }

  return v16;
}

- (PUAssetReference)init
{
  return [(PUAssetReference *)self initWithAsset:0 assetCollection:0 indexPath:0 dataSourceIdentifier:0];
}

@end