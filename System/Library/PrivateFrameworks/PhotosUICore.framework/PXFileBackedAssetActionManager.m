@interface PXFileBackedAssetActionManager
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)supportsActionType:(id)a3;
- (NSMutableDictionary)performerClassByType;
- (PXFileBackedAssetActionManager)initWithSelectionManager:(id)a3;
- (id)_selectionSnapshotForPerformerClass:(Class)a3;
- (id)actionPerformerForActionType:(id)a3;
@end

@implementation PXFileBackedAssetActionManager

- (void).cxx_destruct
{
}

- (NSMutableDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (id)_selectionSnapshotForPerformerClass:(Class)a3
{
  v4 = [(PXAssetActionManager *)self selectionManager];
  v5 = [v4 selectionSnapshot];

  if ([(objc_class *)a3 canPerformOnImplicitSelection]
    && ([v5 isAnyItemSelected] & 1) == 0)
  {
    v6 = [v5 dataSource];
    id v7 = objc_alloc((Class)off_1E5DA84E8);
    v8 = [v6 allItemIndexPaths];
    uint64_t v9 = [v7 initWithDataSource:v6 selectedIndexPaths:v8];

    v5 = (void *)v9;
  }
  return v5;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4 = a3;
  if ([(PXFileBackedAssetActionManager *)self canPerformActionType:v4]
    && ([(PXFileBackedAssetActionManager *)self performerClassByType],
        v5 = objc_claimAutoreleasedReturnValue(),
        v6 = (objc_class *)[v5 objectForKeyedSubscript:v4],
        v5,
        v6))
  {
    id v7 = (void *)[[v6 alloc] initWithActionType:v4];
    v8 = [(PXFileBackedAssetActionManager *)self _selectionSnapshotForPerformerClass:v6];
    [v7 setSelectionSnapshot:v8];

    uint64_t v9 = [(PXAssetActionManager *)self selectionManager];
    [v7 setSelectionManager:v9];

    v10 = [(PXActionManager *)self performerDelegate];
    [v7 setDelegate:v10];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  if (v4
    && [(PXActionManager *)self isActionTypeAllowed:v4]
    && ([(PXFileBackedAssetActionManager *)self performerClassByType],
        v5 = objc_claimAutoreleasedReturnValue(),
        v6 = (void *)[v5 objectForKeyedSubscript:v4],
        v5,
        v6))
  {
    char v7 = [v6 canPerformWithActionManager:self];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)supportsActionType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(PXFileBackedAssetActionManager *)self performerClassByType];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (PXFileBackedAssetActionManager)initWithSelectionManager:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXFileBackedAssetActionManager;
  v3 = [(PXAssetActionManager *)&v7 initWithSelectionManager:a3];
  if (v3)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    performerClassByType = v3->_performerClassByType;
    v3->_performerClassByType = v4;

    [(NSMutableDictionary *)v3->_performerClassByType setObject:objc_opt_class() forKeyedSubscript:@"PXAssetActionTypeAddToLibrary"];
  }
  return v3;
}

@end