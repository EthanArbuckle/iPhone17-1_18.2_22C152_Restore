@interface String:
- (Class)NSObject;
@end

@implementation String:

- (Class)NSObject
{
  v5 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v1 = swift_retain();
  if (v5(v1))
  {
    type metadata accessor for NSObject();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v4 = isa;
  }
  else
  {
    Class v4 = 0;
  }
  swift_release();
  return v4;
}

@end