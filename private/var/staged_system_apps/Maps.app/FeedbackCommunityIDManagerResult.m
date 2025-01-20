@interface FeedbackCommunityIDManagerResult
- (FeedbackCommunityIDManagerResult)init;
- (NSString)anonymousId;
@end

@implementation FeedbackCommunityIDManagerResult

- (NSString)anonymousId
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (FeedbackCommunityIDManagerResult)init
{
  result = (FeedbackCommunityIDManagerResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end