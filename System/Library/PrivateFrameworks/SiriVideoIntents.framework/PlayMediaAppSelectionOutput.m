@interface PlayMediaAppSelectionOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PlayMediaAppSelectionOutput

- (NSSet)featureNames
{
  swift_retain();
  sub_22BBA7560();
  swift_release();
  v2 = (void *)sub_22BD4B0F0();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_22BBA7620((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_22BBA75B8);
}

@end