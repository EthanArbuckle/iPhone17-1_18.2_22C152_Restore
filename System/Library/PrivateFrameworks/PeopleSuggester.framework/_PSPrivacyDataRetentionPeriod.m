@interface _PSPrivacyDataRetentionPeriod
+ (int64_t)lookbackDurationInDays;
+ (int64_t)numberOfDaysInMonth;
@end

@implementation _PSPrivacyDataRetentionPeriod

+ (int64_t)lookbackDurationInDays
{
  return 168;
}

+ (int64_t)numberOfDaysInMonth
{
  return 28;
}

@end