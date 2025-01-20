@interface NSNumberFormatter
+ (id)tsaxLocalizedDouble:(double)a3;
+ (id)tsaxLocalizedDouble:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4;
+ (id)tsaxLocalizedNumber:(id)a3;
+ (id)tsaxLocalizedNumber:(id)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4;
+ (id)tsaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4;
+ (id)tsaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5;
+ (id)tsaxLocalizedPercentage:(double)a3;
+ (id)tsaxLocalizedPercentage:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4;
+ (id)tsaxLocalizedUnsignedInteger:(unint64_t)a3;
@end

@implementation NSNumberFormatter

+ (id)tsaxLocalizedUnsignedInteger:(unint64_t)a3
{
  v4 = +[NSNumber numberWithUnsignedInteger:a3];

  return [a1 tsaxLocalizedNumber:v4 maximumNumberOfDigitsAfterDecimalSeparator:0];
}

+ (id)tsaxLocalizedDouble:(double)a3
{
  return [a1 tsaxLocalizedDouble:1 maximumNumberOfDigitsAfterDecimalSeparator:a3];
}

+ (id)tsaxLocalizedDouble:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  v6 = +[NSNumber numberWithDouble:a3];

  return [a1 tsaxLocalizedNumber:v6 maximumNumberOfDigitsAfterDecimalSeparator:a4];
}

+ (id)tsaxLocalizedPercentage:(double)a3
{
  return [a1 tsaxLocalizedPercentage:1 maximumNumberOfDigitsAfterDecimalSeparator:a3];
}

+ (id)tsaxLocalizedPercentage:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  v6 = +[NSNumber numberWithDouble:a3];

  return [a1 tsaxLocalizedNumber:v6 numberStyle:3 maximumNumberOfDigitsAfterDecimalSeparator:a4];
}

+ (id)tsaxLocalizedNumber:(id)a3
{
  return [a1 tsaxLocalizedNumber:a3 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (id)tsaxLocalizedNumber:(id)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  return [a1 tsaxLocalizedNumber:a3 numberStyle:1 maximumNumberOfDigitsAfterDecimalSeparator:a4];
}

+ (id)tsaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4
{
  return [a1 tsaxLocalizedNumber:a3 numberStyle:a4 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (id)tsaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5
{
  v8 = objc_opt_new();
  [v8 setNumberStyle:a4];
  [v8 setMaximumFractionDigits:a5];
  id v9 = [v8 stringFromNumber:a3];

  return v9;
}

@end