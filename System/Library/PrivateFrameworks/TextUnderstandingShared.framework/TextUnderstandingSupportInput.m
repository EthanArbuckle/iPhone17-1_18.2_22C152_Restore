@interface TextUnderstandingSupportInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation TextUnderstandingSupportInput

- (NSSet)featureNames
{
  swift_retain();
  sub_25F595320();
  swift_release();
  v2 = (void *)sub_25F5977E0();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_25F5955B4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_25F59532C);
}

@end