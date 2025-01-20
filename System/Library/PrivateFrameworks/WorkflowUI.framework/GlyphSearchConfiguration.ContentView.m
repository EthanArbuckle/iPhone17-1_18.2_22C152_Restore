@interface GlyphSearchConfiguration.ContentView
- (_TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView)initWithCoder:(id)a3;
- (_TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView)initWithFrame:(CGRect)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
@end

@implementation GlyphSearchConfiguration.ContentView

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBD3B54(v4, 1);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBD3B54(v4, 0);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_22DBD3C30((uint64_t)v10, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBD3DDC(v4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBD3E84(v4);
}

- (_TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DBD3EE8();
}

- (_TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView_configuration;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end