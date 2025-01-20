@interface NavigationInterceptionWindow
- (_TtC9SeymourUI28NavigationInterceptionWindow)initWithCoder:(id)a3;
- (_TtC9SeymourUI28NavigationInterceptionWindow)initWithFrame:(CGRect)a3;
- (_TtC9SeymourUI28NavigationInterceptionWindow)initWithWindowScene:(id)a3;
@end

@implementation NavigationInterceptionWindow

- (_TtC9SeymourUI28NavigationInterceptionWindow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239DF6BF0();
}

- (_TtC9SeymourUI28NavigationInterceptionWindow)initWithWindowScene:(id)a3
{
  id v3 = a3;
  result = (_TtC9SeymourUI28NavigationInterceptionWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI28NavigationInterceptionWindow)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI28NavigationInterceptionWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_blurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_placeholderViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_navigationController));
  swift_release();
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_onRequestApplicationDeactivation));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_onRequestApplicationTermination);

  sub_239C25118(v3);
}

@end