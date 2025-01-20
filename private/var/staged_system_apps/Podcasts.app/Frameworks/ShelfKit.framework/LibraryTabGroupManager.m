@interface LibraryTabGroupManager
- (_TtC8ShelfKit22LibraryTabGroupManager)init;
- (id)_tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5;
- (id)tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 visibilityDidChangeForTabs:(id)a5;
- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4;
- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4;
@end

@implementation LibraryTabGroupManager

- (_TtC8ShelfKit22LibraryTabGroupManager)init
{
  result = (_TtC8ShelfKit22LibraryTabGroupManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8ShelfKit22LibraryTabGroupManager_libraryActionController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8ShelfKit22LibraryTabGroupManager_episodeController);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit22LibraryTabGroupManager_tabGroup);
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1A8B04();
}

- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4
{
  id v6 = (void *)sub_3D8020();
  id v7 = a3;
  v8 = self;
  LibraryTabGroupManager._tabElementGroup(_:didCustomizeDisplayOrder:)(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 visibilityDidChangeForTabs:(id)a5
{
  sub_3D530(0, &qword_4B4AE8);
  sub_1AD804();
  uint64_t v8 = sub_3D8270();
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1AC628(v8);

  swift_bridgeObjectRelease();
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5
{
  return sub_1A7078(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id))sub_1AC734);
}

- (id)tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  return sub_1A7078(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id))sub_1ACA4C);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1ACF3C(v10);
}

@end