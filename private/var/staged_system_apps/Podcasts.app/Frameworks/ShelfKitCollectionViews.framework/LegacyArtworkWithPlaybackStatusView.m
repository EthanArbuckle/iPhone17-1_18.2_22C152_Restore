@interface LegacyArtworkWithPlaybackStatusView
- (float)accessibilityProgress;
- (void)layoutSubviews;
@end

@implementation LegacyArtworkWithPlaybackStatusView

- (void)layoutSubviews
{
  v2 = self;
  sub_29F62C();
}

- (float)accessibilityProgress
{
  return *(float *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView_progress);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView_progressOverlay));
  sub_13D3C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView_episodePlayState, (uint64_t (*)(void))&type metadata accessor for EpisodePlayState);
}

@end