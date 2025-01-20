@interface KeyboardUpdatingTextViewUIKit
- (NSArray)_additionalTextInputLocales;
- (UITextInputMode)textInputMode;
- (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation KeyboardUpdatingTextViewUIKit

- (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_textTranslationLocaleSubscription) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_allowKeyboardLocaleChange) = 1;
  id v4 = a3;

  result = (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSArray)_additionalTextInputLocales
{
  sub_100007620((uint64_t *)&unk_1002F6870);
  type metadata accessor for Locale();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100247140;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();

  swift_release();
  swift_release();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (UITextInputMode)textInputMode
{
  if (*((unsigned char *)&self->super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_allowKeyboardLocaleChange) == 1)
  {
    v3 = self;
    NSArray v4 = self;
    id v5 = [v3 activeInputModes];
    sub_10000B0CC(0, &qword_1002F6868);
    unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v7 = v4;
    v8 = (UITextInputMode *)sub_1001237C0(v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for KeyboardUpdatingTextViewUIKit();
    v8 = [(KeyboardUpdatingTextViewUIKit *)&v10 textInputMode];
  }

  return v8;
}

- (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator29KeyboardUpdatingTextViewUIKit_conversation));

  swift_release();
}

@end