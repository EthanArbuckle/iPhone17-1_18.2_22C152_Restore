@interface MTScheduler
+ (id)globalAsyncSchedulerWithPriority:(unsigned int)a3;
+ (id)serialSchedulerForObject:(id)a3;
+ (id)serialSchedulerForObject:(id)a3 priority:(unsigned int)a4;
+ (id)serialSchedulerWithName:(id)a3;
+ (id)serialSchedulerWithName:(id)a3 priority:(unsigned int)a4;
+ (id)serialSchedulerWithQueue:(id)a3;
+ (unsigned)defaultPriority;
@end

@implementation MTScheduler

+ (unsigned)defaultPriority
{
  return 0;
}

+ (id)serialSchedulerWithName:(id)a3 priority:(unsigned int)a4
{
  v5 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, -1);
  dispatch_queue_t v6 = dispatch_queue_create((const char *)[a3 UTF8String], v5);
  v7 = +[MTScheduler serialSchedulerWithQueue:v6];

  return v7;
}

+ (id)serialSchedulerWithQueue:(id)a3
{
  id v3 = a3;
  v4 = [[_MTSerialQueueScheduler alloc] initWithQueue:v3];

  return v4;
}

+ (id)serialSchedulerWithName:(id)a3
{
  dispatch_queue_t v4 = dispatch_queue_create((const char *)[a3 UTF8String], 0);
  v5 = [a1 serialSchedulerWithQueue:v4];

  return v5;
}

+ (id)serialSchedulerForObject:(id)a3
{
  dispatch_queue_t v4 = [NSString stringWithFormat:@"com.apple.%@.serial", objc_opt_class()];
  v5 = [a1 serialSchedulerWithName:v4];

  return v5;
}

+ (id)serialSchedulerForObject:(id)a3 priority:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  dispatch_queue_t v6 = [NSString stringWithFormat:@"com.apple.%@.serial", objc_opt_class()];
  v7 = [a1 serialSchedulerWithName:v6 priority:v4];

  return v7;
}

+ (id)globalAsyncSchedulerWithPriority:(unsigned int)a3
{
  uint64_t v4 = [_MTSerialQueueScheduler alloc];
  v5 = dispatch_get_global_queue(a3, 0);
  dispatch_queue_t v6 = [(_MTSerialQueueScheduler *)v4 initWithQueue:v5];

  return v6;
}

@end