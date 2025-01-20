@interface DomainPredictionModelInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation DomainPredictionModelInput

- (NSSet)featureNames
{
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_1DCD52B60(v2);
  v3 = (void *)sub_1DD0487C8();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_1DD048408();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_1DCD52CF8(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end