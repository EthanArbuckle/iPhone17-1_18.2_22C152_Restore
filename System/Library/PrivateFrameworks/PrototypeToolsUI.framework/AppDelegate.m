@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC10prototyped11AppDelegate)init;
- (void)killSpringBoard;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10000EFA0(&qword_100020558, type metadata accessor for LaunchOptionsKey);
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  v8 = self;
  char v9 = sub_10000DE18((uint64_t)a4);
  swift_release();

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (_TtC10prototyped11AppDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = OBJC_IVAR____TtC10prototyped11AppDelegate_listener;
  id v5 = objc_allocWithZone((Class)type metadata accessor for Listener());
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)[v5 init];

  v9.receiver = v6;
  v9.super_class = ObjectType;
  id v7 = [(AppDelegate *)&v9 init];
  swift_release();
  return v7;
}

- (void).cxx_destruct
{
}

- (void)killSpringBoard
{
  sub_10000E288(&qword_1000202F8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  type metadata accessor for MainActor();
  v6 = self;
  uint64_t v7 = static MainActor.shared.getter();
  v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v6;
  sub_10000BDB0((uint64_t)v4, (uint64_t)&unk_100020550, (uint64_t)v8);

  swift_release();
}

@end