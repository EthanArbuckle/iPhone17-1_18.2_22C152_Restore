@interface TVDisplayPreferencesViewController
- (_TtC9SeymourUI34TVDisplayPreferencesViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI34TVDisplayPreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVDisplayPreferencesViewController

- (_TtC9SeymourUI34TVDisplayPreferencesViewController)initWithCoder:(id)a3
{
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI34TVDisplayPreferencesViewController_currentSections) = (Class)MEMORY[0x263F8EE78];
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI34TVDisplayPreferencesViewController_currentActions;
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_23A76E2E0(v4);
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI34TVDisplayPreferencesViewController_onSettingsDismissed);
  void *v7 = 0;
  v7[1] = 0;

  result = (_TtC9SeymourUI34TVDisplayPreferencesViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for TVDisplayPreferencesViewController();
  [(TVDisplayPreferencesViewController *)&v2 viewDidLoad];
}

- (_TtC9SeymourUI34TVDisplayPreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI34TVDisplayPreferencesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI34TVDisplayPreferencesViewController_onSettingsDismissed);

  sub_239C25118(v3);
}

@end