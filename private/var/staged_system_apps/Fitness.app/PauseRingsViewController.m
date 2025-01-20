@interface PauseRingsViewController
- (_TtC10FitnessApp24PauseRingsViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp24PauseRingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PauseRingsViewController

- (_TtC10FitnessApp24PauseRingsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController_hostingController) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((void *)v4 + 6) = 0;
  id v5 = a3;

  result = (_TtC10FitnessApp24PauseRingsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10042DE4C();
}

- (_TtC10FitnessApp24PauseRingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp24PauseRingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController_pauseRingsCoordinator));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView);
  uint64_t v4 = *(void *)&self->hostingController[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView];
  uint64_t v5 = *(void *)&self->pauseRingsCoordinator[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView];
  uint64_t v6 = *(void *)&self->shouldShowEditFlow[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView];
  v7 = *(void **)&self->$__lazy_storage_$_pauseRingsView[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView
                                                       + 5];

  sub_10042E378(v3, v4, v5, v6, v7);
}

@end