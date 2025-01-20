@interface FMTabBar
- (UITraitCollection)traitCollection;
- (_TtC6FindMy8FMTabBar)initWithCoder:(id)a3;
- (_TtC6FindMy8FMTabBar)initWithFrame:(CGRect)a3;
- (id)largeContentViewerInteraction:(id)a3 itemAtPoint:(CGPoint)a4;
- (void)largeContentViewerInteraction:(id)a3 didEndOnItem:(id)a4 atPoint:(CGPoint)a5;
- (void)layoutSubviews;
- (void)tabBar:(id)a3 didSelectItem:(id)a4;
@end

@implementation FMTabBar

- (void)layoutSubviews
{
  v2 = self;
  sub_10001EBC8();
}

- (UITraitCollection)traitCollection
{
  v2 = self;
  id v3 = sub_100065200();

  return (UITraitCollection *)v3;
}

- (_TtC6FindMy8FMTabBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100228704();
}

- (void)tabBar:(id)a3 didSelectItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100228C7C();
}

- (id)largeContentViewerInteraction:(id)a3 itemAtPoint:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  id v7 = sub_100228EB8();

  return v7;
}

- (void)largeContentViewerInteraction:(id)a3 didEndOnItem:(id)a4 atPoint:(CGPoint)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_1002290BC();

  swift_unknownObjectRelease();
}

- (_TtC6FindMy8FMTabBar)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy8FMTabBar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy8FMTabBar_contentDelegate);
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy8FMTabBar____lazy_storage___largeContentInteraction);
}

@end