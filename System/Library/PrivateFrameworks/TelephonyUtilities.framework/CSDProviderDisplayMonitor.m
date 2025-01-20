@interface CSDProviderDisplayMonitor
- (BOOL)isVisible;
- (CSDProviderDisplayMonitor)init;
- (CSDProviderDisplayMonitor)initWithBundleIdentifier:(id)a3 pid:(int)a4;
- (void)dealloc;
@end

@implementation CSDProviderDisplayMonitor

- (CSDProviderDisplayMonitor)initWithBundleIdentifier:(id)a3 pid:(int)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDProviderDisplayMonitor *)sub_10021EDC8(v5, v6, a4);
}

- (void)dealloc
{
  v2 = self;
  sub_10021F134();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDProviderDisplayMonitor____lazy_storage___processObserver);
}

- (BOOL)isVisible
{
  v2 = self;
  char v3 = sub_10021F24C();

  return v3 & 1;
}

- (CSDProviderDisplayMonitor)init
{
}

@end