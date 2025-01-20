@interface GlyphSearchBar.RepresentableView.Coordinator
- (_TtCVV10WorkflowUI14GlyphSearchBarP33_7B2EDB8C9E03C94CB46248885C8C32B517RepresentableView11Coordinator)init;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
@end

@implementation GlyphSearchBar.RepresentableView.Coordinator

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBD2FC0();
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBD3034();
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_22DBD30A8((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DBD32F0();
}

- (_TtCVV10WorkflowUI14GlyphSearchBarP33_7B2EDB8C9E03C94CB46248885C8C32B517RepresentableView11Coordinator)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end