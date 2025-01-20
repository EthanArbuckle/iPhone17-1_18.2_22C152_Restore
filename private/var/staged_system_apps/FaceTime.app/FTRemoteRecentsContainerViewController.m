@interface FTRemoteRecentsContainerViewController
- (FTRemoteRecentsContainerViewController)initWithCoder:(id)a3;
- (FTRemoteRecentsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation FTRemoteRecentsContainerViewController

- (void)viewDidLoad
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for RemoteRecentsContainerViewController();
  [(FTRemoteRecentsContainerViewController *)&v4 viewDidLoad];
  sub_100010A38();
  swift_release();

  swift_release();
}

- (FTRemoteRecentsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v7 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RemoteRecentsContainerViewController();
  v9 = [(FTRecentsContainerViewController *)&v11 initWithNibName:a3 bundle:a4];
  swift_release();

  return v9;
}

- (FTRemoteRecentsContainerViewController)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RemoteRecentsContainerViewController();
  v5 = [(FTRecentsContainerViewController *)&v7 initWithCoder:a3];
  swift_release();
  return v5;
}

@end