@interface PXRemoveLibrarySharingSuggestionAction
- (id)actionIdentifier;
- (id)localizedActionName;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXRemoveLibrarySharingSuggestionAction

- (void)performUndo:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetsAction *)self assets];
  PXSharedLibraryAddSharingSuggestions(v5, v4);
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetsAction *)self assets];
  PXSharedLibraryRemoveSharingSuggestions(v5, v4);
}

- (id)localizedActionName
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_RemoveFromSharedLibrarySuggestions");
}

- (id)actionIdentifier
{
  return @"RemoveLibrarySharingSuggestionAction";
}

@end