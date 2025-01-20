@interface PXAssetActionManager
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)canPerformAssetVariationActions;
- (BOOL)shouldEnableActionType:(id)a3 onAsset:(id)a4;
- (NSArray)excludedContextMenuActionTypes;
- (PXAssetActionManager)init;
- (PXAssetActionManager)initWithSelectedObjectReference:(id)a3 dataSourceManager:(id)a4;
- (PXAssetActionManager)initWithSelectionManager:(id)a3;
- (PXSectionedObjectReference)objectReference;
- (PXSectionedSelectionManager)selectionManager;
- (PXSelectionSnapshot)effectiveSelectionSnapshot;
- (id)actionPerformerForActionType:(id)a3;
- (id)contextMenuElementsWithHandler:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)systemImageNameForActionType:(id)a3;
- (void)executeActionForActionType:(id)a3 sender:(id)a4 completionHandler:(id)a5;
- (void)executeActionForActionType:(id)a3 withCompletionHandler:(id)a4;
- (void)setExcludedContextMenuActionTypes:(id)a3;
- (void)setObjectReference:(id)a3;
- (void)setSelectionManager:(id)a3;
@end

@implementation PXAssetActionManager

- (PXAssetActionManager)initWithSelectionManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAssetActionManager;
  v6 = [(PXAssetActionManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_selectionManager, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedContextMenuActionTypes, 0);
  objc_storeStrong((id *)&self->_objectReference, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
}

- (void)setExcludedContextMenuActionTypes:(id)a3
{
}

- (NSArray)excludedContextMenuActionTypes
{
  return self->_excludedContextMenuActionTypes;
}

- (void)setObjectReference:(id)a3
{
}

- (PXSectionedObjectReference)objectReference
{
  return self->_objectReference;
}

- (void)setSelectionManager:(id)a3
{
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)executeActionForActionType:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)executeActionForActionType:(id)a3 sender:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v12 handleFailureInMethod:a2, self, @"PXAssetActionManager.m", 208, @"Method %s is a responsibility of subclass %@", "-[PXAssetActionManager executeActionForActionType:sender:completionHandler:]", v14 object file lineNumber description];

  abort();
}

- (PXSelectionSnapshot)effectiveSelectionSnapshot
{
  v3 = [(PXAssetActionManager *)self selectionManager];
  v4 = [v3 selectionSnapshot];

  uint64_t v5 = [(PXAssetActionManager *)self objectReference];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v4 dataSource];
    uint64_t v8 = [v7 identifier];
    [v6 indexPath];
    if (v8 == v17
      || ([v7 objectReferenceForObjectReference:v6],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v6,
          (v6 = (void *)v9) != 0))
    {
      id v10 = [v4 selectedIndexPaths];
      [v6 indexPath];
      char v11 = [v10 containsIndexPath:v16];

      if ((v11 & 1) == 0)
      {
        id v12 = objc_alloc((Class)off_1E5DA84E8);
        [v6 indexPath];
        uint64_t v13 = [v12 initWithDataSource:v7 selectedIndexPath:&v15];

        v4 = (void *)v13;
      }
    }
  }
  return (PXSelectionSnapshot *)v4;
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXAssetActionManager *)self excludedContextMenuActionTypes];
  v6 = +[PXAssetActionMenuBuilder pxMenuElementsForActionManager:self excludedActionTypes:v5 handler:v4];

  return v6;
}

- (id)systemImageNameForActionType:(id)a3
{
  return 0;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  return 0;
}

- (BOOL)canPerformActionType:(id)a3
{
  return 0;
}

- (BOOL)shouldEnableActionType:(id)a3 onAsset:(id)a4
{
  return 1;
}

- (id)actionPerformerForActionType:(id)a3
{
  return 0;
}

- (BOOL)canPerformAssetVariationActions
{
  return 0;
}

- (PXAssetActionManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetActionManager.m", 154, @"%s is not available as initializer", "-[PXAssetActionManager init]");

  abort();
}

- (PXAssetActionManager)initWithSelectedObjectReference:(id)a3 dataSourceManager:(id)a4
{
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 dataSource];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 indexPathForObjectReference:v6];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }

  id v10 = (void *)[objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PXAssetActionManager_initWithSelectedObjectReference_dataSourceManager___block_invoke;
  v13[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
  long long v14 = v16;
  long long v15 = v17;
  [v10 performChanges:v13];
  char v11 = [(PXAssetActionManager *)self initWithSelectionManager:v10];

  return v11;
}

uint64_t __74__PXAssetActionManager_initWithSelectedObjectReference_dataSourceManager___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedIndexPath:v4];
}

@end