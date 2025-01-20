@interface DisambiguationResultModel
- (_TtC13TranslationUI25DisambiguationResultModel)init;
- (id)excludedTypesForResult:(id)a3;
- (void)disambiguableResult:(id)a3 didChangeResultForSentence:(id)a4 withSelection:(id)a5;
- (void)disambiguableResultDidUpdate:(id)a3;
@end

@implementation DisambiguationResultModel

- (_TtC13TranslationUI25DisambiguationResultModel)init
{
  result = (_TtC13TranslationUI25DisambiguationResultModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_disambiguableResult));
  sub_1DB0EB788(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_globalAttributeProvider));
  sub_1DB0EB788(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_linkAttributeProvider));
  sub_1DB0EB788(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_userSelectionHandler));
  v3 = (char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_sourceLocale;
  uint64_t v4 = sub_1DB1EF6B0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_targetLocale, v4);
  swift_bridgeObjectRelease();
  v6 = (char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel__sourceAttributedText;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA903B90);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel__targetAttributedText, v7);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_displaySource);
  uint64_t v10 = *(void *)&self->disambiguableResult[OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_displaySource];
  sub_1DB0FC3F4(v9, v10);
}

- (void)disambiguableResult:(id)a3 didChangeResultForSentence:(id)a4 withSelection:(id)a5
{
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_renderMode;
  swift_beginAccess();
  char v10 = *v9;
  v11 = (_TtC13TranslationUI25DisambiguationResultModel *)a3;
  v12 = (_TtC13TranslationUI25DisambiguationResultModel *)a4;
  v13 = (_TtC13TranslationUI25DisambiguationResultModel *)a5;
  v14 = self;
  if (v10)
  {
    sub_1DB0F5894();
    if (!v13) {
      goto LABEL_8;
    }
  }
  else
  {
    sub_1DB0F4A0C();
    if (!v13) {
      goto LABEL_8;
    }
  }
  v15 = *(void (**)(_TtC13TranslationUI25DisambiguationResultModel *, _TtC13TranslationUI25DisambiguationResultModel *))((char *)&v14->super.isa + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_userSelectionHandler);
  if (v15)
  {
    v13 = v13;
    v15(v12, v13);

    v11 = v12;
    v12 = v14;
    v14 = v13;
  }

  v11 = v12;
  v12 = v13;
LABEL_8:
}

- (id)excludedTypesForResult:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = _s13TranslationUI25DisambiguationResultModelC13excludedTypes3forShySo8NSNumberCGSgSo016_LTDisambiguableD0C_tF_0();

  if (v6)
  {
    sub_1DB0E2EFC(0, (unint64_t *)&qword_1EA903D18);
    sub_1DB0FC384();
    uint64_t v7 = (void *)sub_1DB1F1680();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)disambiguableResultDidUpdate:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_renderMode;
  swift_beginAccess();
  LOBYTE(v5) = *v5;
  id v6 = a3;
  uint64_t v7 = self;
  if (v5) {
    sub_1DB0F5894();
  }
  else {
    sub_1DB0F4A0C();
  }
}

@end