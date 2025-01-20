@interface NSNumberFormatter(ICAccessibility)
+ (id)icaxLocalizedDouble:()ICAccessibility maximumNumberOfDigitsAfterDecimalSeparator:;
+ (id)icaxLocalizedNumber:()ICAccessibility numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:;
+ (id)icaxLocalizedPercentage:()ICAccessibility maximumNumberOfDigitsAfterDecimalSeparator:;
+ (id)icaxLocalizedUnsignedInteger:()ICAccessibility;
+ (uint64_t)icaxLocalizedDouble:()ICAccessibility;
+ (uint64_t)icaxLocalizedNumber:()ICAccessibility;
+ (uint64_t)icaxLocalizedNumber:()ICAccessibility maximumNumberOfDigitsAfterDecimalSeparator:;
+ (uint64_t)icaxLocalizedNumber:()ICAccessibility numberStyle:;
+ (uint64_t)icaxLocalizedPercentage:()ICAccessibility;
@end

@implementation NSNumberFormatter(ICAccessibility)

+ (id)icaxLocalizedUnsignedInteger:()ICAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v3 = [a1 icaxLocalizedNumber:v2 maximumNumberOfDigitsAfterDecimalSeparator:0];

  return v3;
}

+ (uint64_t)icaxLocalizedDouble:()ICAccessibility
{
  return objc_msgSend(a1, "icaxLocalizedDouble:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)icaxLocalizedDouble:()ICAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v6 = [a1 icaxLocalizedNumber:v5 maximumNumberOfDigitsAfterDecimalSeparator:a3];

  return v6;
}

+ (uint64_t)icaxLocalizedPercentage:()ICAccessibility
{
  return objc_msgSend(a1, "icaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)icaxLocalizedPercentage:()ICAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v6 = [a1 icaxLocalizedNumber:v5 numberStyle:3 maximumNumberOfDigitsAfterDecimalSeparator:a3];

  return v6;
}

+ (uint64_t)icaxLocalizedNumber:()ICAccessibility
{
  return [a1 icaxLocalizedNumber:a3 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (uint64_t)icaxLocalizedNumber:()ICAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  return [a1 icaxLocalizedNumber:a3 numberStyle:1 maximumNumberOfDigitsAfterDecimalSeparator:a4];
}

+ (uint64_t)icaxLocalizedNumber:()ICAccessibility numberStyle:
{
  return [a1 icaxLocalizedNumber:a3 numberStyle:a4 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (id)icaxLocalizedNumber:()ICAccessibility numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:
{
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setNumberStyle:a4];
  [v8 setMaximumFractionDigits:a5];
  v9 = [v8 stringFromNumber:v7];

  return v9;
}

@end