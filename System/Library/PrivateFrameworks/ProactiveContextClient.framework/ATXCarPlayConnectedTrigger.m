@interface ATXCarPlayConnectedTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXCarPlayConnectedTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 9;
}

@end