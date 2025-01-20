@interface ScrollableStackViewContainer
- (_TtC9SeymourUI28ScrollableStackViewContainer)initWithCoder:(id)a3;
- (_TtC9SeymourUI28ScrollableStackViewContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ScrollableStackViewContainer

- (_TtC9SeymourUI28ScrollableStackViewContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A315F6C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A31576C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A3158C8(a3);
}

- (_TtC9SeymourUI28ScrollableStackViewContainer)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI28ScrollableStackViewContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_stackViewCenterYConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI28ScrollableStackViewContainer_visualEffectView);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23A315C80(v4);
}

@end