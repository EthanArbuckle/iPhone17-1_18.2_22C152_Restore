@interface TextDrawing.Cache.Key
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation TextDrawing.Cache.Key

- (int64_t)hash
{
  sub_AB8830();
  swift_retain();
  sub_120354();
  Swift::Int v2 = sub_AB8880();
  swift_release();
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    _s5CacheC3KeyCMa();
    swift_retain();
    swift_unknownObjectRetain();
    v4 = (void *)swift_dynamicCastClass();
    if (v4) {
      char v5 = sub_120654(self, v4);
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