@interface PBNumberDataDetective
- (NSSet)patterns;
- (id)detectedPatternValuesInValue:(id)a3;
@end

@implementation PBNumberDataDetective

- (NSSet)patterns
{
  return +[NSSet setWithObjects:@"com.apple.uikit.pasteboard-detection-pattern.number", 0];
}

- (id)detectedPatternValuesInValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[NSLocale currentLocale];
    v5 = [v4 groupingSeparator];
    v6 = v3;
    if (v5)
    {
      v6 = [v3 stringByReplacingOccurrencesOfString:v5 withString:&stru_100032C78];
    }
    if ([v6 length])
    {
      v7 = +[NSScanner scannerWithString:v6];
      [v7 setLocale:v4];
      double v11 = 0.0;
      if ([v7 scanDouble:&v11])
      {
        CFStringRef v12 = @"com.apple.uikit.pasteboard-detection-pattern.number";
        v8 = +[NSNumber numberWithDouble:v11];
        v13 = v8;
        v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      }
      else
      {
        v9 = &__NSDictionary0__struct;
      }
    }
    else
    {
      v9 = &__NSDictionary0__struct;
    }
  }
  else
  {
    v9 = &__NSDictionary0__struct;
    v6 = v3;
  }

  return v9;
}

@end