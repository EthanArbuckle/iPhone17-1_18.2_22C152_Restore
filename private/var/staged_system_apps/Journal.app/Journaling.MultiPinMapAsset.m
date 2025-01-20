@interface Journaling.MultiPinMapAsset
- (BOOL)isEqual:(id)a3;
@end

@implementation Journaling.MultiPinMapAsset

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
  char v6 = sub_10003CA20((uint64_t)v8);

  sub_10001457C((uint64_t)v8, &qword_1007FAD50);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end