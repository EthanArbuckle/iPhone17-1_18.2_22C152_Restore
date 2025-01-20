@interface PillToPlatterTransitionView
- (_TtC7Measure27PillToPlatterTransitionView)init;
- (_TtC7Measure27PillToPlatterTransitionView)initWithCoder:(id)a3;
- (_TtC7Measure27PillToPlatterTransitionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PillToPlatterTransitionView

- (_TtC7Measure27PillToPlatterTransitionView)init
{
  return (_TtC7Measure27PillToPlatterTransitionView *)sub_100044470();
}

- (_TtC7Measure27PillToPlatterTransitionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000450BC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100044B78();
}

- (_TtC7Measure27PillToPlatterTransitionView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure27PillToPlatterTransitionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure27PillToPlatterTransitionView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure27PillToPlatterTransitionView_backgroundColorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure27PillToPlatterTransitionView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure27PillToPlatterTransitionView_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure27PillToPlatterTransitionView_backgroundBlur));

  swift_bridgeObjectRelease();
}

@end