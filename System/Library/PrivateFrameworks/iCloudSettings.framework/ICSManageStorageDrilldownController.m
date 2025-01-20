@interface ICSManageStorageDrilldownController
- (ACAccount)account;
- (ICSManageStorageDrilldownController)init;
- (ICSManageStorageDrilldownController)initWithAppBundleID:(id)a3 account:(id)a4 navigationController:(id)a5;
- (NSString)appBundleID;
- (UINavigationController)navigationController;
- (void)beginLoadingForSpecifier:(id)a3;
- (void)loadFailed:(id)a3 withError:(id)a4;
- (void)loadFinished:(id)a3;
- (void)loadStarted:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setNavigationController:(id)a3;
@end

@implementation ICSManageStorageDrilldownController

- (NSString)appBundleID
{
  if (*(void *)&self->appBundleID[OBJC_IVAR___ICSManageStorageDrilldownController_appBundleID])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_262B04448();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAppBundleID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_262B04488();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICSManageStorageDrilldownController_appBundleID);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (ACAccount)account
{
  return (ACAccount *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___ICSManageStorageDrilldownController_account));
}

- (void)setAccount:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSManageStorageDrilldownController_account);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSManageStorageDrilldownController_account) = (Class)a3;
  id v3 = a3;
}

- (UINavigationController)navigationController
{
  v2 = (void *)MEMORY[0x263E5C710]((char *)self + OBJC_IVAR___ICSManageStorageDrilldownController_navigationController, a2);

  return (UINavigationController *)v2;
}

- (void)setNavigationController:(id)a3
{
}

- (ICSManageStorageDrilldownController)initWithAppBundleID:(id)a3 account:(id)a4 navigationController:(id)a5
{
  if (a3)
  {
    uint64_t v7 = sub_262B04488();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0;
  }
  id v10 = a4;
  id v11 = a5;
  v12 = (ICSManageStorageDrilldownController *)sub_262A2F8C8(v7, v9, a4);

  return v12;
}

- (void)beginLoadingForSpecifier:(id)a3
{
  id v5 = a3;
  id v4 = self;
  ManageStorageDrilldownController.beginLoading(specifier:)(v5);
}

- (void)loadStarted:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_262B04918();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v5 = self;
  }
  if (qword_26A984550 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_262B02DF8();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A994160);
  uint64_t v7 = sub_262B02DD8();
  os_log_type_t v8 = sub_262B047C8();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl(&dword_262993000, v7, v8, "Storage used VC loading started", v9, 2u);
    MEMORY[0x263E5C600](v9, -1, -1);
  }

  sub_2629F23F8((uint64_t)v10, &qword_26B422A70);
}

- (void)loadFinished:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_262B04918();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  ManageStorageDrilldownController.loadFinished(_:)();

  sub_2629F23F8((uint64_t)v6, &qword_26B422A70);
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    sub_262B04918();
    os_log_type_t v8 = (ICSManageStorageDrilldownController *)swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v9 = a4;
    os_log_type_t v8 = self;
  }
  ManageStorageDrilldownController.loadFailed(_:withError:)((uint64_t)v8, a4);

  sub_2629F23F8((uint64_t)v10, &qword_26B422A70);
}

- (ICSManageStorageDrilldownController)init
{
  result = (ICSManageStorageDrilldownController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSManageStorageDrilldownController_analyticsController);
}

@end