@interface CombinedToolbarFeatureView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12NewsArticles26CombinedToolbarFeatureView)initWithCoder:(id)a3;
- (_TtC12NewsArticles26CombinedToolbarFeatureView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CombinedToolbarFeatureView

- (_TtC12NewsArticles26CombinedToolbarFeatureView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF658A94();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BF658324();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_coverModel)
    && (id v3 = *(Class *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_issueCoverButton)) != 0)
  {
    v4 = self;
    id v5 = v3;
    objc_msgSend(v5, sel_frame);
    double Height = CGRectGetHeight(v10);

    double v7 = Height + 38.0;
  }
  else
  {
    double v7 = 38.0;
  }
  double v8 = 72.0;
  result.height = v7;
  result.width = v8;
  return result;
}

- (_TtC12NewsArticles26CombinedToolbarFeatureView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC12NewsArticles26CombinedToolbarFeatureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BF658950(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_coverModel));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_issueCoverViewButtonFactory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_issueCoverButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_newsPlusLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView____lazy_storage___animator);
}

@end