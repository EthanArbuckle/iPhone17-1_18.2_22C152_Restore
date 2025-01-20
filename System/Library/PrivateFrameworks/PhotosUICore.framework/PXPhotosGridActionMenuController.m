@interface PXPhotosGridActionMenuController
- (BOOL)actionsAreExcludedWhenCustomized;
- (BOOL)shouldAllowPerformanceOfActionType:(id)a3;
- (NSArray)additionalActionTypes;
- (PXPhotosGridActionMenuController)initWithActionManagers:(id)a3;
- (PXPhotosGridActionMenuController)initWithActionManagers:(id)a3 viewModel:(id)a4;
- (PXPhotosGridActionMenuCustomizer)actionMenuCustomizer;
- (PXPhotosViewModel)viewModel;
- (id)availableActionTypes;
- (id)availableDestructiveActionTypes;
- (id)availableHeaderActionTypes;
- (id)availableInternalActionTypes;
- (void)customizeActions:(id)a3 withActionTypes:(id)a4;
- (void)setActionMenuCustomizer:(id)a3;
- (void)setAdditionalActionTypes:(id)a3;
- (void)updateActions;
@end

@implementation PXPhotosGridActionMenuController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMenuCustomizer, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_additionalActionTypes, 0);
}

- (void)setActionMenuCustomizer:(id)a3
{
}

- (PXPhotosGridActionMenuCustomizer)actionMenuCustomizer
{
  return self->_actionMenuCustomizer;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setAdditionalActionTypes:(id)a3
{
}

- (NSArray)additionalActionTypes
{
  return self->_additionalActionTypes;
}

- (BOOL)shouldAllowPerformanceOfActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotosGridActionMenuController *)self viewModel];
  v6 = [v5 currentLens];
  char v7 = [v6 allowsActionType:v4];

  return v7;
}

- (BOOL)actionsAreExcludedWhenCustomized
{
  return 1;
}

- (void)customizeActions:(id)a3 withActionTypes:(id)a4
{
  id v11 = a4;
  id v7 = a3;
  v8 = [(PXPhotosGridActionMenuController *)self actionMenuCustomizer];
  if (!v8)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPhotosGridActionMenuController.m", 108, @"Invalid parameter not satisfying: %@", @"actionMenuCustomizer != nil" object file lineNumber description];
  }
  v9 = [v8 customizedActions:v7 actionTypes:v11];
  [v7 setArray:v9];
}

- (id)availableDestructiveActionTypes
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXAssetCollectionActionTypeBlockPerson";
  v4[1] = @"PXAssetCollectionActionTypeRemovePersonFromHome";
  v4[2] = @"PXAssetCollectionActionTypeRemoveSocialGroupFromHome";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)availableHeaderActionTypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXAssetCollectionActionTypePersonInfo";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)availableInternalActionTypes
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXAssetCollectionActionTypeAddPersonToAutoCounter";
  v4[1] = @"PXAssetCollectionActionTypeFileRadar";
  void v4[2] = @"PXAssetCollectionActionTypeDebugCuration";
  v4[3] = @"PXAssetCollectionActionTypeCopyInternalURL";
  void v4[4] = @"PXAssetCollectionActionTypePeopleInternalPromoteAsMagic";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

- (id)availableActionTypes
{
  v10[8] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PXPhotosGridActionMenuController *)self viewModel];
  uint64_t v5 = [v4 searchActionLocation];

  if (v5 == 2) {
    [v3 addObject:@"PXPhotosGridActionSearch"];
  }
  v10[0] = @"PXAssetCollectionActionTypeAddFrom";
  v10[1] = @"PXAssetCollectionActionTypePlayMovie";
  v10[2] = @"PXAssetCollectionActionTypeCustomize";
  v10[3] = @"PXAssetCollectionActionTypeMoveOut";
  v10[4] = @"PXAssetCollectionActionTypeCustomizeMemory";
  v10[5] = @"PXAssetCollectionActionTypeDelete";
  v10[6] = @"PXAssetCollectionActionTypeDeleteMemory";
  v10[7] = @"PXAssetCollectionActionTypeRemoveSharingSuggestion";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:8];
  [v3 addObjectsFromArray:v6];

  id v7 = [(PXPhotosGridActionMenuController *)self additionalActionTypes];

  if (v7)
  {
    v8 = [(PXPhotosGridActionMenuController *)self additionalActionTypes];
    [v3 addObjectsFromArray:v8];
  }
  return v3;
}

- (void)updateActions
{
  v3 = [PXPhotosGridActionMenuCustomizer alloc];
  id v4 = [(PXPhotosGridActionMenuController *)self viewModel];
  uint64_t v5 = [(PXActionMenuController *)self excludedActionTypes];
  v6 = [(PXPhotosGridActionMenuCustomizer *)v3 initWithViewModel:v4 excludedActionTypes:v5];
  [(PXPhotosGridActionMenuController *)self setActionMenuCustomizer:v6];

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosGridActionMenuController;
  [(PXActionMenuController *)&v7 updateActions];
}

- (PXPhotosGridActionMenuController)initWithActionManagers:(id)a3 viewModel:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosGridActionMenuController;
  v8 = [(PXActionMenuController *)&v11 initWithActionManagers:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_viewModel, a4);
  }

  return v9;
}

- (PXPhotosGridActionMenuController)initWithActionManagers:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridActionMenuController.m", 40, @"%s is not available as initializer", "-[PXPhotosGridActionMenuController initWithActionManagers:]");

  abort();
}

@end