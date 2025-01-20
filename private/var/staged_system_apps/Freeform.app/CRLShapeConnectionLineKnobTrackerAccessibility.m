@interface CRLShapeConnectionLineKnobTrackerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
@end

@implementation CRLShapeConnectionLineKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLShapeConnectionLineKnobTracker";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end