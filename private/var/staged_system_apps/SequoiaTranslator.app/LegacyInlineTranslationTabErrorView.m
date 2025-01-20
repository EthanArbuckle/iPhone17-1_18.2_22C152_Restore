@interface LegacyInlineTranslationTabErrorView
- (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView)initWithFrame:(CGRect)a3;
- (void)onDeviceLinkTapped;
@end

@implementation LegacyInlineTranslationTabErrorView

- (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView *)sub_100133D00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_errorType;
  *(void *)v5 = 0;
  v5[8] = -1;
  *(void *)&self->errorType[OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_languageDownloadPresenter] = 0;
  swift_unknownObjectWeakInit();
  id v6 = a3;

  result = (_TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)onDeviceLinkTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_languageDownloadPresenter;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_10010D860(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_errorType), self->errorType[OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_errorType]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_stack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_button));
  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator35LegacyInlineTranslationTabErrorView_languageDownloadPresenter;

  sub_100013384((uint64_t)v3);
}

@end