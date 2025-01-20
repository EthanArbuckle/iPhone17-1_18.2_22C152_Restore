@interface LanguageSupportHostModel
- (BOOL)shouldAcceptWithConnection:(id)a3;
- (_TtC21TranslationAPISupport24LanguageSupportHostModel)init;
- (void)didFinishWithFinalConfiguration:(id)a3 error:(id)a4;
@end

@implementation LanguageSupportHostModel

- (void)didFinishWithFinalConfiguration:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_2600D5D7C(a3, a4);
}

- (BOOL)shouldAcceptWithConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2600D6A34(v4);

  return 1;
}

- (_TtC21TranslationAPISupport24LanguageSupportHostModel)init
{
  result = (_TtC21TranslationAPISupport24LanguageSupportHostModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration));
  sub_2600D5174(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion));
  sub_2600D5280((uint64_t)self + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration, (uint64_t *)&unk_26A866460);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection));
  v3 = (char *)self + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel___observationRegistrar;
  uint64_t v4 = sub_2600D9A80();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end