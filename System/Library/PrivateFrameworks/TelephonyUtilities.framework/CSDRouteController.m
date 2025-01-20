@interface CSDRouteController
+ (id)makeLocalRouteController;
+ (id)makePairedHostDeviceRouteController;
- (CSDRouteController)init;
- (NSArray)topOfListRoutesUniqueIdentifiers;
- (NSDictionary)routesByUniqueIdentifier;
- (id)pickedRouteDidChangeHandler;
- (id)routeWasPickedHandler;
- (id)routesDidChangeHandler;
- (id)timedOutPickingRouteHandler;
- (void)clearState;
- (void)didUpdateRouteRecommendations;
- (void)handleCallStatusChanged;
- (void)handleUpdatedPairedHostDeviceRoutes:(id)a3;
- (void)pickRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4;
- (void)setPickedRouteDidChangeHandler:(id)a3;
- (void)setRouteWasPickedHandler:(id)a3;
- (void)setRoutesDidChangeHandler:(id)a3;
- (void)setTimedOutPickingRouteHandler:(id)a3;
- (void)updateStateWithCalls:(id)a3;
@end

@implementation CSDRouteController

- (NSDictionary)routesByUniqueIdentifier
{
  v2 = self;
  sub_1002F9D14();

  sub_1001F6204(0, (unint64_t *)&qword_10058BE00);
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3.super.isa;
}

- (NSArray)topOfListRoutesUniqueIdentifiers
{
  v2 = self;
  sub_1002F9E50();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (id)routesDidChangeHandler
{
  uint64_t v2 = sub_1002FA0E0();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_1002C2C88;
    v6[3] = &unk_100513C48;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRoutesDidChangeHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1002084D0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1002FA59C((uint64_t)v4, v5, &OBJC_IVAR___CSDRouteController_routesDidChangeHandler, (uint64_t (*)(uint64_t, uint64_t))sub_100208490);
}

- (id)pickedRouteDidChangeHandler
{
  return sub_1002FA408((uint64_t)self, (uint64_t)a2, sub_1002FA1EC, (uint64_t)&unk_100513BF8);
}

- (void)setPickedRouteDidChangeHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100301864;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1002FA59C((uint64_t)v4, v5, &OBJC_IVAR___CSDRouteController_pickedRouteDidChangeHandler, (uint64_t (*)(uint64_t, uint64_t))sub_100235A1C);
}

- (id)routeWasPickedHandler
{
  return sub_1002FA408((uint64_t)self, (uint64_t)a2, sub_1002FA2FC, (uint64_t)&unk_100513BA8);
}

- (void)setRouteWasPickedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100301864;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1002FA59C((uint64_t)v4, v5, &OBJC_IVAR___CSDRouteController_routeWasPickedHandler, (uint64_t (*)(uint64_t, uint64_t))sub_100235A1C);
}

- (id)timedOutPickingRouteHandler
{
  return sub_1002FA408((uint64_t)self, (uint64_t)a2, sub_1002FA4B0, (uint64_t)&unk_100513B58);
}

- (void)setTimedOutPickingRouteHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10027E488;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1002FA59C((uint64_t)v4, v5, &OBJC_IVAR___CSDRouteController_timedOutPickingRouteHandler, (uint64_t (*)(uint64_t, uint64_t))sub_100235A1C);
}

+ (id)makeLocalRouteController
{
  swift_getObjCClassMetadata();
  sub_1002FB684();

  return v2;
}

+ (id)makePairedHostDeviceRouteController
{
  swift_getObjCClassMetadata();
  sub_1002FB910();

  return v2;
}

- (void)pickRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_1002FBB54();

  swift_bridgeObjectRelease();
}

- (void)clearState
{
  uint64_t v2 = self;
  sub_1002FE0EC();
}

- (void)updateStateWithCalls:(id)a3
{
  sub_1001F6204(0, (unint64_t *)&qword_1005855B0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_1002FD308();

  swift_bridgeObjectRelease();
}

- (void)handleUpdatedPairedHostDeviceRoutes:(id)a3
{
  sub_1001F6204(0, (unint64_t *)&qword_10058BE00);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_1002FD308();

  swift_bridgeObjectRelease();
}

- (void)handleCallStatusChanged
{
  uint64_t v2 = self;
  sub_1002FDE5C();
}

- (void)didUpdateRouteRecommendations
{
  uint64_t v2 = self;
  sub_1002FE0EC();
}

- (CSDRouteController)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100235C28(OBJC_IVAR___CSDRouteController_routesDidChangeHandler);
  sub_100235C28(OBJC_IVAR___CSDRouteController_pickedRouteDidChangeHandler);
  sub_100235C28(OBJC_IVAR___CSDRouteController_routeWasPickedHandler);
  sub_100235C28(OBJC_IVAR___CSDRouteController_timedOutPickingRouteHandler);

  swift_bridgeObjectRelease();
  sub_1003002B0(*(void **)((char *)&self->super.isa + OBJC_IVAR___CSDRouteController_pendingRouteContext));
  swift_bridgeObjectRelease();

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDRouteController_currentPickedRoute);
}

@end