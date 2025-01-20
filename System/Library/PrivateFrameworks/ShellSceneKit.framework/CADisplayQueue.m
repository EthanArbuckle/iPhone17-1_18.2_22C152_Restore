@interface CADisplayQueue
+ (OS_dispatch_queue_serial)queue;
- (_TtC13ShellSceneKit14CADisplayQueue)init;
@end

@implementation CADisplayQueue

+ (OS_dispatch_queue_serial)queue
{
  if (qword_26A5A8490 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26A5A8858;
  return (OS_dispatch_queue_serial *)v2;
}

- (_TtC13ShellSceneKit14CADisplayQueue)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CADisplayQueue *)&v3 init];
}

@end