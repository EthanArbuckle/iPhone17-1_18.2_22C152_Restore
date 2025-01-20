@interface SILFlipBookTransitionPoint
+ (id)parseTransitionPoints:(id)a3 :(id)a4 error:(id *)a5;
- (_TtC10SILManager26SILFlipBookTransitionPoint)init;
- (const)end;
- (const)ranges;
- (id)init:(id)a3 :(unsigned __int16)a4 :(id)a5 error:(id *)a6;
- (unsigned)rangesCount;
- (unsigned)startFrame;
- (void)dealloc;
@end

@implementation SILFlipBookTransitionPoint

- (const)end
{
  v3 = [(SILFlipBookTransitionPoint *)self ranges];
  return &v3[[(SILFlipBookTransitionPoint *)self rangesCount]];
}

- (unsigned)startFrame
{
  return *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_startFrame);
}

- (const)ranges
{
  return *(const SILFlipBookRange **)((char *)&self->super.super.isa
                                    + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_ranges);
}

- (unsigned)rangesCount
{
  return *(_DWORD *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC10SILManager26SILFlipBookTransitionPoint_rangesCount);
}

+ (id)parseTransitionPoints:(id)a3 :(id)a4 error:(id *)a5
{
  type metadata accessor for FrameDesc();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  specialized static SILFlipBookTransitionPoint.parseTransitionPoints(_:_:)(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for SILFlipBookTransitionPoint();
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v7.super.isa;
}

- (id)init:(id)a3 :(unsigned __int16)a4 :(id)a5 error:(id *)a6
{
  type metadata accessor for FrameDesc();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  SILFlipBookTransitionPoint.init(_:_:_:)(v7, a4, v8);
  return result;
}

- (void)dealloc
{
}

- (_TtC10SILManager26SILFlipBookTransitionPoint)init
{
  id result = (_TtC10SILManager26SILFlipBookTransitionPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end