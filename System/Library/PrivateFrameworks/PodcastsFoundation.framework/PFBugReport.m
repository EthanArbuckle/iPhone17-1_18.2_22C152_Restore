@interface PFBugReport
- (BOOL)forceSubmissionAttempt;
- (NSString)domainString;
- (NSString)errorKindString;
- (NSString)signature;
- (NSString)systemString;
- (PFBugReport)init;
@end

@implementation PFBugReport

- (NSString)domainString
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

- (NSString)systemString
{
  PodcastsSystem.rawValue.getter();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)errorKindString
{
  sub_1ACC11670();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)forceSubmissionAttempt
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PFBugReport_forceSubmissionAttempt);
}

- (NSString)signature
{
  v2 = self;
  sub_1ACC11A04();

  v3 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PFBugReport)init
{
  result = (PFBugReport *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end