@interface SILManifest
+ (_TtC10SILManager11SILManifest)manifest;
- (NSArray)indicators;
- (_TtC10SILManager11SILManifest)init;
- (_TtC10SILManager11SILManifest)initWithIndicators:(id)a3;
- (id)indicatorFromName:(id)a3 error:(id *)a4;
- (id)indicatorFromType:(int64_t)a3 error:(id *)a4;
- (int64_t)maxIndicatorBpr;
- (int64_t)maxIndicatorExtent;
@end

@implementation SILManifest

- (NSArray)indicators
{
  type metadata accessor for SILIndicatorDesc();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (_TtC10SILManager11SILManifest)initWithIndicators:(id)a3
{
  type metadata accessor for SILIndicatorDesc();
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC10SILManager11SILManifest *)SILManifest.init(indicators:)(v3);
}

- (id)indicatorFromType:(int64_t)a3 error:(id *)a4
{
  v5 = self;
  v6 = SILManifest.indicatorFrom(type:)(a3);

  return v6;
}

- (id)indicatorFromName:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  v8 = self;
  v9 = SILManifest.indicatorFrom(name:)(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (int64_t)maxIndicatorBpr
{
  NSArray v2 = self;
  Swift::Int v3 = SILManifest.maxIndicatorBpr()();

  return v3;
}

- (int64_t)maxIndicatorExtent
{
  NSArray v2 = self;
  Swift::Int v3 = SILManifest.maxIndicatorExtent()();

  return v3;
}

+ (_TtC10SILManager11SILManifest)manifest
{
  if (one-time initialization token for manifest != -1) {
    swift_once();
  }
  NSArray v2 = (void *)static SILManifest.manifest;
  return (_TtC10SILManager11SILManifest *)v2;
}

- (_TtC10SILManager11SILManifest)init
{
  result = (_TtC10SILManager11SILManifest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end