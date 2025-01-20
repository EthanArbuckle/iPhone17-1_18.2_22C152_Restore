@interface REMSuggestedAttributesFeatureExtractor
+ (BOOL)supportsSecureCoding;
- (_TtC19ReminderKitInternal38REMSuggestedAttributesFeatureExtractor)initWithCoder:(id)a3;
- (_TtC19ReminderKitInternal38REMSuggestedAttributesFeatureExtractor)initWithFetchResultTokenToDiffAgainst:(id)a3;
@end

@implementation REMSuggestedAttributesFeatureExtractor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC19ReminderKitInternal38REMSuggestedAttributesFeatureExtractor)initWithCoder:(id)a3
{
  return [(REMStoreSwiftInvocation *)self init];
}

- (_TtC19ReminderKitInternal38REMSuggestedAttributesFeatureExtractor)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithFetchResultTokenToDiffAgainst:a3];
}

@end