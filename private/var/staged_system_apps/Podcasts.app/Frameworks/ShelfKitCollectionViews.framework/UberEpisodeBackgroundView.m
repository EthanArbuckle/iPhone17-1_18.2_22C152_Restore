@interface UberEpisodeBackgroundView
- (_TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UberEpisodeBackgroundView

- (_TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView *)sub_244990(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_245DB4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_245154(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_245A58();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView_gradientOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView_navGradientView));
  sub_EB49C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient), *(void *)&self->backgroundImageView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(void *)&self->blurView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(void *)&self->gradientOverlayView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(void *)&self->navGradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(void *)&self->zoomFactor[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(void *)&self->offset[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient], *(void **)&self->$__lazy_storage_$_lightGradient[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___lightGradient]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient);
  uint64_t v4 = *(void *)&self->backgroundImageView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient];
  uint64_t v5 = *(void *)&self->blurView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient];
  uint64_t v6 = *(void *)&self->gradientOverlayView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient];
  uint64_t v7 = *(void *)&self->navGradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient];
  uint64_t v8 = *(void *)&self->zoomFactor[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient];
  uint64_t v9 = *(void *)&self->offset[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient];
  v10 = *(void **)&self->$__lazy_storage_$_lightGradient[OBJC_IVAR____TtC23ShelfKitCollectionViews25UberEpisodeBackgroundView____lazy_storage___darkGradient];

  sub_EB49C(v3, v4, v5, v6, v7, v8, v9, v10);
}

@end