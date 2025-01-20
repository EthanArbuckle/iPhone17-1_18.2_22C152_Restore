@interface CRLCanvasLayerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CGSize)crlaxUnscaledSize;
@end

@implementation CRLCanvasLayerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLCanvasLayer";
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

- (CGSize)crlaxUnscaledSize
{
  v2 = [(CRLCanvasLayerAccessibility *)self crlaxTarget];
  [v2 unscaledSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

@end