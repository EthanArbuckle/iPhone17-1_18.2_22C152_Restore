@interface ATXScreenRecordingTrigger
+ (BOOL)supportsSecureCoding;
- (int64_t)type;
@end

@implementation ATXScreenRecordingTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 21;
}

@end