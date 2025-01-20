@interface BrandBar
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12NewsArticles8BrandBar)initWithCoder:(id)a3;
- (_TtC12NewsArticles8BrandBar)initWithFrame:(CGRect)a3;
- (void)contentSizeCategoryDidChange;
- (void)layoutSubviews;
@end

@implementation BrandBar

- (void)contentSizeCategoryDidChange
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles8BrandBar_renderer), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12NewsArticles8BrandBar_renderer));
  v3 = self;
  sub_1BF70F8F8((uint64_t)v3);
  [(BrandBar *)v3 setNeedsLayout];
}

- (_TtC12NewsArticles8BrandBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF763624();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1BF70FF24((uint64_t)v5, width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(BrandBar *)&v3 layoutSubviews];
  sub_1BF70FA84(v2);
}

- (_TtC12NewsArticles8BrandBar)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC12NewsArticles8BrandBar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles8BrandBar_renderer;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end