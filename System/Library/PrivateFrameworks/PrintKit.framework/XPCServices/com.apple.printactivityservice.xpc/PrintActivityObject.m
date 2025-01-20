@interface PrintActivityObject
- (PrintActivityObject)init;
- (void)startPrintActivity;
- (void)stopPrintActivity;
@end

@implementation PrintActivityObject

- (void)startPrintActivity
{
  v2 = self;
  PrintActivityObject.startPrintActivity()();
}

- (void)stopPrintActivity
{
  v2 = self;
  PrintActivityObject.stopPrintActivity()();
}

- (PrintActivityObject)init
{
  return (PrintActivityObject *)PrintActivityObject.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PrintActivityObject_workQueue);
}

@end