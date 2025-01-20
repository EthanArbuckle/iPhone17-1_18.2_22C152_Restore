@interface SiriSharedUISuggestionsProvider
- (_TtC12SiriSharedUI31SiriSharedUISuggestionsProvider)init;
@end

@implementation SiriSharedUISuggestionsProvider

- (_TtC12SiriSharedUI31SiriSharedUISuggestionsProvider)init
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_suggestionsExposureCallback);
  void *v2 = 0;
  v2[1] = 0;
  v3 = self;
  sub_20CA81D78();
  *((unsigned char *)&v3->super.isa + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_emittedRequestLink) = 0;
  *(Class *)((char *)&v3->super.isa
           + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_cachedAutoCompletionsFacade) = 0;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for SiriSharedUISuggestionsProvider();
  return [(SiriSharedUISuggestionsProvider *)&v5 init];
}

- (void).cxx_destruct
{
  sub_20CA0CDD4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_suggestionsExposureCallback));
  v3 = (char *)self + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_typingSessionId;
  uint64_t v4 = sub_20CA81D88();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

@end