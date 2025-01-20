@interface ATXIdleTimeEndTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXIdleTimeEndTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 8;
}

@end