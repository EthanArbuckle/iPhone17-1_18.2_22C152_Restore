@interface EpisodeUpsellBannerCell
- (_TtC23ShelfKitCollectionViews23EpisodeUpsellBannerCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23EpisodeUpsellBannerCell)initWithFrame:(CGRect)a3;
@end

@implementation EpisodeUpsellBannerCell

- (_TtC23ShelfKitCollectionViews23EpisodeUpsellBannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23EpisodeUpsellBannerCell *)sub_145F10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23EpisodeUpsellBannerCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews23EpisodeUpsellBannerCell *)sub_1460FC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodeUpsellBannerCell_cachingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodeUpsellBannerCell_episodeUpsellBannerView));

  swift_release();
}

@end