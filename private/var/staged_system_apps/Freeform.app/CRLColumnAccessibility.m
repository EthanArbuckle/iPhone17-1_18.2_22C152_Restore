@interface CRLColumnAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CGRect)crlaxColumnRectForRange:(_NSRange)a3;
- (CGRect)crlaxGlyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4;
- (_NSRange)crlaxRange;
- (_NSRange)crlaxRangeOfLineFragmentAtIndex:(unint64_t)a3;
- (unint64_t)crlaxLineCount;
- (unint64_t)crlaxLineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4;
@end

@implementation CRLColumnAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPColumn";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (_NSRange)crlaxRange
{
  v2 = [(CRLColumnAccessibility *)self crlaxTarget];
  id v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (unint64_t)crlaxLineCount
{
  v2 = [(CRLColumnAccessibility *)self crlaxTarget];
  id v3 = [v2 lineCount];

  return (unint64_t)v3;
}

- (CGRect)crlaxColumnRectForRange:(_NSRange)a3
{
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  v16 = "";
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100100684;
  v11[3] = &unk_1014D3490;
  v11[4] = self;
  v11[5] = &v13;
  _NSRange v12 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11)) {
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

- (CGRect)crlaxGlyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  uint64_t v15 = 0;
  v16 = (double *)&v15;
  uint64_t v17 = 0x4010000000;
  long long v18 = "";
  long long v19 = 0u;
  long long v20 = 0u;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001007C0;
  v12[3] = &unk_1014D6080;
  v12[4] = self;
  v12[5] = &v15;
  _NSRange v13 = a3;
  BOOL v14 = a4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v12)) {
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

- (_NSRange)crlaxRangeOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3010000000;
  double v11 = "";
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001008DC;
  v7[3] = &unk_1014CC6B8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
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

- (unint64_t)crlaxLineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001009E4;
  v6[3] = &unk_1014CC700;
  v6[4] = self;
  v6[5] = &v8;
  v6[6] = a3;
  BOOL v7 = a4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

@end