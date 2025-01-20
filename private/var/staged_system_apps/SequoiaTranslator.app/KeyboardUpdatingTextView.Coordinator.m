@interface KeyboardUpdatingTextView.Coordinator
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator)init;
- (void)preferredContentSizeChanged:(id)a3;
- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation KeyboardUpdatingTextView.Coordinator

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_100121504(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  NSString v6 = String._bridgeToObjectiveC()();
  [v4 setText:v6];
}

- (void)textViewDidChange:(id)a3
{
  type metadata accessor for KeyboardUpdatingTextViewUIKit();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = (char *)self
       + OBJC_IVAR____TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator_keyboardUpdatingTextView;
    v8 = *(void (**)(uint64_t))&v7[*(int *)(type metadata accessor for KeyboardUpdatingTextView(0) + 32)];
    id v9 = a3;
    unint64_t v10 = self;
    v8(v6);
  }
}

- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4
{
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)v6;
    id v11 = a3;
    swift_unknownObjectRetain();
    v8 = self;
    id v9 = [v7 delegate];
    if (v9)
    {
      unint64_t v10 = v9;
      if ([v9 respondsToSelector:"textViewDidChange:"]) {
        [v10 textViewDidChange:v7];
      }
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

- (void)preferredContentSizeChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100121D9C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator)init
{
  result = (_TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator_keyboardUpdatingTextViewUIKit));
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator__horizontalSizeClass, &qword_1002F1068);
}

@end