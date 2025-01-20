@interface CRLCanvasKnobAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
+ (int)crlaxEdgePositionTypeFromNormalizedPosition:(CGPoint)a3;
- (BOOL)crlaxActivateButton;
- (BOOL)crlaxAdjustmentResizesShape;
- (BOOL)crlaxAllowsHUDWhileResizing;
- (BOOL)crlaxCanSnapKnobToConnectionMagnetAtUnscaledCanvasPoint:(CGPoint)a3;
- (BOOL)crlaxEverOffersCustomActionsForMovement;
- (BOOL)crlaxIs3DObjectPlayPauseKnob;
- (BOOL)crlaxIs3DReorientationKnob;
- (BOOL)crlaxIsAdjustable;
- (BOOL)crlaxIsButton;
- (BOOL)crlaxIsConnectionLineCreationKnob;
- (BOOL)crlaxIsConnectionLineEndpointHandleWithConnection;
- (BOOL)crlaxIsConnectionLineEndpointKnob;
- (BOOL)crlaxIsShapeControlKnob;
- (BOOL)crlaxIsSupported;
- (BOOL)crlaxOffersCustomActionsForMovement;
- (BOOL)crlaxUseFallbackFrameCalculation;
- (CALayer)crlaxLayer;
- (CGPoint)_crlaxSnappedValueIfApplicableFromUnscaledCanvasPosition:(CGPoint)a3;
- (CGPoint)crlaxCalculatedNextPositionInRepForAdjustable:(BOOL)a3;
- (CGPoint)crlaxPosition;
- (CGPoint)crlaxPositionInUnscaledCanvas;
- (CGRect)crlaxFrame;
- (CGSize)crlaxSize;
- (CRLCanvasRepAccessibility)crlaxParentRepForKnob;
- (Class)_crlaxKnobTrackerClass;
- (NSArray)crlaxUserInputLabels;
- (NSString)crlaxHint;
- (NSString)crlaxIdentifier;
- (NSString)crlaxLabel;
- (NSString)crlaxValue;
- (double)crlaxConnectionLineMagnetSnapRadius;
- (double)crlaxCurrentGridSnapDistance;
- (double)crlaxIncrementDecrementMagnitude;
- (id)_connectionLineConnection;
- (id)_connectionLineConnectionDescription;
- (id)_getAccessibleAbsolutePositionOfKnob;
- (id)_getHeadKnobArrowDescriptionForLine;
- (id)_getTailKnobArrowDescriptionForLine;
- (id)_getUserInputLabelForShapeControlKnob;
- (id)_getValueForShapeControlKnob;
- (id)crlaxConnectionKnobMagnetPositionDescription;
- (id)crlaxConnectionLineConnectionCustomEdgeDescription;
- (id)crlaxConnectionLineKnobHint;
- (id)crlaxConnectionLineMagnetDescription;
- (id)crlaxCreateKnobTracker;
- (id)crlaxNameFor3DObjectPlayPauseKnobState;
- (id)crlaxPlatformSpecificHint;
- (id)crlaxSmartPathSourceForShapeControlKnob;
- (id)crlaxUnscaledCanvasPointForSnappingKnobToConnectionMagnetType:(unint64_t)a3;
- (id)getLabelForShapeControlKnob;
- (unint64_t)crlaxConnectionMagnetType;
- (unint64_t)crlaxKnobTag;
- (unint64_t)crlaxNodeIndex;
- (void)crlaxMoveKnobToRepPositionInNaturalSpace:(CGPoint)a3;
- (void)crlaxMoveKnobToRepPositionInNaturalSpace:(CGPoint)a3 shouldSnapToMagnets:(BOOL)a4;
@end

@implementation CRLCanvasKnobAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLCanvasKnob";
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

- (NSString)crlaxLabel
{
  id v3 = 0;
  switch([(CRLCanvasKnobAccessibility *)self crlaxKnobTag])
  {
    case 0uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
      goto LABEL_29;
    case 1uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Upper left %@ handle";
      goto LABEL_27;
    case 2uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Upper middle %@ handle";
      goto LABEL_27;
    case 3uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Upper right %@ handle";
      goto LABEL_27;
    case 4uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Middle left %@ handle";
      goto LABEL_27;
    case 5uLL:
      if (![(CRLCanvasKnobAccessibility *)self crlaxIs3DReorientationKnob])
      {
        if ([(CRLCanvasKnobAccessibility *)self crlaxIs3DObjectPlayPauseKnob])
        {
          v4 = [(CRLCanvasKnobAccessibility *)self crlaxNameFor3DObjectPlayPauseKnobState];
          goto LABEL_46;
        }
        v17 = +[NSBundle mainBundle];
        v18 = v17;
        CFStringRef v19 = @"Middle middle %@ handle";
LABEL_27:
        id v3 = [v17 localizedStringForKey:v19 value:0 table:0];
LABEL_28:

LABEL_29:
        if ([(CRLCanvasKnobAccessibility *)self crlaxIsConnectionLineCreationKnob])
        {
          v32 = +[NSBundle mainBundle];
          v33 = [v32 localizedStringForKey:@"Connection" value:0 table:0];
        }
        else
        {
          v32 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
          v33 = [v32 crlaxKnobLabel];
          if (CRLAccessibilityShouldPerformValidationChecks())
          {
            if (![(__CFString *)v33 length])
            {
              int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
              if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"No handle label for: %@", v35, v36, v37, v38, v39, (uint64_t)v32))LABEL_40:abort(); {
            }
              }
          }
        }

        if (v33) {
          v9 = v33;
        }
        else {
          v9 = &stru_101538650;
        }
        if (!CRLAccessibilityShouldPerformValidationChecks() || v3)
        {
          if (v3)
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v9);
LABEL_43:

            goto LABEL_45;
          }
        }
        else
        {
          int v40 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          if (__CRLAccessibilityHandleValidationErrorWithDescription(v40, 0, @"No label format string for: %@", v41, v42, v43, v44, v45, (uint64_t)self))goto LABEL_40; {
        }
          }
        v4 = 0;
LABEL_45:

        goto LABEL_46;
      }
      v20 = +[NSBundle mainBundle];
      v21 = v20;
      CFStringRef v22 = @"3D rotation";
LABEL_23:
      v4 = [v20 localizedStringForKey:v22 value:0 table:0];

LABEL_46:
      return (NSString *)v4;
    case 6uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Middle right %@ handle";
      goto LABEL_27;
    case 7uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Lower left %@ handle";
      goto LABEL_27;
    case 8uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Lower middle %@ handle";
      goto LABEL_27;
    case 9uLL:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Lower right %@ handle";
      goto LABEL_27;
    case 0xAuLL:
      v18 = +[NSBundle mainBundle];
      v23 = [v18 localizedStringForKey:@"Tail handle" value:0 table:0];
      uint64_t v24 = [(CRLCanvasKnobAccessibility *)self _getTailKnobArrowDescriptionForLine];
      goto LABEL_21;
    case 0xBuLL:
      v18 = +[NSBundle mainBundle];
      v23 = [v18 localizedStringForKey:@"Head handle" value:0 table:0];
      uint64_t v24 = [(CRLCanvasKnobAccessibility *)self _getHeadKnobArrowDescriptionForLine];
LABEL_21:
      v25 = (void *)v24;
      v47 = [(CRLCanvasKnobAccessibility *)self _connectionLineConnectionDescription];
      id v3 = __CRLAccessibilityStringForVariables(1, v23, v26, v27, v28, v29, v30, v31, (uint64_t)v25);

      goto LABEL_28;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
      v4 = [(CRLCanvasKnobAccessibility *)self getLabelForShapeControlKnob];
      if (v4) {
        goto LABEL_46;
      }
      char v48 = 0;
      v5 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
      v6 = [v5 crlaxInfo];

      v7 = objc_opt_class();
      uint64_t v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v6, 1, &v48);
      if (v48) {
        goto LABEL_40;
      }
      v9 = (__CFString *)v8;

      v10 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v12 = +[NSBundle mainBundle];
      v13 = v12;
      if (isKindOfClass) {
        CFStringRef v14 = @"Change %@ handle";
      }
      else {
        CFStringRef v14 = @"Change %@ mask handle";
      }
      id v3 = [v12 localizedStringForKey:v14 value:0 table:0];

      v15 = [(__CFString *)v9 crlaxTypeDescription];
      v16 = [v15 localizedLowercaseString];
      v4 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, v16);

      goto LABEL_43;
    case 0x1CuLL:
      v20 = +[NSBundle mainBundle];
      v21 = v20;
      CFStringRef v22 = @"Link";
      goto LABEL_23;
    default:
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Handle control";
      goto LABEL_27;
  }
}

- (NSString)crlaxValue
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxKnobTag];
  if (v3 > 0x10)
  {
LABEL_7:
    if ([(CRLCanvasKnobAccessibility *)self crlaxIs3DReorientationKnob]
      || [(CRLCanvasKnobAccessibility *)self crlaxIs3DObjectPlayPauseKnob])
    {
      v5 = 0;
    }
    else
    {
      v6 = [(CRLCanvasKnobAccessibility *)self crlaxSmartPathSourceForShapeControlKnob];
      v7 = [(CRLCanvasKnobAccessibility *)self crlaxTarget];
      v5 = [v6 getFeedbackStringForKnob:[v7 tag]];
    }
    goto LABEL_14;
  }
  if (((1 << v3) & 0x3DE) != 0) {
    goto LABEL_3;
  }
  if (((1 << v3) & 0x1F000) != 0)
  {
    uint64_t v4 = [(CRLCanvasKnobAccessibility *)self _getValueForShapeControlKnob];
  }
  else
  {
    if (((1 << v3) & 0xC00) == 0) {
      goto LABEL_7;
    }
    if (![(CRLCanvasKnobAccessibility *)self crlaxIsConnectionLineEndpointHandleWithConnection])
    {
LABEL_3:
      uint64_t v4 = [(CRLCanvasKnobAccessibility *)self _getAccessibleAbsolutePositionOfKnob];
      goto LABEL_6;
    }
    uint64_t v4 = [(CRLCanvasKnobAccessibility *)self crlaxConnectionLineMagnetDescription];
  }
LABEL_6:
  v5 = (void *)v4;
  if (!v4) {
    goto LABEL_7;
  }
LABEL_14:

  return (NSString *)v5;
}

- (NSString)crlaxHint
{
  if ([(CRLCanvasKnobAccessibility *)self crlaxRespondsToSelector:"crlaxPlatformSpecificHint" fromExtrasProtocol:&OBJC_PROTOCOL___CRLCanvasKnobAccessibilityExtras])
  {
    unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxPlatformSpecificHint];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)crlaxUserInputLabels
{
  switch([(CRLCanvasKnobAccessibility *)self crlaxKnobTag])
  {
    case 1uLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Upper left";
      goto LABEL_17;
    case 2uLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Upper middle";
      goto LABEL_17;
    case 3uLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Upper right";
      goto LABEL_17;
    case 4uLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Middle left";
      goto LABEL_17;
    case 5uLL:
      if ([(CRLCanvasKnobAccessibility *)self crlaxIs3DReorientationKnob])
      {
        v5 = +[NSBundle mainBundle];
        v6 = v5;
        CFStringRef v7 = @"Reorient";
LABEL_17:
        uint64_t v4 = [v5 localizedStringForKey:v7 value:0 table:0];

        goto LABEL_18;
      }
      if (![(CRLCanvasKnobAccessibility *)self crlaxIs3DObjectPlayPauseKnob])
      {
        v5 = +[NSBundle mainBundle];
        v6 = v5;
        CFStringRef v7 = @"Middle middle";
        goto LABEL_17;
      }
      uint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxNameFor3DObjectPlayPauseKnobState];
LABEL_3:
      uint64_t v4 = (void *)v3;
LABEL_18:
      if (!v4)
      {
        v9 = [(CRLCanvasKnobAccessibility *)self crlaxLabel];
        v13 = v9;
        v11 = +[NSArray arrayWithObjects:&v13 count:1];
        goto LABEL_22;
      }
      if ([(CRLCanvasKnobAccessibility *)self crlaxIsConnectionLineCreationKnob])
      {
        uint64_t v8 = +[NSBundle mainBundle];
        v9 = [v8 localizedStringForKey:@"%@ connection" value:0 table:0];

        v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v4);
        v15[0] = v10;
        v15[1] = v4;
        v11 = +[NSArray arrayWithObjects:v15 count:2];

LABEL_22:
        goto LABEL_24;
      }
      CFStringRef v14 = v4;
      v11 = +[NSArray arrayWithObjects:&v14 count:1];
LABEL_24:

      return (NSArray *)v11;
    case 6uLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Middle right";
      goto LABEL_17;
    case 7uLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Lower left";
      goto LABEL_17;
    case 8uLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Lower middle";
      goto LABEL_17;
    case 9uLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Lower right";
      goto LABEL_17;
    case 0xAuLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Tail";
      goto LABEL_17;
    case 0xBuLL:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Head";
      goto LABEL_17;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
      uint64_t v3 = [(CRLCanvasKnobAccessibility *)self _getUserInputLabelForShapeControlKnob];
      goto LABEL_3;
    default:
      uint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxLabel];
      goto LABEL_3;
  }
}

- (NSString)crlaxIdentifier
{
  if ((id)[(CRLCanvasKnobAccessibility *)self crlaxKnobTag] == (id)5)
  {
    if ([(CRLCanvasKnobAccessibility *)self crlaxIs3DReorientationKnob])
    {
      CFStringRef v3 = @"USDZ reorient";
    }
    else if ([(CRLCanvasKnobAccessibility *)self crlaxIs3DObjectPlayPauseKnob])
    {
      CFStringRef v3 = @"USDZ play/pause";
    }
    else
    {
      CFStringRef v3 = 0;
    }
  }
  else
  {
    CFStringRef v3 = 0;
  }
  if ([(CRLCanvasKnobAccessibility *)self crlaxIsConnectionLineCreationKnob]) {
    return (NSString *)@"Connection";
  }
  else {
    return &v3->isa;
  }
}

- (CALayer)crlaxLayer
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxTarget];
  CFStringRef v3 = [v2 renderable];
  uint64_t v4 = [v3 layer];

  return (CALayer *)v4;
}

- (unint64_t)crlaxKnobTag
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxTarget];
  id v3 = [v2 tag];

  return (unint64_t)v3;
}

- (CRLCanvasRepAccessibility)crlaxParentRepForKnob
{
  char v8 = 0;
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxTarget];
  id v3 = [v2 rep];

  uint64_t v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLCanvasRepAccessibility *)v6;
}

- (CGPoint)crlaxPosition
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxTarget];
  [v2 position];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)crlaxPositionInUnscaledCanvas
{
  char v14 = 0;
  v2 = self;
  double v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v14);
  if (v14) {
    abort();
  }
  double v5 = (void *)v4;

  double v6 = [(CRLCanvasKnobAccessibility *)v2 crlaxParentRepForKnob];
  double v7 = [v6 crlaxTarget];
  [v5 position];
  [v7 convertKnobPositionToUnscaledCanvas:];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGSize)crlaxSize
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxTarget];
  double v3 = [v2 knobImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)crlaxUseFallbackFrameCalculation
{
  return 0;
}

- (CGRect)crlaxFrame
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  double v5 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  double v6 = v5;
  if (v5)
  {
    double v7 = [v5 crlaxCanvasView];
    double v8 = [(CRLCanvasKnobAccessibility *)self crlaxLayer];
    if ([(CRLCanvasKnobAccessibility *)self crlaxUseFallbackFrameCalculation] || !v8)
    {
      [(CRLCanvasKnobAccessibility *)self crlaxSize];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      [(CRLCanvasKnobAccessibility *)self crlaxPosition];
      double v21 = v20;
      double v23 = v22;
      v41.origin.CGFloat x = CGRectZero.origin.x;
      v41.origin.CGFloat y = y;
      v41.size.double width = v17;
      v41.size.double height = v19;
      double v24 = v21 - CGRectGetWidth(v41) * 0.5;
      v42.origin.CGFloat x = CGRectZero.origin.x;
      v42.origin.CGFloat y = y;
      v42.size.double width = v17;
      v42.size.double height = v19;
      [v6 crlaxConvertNaturalPointToUnscaledCanvas:v24, v23 - CGRectGetHeight(v42) * 0.5];
      v43.size.double width = v17;
      v43.size.double height = v19;
      CGRect v44 = CGRectInset(v43, -5.0, -5.0);
      double v25 = v44.origin.x;
      double v26 = v44.origin.y;
      double width = v44.size.width;
      double height = v44.size.height;
      double v9 = [v6 crlaxInteractiveCanvasController];
      [v9 crlaxConvertUnscaledToBoundsRect:v25, v26, width, height];
    }
    else
    {
      double v9 = [v7 crlaxCanvasLayer];
      [v8 bounds];
      [v8 convertRect:v9 toLayer:];
    }
    double v29 = v10;
    double v30 = v11;
    double v31 = v12;
    double v32 = v13;

    [v7 crlaxFrameFromBounds:v29, v30, v31, v32];
    CGFloat x = v33;
    CGFloat y = v34;
    CGFloat v14 = v35;
    CGFloat v15 = v36;
  }
  else
  {
    CGFloat v14 = CGRectZero.size.width;
    CGFloat v15 = CGRectZero.size.height;
  }

  double v37 = x;
  double v38 = y;
  double v39 = v14;
  double v40 = v15;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.CGFloat y = v38;
  result.origin.CGFloat x = v37;
  return result;
}

- (unint64_t)crlaxNodeIndex
{
  double v3 = (objc_class *)objc_opt_class();
  double v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)self, 0, 0);
  double v5 = v4;
  if (v4) {
    unint64_t v6 = (unint64_t)[v4 nodeIndex];
  }
  else {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (BOOL)crlaxIsConnectionLineEndpointHandleWithConnection
{
  v2 = [(CRLCanvasKnobAccessibility *)self _connectionLineConnection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)crlaxCreateKnobTracker
{
  BOOL v3 = [(CRLCanvasKnobAccessibility *)self _crlaxKnobTrackerClass];
  double v4 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  double v5 = [(objc_class *)v3 crlaxKnobTrackerWithRep:v4 knob:self];

  return v5;
}

- (void)crlaxMoveKnobToRepPositionInNaturalSpace:(CGPoint)a3 shouldSnapToMagnets:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (!v8)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Couldn't find parent rep for knob: %@", v10, v11, v12, v13, v14, (uint64_t)self))goto LABEL_20; {
    }
      }
  }
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if ([v8 crlaxInReadOnlyMode])
    {
      int v15 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(v15, 0, @"Should not attempt to move a knob in read-only mode.", v16, v17, v18, v19, v20, v37))goto LABEL_20; {
    }
      }
  }
  if (!v8 || ([v8 crlaxIsLocked] & 1) != 0) {
    goto LABEL_19;
  }
  [(CRLCanvasKnobAccessibility *)self crlaxCreateKnobTracker];
  char v46 = 0;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  double v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = __CRLAccessibilityCastAsClass(v22, (uint64_t)v21, 1, &v46);
  if (v46) {
    goto LABEL_20;
  }
  double v24 = (void *)v23;

  if (v24)
  {
    [v24 setSnapEnabled:[v24 isEnqueueingCommandsInRealTime] ^ 1];
    goto LABEL_14;
  }
  char v46 = 0;
  id v25 = v21;
  double v26 = (objc_class *)objc_opt_class();
  uint64_t v27 = __CRLAccessibilityCastAsClass(v26, (uint64_t)v25, 1, &v46);
  if (v46) {
LABEL_20:
  }
    abort();
  uint64_t v28 = (void *)v27;

  [v28 setSnapEnabled:0];
  [v28 setShouldSnapToMagnets:v4];

LABEL_14:
  [v8 crlaxConvertNaturalPointToUnscaledCanvas:x, y];
  -[CRLCanvasKnobAccessibility _crlaxSnappedValueIfApplicableFromUnscaledCanvasPosition:](self, "_crlaxSnappedValueIfApplicableFromUnscaledCanvasPosition:");
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  double v33 = objc_alloc_init(CRLAccessibilityKnobManipulator);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10009D9D8;
  v38[3] = &unk_1014D1548;
  id v39 = v8;
  BOOL v45 = v24 != 0;
  double v34 = v33;
  double v40 = v34;
  CGRect v41 = self;
  uint64_t v43 = v30;
  uint64_t v44 = v32;
  id v35 = v21;
  id v42 = v35;
  double v36 = objc_retainBlock(v38);
  if ([(CRLCanvasKnobAccessibility *)self crlaxRespondsToSelector:"crlaxAllowsHUDWhileResizing" fromExtrasProtocol:&OBJC_PROTOCOL___CRLCanvasKnobAccessibilityExtras]&& [(CRLCanvasKnobAccessibility *)self crlaxAllowsHUDWhileResizing])
  {
    ((void (*)(void *))v36[2])(v36);
  }
  else
  {
    [v35 crlaxPerformBlockWhilePreventingDisplayOfCurrentValueHUD:v36];
  }

LABEL_19:
}

- (void)crlaxMoveKnobToRepPositionInNaturalSpace:(CGPoint)a3
{
}

- (id)crlaxSmartPathSourceForShapeControlKnob
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  BOOL v3 = [v2 crlaxInfo];

  if (objc_opt_respondsToSelector())
  {
    char v9 = 0;
    BOOL v4 = [v3 pathSource];
    double v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = __CRLAccessibilityCastAsClassAndProtocol(v5, (Protocol *)&OBJC_PROTOCOL___CRLSmartPathSource, v4, 1, &v9);
    if (v9) {
      abort();
    }
    double v7 = (void *)v6;
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (BOOL)crlaxEverOffersCustomActionsForMovement
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxKnobTag];
  if (v3 - 12 >= 5)
  {
    if (v3 - 10 > 1)
    {
      unsigned __int8 isKindOfClass = 0;
      return isKindOfClass & 1;
    }
    BOOL v4 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
    uint64_t v6 = [v4 crlaxTarget];
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    BOOL v4 = [(CRLCanvasKnobAccessibility *)self crlaxSmartPathSourceForShapeControlKnob];
    unsigned __int8 isKindOfClass = [v4 crlaxOffersMoveActionsForKnobTag:[self crlaxKnobTag]];
  }

  return isKindOfClass & 1;
}

- (BOOL)crlaxOffersCustomActionsForMovement
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  if ([v3 crlaxInReadOnlyMode])
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
    if ([v5 crlaxIsLocked]) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = [(CRLCanvasKnobAccessibility *)self crlaxEverOffersCustomActionsForMovement];
    }
  }
  return v4;
}

- (BOOL)crlaxAdjustmentResizesShape
{
  return (char *)[(CRLCanvasKnobAccessibility *)self crlaxKnobTag] - 1 < (char *)0xB;
}

- (BOOL)crlaxIsShapeControlKnob
{
  return (char *)[(CRLCanvasKnobAccessibility *)self crlaxKnobTag] - 12 < (char *)5;
}

- (BOOL)crlaxIsConnectionLineCreationKnob
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxTarget];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)crlaxIsConnectionLineEndpointKnob
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0
    && ((id)[(CRLCanvasKnobAccessibility *)self crlaxKnobTag] == (id)10
     || (id)[(CRLCanvasKnobAccessibility *)self crlaxKnobTag] == (id)11);

  return v4;
}

- (BOOL)crlaxIs3DReorientationKnob
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxTarget];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)crlaxIs3DObjectPlayPauseKnob
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxTarget];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)crlaxConnectionMagnetType
{
  char v13 = 0;
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  BOOL v4 = [v3 crlaxLayout];
  double v5 = [v4 crlaxTarget];

  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v13);
  if (v13) {
    abort();
  }
  double v8 = (void *)v7;

  unint64_t v9 = [(CRLCanvasKnobAccessibility *)self crlaxKnobTag];
  if (v9 == 11)
  {
    id v10 = [v8 headMagnetType];
  }
  else
  {
    if (v9 != 10)
    {
      unint64_t v11 = 0;
      goto LABEL_8;
    }
    id v10 = [v8 tailMagnetType];
  }
  unint64_t v11 = (unint64_t)v10;
LABEL_8:

  return v11;
}

- (id)crlaxUnscaledCanvasPointForSnappingKnobToConnectionMagnetType:(unint64_t)a3
{
  BOOL v4 = [(CRLCanvasKnobAccessibility *)self _connectionLineConnection];
  double v5 = v4;
  if (v4)
  {
    [v4 getCardinalPositionFromType:a3];
    uint64_t v6 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)crlaxCanSnapKnobToConnectionMagnetAtUnscaledCanvasPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CRLCanvasKnobAccessibility *)self _connectionLineConnection];
  char v51 = 0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v6, 1, &v51);
  if (v51) {
    goto LABEL_31;
  }
  unint64_t v9 = (void *)v8;

  BOOL v45 = [v9 children];

  if (v6)
  {
    id v10 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
    unint64_t v11 = [v10 crlaxInteractiveCanvasController];
    uint64_t v12 = [v11 crlaxTarget];

    char v13 = [v12 canvas];
    [v13 visibleUnscaledRectForClippingReps];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v55.origin.CGFloat x = v15;
    v55.origin.CGFloat y = v17;
    v55.size.double width = v19;
    v55.size.double height = v21;
    v53.CGFloat x = x;
    v53.CGFloat y = y;
    if (!CGRectContainsPoint(v55, v53))
    {
      BOOL v42 = 0;
LABEL_29:

      goto LABEL_30;
    }
    double v22 = [v12 canvas];
    uint64_t v23 = [v22 allRepsOrdered];

    char v51 = 0;
    double v24 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
    id v25 = (objc_class *)objc_opt_class();
    char v46 = __CRLAccessibilityCastAsClass(v25, (uint64_t)v24, 1, &v51);
    if (!v51)
    {

      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v26 = v23;
      id v27 = [v26 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v44 = v12;
        BOOL v29 = 0;
        uint64_t v30 = *(void *)v48;
        while (2)
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v48 != v30) {
              objc_enumerationMutation(v26);
            }
            uint64_t v32 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            uint64_t v33 = [v32 layout:v44];
            double v34 = (void *)v33;
            if ((id)v33 == v6)
            {
              BOOL v29 = 1;
            }
            else
            {
              BOOL v35 = !v29;
              BOOL v29 = v33 == (void)v6;
              if (!v35)
              {
                char v51 = 0;
                id v36 = v32;
                uint64_t v37 = objc_opt_class();
                uint64_t v38 = __CRLAccessibilityCastAsSafeCategory(v37, (uint64_t)v36, 1, &v51);
                if (v51) {
                  goto LABEL_31;
                }
                id v39 = (void *)v38;

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  && ([v39 crlaxIsContainedTextRep] & 1) == 0)
                {
                  if ([v46 canConnectToRep:v36])
                  {
                    if (([v45 containsObject:v34] & 1) == 0)
                    {
                      [(CRLCanvasKnobAccessibility *)self crlaxConnectionLineMagnetSnapRadius];
                      double v41 = v40;
                      [v39 crlaxFrameInUnscaledCanvas];
                      CGRect v57 = CGRectInset(v56, -v41, -v41);
                      v54.CGFloat x = x;
                      v54.CGFloat y = y;
                      if (CGRectContainsPoint(v57, v54))
                      {

                        BOOL v42 = 0;
                        goto LABEL_27;
                      }
                    }
                  }
                }

                BOOL v29 = 1;
              }
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v47 objects:v52 count:16];
          if (v28) {
            continue;
          }
          break;
        }
        BOOL v42 = 1;
LABEL_27:
        uint64_t v12 = v44;
      }
      else
      {
        BOOL v42 = 1;
      }

      goto LABEL_29;
    }
LABEL_31:
    abort();
  }
  BOOL v42 = 1;
LABEL_30:

  return v42;
}

- (double)crlaxCurrentGridSnapDistance
{
  double v3 = 0.0;
  if (+[CRLCanvasGuideController shouldSnapToGrid]
    && ![(CRLCanvasKnobAccessibility *)self crlaxIsConnectionLineEndpointHandleWithConnection])
  {
    BOOL v4 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
    double v5 = [v4 crlaxCanvas];
    id v6 = [v5 crlaxTarget];
    uint64_t v7 = [v6 canvasController];
    uint64_t v8 = [v7 guideController];

    if (v8)
    {
      [v8 snapDistanceToUseForGuides];
      double v3 = v9;
    }
  }
  return v3;
}

- (double)crlaxConnectionLineMagnetSnapRadius
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  double v3 = [v2 crlaxCanvas];
  [v3 crlaxViewScale];
  +[CRLConnectionLineKnobTracker crlaxConnectionLineMagnetSnapRadiusForCanvasViewScale:](CRLConnectionLineKnobTracker, "crlaxConnectionLineMagnetSnapRadiusForCanvasViewScale:");
  double v5 = v4;

  return v5;
}

- (id)crlaxConnectionKnobMagnetPositionDescription
{
  switch([(CRLCanvasKnobAccessibility *)self crlaxConnectionMagnetType])
  {
    case 0uLL:
    case 7uLL:
      uint64_t v3 = [(CRLCanvasKnobAccessibility *)self _getAccessibleAbsolutePositionOfKnob];
      goto LABEL_11;
    case 1uLL:
      double v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"center";
      goto LABEL_9;
    case 2uLL:
      double v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"top";
      goto LABEL_9;
    case 3uLL:
      double v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"right";
      goto LABEL_9;
    case 4uLL:
      double v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"bottom";
      goto LABEL_9;
    case 5uLL:
      double v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"left";
LABEL_9:
      double v4 = [v5 localizedStringForKey:v7 value:0 table:0];

      break;
    case 6uLL:
      uint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxConnectionLineConnectionCustomEdgeDescription];
LABEL_11:
      double v4 = (void *)v3;
      break;
    default:
      double v4 = 0;
      break;
  }

  return v4;
}

+ (int)crlaxEdgePositionTypeFromNormalizedPosition:(CGPoint)a3
{
  BOOL v3 = a3.y == 0.0;
  if (fabs(a3.y) < 0.05) {
    BOOL v3 = 1;
  }
  BOOL v4 = fabs(a3.y + -1.0) < 0.05 || a3.y == 1.0;
  BOOL v5 = a3.x != 0.0;
  if (fabs(a3.x) < 0.05) {
    BOOL v5 = 0;
  }
  BOOL v6 = a3.x != 1.0;
  if (fabs(a3.x + -1.0) < 0.05) {
    BOOL v6 = 0;
  }
  if (v3 && !v5) {
    return 1;
  }
  if (v3 && !v6) {
    return 2;
  }
  if (v4 && !v5) {
    return 3;
  }
  BOOL v8 = v3 || v4;
  if (v3) {
    int v9 = 5;
  }
  else {
    int v9 = 6;
  }
  if (v4 && !v6) {
    int result = 4;
  }
  else {
    int result = v9;
  }
  if (!v8)
  {
    if (v6) {
      int v10 = 0;
    }
    else {
      int v10 = 8;
    }
    if (v5) {
      return v10;
    }
    else {
      return 7;
    }
  }
  return result;
}

- (Class)_crlaxKnobTrackerClass
{
  if (![(CRLCanvasKnobAccessibility *)self crlaxIsConnectionLineCreationKnob])
  {
    unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxKnobTag];
    if (v3 - 12 >= 5 && v3 - 10 <= 1)
    {
      BOOL v4 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
  }
  BOOL v5 = objc_opt_class();

  return (Class)v5;
}

- (id)getLabelForShapeControlKnob
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxSmartPathSourceForShapeControlKnob];
  char v19 = 0;
  BOOL v4 = self;
  BOOL v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v19);
  if (v19) {
    abort();
  }
  CFStringRef v7 = (void *)v6;

  BOOL v8 = [v3 crlaxLabelComponentForKnobTag:[v7 tag]];
  if (v8)
  {
    int v9 = +[NSBundle mainBundle];
    int v10 = [v9 localizedStringForKey:@"Control knob" value:0 table:0];
    CGFloat v17 = __CRLAccessibilityStringForVariables(1, v8, v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }
  else
  {
    CGFloat v17 = 0;
  }

  return v17;
}

- (id)_getValueForShapeControlKnob
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxSmartPathSourceForShapeControlKnob];
  char v11 = 0;
  BOOL v4 = self;
  BOOL v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v11);
  if (v11) {
    abort();
  }
  CFStringRef v7 = (void *)v6;

  BOOL v8 = [v3 crlaxValueForKnobTag:[v7 tag]];
  if (![v8 length]
    && [(CRLCanvasKnobAccessibility *)v4 crlaxEverOffersCustomActionsForMovement])
  {
    uint64_t v9 = [(CRLCanvasKnobAccessibility *)v4 _getAccessibleAbsolutePositionOfKnob];

    BOOL v8 = (void *)v9;
  }

  return v8;
}

- (id)_getUserInputLabelForShapeControlKnob
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxSmartPathSourceForShapeControlKnob];
  char v10 = 0;
  BOOL v4 = self;
  BOOL v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v10);
  if (v10) {
    abort();
  }
  CFStringRef v7 = (void *)v6;

  BOOL v8 = [v3 crlaxUserInputLabelForKnobTag:[v7 tag]];

  return v8;
}

- (id)_getTailKnobArrowDescriptionForLine
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  unint64_t v3 = [v2 crlaxInfo];

  char v10 = 0;
  BOOL v4 = [v3 crlaxValueForKey:@"tailLineEnd"];
  BOOL v5 = objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v4, 1, &v10);
  if (v10) {
    abort();
  }
  CFStringRef v7 = (void *)v6;

  BOOL v8 = [v7 crlaxStyleInfoDescription];

  return v8;
}

- (id)_getHeadKnobArrowDescriptionForLine
{
  v2 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  unint64_t v3 = [v2 crlaxInfo];

  char v10 = 0;
  BOOL v4 = [v3 crlaxValueForKey:@"headLineEnd"];
  BOOL v5 = objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v4, 1, &v10);
  if (v10) {
    abort();
  }
  CFStringRef v7 = (void *)v6;

  BOOL v8 = [v7 crlaxStyleInfoDescription];

  return v8;
}

- (id)_getAccessibleAbsolutePositionOfKnob
{
  [(CRLCanvasKnobAccessibility *)self crlaxPositionInUnscaledCanvas];
  double v3 = v2;
  double v5 = v4;
  uint64_t v6 = +[NSBundle mainBundle];
  CFStringRef v7 = [v6 localizedStringForKey:@"x: %d, y: %d", 0, 0 value table];

  BOOL v8 = &off_1014C1000;
  float v9 = v3;
  LODWORD(v8) = llroundf(v9);
  float v10 = v5;
  LODWORD(v11) = llroundf(v10);
  uint64_t v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8, v11);

  return v12;
}

- (id)_connectionLineConnection
{
  char v13 = 0;
  double v3 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  double v4 = [v3 crlaxLayout];
  double v5 = [v4 crlaxTarget];

  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v13);
  if (v13) {
    abort();
  }
  BOOL v8 = (void *)v7;

  unint64_t v9 = [(CRLCanvasKnobAccessibility *)self crlaxKnobTag];
  if (v9 == 11)
  {
    uint64_t v10 = [v8 connectedTo];
    goto LABEL_6;
  }
  if (v9 == 10)
  {
    uint64_t v10 = [v8 connectedFrom];
LABEL_6:
    uint64_t v11 = (void *)v10;
    goto LABEL_8;
  }
  uint64_t v11 = 0;
LABEL_8:

  return v11;
}

- (id)_connectionLineConnectionDescription
{
  double v3 = [(CRLCanvasKnobAccessibility *)self _connectionLineConnection];
  double v4 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  double v5 = [v4 crlaxInteractiveCanvasController];
  uint64_t v6 = [v5 crlaxTarget];

  char v20 = 0;
  uint64_t v7 = [v3 info];
  BOOL v8 = [v6 repForInfo:v7];

  unint64_t v9 = objc_opt_class();
  uint64_t v10 = __CRLAccessibilityCastAsSafeCategory(v9, (uint64_t)v8, 1, &v20);
  if (v20) {
    abort();
  }
  uint64_t v11 = (void *)v10;

  uint64_t v12 = [v11 crlaxDescriptionForConnections];

  if (![v12 length]) {
    goto LABEL_6;
  }
  unint64_t v13 = [(CRLCanvasKnobAccessibility *)self crlaxKnobTag];
  if (v13 == 11)
  {
    uint64_t v14 = +[NSBundle mainBundle];
    uint64_t v15 = v14;
    CFStringRef v16 = @"Connected to %@";
    goto LABEL_8;
  }
  if (v13 != 10)
  {
LABEL_6:
    CGFloat v17 = 0;
    goto LABEL_9;
  }
  uint64_t v14 = +[NSBundle mainBundle];
  uint64_t v15 = v14;
  CFStringRef v16 = @"Connected from %@";
LABEL_8:
  double v18 = [v14 localizedStringForKey:v16 value:0 table:0];
  CGFloat v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v12);

LABEL_9:

  return v17;
}

- (id)crlaxConnectionLineMagnetDescription
{
  double v3 = +[NSBundle mainBundle];
  double v4 = [v3 localizedStringForKey:@"Connected at %@" value:0 table:0];

  double v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"Connected on %@" value:0 table:0];

  unint64_t v7 = [(CRLCanvasKnobAccessibility *)self crlaxConnectionMagnetType];
  if (v7 - 2 >= 5)
  {
    if (v7 >= 2)
    {
      uint64_t v10 = 0;
      if (v7 != 7) {
        goto LABEL_9;
      }
      uint64_t v9 = [(CRLCanvasKnobAccessibility *)self _getAccessibleAbsolutePositionOfKnob];
    }
    else
    {
      uint64_t v9 = [(CRLCanvasKnobAccessibility *)self crlaxConnectionKnobMagnetPositionDescription];
    }
    BOOL v8 = (void *)v9;
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v9);
  }
  else
  {
    BOOL v8 = [(CRLCanvasKnobAccessibility *)self crlaxConnectionKnobMagnetPositionDescription];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8);
  uint64_t v10 = };

LABEL_9:

  return v10;
}

- (id)crlaxConnectionLineConnectionCustomEdgeDescription
{
  if ((id)[(CRLCanvasKnobAccessibility *)self crlaxConnectionMagnetType] == (id)6)
  {
    char v17 = 0;
    double v3 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
    double v4 = [v3 crlaxLayout];

    double v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v17);
    if (v17) {
      abort();
    }
    unint64_t v7 = (void *)v6;

    if (!v7) {
      goto LABEL_19;
    }
    if ((id)[(CRLCanvasKnobAccessibility *)self crlaxKnobTag] == (id)11) {
      [v7 headMagnetNormalizedPosition];
    }
    else {
      [v7 tailMagnetNormalizedPosition];
    }
    switch(+[CRLCanvasKnobAccessibility crlaxEdgePositionTypeFromNormalizedPosition:](CRLCanvasKnobAccessibility, "crlaxEdgePositionTypeFromNormalizedPosition:"))
    {
      case 1:
        uint64_t v9 = +[NSBundle mainBundle];
        uint64_t v10 = v9;
        CFStringRef v11 = @"top-left corner";
        break;
      case 2:
        uint64_t v9 = +[NSBundle mainBundle];
        uint64_t v10 = v9;
        CFStringRef v11 = @"top-right corner";
        break;
      case 3:
        uint64_t v9 = +[NSBundle mainBundle];
        uint64_t v10 = v9;
        CFStringRef v11 = @"bottom-left corner";
        break;
      case 4:
        uint64_t v9 = +[NSBundle mainBundle];
        uint64_t v10 = v9;
        CFStringRef v11 = @"bottom-right corner";
        break;
      case 5:
        uint64_t v9 = +[NSBundle mainBundle];
        uint64_t v10 = v9;
        CFStringRef v11 = @"top edge";
        break;
      case 6:
        uint64_t v9 = +[NSBundle mainBundle];
        uint64_t v10 = v9;
        CFStringRef v11 = @"bottom edge";
        break;
      case 7:
        uint64_t v9 = +[NSBundle mainBundle];
        uint64_t v10 = v9;
        CFStringRef v11 = @"left edge";
        break;
      case 8:
        uint64_t v9 = +[NSBundle mainBundle];
        uint64_t v10 = v9;
        CFStringRef v11 = @"right edge";
        break;
      default:
        goto LABEL_19;
    }
    uint64_t v12 = [v9 localizedStringForKey:v11 value:0 table:0];

    if (v12)
    {
      unint64_t v13 = +[NSBundle mainBundle];
      uint64_t v14 = [v13 localizedStringForKey:@"%1$@ at %2$@" value:0 table:0];
      uint64_t v15 = [(CRLCanvasKnobAccessibility *)self _getAccessibleAbsolutePositionOfKnob];
      BOOL v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12, v15);
    }
    else
    {
LABEL_19:
      uint64_t v12 = +[NSBundle mainBundle];
      unint64_t v13 = [v12 localizedStringForKey:@"edge at %@" value:0 table:0];
      uint64_t v14 = [(CRLCanvasKnobAccessibility *)self _getAccessibleAbsolutePositionOfKnob];
      BOOL v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v14);
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)crlaxNameFor3DObjectPlayPauseKnobState
{
  char v12 = 0;
  double v2 = self;
  double v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v12);
  if (v12) {
    abort();
  }
  double v5 = (void *)v4;

  unsigned int v6 = [v5 isPlaying];
  unint64_t v7 = +[NSBundle mainBundle];
  BOOL v8 = v7;
  if (v6) {
    CFStringRef v9 = @"Pause";
  }
  else {
    CFStringRef v9 = @"Play";
  }
  uint64_t v10 = [v7 localizedStringForKey:v9 value:0 table:0];

  return v10;
}

- (CGPoint)_crlaxSnappedValueIfApplicableFromUnscaledCanvasPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvasKnobAccessibility *)self crlaxCurrentGridSnapDistance];
  if (v5 != 0.0)
  {
    double v6 = v5;
    double x = sub_100407E0C(x, v5);
    double y = sub_100407E0C(y, v6);
  }
  double v7 = x;
  double v8 = y;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (BOOL)crlaxIsSupported
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxKnobTag];
  BOOL result = 0;
  if (v3 <= 0x1D)
  {
    if (((1 << v3) & 0x2001FFDE) != 0) {
      return 1;
    }
    if (v3 == 5)
    {
      if ([(CRLCanvasKnobAccessibility *)self crlaxIs3DReorientationKnob]) {
        return 1;
      }
      return [(CRLCanvasKnobAccessibility *)self crlaxIs3DObjectPlayPauseKnob];
    }
  }
  return result;
}

- (id)crlaxPlatformSpecificHint
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  if ([v3 crlaxInReadOnlyMode])
  {

LABEL_4:
    double v6 = 0;
    goto LABEL_5;
  }
  uint64_t v4 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  unsigned __int8 v5 = [v4 crlaxIsLocked];

  if (v5) {
    goto LABEL_4;
  }
  switch([(CRLCanvasKnobAccessibility *)self crlaxKnobTag])
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      if ([(CRLCanvasKnobAccessibility *)self crlaxIs3DReorientationKnob])
      {
        double v8 = +[NSBundle mainBundle];
        CFStringRef v9 = v8;
        CFStringRef v10 = @"Double tap and hold, then drag to reorient";
      }
      else
      {
        if ([(CRLCanvasKnobAccessibility *)self crlaxIs3DObjectPlayPauseKnob]) {
          goto LABEL_4;
        }
LABEL_14:
        if ([(CRLCanvasKnobAccessibility *)self crlaxIsConnectionLineCreationKnob])
        {
          double v6 = [(CRLCanvasKnobAccessibility *)self crlaxConnectionLineKnobHint];
          break;
        }
        double v8 = +[NSBundle mainBundle];
        CFStringRef v9 = v8;
        CFStringRef v10 = @"Double tap and hold, then drag to resize";
      }
LABEL_22:
      double v6 = [v8 localizedStringForKey:v10 value:0 table:0];

      break;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_14;
    case 0xAuLL:
    case 0xBuLL:
      CFStringRef v11 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
      char v12 = [v11 crlaxTarget];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        unsigned int v14 = [(CRLCanvasKnobAccessibility *)self crlaxIsConnectionLineEndpointHandleWithConnection];
        double v8 = +[NSBundle mainBundle];
        CFStringRef v9 = v8;
        if (v14) {
          CFStringRef v10 = @"Double tap and hold, then drag to reposition and disconnect";
        }
        else {
          CFStringRef v10 = @"Double tap and hold, then drag to reposition and to connect to other items on the board";
        }
      }
      else
      {
        double v8 = +[NSBundle mainBundle];
        CFStringRef v9 = v8;
        CFStringRef v10 = @"Double tap and hold, then drag to reposition";
      }
      goto LABEL_22;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
      if ([(CRLCanvasKnobAccessibility *)self crlaxIsAdjustable]) {
        goto LABEL_4;
      }
      double v8 = +[NSBundle mainBundle];
      CFStringRef v9 = v8;
      CFStringRef v10 = @"Double tap and hold, then drag to change shape";
      goto LABEL_22;
    default:
      goto LABEL_4;
  }
LABEL_5:

  return v6;
}

- (BOOL)crlaxIsButton
{
  return 0;
}

- (BOOL)crlaxActivateButton
{
  return 0;
}

- (BOOL)crlaxIsAdjustable
{
  unint64_t v3 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  if ([v3 crlaxInReadOnlyMode])
  {
  }
  else
  {
    uint64_t v4 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
    unsigned __int8 v5 = [v4 crlaxIsLocked];

    if ((v5 & 1) == 0)
    {
      switch([(CRLCanvasKnobAccessibility *)self crlaxKnobTag])
      {
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
          unsigned __int8 v8 = [(CRLCanvasKnobAccessibility *)self crlaxIsConnectionLineCreationKnob];
          goto LABEL_9;
        case 5uLL:
          if ([(CRLCanvasKnobAccessibility *)self crlaxIs3DReorientationKnob]) {
            break;
          }
          unsigned __int8 v8 = [(CRLCanvasKnobAccessibility *)self crlaxIs3DObjectPlayPauseKnob];
LABEL_9:
          char v6 = v8 ^ 1;
          return v6 & 1;
        case 0xAuLL:
        case 0xBuLL:
          CFStringRef v11 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
          char v12 = [v11 crlaxTarget];
          objc_opt_class();
          char v6 = objc_opt_isKindOfClass() ^ 1;

          return v6 & 1;
        case 0xCuLL:
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
          CFStringRef v9 = [(CRLCanvasKnobAccessibility *)self crlaxSmartPathSourceForShapeControlKnob];
          unsigned __int8 v10 = [v9 crlaxIsAdjustableForKnobTag:[self crlaxKnobTag]];

          return v10;
        default:
          break;
      }
    }
  }
  char v6 = 0;
  return v6 & 1;
}

- (CGPoint)crlaxCalculatedNextPositionInRepForAdjustable:(BOOL)a3
{
  BOOL v3 = a3;
  [(CRLCanvasKnobAccessibility *)self crlaxPosition];
  double v6 = v5;
  double v8 = v7;
  unint64_t v9 = [(CRLCanvasKnobAccessibility *)self crlaxKnobTag];
  unint64_t v10 = v9;
  unint64_t v11 = v9 - 1;
  if (v9 - 1 >= 0xA || (double v12 = -1.0, ((0x249u >> v11) & 1) == 0))
  {
    double x = 1.0;
    if (((0x149u >> (v9 - 3)) & 1) == 0) {
      double x = CGPointZero.x;
    }
    if (v9 - 3 >= 9) {
      double v12 = CGPointZero.x;
    }
    else {
      double v12 = x;
    }
  }
  double y = CGPointZero.y;
  uint64_t v15 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  CFStringRef v16 = [v15 crlaxTarget];
  [v16 boundsForStandardKnobs];
  double v18 = v17;
  double v20 = v19;

  [(CRLCanvasKnobAccessibility *)self crlaxIncrementDecrementMagnitude];
  double v22 = v21;
  double v23 = v21;
  if (v18 > 0.0)
  {
    double v23 = v21 * (v20 / v18);
    [(CRLCanvasKnobAccessibility *)self crlaxCurrentGridSnapDistance];
    if (v24 != 0.0) {
      double v23 = fmax(v23, v24);
    }
  }
  double v25 = 1.0;
  if (v10 - 7 >= 3) {
    double v26 = y;
  }
  else {
    double v26 = 1.0;
  }
  if (v11 < 3) {
    double v26 = -1.0;
  }
  if (!v3) {
    double v25 = -1.0;
  }
  double v27 = v25 * v26 * v23;
  double v28 = v6 + v25 * v12 * v22;
  double v29 = v8 + v27;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (double)crlaxIncrementDecrementMagnitude
{
  [(CRLCanvasKnobAccessibility *)self crlaxCurrentGridSnapDistance];
  if (result == 0.0) {
    return 10.0;
  }
  return result;
}

- (BOOL)crlaxAllowsHUDWhileResizing
{
  return 0;
}

- (id)crlaxConnectionLineKnobHint
{
  BOOL v3 = objc_opt_new();
  uint64_t v4 = [(CRLCanvasKnobAccessibility *)self crlaxParentRepForKnob];
  unsigned int v5 = [v4 crlaxHasAvailableRepsForConnecting];

  if (v5)
  {
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"Use the Add Connections rotor to make connections to existing board items." value:0 table:0];
    [v3 addObject:v7];
  }
  double v8 = +[NSBundle mainBundle];
  unint64_t v9 = [v8 localizedStringForKey:@"Double tap and hold, then drag to insert a new connected shape", 0, 0 value table];
  v15[0] = v9;
  unint64_t v10 = +[NSBundle mainBundle];
  unint64_t v11 = [v10 localizedStringForKey:@"Double tap and hold, then drag to another item on the board to connect the two items", 0, 0 value table];
  v15[1] = v11;
  double v12 = +[NSArray arrayWithObjects:v15 count:2];
  [v3 addObjectsFromArray:v12];

  unint64_t v13 = [v3 componentsJoinedByString:@", "];

  return v13;
}

@end