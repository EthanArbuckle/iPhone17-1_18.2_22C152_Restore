@interface AngelControllerDelegateHandler
- (_TtC7JournalP33_C5BE6988A08BB0DB179AC7EC1D49D5B530AngelControllerDelegateHandler)init;
- (void)suggestionSheetController:(id)a3 didTransitionTo:(unint64_t)a4;
- (void)suggestionSheetController:(id)a3 shouldPerformTask:(unint64_t)a4 forSuggestion:(id)a5;
- (void)suggestionSheetControllerDidCancel:(id)a3;
- (void)suggestionSheetControllerShouldShowBlankComposeView:(id)a3;
@end

@implementation AngelControllerDelegateHandler

- (void)suggestionSheetController:(id)a3 didTransitionTo:(unint64_t)a4
{
  v6 = *(void (**)(unint64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtC7JournalP33_C5BE6988A08BB0DB179AC7EC1D49D5B530AngelControllerDelegateHandler_onDidTransitionTo);
  id v7 = a3;
  v8 = self;
  v6(a4);
}

- (void)suggestionSheetControllerDidCancel:(id)a3
{
}

- (void)suggestionSheetControllerShouldShowBlankComposeView:(id)a3
{
}

- (void)suggestionSheetController:(id)a3 shouldPerformTask:(unint64_t)a4 forSuggestion:(id)a5
{
  v8 = *(void (**)(unint64_t, id))((char *)&self->super.isa
                                                   + OBJC_IVAR____TtC7JournalP33_C5BE6988A08BB0DB179AC7EC1D49D5B530AngelControllerDelegateHandler_onPerformTask);
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  v8(a4, v10);
}

- (_TtC7JournalP33_C5BE6988A08BB0DB179AC7EC1D49D5B530AngelControllerDelegateHandler)init
{
  result = (_TtC7JournalP33_C5BE6988A08BB0DB179AC7EC1D49D5B530AngelControllerDelegateHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end