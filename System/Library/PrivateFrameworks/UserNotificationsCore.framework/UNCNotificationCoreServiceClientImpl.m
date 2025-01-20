@interface UNCNotificationCoreServiceClientImpl
- (UNCNotificationCoreServiceClientDelegate)delegate;
- (UNCNotificationCoreServiceClientImpl)init;
- (id)allBundleIdentifiersForCategories;
- (id)allBundleIdentifiersForNotifications;
- (id)badgeNumberForBundleIdentifier:(id)a3;
- (id)categoriesForBundleIdentifier:(id)a3;
- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)notificationRecordsForBundleIdentifier:(id)a3;
- (void)categoryRepositoryDidChangeCategories:(id)a3;
- (void)dealloc;
- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4;
- (void)performAction:(id)a3 forNotification:(id)a4 inApp:(id)a5 withUserText:(id)a6;
- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeNotificationRecordsForIdentifiersWithIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3;
- (void)removeSimilarNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeStoreForBundleIdentifier:(id)a3;
- (void)save:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6;
- (void)save:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 completionHandler:(id)a7;
- (void)setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation UNCNotificationCoreServiceClientImpl

- (UNCNotificationCoreServiceClientDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___UNCNotificationCoreServiceClientImpl_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x261222930](v2);

  return (UNCNotificationCoreServiceClientDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (UNCNotificationCoreServiceClientImpl)init
{
  return (UNCNotificationCoreServiceClientImpl *)NotificationCoreServiceClient.init()();
}

- (void)dealloc
{
  v2 = self;
  NotificationCoreServiceClient.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___UNCNotificationCoreServiceClientImpl_delegate;

  sub_26094056C((uint64_t)v3);
}

- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
}

- (id)allBundleIdentifiersForNotifications
{
  return sub_260A04EF0(self);
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  return sub_260A05400(self, (uint64_t)a2, (uint64_t)a3, &qword_26A8C67A8, (uint64_t)sub_260A0732C, (unint64_t *)&qword_26A8C67C0);
}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return sub_260A05174(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t *)&unk_26A8C67B0);
}

- (void)save:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 completionHandler:(id)a7
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
  id v17 = a4;
  v18 = self;
  sub_260A01F30(v16, a4, a5, v12, v14, (uint64_t)v11, v15);
  sub_2609477D4((uint64_t)v11);

  swift_bridgeObjectRelease();
}

- (void)save:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  uint64_t v9 = sub_260A83CD0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260A83C90();
  uint64_t v13 = sub_260A84BC0();
  uint64_t v15 = v14;
  id v16 = a3;
  id v17 = self;
  sub_260A02708(v16, a4, (uint64_t)v12, v13, v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)removeNotificationRecordsForIdentifiersWithIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5 = sub_260A84D70();
  uint64_t v6 = sub_260A84BC0();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  sub_260A02E6C(v5, v6, v8);

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
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(qword_26A8C7590);
  sub_260A850E0();

  swift_bridgeObjectRelease();

  return v6;
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v8 = sub_260A84BC0();
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v7;
    uint64_t v7 = sub_2608DF170;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = self;
  id v13 = a3;
  sub_260A03A94(a3, v8, v10, (uint64_t)v7, v11);
  sub_2609477D4((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v8 = sub_260A84BC0();
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v7;
    uint64_t v7 = sub_2608DF170;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = self;
  sub_260A04028(a3, v8, v10, (uint64_t)v7, v11);
  sub_2609477D4((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
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
    uint64_t v7 = sub_2608DF104;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = self;
  sub_260A045D8(v8, (uint64_t)a3, v10, v12, (uint64_t)v7, v13);
  sub_2609477D4((uint64_t)v7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)categoryRepositoryDidChangeCategories:(id)a3
{
}

- (id)allBundleIdentifiersForCategories
{
  return sub_260A04EF0(self);
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return sub_260A05174(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t *)&unk_26B3F7F00);
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  return sub_260A05400(self, (uint64_t)a2, (uint64_t)a3, &qword_26B3F7E78, (uint64_t)sub_260A072FC, (unint64_t *)&qword_26B3FD120);
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
}

- (void)performAction:(id)a3 forNotification:(id)a4 inApp:(id)a5 withUserText:(id)a6
{
  uint64_t v8 = sub_260A84BC0();
  uint64_t v10 = v9;
  uint64_t v11 = sub_260A84BC0();
  uint64_t v13 = v12;
  uint64_t v14 = sub_260A84BC0();
  uint64_t v16 = v15;
  if (a6)
  {
    uint64_t v17 = sub_260A84BC0();
    a6 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  v19 = self;
  sub_260A05728(v8, v10, v11, v13, v14, v16, v17, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end