@interface TaxFormsModel
- (_TtC9PassKitUI13TaxFormsModel)init;
@end

@implementation TaxFormsModel

- (_TtC9PassKitUI13TaxFormsModel)init
{
  result = (_TtC9PassKitUI13TaxFormsModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI13TaxFormsModel__taxForms;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B09A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI13TaxFormsModel__displayableError;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A59A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI13TaxFormsModel__loading;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949CE50);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end