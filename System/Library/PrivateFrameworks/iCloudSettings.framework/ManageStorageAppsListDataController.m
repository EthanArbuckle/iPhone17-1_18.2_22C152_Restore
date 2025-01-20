@interface ManageStorageAppsListDataController
- (ACAccount)account;
- (BOOL)shouldIgnoreCache;
- (_TtC14iCloudSettings35ManageStorageAppsListDataController)init;
- (_TtC14iCloudSettings35ManageStorageAppsListDataController)initWithAccount:(id)a3 launchedFromRootLevel:(BOOL)a4 shouldIgnoreCache:(BOOL)a5;
- (void)fetchAppsListDataWithCompletionHandler:(id)a3;
- (void)setShouldIgnoreCache:(BOOL)a3;
@end

@implementation ManageStorageAppsListDataController

- (ACAccount)account
{
  return (ACAccount *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC14iCloudSettings35ManageStorageAppsListDataController_account));
}

- (BOOL)shouldIgnoreCache
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14iCloudSettings35ManageStorageAppsListDataController_shouldIgnoreCache;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14iCloudSettings35ManageStorageAppsListDataController_shouldIgnoreCache;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC14iCloudSettings35ManageStorageAppsListDataController)initWithAccount:(id)a3 launchedFromRootLevel:(BOOL)a4 shouldIgnoreCache:(BOOL)a5
{
  id v7 = a3;
  v8 = (_TtC14iCloudSettings35ManageStorageAppsListDataController *)sub_2629F651C(v7, a4, a5);

  return v8;
}

- (void)fetchAppsListDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A985010;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A985018;
  v12[5] = v11;
  v13 = self;
  sub_262A7F994((uint64_t)v7, (uint64_t)&unk_26A985020, (uint64_t)v12);
  swift_release();
}

- (_TtC14iCloudSettings35ManageStorageAppsListDataController)init
{
  result = (_TtC14iCloudSettings35ManageStorageAppsListDataController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings35ManageStorageAppsListDataController_account));

  swift_release();
}

@end