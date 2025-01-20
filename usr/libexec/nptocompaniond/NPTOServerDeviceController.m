@interface NPTOServerDeviceController
- (NPTOServerDeviceController)init;
- (NPTOServerDeviceController)initWithDevice:(id)a3 service:(id)a4;
- (void)controllerDidInvalidateContent:(id)a3;
- (void)pause;
- (void)resume;
@end

@implementation NPTOServerDeviceController

- (NPTOServerDeviceController)initWithDevice:(id)a3 service:(id)a4
{
  return (NPTOServerDeviceController *)sub_10001604C(a3, a4);
}

- (void)resume
{
}

- (void)pause
{
}

- (NPTOServerDeviceController)init
{
  swift_defaultActor_initialize();
  result = (NPTOServerDeviceController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)controllerDidInvalidateContent:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1000165EC((uint64_t)&unk_100092100, (uint64_t)&unk_100092128, (uint64_t)&unk_1000A1168);

  swift_release();
}

@end