@interface PXFileBackedAssetActionPerformer
+ (BOOL)canPerformOnImplicitSelection;
+ (BOOL)canPerformWithActionManager:(id)a3;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3;
@end

@implementation PXFileBackedAssetActionPerformer

+ (BOOL)canPerformOnImplicitSelection
{
  return 0;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3
{
  return 0;
}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  v4 = [a3 _selectionSnapshotForPerformerClass:a1];
  if (v4) {
    char v5 = [a1 canPerformWithSelectionSnapshot:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

@end