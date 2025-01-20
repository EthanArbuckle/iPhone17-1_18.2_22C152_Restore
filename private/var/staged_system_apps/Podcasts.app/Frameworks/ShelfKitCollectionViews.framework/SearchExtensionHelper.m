@interface SearchExtensionHelper
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (_TtC23ShelfKitCollectionViews21SearchExtensionHelper)init;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
@end

@implementation SearchExtensionHelper

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BD12C(v4);

  return 1;
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BD274(v4);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  sub_3843C0();
  id v6 = a3;
  v7 = self;
  sub_1BD60C(v6);

  swift_bridgeObjectRelease();
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1BE618(a4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BD810(v4);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_479FE0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_didCancel) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_didCommit) = 0;
  id v8 = a3;
  v9 = self;
  sub_381E90();
  sub_1BCDC0((uint64_t)v7);
  sub_E544((uint64_t)v7, (uint64_t *)&unk_479FE0);
}

- (BOOL)textFieldShouldClear:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_479FE0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  sub_381E90();
  sub_1BCDC0((uint64_t)v7);
  sub_E544((uint64_t)v7, (uint64_t *)&unk_479FE0);

  return 1;
}

- (_TtC23ShelfKitCollectionViews21SearchExtensionHelper)init
{
  result = (_TtC23ShelfKitCollectionViews21SearchExtensionHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_searchController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_scopeBar));

  swift_bridgeObjectRelease();
}

@end