@interface UpdateEventMonitorController
- (_TtC8VideosUI28UpdateEventMonitorController)init;
- (void)appDocumentDidReceiveEvent:(id)a3;
- (void)appDocumentHasBecomeActive;
@end

@implementation UpdateEventMonitorController

- (void)appDocumentDidReceiveEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E328A2CC();
}

- (void)appDocumentHasBecomeActive
{
  v2 = self;
  sub_1E328ACE4();
}

- (_TtC8VideosUI28UpdateEventMonitorController)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI28UpdateEventMonitorController_updateEventStore));
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI28UpdateEventMonitorController_eventEligibleViewModels));
  swift_bridgeObjectRelease();
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI28UpdateEventMonitorController_documentEventIterable, &qword_1EBF8AB20);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8VideosUI28UpdateEventMonitorController_registrationHandler);
  sub_1E2C5FB90(v3);
}

@end