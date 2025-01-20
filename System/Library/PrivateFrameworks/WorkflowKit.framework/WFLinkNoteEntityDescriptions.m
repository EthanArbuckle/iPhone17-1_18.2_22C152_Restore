@interface WFLinkNoteEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkNoteEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Notes");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Notes (plural)", @"Notes");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Note", @"Note");
}

@end