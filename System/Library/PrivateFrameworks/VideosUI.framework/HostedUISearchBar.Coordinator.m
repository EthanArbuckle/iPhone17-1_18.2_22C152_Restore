@interface HostedUISearchBar.Coordinator
- (BOOL)textFieldShouldClear:(id)a3;
- (_TtCV8VideosUI17HostedUISearchBar11Coordinator)init;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
@end

@implementation HostedUISearchBar.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = sub_1E387C928();
  unint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_1E34FA708(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E34FA928((uint64_t)v5);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E34FA990((uint64_t)v5);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E34FAA30(v6);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E34FAB60(v6);
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E34FAC2C();

  return 1;
}

- (_TtCV8VideosUI17HostedUISearchBar11Coordinator)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)&self->_text[OBJC_IVAR____TtCV8VideosUI17HostedUISearchBar11Coordinator__textInputSource + 8];
  unint64_t v4 = *(void *)&self->_text[OBJC_IVAR____TtCV8VideosUI17HostedUISearchBar11Coordinator__textInputSource + 16];
  swift_release();
  swift_release();
  sub_1E30D6BB8(v3, v4);
  swift_release();
  swift_release();
}

@end