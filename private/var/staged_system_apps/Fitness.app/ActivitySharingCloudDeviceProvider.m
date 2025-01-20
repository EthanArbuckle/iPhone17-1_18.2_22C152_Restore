@interface ActivitySharingCloudDeviceProvider
- (_TtC10FitnessApp34ActivitySharingCloudDeviceProvider)init;
- (void)dealloc;
@end

@implementation ActivitySharingCloudDeviceProvider

- (_TtC10FitnessApp34ActivitySharingCloudDeviceProvider)init
{
  uint64_t v3 = type metadata accessor for SecureCloudClient();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_cloudDevices) = (Class)_swiftEmptyArrayStorage;
  *(_DWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_activitySharingCloudDevicesChangedToken) = -1;
  v7 = self;
  SecureCloudClient.init()();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))((uint64_t)v7 + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_secureCloudClient, v6, v3);

  v8 = (objc_class *)type metadata accessor for ActivitySharingCloudDeviceProvider();
  v10.receiver = v7;
  v10.super_class = v8;
  return [(ActivitySharingCloudDeviceProvider *)&v10 init];
}

- (void)dealloc
{
  uint64_t v3 = (int *)((char *)self
             + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_activitySharingCloudDevicesChangedToken);
  swift_beginAccess();
  int v4 = *v3;
  uint64_t v5 = self;
  if (v4 != -1) {
    notify_cancel(v4);
  }
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for ActivitySharingCloudDeviceProvider();
  [(ActivitySharingCloudDeviceProvider *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_secureCloudClient;
  uint64_t v3 = type metadata accessor for SecureCloudClient();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end