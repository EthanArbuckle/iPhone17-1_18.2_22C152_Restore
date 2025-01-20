@interface ListDebugHUDModel
- (NCNotificationListView)listView;
- (_TtC22UserNotificationsUIKit17ListDebugHUDModel)init;
- (void)setListView:(id)a3;
@end

@implementation ListDebugHUDModel

- (NCNotificationListView)listView
{
  v2 = (void *)MEMORY[0x1D9481D00]((char *)self + OBJC_IVAR____TtC22UserNotificationsUIKit17ListDebugHUDModel_listView, a2);

  return (NCNotificationListView *)v2;
}

- (void)setListView:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_1D7D69A68();
  swift_unknownObjectWeakAssign();
  sub_1D7D5FCD0();
}

- (_TtC22UserNotificationsUIKit17ListDebugHUDModel)init
{
  return (_TtC22UserNotificationsUIKit17ListDebugHUDModel *)sub_1D7D61210();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC22UserNotificationsUIKit17ListDebugHUDModel___observationRegistrar;
  uint64_t v4 = sub_1D7D7F050();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end