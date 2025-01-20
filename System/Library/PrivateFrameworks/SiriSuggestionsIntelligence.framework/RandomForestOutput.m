@interface RandomForestOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation RandomForestOutput

- (NSSet)featureNames
{
  swift_retain();
  sub_25DC14FD8();
  swift_release();
  v2 = (void *)sub_25DC165E0();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_25DC15098((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_25DC15030);
}

@end