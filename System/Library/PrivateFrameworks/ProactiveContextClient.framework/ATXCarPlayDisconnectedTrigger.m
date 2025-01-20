@interface ATXCarPlayDisconnectedTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXCarPlayDisconnectedTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 10;
}

@end