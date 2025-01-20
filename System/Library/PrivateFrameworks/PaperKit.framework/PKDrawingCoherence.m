@interface PKDrawingCoherence
+ (NSString)fileType;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldClearSelectionAfterStraightening;
- (CGRect)_canvasBounds;
- (CGRect)bounds;
- (Class)strokeClass;
- (Class)strokeSelectionClass;
- (NSArray)_rootStrokes;
- (PKDrawingCoherence)init;
- (PKDrawingCoherence)initWithCoder:(id)a3;
- (PKDrawingCoherence)initWithData:(id)a3 error:(id *)a4;
- (PKDrawingCoherence)initWithData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5;
- (PKDrawingCoherence)initWithDrawing:(id)a3;
- (PKDrawingCoherence)initWithStrokes:(id)a3 fromDrawing:(id)a4;
- (PKDrawingUUID)uuid;
- (PKDrawingVersion)version;
- (id)_strokeForIdentifier:(id)a3;
- (id)copyWithoutInternalStrokes;
- (id)dataRepresentation;
- (id)drawingByApplyingTransform:(CGAffineTransform *)a3;
- (id)drawingByApplyingTransform:(CGAffineTransform *)a3 transformInk:(BOOL)a4;
- (id)newStroke;
- (id)serializeTransiently;
- (id)serializeWithVersion:(int64_t)a3;
- (id)setStroke:(id)a3 hidden:(BOOL)a4;
- (id)transformStrokes:(id)a3 paths:(id)a4 masks:(id)a5;
- (id)undoableAddNewStrokes:(id)a3;
- (id)undoableAddNewStrokes:(id)a3 replacingOldStrokes:(id)a4;
- (id)undoableDeleteStrokes:(id)a3;
- (id)undoableMergeWithDrawing:(id)a3;
- (id)undoableSetStrokes:(id)a3 groupID:(id)a4 actionName:(id)a5;
- (id)undoableSetStrokes:(id)a3 inks:(id)a4;
- (id)undoableTransformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5;
- (id)updateFromSlicedIntersectingIndexes:(int64_t *)a3 resultNewRoots:(const void *)a4 resultUpdatedStrokes:(const void *)a5 count:(int64_t)a6;
- (id)visibleStrokeForInsertingStroke:(id)a3;
- (int64_t)_rootStrokesCount;
- (int64_t)hash;
- (int64_t)requiredContentVersion;
- (unint64_t)mergeWithDrawing:(id)a3;
- (void)addNewStroke:(id)a3;
- (void)deleteStrokes:(id)a3;
- (void)invalidateVisibleStrokes;
- (void)setStrokes:(id)a3 groupID:(id)a4;
- (void)setStrokes:(id)a3 hidden:(BOOL)a4;
- (void)setStrokes:(id)a3 inks:(id)a4;
- (void)set_canvasBounds:(CGRect)a3;
- (void)transformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5;
- (void)updateStroke:(id)a3 indexHint:(int64_t)a4;
@end

@implementation PKDrawingCoherence

- (PKDrawingCoherence)init
{
  return (PKDrawingCoherence *)PKDrawingCoherence.init()();
}

- (PKDrawingCoherence)initWithData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  v8 = (PKDrawingCoherence *)specialized PKDrawingCoherence.init(data:)();
  outlined consume of Data._Representation(v5, v7);
  return v8;
}

- (PKDrawingCoherence)initWithStrokes:(id)a3 fromDrawing:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKDrawing?);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  swift_unknownObjectRetain();
  id v9 = a4;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v9)
  {
    static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v10 = type metadata accessor for PKDrawing();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for PKDrawing();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  v12 = [(PKDrawingCoherence *)self init];
  MEMORY[0x270FA5388](v12);
  *(&v15 - 2) = (uint64_t)v16;
  *(&v15 - 1) = (uint64_t)v8;
  swift_beginAccess();
  v13 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.mutate<A>(_:)();
  swift_endAccess();

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for PKDrawing?);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v13;
}

- (PKDrawingCoherence)initWithDrawing:(id)a3
{
  uint64_t v4 = type metadata accessor for PKDrawing();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = a3;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  return (PKDrawingCoherence *)PKDrawingCoherence.init(drawing:)((uint64_t)v6);
}

- (PKDrawingCoherence)initWithData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  id v5 = a3;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  return (PKDrawingCoherence *)specialized PKDrawingCoherence.init(data:loadNonInkingStrokes:)(v6, v8);
}

- (PKDrawingCoherence)initWithCoder:(id)a3
{
  result = (PKDrawingCoherence *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (NSString)fileType
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = (void *)MEMORY[0x21054D080](v2);
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (Class)strokeClass
{
  type metadata accessor for PKStrokeCoherence(0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)newStroke
{
  uint64_t v3 = type metadata accessor for PKStroke();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone((Class)type metadata accessor for PKStrokeCoherence(0));
  unint64_t v8 = self;
  id v9 = objc_msgSend(v7, sel_init);
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  Class isa = PKStroke._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return isa;
}

- (Class)strokeSelectionClass
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PKStrokeSelectionCoherence);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)dataRepresentation
{
  uint64_t v2 = self;
  uint64_t v3 = PKDrawingCoherence.dataRepresentation()();
  unint64_t v5 = v4;

  v6.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v3, v5);
  return v6.super.isa;
}

- (id)serializeWithVersion:(int64_t)a3
{
  unint64_t v4 = self;
  PKDrawingCoherence.concreteDrawing()(v5);
  id v7 = v6;
  Class isa = (Class)objc_msgSend(v6, sel_serializeWithVersion_, a3);

  if (isa)
  {
    uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;

    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v9, v11);
  }
  else
  {
  }
  return isa;
}

- (id)serializeTransiently
{
  uint64_t v2 = self;
  PKDrawingCoherence.concreteDrawing()(v3);
  unint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_serializeTransiently);

  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  v10.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v7, v9);
  return v10.super.isa;
}

- (PKDrawingVersion)version
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  NSData v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v11, v7);
  uint64_t v12 = self;
  Capsule.versionUUID.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v13 = (objc_class *)type metadata accessor for PKDrawingCoherenceVersion(0);
  id v14 = objc_allocWithZone(v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v14 + OBJC_IVAR___PKDrawingCoherenceVersion_versionUUID, v6, v3);
  v18.receiver = v14;
  v18.super_class = v13;
  uint64_t v15 = [(PKDrawingCoherence *)&v18 init];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (PKDrawingVersion *)v15;
}

- (int64_t)requiredContentVersion
{
  uint64_t v3 = type metadata accessor for PKDrawingStruct();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v18 - v11;
  v13 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  id v14 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v14(v12, v13, v6);
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (void (*)(uint64_t))type metadata accessor for PKDrawingStruct);
  objc_super v18 = self;
  Capsule<>.root.getter();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v12, v6);
  v14(v9, v13, v6);
  int64_t v16 = specialized PKDrawingStruct.requiredContentVersion<A>(in:)((uint64_t)v9);
  v15(v9, v6);
  outlined destroy of PKDrawingStruct((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for PKDrawingStruct);

  return v16;
}

- (NSArray)_rootStrokes
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CROrderedSet<Ref<CRRegister<SharedTagged_2<TaggedStroke>>>>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(unsigned char *, char *, uint64_t))(v8 + 16))(v10, v11, v7);
  swift_getKeyPath();
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (void (*)(uint64_t))type metadata accessor for PKDrawingStruct);
  uint64_t v12 = self;
  Capsule<>.subscript.getter();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  int64_t v16 = v12;
  type metadata accessor for PKStroke();
  CROrderedSet.map<A>(_:)();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);

  v13.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v13.super.isa;
}

- (int64_t)_rootStrokesCount
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CROrderedSet<Ref<CRRegister<SharedTagged_2<TaggedStroke>>>>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v11, v7);
  swift_getKeyPath();
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (void (*)(uint64_t))type metadata accessor for PKDrawingStruct);
  uint64_t v12 = self;
  Capsule<>.subscript.getter();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  int64_t v13 = CROrderedSet.count.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v13;
}

- (id)copyWithoutInternalStrokes
{
  uint64_t v3 = type metadata accessor for PKDrawing();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKDrawing._bridgeToObjectiveC()(v8);
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v10;
}

- (CGRect)bounds
{
  uint64_t v2 = self;
  double v3 = PKDrawingCoherence.bounds.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (PKDrawingUUID)uuid
{
  uint64_t v3 = type metadata accessor for CRKeyPath();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  double v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  double v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v11 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v11, v7);
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (void (*)(uint64_t))type metadata accessor for PKDrawingStruct);
  double v12 = self;
  Capsule<>.rootID.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  double v13 = (objc_class *)type metadata accessor for PKDrawingUUIDKeyPath();
  id v14 = objc_allocWithZone(v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v14 + OBJC_IVAR____TtC8PaperKit20PKDrawingUUIDKeyPath_keypath, v6, v3);
  v18.receiver = v14;
  v18.super_class = v13;
  uint64_t v15 = [(PKDrawingCoherence *)&v18 init];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (PKDrawingUUID *)v15;
}

- (CGRect)_canvasBounds
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  double v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  swift_getKeyPath();
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (void (*)(uint64_t))type metadata accessor for PKDrawingStruct);
  uint64_t v8 = self;
  Capsule<>.subscript.getter();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  double v9 = *(double *)&v13[1];
  double v10 = *(double *)&v13[2];
  double v11 = *(double *)&v13[3];
  double v12 = *(double *)&v13[4];
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)set_canvasBounds:(CGRect)a3
{
  swift_beginAccess();
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.mutate<A>(_:)();
  swift_endAccess();
}

- (id)visibleStrokeForInsertingStroke:(id)a3
{
  uint64_t v5 = type metadata accessor for PKStroke();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  double v11 = (char *)&v19 - v10;
  id v12 = a3;
  double v13 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  Class isa = PKStroke._bridgeToObjectiveC()().super.isa;
  id v15 = [(objc_class *)isa copyForMutation];

  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();
  int64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v8, v5);
  v17.super.Class isa = PKStroke._bridgeToObjectiveC()().super.isa;
  v16(v11, v5);
  return v17.super.isa;
}

- (void)addNewStroke:(id)a3
{
}

- (id)setStroke:(id)a3 hidden:(BOOL)a4
{
  uint64_t v6 = type metadata accessor for PKStroke();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v18 - v11;
  id v13 = a3;
  id v14 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v6);
  id v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  v16.super.Class isa = PKStroke._bridgeToObjectiveC()().super.isa;
  v15(v12, v6);
  return v16.super.isa;
}

- (void)setStrokes:(id)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v4)
  {
    uint64_t v6 = self;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    [(PKDrawingCoherence *)v6 deleteStrokes:isa];

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (id)undoableAddNewStrokes:(id)a3
{
  type metadata accessor for PKStroke();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  PKDrawingCoherence.undoableAddNewStrokes(_:)(v6, (Swift::OpaquePointer)v4);
  uint64_t v8 = v7;

  swift_bridgeObjectRelease();
  return v8;
}

- (id)undoableAddNewStrokes:(id)a3 replacingOldStrokes:(id)a4
{
  type metadata accessor for PKStroke();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = self;
  PKDrawingCoherence.undoableAddNewStrokes(_:replacingOldStrokes:)(v8, (Swift::OpaquePointer)v5, (Swift::OpaquePointer)v6);
  uint64_t v10 = v9;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (void)updateStroke:(id)a3 indexHint:(int64_t)a4
{
  uint64_t v6 = type metadata accessor for PKStroke();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  uint64_t v11 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  specialized PKDrawingCoherence.updateStroke(_:indexHint:)((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)transformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat b = a4->b;
  CGFloat c = a4->c;
  CGFloat d = a4->d;
  CGFloat tx = a4->tx;
  CGFloat ty = a4->ty;
  CGFloat a = a4->a;
  CGFloat v16 = b;
  CGFloat v17 = c;
  CGFloat v18 = d;
  CGFloat v19 = tx;
  CGFloat v20 = ty;
  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v14.CGFloat a = a;
  v14.CGFloat b = b;
  v14.CGFloat c = c;
  v14.CGFloat d = d;
  v14.CGFloat tx = tx;
  v14.CGFloat ty = ty;
  IsIdentiCGFloat ty = CGAffineTransformIsIdentity(&v14);
  if (!IsIdentity || !v5)
  {
    MEMORY[0x270FA5388](IsIdentity);
    swift_beginAccess();
    id v13 = self;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
    Capsule.callAsFunction<A>(_:)();
    swift_endAccess();
    [(PKDrawingCoherence *)v13 invalidateVisibleStrokes];
  }
  swift_bridgeObjectRelease();
}

- (void)deleteStrokes:(id)a3
{
  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.callAsFunction<A>(_:)();
  swift_endAccess();
  [(PKDrawingCoherence *)v4 invalidateVisibleStrokes];

  swift_bridgeObjectRelease();
}

- (id)undoableDeleteStrokes:(id)a3
{
  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = one-time initialization token for paperKitBundle;
  BOOL v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  v14._object = (void *)0x800000020C8598F0;
  v6._countAndFlagsBits = 0x6573617245;
  v6._object = (void *)0xE500000000000000;
  v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v7.value._object = (void *)0xEB00000000656C62;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v14._countAndFlagsBits = 0xD000000000000019;
  Swift::String v9 = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, v7, paperKitBundle, v8, v14);
  id v10 = v5;
  swift_bridgeObjectRetain();
  id v11 = specialized PKDrawingCoherence.undoable(actionName:clearCachedVisibleStrokes:changesVisibleStrokes:_:)(v9._countAndFlagsBits, (uint64_t)v9._object, 1, 1, v10, v10);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  return v11;
}

- (id)undoableTransformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  long long v7 = *(_OWORD *)&a4->c;
  v18[0] = *(_OWORD *)&a4->a;
  v18[1] = v7;
  v18[2] = *(_OWORD *)&a4->tx;
  type metadata accessor for PKStroke();
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = one-time initialization token for paperKitBundle;
  id v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  v20._countAndFlagsBits = 0xD00000000000001DLL;
  v20._object = (void *)0x800000020C859930;
  v11._object = (void *)0x800000020C859910;
  v11._countAndFlagsBits = 0xD000000000000011;
  v12.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v12.value._object = (void *)0xEB00000000656C62;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  Swift::String v14 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, v12, paperKitBundle, v13, v20);
  id v15 = v10;
  swift_bridgeObjectRetain();
  id v16 = specialized PKDrawingCoherence.undoable(actionName:clearCachedVisibleStrokes:changesVisibleStrokes:_:)(v14._countAndFlagsBits, (uint64_t)v14._object, 1, 1, v15, v15, v8, v18, a5);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  return v16;
}

- (id)transformStrokes:(id)a3 paths:(id)a4 masks:(id)a5
{
  type metadata accessor for PKStroke();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for UUID();
  type metadata accessor for PKStrokePath();
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for NSObject(0, &lazy cache variable for type metadata for PKStrokeMask);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  PKDrawingCoherence.transformStrokes(_:paths:masks:)(v6, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for NSObject(0, &lazy cache variable for type metadata for PKUndoCommand);
  v10.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v10.super.isa;
}

- (BOOL)shouldClearSelectionAfterStraightening
{
  return 0;
}

- (void)setStrokes:(id)a3 inks:(id)a4
{
  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for PKInk();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  BOOL v5 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.mutate<A>(_:)();
  swift_endAccess();
  [(PKDrawingCoherence *)v5 invalidateVisibleStrokes];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)undoableSetStrokes:(id)a3 inks:(id)a4
{
  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for PKInk();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = one-time initialization token for paperKitBundle;
  uint64_t v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  v15._object = (void *)0x800000020C859970;
  v7._countAndFlagsBits = 0x736B6E4920746553;
  v7._object = (void *)0xE800000000000000;
  v8.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v8.value._object = (void *)0xEB00000000656C62;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v15._countAndFlagsBits = 0xD000000000000014;
  Swift::String v10 = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, v8, paperKitBundle, v9, v15);
  Swift::String v11 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v12 = specialized PKDrawingCoherence.undoable(actionName:clearCachedVisibleStrokes:changesVisibleStrokes:_:)(v10._countAndFlagsBits, (uint64_t)v10._object, 1, 1, v11, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  return v12;
}

- (void)setStrokes:(id)a3 groupID:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v6 - 8);
  Swift::String_optional v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PKStroke();
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for UUID();
    uint64_t v11 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UUID();
    uint64_t v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  }
  MEMORY[0x270FA5388](v11);
  *(&v14 - 2) = v9;
  *(&v14 - 1) = (uint64_t)v8;
  swift_beginAccess();
  Swift::String v13 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.mutate<A>(_:)();
  swift_endAccess();

  swift_bridgeObjectRelease();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for UUID?);
}

- (id)undoableSetStrokes:(id)a3 groupID:(id)a4 actionName:(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PKStroke();
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v13);
  *(&v19 - 4) = (uint64_t)self;
  *(&v19 - 3) = v10;
  *(&v19 - 2) = (uint64_t)v9;
  id v16 = self;
  id v17 = PKDrawingCoherence.undoable(actionName:clearCachedVisibleStrokes:changesVisibleStrokes:_:)(v13, v15, 1, 0, (void (*)(uint64_t))closure #1 in PKDrawingCoherence.undoableSetStrokes(_:groupID:actionName:)partial apply, (uint64_t)(&v19 - 6));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v9, &demangling cache variable for type metadata for UUID?);
  return v17;
}

- (id)updateFromSlicedIntersectingIndexes:(int64_t *)a3 resultNewRoots:(const void *)a4 resultUpdatedStrokes:(const void *)a5 count:(int64_t)a6
{
  uint64_t v10 = self;
  id v11 = PKDrawingCoherence.update(fromSlicedIntersectingIndexes:resultNewRoots:resultUpdatedStrokes:count:)((char *)a3, (uint64_t)a4, a5, a6);

  return v11;
}

- (id)drawingByApplyingTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->a;
  long long v17 = *(_OWORD *)&a3->c;
  long long v18 = v4;
  CGFloat tx = a3->tx;
  CGFloat ty = a3->ty;
  uint64_t v7 = type metadata accessor for PKDrawing();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = self;
  v19[0] = v18;
  v19[1] = v17;
  CGFloat v20 = tx;
  CGFloat v21 = ty;
  id v12 = [(PKDrawingCoherence *)v11 drawingByApplyingTransform:v19 transformInk:1];
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKDrawing._bridgeToObjectiveC()(v13);
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (id)drawingByApplyingTransform:(CGAffineTransform *)a3 transformInk:(BOOL)a4
{
  long long v6 = *(_OWORD *)&a3->c;
  v17[0] = *(_OWORD *)&a3->a;
  v17[1] = v6;
  v17[2] = *(_OWORD *)&a3->tx;
  uint64_t v7 = type metadata accessor for PKDrawing();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = self;
  id v12 = PKDrawingCoherence.applyTransform(_:transformInk:)((uint64_t)v17, a4);
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKDrawing._bridgeToObjectiveC()(v13);
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (void)invalidateVisibleStrokes
{
  uint64_t v18 = type metadata accessor for CRKeyPath();
  uint64_t v3 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v18 - v11;
  uint64_t v13 = (objc_class *)type metadata accessor for PKDrawingCoherence(0);
  v19.receiver = self;
  v19.super_class = v13;
  uint64_t v14 = self;
  [(PKDrawingCoherence *)&v19 invalidateVisibleStrokes];
  uint64_t v15 = (char *)v14 + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  id v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v16(v12, v15, v6);
  v16(v9, v15, v6);
  _sSo6CGRectVAB9Coherence7CRValue8PaperKitWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (void (*)(uint64_t))type metadata accessor for PKDrawingStruct);
  Capsule<>.rootID.getter();
  long long v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v9, v6);
  Capsule.clearCachedValue(forKey:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  v17(v12, v6);
}

- (unint64_t)mergeWithDrawing:(id)a3
{
  uint64_t v5 = type metadata accessor for PKDrawing();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  uint64_t v10 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v11 = PKDrawingCoherence.merge(with:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

- (id)undoableMergeWithDrawing:(id)a3
{
  return @objc PKCoherenceUndoCommand.apply(toDrawingReturnInverted:)(self, (uint64_t)a2, a3, (uint64_t (*)(char *))PKDrawingCoherence.undoableMerge(with:));
}

- (int64_t)hash
{
  uint64_t v2 = self;
  Swift::Int v3 = PKDrawingCoherence.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return @objc PKDrawingCoherenceVersion.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PKDrawingCoherence.isEqual(_:));
}

- (id)_strokeForIdentifier:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKStroke?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = self;
  PKDrawingCoherence._stroke(forIdentifier:)((uint64_t)v7, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = type metadata accessor for PKStroke();
  uint64_t v13 = *(void *)(v12 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
  {
    Class isa = PKStroke._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
  }
  return isa;
}

- (void).cxx_destruct
{
  uint64_t v2 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end