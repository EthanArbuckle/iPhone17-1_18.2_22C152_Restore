@interface FeatureProvider
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation FeatureProvider

- (NSSet)featureNames
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D3001FB8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_1D3001B78();
  unint64_t v5 = v4;
  swift_retain();
  id v6 = sub_1D2F0D768(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end