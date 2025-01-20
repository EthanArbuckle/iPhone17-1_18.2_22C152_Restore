@interface NAScheduler(MTUtilities)
+ (id)mtSerialSchedulerForObject:()MTUtilities;
+ (uint64_t)mtMainThreadScheduler;
@end

@implementation NAScheduler(MTUtilities)

+ (uint64_t)mtMainThreadScheduler
{
  return [MEMORY[0x1E4F7A0F0] schedulerWithDispatchQueue:MEMORY[0x1E4F14428]];
}

+ (id)mtSerialSchedulerForObject:()MTUtilities
{
  v0 = (void *)MEMORY[0x1E4F7A0F0];
  v1 = [NSString stringWithFormat:@"com.apple.%@.serial", objc_opt_class()];
  v2 = [v0 serialDispatchQueueSchedulerWithName:v1];

  return v2;
}

@end