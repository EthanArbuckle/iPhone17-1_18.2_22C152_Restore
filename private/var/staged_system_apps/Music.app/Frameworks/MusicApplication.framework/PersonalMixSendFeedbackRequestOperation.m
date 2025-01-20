@interface PersonalMixSendFeedbackRequestOperation
- (_TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation)init;
- (void)execute;
@end

@implementation PersonalMixSendFeedbackRequestOperation

- (void)execute
{
  v2 = self;
  sub_335D9C();
}

- (_TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation)init
{
  result = (_TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = &self->playlistGlobalID[OBJC_IVAR____TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation_baseURL];
  uint64_t v3 = sub_AB0930();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end