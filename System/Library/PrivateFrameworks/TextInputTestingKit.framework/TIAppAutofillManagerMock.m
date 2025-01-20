@interface TIAppAutofillManagerMock
- (BOOL)hasOneTimeCode;
- (TIAppAutofillManagerMock)init;
- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer;
- (id)generateOneTimeCodeCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4;
- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5;
- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5;
- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7;
- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5;
- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4;
@end

@implementation TIAppAutofillManagerMock

- (void).cxx_destruct
{
}

- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer
{
  return self->_secureCandidateRenderer;
}

- (BOOL)hasOneTimeCode
{
  return self->_hasOneTimeCode;
}

- (id)generateOneTimeCodeCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7
{
}

- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5
{
}

- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5
{
  id v5 = a5;
  v6 = dispatch_get_global_queue(33, 0);
  v8 = v5;
  id v7 = v5;
  TIDispatchAsync();
}

uint64_t __104__TIAppAutofillManagerMock_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (TIAppAutofillManagerMock)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIAppAutofillManagerMock;
  v2 = [(TIAppAutofillManagerMock *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasOneTimeCode = 0;
    secureCandidateRenderer = v2->_secureCandidateRenderer;
    v2->_secureCandidateRenderer = 0;
  }
  return v3;
}

@end