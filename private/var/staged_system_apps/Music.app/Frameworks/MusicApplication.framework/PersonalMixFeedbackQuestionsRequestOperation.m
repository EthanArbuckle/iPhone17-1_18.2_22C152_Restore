@interface PersonalMixFeedbackQuestionsRequestOperation
- (_TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation)init;
- (void)execute;
@end

@implementation PersonalMixFeedbackQuestionsRequestOperation

- (void)execute
{
  v2 = self;
  sub_420148();
}

- (_TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation)init
{
  result = (_TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = &self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation_baseURL];
  uint64_t v4 = sub_AB0930();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end