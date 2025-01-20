@interface ATXDNDWDTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXDNDWDTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 19;
}

@end