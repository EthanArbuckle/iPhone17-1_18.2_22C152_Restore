@interface TSCHFillSetAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)tsaxFillsForDefaultSeriesType;
@end

@implementation TSCHFillSetAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSCHFillSet";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSArray)tsaxFillsForDefaultSeriesType
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3052000000;
  v8 = sub_270164;
  v9 = sub_270174;
  uint64_t v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_270180;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  v2 = (NSArray *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end