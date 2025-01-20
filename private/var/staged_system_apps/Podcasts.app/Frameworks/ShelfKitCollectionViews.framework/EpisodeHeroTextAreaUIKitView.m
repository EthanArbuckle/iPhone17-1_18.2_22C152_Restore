@interface EpisodeHeroTextAreaUIKitView
- (_TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EpisodeHeroTextAreaUIKitView

- (_TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2679DC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_264C80();
}

- (_TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_environment;
  uint64_t v4 = sub_37E560();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_267C98((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_metrics, type metadata accessor for EpisodeHeroTextArea.Metrics);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_caption));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_title));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_summary));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews28EpisodeHeroTextAreaUIKitView_playedIcon);
}

@end