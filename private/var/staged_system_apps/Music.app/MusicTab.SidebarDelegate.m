@interface MusicTab.SidebarDelegate
- (_TtCC5Music8MusicTab15SidebarDelegate)init;
- (id)_tabBarController:(id)a3 sidebar:(id)a4 itemsForBeginningDragSession:(id)a5 tab:(id)a6;
- (id)tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5;
- (id)tabBarController:(id)a3 sidebar:(id)a4 itemForRequest:(id)a5;
- (id)tabBarController:(id)a3 sidebar:(id)a4 leadingSwipeActionsConfigurationForTab:(id)a5;
- (id)tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5;
- (unint64_t)_tabBarController:(id)a3 sidebar:(id)a4 sidebarAction:(id)a5 group:(id)a6 operationForAcceptingItemsFromDropSession:(id)a7;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 sidebarAction:(id)a5 group:(id)a6 acceptItemsFromDropSession:(id)a7;
- (void)tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5;
- (void)tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5;
- (void)tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5;
- (void)tabBarController:(id)a3 sidebarVisibilityWillChange:(id)a4 animator:(id)a5;
@end

@implementation MusicTab.SidebarDelegate

- (void)tabBarController:(id)a3 sidebarVisibilityWillChange:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_100125E60((uint64_t)v8, (uint64_t)v9, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (void)tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5
{
}

- (void)tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5
{
}

- (id)tabBarController:(id)a3 sidebar:(id)a4 itemForRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_1001269B8((uint64_t)v8, (uint64_t)v9, (uint64_t)v10);

  return v12;
}

- (void)tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5
{
  uint64_t v9 = type metadata accessor for UITabSidebarItem.Content();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  UITabSidebarItem.content.getter();
  v17 = (void *)sub_100126540((uint64_t)v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (v17)
  {
    if ([v17 respondsToSelector:"tabBarController:sidebar:updateItem:"]) {
      [v17 tabBarController:v13 sidebar:v14 updateItem:v15];
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (id)tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  return sub_1001263AC(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef_tabBarController_sidebar_contextMenuConfigurationForTab_);
}

- (id)tabBarController:(id)a3 sidebar:(id)a4 leadingSwipeActionsConfigurationForTab:(id)a5
{
  return sub_1001263AC(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef_tabBarController_sidebar_leadingSwipeActionsConfigurationForTab_);
}

- (id)tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5
{
  return sub_1001263AC(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef_tabBarController_sidebar_trailingSwipeActionsConfigurationForTab_);
}

- (_TtCC5Music8MusicTab15SidebarDelegate)init
{
  result = (_TtCC5Music8MusicTab15SidebarDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 itemsForBeginningDragSession:(id)a5 tab:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  swift_unknownObjectRetain();
  id v12 = a6;
  id v13 = self;
  sub_10033C680((uint64_t)v10, (uint64_t)a5, v12);

  swift_unknownObjectRelease();
  sub_100057778(0, (unint64_t *)&qword_1010A2C40);
  v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v14.super.isa;
}

- (unint64_t)_tabBarController:(id)a3 sidebar:(id)a4 sidebarAction:(id)a5 group:(id)a6 operationForAcceptingItemsFromDropSession:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  swift_unknownObjectRetain();
  v16 = self;
  id v17 = sub_10033C7E4((uint64_t)v12, (uint64_t)v14, v15, (uint64_t)a7);

  swift_unknownObjectRelease();
  return (unint64_t)v17;
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 sidebarAction:(id)a5 group:(id)a6 acceptItemsFromDropSession:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  swift_unknownObjectRetain();
  v16 = self;
  sub_10033C910((uint64_t)v12, (uint64_t)v14, v15, (uint64_t)a7);

  swift_unknownObjectRelease();
}

@end