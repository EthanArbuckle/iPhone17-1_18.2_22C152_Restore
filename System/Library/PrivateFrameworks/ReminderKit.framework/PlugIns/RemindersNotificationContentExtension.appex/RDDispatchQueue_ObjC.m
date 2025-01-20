@interface RDDispatchQueue_ObjC
+ (OS_dispatch_queue)utilityQueue;
+ (OS_dispatch_queue)xpcDefaultQueue;
- (_TtC37RemindersNotificationContentExtension20RDDispatchQueue_ObjC)init;
@end

@implementation RDDispatchQueue_ObjC

+ (OS_dispatch_queue)utilityQueue
{
  return (OS_dispatch_queue *)sub_100006090((uint64_t)a1, (uint64_t)a2, &qword_10000CA48, (void **)&qword_10000CCD0);
}

+ (OS_dispatch_queue)xpcDefaultQueue
{
  return (OS_dispatch_queue *)sub_100006090((uint64_t)a1, (uint64_t)a2, &qword_10000CA40, (void **)&qword_10000CCC8);
}

- (_TtC37RemindersNotificationContentExtension20RDDispatchQueue_ObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDDispatchQueue_ObjC();
  return [(RDDispatchQueue_ObjC *)&v3 init];
}

@end