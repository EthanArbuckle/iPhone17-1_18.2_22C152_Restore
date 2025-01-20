@interface ManageStorageAppsListViewModel
+ (NSString)ViewModelDidUpdateNotificationName;
- (_TtC14iCloudSettings30ManageStorageAppsListViewModel)init;
- (id)expandedSubTitleForDataclass:(id)a3;
- (id)expandedSubTitleForLiverpoolBundleId:(id)a3;
- (void)fetchAppsListWithFetchHomeViewModel:(BOOL)a3 loadImages:(BOOL)a4 completionHandler:(id)a5;
- (void)handleQuotaChangeNotification;
@end

@implementation ManageStorageAppsListViewModel

+ (NSString)ViewModelDidUpdateNotificationName
{
  if (qword_26A984538 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26A985310;

  return (NSString *)v2;
}

- (void)handleQuotaChangeNotification
{
  v2 = self;
  ManageStorageAppsListViewModel.handleQuotaChangeNotification()();
}

- (void)fetchAppsListWithFetchHomeViewModel:(BOOL)a3 loadImages:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 17) = a4;
  *(void *)(v13 + 24) = v12;
  *(void *)(v13 + 32) = self;
  uint64_t v14 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A985428;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26A985018;
  v16[5] = v15;
  v17 = self;
  sub_262A7F994((uint64_t)v11, (uint64_t)&unk_26A985020, (uint64_t)v16);
  swift_release();
}

- (id)expandedSubTitleForDataclass:(id)a3
{
  v4 = self;
  id v5 = a3;
  ManageStorageAppsListViewModel.expandedSubTitle(forDataclass:)(v5);
  uint64_t v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_262B04448();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)expandedSubTitleForLiverpoolBundleId:(id)a3
{
  uint64_t v4 = sub_262B04488();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = ManageStorageAppsListViewModel.expandedSubTitle(forLiverpoolBundleId:)(v8).value._object;
  swift_bridgeObjectRelease();

  if (object)
  {
    uint64_t v10 = (void *)sub_262B04448();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (_TtC14iCloudSettings30ManageStorageAppsListViewModel)init
{
  result = (_TtC14iCloudSettings30ManageStorageAppsListViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel__appsListDataModel));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_appsListDataController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_account));
  swift_release();
  sub_262A06604(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_appCategoryToShowWhenLoadingComplete), *(void *)&self->_appsListDataModel[OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_appCategoryToShowWhenLoadingComplete]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_analyticsController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_navigationController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_activityIndicator));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel___observationRegistrar;
  uint64_t v4 = sub_262B02B38();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end