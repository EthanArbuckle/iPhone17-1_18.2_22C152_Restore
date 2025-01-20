@interface ShowHeaderView
- (_TtC23ShelfKitCollectionViews14ShowHeaderView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews14ShowHeaderView)initWithFrame:(CGRect)a3;
- (void)preferredContentSizeChanged:(id)a3;
- (void)secondaryButtonSubtitleLabelTapped;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ShowHeaderView

- (_TtC23ShelfKitCollectionViews14ShowHeaderView)initWithFrame:(CGRect)a3
{
  _s23ShelfKitCollectionViews14ShowHeaderViewC5frameACSo6CGRectV_tcfc_0();
  return result;
}

- (_TtC23ShelfKitCollectionViews14ShowHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s23ShelfKitCollectionViews14ShowHeaderViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)preferredContentSizeChanged:(id)a3
{
  uint64_t v4 = sub_37AD50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37AD40();
  v8 = self;
  sub_23BF14();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  ShowHeaderView.traitCollectionDidChange(_:)(v9);
}

- (void)secondaryButtonSubtitleLabelTapped
{
  v2 = self;
  sub_23C444();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_primaryButtonHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_secondaryButtonHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_providerButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_centralStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_upsellBanner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_descriptionLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView____lazy_storage___secondaryButtonSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_ratingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_metadataView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_entitlementBadge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_spacer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView____lazy_storage___stackViewBottomGuideConstraint));
  swift_release();
  swift_release();

  swift_release();
}

@end