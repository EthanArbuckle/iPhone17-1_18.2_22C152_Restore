@interface SCAppIntentConnectionDelegate
- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4;
- (_TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate)init;
- (void)executor:(LNActionExecutor *)a3 environmentForViewSnippetWithCompletion:(id)a4;
- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
@end

@implementation SCAppIntentConnectionDelegate

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2378C41C4((uint64_t)v8, v7);
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2378C4248((uint64_t)v8, v7);
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2378C42CC((uint64_t)v8, v7);
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2378C4350((uint64_t)v8, v7);
}

- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_2378C46AC((uint64_t)v11, a4, a5);
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
  sub_2378C5150((uint64_t)&unk_268934CB8, (uint64_t)v7);
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_2378C5254();

  return 0;
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_2378C53F4((uint64_t)v8, v7);
}

- (_TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate_aceService);
  v3 = (char *)self + OBJC_IVAR____TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate_continuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934CA0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end