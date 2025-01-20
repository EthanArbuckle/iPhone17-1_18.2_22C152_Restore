@interface TTRIAboutYourDevicesViewController
- (_TtC9Reminders34TTRIAboutYourDevicesViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC9Reminders34TTRIAboutYourDevicesViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (uint64_t)didTapDevicesLearnMore:(void *)a1;
- (void)didTapLaterButton:(id)a3;
- (void)didTapSharedListsParticipant:(id)a3;
- (void)didTapUpgradeButton:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)viewDidLoad;
@end

@implementation TTRIAboutYourDevicesViewController

- (void)didTapUpgradeButton:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t v5 = *(void *)&v4->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_presenter];
  if (swift_unknownObjectWeakLoadStrong())
  {
    long long v6 = *(_OWORD *)(v5 + 64);
    v8[0] = *(_OWORD *)(v5 + 48);
    v8[1] = v6;
    v8[2] = *(_OWORD *)(v5 + 80);
    uint64_t v9 = *(void *)(v5 + 96);
    sub_100269D9C((void **)v8);
    sub_100432D28((uint64_t)v8);
    swift_unknownObjectRelease();
    sub_100269DD4((void **)v8);
  }

  sub_100038CD8((uint64_t)&v7);
}

- (void)didTapLaterButton:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    sub_100269C80(Strong);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_100038CD8((uint64_t)&v6);
}

- (uint64_t)didTapDevicesLearnMore:(void *)a1
{
  swift_unknownObjectRetain();
  id v2 = a1;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10026664C();

  return sub_100038CD8((uint64_t)&v4);
}

- (void)didTapSharedListsParticipant:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100266930((uint64_t)v5);

  sub_100038CD8((uint64_t)v5);
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_100266CB4();
}

- (_TtC9Reminders34TTRIAboutYourDevicesViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC9Reminders34TTRIAboutYourDevicesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders34TTRIAboutYourDevicesViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC9Reminders34TTRIAboutYourDevicesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000D89E0(*(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_viewModel]);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
}

@end