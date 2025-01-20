@interface CRLShapeControlKnobTrackerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (NSDate)_crlaxTimeOfLastHUDAnnouncement;
+ (NSString)_crlaxLastAnnouncedHUDString;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
+ (void)set_crlaxLastAnnouncedHUDString:(id)a3;
+ (void)set_crlaxTimeOfLastHUDAnnouncement:(id)a3;
- (BOOL)crlaxShouldAnnounceValueUponEndMovingKnob;
- (id)_crlaxHUDString;
- (void)p_updateHUDAtPoint:(CGPoint)a3;
@end

@implementation CRLShapeControlKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLShapeControlKnobTracker";
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

+ (NSString)_crlaxLastAnnouncedHUDString
{
  return (NSString *)(id)qword_1016A97E0;
}

+ (void)set_crlaxLastAnnouncedHUDString:(id)a3
{
}

+ (NSDate)_crlaxTimeOfLastHUDAnnouncement
{
  return (NSDate *)(id)qword_1016A97E8;
}

+ (void)set_crlaxTimeOfLastHUDAnnouncement:(id)a3
{
}

- (BOOL)crlaxShouldAnnounceValueUponEndMovingKnob
{
  v2 = [(CRLShapeControlKnobTrackerAccessibility *)self _crlaxHUDString];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (void)p_updateHUDAtPoint:(CGPoint)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CRLShapeControlKnobTrackerAccessibility;
  -[CRLShapeControlKnobTrackerAccessibility p_updateHUDAtPoint:](&v13, "p_updateHUDAtPoint:", a3.x, a3.y);
  v4 = [(CRLShapeControlKnobTrackerAccessibility *)self _crlaxHUDString];
  v5 = +[NSDate now];
  v6 = +[CRLShapeControlKnobTrackerAccessibility _crlaxTimeOfLastHUDAnnouncement];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  v9 = +[CRLShapeControlKnobTrackerAccessibility _crlaxLastAnnouncedHUDString];
  unsigned __int8 v10 = [v4 isEqualToString:v9];

  id v11 = [v4 length];
  if (v8 <= 1.0) {
    unsigned __int8 v12 = v10;
  }
  else {
    unsigned __int8 v12 = 0;
  }
  if (v11 && (v12 & 1) == 0)
  {
    +[CRLShapeControlKnobTrackerAccessibility set_crlaxTimeOfLastHUDAnnouncement:v5];
    +[CRLShapeControlKnobTrackerAccessibility set_crlaxLastAnnouncedHUDString:v4];
    [(CRLCanvasKnobTrackerAccessibility *)self crlaxAnnounceString:v4];
  }
}

- (id)_crlaxHUDString
{
  BOOL v3 = [(CRLShapeControlKnobTrackerAccessibility *)self crlaxTarget];
  v4 = [v3 shapeControlLayout];

  v5 = [v4 smartPathSource];
  v6 = [(CRLShapeControlKnobTrackerAccessibility *)self crlaxTarget];
  double v7 = [v6 knob];
  double v8 = [v5 getFeedbackStringForKnob:[v7 tag]];

  return v8;
}

@end