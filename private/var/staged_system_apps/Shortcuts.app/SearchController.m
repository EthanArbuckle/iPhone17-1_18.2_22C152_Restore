@interface SearchController
- (_TtC9Shortcuts16SearchController)init;
- (int64_t)positionForBar:(id)a3;
- (void)beginSearching;
- (void)dealloc;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
@end

@implementation SearchController

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10002D6C4((uint64_t)self + OBJC_IVAR____TtC9Shortcuts16SearchController_viewController);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

- (void)dealloc
{
  v2 = self;
  sub_1000084D0();
}

- (int64_t)positionForBar:(id)a3
{
  return 2;
}

- (void)beginSearching
{
  v2 = self;
  sub_10008CCF4();
}

- (_TtC9Shortcuts16SearchController)init
{
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10008CDD0(v4);
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10008CE84(v4);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  sub_10008CF68(v6);

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10008D02C(v4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10008D13C(v4);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10008D1F8(v4);
}

@end