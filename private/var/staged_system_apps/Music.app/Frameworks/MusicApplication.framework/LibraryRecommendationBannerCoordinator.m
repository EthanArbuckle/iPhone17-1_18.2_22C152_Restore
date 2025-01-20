@interface LibraryRecommendationBannerCoordinator
- (NSString)targetIdentifier;
- (_TtC16MusicApplication38LibraryRecommendationBannerCoordinator)init;
- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5;
@end

@implementation LibraryRecommendationBannerCoordinator

- (NSString)targetIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5
{
  uint64_t v9 = sub_AB6510();
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_459E70(a4, v9, v11);

  swift_bridgeObjectRelease();
}

- (_TtC16MusicApplication38LibraryRecommendationBannerCoordinator)init
{
  return (_TtC16MusicApplication38LibraryRecommendationBannerCoordinator *)sub_451E58();
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_didInteractWithBannerHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_shouldDisplayRecommendationBannerDidChangeHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_viewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_pendingMessage));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_currentMessage);
}

@end