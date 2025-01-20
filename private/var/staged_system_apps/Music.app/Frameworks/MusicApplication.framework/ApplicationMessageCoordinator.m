@interface ApplicationMessageCoordinator
- (_TtC16MusicApplication29ApplicationMessageCoordinator)init;
- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4;
@end

@implementation ApplicationMessageCoordinator

- (_TtC16MusicApplication29ApplicationMessageCoordinator)init
{
  return (_TtC16MusicApplication29ApplicationMessageCoordinator *)sub_1A3624();
}

- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4
{
  uint64_t v7 = sub_AB6250();
  sub_173E4(0, (unint64_t *)&qword_DC0F50);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  swift_bridgeObjectRetain();
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_1A5734, v8);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_messageCoordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_scriptingApplicationMessageGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_applicationContextProvider));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end