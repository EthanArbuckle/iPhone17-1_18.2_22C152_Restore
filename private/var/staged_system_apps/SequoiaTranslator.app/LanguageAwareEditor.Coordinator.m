@interface LanguageAwareEditor.Coordinator
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator)init;
- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
@end

@implementation LanguageAwareEditor.Coordinator

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == 10 && v7 == 0xE100000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    type metadata accessor for LanguageAwareTextView();
    uint64_t v8 = swift_dynamicCastClass();
    if (v8
      && (uint64_t v9 = v8,
          v10 = (char *)self
              + OBJC_IVAR____TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator_languageAwareEditor,
          (v11 = *(void (**)(uint64_t))&v10[*(int *)(type metadata accessor for LanguageAwareEditor(0) + 60)]) != 0))
    {
      id v12 = a3;
      v13 = self;
      sub_100019614((uint64_t)v11);
      v11(v9);
      sub_1000324E4((uint64_t)v11);
    }
    else
    {
      id v14 = a3;
    }
    BOOL v15 = 0;
  }
  else
  {
    id v16 = a3;
    BOOL v15 = 1;
  }
  swift_bridgeObjectRelease();

  return v15;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001281D4(v4);
}

- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4
{
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v11 = a3;
    swift_unknownObjectRetain();
    uint64_t v8 = self;
    id v9 = [v7 delegate];
    if (v9)
    {
      v10 = v9;
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

- (void)textViewDidBeginEditing:(id)a3
{
  type metadata accessor for LanguageAwareTextView();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (char *)self + OBJC_IVAR____TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator_languageAwareEditor;
    uint64_t v8 = *(void (**)(uint64_t))&v7[*(int *)(type metadata accessor for LanguageAwareEditor(0) + 64)];
    if (v8)
    {
      id v9 = a3;
      v10 = self;
      sub_100019614((uint64_t)v8);
      v8(v6);
      sub_1000324E4((uint64_t)v8);
    }
  }
}

- (_TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator)init
{
  result = (_TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end