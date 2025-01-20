@interface NetworkMonitor
- (_TtC13SeymourClient14NetworkMonitor)init;
- (void)airplaneModeChanged;
@end

@implementation NetworkMonitor

- (_TtC13SeymourClient14NetworkMonitor)init
{
  result = (_TtC13SeymourClient14NetworkMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC13SeymourClient14NetworkMonitor_delegate;
  sub_1D59586BC((uint64_t)v3);
}

- (void)airplaneModeChanged
{
  v2 = self;
  NetworkMonitor.airplaneModeChanged()();
}

@end