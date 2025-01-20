@interface PXPhotoKitCollectionListActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4;
+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4;
+ (int64_t)menuActionStateForCollectionList:(id)a3 actionType:(id)a4;
- (PHCollectionList)collectionList;
- (PXPhotoKitCollectionListActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4;
- (PXPhotoKitCollectionListActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5;
@end

@implementation PXPhotoKitCollectionListActionPerformer

- (void).cxx_destruct
{
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (PXPhotoKitCollectionListActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4
{
  return [(PXPhotoKitCollectionListActionPerformer *)self initWithActionType:a3 collectionList:a4 parameters:MEMORY[0x1E4F1CC08]];
}

- (PXPhotoKitCollectionListActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXPhotoKitCollectionListActionPerformer.m", 14, @"Invalid parameter not satisfying: %@", @"collectionList" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PXPhotoKitCollectionListActionPerformer;
  v12 = [(PXActionPerformer *)&v16 initWithActionType:v9];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_collectionList, a4);
  }

  return v13;
}

+ (int64_t)menuActionStateForCollectionList:(id)a3 actionType:(id)a4
{
  return 0;
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return 0;
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return 0;
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return 0;
}

@end