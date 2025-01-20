@interface PKStrokeCoherenceBase
- (PKStrokeCoherenceBase)init;
- (PKStrokeCoherenceBase)initWithData:(id)a3 id:(id)a4 flags:(id)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8;
- (PKStrokeCoherenceBase)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6;
- (PKStrokeCoherenceBase)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6 randomSeed:(unsigned int)a7;
- (id)_newStrokeWithSubstrokes:(id)a3 inDrawing:(id)a4;
@end

@implementation PKStrokeCoherenceBase

- (PKStrokeCoherenceBase)init
{
  result = (PKStrokeCoherenceBase *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (PKStrokeCoherenceBase)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6
{
  uint64_t v9 = type metadata accessor for PKStrokePath();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = type metadata accessor for PKInk();
  MEMORY[0x270FA5388](v10 - 8);
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)();
  result = (PKStrokeCoherenceBase *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)_newStrokeWithSubstrokes:(id)a3 inDrawing:(id)a4
{
  uint64_t v6 = type metadata accessor for PKDrawing();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PKStroke();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v15 = a4;
  v16 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKStrokeCoherenceBase._newStroke(withSubstrokes:in:)(v14, (uint64_t)v13);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  Class isa = PKStroke._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return isa;
}

- (PKStrokeCoherenceBase)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6 randomSeed:(unsigned int)a7
{
  uint64_t v10 = type metadata accessor for PKStrokePath();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = type metadata accessor for PKInk();
  MEMORY[0x270FA5388](v11 - 8);
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)();
  result = (PKStrokeCoherenceBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PKStrokeCoherenceBase)initWithData:(id)a3 id:(id)a4 flags:(id)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8
{
  uint64_t v9 = (void *)*(&a5.var0.var1 + 1);
  uint64_t v12 = type metadata accessor for PKInk();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v13 = type metadata accessor for UUID();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = type metadata accessor for PKStrokePath();
  MEMORY[0x270FA5388](v14 - 8);
  id v15 = a3;
  id v16 = a4;
  id v17 = v9;
  v18 = a7;
  static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)();

  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  result = (PKStrokeCoherenceBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PKStrokeCoherenceBase_strokeNode;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<SharedTagged_2<TaggedStroke>>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___PKStrokeCoherenceBase_identity;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end