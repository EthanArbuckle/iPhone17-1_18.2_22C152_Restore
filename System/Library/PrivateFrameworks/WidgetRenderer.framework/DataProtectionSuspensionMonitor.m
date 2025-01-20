@interface DataProtectionSuspensionMonitor
- (_TtC14WidgetRenderer31DataProtectionSuspensionMonitor)init;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
@end

@implementation DataProtectionSuspensionMonitor

- (void)applicationWillEnterForeground
{
  v2 = self;
  sub_2618CB768();
}

- (void)applicationDidEnterBackground
{
  v2 = self;
  sub_2618CB8FC();
}

- (_TtC14WidgetRenderer31DataProtectionSuspensionMonitor)init
{
  result = (_TtC14WidgetRenderer31DataProtectionSuspensionMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14WidgetRenderer31DataProtectionSuspensionMonitor_innerProtectionMonitor);
  swift_release();

  swift_bridgeObjectRelease();
}

@end