@interface BloomFilterShim
- (BOOL)contains:(id)a3;
- (_TtC22WebContentRestrictions15BloomFilterShim)init;
- (_TtC22WebContentRestrictions15BloomFilterShim)initWithPath:(id)a3;
@end

@implementation BloomFilterShim

- (_TtC22WebContentRestrictions15BloomFilterShim)initWithPath:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC22WebContentRestrictions15BloomFilterShim *)BloomFilterShim.init(path:)(v3, v4);
}

- (BOOL)contains:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = BloomFilterShim.contains(_:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (_TtC22WebContentRestrictions15BloomFilterShim)init
{
  result = (_TtC22WebContentRestrictions15BloomFilterShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end