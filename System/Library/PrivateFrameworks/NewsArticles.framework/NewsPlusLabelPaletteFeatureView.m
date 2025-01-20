@interface NewsPlusLabelPaletteFeatureView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView)initWithCoder:(id)a3;
- (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)style;
@end

@implementation NewsPlusLabelPaletteFeatureView

- (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_isTransitioning) = 0;
  uint64_t v5 = OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_label;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(NewsPlusLabelPaletteFeatureView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_label];
  objc_msgSend(v3, sel_sizeToFit, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  sub_1BF7E43F8();
  objc_msgSend(v3, sel_setCenter_);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_label), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(NewsPlusLabelPaletteFeatureView *)&v3 didMoveToWindow];
  __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler], *(void *)&v2[OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler + 24]);
  sub_1BF521A84(v2);
}

- (void)style
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler));
  objc_super v3 = self;
  sub_1BF521A84((char *)v3);
}

- (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler);
  sub_1BF4F1CFC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_page);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_label);
}

@end