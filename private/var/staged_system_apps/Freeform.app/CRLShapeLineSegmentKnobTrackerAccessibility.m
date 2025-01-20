@interface CRLShapeLineSegmentKnobTrackerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
@end

@implementation CRLShapeLineSegmentKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLShapeLineSegmentKnobTracker";
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

@end