@interface WODataLinkMonitor
+ (WODataLinkMonitor)shared;
- (WODataLinkMonitor)init;
- (WODataLinkMonitorDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation WODataLinkMonitor

- (WODataLinkMonitor)init
{
  return (WODataLinkMonitor *)sub_10004ED58();
}

- (void)setDelegate:(id)a3
{
}

+ (WODataLinkMonitor)shared
{
  if (qword_10094AB68 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100997F10;

  return (WODataLinkMonitor *)v2;
}

- (WODataLinkMonitorDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (WODataLinkMonitorDelegate *)Strong;
}

- (void)dealloc
{
  v2 = self;
  sub_10044288C();
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)self + OBJC_IVAR___WODataLinkMonitor_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WODataLinkMonitor_observerQuery);
}

@end