@interface WFLinkRecordingEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkRecordingEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Recordings");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Recordings (plural)", @"Recordings");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Recording", @"Recording");
}

@end