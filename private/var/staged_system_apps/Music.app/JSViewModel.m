@interface JSViewModel
@end

@implementation JSViewModel

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10007A748(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore11JSViewModel_playActivityRecommendationData), *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore11JSViewModel_playActivityRecommendationData]);

  swift_bridgeObjectRelease();
}

@end