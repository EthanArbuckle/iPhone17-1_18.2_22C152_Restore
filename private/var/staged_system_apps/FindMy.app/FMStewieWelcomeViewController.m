@interface FMStewieWelcomeViewController
- (_TtC6FindMy29FMStewieWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy29FMStewieWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancelActionWithSender:(id)a3;
- (void)performAction;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMStewieWelcomeViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMStewieWelcomeViewController();
  v2 = (char *)v3.receiver;
  [(FMStewieWelcomeViewController *)&v3 viewDidLoad];
  sub_100429E58();
  sub_10042A36C();
  [*(id *)&v2[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_performButton] addTarget:v2 action:@"performAction" forControlEvents:64];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10042AA54(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_10042AECC(a3);
}

- (void)performAction
{
  v2 = self;
  sub_10042D72C();
}

- (void)cancelActionWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_100429DFC();
  uint64_t v8 = v7;
  uint64_t updated = type metadata accessor for FMFSatelliteLocationUpdateEvent();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 48))(v8, 1, updated)) {
    FMFSatelliteLocationUpdateEvent.updateFlowCanceled.setter();
  }
  ((void (*)(uint64_t *, void))v6)(&v10, 0);
  [(FMStewieWelcomeViewController *)v5 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC6FindMy29FMStewieWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC6FindMy29FMStewieWelcomeViewController *)sub_10042E3A8(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC6FindMy29FMStewieWelcomeViewController *)sub_10042E3A8(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy29FMStewieWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a5;
  return (_TtC6FindMy29FMStewieWelcomeViewController *)sub_10042E74C(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  swift_release();
  sub_100068760((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_delegate]);
  swift_release();
  objc_super v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_style];

  sub_10042F46C(*(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState], *(void *)&self->mediator[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState], *(void *)&self->delegate[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState], *(void *)&self->delegate[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState + 8], *(void *)&self->viewModel[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState], self->style[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState]);
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_stewieAnalyticsEvent], &qword_1006BE438);
}

@end