@interface TSDKnobAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (Class)tsaxKnobTrackerClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxAllowsHUDWhileResizing;
- (BOOL)tsaxIsAdjustable;
- (CALayer)tsaxLayer;
- (CGPoint)tsaxCalculatedNextPositionInRepForAdjustable:(BOOL)a3;
- (CGPoint)tsaxPosition;
- (CGRect)tsaxFrame;
- (NSString)tsaxLabel;
- (NSString)tsaxValue;
- (TSDRepAccessibility)tsaxParentRepForKnob;
- (id)tsaxCreateKnobTracker;
- (unint64_t)tsaxKnobTag;
@end

@implementation TSDKnobAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDKnob";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (Class)tsaxKnobTrackerClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxLabel
{
  CFStringRef v3 = @"knob.sizing.upperleft";
  switch([(TSDKnobAccessibility *)self tsaxKnobTag])
  {
    case 1uLL:
      goto LABEL_11;
    case 2uLL:
      CFStringRef v3 = @"knob.sizing.uppermiddle";
      goto LABEL_11;
    case 3uLL:
      CFStringRef v3 = @"knob.sizing.upperright";
      goto LABEL_11;
    case 4uLL:
      CFStringRef v3 = @"knob.sizing.middleleft";
      goto LABEL_11;
    case 5uLL:
      CFStringRef v3 = @"knob.sizing.middlemiddle";
      goto LABEL_11;
    case 6uLL:
      CFStringRef v3 = @"knob.sizing.middleright";
      goto LABEL_11;
    case 7uLL:
      CFStringRef v3 = @"knob.sizing.lowerleft";
      goto LABEL_11;
    case 8uLL:
      CFStringRef v3 = @"knob.sizing.lowermiddle";
      goto LABEL_11;
    case 9uLL:
      CFStringRef v3 = @"knob.sizing.lowerright";
      goto LABEL_11;
    case 0xCuLL:
      return TSAccessibilityLocalizedString(@"knob.shape.control");
    default:
      CFStringRef v3 = @"knob.control";
LABEL_11:
      v4 = [(TSDKnobAccessibility *)self tsaxParentRepForKnob];
      CFStringRef v5 = [(TSDRepAccessibility *)v4 tsaxKnobLabel];
      if (TSAccessibilityShouldPerformValidationChecks())
      {
        if (!v5)
        {
          int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"No handle label for: %@", v7, v8, v9, v10, v11, (uint64_t)v4))abort(); {
        }
          }
      }
      if (v5) {
        CFStringRef v12 = v5;
      }
      else {
        CFStringRef v12 = &stru_46D7E8;
      }
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v3), v12);
  }
}

- (NSString)tsaxValue
{
  id v2 = [(TSDKnobAccessibility *)self tsaxCreateKnobTracker];

  return (NSString *)[v2 tsaxHUDDisplayString];
}

- (CALayer)tsaxLayer
{
  char v5 = 0;
  CFStringRef v3 = (objc_class *)objc_opt_class();
  result = (CALayer *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDKnobAccessibility *)self tsaxValueForKey:@"layer"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (unint64_t)tsaxKnobTag
{
  return (unint64_t)[(TSDKnobAccessibility *)self tsaxUnsignedIntegerValueForKey:@"tag"];
}

- (TSDRepAccessibility)tsaxParentRepForKnob
{
  char v5 = 0;
  CFStringRef v3 = objc_opt_class();
  result = (TSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDKnobAccessibility *)self tsaxValueForKey:@"mRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (CGPoint)tsaxPosition
{
  [(TSDKnobAccessibility *)self tsaxCGPointValueForKey:@"position"];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)tsaxFrame
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  char v5 = [(TSDKnobAccessibility *)self tsaxParentRepForKnob];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = [(TSDRepAccessibility *)v5 tsaxCanvasView];
    uint64_t v8 = [(TSDKnobAccessibility *)self tsaxLayer];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = [(TSDCanvasViewAccessibility *)v7 tsaxCanvasLayer];
      [(CALayer *)v9 bounds];
      -[CALayer convertRect:toLayer:](v9, "convertRect:toLayer:", v10);
    }
    else
    {
      [self tsaxValueForKey:@"knobImage" tsaxCGSizeValueForKey:@"size"];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      [(TSDKnobAccessibility *)self tsaxPosition];
      double v22 = v21;
      double v24 = v23;
      v30.origin.CGFloat x = CGRectZero.origin.x;
      v30.origin.CGFloat y = y;
      v30.size.double width = v18;
      v30.size.double height = v20;
      double v25 = v22 - CGRectGetWidth(v30) * 0.5;
      v31.origin.CGFloat x = CGRectZero.origin.x;
      v31.origin.CGFloat y = y;
      v31.size.double width = v18;
      v31.size.double height = v20;
      -[TSDRepAccessibility tsaxConvertNaturalPointToUnscaledCanvas:](v6, "tsaxConvertNaturalPointToUnscaledCanvas:", v25, v24 - CGRectGetHeight(v31) * 0.5);
      v32.size.double width = v18;
      v32.size.double height = v20;
      *(CGRect *)&double v11 = CGRectInset(v32, -5.0, -5.0);
    }
    -[TSDCanvasViewAccessibility tsaxFrameFromBounds:](v7, "tsaxFrameFromBounds:", v11, v12, v13, v14);
    CGFloat x = v26;
    CGFloat y = v27;
  }
  else
  {
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  double v28 = x;
  double v29 = y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (id)tsaxCreateKnobTracker
{
  id v3 = [(id)objc_opt_class() tsaxKnobTrackerClass];
  v4 = [(TSDKnobAccessibility *)self tsaxParentRepForKnob];

  return [v3 tsaxKnobTrackerWithRep:v4 knob:self];
}

- (BOOL)tsaxIsAdjustable
{
  return (char *)[(TSDKnobAccessibility *)self tsaxKnobTag] - 1 < (unsigned char *)&dword_8 + 1;
}

- (CGPoint)tsaxCalculatedNextPositionInRepForAdjustable:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSDKnobAccessibility *)self tsaxPosition];
  double v6 = v5;
  double v8 = v7;
  unint64_t v9 = [(TSDKnobAccessibility *)self tsaxKnobTag];
  unint64_t v10 = v9;
  double y = CGPointZero.y;
  unint64_t v12 = v9 - 7;
  if (v9 > 7 || (double x = -1.0, ((1 << v9) & 0x92) == 0))
  {
    double x = CGPointZero.x;
    if (v9 <= 9 && ((1 << v9) & 0x248) != 0) {
      double x = 1.0;
    }
  }
  [tsaxCreateKnobTracker tsaxCurrentBoundsForStandardKnobs];
  double v16 = v15 / v14 * 10.0;
  if (v14 <= 0.0) {
    double v16 = 10.0;
  }
  double v17 = 1.0;
  if (v12 >= 3) {
    double v18 = y;
  }
  else {
    double v18 = 1.0;
  }
  if (v10 - 1 < 3) {
    double v18 = -1.0;
  }
  if (!v3) {
    double v17 = -1.0;
  }
  double v19 = v6 + v17 * x * 10.0;
  double v20 = v8 + v17 * v18 * v16;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (BOOL)tsaxAllowsHUDWhileResizing
{
  return 0;
}

@end