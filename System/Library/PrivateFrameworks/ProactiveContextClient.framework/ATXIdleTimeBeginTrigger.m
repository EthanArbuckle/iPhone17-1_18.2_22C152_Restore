@interface ATXIdleTimeBeginTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXIdleTimeBeginTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 7;
}

@end