@interface MessageController
- (_TtC18FTLivePhotoService17MessageController)init;
@end

@implementation MessageController

- (_TtC18FTLivePhotoService17MessageController)init
{
}

- (void).cxx_destruct
{
  sub_10000D5B8((uint64_t)self + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_moments);
  sub_10000D5B8((uint64_t)self + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_stateMachine);
  sub_100023DDC((uint64_t)self + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_currentRequest, &qword_100059960);
  sub_10000D5B8((uint64_t)self + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_audioManager);
  sub_100023C34((uint64_t)self + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_messageStore, (void (*)(void))type metadata accessor for MessageStore);

  swift_release();
  sub_10000D5B8((uint64_t)self + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_videoMessagingController);
  sub_10000CDF0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_onRequestFinishedProcessing));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_onRequestError);

  sub_10000CDF0(v3);
}

@end