@interface TSWPSelectionAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxSelectionWithRange:(_NSRange)a3;
+ (id)tsaxTargetClassName;
- (_NSRange)tsaxRange;
@end

@implementation TSWPSelectionAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPSelection";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)tsaxSelectionWithRange:(_NSRange)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_266C3C;
  v11 = sub_266C4C;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_266C58;
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
  id v2 = [(TSWPSelectionAccessibility *)self tsaxRangeValueForKey:@"range"];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

@end