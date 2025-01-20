@interface ReadThisAppIntentConnectionDelegate
- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4;
- (_TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate)init;
- (void)executor:(LNActionExecutor *)a3 environmentForViewSnippetWithCompletion:(id)a4;
- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
@end

@implementation ReadThisAppIntentConnectionDelegate

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25DA6DAF0();
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25DA6DB74();
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25DA6DBF8();
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25DA6DC7C();
}

- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_25DA6DFA0();
}

- (void)executor:(LNActionExecutor *)a3 environmentForViewSnippetWithCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  id v8 = a3;
  id v9 = self;

  sub_25DA6E97C((uint64_t)&unk_26A6A6888, (uint64_t)v7);
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_25DA6EA80();

  return 0;
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_25DA6EC14();
}

- (_TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate_aceService);
  v3 = (char *)self + OBJC_IVAR____TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate_continuation;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6870);
  OUTLINED_FUNCTION_9();
  id v6 = *(void (**)(char *, uint64_t))(v5 + 8);

  v6(v3, v4);
}

@end