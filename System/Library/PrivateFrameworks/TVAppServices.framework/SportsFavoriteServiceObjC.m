@interface SportsFavoriteServiceObjC
+ (uint64_t)accountDidChange;
+ (void)markCacheTopicDirty:(unint64_t)a3;
- (SportsFavoriteServiceObjC)init;
@end

@implementation SportsFavoriteServiceObjC

+ (void)markCacheTopicDirty:(unint64_t)a3
{
}

- (SportsFavoriteServiceObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)SportsFavoriteServiceObjC;
  return [(SportsFavoriteServiceObjC *)&v3 init];
}

+ (uint64_t)accountDidChange
{
  if (qword_26B38F7D0 != -1) {
    swift_once();
  }
  sub_25E885898();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B390A00);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25E8868B0;
  *(void *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B390B10);
  *(void *)(v0 + 64) = sub_25E7DF6AC();
  *(void *)(v0 + 32) = &unk_270B5EB50;
  sub_25E885408();
  swift_bridgeObjectRelease();
  if (qword_26B3908B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26B390898;
  swift_bridgeObjectRetain();
  sub_25E85EB34();
  swift_bridgeObjectRelease();

  if (qword_26B390858 != -1) {
    swift_once();
  }
  return sub_25E86BEC8();
}

@end