@interface LanguageAwareTextView
- (BOOL)resignFirstResponder;
- (NSArray)_additionalTextInputLocales;
- (NSLocale)locale;
- (UITextInputMode)textInputMode;
- (_TtC17SequoiaTranslator21LanguageAwareTextView)init;
- (_TtC17SequoiaTranslator21LanguageAwareTextView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator21LanguageAwareTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)reloadInputViews;
- (void)setLocale:(id)a3;
- (void)textViewTapped:(id)a3;
@end

@implementation LanguageAwareTextView

- (NSLocale)locale
{
  uint64_t v3 = sub_100007620((uint64_t *)&unk_1002F4110);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_locale;
  swift_beginAccess();
  sub_10009A8D8((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for Locale();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = Locale._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSLocale *)isa;
}

- (void)setLocale:(id)a3
{
  uint64_t v5 = sub_100007620((uint64_t *)&unk_1002F4110);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v10 = &v15[-v9];
  if (a3)
  {
    static Locale._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for Locale();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for Locale();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_locale;
  swift_beginAccess();
  sub_10009A8D8((uint64_t)v13, (uint64_t)v8);
  swift_beginAccess();
  v14 = self;
  sub_10012993C((uint64_t)v10, (uint64_t)v13);
  swift_endAccess();
  sub_10012EA54((uint64_t)v8);
  sub_10000B070((uint64_t)v10, (uint64_t *)&unk_1002F4110);
  sub_10000B070((uint64_t)v8, (uint64_t *)&unk_1002F4110);
}

- (_TtC17SequoiaTranslator21LanguageAwareTextView)init
{
  return (_TtC17SequoiaTranslator21LanguageAwareTextView *)sub_10012EE74();
}

- (_TtC17SequoiaTranslator21LanguageAwareTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001301B4();
}

- (NSArray)_additionalTextInputLocales
{
  v2 = self;
  id v3 = sub_10012F1D4();

  if (v3)
  {
    type metadata accessor for Locale();
    v4.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (UITextInputMode)textInputMode
{
  v2 = self;
  id v3 = sub_10012F3EC();

  return (UITextInputMode *)v3;
}

- (void)reloadInputViews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for LanguageAwareTextView();
  [(LanguageAwareTextView *)&v2 reloadInputViews];
}

- (BOOL)resignFirstResponder
{
  id v3 = *(void (**)(_TtC17SequoiaTranslator21LanguageAwareTextView *))((char *)&self->super.super.super.super.super.super.super.super.isa
                                                                               + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_willResignFirstResponder);
  if (v3)
  {
    NSArray v4 = self;
    sub_100019614((uint64_t)v3);
    v3(v4);
    sub_1000324E4((uint64_t)v3);
  }
  else
  {
    uint64_t v5 = self;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LanguageAwareTextView();
  BOOL v6 = [(LanguageAwareTextView *)&v8 resignFirstResponder];

  return v6;
}

- (void)textViewTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10012FD58(v4);
}

- (_TtC17SequoiaTranslator21LanguageAwareTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator21LanguageAwareTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000324E4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_willResignFirstResponder));
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_languageAwareTextViewDelegate);
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_locale, (uint64_t *)&unk_1002F4110);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView_inputModeBeforeReloadWithoutLocaleChange));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator21LanguageAwareTextView____lazy_storage___tapGestureRecognizer);
}

@end