@interface FeatureProvider
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setFeatureNames:(id)a3;
@end

@implementation FeatureProvider

- (NSSet)featureNames
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A59A988();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setFeatureNames:(id)a3
{
  uint64_t v4 = sub_22A59A998();
  swift_beginAccess();
  *(void *)self->featureNames = v4;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (id)featureValueForName:(id)a3
{
  sub_22A59A768();
  swift_retain();
  if (sub_22A54D114((uint64_t)&unk_26DE20CC8) == 55)
  {
    swift_release();
    swift_bridgeObjectRelease();
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)((*((uint64_t (**)(void))self->super.isa + 50))() + 24);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v4;
}

@end