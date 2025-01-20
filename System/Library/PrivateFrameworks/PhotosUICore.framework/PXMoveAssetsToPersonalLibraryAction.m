@interface PXMoveAssetsToPersonalLibraryAction
- (id)actionIdentifier;
- (id)localizedActionName;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXMoveAssetsToPersonalLibraryAction

- (void)performUndo:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetsAction *)self assets];
  PXSharedLibraryMoveAssetsToSharedLibrary(v5, v4);
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetsAction *)self assets];
  PXSharedLibraryMoveAssetsToPersonalLibrary(v5, v4);
}

- (id)localizedActionName
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToPersonalLibrary");
}

- (id)actionIdentifier
{
  return @"MoveAssetsToPersonalLibrary";
}

@end