@interface PFManagedObjectContextMonitor
- (PFManagedObjectContextMonitor)init;
- (PFManagedObjectContextMonitor)initWithContext:(id)a3 label:(int64_t)a4 pingInterval:(double)a5 shortHangDuration:(double)a6 severeHangDuration:(double)a7 criticalHangDuration:(double)a8 criticalHangRepeatInterval:(double)a9;
- (void)beginMonitoring;
- (void)endMonitoring;
@end

@implementation PFManagedObjectContextMonitor

- (PFManagedObjectContextMonitor)initWithContext:(id)a3 label:(int64_t)a4 pingInterval:(double)a5 shortHangDuration:(double)a6 severeHangDuration:(double)a7 criticalHangDuration:(double)a8 criticalHangRepeatInterval:(double)a9
{
  return (PFManagedObjectContextMonitor *)ManagedObjectContextMonitor.init(context:label:pingInterval:shortHangDuration:severeHangDuration:criticalHangDuration:criticalHangRepeatInterval:)(a3, a4, a5, a6, a7, a8, a9);
}

- (void)beginMonitoring
{
  v2 = self;
  sub_1ACDE37B8();
}

- (void)endMonitoring
{
  v2 = self;
  sub_1ACDE3CA8();
}

- (PFManagedObjectContextMonitor)init
{
  result = (PFManagedObjectContextMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PFManagedObjectContextMonitor_signpost;
  uint64_t v4 = sub_1ACE75438();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

@end