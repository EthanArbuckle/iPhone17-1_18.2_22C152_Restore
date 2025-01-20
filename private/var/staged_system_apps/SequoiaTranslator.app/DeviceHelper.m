@interface DeviceHelper
- (void)availableOutputDeviceChangedWithNotification:(id)a3;
- (void)handlePickableRouteChangeWithNotification:(id)a3;
- (void)handleRouteChangeWithNotification:(id)a3;
@end

@implementation DeviceHelper

- (void)handlePickableRouteChangeWithNotification:(id)a3
{
}

- (void)handleRouteChangeWithNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_1000BB4E8((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)availableOutputDeviceChangedWithNotification:(id)a3
{
}

@end