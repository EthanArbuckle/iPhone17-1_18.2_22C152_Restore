@interface NotificationSystemServiceClient
- (_TtC21UserNotificationsCore31NotificationSystemServiceClient)init;
- (id)allBundleIdentifiersForCategories;
- (id)categoriesForBundleIdentifier:(id)a3;
- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation NotificationSystemServiceClient

- (_TtC21UserNotificationsCore31NotificationSystemServiceClient)init
{
  return (_TtC21UserNotificationsCore31NotificationSystemServiceClient *)sub_260A76240();
}

- (void)dealloc
{
  v2 = self;
  sub_260A764D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue_connection);
}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_260A84BC0();
  uint64_t v6 = v5;
  v7 = self;
  sub_260A76A00(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5 = sub_260A84D70();
  uint64_t v6 = sub_260A84BC0();
  uint64_t v8 = v7;
  v9 = self;
  sub_260A76DC0(v5, v6, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)allBundleIdentifiersForCategories
{
  v2 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF10);
  sub_260A850E0();

  v3 = (void *)sub_260A84D60();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  sub_260A84BC0();
  sub_260A84BC0();
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3F7F00);
  sub_260A850E0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  sub_260A84BC0();
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F7E78);
  sub_260A850E0();

  swift_bridgeObjectRelease();
  sub_2608DED7C(0, (unint64_t *)&qword_26B3FD120);
  uint64_t v4 = (void *)sub_260A84D60();
  swift_bridgeObjectRelease();

  return v4;
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  sub_2608DED7C(0, (unint64_t *)&qword_26B3FD120);
  uint64_t v5 = sub_260A84D70();
  uint64_t v6 = sub_260A84BC0();
  uint64_t v8 = v7;
  v9 = self;
  sub_260A776AC(v5, v6, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end