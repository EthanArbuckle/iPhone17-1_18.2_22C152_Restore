@interface NotificationsOnboardingViewController
- (_TtC7Journal37NotificationsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC7Journal37NotificationsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapContinue:(id)a3;
- (void)didTapNotNow:(id)a3;
@end

@implementation NotificationsOnboardingViewController

- (void)didTapContinue:(id)a3
{
  uint64_t v4 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v4 - 8);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_unknownObjectRetain();
  v7 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v10 = static MainActor.shared.getter();
  v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = v9;
  swift_release();
  sub_1005D74B4((uint64_t)v6, (uint64_t)&unk_10080F6B0, (uint64_t)v11);

  swift_release();
  _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v12);
}

- (void)didTapNotNow:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  id v5 = [self standardUserDefaults];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 setBool:1 forKey:v6];

  sub_1004D7FAC();
  _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)&v7);
}

- (_TtC7Journal37NotificationsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC7Journal37NotificationsOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7Journal37NotificationsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC7Journal37NotificationsOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC7Journal37NotificationsOnboardingViewController_descriptionLabel];
}

@end