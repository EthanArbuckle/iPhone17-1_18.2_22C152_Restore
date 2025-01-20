@interface ATXGameControllerConnectedTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXGameControllerConnectedTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 22;
}

@end