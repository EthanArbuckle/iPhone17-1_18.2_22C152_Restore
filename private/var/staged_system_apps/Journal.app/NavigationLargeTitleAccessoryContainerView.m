@interface NavigationLargeTitleAccessoryContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7Journal42NavigationLargeTitleAccessoryContainerView)initWithCoder:(id)a3;
- (_TtC7Journal42NavigationLargeTitleAccessoryContainerView)initWithFrame:(CGRect)a3;
@end

@implementation NavigationLargeTitleAccessoryContainerView

- (_TtC7Journal42NavigationLargeTitleAccessoryContainerView)initWithCoder:(id)a3
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7Journal42NavigationLargeTitleAccessoryContainerView_contentView) systemLayoutSizeFittingSize:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC7Journal42NavigationLargeTitleAccessoryContainerView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC7Journal42NavigationLargeTitleAccessoryContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal42NavigationLargeTitleAccessoryContainerView_contentView));
}

@end