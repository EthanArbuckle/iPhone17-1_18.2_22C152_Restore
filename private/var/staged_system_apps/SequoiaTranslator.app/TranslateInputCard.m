@interface TranslateInputCard
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (NSArray)keyCommands;
- (UITextInputMode)textInputMode;
- (_TtC17SequoiaTranslator18TranslateInputCard)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator18TranslateInputCard)initWithFrame:(CGRect)a3;
- (void)closeButtonPressed;
- (void)pasted:(id)a3;
- (void)selectedSegmentChanged;
- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
@end

@implementation TranslateInputCard

- (UITextInputMode)textInputMode
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_inputModeBeforeReturnKeyChange);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v6 = self;
    v7 = self;
    id v8 = [v6 activeInputModes];
    sub_10000B0CC(0, &qword_1002F6868);
    unint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v10 = v7;
    v5 = sub_1001F7B6C(v9, (uint64_t)v10);
    swift_bridgeObjectRelease();
  }
  id v11 = v3;

  return (UITextInputMode *)v5;
}

- (_TtC17SequoiaTranslator18TranslateInputCard)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator18TranslateInputCard *)sub_1001F60A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSArray)keyCommands
{
  sub_100007620((uint64_t *)&unk_1002F0270);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10024CE10;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [self keyCommandWithInput:v5 modifierFlags:0 action:"closeButtonPressed"];

  *(void *)(v3 + 32) = v6;
  specialized Array._endMutation()();

  sub_10000B0CC(0, (unint64_t *)&qword_1002FBDA0);
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (_TtC17SequoiaTranslator18TranslateInputCard)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001F7C90();
}

- (void)closeButtonPressed
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    NSString v5 = self;
    [v4 closePressed];

    swift_unknownObjectRelease();
  }
}

- (void)selectedSegmentChanged
{
  v2 = self;
  sub_1001F71F0();
}

- (void).cxx_destruct
{
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_textInputTopAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard____lazy_storage___textInput));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard____lazy_storage___editOrSpeakHint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_inputModeBeforeReturnKeyChange));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_editingPair));
  sub_1000CA304((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_selectedEditingLocale);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard____lazy_storage___closeButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_instrumentation);
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_uiVisible);
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_1001F7E10();
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_1001F770C(v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  id v10 = a3;
  id v11 = self;
  LOBYTE(v7) = sub_1001F7EF8(v10, v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)pasted:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator18TranslateInputCard_instrumentation);
  NSString v5 = self;
  id v10 = v4;
  uint64_t v6 = String.count.getter();
  uint64_t v7 = *(void *)&v10[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_pastedCharacterCount];
  BOOL v8 = __OFADD__(v7, v6);
  uint64_t v9 = v7 + v6;
  if (v8)
  {
    __break(1u);
  }
  else
  {
    *(void *)&v10[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_pastedCharacterCount] = v9;

    swift_bridgeObjectRelease();
  }
}

- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    id v8 = a3;
    swift_unknownObjectRetain();
    uint64_t v9 = self;
    [v7 willBeginEditing];

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

@end