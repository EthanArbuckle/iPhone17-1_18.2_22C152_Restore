@interface PXAssetCollectionActionManager
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)canPerformActionType:(id)a3 assetCollectionReference:(id)a4;
- (PHAssetCollection)containingAlbum;
- (PHFetchResult)assetsFetchResult;
- (PHFetchResult)people;
- (PHFetchResult)socialGroups;
- (PXAssetCollectionActionManager)init;
- (PXAssetCollectionActionManager)initWithAssetCollection:(id)a3 displayTitleInfo:(id)a4;
- (PXAssetCollectionActionManager)initWithAssetCollectionReference:(id)a3 displayTitleInfo:(id)a4;
- (PXAssetCollectionReference)assetCollectionReference;
- (PXAssetReference)dropTargetAssetReference;
- (PXAssetsDataSourceManager)assetsDataSourceManager;
- (PXDisplayTitleInfo)displayTitleInfo;
- (UIDragSession)dragSession;
- (UIDropSession)dropSession;
- (UITraitEnvironment)traitEnvironment;
- (id)actionPerformerForActionType:(id)a3;
- (id)actionPerformerForActionType:(id)a3 assetCollectionReference:(id)a4;
- (id)actionTypeForGenericType:(id)a3;
- (id)displayTitleInfoForAssetCollection:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4 assetCollectionReference:(id)a5;
- (id)menuElementsForActionType:(id)a3;
- (id)menuElementsForActionType:(id)a3 assetCollectionReference:(id)a4;
- (id)systemImageNameForActionType:(id)a3;
- (id)systemImageNameForActionType:(id)a3 assetCollectionReference:(id)a4;
- (void)setAssetsDataSourceManager:(id)a3;
- (void)setAssetsFetchResult:(id)a3;
- (void)setContainingAlbum:(id)a3;
- (void)setDragSession:(id)a3;
- (void)setDropSession:(id)a3;
- (void)setDropTargetAssetReference:(id)a3;
- (void)setPeople:(id)a3;
- (void)setSocialGroups:(id)a3;
- (void)setTraitEnvironment:(id)a3;
@end

@implementation PXAssetCollectionActionManager

- (PXAssetCollectionActionManager)initWithAssetCollection:(id)a3 displayTitleInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)off_1E5DA55C0);
  uint64_t v12 = *(void *)off_1E5DAAED8;
  long long v13 = xmmword_1AB359AA0;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (void *)[v8 initWithAssetCollection:v7 keyAssetReference:0 indexPath:&v12];

  v10 = [(PXAssetCollectionActionManager *)self initWithAssetCollectionReference:v9 displayTitleInfo:v6];
  return v10;
}

- (PXAssetCollectionActionManager)initWithAssetCollectionReference:(id)a3 displayTitleInfo:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXAssetCollectionActionManager;
  v9 = [(PXAssetCollectionActionManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialAssetCollectionReference, a3);
    objc_storeStrong((id *)&v10->_internalDisplayTitleInfo, a4);
    uint64_t v15 = *(void *)off_1E5DAAE90;
    v16[0] = @"PXAssetCollectionActionTypeAddContent";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    assetCollectionActionTypeByGenericType = v10->_assetCollectionActionTypeByGenericType;
    v10->_assetCollectionActionTypeByGenericType = (NSDictionary *)v11;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingAlbum, 0);
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_destroyWeak((id *)&self->_traitEnvironment);
  objc_destroyWeak((id *)&self->_dropSession);
  objc_destroyWeak((id *)&self->_dragSession);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_socialGroups, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionTypeByGenericType, 0);
  objc_storeStrong((id *)&self->_internalDisplayTitleInfo, 0);
  objc_storeStrong((id *)&self->_initialAssetCollectionReference, 0);
}

- (void)setContainingAlbum:(id)a3
{
}

- (PHAssetCollection)containingAlbum
{
  return self->_containingAlbum;
}

- (void)setAssetsFetchResult:(id)a3
{
}

- (PHFetchResult)assetsFetchResult
{
  return self->_assetsFetchResult;
}

- (void)setAssetsDataSourceManager:(id)a3
{
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (void)setTraitEnvironment:(id)a3
{
}

- (UITraitEnvironment)traitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitEnvironment);
  return (UITraitEnvironment *)WeakRetained;
}

- (void)setDropSession:(id)a3
{
}

- (UIDropSession)dropSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropSession);
  return (UIDropSession *)WeakRetained;
}

- (void)setDragSession:(id)a3
{
}

- (UIDragSession)dragSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragSession);
  return (UIDragSession *)WeakRetained;
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

- (id)systemImageNameForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  if (!v5) {
    PXAssertGetLog();
  }
  id v6 = [(PXAssetCollectionActionManager *)self systemImageNameForActionType:v4 assetCollectionReference:v5];

  return v6;
}

- (id)systemImageNameForActionType:(id)a3 assetCollectionReference:(id)a4
{
  return 0;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  if (!v7) {
    PXAssertGetLog();
  }
  id v8 = [(PXAssetCollectionActionManager *)self localizedTitleForActionType:v6 useCase:a4 assetCollectionReference:v7];

  return v8;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4 assetCollectionReference:(id)a5
{
  return 0;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  if (!v5) {
    PXAssertGetLog();
  }
  id v6 = [(PXAssetCollectionActionManager *)self actionPerformerForActionType:v4 assetCollectionReference:v5];

  return v6;
}

- (id)actionPerformerForActionType:(id)a3 assetCollectionReference:(id)a4
{
  return 0;
}

- (id)actionTypeForGenericType:(id)a3
{
  return [(NSDictionary *)self->_assetCollectionActionTypeByGenericType objectForKeyedSubscript:a3];
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  if (!v5) {
    PXAssertGetLog();
  }
  BOOL v6 = [(PXAssetCollectionActionManager *)self canPerformActionType:v4 assetCollectionReference:v5];

  return v6;
}

- (BOOL)canPerformActionType:(id)a3 assetCollectionReference:(id)a4
{
  return 0;
}

- (id)displayTitleInfoForAssetCollection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXAssetCollectionActionManager.m", 125, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];
  }
  BOOL v6 = [(PXAssetCollectionActionManager *)self displayTitleInfo];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = [[PXDisplayTitleInfo alloc] initWithAssetCollection:v5 useVerboseSmartDescription:0];
  }
  v9 = v8;

  return v9;
}

- (PXDisplayTitleInfo)displayTitleInfo
{
  internalDisplayTitleInfo = self->_internalDisplayTitleInfo;
  if (!internalDisplayTitleInfo)
  {
    id v4 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
    id v5 = [v4 assetCollection];

    if (v5) {
      BOOL v6 = [[PXDisplayTitleInfo alloc] initWithAssetCollection:v5 useVerboseSmartDescription:0];
    }
    else {
      BOOL v6 = 0;
    }
    id v7 = self->_internalDisplayTitleInfo;
    self->_internalDisplayTitleInfo = v6;

    internalDisplayTitleInfo = self->_internalDisplayTitleInfo;
  }
  return internalDisplayTitleInfo;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  v3 = [(PXAssetCollectionActionManager *)self assetsDataSourceManager];

  if (!v3) {
    goto LABEL_3;
  }
  id v4 = [(PXAssetCollectionActionManager *)self assetsDataSourceManager];
  id v5 = [v4 dataSource];
  BOOL v6 = [v5 assetCollectionReferenceForAssetCollectionReference:self->_initialAssetCollectionReference];

  initialAssetCollectionReference = v6;
  if (!v6)
  {
LABEL_3:
    BOOL v6 = 0;
    initialAssetCollectionReference = self->_initialAssetCollectionReference;
  }
  id v8 = initialAssetCollectionReference;

  return v8;
}

- (PXAssetCollectionActionManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetCollectionActionManager.m", 85, @"%s is not available as initializer", "-[PXAssetCollectionActionManager init]");

  abort();
}

- (id)menuElementsForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  if (!v5) {
    PXAssertGetLog();
  }
  BOOL v6 = [(PXAssetCollectionActionManager *)self menuElementsForActionType:v4 assetCollectionReference:v5];

  return v6;
}

- (id)menuElementsForActionType:(id)a3 assetCollectionReference:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end