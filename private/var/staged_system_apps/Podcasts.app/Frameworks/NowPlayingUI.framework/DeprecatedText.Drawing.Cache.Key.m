@interface DeprecatedText.Drawing.Cache.Key
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation DeprecatedText.Drawing.Cache.Key

- (int64_t)hash
{
  swift_retain();
  Swift::Int v2 = sub_B13C();
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
      char v5 = sub_B514(self, v4);
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