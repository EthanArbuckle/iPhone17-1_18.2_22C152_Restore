@interface WebAdNavigationCoordinator
- (_TtC17PromotedContentUI26WebAdNavigationCoordinator)init;
- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4;
- (void)_webView:(id)a3 webContentProcessDidTerminateWithReason:(int64_t)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation WebAdNavigationCoordinator

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  id v7 = a3;
  v8 = self;
  sub_1B5CFDBC0(a3, a4);
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = (void *)MEMORY[0x1BA9AC660]((char *)self + OBJC_IVAR____TtC17PromotedContentUI26WebAdNavigationCoordinator_navigationResponder);
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v10, sel_respondsToSelector_, sel_webView_decidePolicyForNavigationAction_decisionHandler_))
    {
      v16[4] = sub_1B5CFE65C;
      v16[5] = v9;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 1107296256;
      v16[2] = sub_1B5CFE008;
      v16[3] = &unk_1F0EEAA28;
      v12 = _Block_copy(v16);
      id v13 = a3;
      id v14 = a4;
      v15 = self;
      swift_retain();
      objc_msgSend(v11, sel_webView_decidePolicyForNavigationAction_decisionHandler_, v13, v14, v12);
      _Block_release(v12);

      swift_release();
      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {
      swift_release();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_release();
  }
}

- (void)_webView:(id)a3 webContentProcessDidTerminateWithReason:(int64_t)a4
{
  id v7 = a3;
  v8 = self;
  sub_1B5CFE230(a3, a4);
}

- (_TtC17PromotedContentUI26WebAdNavigationCoordinator)init
{
  result = (_TtC17PromotedContentUI26WebAdNavigationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end