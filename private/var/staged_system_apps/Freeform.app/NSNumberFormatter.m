@interface NSNumberFormatter
+ (id)crlaxLocalizedDouble:(double)a3;
+ (id)crlaxLocalizedDouble:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4;
+ (id)crlaxLocalizedNumber:(id)a3;
+ (id)crlaxLocalizedNumber:(id)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4;
+ (id)crlaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4;
+ (id)crlaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5;
+ (id)crlaxLocalizedPercentage:(double)a3;
+ (id)crlaxLocalizedPercentage:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4;
+ (id)crlaxLocalizedUnsignedInteger:(unint64_t)a3;
- (NSString)crl_format;
- (_NSRange)crl_rangeOfNumericValueInString:(id)a3;
- (void)crl_setFormat:(id)a3;
@end

@implementation NSNumberFormatter

+ (id)crlaxLocalizedUnsignedInteger:(unint64_t)a3
{
  v4 = +[NSNumber numberWithUnsignedInteger:a3];
  v5 = [a1 crlaxLocalizedNumber:v4 maximumNumberOfDigitsAfterDecimalSeparator:0];

  return v5;
}

+ (id)crlaxLocalizedDouble:(double)a3
{
  return _[a1 crlaxLocalizedDouble:1 maximumNumberOfDigitsAfterDecimalSeparator:a3];
}

+ (id)crlaxLocalizedDouble:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  v6 = +[NSNumber numberWithDouble:a3];
  v7 = [a1 crlaxLocalizedNumber:v6 maximumNumberOfDigitsAfterDecimalSeparator:a4];

  return v7;
}

+ (id)crlaxLocalizedPercentage:(double)a3
{
  return _[a1 crlaxLocalizedPercentage:1 maximumNumberOfDigitsAfterDecimalSeparator:a3];
}

+ (id)crlaxLocalizedPercentage:(double)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  v6 = +[NSNumber numberWithDouble:a3];
  v7 = [a1 crlaxLocalizedNumber:v6 numberStyle:3 maximumNumberOfDigitsAfterDecimalSeparator:a4];

  return v7;
}

+ (id)crlaxLocalizedNumber:(id)a3
{
  return [a1 crlaxLocalizedNumber:a3 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (id)crlaxLocalizedNumber:(id)a3 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a4
{
  return [a1 crlaxLocalizedNumber:a3 numberStyle:1 maximumNumberOfDigitsAfterDecimalSeparator:a4];
}

+ (id)crlaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4
{
  return [a1 crlaxLocalizedNumber:a3 numberStyle:a4 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (id)crlaxLocalizedNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5
{
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setNumberStyle:a4];
  [v8 setMaximumFractionDigits:a5];
  v9 = [v8 stringFromNumber:v7];

  return v9;
}

- (_NSRange)crl_rangeOfNumericValueInString:(id)a3
{
  NSUInteger v3 = sub_100F8A338(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_100F89600);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSString)crl_format
{
  v2 = self;
  sub_100F89C94();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)crl_setFormat:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSUInteger v4 = self;
  sub_100F89ED8();
}

@end