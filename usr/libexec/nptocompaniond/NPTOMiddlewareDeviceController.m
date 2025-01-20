@interface NPTOMiddlewareDeviceController
- (NPTOMiddlewareDeviceController)init;
- (NPTOMiddlewareDeviceController)initWithDevice:(id)a3 service:(id)a4;
- (void)pause;
- (void)resume;
@end

@implementation NPTOMiddlewareDeviceController

- (NPTOMiddlewareDeviceController)initWithDevice:(id)a3 service:(id)a4
{
  return (NPTOMiddlewareDeviceController *)sub_100023284(a3, a4);
}

- (void)resume
{
}

- (void)pause
{
}

- (NPTOMiddlewareDeviceController)init
{
  swift_defaultActor_initialize();
  result = (NPTOMiddlewareDeviceController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end