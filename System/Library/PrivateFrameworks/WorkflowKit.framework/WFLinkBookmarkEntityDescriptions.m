@interface WFLinkBookmarkEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkBookmarkEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Bookmarks");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Bookmarks (plural)", @"Bookmarks");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Bookmark", @"Bookmark");
}

@end