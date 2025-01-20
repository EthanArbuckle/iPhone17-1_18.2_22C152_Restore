@interface iCloudHomeViewModel
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (NSString)driveDataclassSubtitle;
- (NSString)mailDataclassSubtitle;
- (NSString)photosDataclassSubtitle;
- (_TtC14iCloudSettings19iCloudHomeViewModel)init;
- (_TtC14iCloudSettings22ICSAnalyticsController)analyticsController;
- (id)expandedSubTitleForDataclass:(id)a3;
- (id)expandedSubTitleForService:(id)a3;
- (void)dealloc;
- (void)didStartLoadingWithView:(int64_t)a3;
- (void)didStopLoadingWithView:(int64_t)a3;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4;
@end

@implementation iCloudHomeViewModel

- (_TtC14iCloudSettings22ICSAnalyticsController)analyticsController
{
  return (_TtC14iCloudSettings22ICSAnalyticsController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel_analyticsController));
}

- (void)dealloc
{
  v2 = self;
  iCloudHomeViewModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__privateRelayViewModel));
  swift_unknownObjectWeakDestroy();
  sub_2629F23F8((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__appendSettingsNavigationPath, &qword_26A986CF0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__upgradeFlowManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__legacyRUIController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__legacyManagePlanController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__legacyManagePlanFlowManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__familyCircleStateController));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__customEmailPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__manageSubsPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__commerceFlowManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__adpSectionViewModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__privateRelayViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__safariWebViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__dataclassValidationController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__mailSettingsProvider));
  swift_unknownObjectWeakDestroy();
  sub_2629F201C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel____lazy_storage___numberFormatter));
  sub_2629F201C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel____lazy_storage___appDownloadFlowManager));
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel_analyticsController));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel___observationRegistrar;
  uint64_t v4 = sub_262B02B38();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (NSString)photosDataclassSubtitle
{
  return (NSString *)sub_2629E00E4(self, (uint64_t)a2, (void (*)(void))iCloudHomeViewModel.photosDataclassSubtitle.getter);
}

- (NSString)driveDataclassSubtitle
{
  return (NSString *)sub_2629E00E4(self, (uint64_t)a2, (void (*)(void))iCloudHomeViewModel.driveDataclassSubtitle.getter);
}

- (NSString)mailDataclassSubtitle
{
  return (NSString *)sub_2629E00E4(self, (uint64_t)a2, (void (*)(void))iCloudHomeViewModel.mailDataclassSubtitle.getter);
}

- (id)expandedSubTitleForDataclass:(id)a3
{
  id v4 = a3;
  v5 = self;
  iCloudHomeViewModel.subTitle(for:)();
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

- (id)expandedSubTitleForService:(id)a3
{
  v3 = (void *)sub_262B04448();

  return v3;
}

- (_TtC14iCloudSettings19iCloudHomeViewModel)init
{
  result = (_TtC14iCloudSettings19iCloudHomeViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didStartLoadingWithView:(int64_t)a3
{
  id v4 = self;
  iCloudHomeViewModel.didStartLoading(view:)(a3);
}

- (void)didStopLoadingWithView:(int64_t)a3
{
  id v4 = self;
  iCloudHomeViewModel.didStopLoading(view:)(a3);
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s14iCloudSettings01iA13HomeViewModelC29upgradeFlowManagerDidCompleteyySo010ICQUpgradegH0CSgF_0();
}

- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = a4;
  sub_262A70E10(a4);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)safariViewControllerDidFinish:(id)a3
{
}

@end