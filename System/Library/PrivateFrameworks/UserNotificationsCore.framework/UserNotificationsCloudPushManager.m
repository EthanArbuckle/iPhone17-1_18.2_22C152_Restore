@interface UserNotificationsCloudPushManager
- (_TtC21UserNotificationsCore33UserNotificationsCloudPushManager)init;
- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4;
@end

@implementation UserNotificationsCloudPushManager

- (_TtC21UserNotificationsCore33UserNotificationsCloudPushManager)init
{
  result = (_TtC21UserNotificationsCore33UserNotificationsCloudPushManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4
{
  v6 = (UNCKeyedDataStoreRepository *)sub_260A84BC0();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v12.super.isa = (Class)a3;
  v12._repository = v6;
  v12._observable = v8;
  UserNotificationsCloudPushManager.categoryRepository(_:didChangeCategoriesForBundleIdentifier:)(v12, v10);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end