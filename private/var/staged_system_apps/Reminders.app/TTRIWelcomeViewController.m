@interface TTRIWelcomeViewController
- (_TtC9Reminders25TTRIWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC9Reminders25TTRIWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (uint64_t)didTapDismissButton:(void *)a1;
- (void)dealloc;
- (void)didTapContinueButton:(id)a3;
- (void)didTapContinueToUpgradeAutomaticallyButton:(id)a3;
- (void)didTapUpgradeButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTRIWelcomeViewController

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_100785588;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100018BF8(v6, (uint64_t)qword_10079E9F0);
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "TTRIWelcomeViewController dealloc", v9, 2u);
    swift_slowDealloc();
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(TTRIWelcomeViewController *)&v10 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000D8A5C(*(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders25TTRIWelcomeViewController_viewModel], *(void *)&self->upgradeHelpURLString[OBJC_IVAR____TtC9Reminders25TTRIWelcomeViewController_viewModel]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)didTapContinueButton:(id)a3
{
}

- (void)didTapContinueToUpgradeAutomaticallyButton:(id)a3
{
}

- (void)didTapUpgradeButton:(id)a3
{
}

- (uint64_t)didTapDismissButton:(void *)a1
{
  swift_unknownObjectRetain();
  id v2 = a1;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    sub_1004298D0(Strong);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  return sub_100038CD8((uint64_t)&v5);
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_100427D50();
}

- (_TtC9Reminders25TTRIWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC9Reminders25TTRIWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders25TTRIWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC9Reminders25TTRIWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end