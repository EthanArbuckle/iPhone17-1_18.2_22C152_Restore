@interface PXAssetCollectionActionPerformer
- (PHFetchResult)assetsFetchResult;
- (PHFetchResult)people;
- (PHFetchResult)socialGroups;
- (PXAssetCollectionActionPerformer)initWithActionType:(id)a3;
- (PXAssetCollectionActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (PXAssetCollectionActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 parameters:(id)a5;
- (PXAssetCollectionReference)assetCollectionReference;
- (PXAssetReference)dropTargetAssetReference;
- (PXAssetsDataSource)assetsDataSource;
- (PXDisplayAssetCollection)assetCollection;
- (PXDisplayTitleInfo)displayTitleInfo;
- (UIDragSession)dragSession;
- (UIDropSession)dropSession;
- (void)setAssetsDataSource:(id)a3;
- (void)setAssetsFetchResult:(id)a3;
- (void)setDragSession:(id)a3;
- (void)setDropSession:(id)a3;
- (void)setDropTargetAssetReference:(id)a3;
- (void)setPeople:(id)a3;
- (void)setSocialGroups:(id)a3;
@end

@implementation PXAssetCollectionActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_dropSession, 0);
  objc_storeStrong((id *)&self->_dragSession, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_socialGroups, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_displayTitleInfo, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
}

- (void)setAssetsFetchResult:(id)a3
{
}

- (PHFetchResult)assetsFetchResult
{
  return self->_assetsFetchResult;
}

- (void)setAssetsDataSource:(id)a3
{
}

- (PXAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (void)setDropSession:(id)a3
{
}

- (UIDropSession)dropSession
{
  return self->_dropSession;
}

- (void)setDragSession:(id)a3
{
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (void)setDropTargetAssetReference:(id)a3
{
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (void)setSocialGroups:(id)a3
{
}

- (PHFetchResult)socialGroups
{
  return self->_socialGroups;
}

- (void)setPeople:(id)a3
{
}

- (PHFetchResult)people
{
  return self->_people;
}

- (PXDisplayTitleInfo)displayTitleInfo
{
  return self->_displayTitleInfo;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (PXDisplayAssetCollection)assetCollection
{
  v2 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  v3 = [v2 assetCollection];

  return (PXDisplayAssetCollection *)v3;
}

- (PXAssetCollectionActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 parameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [PXDisplayTitleInfo alloc];
  v13 = [v10 assetCollection];
  v14 = [(PXDisplayTitleInfo *)v12 initWithAssetCollection:v13 useVerboseSmartDescription:0];

  v15 = [(PXAssetCollectionActionPerformer *)self initWithActionType:v9 assetCollectionReference:v10 displayTitleInfo:v14];
  if (v15)
  {
    v17 = v15;
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, v17, @"PXAssetCollectionActionManager.m", 227, @"Method %s is a responsibility of subclass %@", "-[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:parameters:]", v20 object file lineNumber description];

    abort();
  }

  return 0;
}

- (PXAssetCollectionActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXAssetCollectionActionManager.m", 213, @"Invalid parameter not satisfying: %@", @"assetCollectionReference" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PXAssetCollectionActionPerformer;
  v12 = [(PXActionPerformer *)&v16 initWithActionType:v9];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollectionReference, a4);
    objc_storeStrong((id *)&v13->_displayTitleInfo, a5);
  }

  return v13;
}

- (PXAssetCollectionActionPerformer)initWithActionType:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetCollectionActionManager.m", 209, @"%s is not available as initializer", "-[PXAssetCollectionActionPerformer initWithActionType:]");

  abort();
}

@end