@interface NSUserDefaults
- (NSArray)libraryMenuOrderedIdentifiers;
- (NSSet)libraryMenuSelectedIdentifiers;
@end

@implementation NSUserDefaults

- (NSArray)libraryMenuOrderedIdentifiers
{
  v2 = self;
  NSUserDefaults.libraryMenuRevision.getter();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1005E79A0(v4);

  swift_bridgeObjectRelease();
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (NSSet)libraryMenuSelectedIdentifiers
{
  v2 = self;
  NSUserDefaults.libraryMenuRevision.getter();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSArray v5 = sub_1005E7C2C(v4);
  swift_bridgeObjectRelease();
  sub_1005F63B4((uint64_t)v5);

  swift_bridgeObjectRelease();
  v6.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v6.super.isa;
}

@end