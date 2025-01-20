@interface PhoneAppPredictorPeopleCentricInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PhoneAppPredictorPeopleCentricInput

- (NSSet)featureNames
{
  swift_retain();
  sub_1C68E76B0();
  swift_release();
  v2 = (void *)sub_1C68ECD48();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1C68E7830((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C68E76BC);
}

@end