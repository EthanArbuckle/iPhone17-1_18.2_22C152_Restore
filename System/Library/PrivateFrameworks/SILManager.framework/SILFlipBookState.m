@interface SILFlipBookState
- (BOOL)delayed;
- (NSDictionary)transitions;
- (NSString)name;
- (_TtC10SILManager16SILFlipBookState)init;
- (_TtC10SILManager26SILFlipBookTransitionPoint)selfTransition;
- (id)init:(id)a3 name:(id)a4 transitions:(id)a5 delayedStates:(id)a6 error:(id *)a7;
@end

@implementation SILFlipBookState

- (NSString)name
{
  return (NSString *)@objc SILIndicatorDesc.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10SILManager16SILFlipBookState_name);
}

- (_TtC10SILManager26SILFlipBookTransitionPoint)selfTransition
{
  return (_TtC10SILManager26SILFlipBookTransitionPoint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                                 + OBJC_IVAR____TtC10SILManager16SILFlipBookState_selfTransition));
}

- (NSDictionary)transitions
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SILFlipBookTransitionPoint]);
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (BOOL)delayed
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager16SILFlipBookState_delayed);
}

- (id)init:(id)a3 name:(id)a4 transitions:(id)a5 delayedStates:(id)a6 error:(id *)a7
{
  type metadata accessor for FrameDesc();
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [Int]]);
  uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (a6) {
    uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v13 = 0;
  }
  return SILFlipBookState.init(_:name:transitions:delayedStates:)(v8, v9, v11, v12, v13);
}

- (_TtC10SILManager16SILFlipBookState)init
{
  result = (_TtC10SILManager16SILFlipBookState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end