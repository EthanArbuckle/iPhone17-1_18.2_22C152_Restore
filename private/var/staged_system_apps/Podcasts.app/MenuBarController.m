@interface MenuBarController
- (UIResponder)nextResponder;
- (_TtC8Podcasts17MenuBarController)init;
- (void)buildMenuWithBuilder:(id)a3;
@end

@implementation MenuBarController

- (UIResponder)nextResponder
{
  return (UIResponder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Podcasts17MenuBarController_globalActionController));
}

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100284998(a3);
  swift_unknownObjectRelease();
}

- (_TtC8Podcasts17MenuBarController)init
{
  result = (_TtC8Podcasts17MenuBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Podcasts17MenuBarController_globalActionController));

  swift_unknownObjectRelease();
}

@end