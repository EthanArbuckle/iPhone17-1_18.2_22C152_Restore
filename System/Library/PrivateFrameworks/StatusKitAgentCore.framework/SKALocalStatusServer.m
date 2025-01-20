@interface SKALocalStatusServer
- (SKALocalStatusServer)init;
- (SKALocalStatusServer)initWithIdsDeviceProvider:(id)a3;
- (void)objcShutdown;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation SKALocalStatusServer

- (void)objcShutdown
{
  swift_retain();
  SKALocalStatusServer.objcShutdown()();
  swift_release();
}

- (SKALocalStatusServer)initWithIdsDeviceProvider:(id)a3
{
  return (SKALocalStatusServer *)SKALocalStatusServer.init(idsDeviceProvider:)(a3);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  if (a4) {
    uint64_t v5 = sub_2248C48A8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = a3;
  swift_retain();
  sub_2248B7A20(v5);

  swift_release();
  swift_bridgeObjectRelease();
}

- (SKALocalStatusServer)init
{
  swift_defaultActor_initialize();
  result = (SKALocalStatusServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end