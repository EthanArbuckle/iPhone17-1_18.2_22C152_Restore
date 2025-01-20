@interface EmptyPersonalizationDataGenerator
- (_TtC19NewsPersonalization33EmptyPersonalizationDataGenerator)init;
- (id)generateDerivedData;
@end

@implementation EmptyPersonalizationDataGenerator

- (id)generateDerivedData
{
  v2 = self;
  sub_1DE53BCEC(MEMORY[0x1E4FBC860]);
  id v3 = objc_allocWithZone(MEMORY[0x1E4F7E388]);
  sub_1DE526448(0, (unint64_t *)&qword_1EBEBB7A0);
  v4 = (void *)sub_1DE7B1540();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithAggregates_scoringType_decayRate_, v4, 4, 0.0);

  return v5;
}

- (_TtC19NewsPersonalization33EmptyPersonalizationDataGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(EmptyPersonalizationDataGenerator *)&v3 init];
}

@end