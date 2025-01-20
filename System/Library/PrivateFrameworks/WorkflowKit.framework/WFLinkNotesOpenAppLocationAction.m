@interface WFLinkNotesOpenAppLocationAction
- (id)entityName;
- (id)localizedCategoryWithContext:(id)a3;
@end

@implementation WFLinkNotesOpenAppLocationAction

- (id)localizedCategoryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"NotesSubcategoryApp", @"App");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)entityName
{
  return WFLocalizedStringResourceWithKey(@"Notes View", @"Notes View");
}

@end