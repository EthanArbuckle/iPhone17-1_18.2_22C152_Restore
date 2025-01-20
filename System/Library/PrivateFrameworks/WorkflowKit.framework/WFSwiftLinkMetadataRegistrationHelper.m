@interface WFSwiftLinkMetadataRegistrationHelper
+ (BOOL)registerWithBundle:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (WFSwiftLinkMetadataRegistrationHelper)init;
@end

@implementation WFSwiftLinkMetadataRegistrationHelper

+ (BOOL)registerWithBundle:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  sub_1C8532658();
  id v6 = a3;
  sub_1C7FCC698(v6);
  swift_bridgeObjectRelease();

  return 1;
}

- (WFSwiftLinkMetadataRegistrationHelper)init
{
  return (WFSwiftLinkMetadataRegistrationHelper *)LinkMetadataRegistrationHelper.init()();
}

@end