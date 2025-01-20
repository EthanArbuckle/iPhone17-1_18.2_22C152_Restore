@interface IMUserDataCull
+ (BOOL)isTimestamp:(unint64_t)a3 newerThanMaxAgeFromRightNow:(unint64_t)a4;
+ (BOOL)isTimestampNewerThanMaxDeletedAge:(unint64_t)a3;
+ (BOOL)isTimestampTrustworthy:(unint64_t)a3;
+ (unint64_t)maxDeletedAge;
@end

@implementation IMUserDataCull

+ (unint64_t)maxDeletedAge
{
  return 7776000;
}

+ (BOOL)isTimestampTrustworthy:(unint64_t)a3
{
  return a3 - 1229904001 < 0xFFFFFFFFB6B1277ELL;
}

+ (BOOL)isTimestamp:(unint64_t)a3 newerThanMaxAgeFromRightNow:(unint64_t)a4
{
  return (unint64_t)[(id)objc_opt_class() maxDeletedAge] + a3 > a4;
}

+ (BOOL)isTimestampNewerThanMaxDeletedAge:(unint64_t)a3
{
  v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  if (![(id)objc_opt_class() isTimestampTrustworthy:a3]
    || ![(id)objc_opt_class() isTimestampTrustworthy:(unint64_t)v6])
  {
    return 1;
  }
  v7 = objc_opt_class();

  return _[v7 isTimestamp:a3 newerThanMaxAgeFromRightNow:(unint64_t)v6];
}

@end