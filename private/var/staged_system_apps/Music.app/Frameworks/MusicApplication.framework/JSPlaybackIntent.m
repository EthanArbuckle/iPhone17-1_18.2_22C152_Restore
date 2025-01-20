@interface JSPlaybackIntent
@end

@implementation JSPlaybackIntent

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC11MusicJSCore16JSPlaybackIntent_playActivityRecommendationData);
  unint64_t v4 = *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore16JSPlaybackIntent_playActivityRecommendationData];

  sub_4B654(v3, v4);
}

@end