@interface UpsellArtworkView
- (_TtC23ShelfKitCollectionViews17UpsellArtworkView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17UpsellArtworkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation UpsellArtworkView

- (_TtC23ShelfKitCollectionViews17UpsellArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17UpsellArtworkView *)sub_1219B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews17UpsellArtworkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_122F84();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(UpsellArtworkView *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_shadowView];
  if (v3)
  {
    v4 = v3;
    [v2 bounds];
    [v4 setFrame:];

    v2 = v4;
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_chinBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_background));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_entitlementBadgeView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17UpsellArtworkView_shadow));

  swift_release();
}

@end