@interface SILFlipBookDesc
+ (float)kFrameDuration;
- (BOOL)transitionSupportedFromState:(id)a3 toState:(id)a4;
- (NSArray)states;
- (NSDictionary)statesInfo;
- (_TtC10SILManager15SILFlipBookDesc)init;
- (id)init:(id)a3 :(id)a4 :(id)a5 error:(id *)a6;
@end

@implementation SILFlipBookDesc

+ (float)kFrameDuration
{
  return 0.008;
}

- (NSArray)states
{
  return (NSArray *)@objc SILConstraints.devices.getter();
}

- (NSDictionary)statesInfo
{
  type metadata accessor for SILFlipBookState();
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (id)init:(id)a3 :(id)a4 :(id)a5 error:(id *)a6
{
  type metadata accessor for FrameDesc();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [String : [Int]]]);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v9 = 0;
  }
  return SILFlipBookDesc.init(_:_:_:)(v7, v8, v9);
}

- (BOOL)transitionSupportedFromState:(id)a3 toState:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  LOBYTE(v8) = SILFlipBookDesc.transitionSupported(fromState:toState:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (_TtC10SILManager15SILFlipBookDesc)init
{
  result = (_TtC10SILManager15SILFlipBookDesc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end