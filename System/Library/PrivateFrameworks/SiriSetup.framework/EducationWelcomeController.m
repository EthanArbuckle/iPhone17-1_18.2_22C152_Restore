@interface EducationWelcomeController
- (_TtC9SiriSetup26EducationWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC9SiriSetup26EducationWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueTapped;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation EducationWelcomeController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_235A487A8(a3);
}

- (void)continueTapped
{
  v2 = self;
  sub_235A48A68();
}

- (_TtC9SiriSetup26EducationWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC9SiriSetup26EducationWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup26EducationWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC9SiriSetup26EducationWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_orbView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerLooper));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController);
}

@end