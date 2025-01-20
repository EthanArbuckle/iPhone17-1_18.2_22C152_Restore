@interface RAPNotificationDetailsCoordinator
- (ActionCoordination)coordinator;
- (RAPSubmissionStatusDownloader)rapStatusDownloader;
- (UIViewController)parentViewController;
- (_TtC4Maps33RAPNotificationDetailsCoordinator)init;
- (_TtC4Maps33RAPNotificationDetailsCoordinator)initWithParentViewController:(id)a3;
- (void)openURLWithDetailsViewController:(id)a3 URL:(id)a4;
- (void)presentRAPNotificationDetailsViewControllerWithRapRecord:(id)a3 entryPoint:(int)a4;
- (void)setCoordinator:(id)a3;
- (void)setParentViewController:(id)a3;
@end

@implementation RAPNotificationDetailsCoordinator

- (UIViewController)parentViewController
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIViewController *)Strong;
}

- (void)setParentViewController:(id)a3
{
}

- (ActionCoordination)coordinator
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ActionCoordination *)Strong;
}

- (void)setCoordinator:(id)a3
{
}

- (RAPSubmissionStatusDownloader)rapStatusDownloader
{
  return (RAPSubmissionStatusDownloader *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_rapStatusDownloader));
}

- (_TtC4Maps33RAPNotificationDetailsCoordinator)initWithParentViewController:(id)a3
{
  id v3 = a3;
  v4 = (_TtC4Maps33RAPNotificationDetailsCoordinator *)sub_100277838();

  return v4;
}

- (_TtC4Maps33RAPNotificationDetailsCoordinator)init
{
  result = (_TtC4Maps33RAPNotificationDetailsCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_coordinator);
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps33RAPNotificationDetailsCoordinator_rapStatusDownloader);
}

- (void)presentRAPNotificationDetailsViewControllerWithRapRecord:(id)a3 entryPoint:(int)a4
{
  id v6 = a3;
  v7 = self;
  sub_10027651C(v6, a4);
}

- (void)openURLWithDetailsViewController:(id)a3 URL:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v11 = (void *)Strong;
    id v12 = a3;
    v13 = self;
    URL._bridgeToObjectiveC()(v14);
    v16 = v15;
    [v11 viewController:v12 openURL:v15];

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end