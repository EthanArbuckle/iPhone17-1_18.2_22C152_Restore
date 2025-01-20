@interface _HKSPEmptySleepSchedule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmptySleepSchedule;
@end

@implementation _HKSPEmptySleepSchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEmptySleepSchedule
{
  return 1;
}

@end