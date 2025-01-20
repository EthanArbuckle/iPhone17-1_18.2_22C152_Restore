@interface BCDisplaySleepController
- (BCDisplaySleepController)init;
- (UIWindow)window;
- (void)setWindow:(id)a3;
@end

@implementation BCDisplaySleepController

- (UIWindow)window
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCDisplaySleepController_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCDisplaySleepController_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BCDisplaySleepController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCDisplaySleepController_window) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(BCDisplaySleepController *)&v5 init];
}

- (void).cxx_destruct
{
}

@end