@interface ATXChargerConnectedTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXChargerConnectedTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 14;
}

@end