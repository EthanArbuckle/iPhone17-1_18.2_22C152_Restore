@interface CHCloudDeviceProvider
- (BOOL)oldDevicesExist;
- (CHCloudDeviceProvider)init;
@end

@implementation CHCloudDeviceProvider

- (BOOL)oldDevicesExist
{
  v2 = self;
  uint64_t v3 = sub_1003851C8()[2];

  swift_bridgeObjectRelease();
  return v3 != 0;
}

- (CHCloudDeviceProvider)init
{
  result = (CHCloudDeviceProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end