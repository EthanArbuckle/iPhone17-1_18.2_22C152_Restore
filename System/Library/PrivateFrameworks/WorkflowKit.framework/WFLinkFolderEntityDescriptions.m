@interface WFLinkFolderEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkFolderEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Folders");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Folders (plural)", @"Folders");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Folder", @"Folder");
}

@end