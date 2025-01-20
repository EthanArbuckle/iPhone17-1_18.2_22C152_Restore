@interface PervasiveEntityResolutionOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PervasiveEntityResolutionOutput

- (NSSet)featureNames
{
  swift_retain();
  sub_1C68E6FD4();
  swift_release();
  v2 = (void *)sub_1C68ECD48();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1C68E8594((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C68E702C);
}

@end