@interface UpdateTabItemsEventMonitorController
- (_TtC8VideosUIP33_A69B2854CB390679C506AD8487E2C37E36UpdateTabItemsEventMonitorController)init;
- (void)appDocumentDidReceiveEvent:(id)a3;
- (void)appDocumentHasBecomeActive;
@end

@implementation UpdateTabItemsEventMonitorController

- (void)appDocumentDidReceiveEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E2F77B4C(v4);
}

- (void)appDocumentHasBecomeActive
{
  v2 = self;
  sub_1E2F77EA4();
}

- (_TtC8VideosUIP33_A69B2854CB390679C506AD8487E2C37E36UpdateTabItemsEventMonitorController)init
{
}

- (void).cxx_destruct
{
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8VideosUIP33_A69B2854CB390679C506AD8487E2C37E36UpdateTabItemsEventMonitorController_registrationHandler));
  swift_bridgeObjectRelease();
  sub_1E2BEA314((uint64_t)self+ OBJC_IVAR____TtC8VideosUIP33_A69B2854CB390679C506AD8487E2C37E36UpdateTabItemsEventMonitorController_lastRefreshOrRegistrationTime, (uint64_t *)&unk_1EBF83FD0);
}

@end