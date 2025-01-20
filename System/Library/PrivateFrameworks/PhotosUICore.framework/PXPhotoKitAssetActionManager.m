@interface PXPhotoKitAssetActionManager
+ (id)selectedAssetForActionManager:(id)a3;
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)canPerformAssetVariationActions;
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (BOOL)isDestructiveActionType:(id)a3;
- (BOOL)shouldEnableActionType:(id)a3 onAsset:(id)a4;
- (BOOL)supportsActionType:(id)a3;
- (BOOL)supportsAirPlay;
- (NSMapTable)_actionTypeByBarButtonItem;
- (NSMutableDictionary)_performerClassByType;
- (NSString)importSessionID;
- (PHPerson)person;
- (PHPhotoLibrary)photoLibrary;
- (PHSocialGroup)socialGroup;
- (PXAssetActionPerformer)_activePerformer;
- (PXPhotoKitAssetActionManager)initWithAsset:(id)a3;
- (PXPhotoKitAssetActionManager)initWithSelectionManager:(id)a3;
- (PXPhotoKitAssetActionManager)initWithSuggestion:(id)a3;
- (PXPhotoKitAssetsDataSourceManager)dataSourceManager;
- (PXPhotoKitImportStatusManager)importStatusManager;
- (PXPhotosDataSource)_dataSourceSnapshot;
- (PXRadarConfigurationProvider)radarConfigurationProvider;
- (id)_selectionSnapshotForPerformerClass:(Class)a3 applySubsetIfNeeded:(BOOL)a4;
- (id)actionPerformerForActionType:(id)a3;
- (id)activityForActionType:(id)a3;
- (id)barButtonItemForActionType:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)menuElementForActionType:(id)a3 image:(id)a4 willStartActionHandler:(id)a5 didEndActionHandler:(id)a6;
- (id)previewActionForActionType:(id)a3 image:(id)a4;
- (id)standardActionForActionType:(id)a3;
- (id)systemImageNameForActionType:(id)a3;
- (unint64_t)presentationSource;
- (void)_handleAction:(id)a3 actionType:(id)a4 completionHandler:(id)a5;
- (void)_handleActionPerformerComplete:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_handleBarButtonItem:(id)a3;
- (void)_setActivePerformer:(id)a3;
- (void)executeActionForActionType:(id)a3 sender:(id)a4 completionHandler:(id)a5;
- (void)performActivity:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)registerPerformerClass:(Class)a3 forType:(id)a4;
- (void)setAdditionalPropertiesFromActionManager:(id)a3;
- (void)setDataSourceManager:(id)a3;
- (void)setImportSessionID:(id)a3;
- (void)setImportStatusManager:(id)a3;
- (void)setPerson:(id)a3;
- (void)setRadarConfigurationProvider:(id)a3;
- (void)setSocialGroup:(id)a3;
- (void)setSupportsAirPlay:(BOOL)a3;
@end

@implementation PXPhotoKitAssetActionManager

- (void)registerPerformerClass:(Class)a3 forType:(id)a4
{
  id v6 = a4;
  id v7 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  [v7 setObject:a3 forKeyedSubscript:v6];
}

- (NSMutableDictionary)_performerClassByType
{
  return self->__performerClassByType;
}

- (void)setDataSourceManager:(id)a3
{
}

- (PXPhotoKitAssetActionManager)initWithSelectionManager:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PXPhotoKitAssetActionManager;
  v5 = [(PXAssetActionManager *)&v27 initWithSelectionManager:v4];
  if (v5)
  {
    id v6 = [v4 dataSourceManager];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    dataSourceManager = v5->_dataSourceManager;
    v5->_dataSourceManager = v7;
    v9 = v7;

    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    actionTypeByBarButtonItem = v5->__actionTypeByBarButtonItem;
    v5->__actionTypeByBarButtonItem = (NSMapTable *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    performerClassByType = v5->__performerClassByType;
    v5->__performerClassByType = v12;

    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypePersonMakeKeyPhoto"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeSocialGroupMakeKeyPhoto"];
    uint64_t v14 = objc_opt_class();
    v15 = v5->__performerClassByType;
    v16 = @"PXAssetActionTypeVariationNone";
    [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:@"PXAssetActionTypeVariationNone"];

    uint64_t v17 = objc_opt_class();
    v18 = v5->__performerClassByType;
    v19 = @"PXAssetActionTypeVariationAutoloop";
    [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:@"PXAssetActionTypeVariationAutoloop"];

    uint64_t v20 = objc_opt_class();
    v21 = v5->__performerClassByType;
    v22 = @"PXAssetActionTypeVariationMirror";
    [(NSMutableDictionary *)v21 setObject:v20 forKeyedSubscript:@"PXAssetActionTypeVariationMirror"];

    uint64_t v23 = objc_opt_class();
    v24 = v5->__performerClassByType;
    v25 = @"PXAssetActionTypeVariationLongExposure";
    [(NSMutableDictionary *)v24 setObject:v23 forKeyedSubscript:@"PXAssetActionTypeVariationLongExposure"];

    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeAddToLibrary"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeShowInLibrary"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeCopy"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeHide"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeDuplicate"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeTrash"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeTrashNoConfirm"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeDelete"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeRestore"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeRecover"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeUnifiedDestructive"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeRemove"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeRemoveNoConfirm"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeExpunge"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeToggleFavorite"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeAlbumMakeKeyPhoto"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeStoryRemoveAsset"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeStoryMakeKeyPhoto"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeEditDateTime"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeEditLocation"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeMergeDuplicates"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeMergeDuplicatesWithoutConfirmation"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeToggleSelection"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypePickAsset"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeRemoveFromFeaturedPhotos"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeFileRadar"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeInternalContentSyndicationFileRadar"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeInternalAssetDetails"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeInternalAssetSearchDetails"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeInternalCopyURL"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypePrint"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeFeatureLess"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeInternalFileRadarForSharedLibrary"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeSyndicationSaveToLibrary"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeInternalToggleStacks"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeMoveToLibrary"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeMoveToSharedLibrary"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeMoveToPersonalLibrary"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeRemoveSharingSuggestion"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeShowActionsMenu"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypePlayMovie"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeNotThisPerson"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeClearRecentlyViewed"];
    [(NSMutableDictionary *)v5->__performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeClearRecentlyShared"];

    [(PXAssetActionManager *)v5 px_registerAdditionalPerformerClasses];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->__activePerformer, 0);
  objc_storeStrong((id *)&self->__actionTypeByBarButtonItem, 0);
  objc_storeStrong((id *)&self->__performerClassByType, 0);
  objc_storeStrong((id *)&self->_radarConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
}

- (PXPhotoKitAssetActionManager)initWithSuggestion:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F38EB8];
  id v5 = a3;
  id v6 = [v4 fetchKeyAssetsInAssetCollection:v5 options:0];
  id v7 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:v5 existingAssetsFetchResult:v6];

  v8 = (void *)[objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v7];
  [v8 performChanges:&__block_literal_global_25175];
  v9 = [(PXPhotoKitAssetActionManager *)self initWithSelectionManager:v8];
  if (v9)
  {
    v12[0] = @"PXAssetActionTypeDuplicate";
    v12[1] = @"PXAssetActionTypeEditDateTime";
    v12[2] = @"PXAssetActionTypeEditLocation";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    [(PXAssetActionManager *)v9 setExcludedContextMenuActionTypes:v10];
  }
  return v9;
}

uint64_t __65__PXPhotoKitAssetActionManager_PHSuggestion__initWithSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (PXPhotoKitAssetActionManager)initWithAsset:(id)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v4 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerWithAsset:a3];
  id v5 = (void *)[objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v4];
  [v5 performChanges:&__block_literal_global_216];
  id v6 = [(PXPhotoKitAssetActionManager *)self initWithSelectionManager:v5];
  if (v6)
  {
    v9[0] = @"PXAssetActionTypeDuplicate";
    v9[1] = @"PXAssetActionTypeEditDateTime";
    v9[2] = @"PXAssetActionTypeEditLocation";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
    [(PXAssetActionManager *)v6 setExcludedContextMenuActionTypes:v7];
  }
  return v6;
}

uint64_t __55__PXPhotoKitAssetActionManager_PHAsset__initWithAsset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (PXPhotoKitAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)_setActivePerformer:(id)a3
{
}

- (PXAssetActionPerformer)_activePerformer
{
  return self->__activePerformer;
}

- (NSMapTable)_actionTypeByBarButtonItem
{
  return self->__actionTypeByBarButtonItem;
}

- (void)setSupportsAirPlay:(BOOL)a3
{
  self->_supportsAirPlay = a3;
}

- (BOOL)supportsAirPlay
{
  return self->_supportsAirPlay;
}

- (void)setRadarConfigurationProvider:(id)a3
{
}

- (PXRadarConfigurationProvider)radarConfigurationProvider
{
  return self->_radarConfigurationProvider;
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setImportSessionID:(id)a3
{
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (void)setImportStatusManager:(id)a3
{
}

- (PXPhotoKitImportStatusManager)importStatusManager
{
  return self->_importStatusManager;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4 = a3;
  id v7 = [(PXPhotoKitAssetActionManager *)self person];
  id v5 = objc_msgSend(v4, "changeDetailsForObject:");

  if (v5)
  {
    id v6 = [v5 objectAfterChanges];
    [(PXPhotoKitAssetActionManager *)self setPerson:v6];
  }
}

- (void)_handleActionPerformerComplete:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PXPhotoKitAssetActionManager *)self _activePerformer];

  if (v10 == v8)
  {
    if (v9)
    {
      v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = @"NO";
        *(_DWORD *)v13 = 138412802;
        *(void *)&v13[4] = v8;
        *(_WORD *)&v13[12] = 2112;
        if (v6) {
          v12 = @"YES";
        }
        *(void *)&v13[14] = v12;
        __int16 v14 = 2112;
        id v15 = v9;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Error performing action:%@ success:%@ error:%@", v13, 0x20u);
      }
    }
    -[PXPhotoKitAssetActionManager _setActivePerformer:](self, "_setActivePerformer:", 0, *(_OWORD *)v13);
  }
}

- (void)executeActionForActionType:(id)a3 sender:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PXPhotoKitAssetActionManager *)self _activePerformer];
  if (v11)
  {
    id v12 = (id)v11;
    v13 = [(PXPhotoKitAssetActionManager *)self _activePerformer];
    if ((unint64_t)[v13 state] <= 0xA)
    {

      goto LABEL_8;
    }
    BOOL v14 = [(PXPhotoKitAssetActionManager *)self canPerformActionType:v8];

    if (!v14) {
      goto LABEL_9;
    }
LABEL_6:
    id v15 = [(PXPhotoKitAssetActionManager *)self actionPerformerForActionType:v8];
    [(PXPhotoKitAssetActionManager *)self _setActivePerformer:v15];
    objc_initWeak(&location, self);
    [v15 setSender:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__PXPhotoKitAssetActionManager_executeActionForActionType_sender_completionHandler___block_invoke;
    v16[3] = &unk_1E5DC24B0;
    objc_copyWeak(&v19, &location);
    id v12 = v15;
    id v17 = v12;
    id v18 = v10;
    [v12 performActionWithCompletionHandler:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
LABEL_8:

    goto LABEL_9;
  }
  if ([(PXPhotoKitAssetActionManager *)self canPerformActionType:v8]) {
    goto LABEL_6;
  }
LABEL_9:
}

void __84__PXPhotoKitAssetActionManager_executeActionForActionType_sender_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleActionPerformerComplete:*(void *)(a1 + 32) success:a2 error:v7];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (void)_handleBarButtonItem:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v11 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:self file:@"PXPhotoKitAssetActionManager.m" lineNumber:516 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      id v6 = [v11 barButtonItem];
      if (!v6)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"PXPhotoKitAssetActionManager.m" lineNumber:514 description:@"Invalid bar button item"];

        id v6 = 0;
      }
    }
    id v7 = [(PXPhotoKitAssetActionManager *)self _actionTypeByBarButtonItem];
    id v8 = [v7 objectForKey:v6];

    [(PXPhotoKitAssetActionManager *)self executeActionForActionType:v8 sender:v11 completionHandler:0];
    id v5 = v11;
  }
}

- (void)_handleAction:(id)a3 actionType:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 sender];
  [(PXPhotoKitAssetActionManager *)self executeActionForActionType:v9 sender:v10 completionHandler:v8];
}

- (id)systemImageNameForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  id v6 = (void *)[v5 objectForKeyedSubscript:v4];

  return (id)[v6 systemImageNameForActionManager:self];
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  id v8 = (void *)[v7 objectForKeyedSubscript:v6];

  return (id)[v8 localizedTitleForUseCase:a4 actionManager:self];
}

- (void)performActivity:(id)a3
{
  id v4 = [a3 actionType];
  [(PXPhotoKitAssetActionManager *)self executeActionForActionType:v4 sender:0 completionHandler:0];
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v5 = objc_msgSend(a4, "actionType", a3);
  LOBYTE(self) = [(PXPhotoKitAssetActionManager *)self canPerformActionType:v5];

  return (char)self;
}

- (id)activityForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  id v6 = (void *)[v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v6 = [v6 createActivityWithActionManager:self];
    [v6 setActionDelegate:self];
  }
  return v6;
}

- (id)standardActionForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  id v6 = (void *)[v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    objc_initWeak(&location, self);
    id v7 = [(PXPhotoKitAssetActionManager *)self localizedTitleForActionType:v4 useCase:1];
    id v8 = [(PXPhotoKitAssetActionManager *)self systemImageNameForActionType:v4];
    if (v8)
    {
      id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:v8];
    }
    else
    {
      id v9 = 0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PXPhotoKitAssetActionManager_standardActionForActionType___block_invoke;
    v11[3] = &unk_1E5DC7448;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    id v6 = [v6 createStandardActionWithTitle:v7 image:v9 handler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __60__PXPhotoKitAssetActionManager_standardActionForActionType___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v4 sender];

  [WeakRetained executeActionForActionType:v5 sender:v6 completionHandler:0];
}

- (id)menuElementForActionType:(id)a3 image:(id)a4 willStartActionHandler:(id)a5 didEndActionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  id v15 = (void *)[v14 objectForKeyedSubscript:v10];

  if (v15)
  {
    uint64_t v16 = [(PXPhotoKitAssetActionManager *)self localizedTitleForActionType:v10 useCase:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __106__PXPhotoKitAssetActionManager_menuElementForActionType_image_willStartActionHandler_didEndActionHandler___block_invoke;
    v19[3] = &unk_1E5DC2488;
    id v21 = v12;
    v19[4] = self;
    id v20 = v10;
    id v22 = v13;
    id v17 = [v15 createPreviewActionWithTitle:v16 image:v11 handler:v19];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __106__PXPhotoKitAssetActionManager_menuElementForActionType_image_willStartActionHandler_didEndActionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  [*(id *)(a1 + 32) _handleAction:v4 actionType:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 56)];
}

- (id)previewActionForActionType:(id)a3 image:(id)a4
{
  return [(PXPhotoKitAssetActionManager *)self menuElementForActionType:a3 image:a4 willStartActionHandler:0 didEndActionHandler:0];
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  id v6 = (void *)[v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v6 = [v6 createBarButtonItemWithTarget:self action:sel__handleBarButtonItem_ actionManager:self];
    if (v6)
    {
      id v7 = [(PXPhotoKitAssetActionManager *)self _actionTypeByBarButtonItem];
      [v7 setObject:v4 forKey:v6];
    }
  }

  return v6;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4 = a3;
  if ([(PXPhotoKitAssetActionManager *)self canPerformActionType:v4]
    && ([(PXPhotoKitAssetActionManager *)self _performerClassByType],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = (objc_class *)[v5 objectForKeyedSubscript:v4],
        v5,
        v6))
  {
    id v7 = (void *)[[v6 alloc] initWithActionType:v4];
    id v8 = [(PXPhotoKitAssetActionManager *)self _selectionSnapshotForPerformerClass:v6 applySubsetIfNeeded:1];
    [v7 setSelectionSnapshot:v8];

    id v9 = [(PXPhotoKitAssetActionManager *)self dataSourceManager];
    [v7 setPhotoKitDataSourceManager:v9];

    id v10 = [(PXPhotoKitAssetActionManager *)self person];
    [v7 setPerson:v10];

    id v11 = [(PXPhotoKitAssetActionManager *)self socialGroup];
    [v7 setSocialGroup:v11];

    id v12 = [(PXAssetActionManager *)self objectReference];
    [v7 setObjectReference:v12];

    id v13 = [(PXPhotoKitAssetActionManager *)self importStatusManager];
    [v7 setImportStatusManager:v13];

    BOOL v14 = [(PXPhotoKitAssetActionManager *)self importSessionID];
    [v7 setImportSessionID:v14];

    objc_msgSend(v7, "setPresentationSource:", -[PXPhotoKitAssetActionManager presentationSource](self, "presentationSource"));
    id v15 = [(PXAssetActionManager *)self selectionManager];
    [v7 setSelectionManager:v15];

    uint64_t v16 = [(PXActionManager *)self performerDelegate];
    [v7 setDelegate:v16];

    id v17 = [(PXPhotoKitAssetActionManager *)self radarConfigurationProvider];
    [v7 setRadarConfigurationProvider:v17];

    objc_msgSend(v7, "setSupportsAirPlay:", -[PXPhotoKitAssetActionManager supportsAirPlay](self, "supportsAirPlay"));
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)canPerformAssetVariationActions
{
  uint64_t v3 = @"PXAssetActionTypeVariationAutoloop";
  LOBYTE(self) = [(PXPhotoKitAssetActionManager *)self canPerformActionType:@"PXAssetActionTypeVariationAutoloop"];

  return (char)self;
}

- (BOOL)shouldEnableActionType:(id)a3 onAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"PXAssetActionTypeAddToLibrary"])
  {
    id v8 = [(PXPhotoKitAssetActionManager *)self importStatusManager];
    id v9 = v8;
    BOOL v10 = 0;
    if (v7 && v8)
    {
      uint64_t v11 = [v8 importStateForAsset:v7];
      if (v11) {
        BOOL v12 = v11 == 3;
      }
      else {
        BOOL v12 = 1;
      }
      BOOL v10 = v12;
    }
  }
  else
  {
    if ([v6 isEqualToString:@"PXAssetActionTypeMergeDuplicates"])
    {
      id v13 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
      BOOL v14 = (void *)[v13 objectForKeyedSubscript:v6];

      unsigned __int8 v15 = [v14 shouldEnableWithActionManager:self];
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)PXPhotoKitAssetActionManager;
      unsigned __int8 v15 = [(PXAssetActionManager *)&v17 shouldEnableActionType:v6 onAsset:v7];
    }
    BOOL v10 = v15;
  }

  return v10;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  id v6 = (void *)[v5 objectForKeyedSubscript:v4];

  return [v6 isActionDestructive];
}

- (BOOL)supportsActionType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotoKitAssetActionManager *)self _dataSourceSnapshot];
  uint64_t v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_11;
  }
  BOOL v7 = [(PXActionManager *)self isActionTypeAllowed:v4];

  if (!v7) {
    goto LABEL_11;
  }
  id v8 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
  id v9 = (void *)[v8 objectForKeyedSubscript:v4];

  if (!v9) {
    goto LABEL_11;
  }
  if (![v4 isEqualToString:@"PXAssetActionTypeToggleSelection"]
    || ([(PXActionManager *)self allowedActionTypes],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 containsObject:@"PXAssetActionTypeToggleSelection"],
        v10,
        (v11 & 1) != 0))
  {
    if (![v4 isEqualToString:@"PXAssetActionTypePickAsset"]
      || ([(PXActionManager *)self allowedActionTypes],
          BOOL v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 containsObject:@"PXAssetActionTypePickAsset"],
          v12,
          v13))
    {
      char v14 = [v9 canPerformWithActionManager:self];
      goto LABEL_12;
    }
LABEL_11:
    char v14 = 0;
    goto LABEL_12;
  }
  uint64_t v16 = [(PXActionManager *)self allowedActionTypes];
  if ([v16 containsObject:@"PXAssetActionTypeToggleSelection"]) {
    char v14 = 1;
  }
  else {
    char v14 = [(PXPhotoKitAssetActionManager *)self canPerformActionType:@"PXAssetActionTypeMergeDuplicates"];
  }

LABEL_12:
  return v14;
}

- (id)_selectionSnapshotForPerformerClass:(Class)a3 applySubsetIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = [(PXAssetActionManager *)self effectiveSelectionSnapshot];
  id v9 = [v8 dataSource];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v29);
    v30 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v26 handleFailureInMethod:a2, self, @"PXPhotoKitAssetActionManager.m", 245, @"%@ should be an instance inheriting from %@, but it is %@", @"selectionSnapshot.dataSource", v28, v30 object file lineNumber description];
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    [v26 handleFailureInMethod:a2, self, @"PXPhotoKitAssetActionManager.m", 245, @"%@ should be an instance inheriting from %@, but it is nil", @"selectionSnapshot.dataSource", v28 object file lineNumber description];
  }

LABEL_3:
  if ([v8 isAnyItemSelected])
  {
    if ([(objc_class *)a3 canPerformOnSubsetOfSelection] && v4)
    {
      id v10 = objc_alloc_init((Class)off_1E5DA7430);
      char v11 = [v9 photosDataSource];
      BOOL v12 = [v8 selectedIndexPaths];
      int v13 = [(PXPhotoKitAssetActionManager *)self person];
      char v14 = [(PXPhotoKitAssetActionManager *)self socialGroup];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __88__PXPhotoKitAssetActionManager__selectionSnapshotForPerformerClass_applySubsetIfNeeded___block_invoke;
      v31[3] = &unk_1E5DC5E78;
      id v35 = v10;
      Class v36 = a3;
      id v32 = v11;
      id v33 = v13;
      id v34 = v14;
      id v15 = v10;
      id v16 = v14;
      id v17 = v13;
      id v18 = v11;
      [v12 enumerateItemIndexPathsUsingBlock:v31];
      uint64_t v19 = [objc_alloc((Class)off_1E5DA84E8) initWithDataSource:v9 selectedIndexPaths:v15];

      id v8 = (void *)v19;
    }
  }
  else
  {
    id v20 = [v9 containerCollection];
    int v21 = [(objc_class *)a3 canPerformOnImplicitSelectionInContainerCollection:v20];

    if (v21)
    {
      id v22 = objc_alloc((Class)off_1E5DA84E8);
      uint64_t v23 = [v9 allItemIndexPaths];
      uint64_t v24 = [v22 initWithDataSource:v9 selectedIndexPaths:v23];

      id v8 = (void *)v24;
    }
  }

  return v8;
}

void __88__PXPhotoKitAssetActionManager__selectionSnapshotForPerformerClass_applySubsetIfNeeded___block_invoke(uint64_t a1, long long *a2)
{
  BOOL v4 = [*(id *)(a1 + 32) assetCollectionForSection:*((void *)a2 + 1)];
  uint64_t v5 = *(void **)(a1 + 32);
  long long v6 = a2[1];
  long long v10 = *a2;
  long long v11 = v6;
  BOOL v7 = [v5 assetAtSimpleIndexPath:&v10];
  if ([*(id *)(a1 + 64) canPerformOnAsset:v7 inAssetCollection:v4 person:*(void *)(a1 + 40) socialGroup:*(void *)(a1 + 48)])
  {
    id v8 = *(void **)(a1 + 56);
    long long v9 = a2[1];
    long long v10 = *a2;
    long long v11 = v9;
    [v8 addIndexPath:&v10];
  }
}

- (PXPhotosDataSource)_dataSourceSnapshot
{
  v2 = [(PXAssetActionManager *)self selectionManager];
  uint64_t v3 = [v2 selectionSnapshot];

  BOOL v4 = [v3 dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v6 = [v3 dataSource];
    BOOL v7 = [v6 photosDataSource];
  }
  else
  {
    BOOL v7 = 0;
  }

  return (PXPhotosDataSource *)v7;
}

- (unint64_t)presentationSource
{
  return 0;
}

- (void)setSocialGroup:(id)a3
{
  long long v10 = (PHSocialGroup *)a3;
  p_socialGroup = &self->_socialGroup;
  long long v6 = self->_socialGroup;
  BOOL v7 = v10;
  if (v6 != v10)
  {
    char v8 = [(PHSocialGroup *)v10 isEqual:v6];

    if (v8) {
      goto LABEL_7;
    }
    BOOL v7 = [(PHSocialGroup *)*p_socialGroup photoLibrary];
    objc_storeStrong((id *)&self->_socialGroup, a3);
    long long v9 = [(PHSocialGroup *)*p_socialGroup photoLibrary];
    if (v7 != v9)
    {
      objc_msgSend(v7, "px_unregisterChangeObserver:", self);
      objc_msgSend(v9, "px_registerChangeObserver:", self);
    }
  }
LABEL_7:
}

- (void)setPerson:(id)a3
{
  long long v10 = (PHPerson *)a3;
  p_person = &self->_person;
  long long v6 = self->_person;
  BOOL v7 = v10;
  if (v6 != v10)
  {
    char v8 = [(PHPerson *)v10 isEqual:v6];

    if (v8) {
      goto LABEL_7;
    }
    BOOL v7 = [(PHPerson *)*p_person photoLibrary];
    objc_storeStrong((id *)&self->_person, a3);
    long long v9 = [(PHPerson *)*p_person photoLibrary];
    if (v7 != v9)
    {
      objc_msgSend(v7, "px_unregisterChangeObserver:", self);
      objc_msgSend(v9, "px_registerChangeObserver:", self);
    }
  }
LABEL_7:
}

- (PHPhotoLibrary)photoLibrary
{
  v2 = [(PXPhotoKitAssetActionManager *)self dataSourceManager];
  uint64_t v3 = [v2 photoLibrary];

  return (PHPhotoLibrary *)v3;
}

- (void)setAdditionalPropertiesFromActionManager:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotoKitAssetActionManager;
  [(PXAssetActionManager *)&v14 setAdditionalPropertiesFromActionManager:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    long long v6 = [v5 importSessionID];
    [(PXPhotoKitAssetActionManager *)self setImportSessionID:v6];

    BOOL v7 = [v5 importStatusManager];
    [(PXPhotoKitAssetActionManager *)self setImportStatusManager:v7];

    char v8 = [v5 person];
    [(PXPhotoKitAssetActionManager *)self setPerson:v8];

    long long v9 = [v5 socialGroup];
    [(PXPhotoKitAssetActionManager *)self setSocialGroup:v9];

    long long v10 = [(PXPhotoKitAssetActionManager *)self dataSourceManager];

    if (!v10)
    {
      long long v11 = [v5 dataSourceManager];
      [(PXPhotoKitAssetActionManager *)self setDataSourceManager:v11];
    }
    BOOL v12 = [(PXPhotoKitAssetActionManager *)self _performerClassByType];
    int v13 = [v5 _performerClassByType];
    [v12 addEntriesFromDictionary:v13];
  }
}

+ (id)selectedAssetForActionManager:(id)a3
{
  id v3 = a3;
  id v4 = [v3 selectionManager];
  id v5 = [v4 selectionSnapshot];
  long long v6 = [v5 firstObject];

  if (v6)
  {
    id v7 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v9 = [NSString stringWithUTF8String:"+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]"];
    long long v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    BOOL v12 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v8 handleFailureInFunction:v9, @"PXPhotoKitAssetActionManager.m", 375, @"%@ should be an instance inheriting from %@, but it is %@", @"selectedObject", v11, v12 file lineNumber description];
    goto LABEL_18;
  }
  char v8 = [v3 objectReference];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = [NSString stringWithUTF8String:"+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]"];
    id v18 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v18);
    uint64_t v19 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v14 handleFailureInFunction:v15, @"PXPhotoKitAssetActionManager.m", 372, @"%@ should be an instance inheriting from %@, but it is %@", @"actionManager.objectReference", v17, v19 file lineNumber description];
  }
  else
  {
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = [NSString stringWithUTF8String:"+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]"];
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    [v14 handleFailureInFunction:v15, @"PXPhotoKitAssetActionManager.m", 372, @"%@ should be an instance inheriting from %@, but it is nil", @"actionManager.objectReference", v17 file lineNumber description];
  }

LABEL_6:
  id v7 = [v8 asset];
  if (!v7)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v11 = [NSString stringWithUTF8String:"+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]"];
    id v20 = (objc_class *)objc_opt_class();
    BOOL v12 = NSStringFromClass(v20);
    [v9 handleFailureInFunction:v11, @"PXPhotoKitAssetActionManager.m", 373, @"%@ should be an instance inheriting from %@, but it is nil", @"assetReference.asset", v12, v23 file lineNumber description];
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v11 = [NSString stringWithUTF8String:"+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]"];
    int v21 = (objc_class *)objc_opt_class();
    BOOL v12 = NSStringFromClass(v21);
    id v22 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v9 handleFailureInFunction:v11, @"PXPhotoKitAssetActionManager.m", 373, @"%@ should be an instance inheriting from %@, but it is %@", @"assetReference.asset", v12, v22 file lineNumber description];

LABEL_18:
  }

LABEL_9:
  return v7;
}

@end