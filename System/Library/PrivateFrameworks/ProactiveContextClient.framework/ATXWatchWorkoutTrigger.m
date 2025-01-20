@interface ATXWatchWorkoutTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXWatchWorkoutTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 6;
}

@end