@interface RDDispatchQueue_ObjC
+ (OS_dispatch_queue)utilityQueue;
+ (OS_dispatch_queue)xpcDefaultQueue;
- (_TtC7remindd20RDDispatchQueue_ObjC)init;
@end

@implementation RDDispatchQueue_ObjC

+ (OS_dispatch_queue)utilityQueue
{
  return (OS_dispatch_queue *)sub_1001D4C38((uint64_t)a1, (uint64_t)a2, &qword_1009070D8, (void **)&qword_100942078);
}

+ (OS_dispatch_queue)xpcDefaultQueue
{
  return (OS_dispatch_queue *)sub_1001D4C38((uint64_t)a1, (uint64_t)a2, &qword_1009070C0, (void **)&qword_100942060);
}

- (_TtC7remindd20RDDispatchQueue_ObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDDispatchQueue_ObjC();
  return [(RDDispatchQueue_ObjC *)&v3 init];
}

@end