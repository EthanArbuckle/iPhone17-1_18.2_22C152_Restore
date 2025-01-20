@interface MKCircle
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation MKCircle

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = MKCircle.isEqual(_:)((uint64_t)v8);

  sub_100067244((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = MKCircle.hash.getter();

  return v3;
}

@end