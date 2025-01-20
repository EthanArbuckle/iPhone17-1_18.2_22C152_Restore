@interface GlyphButton
- (BOOL)isHighlighted;
- (UIImageView)accessibilityGlyphView;
- (_TtC23ShelfKitCollectionViews11GlyphButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews11GlyphButton)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation GlyphButton

- (_TtC23ShelfKitCollectionViews11GlyphButton)initWithCoder:(id)a3
{
  id v3 = a3;
  _s23ShelfKitCollectionViews11GlyphButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_2535C0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2536DC();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GlyphButton();
  return [(GlyphButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for GlyphButton();
  v11.receiver = self;
  v11.super_class = v5;
  v6 = self;
  unsigned int v7 = [(GlyphButton *)&v11 isHighlighted];
  v10.receiver = v6;
  v10.super_class = v5;
  [(GlyphButton *)&v10 setHighlighted:v3];
  if (v7 != [(GlyphButton *)v6 isHighlighted])
  {
    unsigned int v8 = [(GlyphButton *)v6 isHighlighted];
    double v9 = 1.0;
    if (v8) {
      double v9 = 0.5;
    }
    [(GlyphButton *)v6 setAlpha:v9];
  }
}

- (_TtC23ShelfKitCollectionViews11GlyphButton)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews11GlyphButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_fillMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_platterFillColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_glyphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_fillView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_badgeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_previousPlatterFillColor));
  sub_256AA8(*(void **)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_layout), *(void **)&self->super.super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_layout], *(void **)&self->super.super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_layout + 8], self->super.super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_layout + 16]);
  BOOL v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_glyph;
  uint64_t v4 = sub_37BDE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_customOverlay));
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_fadeUpdateBlock));
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_color, (uint64_t *)&unk_475960);
}

- (UIImageView)accessibilityGlyphView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_glyphView));
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = self;
  double v9 = (void *)_s23ShelfKitCollectionViews11GlyphButtonC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0kH0C_So0K6RegionCtF_0(v6);

  return v9;
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

@end