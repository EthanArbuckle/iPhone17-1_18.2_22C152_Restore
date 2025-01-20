@interface PXPhotoKitAssetCollectionActionManager
+ (PXPhotoKitAssetCollectionActionManager)actionManagerWithDataSourceManager:(id)a3;
- (BOOL)canPerformActionType:(id)a3 assetCollectionReference:(id)a4;
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (BOOL)isDestructiveActionType:(id)a3;
- (BOOL)supportsActionType:(id)a3;
- (Class)_possiblePerformerClassForActionType:(id)a3 assetCollectionReference:(id)a4;
- (Class)_possiblePerformerClassForActionType:(id)a3 assetCollectionReference:(id)a4 requireThatPerformerCanPerformAction:(BOOL)a5;
- (NSDictionary)performerClassByType;
- (NSMapTable)_actionTypeByBarButtonItem;
- (PXAssetCollectionActionPerformer)_activePerformer;
- (PXAssetsDataSource)assetsDataSource;
- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory;
- (PXPhotoKitAssetCollectionActionManager)initWithAssetCollectionReference:(id)a3 displayTitleInfo:(id)a4;
- (id)actionPerformerForActionType:(id)a3 assetCollectionReference:(id)a4;
- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4;
- (id)activityForActionType:(id)a3;
- (id)barButtonItemForActionType:(id)a3;
- (id)contextMenuElementsWithHandler:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4 assetCollectionReference:(id)a5;
- (id)menuElementsForActionType:(id)a3 assetCollectionReference:(id)a4;
- (id)standardActionForActionType:(id)a3;
- (id)systemImageNameForActionType:(id)a3 assetCollectionReference:(id)a4;
- (void)_executeActionTypeIfPossible:(id)a3 action:(id)a4;
- (void)_handleActionPerformerComplete:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_handleBarButtonItem:(id)a3;
- (void)_setActivePerformer:(id)a3;
- (void)performActivity:(id)a3;
@end

@implementation PXPhotoKitAssetCollectionActionManager

- (PXPhotoKitAssetCollectionActionManager)initWithAssetCollectionReference:(id)a3 displayTitleInfo:(id)a4
{
  v12[58] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PXPhotoKitAssetCollectionActionManager;
  v4 = [(PXAssetCollectionActionManager *)&v10 initWithAssetCollectionReference:a3 displayTitleInfo:a4];
  if (v4)
  {
    v11[0] = @"PXAssetCollectionActionTypeCreateMemory";
    v12[0] = objc_opt_class();
    v11[1] = @"PXAssetCollectionActionTypeToggleFavorite";
    v12[1] = objc_opt_class();
    v11[2] = @"PXAssetCollectionActionTypeFavorite";
    v12[2] = objc_opt_class();
    v11[3] = @"PXAssetCollectionActionTypeUnfavorite";
    v12[3] = objc_opt_class();
    v11[4] = @"PXAssetCollectionActionTypeDeleteMemory";
    v12[4] = objc_opt_class();
    v11[5] = @"PXAssetCollectionActionTypeRevealInMoment";
    v12[5] = objc_opt_class();
    v11[6] = @"PXAssetCollectionActionTypeSuggestPeople";
    v12[6] = objc_opt_class();
    v11[7] = @"PXAssetCollectionActionTypeFavoritePerson";
    v12[7] = objc_opt_class();
    v11[8] = @"PXAssetCollectionActionTypeCustomizePeopleAlbum";
    v12[8] = objc_opt_class();
    v11[9] = @"PXAssetCollectionActionTypePeopleInternalPromoteAsMagic";
    v12[9] = objc_opt_class();
    v11[10] = @"PXAssetCollectionActionTypeCustomizeSocialGroupAlbum";
    v12[10] = objc_opt_class();
    v11[11] = @"PXAssetCollectionActionTypeRemoveSocialGroupFromHome";
    v12[11] = objc_opt_class();
    v11[12] = @"PXAssetCollectionActionTypeFileRadar";
    v12[12] = objc_opt_class();
    v11[13] = @"PXAssetCollectionActionTypeCopyInternalURL";
    v12[13] = objc_opt_class();
    v11[14] = @"PXAssetCollectionActionTypeBlockMemory";
    v12[14] = objc_opt_class();
    v11[15] = @"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate";
    v12[15] = objc_opt_class();
    v11[16] = @"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval";
    v12[16] = objc_opt_class();
    v11[17] = @"PXAssetCollectionActionTypeBlockMemoryFeatureHoliday";
    v12[17] = objc_opt_class();
    v11[18] = @"PXAssetCollectionActionTypeBlockMemoryFeaturePlace";
    v12[18] = objc_opt_class();
    v11[19] = @"PXAssetCollectionActionTypeBlockMemoryFeaturePerson";
    v12[19] = objc_opt_class();
    v11[20] = @"PXAssetCollectionActionTypeSetScreensaver";
    v12[20] = objc_opt_class();
    v11[21] = @"PXAssetCollectionActionTypeStoryDemo";
    v12[21] = objc_opt_class();
    v11[22] = @"PXAssetCollectionActionTypePlayMovie";
    v12[22] = objc_opt_class();
    v11[23] = @"PXAssetCollectionActionTypeTTRForLemonadeCollections";
    v12[23] = objc_opt_class();
    v11[24] = @"PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer";
    v12[24] = objc_opt_class();
    v11[25] = @"PXAssetCollectionActionTypeMomentShare";
    v12[25] = objc_opt_class();
    v11[26] = @"PXAssetCollectionActionTypeShare";
    v12[26] = objc_opt_class();
    v11[27] = @"PXAssetCollectionActionTypeShowDetails";
    v12[27] = objc_opt_class();
    v11[28] = @"PXAssetCollectionActionTypeShowInAlbum";
    v12[28] = objc_opt_class();
    v11[29] = @"PXAssetCollectionActionTypeShowMap";
    v12[29] = objc_opt_class();
    v11[30] = @"PXAssetCollectionActionTypeTrashMomentShare";
    v12[30] = objc_opt_class();
    v11[31] = @"PXAssetCollectionActionTypeCopyLink";
    v12[31] = objc_opt_class();
    v11[32] = @"PXAssetCollectionActionTypeCMMSaveToLibrary";
    v12[32] = objc_opt_class();
    v11[33] = @"PXAssetCollectionActionTypeAddFrom";
    v12[33] = objc_opt_class();
    v11[34] = @"PXAssetCollectionActionTypeDropAssets";
    v12[34] = objc_opt_class();
    v11[35] = @"PXAssetCollectionActionTypeMoveAssets";
    v12[35] = objc_opt_class();
    v11[36] = @"PXAssetCollectionActionTypeSetSortOrder";
    v12[36] = objc_opt_class();
    v11[37] = @"PXAssetCollectionActionTypePasteAssets";
    v12[37] = objc_opt_class();
    v11[38] = @"PXAssetCollectionActionTypeContentSyndicationSaveToLibrary";
    v12[38] = objc_opt_class();
    v11[39] = @"PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion";
    v12[39] = objc_opt_class();
    v11[40] = @"PXAssetCollectionActionTypeContentSyndicationRemoveSuggestionNoConfirm";
    v12[40] = objc_opt_class();
    v11[41] = @"PXAssetCollectionActionTypeDebugCuration";
    v12[41] = objc_opt_class();
    v11[42] = @"PXAssetCollectionActionTypeRename";
    v12[42] = objc_opt_class();
    v11[43] = @"PXAssetCollectionActionTypeDelete";
    v12[43] = objc_opt_class();
    v11[44] = @"PXAssetCollectionActionTypeAddContent";
    v12[44] = objc_opt_class();
    v11[45] = @"PXAssetCollectionActionTypePersonInfo";
    v12[45] = objc_opt_class();
    v11[46] = @"PXAssetCollectionActionTypeGenerativeStory";
    v12[46] = objc_opt_class();
    v11[47] = @"PXAssetCollectionActionTypeAddPersonToHome";
    v12[47] = objc_opt_class();
    v11[48] = @"PXAssetCollectionActionTypeConfirmAdditionalPeople";
    v12[48] = objc_opt_class();
    v11[49] = @"PXAssetCollectionActionTypeImprovePeopleRecognition";
    v12[49] = objc_opt_class();
    v11[50] = @"PXAssetCollectionActionTypeRemovePersonFromHome";
    v12[50] = objc_opt_class();
    v11[51] = @"PXAssetCollectionActionTypeBlockPerson";
    v12[51] = objc_opt_class();
    v11[52] = @"PXAssetCollectionActionTypeRemoveSharingSuggestion";
    v12[52] = objc_opt_class();
    v11[53] = @"PXAssetCollectionActionTypeMoveToSharedLibrary";
    v12[53] = objc_opt_class();
    v11[54] = @"PXAssetCollectionActionTypeChangePersonSortOrder";
    v12[54] = objc_opt_class();
    v11[55] = @"PXAssetCollectionActionTypeCustomize";
    v12[55] = objc_opt_class();
    v11[56] = @"PXAssetCollectionActionTypeCustomizeMemory";
    v12[56] = objc_opt_class();
    v11[57] = @"PXAssetCollectionActionTypeMoveOut";
    v12[57] = objc_opt_class();
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:58];
    performerClassByType = v4->_performerClassByType;
    v4->_performerClassByType = (NSDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    actionTypeByBarButtonItem = v4->__actionTypeByBarButtonItem;
    v4->__actionTypeByBarButtonItem = (NSMapTable *)v7;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activePerformer, 0);
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_storeStrong((id *)&self->__actionTypeByBarButtonItem, 0);
}

- (void)_setActivePerformer:(id)a3
{
}

- (PXAssetCollectionActionPerformer)_activePerformer
{
  return self->__activePerformer;
}

- (NSDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (NSMapTable)_actionTypeByBarButtonItem
{
  return self->__actionTypeByBarButtonItem;
}

- (void)performActivity:(id)a3
{
  id v4 = [a3 actionType];
  [(PXPhotoKitAssetCollectionActionManager *)self _executeActionTypeIfPossible:v4 action:0];
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v5 = a4;
  v6 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  if (!v6) {
    PXAssertGetLog();
  }
  uint64_t v7 = [v5 actionType];
  v8 = [(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:v7 assetCollectionReference:v6];

  v9 = [v5 actionType];
  char v10 = [(objc_class *)v8 canPerformActionType:v9 onAssetCollectionReference:v6 withInputs:self];

  return v10;
}

- (void)_handleActionPerformerComplete:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PXPhotoKitAssetCollectionActionManager *)self _activePerformer];

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
    -[PXPhotoKitAssetCollectionActionManager _setActivePerformer:](self, "_setActivePerformer:", 0, *(_OWORD *)v13);
  }
}

- (void)_executeActionTypeIfPossible:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PXPhotoKitAssetCollectionActionManager *)self _activePerformer];
  if (v8)
  {
    id v9 = (id)v8;
    id v10 = [(PXPhotoKitAssetCollectionActionManager *)self _activePerformer];
    if ((unint64_t)[v10 state] <= 0xA)
    {

      goto LABEL_8;
    }
    BOOL v11 = [(PXAssetCollectionActionManager *)self canPerformActionType:v6];

    if (!v11) {
      goto LABEL_9;
    }
LABEL_6:
    v12 = [(PXAssetCollectionActionManager *)self actionPerformerForActionType:v6];
    v13 = [(PXActionManager *)self performerDelegate];
    [v12 setDelegate:v13];

    __int16 v14 = [(PXAssetCollectionActionManager *)self socialGroups];
    [v12 setSocialGroups:v14];

    [v12 setSendingAction:v7];
    [(PXPhotoKitAssetCollectionActionManager *)self _setActivePerformer:v12];
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__PXPhotoKitAssetCollectionActionManager__executeActionTypeIfPossible_action___block_invoke;
    v15[3] = &unk_1E5DD2120;
    objc_copyWeak(&v17, &location);
    id v9 = v12;
    id v16 = v9;
    [v9 performActionWithCompletionHandler:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
LABEL_8:

    goto LABEL_9;
  }
  if ([(PXAssetCollectionActionManager *)self canPerformActionType:v6]) {
    goto LABEL_6;
  }
LABEL_9:
}

void __78__PXPhotoKitAssetCollectionActionManager__executeActionTypeIfPossible_action___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleActionPerformerComplete:*(void *)(a1 + 32) success:a2 error:v6];
}

- (void)_handleBarButtonItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PXPhotoKitAssetCollectionActionManager *)self _actionTypeByBarButtonItem];
    id v6 = [v5 objectForKey:v4];

    [(PXPhotoKitAssetCollectionActionManager *)self _executeActionTypeIfPossible:v6 action:0];
  }
}

- (id)activityForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  if (!v5) {
    PXAssertGetLog();
  }
  id v6 = [(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:v4 assetCollectionReference:v5];
  if (v6)
  {
    id v7 = [(PXPhotoKitAssetCollectionActionManager *)self localizedTitleForActionType:v4 useCase:2 assetCollectionReference:v5];
    uint64_t v8 = [(PXPhotoKitAssetCollectionActionManager *)self systemImageNameForActionType:v4 assetCollectionReference:v5];
    id v6 = [(objc_class *)v6 createActivityWithTitle:v7 actionType:v4 actionSystemImageName:v8];
    [(objc_class *)v6 setActionDelegate:self];
  }
  return v6;
}

- (id)standardActionForActionType:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  if (!v5) {
    PXAssertGetLog();
  }
  id v6 = [(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:v4 assetCollectionReference:v5];
  if (v6)
  {
    id v7 = v6;
    objc_initWeak(location, self);
    uint64_t v8 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__PXPhotoKitAssetCollectionActionManager_standardActionForActionType___block_invoke;
    v11[3] = &unk_1E5DC7448;
    objc_copyWeak(&v13, location);
    id v12 = v4;
    id v9 = [(objc_class *)v7 createStandardActionForAssetCollectionReference:v8 withInput:self handler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __70__PXPhotoKitAssetCollectionActionManager_standardActionForActionType___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _executeActionTypeIfPossible:*(void *)(a1 + 32) action:v4];
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  if (!v5) {
    PXAssertGetLog();
  }
  id v6 = [(objc_class *)[(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:v4 assetCollectionReference:v5 requireThatPerformerCanPerformAction:0] createBarButtonItemForAssetCollectionReference:v5 withTarget:self action:sel__handleBarButtonItem_];
  if (v6)
  {
    id v7 = [(PXPhotoKitAssetCollectionActionManager *)self _actionTypeByBarButtonItem];
    [v7 setObject:v4 forKey:v6];
  }
  return v6;
}

- (id)menuElementsForActionType:(id)a3 assetCollectionReference:(id)a4
{
  id v6 = a4;
  id v7 = [(objc_class *)[(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:a3 assetCollectionReference:v6] menuElementsForAssetCollectionReference:v6 withInputs:self];

  return v7;
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = +[PXAlbumActionMenuBuilder primaryActionTypes];
  id v7 = [(PXActionManager *)self actionItemsForActionTypes:v6 handler:v4];
  [v5 addObjectsFromArray:v7];

  uint64_t v8 = objc_opt_new();
  [v5 addObject:v8];

  id v9 = +[PXAlbumActionMenuBuilder secondaryActionTypes];
  id v10 = [(PXActionManager *)self actionItemsForActionTypes:v9 handler:v4];
  [v5 addObjectsFromArray:v10];

  BOOL v11 = +[PXRootSettings sharedInstance];
  LODWORD(v10) = [v11 canShowInternalUI];

  if (v10)
  {
    id v12 = objc_opt_new();
    [v5 addObject:v12];

    id v13 = +[PXAlbumActionMenuBuilder internalActionTypes];
    __int16 v14 = [(PXActionManager *)self actionItemsForActionTypes:v13 handler:v4];
    id v15 = +[PXActionMenu menuWithTitle:@" Internal" childElements:v14];
    [v5 addObject:v15];
  }
  return v5;
}

- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory
{
  v3 = [(PXActionManager *)self performerDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(PXActionManager *)self performerDelegate];
    id v5 = [v4 memoryAssetsActionFactory];
  }
  else
  {
    id v5 = 0;
  }

  return (PXMemoryAssetsActionFactory *)v5;
}

- (Class)_possiblePerformerClassForActionType:(id)a3 assetCollectionReference:(id)a4 requireThatPerformerCanPerformAction:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  BOOL v11 = 0;
  if (v8)
  {
    if (v9)
    {
      id v12 = [(PXPhotoKitAssetCollectionActionManager *)self performerClassByType];
      BOOL v11 = (void *)[v12 objectForKeyedSubscript:v8];

      if (v5
        && ![v11 canPerformActionType:v8 onAssetCollectionReference:v10 withInputs:self])
      {
        BOOL v11 = 0;
      }
    }
  }
  id v13 = v11;

  return v13;
}

- (Class)_possiblePerformerClassForActionType:(id)a3 assetCollectionReference:(id)a4
{
  return [(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:a3 assetCollectionReference:a4 requireThatPerformerCanPerformAction:1];
}

- (id)systemImageNameForActionType:(id)a3 assetCollectionReference:(id)a4
{
  id v6 = a4;
  id v7 = [(objc_class *)[(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:a3 assetCollectionReference:v6] systemImageNameForAssetCollectionReference:v6 withInputs:self];

  return v7;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4 assetCollectionReference:(id)a5
{
  id v8 = a5;
  id v9 = [(objc_class *)[(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:a3 assetCollectionReference:v8] localizedTitleForUseCase:a4 assetCollectionReference:v8 withInputs:self];

  return v9;
}

- (id)actionPerformerForActionType:(id)a3 assetCollectionReference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:v7 assetCollectionReference:v6];
  id v9 = [v6 assetCollection];
  id v10 = [(PXAssetCollectionActionManager *)self displayTitleInfoForAssetCollection:v9];

  BOOL v11 = (void *)[[v8 alloc] initWithActionType:v7 assetCollectionReference:v6 displayTitleInfo:v10];
  id v12 = [(PXActionManager *)self performerDelegate];
  [v11 setDelegate:v12];

  id v13 = [(PXAssetCollectionActionManager *)self people];
  [v11 setPeople:v13];

  __int16 v14 = [(PXAssetCollectionActionManager *)self socialGroups];
  [v11 setSocialGroups:v14];

  id v15 = [(PXAssetCollectionActionManager *)self dropTargetAssetReference];
  [v11 setDropTargetAssetReference:v15];

  id v16 = [(PXAssetCollectionActionManager *)self dropSession];
  [v11 setDropSession:v16];

  id v17 = [(PXAssetCollectionActionManager *)self dragSession];
  [v11 setDragSession:v17];

  v18 = [(PXAssetCollectionActionManager *)self assetsDataSourceManager];
  v19 = [v18 dataSource];
  [v11 setAssetsDataSource:v19];

  v20 = [(PXAssetCollectionActionManager *)self assetsFetchResult];
  [v11 setAssetsFetchResult:v20];

  return v11;
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXAssetCollectionActionManager *)self assetCollectionReference];
  id v9 = [(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:v6 assetCollectionReference:v8];
  if (v9)
  {
    id v10 = (void *)[[v9 alloc] initWithActionType:v6 assetCollectionReference:v8 parameters:v7];
    BOOL v11 = [(PXActionManager *)self performerDelegate];
    [v10 setDelegate:v11];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  BOOL v5 = [(PXPhotoKitAssetCollectionActionManager *)self performerClassByType];
  id v6 = (void *)[v5 objectForKeyedSubscript:v4];

  return [v6 isActionDestructive];
}

- (BOOL)supportsActionType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  BOOL v5 = [(PXPhotoKitAssetCollectionActionManager *)self performerClassByType];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)canPerformActionType:(id)a3 assetCollectionReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXActionManager *)self isActionTypeAllowed:v6]) {
    BOOL v8 = [(PXPhotoKitAssetCollectionActionManager *)self _possiblePerformerClassForActionType:v6 assetCollectionReference:v7] != 0;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (PXAssetsDataSource)assetsDataSource
{
  v2 = [(PXAssetCollectionActionManager *)self assetsDataSourceManager];
  v3 = [v2 dataSource];

  return (PXAssetsDataSource *)v3;
}

+ (PXPhotoKitAssetCollectionActionManager)actionManagerWithDataSourceManager:(id)a3
{
  id v5 = a3;
  id v6 = [v5 dataSource];
  id v7 = [v6 containerCollection];

  if (v7)
  {
    if (([v7 canContainAssets] & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:a1 file:@"PXPhotoKitAssetCollectionActionManager.m" lineNumber:369 description:@"PXPhotoKitAssetCollectionActionManager can only created from an AssetCollection"];
    }
    BOOL v8 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:v7 displayTitleInfo:0];
    [(PXAssetCollectionActionManager *)v8 setAssetsDataSourceManager:v5];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end