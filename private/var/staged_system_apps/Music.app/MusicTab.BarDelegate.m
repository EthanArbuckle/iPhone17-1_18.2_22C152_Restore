@interface MusicTab.BarDelegate
- (BOOL)tabBarController:(id)a3 shouldSelectTab:(id)a4;
- (_TtCC5Music8MusicTab11BarDelegate)init;
- (id)tabBarController:(id)a3 displayedViewControllersForTab:(id)a4 proposedViewControllers:(id)a5;
- (unint64_t)tabBarController:(id)a3 tab:(id)a4 operationForAcceptingItemsFromDropSession:(id)a5;
- (void)tabBarController:(id)a3 didSelectTab:(id)a4 previousTab:(id)a5;
- (void)tabBarController:(id)a3 displayOrderDidChangeForGroup:(id)a4;
- (void)tabBarController:(id)a3 tab:(id)a4 acceptItemsFromDropSession:(id)a5;
- (void)tabBarController:(id)a3 visibilityDidChangeForTabs:(id)a4;
- (void)tabBarControllerDidEndEditing:(id)a3;
- (void)tabBarControllerWillBeginEditing:(id)a3;
@end

@implementation MusicTab.BarDelegate

- (void)tabBarController:(id)a3 didSelectTab:(id)a4 previousTab:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000109C4(v8, v9, a5);
}

- (BOOL)tabBarController:(id)a3 shouldSelectTab:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = [v7 managingTabGroup];
  if (!v9) {
    id v9 = v7;
  }
  unsigned __int8 v10 = 1;
  v11 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v11)
  {
    v12 = v11;
    if ([v11 respondsToSelector:"tabBarController:shouldSelectTab:"]) {
      unsigned __int8 v10 = [v12 tabBarController:v6 shouldSelectTab:v7];
    }
    else {
      unsigned __int8 v10 = 1;
    }
  }

  return v10;
}

- (id)tabBarController:(id)a3 displayedViewControllersForTab:(id)a4 proposedViewControllers:(id)a5
{
  sub_100057778(0, (unint64_t *)&qword_101099260);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10033C238((uint64_t)v9, v10, v8);

  swift_bridgeObjectRelease();
  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (void)tabBarControllerWillBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10033B244((uint64_t)v4);
}

- (void)tabBarControllerDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10033B2B8((uint64_t)v4);
}

- (void)tabBarController:(id)a3 displayOrderDidChangeForGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = [v7 managingTabGroup];
  if (!v9) {
    id v9 = v7;
  }
  id v10 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v10)
  {
    v11 = v10;
    if ([v10 respondsToSelector:"tabBarController:displayOrderDidChangeForGroup:"]) {
      [v11 tabBarController:v6 displayOrderDidChangeForGroup:v7];
    }
  }
}

- (void)tabBarController:(id)a3 visibilityDidChangeForTabs:(id)a4
{
  sub_100057778(0, (unint64_t *)&qword_10109AB10);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  sub_10033C364((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (void)tabBarController:(id)a3 tab:(id)a4 acceptItemsFromDropSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_10033BAD8((uint64_t)v8, v9, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (unint64_t)tabBarController:(id)a3 tab:(id)a4 operationForAcceptingItemsFromDropSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  id v11 = sub_10033BC5C((uint64_t)v8, v9, (uint64_t)a5);

  swift_unknownObjectRelease();
  return (unint64_t)v11;
}

- (_TtCC5Music8MusicTab11BarDelegate)init
{
  result = (_TtCC5Music8MusicTab11BarDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end