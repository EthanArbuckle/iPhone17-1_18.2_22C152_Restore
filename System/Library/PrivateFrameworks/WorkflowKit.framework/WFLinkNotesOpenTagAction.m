@interface WFLinkNotesOpenTagAction
- (id)localizedCategoryWithContext:(id)a3;
@end

@implementation WFLinkNotesOpenTagAction

- (id)localizedCategoryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"NotesSubcategoryTags", @"Tags");
  v5 = [v3 localize:v4];

  return v5;
}

@end