@interface WFLinkNotesOpenFolderAction
- (id)localizedCategoryWithContext:(id)a3;
@end

@implementation WFLinkNotesOpenFolderAction

- (id)localizedCategoryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"NotesSubcategoryFolders", @"Folders");
  v5 = [v3 localize:v4];

  return v5;
}

@end