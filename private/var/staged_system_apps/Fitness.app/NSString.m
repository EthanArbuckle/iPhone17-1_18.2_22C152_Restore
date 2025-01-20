@interface NSString
+ (id)_meridianStringFormatter;
+ (id)_twelveHourFormatter;
+ (id)attrStringWithValue:(id)a3;
+ (id)attrStringWithValue:(id)a3 unit:(id)a4;
+ (id)goalProgressAttrStringWithCurrentValue:(id)a3 goalValue:(id)a4 unitString:(id)a5;
+ (id)timeIntervalHourMinuteFormatter:(double)a3;
- (BOOL)isEmail;
- (BOOL)isPhoneNumber;
- (id)destinationStripped;
@end

@implementation NSString

+ (id)_meridianStringFormatter
{
  if (qword_10096B4B8 != -1) {
    dispatch_once(&qword_10096B4B8, &stru_1008ACF18);
  }
  v2 = (void *)qword_10096B4B0;

  return v2;
}

+ (id)_twelveHourFormatter
{
  if (qword_10096B4C8 != -1) {
    dispatch_once(&qword_10096B4C8, &stru_1008ACF38);
  }
  v2 = (void *)qword_10096B4C0;

  return v2;
}

+ (id)attrStringWithValue:(id)a3
{
  id v3 = a3;
  v4 = +[UIFont systemFontOfSize:22.0];
  NSAttributedStringKey v8 = NSFontAttributeName;
  v9 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = [objc_alloc((Class)NSAttributedString) initWithString:v3 attributes:v5];

  return v6;
}

+ (id)timeIntervalHourMinuteFormatter:(double)a3
{
  LODWORD(v3) = vcvtmd_s64_f64(a3 / 60.0);
  uint64_t v4 = ((int)a3 % 60);
  v5 = +[NSNumber numberWithInt:v3];
  id v6 = +[FIUIFormattingManager stringWithNumber:v5 decimalPrecision:1];

  v7 = +[NSNumber numberWithInt:v4];
  NSAttributedStringKey v8 = +[FIUIFormattingManager stringWithNumber:v7 decimalPrecision:1];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"HR" value:&stru_1008D8AB8 table:@"Localizable"];

  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"MIN" value:&stru_1008D8AB8 table:@"Localizable"];

  v17 = +[NSString stringWithFormat:@"%@ %@ %@ %@", v6, v10, v8, v12];
  id v13 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v17];
  v14 = +[UIFont systemFontOfSize:18.0];
  v15 = +[UIFont systemFontOfSize:22.0];
  [v13 addAttribute:NSFontAttributeName value:v15 range:0, [v6 length]];
  [v13 addAttribute:NSFontAttributeName value:v14 range:(char *)[v6 length] + 1, [v10 length]];
  objc_msgSend(v13, "addAttribute:value:range:", NSFontAttributeName, v15, (char *)objc_msgSend(v10, "length") + (void)objc_msgSend(v6, "length") + 2, objc_msgSend(v8, "length"));
  objc_msgSend(v13, "addAttribute:value:range:", NSFontAttributeName, v14, (char *)objc_msgSend(v6, "length")+ (unint64_t)objc_msgSend(v8, "length")+ (void)objc_msgSend(v10, "length")+ 3, objc_msgSend(v12, "length"));

  return v13;
}

+ (id)attrStringWithValue:(id)a3 unit:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSMutableAttributedString);
  NSAttributedStringKey v8 = +[NSString stringWithFormat:@"%@%@", v6, v5];
  id v9 = [v7 initWithString:v8];

  v10 = +[UIFont systemFontOfSize:22.0];
  [v9 addAttribute:NSFontAttributeName value:v10 range:0, [v6 length]];

  v11 = +[UIFont systemFontOfSize:18.0];
  id v12 = [v6 length];

  id v13 = [v5 length];
  [v9 addAttribute:NSFontAttributeName value:v11 range:v12, v13];

  return v9;
}

+ (id)goalProgressAttrStringWithCurrentValue:(id)a3 goalValue:(id)a4 unitString:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = +[FIUIFormattingManager stringWithNumber:a3 decimalPrecision:1];
  v11 = +[FIUIFormattingManager stringWithNumber:v9 decimalPrecision:1];

  id v12 = +[NSString stringWithFormat:@"%@/%@", v10, v11];
  id v13 = [a1 attrStringWithValue:v12 unit:v8];

  return v13;
}

- (BOOL)isPhoneNumber
{
  uint64_t v3 = +[NSMutableCharacterSet decimalDigitCharacterSet];
  [v3 addCharactersInString:@"+()-"];
  uint64_t v4 = +[NSCharacterSet controlCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  id v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  [v3 formUnionWithCharacterSet:v5];

  id v6 = [(NSString *)self componentsSeparatedByCharactersInSet:v3];
  id v7 = [v6 componentsJoinedByString:&stru_1008D8AB8];

  LOBYTE(v6) = [v7 length] == 0;
  return (char)v6;
}

- (BOOL)isEmail
{
  if (qword_10096B588 != -1) {
    dispatch_once(&qword_10096B588, &stru_1008ADA38);
  }
  uint64_t v3 = (void *)qword_10096B580;

  return _[v3 evaluateWithObject:self];
}

- (id)destinationStripped
{
  uint64_t v3 = +[NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
  uint64_t v4 = +[NSCharacterSet controlCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  [v3 addCharactersInString:@"\uFFFC"];
  id v5 = [(NSString *)self stringByTrimmingCharactersInSet:v3];

  return v5;
}

@end