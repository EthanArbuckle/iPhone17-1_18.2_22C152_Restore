@interface CardContainerView
- (_TtC7Measure17CardContainerView)initWithCoder:(id)a3;
- (_TtC7Measure17CardContainerView)initWithFrame:(CGRect)a3;
@end

@implementation CardContainerView

- (_TtC7Measure17CardContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10019B914();
}

- (_TtC7Measure17CardContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure17CardContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_copyCustomButton));
  swift_release();
  swift_unknownObjectUnownedDestroy();
  sub_10001FE1C((uint64_t)self + OBJC_IVAR____TtC7Measure17CardContainerView_internalSpatialPlatter);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_magicPocketTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_bottomStackTopSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_scrollViewFooterView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_contentScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_actualContentView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_internalDraggableView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_scrollViewFooterViewHeightConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure17CardContainerView_workQ);
}

@end