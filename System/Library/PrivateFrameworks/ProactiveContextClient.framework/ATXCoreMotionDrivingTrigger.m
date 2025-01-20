@interface ATXCoreMotionDrivingTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXCoreMotionDrivingTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 20;
}

@end