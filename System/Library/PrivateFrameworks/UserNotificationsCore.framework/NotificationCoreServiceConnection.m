@interface NotificationCoreServiceConnection
- (_TtC21UserNotificationsCore33NotificationCoreServiceConnection)init;
- (id)allBundleIdentifiersForCategories;
- (id)allBundleIdentifiersForNotifications;
- (id)badgeNumberForBundleIdentifier:(id)a3;
- (id)categoriesForBundleIdentifier:(id)a3;
- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)notificationRecordsForBundleIdentifier:(id)a3;
- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3;
- (void)removeSimilarNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeStoreForBundleIdentifier:(id)a3;
- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(id)a5 forBundleIdentifier:(id)a6 completionHandler:(id)a7;
- (void)saveNotificationRequest:(id)a3 shouldRepost:(id)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6;
- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation NotificationCoreServiceConnection

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_connection);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for NotificationCoreServiceConnection();
  [(NotificationCoreServiceConnection *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_connection));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_delegate;

  sub_26094056C((uint64_t)v3);
}

- (_TtC21UserNotificationsCore33NotificationCoreServiceConnection)init
{
  result = (_TtC21UserNotificationsCore33NotificationCoreServiceConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  sub_2608DED7C(0, (unint64_t *)&unk_26B3FC9B0);
  sub_260A84D70();
  sub_260A84BC0();
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = self;
    swift_unknownObjectRetain();
    v7 = (void *)sub_260A84D60();
    v8 = (void *)sub_260A84BB0();
    objc_msgSend(v5, sel_notifyDidPerformUpdates_forBundleIdentifier_, v7, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = self;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (id)allBundleIdentifiersForNotifications
{
  return sub_260A590D0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository);
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  return sub_260A59284((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository, (SEL *)&selRef_notificationRecordsForBundleIdentifier_, (unint64_t *)&qword_26A8C67C0);
}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return sub_260A5917C((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository, (SEL *)&selRef_notificationRecordForIdentifier_bundleIdentifier_);
}

- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(id)a5 forBundleIdentifier:(id)a6 completionHandler:(id)a7
{
  v11 = _Block_copy(a7);
  uint64_t v12 = sub_260A84BC0();
  uint64_t v14 = v13;
  if (v11)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v11;
    v11 = sub_260A071B0;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = a3;
  id v17 = a5;
  v18 = self;
  id v19 = a4;
  sub_260A58250((uint64_t)v16, (uint64_t)a4, v17, v12, v14, (uint64_t)v11, v15);
  sub_2609477D4((uint64_t)v11);

  swift_bridgeObjectRelease();
}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(id)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  uint64_t v20 = sub_260A83CD0();
  uint64_t v9 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260A83C90();
  sub_260A84BC0();
  uint64_t v12 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository);
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  id v16 = objc_msgSend(v14, sel_BOOLValue);
  id v17 = (void *)sub_260A83C20();
  v18 = (void *)sub_260A84BB0();
  objc_msgSend(v12, sel_saveNotificationRequest_shouldRepost_apsMessageTimestamp_forBundleIdentifier_, v13, v16, v17, v18);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5 = sub_260A84D70();
  sub_260A84BC0();
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository);
  v7 = self;
  sub_2609DB6A0(v5);
  v8 = (void *)sub_260A84F90();
  swift_bridgeObjectRelease();
  id v9 = (id)sub_260A84BB0();
  objc_msgSend(v6, sel_removeNotificationRecordsForIdentifiers_bundleIdentifier_, v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)removeSimilarNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
}

- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
}

- (void)removeStoreForBundleIdentifier:(id)a3
{
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  sub_260A84BC0();
  uint64_t v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository);
  uint64_t v5 = self;
  v6 = (void *)sub_260A84BB0();
  id v7 = objc_msgSend(v4, sel_badgeNumberForBundleIdentifier_, v6);

  swift_bridgeObjectRelease();

  return v7;
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v8 = sub_260A84BC0();
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v7;
    id v7 = sub_2608DF170;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = self;
  id v13 = a3;
  sub_260A589F0((uint64_t)a3, v8, v10, v7, v11);
  sub_2609477D4((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v8 = sub_260A84BC0();
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v7;
    id v7 = sub_2608DF170;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  id v13 = self;
  sub_260A58BCC(v12, v8, v10, v7, v11);
  sub_2609477D4((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = _Block_copy(a5);
  if (a3)
  {
    uint64_t v8 = sub_260A84BC0();
    a3 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v10 = sub_260A84BC0();
  uint64_t v12 = v11;
  if (v7)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v7;
    id v7 = sub_2608DF104;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = self;
  sub_260A58DB8(v8, (uint64_t)a3, v10, v12, v7, v13);
  sub_2609477D4((uint64_t)v7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
  sub_260A84BC0();
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    v6 = self;
    swift_unknownObjectRetain();
    id v7 = (id)sub_260A84BB0();
    objc_msgSend(v5, sel_notifyDidChangeCategoriesForBundleIdentifier_, v7);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (id)allBundleIdentifiersForCategories
{
  return sub_260A590D0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_categoryRepository);
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return sub_260A5917C((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_categoryRepository, (SEL *)&selRef_categoryWithIdentifier_bundleIdentifier_);
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  return sub_260A59284((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_categoryRepository, (SEL *)&selRef_categoriesForBundleIdentifier_, (unint64_t *)&qword_26B3FD120);
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
}

@end