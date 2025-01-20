@interface PXPhotoKitCollectionListActionManager
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)isDestructiveActionType:(id)a3;
- (NSDictionary)collectionListActionTypeByGenericType;
- (NSDictionary)performerClassByType;
- (PHCollectionList)collectionList;
- (PXPhotoKitCollectionListActionManager)initWithCollectionList:(id)a3;
- (id)actionPerformerForActionType:(id)a3;
- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4;
- (id)actionTypeForGenericType:(id)a3;
- (id)contextMenuElementsWithHandler:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)systemImageNameForActionType:(id)a3;
- (int64_t)menuActionStateForActionType:(id)a3;
@end

@implementation PXPhotoKitCollectionListActionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionListActionTypeByGenericType, 0);
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
}

- (NSDictionary)collectionListActionTypeByGenericType
{
  return self->_collectionListActionTypeByGenericType;
}

- (NSDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v20[0] = @"PXCollectionListActionTypeSortByName";
  v20[1] = @"PXCollectionListActionTypeSortByCustom";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v7 = [(PXActionManager *)self actionItemsForActionTypes:v6 handler:v4];
  [v5 addObjectsFromArray:v7];

  v19[0] = @"PXCollectionListActionTypeCustomize";
  v19[1] = @"PXCollectionListActionTypeMoveOut";
  v19[2] = @"PXCollectionListActionTypeCreateAlbumWithPhotosPicker";
  v19[3] = @"PXCollectionListActionTypeCreateFolder";
  v19[4] = @"PXCollectionListActionTypeDelete";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
  v9 = [(PXActionManager *)self actionItemsForActionTypes:v8 handler:v4];

  if ([v9 count])
  {
    v10 = objc_opt_new();
    [v5 addObject:v10];

    [v5 addObjectsFromArray:v9];
  }
  v11 = +[PXRootSettings sharedInstance];
  int v12 = [v11 canShowInternalUI];

  if (v12)
  {
    v13 = objc_opt_new();
    [v5 addObject:v13];

    v18 = @"PXCollectionListActionTypeCopyInternalURL";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    v15 = [(PXActionManager *)self actionItemsForActionTypes:v14 handler:v4];
    v16 = +[PXActionMenu menuWithTitle:@" Internal" childElements:v15];
    [v5 addObject:v16];
  }
  return v5;
}

- (int64_t)menuActionStateForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotoKitCollectionListActionManager *)self performerClassByType];
  v6 = (void *)[v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    v7 = [(PXPhotoKitCollectionListActionManager *)self collectionList];
    int64_t v8 = [v6 menuActionStateForCollectionList:v7 actionType:v4];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotoKitCollectionListActionManager *)self performerClassByType];
  v6 = (void *)[v5 objectForKeyedSubscript:v4];

  if (!v6) {
    return 0;
  }
  return [v6 isActionDestructive];
}

- (id)systemImageNameForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotoKitCollectionListActionManager *)self performerClassByType];
  v6 = (void *)[v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    v7 = [(PXPhotoKitCollectionListActionManager *)self collectionList];
    int64_t v8 = [v6 systemImageNameForCollectionList:v7 actionType:v4];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v5 = a3;
  v6 = [(PXPhotoKitCollectionListActionManager *)self performerClassByType];
  v7 = (void *)[v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    int64_t v8 = [(PXPhotoKitCollectionListActionManager *)self collectionList];
    v9 = [v7 localizedTitleForActionType:v5 collectionList:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)actionPerformerForActionType:(id)a3
{
  return [(PXPhotoKitCollectionListActionManager *)self actionPerformerForActionType:a3 parameters:MEMORY[0x1E4F1CC08]];
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(PXPhotoKitCollectionListActionManager *)self performerClassByType];
  v9 = (objc_class *)[v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v10 = [v9 alloc];
    v11 = [(PXPhotoKitCollectionListActionManager *)self collectionList];
    v9 = (objc_class *)[v10 initWithActionType:v6 collectionList:v11 parameters:v7];

    int v12 = [(PXActionManager *)self performerDelegate];
    [(objc_class *)v9 setDelegate:v12];
  }
  return v9;
}

- (id)actionTypeForGenericType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitCollectionListActionManager *)self collectionListActionTypeByGenericType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = [(PXPhotoKitCollectionListActionManager *)self performerClassByType];
  id v6 = (void *)[v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(PXPhotoKitCollectionListActionManager *)self collectionList];
    if ([v6 canPerformOnCollectionList:v7])
    {
      BOOL v8 = [(PXActionManager *)self isActionTypeAllowed:v4];
      BOOL v9 = v4 == @"PXCollectionListActionTypeCopyInternalURL" || v8;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (PXPhotoKitCollectionListActionManager)initWithCollectionList:(id)a3
{
  v18[12] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotoKitCollectionListActionManager;
  id v6 = [(PXPhotoKitCollectionListActionManager *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collectionList, a3);
    v17[0] = @"PXCollectionListActionTypeRename";
    v18[0] = objc_opt_class();
    v17[1] = @"PXCollectionListActionTypeCustomize";
    v18[1] = objc_opt_class();
    v17[2] = @"PXCollectionListActionTypeMoveOut";
    v18[2] = objc_opt_class();
    v17[3] = @"PXCollectionListActionTypeRearrange";
    v18[3] = objc_opt_class();
    v17[4] = @"PXCollectionListActionTypeMove";
    v18[4] = objc_opt_class();
    v17[5] = @"PXCollectionListActionTypeCreateAlbumWithPhotosPicker";
    v18[5] = objc_opt_class();
    v17[6] = @"PXCollectionListActionTypeCreateFolder";
    v18[6] = objc_opt_class();
    v17[7] = @"PXCollectionListActionTypeCreateSharedAlbum";
    v18[7] = objc_opt_class();
    v17[8] = @"PXCollectionListActionTypeDelete";
    v18[8] = objc_opt_class();
    v17[9] = @"PXCollectionListActionTypeCopyInternalURL";
    v18[9] = objc_opt_class();
    v17[10] = @"PXCollectionListActionTypeSortByName";
    v18[10] = objc_opt_class();
    v17[11] = @"PXCollectionListActionTypeSortByCustom";
    v18[11] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:12];
    performerClassByType = v7->_performerClassByType;
    v7->_performerClassByType = (NSDictionary *)v8;

    uint64_t v10 = *(void *)off_1E5DAAEB8;
    v15[0] = *(void *)off_1E5DAAE90;
    v15[1] = v10;
    v16[0] = @"PXCollectionListActionTypeMove";
    v16[1] = @"PXCollectionListActionTypeRearrange";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    collectionListActionTypeByGenericType = v7->_collectionListActionTypeByGenericType;
    v7->_collectionListActionTypeByGenericType = (NSDictionary *)v11;
  }
  return v7;
}

@end