@interface WFLinkSafariOpenBookmarkAction
- (id)localizedCategoryWithContext:(id)a3;
@end

@implementation WFLinkSafariOpenBookmarkAction

- (id)localizedCategoryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"SafariSubcategoryBookmarks", @"Bookmarks");
  v5 = [v3 localize:v4];

  return v5;
}

@end