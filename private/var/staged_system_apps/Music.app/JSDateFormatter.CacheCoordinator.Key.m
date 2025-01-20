@interface JSDateFormatter.CacheCoordinator.Key
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation JSDateFormatter.CacheCoordinator.Key

- (int64_t)hash
{
  Hasher.init(_seed:)();
  swift_retain();
  sub_100CD93E0((uint64_t)v4);
  Swift::Int v2 = Hasher._finalize()();
  swift_release();
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    swift_retain();
    swift_unknownObjectRetain();
    uint64_t v4 = swift_dynamicCastClass();
    if (v4) {
      char v5 = sub_100CDA9B8((uint64_t)self, v4);
    }
    else {
      char v5 = 0;
    }
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

@end