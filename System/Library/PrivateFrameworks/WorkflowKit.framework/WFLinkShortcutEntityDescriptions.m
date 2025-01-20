@interface WFLinkShortcutEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkShortcutEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Shortcuts");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Shortcuts (plural)", @"Shortcuts");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Shortcut", @"Shortcut");
}

@end