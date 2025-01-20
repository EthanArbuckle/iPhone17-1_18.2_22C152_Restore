@interface WeakPaperPageWrapper
- (BOOL)isEqual:(id)a3;
- (_TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper)init;
- (int64_t)hash;
@end

@implementation WeakPaperPageWrapper

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = WeakPaperPageWrapper.isEqual(_:)((uint64_t)v8);

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)hash
{
  Hasher.init()();
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakTagged_3<TaggedPaperPage>);
  lazy protocol witness table accessor for type VStack<TupleView<(HStack<TupleView<(HStack<TupleView<(ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, ModifiedContent<<<opaque return type of View.toggleStyle<A>(_:)>>.0, _EnvironmentKeyTransformModifier<Bool>>, <<opaque return type of View.toggleStyle<A>(_:)>>.0, <<opaque return type of View.toggleStyle<A>(_:)>>.0)>>, HStack<ModifiedContent<MultiColorSwatchButton, _FrameLayout>>)>>, HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Menu<ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<CGFloat>>, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, ForEach<Range<Int>, Int, Button<Text>>>, _FlexFrameLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<RoundedCorner>>, ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Button<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifie((unint64_t *)&lazy protocol witness table cache variable for type WeakTagged_3<TaggedPaperPage> and conformance WeakTagged_3<A>, &demangling cache variable for type metadata for WeakTagged_3<TaggedPaperPage>);
  dispatch thunk of Hashable.hash(into:)();
  Swift::Int v4 = Hasher.finalize()();

  return v4;
}

- (_TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper)init
{
  result = (_TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper_ref;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakTagged_3<TaggedPaperPage>);
  Swift::Int v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end