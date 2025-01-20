@interface ArtworkWithPlaybackStatusView
- (_TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView)init;
- (float)accessibilityProgress;
- (void)layoutSubviews;
@end

@implementation ArtworkWithPlaybackStatusView

- (_TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView)init
{
  return (_TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView *)sub_12BF4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_12FA0();
}

- (float)accessibilityProgress
{
  return *(float *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView_progress);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView_progressOverlay));
  sub_13D3C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews29ArtworkWithPlaybackStatusView_episodePlayState, (uint64_t (*)(void))&type metadata accessor for EpisodePlayState);
}

@end