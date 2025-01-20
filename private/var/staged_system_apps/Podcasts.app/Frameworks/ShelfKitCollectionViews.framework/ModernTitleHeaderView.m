@interface ModernTitleHeaderView
- (NSArray)accessibilityHeaderButtons;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC23ShelfKitCollectionViews21ModernTitleHeaderView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21ModernTitleHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation ModernTitleHeaderView

- (_TtC23ShelfKitCollectionViews21ModernTitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews21ModernTitleHeaderView *)_s23ShelfKitCollectionViews21ModernTitleHeaderViewC5frameACSo6CGRectV_tcfc_0();
}

- (_TtC23ShelfKitCollectionViews21ModernTitleHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_238648();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(ModernTitleHeaderView *)&v7 traitCollectionDidChange:v4];
  id v6 = [v5 traitCollection];
  sub_232B9C(v6);

  [v5 setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(ModernTitleHeaderView *)&v4 updateConstraints];
  id v3 = [v2 traitCollection];
  sub_2334D4((uint64_t)v3);
}

- (void)layoutSubviews
{
  id v2 = self;
  ModernTitleHeaderView.layoutSubviews()();
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_titleLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_subtitleLabel);
}

- (NSArray)accessibilityHeaderButtons
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_buttons))
  {
    type metadata accessor for DynamicTypeButton();
    swift_bridgeObjectRetain();
    v2.super.isa = sub_3845E0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  sub_235BC4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_style, type metadata accessor for ModernTitleHeaderView.Style);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView____lazy_storage___topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_horizontalParentStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_horizontalSubStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_horizontalButtonStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_verticalSubStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_titleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_subtitleLabel));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView____lazy_storage___bottomConstraint);
}

@end