@interface ATXScreenShareTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXScreenShareTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 17;
}

@end