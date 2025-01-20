@interface TSWPColumnAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (CGRect)tsaxBoundsOfLineFragmentAtIndex:(unint64_t)a3;
- (CGRect)tsaxColumnRectForRange:(_NSRange)a3;
- (CGRect)tsaxGlyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4;
- (_NSRange)tsaxRange;
- (_NSRange)tsaxRangeOfLineFragmentAtIndex:(unint64_t)a3;
- (unint64_t)tsaxCountLines;
- (unint64_t)tsaxLineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4;
@end

@implementation TSWPColumnAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPColumn";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (_NSRange)tsaxRange
{
  id v2 = [(TSWPColumnAccessibility *)self tsaxRangeValueForKey:@"range"];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (unint64_t)tsaxCountLines
{
  return (unint64_t)[(TSWPColumnAccessibility *)self tsaxUnsignedIntegerValueForKey:@"countLines"];
}

- (CGRect)tsaxColumnRectForRange:(_NSRange)a3
{
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  v16 = &unk_41622E;
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_276998;
  v11[3] = &unk_46B940;
  v11[4] = self;
  v11[5] = &v13;
  _NSRange v12 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)) {
    abort();
  }
  double v3 = v14[4];
  double v4 = v14[5];
  double v5 = v14[6];
  double v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)tsaxGlyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  uint64_t v15 = 0;
  v16 = (double *)&v15;
  uint64_t v17 = 0x4010000000;
  long long v18 = &unk_41622E;
  long long v19 = 0u;
  long long v20 = 0u;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_276AD4;
  v12[3] = &unk_46C298;
  v12[4] = self;
  v12[5] = &v15;
  _NSRange v13 = a3;
  BOOL v14 = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v12)) {
    abort();
  }
  double v4 = v16[4];
  double v5 = v16[5];
  double v6 = v16[6];
  double v7 = v16[7];
  _Block_object_dispose(&v15, 8);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (_NSRange)tsaxRangeOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3010000000;
  double v11 = &unk_41622E;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_276BF0;
  v7[3] = &unk_458E98;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  NSUInteger v3 = v9[4];
  NSUInteger v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  NSUInteger v5 = v3;
  NSUInteger v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

- (CGRect)tsaxBoundsOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x4010000000;
  uint64_t v15 = &unk_41622E;
  long long v16 = 0u;
  long long v17 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_276D24;
  v11[3] = &unk_458E98;
  v11[4] = self;
  v11[5] = &v12;
  void v11[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)) {
    abort();
  }
  double v3 = v13[4];
  double v4 = v13[5];
  double v5 = v13[6];
  double v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (unint64_t)tsaxLineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_276E30;
  v6[3] = &unk_46C2C0;
  v6[4] = self;
  v6[5] = &v8;
  v6[6] = a3;
  BOOL v7 = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

@end