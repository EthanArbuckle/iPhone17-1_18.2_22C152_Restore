@interface ATXSmartTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXSmartTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 18;
}

@end