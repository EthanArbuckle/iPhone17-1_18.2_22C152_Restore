@interface TTRIWhatsNewViewController
- (_TtC9Reminders26TTRIWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC9Reminders26TTRIWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapContinueButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTRIWhatsNewViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100433700();
}

- (void)didTapContinueButton:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v5 = self;
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    sub_1004341FC(Strong);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_10003D3BC((uint64_t)v7);
}

- (_TtC9Reminders26TTRIWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC9Reminders26TTRIWhatsNewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders26TTRIWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC9Reminders26TTRIWhatsNewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders26TTRIWhatsNewViewController____lazy_storage___continueButton];
}

@end