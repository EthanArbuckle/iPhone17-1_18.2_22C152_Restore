@interface AudioMegamodelHAInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation AudioMegamodelHAInput

- (NSSet)featureNames
{
  swift_retain();
  sub_1C6BA6AA8();
  swift_release();
  v2 = (void *)sub_1C6BA7B28();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1C6BA6B74((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C6BA624C);
}

@end