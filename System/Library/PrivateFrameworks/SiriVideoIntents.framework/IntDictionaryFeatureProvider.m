@interface IntDictionaryFeatureProvider
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation IntDictionaryFeatureProvider

- (NSSet)featureNames
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22BD4B0F0();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_22BD4ADA0();
  unint64_t v5 = v4;
  swift_retain();
  id v6 = sub_22BCD3728(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end