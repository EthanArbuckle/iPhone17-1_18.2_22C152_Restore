@interface TipsContentModel
- (_TtC6TipsUI16TipsContentModel)init;
- (void)appController:(id)a3 loadingContent:(BOOL)a4;
- (void)appControllerContentUpdated:(id)a3;
- (void)appControllerNetworkStateDidChangeToReachable:(id)a3;
- (void)appControllerUserUpdatedSavedTips:(id)a3;
@end

@implementation TipsContentModel

- (_TtC6TipsUI16TipsContentModel)init
{
  return (_TtC6TipsUI16TipsContentModel *)sub_21798B700();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  uint64_t v4 = sub_2179E1BE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController));
  swift_release();
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  uint64_t v6 = sub_2179E1970();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (void)appControllerContentUpdated:(id)a3
{
  uint64_t v4 = (TPSAppController *)a3;
  v5 = self;
  TipsContentModel.appControllerContentUpdated(_:)(v4);
}

- (void)appController:(id)a3 loadingContent:(BOOL)a4
{
  uint64_t v6 = (TPSAppController *)a3;
  v7 = self;
  TipsContentModel.appController(_:loadingContent:)(v6, a4);
}

- (void)appControllerNetworkStateDidChangeToReachable:(id)a3
{
}

- (void)appControllerUserUpdatedSavedTips:(id)a3
{
}

@end