@interface PKStrokeCoherence
- ($9A9039C197EE2BE25750078BAD60F685)_flags;
- (BOOL)hasSubstrokes;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)_inkTransform;
- (CGAffineTransform)_transform;
- (CGRect)_bounds;
- (CGRect)renderBounds;
- (NSUUID)_groupID;
- (NSUUID)_renderGroupID;
- (PKInk)ink;
- (PKStrokeCoherence)init;
- (PKStrokeCoherence)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6;
- (PKStrokeMask)_strokeMask;
- (PKStrokePath)path;
- (_PKStrokeClipPlane)_clipPlane;
- (id)_substrokesInDrawing:(id)a3;
- (id)copyForMutation;
- (id)copyForSubstroke;
- (id)mutableCopyWithZone:(void *)a3;
- (id)parentStrokeForInsertionInDrawing:(id)a3;
- (id)sliceIdentifierForTStart:(double)a3 tEnd:(double)a4;
- (int64_t)_shapeType;
- (int64_t)compareToStroke:(id)a3;
- (void)_setClipPlane:(id)a3;
- (void)_setFlags:(id)a3;
- (void)_setGroupID:(id)a3;
- (void)_setRenderGroupID:(id)a3;
- (void)_setShapeType:(int64_t)a3;
- (void)_setStrokeMask:(id)a3;
- (void)_setStrokeUUID:(id)a3;
- (void)_setTransform:(CGAffineTransform *)a3;
- (void)setInk:(id)a3;
- (void)setPath:(id)a3;
- (void)set_bounds:(CGRect)a3;
- (void)set_transform:(CGAffineTransform *)a3;
@end

@implementation PKStrokeCoherence

- (PKStrokeCoherence)init
{
  return (PKStrokeCoherence *)PKStrokeCoherence.init()();
}

- (PKStrokeCoherence)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6
{
  long long v9 = *(_OWORD *)&a5->c;
  v20[0] = *(_OWORD *)&a5->a;
  v20[1] = v9;
  v20[2] = *(_OWORD *)&a5->tx;
  uint64_t v10 = type metadata accessor for PKStrokePath();
  MEMORY[0x270FA5388](v10 - 8);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for PKInk();
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)();
  return (PKStrokeCoherence *)PKStrokeCoherence.init(ink:strokePath:transform:mask:)((uint64_t)v15, (uint64_t)v12, v20, a6);
}

- (id)parentStrokeForInsertionInDrawing:(id)a3
{
  uint64_t v5 = type metadata accessor for PKDrawing();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PKStroke();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a3;
  uint64_t v14 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKStrokeCoherence.parentStrokeForInsertion(in:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v15.super.isa = PKStroke._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15.super.isa;
}

- (id)mutableCopyWithZone:(void *)a3
{
  v3 = self;
  PKStrokeCoherence.mutableCopy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (id)copyForMutation
{
  return @objc PKStrokeCoherence.copyForMutation()(self, (uint64_t)a2, (void (*)(void))PKStrokeCoherence.copyForMutation());
}

- (id)copyForSubstroke
{
  return @objc PKStrokeCoherence.copyForMutation()(self, (uint64_t)a2, (void (*)(void))PKStrokeCoherence.copyForSubstroke());
}

- (id)sliceIdentifierForTStart:(double)a3 tEnd:(double)a4
{
  uint64_t v6 = self;
  id v7 = PKStrokeCoherence.sliceIdentifier(forTStart:tEnd:)(a3, a4);

  return v7;
}

- (PKInk)ink
{
  uint64_t v3 = type metadata accessor for PKStrokeInheritedProperties(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PKInk();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (char *)self + OBJC_IVAR___PKStrokeCoherence_resolvedProperties;
  swift_beginAccess();
  outlined init with copy of PKStrokeStruct((uint64_t)v10, (uint64_t)v5, type metadata accessor for PKStrokeInheritedProperties);
  uint64_t v11 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKInk?>);
  CRRegister.wrappedValue.getter();
  v12 = v15;
  result = (PKInk *)_s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v5, type metadata accessor for PKStrokeInheritedProperties);
  if (v12)
  {
    static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

    v14.super.isa = PKInk._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return (PKInk *)v14.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setInk:(id)a3
{
}

- (CGAffineTransform)_inkTransform
{
  uint64_t v5 = type metadata accessor for PKStrokeProperties(0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeStruct((uint64_t)v12, (uint64_t)v11, type metadata accessor for PKStrokeStruct);
  id v13 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v11, type metadata accessor for PKStrokeStruct);
  PKInk v14 = &v8[*(int *)(v6 + 52)];
  if (v14[48])
  {
    CGFloat v15 = 1.0;
    CGFloat v16 = 0.0;
    CGFloat v17 = 0.0;
    CGFloat v18 = 0.0;
    CGFloat v19 = 0.0;
    CGFloat v20 = 1.0;
  }
  else
  {
    CGFloat v17 = *((double *)v14 + 4);
    CGFloat v16 = *((double *)v14 + 5);
    CGFloat v18 = *((double *)v14 + 2);
    CGFloat v15 = *((double *)v14 + 3);
    CGFloat v20 = *(double *)v14;
    CGFloat v19 = *((double *)v14 + 1);
  }
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v8, type metadata accessor for PKStrokeProperties);

  retstr->a = v20;
  retstr->b = v19;
  retstr->c = v18;
  retstr->d = v15;
  retstr->tx = v17;
  retstr->ty = v16;
  return result;
}

- (PKStrokePath)path
{
  uint64_t v3 = type metadata accessor for PKStrokePathStruct(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PKStrokePath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (char *)self + OBJC_IVAR___PKStrokeCoherence__path;
  swift_beginAccess();
  outlined init with copy of PKStrokeStruct((uint64_t)v10, (uint64_t)v5, type metadata accessor for PKStrokePathStruct);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  v11.super.isa = PKStrokePath._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (PKStrokePath *)v11.super.isa;
}

- (void)setPath:(id)a3
{
}

- ($9A9039C197EE2BE25750078BAD60F685)_flags
{
  uint64_t v3 = type metadata accessor for PKStrokeProperties(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (unint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeStruct((uint64_t)v9, (uint64_t)v8, type metadata accessor for PKStrokeStruct);
  uint64_t v10 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v8, type metadata accessor for PKStrokeStruct);
  unint64_t v11 = *v5;
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v5, type metadata accessor for PKStrokeProperties);

  unint64_t v13 = v11;
  *(&result.var0.var1 + 1) = v12;
  result.var0.var1 = v13;
  return result;
}

- (void)_setFlags:(id)a3
{
  unint64_t var1 = a3.var0.var1;
  swift_beginAccess();
  type metadata accessor for PKStrokeStruct(0);
  uint64_t v5 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  uint64_t v6 = (void (*)(unsigned char *, void))CRRegister.wrappedValue.modify();
  *uint64_t v7 = var1;
  v6(v8, 0);
  swift_endAccess();
}

- (NSUUID)_groupID
{
  uint64_t v3 = type metadata accessor for PKStrokeProperties(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeStruct((uint64_t)v13, (uint64_t)v9, type metadata accessor for PKStrokeStruct);
  uint64_t v14 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v9, type metadata accessor for PKStrokeStruct);
  outlined init with copy of HStack<TupleView<(ModifiedContent<Text, _PaddingLayout>, Spacer, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Button<_ConditionalContent<<<opaque return type of View.dynamicTypeSize(_:)>>.0, ModifiedContent<<<opaque return type of View.dynamicTypeSize(_:)>>.0, _EnvironmentKeyWritingModifier<AnyShapeStyle?>>>>, _FrameLayout>, _PaddingLayout>, _ContentShapeModifier<Rectangle>>, AccessibilityAttachmentModifier>)>>((uint64_t)&v6[*(int *)(v4 + 28)], (uint64_t)v12, &demangling cache variable for type metadata for UUID?);
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v6, type metadata accessor for PKStrokeProperties);

  uint64_t v15 = type metadata accessor for UUID();
  uint64_t v16 = *(void *)(v15 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
  }
  return (NSUUID *)isa;
}

- (void)_setGroupID:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  swift_beginAccess();
  type metadata accessor for PKStrokeStruct(0);
  uint64_t v10 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  uint64_t v11 = (void (*)(unsigned char *, void))CRRegister.wrappedValue.modify();
  uint64_t v13 = v12;
  uint64_t v14 = type metadata accessor for PKStrokeProperties(0);
  outlined assign with copy of UUID?((uint64_t)v7, v13 + *(int *)(v14 + 20));
  v11(v16, 0);
  swift_endAccess();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v7, &demangling cache variable for type metadata for UUID?);
}

- (NSUUID)_renderGroupID
{
  uint64_t v3 = type metadata accessor for PKStrokeProperties(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeStruct((uint64_t)v13, (uint64_t)v9, type metadata accessor for PKStrokeStruct);
  uint64_t v14 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v9, type metadata accessor for PKStrokeStruct);
  outlined init with copy of HStack<TupleView<(ModifiedContent<Text, _PaddingLayout>, Spacer, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Button<_ConditionalContent<<<opaque return type of View.dynamicTypeSize(_:)>>.0, ModifiedContent<<<opaque return type of View.dynamicTypeSize(_:)>>.0, _EnvironmentKeyWritingModifier<AnyShapeStyle?>>>>, _FrameLayout>, _PaddingLayout>, _ContentShapeModifier<Rectangle>>, AccessibilityAttachmentModifier>)>>((uint64_t)&v6[*(int *)(v4 + 32)], (uint64_t)v12, &demangling cache variable for type metadata for UUID?);
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v6, type metadata accessor for PKStrokeProperties);

  uint64_t v15 = type metadata accessor for UUID();
  uint64_t v16 = *(void *)(v15 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
  }
  return (NSUUID *)isa;
}

- (void)_setRenderGroupID:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  swift_beginAccess();
  type metadata accessor for PKStrokeStruct(0);
  uint64_t v10 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  uint64_t v11 = (void (*)(unsigned char *, void))CRRegister.wrappedValue.modify();
  uint64_t v13 = v12;
  uint64_t v14 = type metadata accessor for PKStrokeProperties(0);
  outlined assign with copy of UUID?((uint64_t)v7, v13 + *(int *)(v14 + 24));
  v11(v16, 0);
  swift_endAccess();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v7, &demangling cache variable for type metadata for UUID?);
}

- (int64_t)_shapeType
{
  uint64_t v3 = type metadata accessor for PKStrokeProperties(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeStruct((uint64_t)v10, (uint64_t)v9, type metadata accessor for PKStrokeStruct);
  uint64_t v11 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v9, type metadata accessor for PKStrokeStruct);
  int64_t v12 = *(void *)&v6[*(int *)(v4 + 36)];
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v6, type metadata accessor for PKStrokeProperties);

  return v12;
}

- (void)_setShapeType:(int64_t)a3
{
  swift_beginAccess();
  type metadata accessor for PKStrokeStruct(0);
  uint64_t v5 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  uint64_t v6 = (void (*)(unsigned char *, void))CRRegister.wrappedValue.modify();
  *(void *)(v7 + *(int *)(type metadata accessor for PKStrokeProperties(0) + 28)) = a3;
  v6(v8, 0);
  swift_endAccess();
}

- (PKStrokeMask)_strokeMask
{
  v2 = self;
  id v3 = PKStrokeCoherence._strokeMask.getter();

  return (PKStrokeMask *)v3;
}

- (void)_setStrokeMask:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  specialized PKStrokeCoherence._strokeMask.setter(a3);
}

- (BOOL)hasSubstrokes
{
  return 0;
}

- (void)_setStrokeUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = self;
  PKStrokeCoherence._strokeUUID.setter((uint64_t)v6);
}

- (BOOL)isEqual:(id)a3
{
  return @objc PKStrokeProviderSliceIdentifierCoherence.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PKStrokeCoherence.isEqual(_:));
}

- (_PKStrokeClipPlane)_clipPlane
{
  v2 = self;
  id v3 = PKStrokeCoherence._clipPlane.getter();

  return (_PKStrokeClipPlane *)v3;
}

- (void)_setClipPlane:(id)a3
{
  id v5 = a3;
  id v6 = self;
  PKStrokeCoherence._clipPlane.setter(a3);
}

- (CGAffineTransform)_transform
{
  uint64_t v5 = type metadata accessor for PKStrokeInheritedProperties(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (char *)self + OBJC_IVAR___PKStrokeCoherence_resolvedProperties;
  swift_beginAccess();
  outlined init with copy of PKStrokeStruct((uint64_t)v8, (uint64_t)v7, type metadata accessor for PKStrokeInheritedProperties);
  uint64_t v9 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<CGAffineTransform>);
  CRRegister.wrappedValue.getter();
  long long v14 = v17;
  long long v15 = v16;
  CGFloat v10 = v18;
  CGFloat v11 = v19;
  _s8PaperKit27PKStrokeInheritedPropertiesVWOhTm_0((uint64_t)v7, type metadata accessor for PKStrokeInheritedProperties);

  long long v13 = v14;
  *(_OWORD *)&retstr->a = v15;
  *(_OWORD *)&retstr->c = v13;
  retstr->tx = v10;
  retstr->ty = v11;
  return result;
}

- (void)set_transform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  uint64_t v4 = self;
  PKStrokeCoherence._transform.setter(v5);
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  [(PKStrokeCoherence *)self set_transform:v4];
}

- (id)_substrokesInDrawing:(id)a3
{
  uint64_t v5 = type metadata accessor for PKDrawing();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  CGFloat v10 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  type metadata accessor for PKStroke();
  v11.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  return v11.super.isa;
}

- (CGRect)_bounds
{
  [(PKStrokeCoherence *)self renderBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)set_bounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  PKStrokeCoherence._bounds.setter(x, y, width, height);
}

- (CGRect)renderBounds
{
  double v2 = self;
  double v3 = PKStrokeCoherence.renderBounds.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (int64_t)compareToStroke:(id)a3
{
  uint64_t v5 = type metadata accessor for PKStroke();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  double v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  double v10 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v11 = PKStrokeCoherence.compare(to:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

- (void).cxx_destruct
{
}

@end