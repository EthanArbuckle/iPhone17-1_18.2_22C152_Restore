@interface PhoneAppPredictorInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PhoneAppPredictorInput

- (NSSet)featureNames
{
  swift_retain();
  sub_1C68E8B28();
  swift_release();
  v2 = (void *)sub_1C68ECD48();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1C68E8D34((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C68E8B34);
}

@end