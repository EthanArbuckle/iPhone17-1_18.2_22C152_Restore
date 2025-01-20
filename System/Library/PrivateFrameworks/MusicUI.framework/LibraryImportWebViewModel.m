@interface LibraryImportWebViewModel
- (_TtC7MusicUI25LibraryImportWebViewModel)init;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5;
- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation LibraryImportWebViewModel

- (_TtC7MusicUI25LibraryImportWebViewModel)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__canGoBack;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD91210);
  OUTLINED_FUNCTION_16();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
  uint64_t v7 = OUTLINED_FUNCTION_6_83(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__canGoForward);
  ((void (*)(uint64_t))v6)(v7);
  uint64_t v8 = OUTLINED_FUNCTION_6_83(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isSecure);
  ((void (*)(uint64_t))v6)(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683234F8);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_2();
  v9();
  uint64_t v10 = OUTLINED_FUNCTION_6_83(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isLoading);
  ((void (*)(uint64_t))v6)(v10);
  uint64_t v11 = OUTLINED_FUNCTION_6_83(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isPresentingError);
  ((void (*)(uint64_t))v6)(v11);
  uint64_t v12 = OUTLINED_FUNCTION_6_83(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isShowingAlert);
  ((void (*)(uint64_t))v6)(v12);
  uint64_t v13 = OUTLINED_FUNCTION_6_83(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isPresentingAuthForm);
  ((void (*)(uint64_t))v6)(v13);

  sub_229C339AC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_alertModel), *(void *)&self->_anon_0[OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_alertModel]);
  sub_22948636C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_dismiss));
  swift_bridgeObjectRelease();
  sub_22948636C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_authChallengeCompletion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_authChallengeCredential));
  swift_bridgeObjectRelease();
  memcpy(__dst, (char *)self + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_params, sizeof(__dst));
  sub_22992B918((uint64_t)__dst);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  uint64_t v12 = self;

  sub_229C2E038((uint64_t)&unk_268327B50, (uint64_t)v9);
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_229C2E13C(v6);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_229C2EC54(v6, a4);
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_229C2F02C();
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_229C2FDDC();

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
}

@end