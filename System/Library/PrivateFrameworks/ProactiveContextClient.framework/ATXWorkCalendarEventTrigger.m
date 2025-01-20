@interface ATXWorkCalendarEventTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXWorkCalendarEventTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 4;
}

@end