@interface NavigationProgressCapturingTask
+ (int64_t)creationPreference;
- (_TtC4Maps31NavigationProgressCapturingTask)init;
- (_TtC4Maps31NavigationProgressCapturingTask)initWithPlatformController:(id)a3 session:(id)a4 navigationService:(id)a5;
- (void)navigationRouteInterrupter:(id)a3 finishedInteruptingEntryWithIdentifier:(id)a4;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 willEndWithReason:(unint64_t)a4;
@end

@implementation NavigationProgressCapturingTask

- (_TtC4Maps31NavigationProgressCapturingTask)initWithPlatformController:(id)a3 session:(id)a4 navigationService:(id)a5
{
  return (_TtC4Maps31NavigationProgressCapturingTask *)sub_1000424C0(a3, a4, a5);
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)navigationRouteInterrupter:(id)a3 finishedInteruptingEntryWithIdentifier:(id)a4
{
  uint64_t v6 = sub_1000FF33C((uint64_t *)&unk_1015D5DE0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  swift_unknownObjectRetain();
  v11 = self;
  sub_10032A820((uint64_t)v8);
  swift_unknownObjectRelease();

  sub_1001CD2E0((uint64_t)v8);
}

- (_TtC4Maps31NavigationProgressCapturingTask)init
{
  result = (_TtC4Maps31NavigationProgressCapturingTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31NavigationProgressCapturingTask_routeInfoProvider));

  v3 = (char *)self + OBJC_IVAR____TtC4Maps31NavigationProgressCapturingTask_activeRouteIdentifier;

  sub_1001CD2E0((uint64_t)v3);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7 = a3;
  v8 = self;
  sub_100329574(a3);
}

- (void)navigationService:(id)a3 willEndWithReason:(unint64_t)a4
{
  id v7 = a3;
  v8 = self;
  sub_10032A040(a3, a4);
}

@end