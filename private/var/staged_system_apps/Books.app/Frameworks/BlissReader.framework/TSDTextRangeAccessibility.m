@interface TSDTextRangeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxNewTextRangeWithRange:(_NSRange)a3;
+ (id)tsaxTargetClassName;
- (_NSRange)tsaxRange;
- (int64_t)tsaxCompareTextRangeByLocation:(id)a3;
@end

@implementation TSDTextRangeAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDTextRange";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)tsaxNewTextRangeWithRange:(_NSRange)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_255DA4;
  v11 = sub_255DB4;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_255DC0;
  v5[3] = &unk_46B940;
  v5[4] = a1;
  v5[5] = &v7;
  _NSRange v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (_NSRange)tsaxRange
{
  id v2 = [(TSDTextRangeAccessibility *)self tsaxRangeValueForKey:@"range"];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (int64_t)tsaxCompareTextRangeByLocation:(id)a3
{
  id v4 = [(TSDTextRangeAccessibility *)self tsaxRange];
  id v5 = [a3 tsaxRange];
  int64_t v6 = -1;
  if (v4 >= v5) {
    int64_t v6 = 1;
  }
  if (v4 == v5) {
    return 0;
  }
  else {
    return v6;
  }
}

@end