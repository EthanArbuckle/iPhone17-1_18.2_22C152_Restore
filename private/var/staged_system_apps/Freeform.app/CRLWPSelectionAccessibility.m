@interface CRLWPSelectionAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxSelectionWithInvalidRange;
+ (id)crlaxSelectionWithRange:(_NSRange)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsInsertionPoint;
- (BOOL)crlaxIsValid;
- (_NSRange)crlaxRange;
- (unint64_t)crlaxStart;
@end

@implementation CRLWPSelectionAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPSelection";
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

+ (id)crlaxSelectionWithInvalidRange
{
  return [a1 crlaxSelectionWithRange:0x7FFFFFFFFFFFFFFFLL, 0];
}

+ (id)crlaxSelectionWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_100364418;
  v12 = sub_100364428;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100364430;
  v7[3] = &unk_1014F12B0;
  v7[4] = &v8;
  v7[5] = [a1 crlaxTargetClass];
  v7[6] = location;
  v7[7] = length;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (_NSRange)crlaxRange
{
  v2 = [(CRLWPSelectionAccessibility *)self crlaxTarget];
  id v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (BOOL)crlaxIsInsertionPoint
{
  v2 = [(CRLWPSelectionAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isInsertionPoint];

  return v3;
}

- (BOOL)crlaxIsValid
{
  v2 = [(CRLWPSelectionAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isValid];

  return v3;
}

- (unint64_t)crlaxStart
{
  v2 = [(CRLWPSelectionAccessibility *)self crlaxTarget];
  id v3 = [v2 start];

  return (unint64_t)v3;
}

@end