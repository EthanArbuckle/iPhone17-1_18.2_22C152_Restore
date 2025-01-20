@interface SMCatalogStore
- (SMCatalogStore)init;
- (id)init:(id)a3;
- (void)catalogResetSyncWithCompletion:(id)a3;
- (void)handleCatalogResetSyncNotificationWithNotification:(id)a3;
- (void)queryCatalogWorkoutDetail:(id)a3 completion:(id)a4;
- (void)queryFeaturedCatalogLockupsWithCompletion:(id)a3;
@end

@implementation SMCatalogStore

- (id)init:(id)a3
{
  return CatalogStore.init(_:)(a3);
}

- (void)queryFeaturedCatalogLockupsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_261B80E80((uint64_t)sub_261B84D34, v5);

  swift_release();
}

- (void)queryCatalogWorkoutDetail:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_261B8F0F8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_261B81858(v6, v8, (uint64_t)sub_261A552FC, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)catalogResetSyncWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944F90);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  v11 = self;
  sub_261B82368((uint64_t)v8);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_261B84D28;
  *(void *)(v12 + 24) = v10;
  swift_retain();
  v13 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_261B8B7A8();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_261B851E8;
  *(void *)(v14 + 24) = v12;
  swift_retain();
  v13(sub_261A549EC, v14);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  swift_release();
}

- (void)handleCatalogResetSyncNotificationWithNotification:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944F90);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_261B8A898();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B8A878();
  uint64_t v12 = self;
  sub_261B82368((uint64_t)v7);
  v13 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_261B8B7A8();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_261B81F4C;
  *(void *)(v14 + 24) = 0;
  v13(sub_261A549EC, v14);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (SMCatalogStore)init
{
  result = (SMCatalogStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_assetClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_catalogClient);
  v3 = (char *)self + OBJC_IVAR___SMCatalogStore_calendar;
  uint64_t v4 = sub_261B8AFC8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_contentRestrictionObserver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_mediaTagStringBuilder);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_bookmarkClient);
  uint64_t v5 = (char *)self + OBJC_IVAR___SMCatalogStore_recommendationClient;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

@end