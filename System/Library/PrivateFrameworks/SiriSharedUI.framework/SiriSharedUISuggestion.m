@interface SiriSharedUISuggestion
- (NSString)displayText;
- (NSString)invocationText;
- (NSUUID)suggestionId;
@end

@implementation SiriSharedUISuggestion

- (NSString)displayText
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20CA82EF8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)invocationText
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20CA82EF8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSUUID)suggestionId
{
  v2 = (void *)sub_20CA81D48();
  return (NSUUID *)v2;
}

@end