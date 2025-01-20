@interface IntroWelcomeController
- (_TtC9SiriSetup22IntroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC9SiriSetup22IntroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueTapped;
- (void)skipTapped;
@end

@implementation IntroWelcomeController

- (void)continueTapped
{
  v2 = self;
  sub_235A4A048();
}

- (void)skipTapped
{
  v2 = self;
  sub_235A4A17C();
}

- (_TtC9SiriSetup22IntroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC9SiriSetup22IntroWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup22IntroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC9SiriSetup22IntroWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_orbView));
  v3 = (char *)self + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end