@interface PKStrokeCoherenceSubstrokes
- ($9A9039C197EE2BE25750078BAD60F685)_flags;
- (BOOL)_isHidden;
- (BOOL)hasSubstrokes;
- (CGRect)_bounds;
- (PKInk)ink;
- (PKStrokeCoherenceSubstrokes)init;
- (PKStrokeMask)_strokeMask;
- (id)_substrokesInDrawing:(id)a3;
- (id)descriptionAtDepth:(int64_t)a3;
- (int64_t)_pointsCount;
- (void)_setHidden:(BOOL)a3;
- (void)_setStrokeMask:(id)a3;
- (void)_setStrokeUUID:(id)a3;
- (void)setInk:(id)a3;
- (void)set_bounds:(CGRect)a3;
@end

@implementation PKStrokeCoherenceSubstrokes

- (int64_t)_pointsCount
{
  return 0;
}

- (BOOL)_isHidden
{
  return ![(PKStrokeCoherenceSubstrokes *)self hasSubstrokes];
}

- (void)_setHidden:(BOOL)a3
{
}

- (PKInk)ink
{
  uint64_t v3 = type metadata accessor for PKInk();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = one-time initialization token for substrokesInkType;
  v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v3, (uint64_t)static PKStrokeCoherenceSubstrokes.substrokesInkType);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);

  v10.super.isa = PKInk._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (PKInk *)v10.super.isa;
}

- (void)setInk:(id)a3
{
  uint64_t v5 = type metadata accessor for PKInk();
  MEMORY[0x270FA5388](v5 - 8);
  id v6 = a3;
  uint64_t v7 = self;
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

- (CGRect)_bounds
{
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)set_bounds:(CGRect)a3
{
}

- ($9A9039C197EE2BE25750078BAD60F685)_flags
{
  unint64_t v2 = 0;
  *(&result.var0.var1 + 1) = (unint64_t)a2;
  result.var0.var1 = v2;
  return result;
}

- (BOOL)hasSubstrokes
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRSequence<Ref<CRRegister<SharedTagged_2<TaggedStroke>>>>);
  uint64_t v4 = *(void *)(v3 - 8);
  double v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t, double))(v4 + 16))(v7, (char *)self + OBJC_IVAR___PKStrokeCoherenceSubstrokes_substrokes, v3, v5);
  v8 = self;
  uint64_t v9 = CRSequence.count.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v9 > 0;
}

- (PKStrokeMask)_strokeMask
{
  return (PKStrokeMask *)0;
}

- (void)_setStrokeMask:(id)a3
{
}

- (void)_setStrokeUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  PKInk v10 = (char *)&v14 - v9;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  uint64_t v11 = (char *)self + OBJC_IVAR___PKStrokeCoherenceBase_identity;
  swift_beginAccess();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v13 = self;
  v12(v11, v7, v4);
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

- (id)_substrokesInDrawing:(id)a3
{
  uint64_t v5 = type metadata accessor for PKDrawing();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  PKInk v10 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKStrokeCoherenceSubstrokes._substrokes(in:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  type metadata accessor for PKStroke();
  v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v11.super.isa;
}

- (id)descriptionAtDepth:(int64_t)a3
{
  uint64_t v4 = self;
  Swift::String v5 = PKStrokeCoherenceSubstrokes.description(atDepth:)(a3);

  uint64_t v6 = (void *)MEMORY[0x21054D080](v5._countAndFlagsBits, v5._object);
  swift_bridgeObjectRelease();
  return v6;
}

- (PKStrokeCoherenceSubstrokes)init
{
  $9A9039C197EE2BE25750078BAD60F685 result = (PKStrokeCoherenceSubstrokes *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unint64_t v2 = (char *)self + OBJC_IVAR___PKStrokeCoherenceSubstrokes_substrokes;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRSequence<Ref<CRRegister<SharedTagged_2<TaggedStroke>>>>);
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end