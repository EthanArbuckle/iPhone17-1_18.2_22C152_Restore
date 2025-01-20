@interface NavigationWaypointController
- (GEOComposedWaypoint)originWaypoint;
- (NSArray)displayedWaypoints;
- (_TtC4Maps28NavigationWaypointController)init;
- (_TtC4Maps28NavigationWaypointController)initWithService:(id)a3;
- (unint64_t)targetLegIndex;
- (void)insertWaypoint:(id)a3;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4;
- (void)navigationServiceWillReroute:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeWaypointAt:(int64_t)a3;
- (void)replaceWaypoint:(id)a3 with:(id)a4;
- (void)setDisplayedWaypoints:(id)a3;
- (void)setOriginWaypoint:(id)a3;
- (void)setTargetLegIndex:(unint64_t)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation NavigationWaypointController

- (NSArray)displayedWaypoints
{
  swift_beginAccess();
  sub_100100830(0, (unint64_t *)&qword_1015D1C60);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setDisplayedWaypoints:(id)a3
{
  sub_100100830(0, (unint64_t *)&qword_1015D1C60);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps28NavigationWaypointController_displayedWaypoints);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (unint64_t)targetLegIndex
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC4Maps28NavigationWaypointController_targetLegIndex);
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28NavigationWaypointController_targetLegIndex) = (Class)a3;
}

- (GEOComposedWaypoint)originWaypoint
{
  return (GEOComposedWaypoint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC4Maps28NavigationWaypointController_originWaypoint));
}

- (void)setOriginWaypoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28NavigationWaypointController_originWaypoint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28NavigationWaypointController_originWaypoint) = (Class)a3;
  id v3 = a3;
}

- (_TtC4Maps28NavigationWaypointController)initWithService:(id)a3
{
  return (_TtC4Maps28NavigationWaypointController *)sub_1001B722C(a3);
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)insertWaypoint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001B73F0(v4);
}

- (void)replaceWaypoint:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001B76C0(v6, v7);
}

- (void)removeWaypointAt:(int64_t)a3
{
  id v4 = self;
  sub_1001B7A9C(a3);
}

- (_TtC4Maps28NavigationWaypointController)init
{
  result = (_TtC4Maps28NavigationWaypointController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28NavigationWaypointController_originWaypoint);
}

- (void)navigationServiceWillReroute:(id)a3
{
  uint64_t v4 = qword_1015CBBA8;
  id v10 = a3;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000F2248(v6, (uint64_t)qword_1015D3520);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "navigationServiceWillReroute", v9, 2u);
    swift_slowDealloc();
  }
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_1001B9A40(a3, v8);
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_1001B8E98(a3, a4, a5);
}

- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1001B9224(a3);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  sub_1001B93D8(a3);
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  sub_1001B9DA0(a3, a4, a5);
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_1001B961C(a3, a4, a5);
}

@end