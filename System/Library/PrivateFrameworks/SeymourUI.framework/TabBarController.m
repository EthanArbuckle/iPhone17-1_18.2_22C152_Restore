@interface TabBarController
- (BOOL)shouldAutorotate;
- (_TtC9SeymourUI16TabBarController)initWithCoder:(id)a3;
- (_TtC9SeymourUI16TabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI16TabBarController)initWithTabs:(id)a3;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TabBarController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (_TtC9SeymourUI16TabBarController)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC9SeymourUI16TabBarController_paletteView;
  uint64_t v5 = qword_268A0CE28;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (void *)qword_268A1BAC0;
  id v8 = objc_allocWithZone((Class)type metadata accessor for PaletteContainerView());
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_23A4EE4B8(v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI16TabBarController_miniPlayerViewController) = 0;

  result = (_TtC9SeymourUI16TabBarController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A1B7BE0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_23A1B7DE4();
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  uint64_t v5 = a3;
  if (a3)
  {
    sub_239C24FF0(0, (unint64_t *)&qword_268A0F410);
    uint64_t v5 = (void *)sub_23A7FFC78();
  }
  v7 = self;
  sub_23A1B81B8(v5, a4);

  swift_bridgeObjectRelease();
}

- (_TtC9SeymourUI16TabBarController)initWithTabs:(id)a3
{
  result = (_TtC9SeymourUI16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI16TabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TabBarController_paletteView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TabBarController_miniPlayerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TabBarController_miniPlayerHostPresenter));
  swift_unknownObjectRelease();

  swift_release();
}

@end