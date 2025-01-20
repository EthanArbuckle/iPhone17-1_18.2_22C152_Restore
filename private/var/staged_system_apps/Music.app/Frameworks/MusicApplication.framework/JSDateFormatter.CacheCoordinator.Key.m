@interface JSDateFormatter.CacheCoordinator.Key
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation JSDateFormatter.CacheCoordinator.Key

- (int64_t)hash
{
  sub_AB8830();
  swift_retain();
  sub_A1E784((uint64_t)v4);
  Swift::Int v2 = sub_AB8880();
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
      char v5 = sub_A1FD5C((uint64_t)self, v4);
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