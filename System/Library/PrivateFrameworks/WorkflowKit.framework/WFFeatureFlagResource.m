@interface WFFeatureFlagResource
+ (BOOL)mustBeAvailableForDisplay;
- (_TtC11WorkflowKit21WFFeatureFlagResource)init;
- (_TtC11WorkflowKit21WFFeatureFlagResource)initWithDefinition:(id)a3;
- (_TtC11WorkflowKit21WFFeatureFlagResource)initWithDomain:(id)a3 feature:(id)a4 value:(BOOL)a5;
- (void)refreshAvailability;
@end

@implementation WFFeatureFlagResource

- (_TtC11WorkflowKit21WFFeatureFlagResource)initWithDomain:(id)a3 feature:(id)a4 value:(BOOL)a5
{
  uint64_t v6 = sub_1C8532658();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1C8532658();
  WFFeatureFlagResource.init(domain:feature:value:)(v6, v8, v9, v10, a5);
  return result;
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void)refreshAvailability
{
  v2 = self;
  sub_1C7FB8750();
}

- (_TtC11WorkflowKit21WFFeatureFlagResource)initWithDefinition:(id)a3
{
  if (a3) {
    sub_1C8532538();
  }
  WFFeatureFlagResource.init(definition:)();
}

- (_TtC11WorkflowKit21WFFeatureFlagResource)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end