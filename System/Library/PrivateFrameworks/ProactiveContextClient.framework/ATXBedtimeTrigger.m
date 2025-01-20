@interface ATXBedtimeTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXBedtimeTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 5;
}

@end