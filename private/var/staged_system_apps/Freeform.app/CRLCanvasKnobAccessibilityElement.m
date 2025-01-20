@interface CRLCanvasKnobAccessibilityElement
+ (id)_connectionActionMidpointsFromBoundaries:(id)a3;
+ (id)_disconnectionActionTestValuesFromBoundaries:(id)a3 withCanvasSnapRadius:(double)a4;
+ (id)actionNameForInsertConnectedDuplicateFromParentWithText:(BOOL)a3;
+ (id)crlaxSortKnobElements:(id)a3;
+ (int)_crlaxCategoryRankForKnobElement:(id)a3;
+ (void)_addBoundariesFromRect:(CGRect)a3 toXBoundarySet:(id)a4 andYBoundarySet:(id)a5;
- (BOOL)_accessibilityShouldIncludeParentCustomActions;
- (BOOL)_accessibilityShouldIncludeParentCustomContent;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_isValidToDecrementTag:(unint64_t)a3 toNextPosition:(CGPoint)a4;
- (BOOL)accessibilityActivate;
- (BOOL)disconnectConnectedConnectionLineEndIfNecessary;
- (BOOL)i_crlaxEnsureReciprocalConnectionsAfterConnectingConnectionLineToRep:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isEqualToKnob:(id)a3;
- (BOOL)isOnShapeWithText;
- (CGPoint)_targetUnscaledCanvasPointForConnectionActionByActionTemplate:(id)a3;
- (CGPoint)crlaxKnobPositionAdjustedByDistance:(double)a3 inDirection:(int)a4;
- (CGRect)accessibilityFrame;
- (CRLCanvasKnobAccessibility)knob;
- (CRLCanvasKnobAccessibilityElement)initWithAccessibilityParent:(id)a3;
- (CRLCanvasKnobAccessibilityElement)initWithKnobTag:(unint64_t)a3 nodeIndex:(unint64_t)a4 parentRep:(id)a5 identifier:(id)a6;
- (CRLCanvasRepAccessibility)parentRep;
- (NSString)crlaxIdentifier;
- (double)crlaxMoveActionOffsetDistance;
- (id)_actionToDisconnectConnectionLineFromRep;
- (id)_crlaxSmartPathSourceForAdjustment;
- (id)_layoutsForConnectionActionNames;
- (id)_makeInitialConnectionActionsTemplates;
- (id)_targetUnscaledCanvasPointsForConnectionActionsByRepForConnectingFromActionTemplates:(id)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)makeCustomActionsForConnectingToNearbyElements;
- (id)makeCustomActionsForMagnetSnapping;
- (id)newActionWithName:(id)a3 toConnectToRep:(id)a4 byDraggingToPoint:(CGPoint)a5;
- (id)newActionWithName:(id)a3 toSnapToMagnet:(unint64_t)a4 usingUnscaledCanvasPoint:(CGPoint)a5;
- (unint64_t)accessibilityTraits;
- (unint64_t)knobNodeIndex;
- (unint64_t)knobTag;
- (void)_performAccessibilityIncrementDecrementForControlKnob:(BOOL)a3;
- (void)_trackRepOcclusionsWithConnectionActionTemplates:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)accessibilityIncrement;
- (void)setCrlaxIdentifier:(id)a3;
- (void)setKnobNodeIndex:(unint64_t)a3;
- (void)setKnobTag:(unint64_t)a3;
- (void)setParentRep:(id)a3;
@end

@implementation CRLCanvasKnobAccessibilityElement

- (BOOL)isAccessibilityElement
{
  v3 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  v4 = [v3 crlaxInteractiveCanvasController];

  v5 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  if (![v5 crlaxIsSupported])
  {
    BOOL v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v6 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  v7 = [v6 crlaxCanvasViewController];
  if ([v7 crlaxIsInEyeDropperMode])
  {

    BOOL v8 = 0;
LABEL_8:

    goto LABEL_9;
  }
  unsigned __int8 v9 = [v4 crlaxDocumentIsSharedReadOnly];

  if ((v9 & 1) == 0)
  {
    v5 = [(CRLCanvasKnobAccessibilityElement *)self knob];
    v6 = [v5 crlaxLayer];
    [v6 opacity];
    BOOL v8 = v10 > 0.00000011921;
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (id)accessibilityLabel
{
  v2 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  v3 = [v2 crlaxLabel];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  v3 = [v2 crlaxHint];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  v3 = [v2 crlaxValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v3 = UIAccessibilityTraitNone;
  v4 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  unsigned int v5 = [v4 crlaxIsLocked];

  if (v5)
  {
    v6 = &UIAccessibilityTraitNotEnabled;
LABEL_7:
    v3 |= *v6;
    return v3;
  }
  v7 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned int v8 = [v7 crlaxIsAdjustable];

  if (v8)
  {
    v6 = &UIAccessibilityTraitAdjustable;
    goto LABEL_7;
  }
  unsigned __int8 v9 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned int v10 = [v9 crlaxIsButton];

  if (v10)
  {
    v6 = &UIAccessibilityTraitButton;
    goto LABEL_7;
  }
  return v3;
}

- (CGRect)accessibilityFrame
{
  v2 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  [v2 crlaxFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  v2 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned __int8 v3 = [v2 crlaxIsButton];

  return v3;
}

- (BOOL)accessibilityActivate
{
  unsigned __int8 v3 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned int v4 = [v3 crlaxIsButton];

  if (!v4) {
    return 1;
  }
  double v5 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned __int8 v6 = [v5 crlaxActivateButton];

  return v6;
}

- (void)accessibilityIncrement
{
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    unsigned __int8 v3 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
    unsigned int v4 = [v3 crlaxInReadOnlyMode];

    if (v4)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Trying to increment a knob while in read-only mode. This shouldn't happen.", v6, v7, v8, v9, v10, v11))abort(); {
    }
      }
  }
  id v12 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  if ([v12 crlaxAdjustmentResizesShape])
  {
    [v12 crlaxCalculatedNextPositionInRepForAdjustable:1];
    [v12 crlaxMoveKnobToRepPositionInNaturalSpace:];
    CRLAccessibilityPostLayoutChangedNotification(self);
  }
  else
  {
    [(CRLCanvasKnobAccessibilityElement *)self _performAccessibilityIncrementDecrementForControlKnob:1];
  }
}

- (void)accessibilityDecrement
{
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    unsigned __int8 v3 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
    unsigned int v4 = [v3 crlaxInReadOnlyMode];

    if (v4)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Trying to decrement a knob while in read-only mode. This shouldn't happen.", v6, v7, v8, v9, v10, v15))abort(); {
    }
      }
  }
  id v16 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  if ([v16 crlaxAdjustmentResizesShape])
  {
    [v16 crlaxCalculatedNextPositionInRepForAdjustable:0];
    double v12 = v11;
    double v14 = v13;
    if (-[CRLCanvasKnobAccessibilityElement _isValidToDecrementTag:toNextPosition:](self, "_isValidToDecrementTag:toNextPosition:", [v16 crlaxKnobTag], v11, v13))
    {
      [v16 crlaxMoveKnobToRepPositionInNaturalSpace:v12, v14];
      CRLAccessibilityPostLayoutChangedNotification(self);
    }
  }
  else
  {
    [(CRLCanvasKnobAccessibilityElement *)self _performAccessibilityIncrementDecrementForControlKnob:0];
  }
}

- (id)accessibilityCustomActions
{
  v68.receiver = self;
  v68.super_class = (Class)CRLCanvasKnobAccessibilityElement;
  unsigned __int8 v3 = [(CRLCanvasKnobAccessibilityElement *)&v68 accessibilityCustomActions];
  id v4 = [v3 mutableCopy];

  if (!v4) {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithArray:&__NSArray0__struct];
  }
  v52 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  objc_initWeak(&location, self);
  if ([v52 crlaxOffersCustomActionsForMovement])
  {
    [(CRLCanvasKnobAccessibilityElement *)self crlaxMoveActionOffsetDistance];
    uint64_t v6 = v5;
    id v7 = objc_alloc((Class)UIAccessibilityCustomAction);
    uint64_t v8 = +[NSBundle mainBundle];
    v51 = [v8 localizedStringForKey:@"Move up" value:0 table:0];
    uint64_t v9 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    v50 = +[UIImage systemImageNamed:@"arrow.up.circle.fill" withConfiguration:v9];
    v43 = v8;
    v44 = (void *)v9;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100021C14;
    v64[3] = &unk_1014CBF88;
    id v10 = v52;
    id v65 = v10;
    objc_copyWeak(v66, &location);
    v66[1] = v6;
    id v11 = [v7 initWithName:v51 image:v50 actionHandler:v64];
    v69[0] = v11;
    id v12 = objc_alloc((Class)UIAccessibilityCustomAction);
    double v13 = +[NSBundle mainBundle];
    v49 = [v13 localizedStringForKey:@"Move down" value:0 table:0];
    uint64_t v14 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    v48 = +[UIImage systemImageNamed:@"arrow.down.circle.fill" withConfiguration:v14];
    v41 = v13;
    v42 = (void *)v14;
    v39 = v11;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100021D60;
    v61[3] = &unk_1014CBF88;
    id v15 = v10;
    id v62 = v15;
    objc_copyWeak(v63, &location);
    v63[1] = v6;
    id v16 = [v12 initWithName:v49 image:v48 actionHandler:v61];
    v69[1] = v16;
    id v17 = objc_alloc((Class)UIAccessibilityCustomAction);
    v47 = +[NSBundle mainBundle];
    v46 = [v47 localizedStringForKey:@"Move left" value:0 table:0];
    uint64_t v18 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    v45 = +[UIImage systemImageNamed:@"arrow.left.circle.fill" withConfiguration:v18];
    v40 = (void *)v18;
    v38 = v16;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100021EAC;
    v58[3] = &unk_1014CBF88;
    id v19 = v15;
    id v59 = v19;
    objc_copyWeak(v60, &location);
    v60[1] = v6;
    id v20 = [v17 initWithName:v46 image:v45 actionHandler:v58];
    v69[2] = v20;
    id v21 = objc_alloc((Class)UIAccessibilityCustomAction);
    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"Move right" value:0 table:0];
    v24 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    v25 = +[UIImage systemImageNamed:@"arrow.right.circle.fill" withConfiguration:v24];
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100021FF8;
    v55[3] = &unk_1014CBF88;
    id v56 = v19;
    objc_copyWeak(v57, &location);
    v57[1] = v6;
    id v26 = [v21 initWithName:v23 image:v25 actionHandler:v55];
    v69[3] = v26;
    v27 = +[NSArray arrayWithObjects:v69 count:4];
    [v4 addObjectsFromArray:v27];

    objc_destroyWeak(v57);
    objc_destroyWeak(v60);

    objc_destroyWeak(v63);
    objc_destroyWeak(v66);
  }
  if ([v52 crlaxIsConnectionLineCreationKnob])
  {
    id v28 = objc_alloc((Class)UIAccessibilityCustomAction);
    v29 = +[CRLCanvasKnobAccessibilityElement actionNameForInsertConnectedDuplicateFromParentWithText:[(CRLCanvasKnobAccessibilityElement *)self isOnShapeWithText]];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100022144;
    v53[3] = &unk_1014CBFB0;
    objc_copyWeak(&v54, &location);
    v53[4] = self;
    id v30 = [v28 initWithName:v29 actionHandler:v53];
    [v4 addObject:v30];

    objc_destroyWeak(&v54);
  }
  v31 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  if (([v31 crlaxIsLocked] & 1) == 0)
  {
    v32 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
    unsigned __int8 v33 = [v32 crlaxInReadOnlyMode];

    if (v33) {
      goto LABEL_11;
    }
    v34 = [(CRLCanvasKnobAccessibilityElement *)self makeCustomActionsForConnectingToNearbyElements];
    [v4 addObjectsFromArray:v34];

    v35 = [(CRLCanvasKnobAccessibilityElement *)self _actionToDisconnectConnectionLineFromRep];
    [v4 crl_addNonNilObject:v35];

    v31 = [(CRLCanvasKnobAccessibilityElement *)self makeCustomActionsForMagnetSnapping];
    [v4 addObjectsFromArray:v31];
  }

LABEL_11:
  id v36 = [v4 copy];
  objc_destroyWeak(&location);

  return v36;
}

- (id)newActionWithName:(id)a3 toConnectToRep:(id)a4 byDraggingToPoint:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v9 = a3;
  id v10 = a4;
  id v11 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned int v12 = [v11 crlaxIsConnectionLineCreationKnob];

  if (v12)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100022460;
    v30[3] = &unk_1014CBFD8;
    v30[4] = self;
    *(CGFloat *)&v30[5] = x;
    *(CGFloat *)&v30[6] = y;
    id v13 = [objc_alloc((Class)UIAccessibilityCustomAction) initWithName:v9 actionHandler:v30];
    uint64_t v14 = +[NSBundle mainBundle];
    id v15 = [v14 localizedStringForKey:@"Add Connections" value:0 table:0];
    [v13 setLocalizedActionRotorCategory:v15];
  }
  else
  {
    id v16 = [(CRLCanvasKnobAccessibilityElement *)self knob];
    unsigned int v17 = [v16 crlaxIsConnectionLineEndpointKnob];

    if (!v17)
    {
      id v13 = 0;
      goto LABEL_10;
    }
    id v18 = objc_alloc((Class)UIAccessibilityCustomAction);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100022514;
    v26[3] = &unk_1014CC000;
    v26[4] = self;
    CGFloat v28 = x;
    CGFloat v29 = y;
    id v27 = v10;
    id v13 = [v18 initWithName:v9 actionHandler:v26];
    id v19 = [(CRLCanvasKnobAccessibilityElement *)self knob];
    unsigned int v20 = [v19 crlaxIsConnectionLineEndpointHandleWithConnection];
    id v21 = +[NSBundle mainBundle];
    v22 = v21;
    if (v20) {
      CFStringRef v23 = @"Replacement Connections";
    }
    else {
      CFStringRef v23 = @"Available Connections";
    }
    v24 = [v21 localizedStringForKey:v23 value:0 table:0];
    [v13 setLocalizedActionRotorCategory:v24];

    uint64_t v14 = v27;
  }

LABEL_10:
  return v13;
}

- (id)newActionWithName:(id)a3 toSnapToMagnet:(unint64_t)a4 usingUnscaledCanvasPoint:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002268C;
  v13[3] = &unk_1014CBFD8;
  v13[4] = self;
  *(CGFloat *)&v13[5] = x;
  *(CGFloat *)&v13[6] = y;
  id v9 = [objc_alloc((Class)UIAccessibilityCustomAction) initWithName:v8 actionHandler:v13];

  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"Reposition Connection" value:0 table:0];
  [v9 setLocalizedActionRotorCategory:v11];

  return v9;
}

- (void)accessibilityElementDidBecomeFocused
{
  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasKnobAccessibilityElement;
  [(CRLCanvasKnobAccessibilityElement *)&v8 accessibilityElementDidBecomeFocused];
  char v7 = 0;
  unsigned __int8 v3 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v7);
  if (v7) {
    abort();
  }
  uint64_t v6 = (void *)v5;

  if (v6) {
    [v6 setHighlighted:1];
  }
}

- (void)accessibilityElementDidLoseFocus
{
  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasKnobAccessibilityElement;
  [(CRLCanvasKnobAccessibilityElement *)&v8 accessibilityElementDidLoseFocus];
  char v7 = 0;
  unsigned __int8 v3 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v7);
  if (v7) {
    abort();
  }
  uint64_t v6 = (void *)v5;

  if (v6) {
    [v6 setHighlighted:0];
  }
}

- (BOOL)_accessibilityShouldIncludeParentCustomContent
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeParentCustomActions
{
  return 0;
}

- (void)_performAccessibilityIncrementDecrementForControlKnob:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  uint64_t v6 = [v5 crlaxTarget];
  char v7 = [v6 rep];

  objc_super v8 = [(CRLCanvasKnobAccessibilityElement *)self _crlaxSmartPathSourceForAdjustment];
  char v22 = 0;
  id v9 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  id v10 = [v9 crlaxInteractiveCanvasController];

  id v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = __CRLAccessibilityCastAsClass(v11, (uint64_t)v10, 1, &v22);
  if (v22) {
    goto LABEL_6;
  }
  id v13 = (void *)v12;

  char v22 = 0;
  uint64_t v14 = [v7 layout];
  id v15 = objc_opt_class();
  uint64_t v16 = __CRLAccessibilityCastAsSafeCategory(v15, (uint64_t)v14, 1, &v22);
  if (v22) {
LABEL_6:
  }
    abort();
  unsigned int v17 = (void *)v16;

  id v18 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  id v19 = [v17 crlaxCommandForAccessibilityIncrementDecrement:v3 forKnobTag:[v18 crlaxKnobTag] inSmartPathSource:v8];

  if (v19)
  {
    unsigned int v20 = [v13 commandController];
    [v20 enqueueCommand:v19];
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100022A1C;
  v21[3] = &unk_1014CBBB0;
  v21[4] = self;
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v21, 0.5);
}

- (id)_crlaxSmartPathSourceForAdjustment
{
  v2 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  BOOL v3 = [v2 crlaxTarget];
  id v4 = [v3 rep];

  char v23 = 0;
  uint64_t v5 = [v4 layout];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v23);
  if (v23) {
    goto LABEL_11;
  }
  objc_super v8 = (void *)v7;

  if (v8)
  {
    char v22 = 0;
    id v9 = [v8 pathSource];
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = __CRLAccessibilityCastAsClassAndProtocol(v10, (Protocol *)&OBJC_PROTOCOL___CRLSmartPathSource, v9, 1, &v22);
    if (!v22)
    {
      uint64_t v12 = (void *)v11;
      goto LABEL_8;
    }
LABEL_11:
    abort();
  }
  char v21 = 0;
  id v13 = [v4 crlaxValueForKey:@"maskInfo"];
  uint64_t v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = __CRLAccessibilityCastAsClass(v14, (uint64_t)v13, 1, &v21);
  if (v21) {
    goto LABEL_11;
  }
  id v9 = (void *)v15;

  char v20 = 0;
  uint64_t v16 = [v9 pathSource];
  unsigned int v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = __CRLAccessibilityCastAsClassAndProtocol(v17, (Protocol *)&OBJC_PROTOCOL___CRLSmartPathSource, v16, 1, &v20);
  if (v20) {
    goto LABEL_11;
  }
  uint64_t v12 = (void *)v18;

LABEL_8:

  return v12;
}

- (id)_actionToDisconnectConnectionLineFromRep
{
  BOOL v3 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned int v4 = [v3 crlaxIsConnectionLineEndpointHandleWithConnection];

  if (v4)
  {
    uint64_t v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"Disconnect" value:0 table:0];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100022CE8;
    v9[3] = &unk_1014CC028;
    v9[4] = self;
    id v7 = [objc_alloc((Class)UIAccessibilityCustomAction) initWithName:v6 actionHandler:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_isValidToDecrementTag:(unint64_t)a3 toNextPosition:(CGPoint)a4
{
  double x = a4.x;
  uint64_t v6 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  [v6 crlaxPosition];
  double v9 = sub_100064680(v7, v8, x);
  double v11 = v10;

  uint64_t v12 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  [v12 crlaxFrameInUnscaledCanvas];
  sub_100064680(v13, v14, 10.0);

  double v15 = sub_100064070();
  double v19 = fabs(v9);
  double v20 = fabs(v11);

  return sub_1000642DC(v15, v16, v17, v18, v19, v20);
}

+ (id)actionNameForInsertConnectedDuplicateFromParentWithText:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = +[NSBundle mainBundle];
  uint64_t v5 = v4;
  if (v3) {
    CFStringRef v6 = @"Duplicate, excluding text, and connect";
  }
  else {
    CFStringRef v6 = @"Duplicate and connect";
  }
  double v7 = [v4 localizedStringForKey:v6 value:0 table:0];

  return v7;
}

- (CRLCanvasKnobAccessibilityElement)initWithKnobTag:(unint64_t)a3 nodeIndex:(unint64_t)a4 parentRep:(id)a5 identifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CRLCanvasKnobAccessibilityElement;
  uint64_t v12 = [(CRLAccessibilityElement *)&v15 initWithAccessibilityParent:v10];
  double v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_parentRep, v10);
    v13->_knobTag = a3;
    v13->_knobNodeIndedouble x = a4;
    objc_storeStrong((id *)&v13->_crlaxIdentifier, a6);
  }

  return v13;
}

- (CRLCanvasKnobAccessibilityElement)initWithAccessibilityParent:(id)a3
{
  id v4 = a3;
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Use designated initializer!", v6, v7, v8, v9, v10, v13))abort(); {
  }
    }
  id v11 = [(CRLCanvasKnobAccessibilityElement *)self initWithKnobTag:0 nodeIndex:0x7FFFFFFFFFFFFFFFLL parentRep:0 identifier:0];

  return v11;
}

- (id)accessibilityUserInputLabels
{
  v2 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  BOOL v3 = [v2 crlaxUserInputLabels];

  return v3;
}

- (BOOL)isEqualToKnob:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasKnobAccessibilityElement *)self knobTag];
  if (v5 == [v4 crlaxKnobTag]
    && (id v6 = [(CRLCanvasKnobAccessibilityElement *)self knobNodeIndex],
        v6 == [v4 crlaxNodeIndex]))
  {
    uint64_t v7 = [(CRLCanvasKnobAccessibilityElement *)self knob];
    uint64_t v8 = [v7 crlaxIdentifier];
    uint64_t v9 = [v4 crlaxIdentifier];
    id v10 = v8;
    id v11 = v9;
    uint64_t v12 = v11;
    if (v10 == v11)
    {
      unsigned __int8 v13 = 1;
    }
    else
    {
      unsigned __int8 v13 = 0;
      if (v10 && v11) {
        unsigned __int8 v13 = [v10 isEqualToString:v11];
      }
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (CGPoint)crlaxKnobPositionAdjustedByDistance:(double)a3 inDirection:(int)a4
{
  uint64_t v7 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  [v7 crlaxPosition];
  double v9 = v8;
  double v11 = v10;

  switch(a4)
  {
    case 0:
      uint64_t v12 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
      unsigned __int8 v13 = [v12 crlaxLayout];
      double v14 = [v13 crlaxInspectorGeometry];
      [v14 crlaxAngleInRadians];
      double v9 = v9 + sin(v15) * a3;

      double v16 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
      double v17 = [v16 crlaxLayout];
      double v18 = [v17 crlaxInspectorGeometry];
      [v18 crlaxAngleInRadians];
      double v20 = cos(v19);
      goto LABEL_5;
    case 1:
      char v21 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
      char v22 = [v21 crlaxLayout];
      char v23 = [v22 crlaxInspectorGeometry];
      [v23 crlaxAngleInRadians];
      double v9 = v9 - sin(v24) * a3;

      double v16 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
      double v17 = [v16 crlaxLayout];
      double v18 = [v17 crlaxInspectorGeometry];
      [v18 crlaxAngleInRadians];
      double v26 = cos(v25);
      goto LABEL_7;
    case 2:
      id v27 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
      CGFloat v28 = [v27 crlaxLayout];
      CGFloat v29 = [v28 crlaxInspectorGeometry];
      [v29 crlaxAngleInRadians];
      double v9 = v9 - cos(v30) * a3;

      double v16 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
      double v17 = [v16 crlaxLayout];
      double v18 = [v17 crlaxInspectorGeometry];
      [v18 crlaxAngleInRadians];
      double v20 = sin(v31);
LABEL_5:
      double v26 = -v20;
      goto LABEL_7;
    case 3:
      v32 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
      unsigned __int8 v33 = [v32 crlaxLayout];
      v34 = [v33 crlaxInspectorGeometry];
      [v34 crlaxAngleInRadians];
      double v9 = v9 + cos(v35) * a3;

      double v16 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
      double v17 = [v16 crlaxLayout];
      double v18 = [v17 crlaxInspectorGeometry];
      [v18 crlaxAngleInRadians];
      double v26 = sin(v36);
LABEL_7:
      double v11 = v11 + v26 * a3;

      break;
    default:
      break;
  }
  double v37 = v9;
  double v38 = v11;
  result.CGFloat y = v38;
  result.double x = v37;
  return result;
}

- (id)makeCustomActionsForConnectingToNearbyElements
{
  v2 = self;
  BOOL v3 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned int v4 = [v3 crlaxIsConnectionLineCreationKnob];

  id v5 = [(CRLCanvasKnobAccessibilityElement *)v2 knob];
  id v6 = [v5 crlaxIsConnectionLineEndpointKnob];

  unsigned int v91 = v4;
  if ((v4 & 1) == 0 && !v6)
  {
    id v88 = 0;
    goto LABEL_65;
  }
  uint64_t v7 = [(CRLCanvasKnobAccessibilityElement *)v2 _makeInitialConnectionActionsTemplates];
  [(CRLCanvasKnobAccessibilityElement *)v2 _trackRepOcclusionsWithConnectionActionTemplates:v7];
  id v8 = objc_alloc((Class)NSSet);
  double v9 = [(CRLCanvasKnobAccessibilityElement *)v2 _layoutsForConnectionActionNames];
  id v10 = [v8 initWithArray:v9];
  v96 = +[CRLCanvasRepAccessibility crlaxDisambiguatedConnectionDescriptionsForSet:v10];

  v94 = [(CRLCanvasKnobAccessibilityElement *)v2 _targetUnscaledCanvasPointsForConnectionActionsByRepForConnectingFromActionTemplates:v7];
  id v88 = +[NSMutableArray array];
  double v11 = +[NSBundle mainBundle];
  v93 = [v11 localizedStringForKey:@"Connect to %@" value:0 table:0];

  char v105 = 0;
  uint64_t v12 = [(CRLCanvasKnobAccessibilityElement *)v2 parentRep];
  unsigned __int8 v13 = [v12 crlaxInteractiveCanvasController];

  double v14 = (objc_class *)objc_opt_class();
  v89 = __CRLAccessibilityCastAsClass(v14, (uint64_t)v13, 1, &v105);
  if (v105) {
LABEL_68:
  }
    abort();

  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id obj = v7;
  p_superclass = &OBJC_METACLASS___CRLPdfTaggerContext.superclass;
  id v98 = [obj countByEnumeratingWithState:&v101 objects:v106 count:16];
  if (v98)
  {
    uint64_t v97 = *(void *)v102;
    v90 = v2;
    unsigned int v92 = v6;
    do
    {
      for (i = 0; i != v98; i = (char *)i + 1)
      {
        if (*(void *)v102 != v97) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        double v18 = [v17 repAXForConnecting];
        long double v19 = [v18 crlaxTarget];
        double v20 = [v19 layout];

        char v21 = [p_superclass + 404 crlaxBoardItemIDForLayout:v20];
        if (v21)
        {
          v100 = v20;
          char v22 = [v96 objectForKeyedSubscript:v21];
          v99 = v22;
          if (v6)
          {
            unint64_t v23 = (unint64_t)v6;
            char v105 = 0;
            long double v24 = [(CRLCanvasKnobAccessibilityElement *)v2 parentRep];
            long double v25 = [v24 crlaxLayout];

            double v26 = (objc_class *)objc_opt_class();
            uint64_t v27 = __CRLAccessibilityCastAsClass(v26, (uint64_t)v25, 1, &v105);
            if (v105) {
              goto LABEL_68;
            }
            CGFloat v28 = (void *)v27;

            if (v28)
            {
              char v105 = 0;
              CGFloat v29 = [v28 connectedFrom];
              long double v30 = [v89 repForLayout:v29];

              long double v31 = objc_opt_class();
              uint64_t v32 = __CRLAccessibilityCastAsSafeCategory(v31, (uint64_t)v30, 1, &v105);
              if (v105) {
                goto LABEL_68;
              }
              id v33 = (id)v32;

              char v105 = 0;
              v34 = [v28 connectedTo];
              long double v35 = [v89 repForLayout:v34];

              long double v36 = objc_opt_class();
              uint64_t v37 = __CRLAccessibilityCastAsSafeCategory(v36, (uint64_t)v35, 1, &v105);
              if (v105) {
                goto LABEL_68;
              }
              double v38 = (void *)v37;

              uint64_t v39 = [v17 repAXForConnecting];
              if ((id)v39 != v33)
              {
                v40 = (void *)v39;
                v41 = [v17 repAXForConnecting];

                BOOL v42 = v41 == v38;
                unint64_t v23 = v92;
                p_superclass = &OBJC_METACLASS___CRLPdfTaggerContext.superclass;
                char v22 = v99;
                if (!v42) {
                  goto LABEL_18;
                }
LABEL_61:

                id v6 = (id)v23;
                double v20 = v100;
                goto LABEL_62;
              }
              v71 = v33;
LABEL_59:

              goto LABEL_60;
            }
LABEL_18:

            id v6 = (id)v23;
          }
          if (!+[CRLAccessibility isVoiceOverEnabled]
            && !+[CRLAccessibility isSwitchControlEnabled])
          {
            unint64_t v23 = (unint64_t)v6;
            goto LABEL_34;
          }
          if (v91)
          {
            v43 = [(CRLCanvasKnobAccessibilityElement *)v2 parentRep];
            v44 = [v43 crlaxConnectedLayouts];
            unsigned int v45 = [v44 containsObject:v100];

            if (v45)
            {
              v46 = [(CRLCanvasKnobAccessibilityElement *)v2 parentRep];
              id v47 = [v46 clraxNumberOfStrictlyInboundConnectionsFromLayout:v100];

              v48 = [(CRLCanvasKnobAccessibilityElement *)v2 parentRep];
              v49 = (char *)[v48 clraxNumberOfStrictlyOutboundConnectionsToLayout:v100];

              v50 = [(CRLCanvasKnobAccessibilityElement *)v2 parentRep];
              unint64_t v51 = (unint64_t)[v50 clraxNumberOfBidirectionalSingleConnectionsForLayout:v100];
              goto LABEL_39;
            }
LABEL_32:
            unint64_t v51 = 0;
            v49 = 0;
            id v47 = 0;
          }
          else
          {
            if (!v6) {
              goto LABEL_32;
            }
            char v105 = 0;
            v52 = [(CRLCanvasKnobAccessibilityElement *)v2 parentRep];
            v53 = [v52 crlaxLayout];

            id v54 = (objc_class *)objc_opt_class();
            uint64_t v55 = __CRLAccessibilityCastAsClass(v54, (uint64_t)v53, 1, &v105);
            if (v105) {
              goto LABEL_68;
            }
            v50 = (void *)v55;

            if (v50)
            {
              char v105 = 0;
              id v56 = [v50 connectedFrom];
              v57 = [v89 repForLayout:v56];

              v58 = objc_opt_class();
              uint64_t v59 = __CRLAccessibilityCastAsSafeCategory(v58, (uint64_t)v57, 1, &v105);
              if (v105) {
                goto LABEL_68;
              }
              v60 = (void *)v59;

              char v105 = 0;
              v61 = [v50 connectedTo];
              id v62 = [v89 repForLayout:v61];

              v63 = objc_opt_class();
              uint64_t v64 = __CRLAccessibilityCastAsSafeCategory(v63, (uint64_t)v62, 1, &v105);
              if (v105) {
                goto LABEL_68;
              }
              id v65 = (void *)v64;

              v66 = [v60 crlaxConnectedLayouts];
              unsigned __int8 v67 = [v66 containsObject:v100];

              objc_super v68 = v60;
              if ((v67 & 1) != 0
                || ([v65 crlaxConnectedLayouts],
                    v69 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v70 = [v69 containsObject:v100],
                    v69,
                    objc_super v68 = v65,
                    v70))
              {
                id v47 = [v68 clraxNumberOfStrictlyInboundConnectionsFromLayout:v100];
                v49 = (char *)[v68 clraxNumberOfStrictlyOutboundConnectionsToLayout:v100];
                unint64_t v51 = (unint64_t)[v68 clraxNumberOfBidirectionalSingleConnectionsForLayout:v100];
              }
              else
              {
                unint64_t v51 = 0;
                v49 = 0;
                id v47 = 0;
              }
            }
            else
            {
              unint64_t v51 = 0;
              v49 = 0;
              id v47 = 0;
            }
LABEL_39:
          }
          v72 = &v49[(void)v47];
          v73 = &v49[(void)v47 + v51];
          if (!v73)
          {
            CGFloat v28 = 0;
            v2 = v90;
            unint64_t v23 = v92;
            char v22 = v99;
            goto LABEL_55;
          }
          if (v47 != v73 && v72 && v49 != v73)
          {
            v74 = CRLAccessibilityStringsDictKey(@"full.connections.summary");
            +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v74, &v49[(void)v47 + v51], v47, v49, v51);
            goto LABEL_53;
          }
          if (v47 == v73)
          {
            v74 = CRLAccessibilityStringsDictKey(@"inbound.connections.count");
            v84 = (char *)v47;
          }
          else
          {
            if (v49 != v73)
            {
              v2 = v90;
              unint64_t v23 = v92;
              char v22 = v99;
              if (!v72)
              {
                v74 = CRLAccessibilityStringsDictKey(@"bidirectional.connections.count");
                CGFloat v28 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v74, v51);
                goto LABEL_54;
              }
LABEL_34:
              CGFloat v28 = 0;
LABEL_55:
              v75 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v93, v22);
              CFStringRef v85 = @"__CRLAccessibilityStringForVariablesSentinel";
              v71 = __CRLAccessibilityStringForVariables(1, v75, v76, v77, v78, v79, v80, v81, (uint64_t)v28);

              double v38 = [v94 objectForKeyedSubscript:v21];
              if ([v71 length] && v38)
              {
                v82 = [v17 repAXForConnecting];
                [v38 CGPointValue];
                id v33 = -[CRLCanvasKnobAccessibilityElement newActionWithName:toConnectToRep:byDraggingToPoint:](v2, "newActionWithName:toConnectToRep:byDraggingToPoint:", v71, v82);

                if (v33) {
                  [v88 addObject:v33];
                }
                goto LABEL_59;
              }
LABEL_60:

              p_superclass = (__objc2_class **)(&OBJC_METACLASS___CRLPdfTaggerContext + 8);
              goto LABEL_61;
            }
            v74 = CRLAccessibilityStringsDictKey(@"outbound.connections.count");
            v84 = v49;
          }
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v74, v84, v85, v86, v87);
          CGFloat v28 = LABEL_53:;
          v2 = v90;
          unint64_t v23 = v92;
          char v22 = v99;
LABEL_54:

          goto LABEL_55;
        }
LABEL_62:
      }
      id v98 = [obj countByEnumeratingWithState:&v101 objects:v106 count:16];
    }
    while (v98);
  }

LABEL_65:

  return v88;
}

- (BOOL)i_crlaxEnsureReciprocalConnectionsAfterConnectingConnectionLineToRep:(id)a3
{
  id v4 = a3;
  char v39 = 0;
  id v5 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  id v6 = [v5 crlaxLayout];
  uint64_t v7 = [v6 crlaxTarget];

  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v7, 1, &v39);
  if (v39) {
    goto LABEL_15;
  }
  id v10 = (void *)v9;

  if (v10)
  {
    double v11 = [v4 crlaxLayout];
    uint64_t v12 = [v11 crlaxTarget];
    [v12 addConnectedLayout:v10];

    unsigned __int8 v13 = [v10 connectedTo];
    double v14 = [v4 crlaxLayout];
    long double v15 = [v14 crlaxTarget];
    if (v13 == v15)
    {
      BOOL v19 = 1;
    }
    else
    {
      double v16 = [v10 connectedFrom];
      double v17 = [v4 crlaxLayout];
      double v18 = [v17 crlaxTarget];
      BOOL v19 = v16 == v18;
    }
    if (!CRLAccessibilityShouldPerformValidationChecks()
      || v19
      || (int v21 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
          !__CRLAccessibilityHandleValidationErrorWithDescription(v21, 0, @"Unable to connect connection line to rep", v22, v23, v24, v25, v26, v38)))
    {
      uint64_t v27 = [v4 crlaxLayout];
      CGFloat v28 = [v27 crlaxTarget];
      CGFloat v29 = [v28 connectedLayouts];
      unsigned __int8 v30 = [v29 containsObject:v10];

      if (!CRLAccessibilityShouldPerformValidationChecks()
        || (v30 & 1) != 0
        || (int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
            !__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Unable to connect rep back to connection line", v32, v33, v34, v35, v36, v38)))
      {
        BOOL v20 = v19 & v30;
        goto LABEL_14;
      }
    }
LABEL_15:
    abort();
  }
  BOOL v20 = 0;
LABEL_14:

  return v20;
}

- (BOOL)disconnectConnectedConnectionLineEndIfNecessary
{
  BOOL v3 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned int v4 = [v3 crlaxIsConnectionLineEndpointHandleWithConnection];

  if (!v4)
  {
    LOBYTE(v70) = 0;
    return v70;
  }
  char v104 = 0;
  id v5 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  id v6 = [v5 crlaxInteractiveCanvasController];

  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v6, 1, &v104);
  if (v104) {
    abort();
  }
  uint64_t v9 = (void *)v8;

  id v10 = [v9 canvas];
  [v10 visibleUnscaledRectForClippingReps];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  uint64_t v77 = v9;
  BOOL v19 = [v9 canvas];
  BOOL v20 = [v19 allRepsOrdered];
  int v21 = +[NSPredicate predicateWithBlock:&stru_1014EB9C0];
  uint64_t v22 = [v20 filteredArrayUsingPredicate:v21];

  uint64_t v23 = 2 * (void)[v22 count] + 3;
  uint64_t v24 = +[NSMutableSet setWithCapacity:v23];
  uint64_t v25 = +[NSMutableSet setWithCapacity:v23];
  CGFloat v86 = v14;
  CGFloat v87 = v12;
  CGFloat v26 = v16;
  CGFloat v27 = v18;
  +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v24, v25, v12, v14, v16, v18);
  CGFloat v28 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  [v28 crlaxPositionInUnscaledCanvas];
  double v30 = v29;
  double v32 = v31;

  uint64_t v33 = +[NSNumber crl_numberWithCGFloat:v30];
  [v24 addObject:v33];

  uint64_t v34 = +[NSNumber crl_numberWithCGFloat:v32];
  [v25 addObject:v34];

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = v22;
  id v35 = [obj countByEnumeratingWithState:&v100 objects:v108 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v101;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v101 != v37) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v100 + 1) + 8 * i) crlaxFrameInUnscaledCanvas];
        +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v24, v25);
      }
      id v36 = [obj countByEnumeratingWithState:&v100 objects:v108 count:16];
    }
    while (v36);
  }

  char v39 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  [v39 crlaxConnectionLineMagnetSnapRadius];
  uint64_t v76 = v24;
  v40 = +[CRLCanvasKnobAccessibilityElement _disconnectionActionTestValuesFromBoundaries:withCanvasSnapRadius:](CRLCanvasKnobAccessibilityElement, "_disconnectionActionTestValuesFromBoundaries:withCanvasSnapRadius:", v24);

  v41 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  [v41 crlaxConnectionLineMagnetSnapRadius];
  v75 = v25;
  uint64_t v80 = +[CRLCanvasKnobAccessibilityElement _disconnectionActionTestValuesFromBoundaries:withCanvasSnapRadius:](CRLCanvasKnobAccessibilityElement, "_disconnectionActionTestValuesFromBoundaries:withCanvasSnapRadius:", v25);

  v74 = self;
  BOOL v42 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  [v42 crlaxConnectionLineMagnetSnapRadius];
  double v44 = v43;

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v78 = v40;
  id v81 = [v78 countByEnumeratingWithState:&v96 objects:v107 count:16];
  if (!v81)
  {
    double v83 = 1.79769313e308;
    double v84 = 1.79769313e308;
    goto LABEL_48;
  }
  uint64_t v79 = *(void *)v97;
  double v45 = 1.79769313e308;
  double v83 = 1.79769313e308;
  double v84 = 1.79769313e308;
  do
  {
    uint64_t v46 = 0;
    do
    {
      if (*(void *)v97 != v79) {
        objc_enumerationMutation(v78);
      }
      uint64_t v82 = v46;
      id v47 = *(void **)(*((void *)&v96 + 1) + 8 * v46);
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v48 = v80;
      id v49 = [v48 countByEnumeratingWithState:&v92 objects:v106 count:16];
      if (v49)
      {
        id v50 = v49;
        uint64_t v51 = *(void *)v93;
        do
        {
          for (j = 0; j != v50; j = (char *)j + 1)
          {
            if (*(void *)v93 != v51) {
              objc_enumerationMutation(v48);
            }
            v53 = *(void **)(*((void *)&v92 + 1) + 8 * (void)j);
            [v47 crl_CGFloatValue];
            double v55 = v54;
            [v53 crl_CGFloatValue];
            double v57 = v56;
            if (!sub_1000640F4(v55, v56, v30, v32))
            {
              v110.origin.CGFloat y = v86;
              v110.origin.double x = v87;
              v110.size.width = v26;
              v110.size.height = v27;
              v109.double x = v55;
              v109.CGFloat y = v57;
              if (CGRectContainsPoint(v110, v109))
              {
                long long v90 = 0u;
                long long v91 = 0u;
                long long v88 = 0u;
                long long v89 = 0u;
                id v58 = obj;
                id v59 = [v58 countByEnumeratingWithState:&v88 objects:v105 count:16];
                if (!v59)
                {

LABEL_32:
                  double v68 = sub_1000653B4(v55, v57, v30, v32);
                  double v69 = vabdd_f64(v68, v45);
                  if (v68 < v45 && v69 >= 0.00999999978
                    || (v68 == v45 || v69 < 0.00999999978)
                    && (v55 == v30
                     || vabdd_f64(v55, v30) < 0.00999999978
                     || v57 == v32
                     || vabdd_f64(v57, v32) < 0.00999999978))
                  {
                    double v83 = v57;
                    double v84 = v55;
                    double v45 = v68;
                  }
                  continue;
                }
                id v60 = v59;
                char v61 = 0;
                uint64_t v62 = *(void *)v89;
                do
                {
                  for (k = 0; k != v60; k = (char *)k + 1)
                  {
                    if (*(void *)v89 != v62) {
                      objc_enumerationMutation(v58);
                    }
                    [*(id *)(*((void *)&v88 + 1) + 8 * (void)k) crlaxFrameInUnscaledCanvas];
                    v61 |= sub_1000653CC(v55, v57, v64, v65, v66, v67) <= v44;
                  }
                  id v60 = [v58 countByEnumeratingWithState:&v88 objects:v105 count:16];
                }
                while (v60);

                if ((v61 & 1) == 0) {
                  goto LABEL_32;
                }
              }
            }
          }
          id v50 = [v48 countByEnumeratingWithState:&v92 objects:v106 count:16];
        }
        while (v50);
      }

      uint64_t v46 = v82 + 1;
    }
    while ((id)(v82 + 1) != v81);
    id v81 = [v78 countByEnumeratingWithState:&v96 objects:v107 count:16];
  }
  while (v81);
LABEL_48:

  BOOL v70 = v83 != 1.79769313e308 || v84 != 1.79769313e308;
  if (v70)
  {
    v71 = [(CRLCanvasKnobAccessibilityElement *)v74 knob];
    v72 = [(CRLCanvasKnobAccessibilityElement *)v74 parentRep];
    [v72 crlaxConvertNaturalPointFromUnscaledCanvas:v84, v83];
    [v71 crlaxMoveKnobToRepPositionInNaturalSpace:];
  }
  return v70;
}

- (id)makeCustomActionsForMagnetSnapping
{
  BOOL v3 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  unsigned int v4 = [v3 crlaxIsConnectionLineEndpointHandleWithConnection];

  if (v4)
  {
    id v29 = +[NSMutableArray array];
    id v5 = [(CRLCanvasKnobAccessibilityElement *)self knob];
    id v6 = [v5 crlaxConnectionMagnetType];

    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:v6];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = [&off_10155CE78 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(&off_10155CE78);
          }
          double v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v13 = [v7 unsignedIntegerValue];
          if (v13 != [v12 unsignedIntegerValue])
          {
            id v14 = [v12 unsignedIntegerValue];
            double v15 = [(CRLCanvasKnobAccessibilityElement *)self knob];
            double v16 = [v15 crlaxUnscaledCanvasPointForSnappingKnobToConnectionMagnetType:v14];

            if (v16)
            {
              [v16 CGPointValue];
              double v18 = v17;
              double v20 = v19;
              int v21 = [(CRLCanvasKnobAccessibilityElement *)self knob];
              unsigned int v22 = [v21 crlaxCanSnapKnobToConnectionMagnetAtUnscaledCanvasPoint:v18, v20];

              if (v22)
              {
                switch((unint64_t)v14)
                {
                  case 1uLL:
                    uint64_t v23 = +[NSBundle mainBundle];
                    uint64_t v24 = v23;
                    CFStringRef v25 = @"Snap to center";
                    goto LABEL_17;
                  case 2uLL:
                    uint64_t v23 = +[NSBundle mainBundle];
                    uint64_t v24 = v23;
                    CFStringRef v25 = @"Snap to middle of top edge";
                    goto LABEL_17;
                  case 3uLL:
                    uint64_t v23 = +[NSBundle mainBundle];
                    uint64_t v24 = v23;
                    CFStringRef v25 = @"Snap to middle of right edge";
                    goto LABEL_17;
                  case 4uLL:
                    uint64_t v23 = +[NSBundle mainBundle];
                    uint64_t v24 = v23;
                    CFStringRef v25 = @"Snap to middle of bottom edge";
                    goto LABEL_17;
                  case 5uLL:
                    uint64_t v23 = +[NSBundle mainBundle];
                    uint64_t v24 = v23;
                    CFStringRef v25 = @"Snap to middle of left edge";
LABEL_17:
                    CGFloat v26 = [v23 localizedStringForKey:v25 value:0 table:0];

                    break;
                  default:
                    CGFloat v26 = 0;
                    break;
                }
                id v27 = -[CRLCanvasKnobAccessibilityElement newActionWithName:toSnapToMagnet:usingUnscaledCanvasPoint:](self, "newActionWithName:toSnapToMagnet:usingUnscaledCanvasPoint:", v26, v14, v18, v20);
                [v29 crl_addNonNilObject:v27];
              }
            }
          }
        }
        id v9 = [&off_10155CE78 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (CRLCanvasKnobAccessibility)knob
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRep);
  unint64_t knobTag = self->_knobTag;
  knobNodeIndedouble x = self->_knobNodeIndex;
  id v6 = [(CRLCanvasKnobAccessibilityElement *)self crlaxIdentifier];
  uint64_t v7 = [WeakRetained crlaxKnobForTag:knobTag index:knobNodeIndex identifier:v6];

  return (CRLCanvasKnobAccessibility *)v7;
}

- (BOOL)isOnShapeWithText
{
  char v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRep);
  BOOL v3 = objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)WeakRetained, 1, &v11);
  if (v11) {
    abort();
  }
  id v5 = (void *)v4;

  id v6 = [v5 crlaxContainedRep];
  uint64_t v7 = [v6 crlaxStorage];
  id v8 = [v7 crlaxString];
  BOOL v9 = [v8 length] != 0;

  return v9;
}

- (double)crlaxMoveActionOffsetDistance
{
  v2 = [(CRLCanvasKnobAccessibilityElement *)self knob];
  [v2 crlaxCurrentGridSnapDistance];
  double v4 = v3;

  double result = 10.0;
  if (v4 != 0.0) {
    return v4;
  }
  return result;
}

+ (id)crlaxSortKnobElements:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithArray:v3];

  [v4 sortUsingComparator:&stru_1014EBA00];
  id v5 = [v4 copy];

  return v5;
}

+ (int)_crlaxCategoryRankForKnobElement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 knob];
  if ([v4 crlaxIsConnectionLineCreationKnob])
  {
    int v5 = 0;
  }
  else if ([v4 crlaxIs3DObjectPlayPauseKnob])
  {
    int v5 = 1;
  }
  else if ([v4 crlaxIsShapeControlKnob])
  {
    int v5 = 2;
  }
  else if ([v4 crlaxIs3DReorientationKnob])
  {
    int v5 = 4;
  }
  else if ((char *)[v3 knobTag] - 1 >= (char *)0xB)
  {
    int v5 = 3;
  }
  else
  {
    int v5 = 5;
  }

  return v5;
}

- (id)_makeInitialConnectionActionsTemplates
{
  id v3 = +[NSMutableArray array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v4 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  int v5 = [v4 crlaxAvailableRepsForConnecting];

  id v6 = [v5 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v58;
    id v49 = self;
    uint64_t v50 = *(void *)v58;
    id v47 = v3;
    do
    {
      BOOL v9 = 0;
      id v51 = v7;
      do
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v9);
        char v11 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
        double v12 = [v11 crlaxTarget];

        if (v10 != v12)
        {
          char v56 = 0;
          id v13 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
          id v14 = [v13 crlaxLayout];

          double v15 = (objc_class *)objc_opt_class();
          uint64_t v16 = __CRLAccessibilityCastAsClass(v15, (uint64_t)v14, 1, &v56);
          if (v56) {
            goto LABEL_34;
          }
          double v17 = (void *)v16;

          if (v17)
          {
            double v18 = [v17 connectedFrom];
            uint64_t v19 = [v10 layout];
            if (v18 != (void *)v19)
            {
              double v20 = (void *)v19;
              int v21 = [v17 connectedTo];
              unsigned int v22 = [v10 layout];

              BOOL v23 = v21 == v22;
              uint64_t v8 = v50;
              id v7 = v51;
              if (!v23) {
                goto LABEL_11;
              }
LABEL_28:

              goto LABEL_29;
            }
            id v43 = v18;
          }
          else
          {
LABEL_11:
            char v56 = 0;
            id v24 = v10;
            CFStringRef v25 = objc_opt_class();
            uint64_t v26 = __CRLAccessibilityCastAsSafeCategory(v25, (uint64_t)v24, 1, &v56);
            if (v56) {
              goto LABEL_34;
            }
            double v18 = (void *)v26;

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v56 = 0;
              id v27 = v24;
              CGFloat v28 = (objc_class *)objc_opt_class();
              uint64_t v29 = __CRLAccessibilityCastAsClass(v28, (uint64_t)v27, 1, &v56);
              if (v56) {
                goto LABEL_34;
              }
              long long v30 = (void *)v29;

              long long v31 = [v30 allRepsContainedInGroup];

              id v48 = objc_alloc((Class)NSMutableSet);
              char v56 = 0;
              id v32 = v31;
              long long v33 = (objc_class *)objc_opt_class();
              uint64_t v34 = __CRLAccessibilityCastAsClass(v33, (uint64_t)v32, 1, &v56);
              if (v56) {
LABEL_34:
              }
                abort();
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v35 = v34;
              id v36 = [v35 countByEnumeratingWithState:&v52 objects:v62 count:16];
              if (v36)
              {
                id v37 = v36;
                uint64_t v38 = *(void *)v53;
                do
                {
                  for (i = 0; i != v37; i = (char *)i + 1)
                  {
                    if (*(void *)v53 != v38) {
                      objc_enumerationMutation(v35);
                    }
                    uint64_t v40 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                    v41 = objc_opt_class();
                    id v42 = (id)__CRLAccessibilityCastAsSafeCategory(v41, v40, 1, &v56);
                    if (v56) {
                      goto LABEL_34;
                    }
                  }
                  id v37 = [v35 countByEnumeratingWithState:&v52 objects:v62 count:16];
                }
                while (v37);
              }

              id v43 = [v48 initWithArray:v35];
              id v3 = v47;
              uint64_t v8 = v50;
              id v7 = v51;
            }
            else
            {
              id v44 = objc_alloc((Class)NSMutableSet);
              char v61 = v18;
              id v32 = +[NSArray arrayWithObjects:&v61 count:1];
              id v43 = [v44 initWithArray:v32];
            }

            double v45 = [[CRLCanvasConnectionKnobConnectionActionTemplate alloc] initWithRepForConnecting:v18 andRepsForDragging:v43];
            [v3 addObject:v45];

            self = v49;
          }

          goto LABEL_28;
        }
LABEL_29:
        BOOL v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_trackRepOcclusionsWithConnectionActionTemplates:(id)a3
{
  id v4 = a3;
  char v70 = 0;
  int v5 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  id v6 = [v5 crlaxInteractiveCanvasController];

  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v6, 1, &v70);
  if (v70) {
LABEL_35:
  }
    abort();
  BOOL v9 = (void *)v8;

  long long v53 = v9;
  uint64_t v10 = [v9 canvas];
  char v11 = [v10 allRepsOrdered];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v4;
  id v56 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v67;
    p_superclass = &OBJC_METACLASS___CRLPdfTaggerContext.superclass;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v67 != v55) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v66 + 1) + 8 * v13);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        uint64_t v57 = v13;
        long long v58 = v14;
        id v59 = [v14 repAccessibilitiesForDragging];
        id v61 = [v59 countByEnumeratingWithState:&v62 objects:v71 count:16];
        if (v61)
        {
          uint64_t v60 = *(void *)v63;
          do
          {
            for (i = 0; i != v61; i = (char *)i + 1)
            {
              if (*(void *)v63 != v60) {
                objc_enumerationMutation(v59);
              }
              uint64_t v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              double v17 = [v16 crlaxTarget];
              double v18 = [v17 layout];
              uint64_t v19 = [p_superclass + 404 crlaxBoardItemIDForLayout:v18];

              if (v19)
              {
                [v16 crlaxFrameInUnscaledCanvas];
                CGFloat v21 = v20;
                CGFloat v23 = v22;
                CGFloat v25 = v24;
                CGFloat v27 = v26;
                if ([v11 count])
                {
                  unint64_t v28 = 0;
                  while (1)
                  {
                    uint64_t v29 = [v11 objectAtIndexedSubscript:v28];
                    uint64_t v30 = [v16 crlaxTarget];
                    long long v31 = v29;
                    if ((void *)v30 == v29) {
                      goto LABEL_28;
                    }
                    id v32 = (void *)v30;
                    objc_opt_class();
                    char isKindOfClass = objc_opt_isKindOfClass();

                    if ((isKindOfClass & 1) == 0) {
                      break;
                    }
LABEL_29:

                    if (++v28 >= (unint64_t)[v11 count]) {
                      goto LABEL_30;
                    }
                  }
                  char v70 = 0;
                  id v34 = v29;
                  id v35 = objc_opt_class();
                  uint64_t v36 = __CRLAccessibilityCastAsSafeCategory(v35, (uint64_t)v34, 1, &v70);
                  if (v70) {
                    goto LABEL_35;
                  }
                  long long v31 = (void *)v36;

                  if (v31)
                  {
                    if (([v31 crlaxIsContainedTextRep] & 1) == 0)
                    {
                      [v34 frameInUnscaledCanvas];
                      v74.origin.double x = v37;
                      v74.origin.CGFloat y = v38;
                      v74.size.width = v39;
                      v74.size.height = v40;
                      v73.origin.double x = v21;
                      v73.origin.CGFloat y = v23;
                      v73.size.width = v25;
                      v73.size.height = v27;
                      if (CGRectIntersectsRect(v73, v74))
                      {
                        v41 = p_superclass;
                        id v42 = [v16 crlaxTarget];
                        id v43 = [v11 indexOfObject:v42];

                        if (CRLAccessibilityShouldPerformValidationChecks()
                          && v43 == (id)0x7FFFFFFFFFFFFFFFLL)
                        {
                          int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
                          p_superclass = v41;
                          if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Found an occluding rep that had no index within allRepsOrdered", v45, v46, v47, v48, v49, v52))goto LABEL_35; {
                        }
                          }
                        else
                        {
                          p_superclass = v41;
                          if (v43 != (id)0x7FFFFFFFFFFFFFFFLL && (unint64_t)v43 < v28)
                          {
                            uint64_t v50 = [v58 occludingRepAccessibilitiesByUUID];
                            id v51 = [v50 objectForKeyedSubscript:v19];
                            [v51 addObject:v31];

                            p_superclass = v41;
                          }
                        }
                      }
                    }
                  }
LABEL_28:

                  goto LABEL_29;
                }
              }
LABEL_30:
            }
            id v61 = [v59 countByEnumeratingWithState:&v62 objects:v71 count:16];
          }
          while (v61);
        }

        uint64_t v13 = v57 + 1;
      }
      while ((id)(v57 + 1) != v56);
      id v56 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v56);
  }
}

- (id)_targetUnscaledCanvasPointsForConnectionActionsByRepForConnectingFromActionTemplates:(id)a3
{
  id v3 = a3;
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v9 repAXForConnecting:v19];
        char v11 = [v10 crlaxTarget];
        double v12 = [v11 layout];
        uint64_t v13 = +[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:v12];

        if (v13)
        {
          [(CRLCanvasKnobAccessibilityElement *)self _targetUnscaledCanvasPointForConnectionActionByActionTemplate:v9];
          if (v15 != 1.79769313e308 || v14 != 1.79769313e308)
          {
            double v17 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
            [v19 setObject:v17 forKeyedSubscript:v13];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  return v19;
}

- (CGPoint)_targetUnscaledCanvasPointForConnectionActionByActionTemplate:(id)a3
{
  id v6 = a3;
  char v114 = 0;
  long long v90 = self;
  uint64_t v7 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  uint64_t v8 = [v7 crlaxInteractiveCanvasController];

  BOOL v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v8, 1, &v114);
  if (v114) {
    abort();
  }
  char v11 = (void *)v10;

  double v12 = [v11 canvas];
  [v12 visibleUnscaledRectForClippingReps];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id obj = [v6 repAccessibilitiesForDragging];
  id v84 = [obj countByEnumeratingWithState:&v110 objects:v119 count:16];
  if (v84)
  {
    uint64_t v83 = *(void *)v111;
    id v79 = v6;
LABEL_4:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v111 != v83) {
        objc_enumerationMutation(obj);
      }
      long long v22 = *(void **)(*((void *)&v110 + 1) + 8 * v21);
      long long v23 = [v22 crlaxTarget];
      long long v24 = [v23 layout];
      uint64_t v25 = +[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:v24];

      if (v25)
      {
        uint64_t v87 = v21;
        double v26 = [v6 occludingRepAccessibilitiesByUUID];
        CGFloat v27 = [v26 objectForKeyedSubscript:v25];

        unint64_t v28 = [v6 occludingRepAccessibilitiesByUUID];
        CGFloat v86 = (void *)v25;
        uint64_t v29 = [v28 objectForKeyedSubscript:v25];
        uint64_t v30 = 2 * (void)[v29 count] + 4;

        long long v31 = +[NSMutableSet setWithCapacity:v30];
        id v32 = +[NSMutableSet setWithCapacity:v30];
        +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v31, v32, v14, v16, v18, v20);
        [v22 crlaxFrameInUnscaledCanvas];
        +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v31, v32);
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        id v33 = v27;
        id v34 = [v33 countByEnumeratingWithState:&v106 objects:v118 count:16];
        id v35 = v22;
        if (v34)
        {
          id v36 = v34;
          uint64_t v37 = *(void *)v107;
          do
          {
            for (i = 0; i != v36; i = (char *)i + 1)
            {
              if (*(void *)v107 != v37) {
                objc_enumerationMutation(v33);
              }
              [*(id *)(*((void *)&v106 + 1) + 8 * i) crlaxFrameInUnscaledCanvas];
              +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v31, v32);
            }
            id v36 = [v33 countByEnumeratingWithState:&v106 objects:v118 count:16];
          }
          while (v36);
        }

        CGFloat v39 = +[CRLCanvasKnobAccessibilityElement _connectionActionMidpointsFromBoundaries:v31];
        id v40 = [v39 mutableCopy];

        v41 = +[CRLCanvasKnobAccessibilityElement _connectionActionMidpointsFromBoundaries:v32];
        id v42 = [v41 mutableCopy];

        id v43 = [v35 crlaxLayout];
        id v44 = [v43 crlaxTarget];
        int v45 = 1;
        [v44 getCardinalPositionFromType:1];
        double v47 = v46;
        double v49 = v48;

        uint64_t v50 = +[NSNumber crl_numberWithCGFloat:v47];
        [v40 insertObject:v50 atIndex:0];

        id v51 = +[NSNumber crl_numberWithCGFloat:v49];
        long long v88 = v42;
        [v42 insertObject:v51 atIndex:0];

        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v52 = v40;
        id v81 = [v52 countByEnumeratingWithState:&v102 objects:v117 count:16];
        if (v81)
        {
          uint64_t v53 = *(void *)v103;
          CFStringRef v85 = v52;
          uint64_t v80 = *(void *)v103;
          do
          {
            uint64_t v54 = 0;
            do
            {
              if (*(void *)v103 != v53) {
                objc_enumerationMutation(v52);
              }
              uint64_t v82 = v54;
              uint64_t v55 = *(void **)(*((void *)&v102 + 1) + 8 * v54);
              long long v98 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              id v56 = v88;
              id v93 = [v56 countByEnumeratingWithState:&v98 objects:v116 count:16];
              if (v93)
              {
                long long v91 = v56;
                uint64_t v92 = *(void *)v99;
                long long v89 = v55;
                while (2)
                {
                  for (j = 0; j != v93; j = (char *)j + 1)
                  {
                    if (*(void *)v99 != v92) {
                      objc_enumerationMutation(v56);
                    }
                    long long v58 = *(void **)(*((void *)&v98 + 1) + 8 * (void)j);
                    [v55 crl_CGFloatValue];
                    double v3 = v59;
                    [v58 crl_CGFloatValue];
                    double v4 = v60;
                    v124.origin.double x = v14;
                    v124.origin.CGFloat y = v16;
                    v124.size.width = v18;
                    v124.size.height = v20;
                    v121.double x = v3;
                    v121.CGFloat y = v4;
                    if (CGRectContainsPoint(v124, v121))
                    {
                      id v61 = [v35 crlaxInfo];
                      objc_opt_class();
                      char isKindOfClass = objc_opt_isKindOfClass();

                      if (isKindOfClass)
                      {
                        [v35 crlaxFrameInUnscaledCanvas];
                        v122.double x = v3;
                        v122.CGFloat y = v4;
                        if (CGRectContainsPoint(v125, v122)) {
                          goto LABEL_30;
                        }
                      }
                      else if (objc_msgSend(v35, "crlaxBezierPathContainsUnscaledCanvasPoint:", v3, v4))
                      {
LABEL_30:
                        long long v63 = v35;
                        long long v64 = [(CRLCanvasKnobAccessibilityElement *)v90 knob];
                        [v64 crlaxConnectionLineMagnetSnapRadius];
                        double v66 = v65;

                        long long v96 = 0u;
                        long long v97 = 0u;
                        long long v94 = 0u;
                        long long v95 = 0u;
                        id v67 = v33;
                        id v68 = [v67 countByEnumeratingWithState:&v94 objects:v115 count:16];
                        if (v68)
                        {
                          id v69 = v68;
                          uint64_t v70 = *(void *)v95;
                          double v71 = -v66;
                          while (2)
                          {
                            for (k = 0; k != v69; k = (char *)k + 1)
                            {
                              if (*(void *)v95 != v70) {
                                objc_enumerationMutation(v67);
                              }
                              [*(id *)(*((void *)&v94 + 1) + 8 * (void)k) crlaxFrameInUnscaledCanvas];
                              CGRect v127 = CGRectInset(v126, v71, v71);
                              v123.double x = v3;
                              v123.CGFloat y = v4;
                              if (CGRectContainsPoint(v127, v123))
                              {

                                id v35 = v63;
                                id v56 = v91;
                                uint64_t v55 = v89;
                                goto LABEL_40;
                              }
                            }
                            id v69 = [v67 countByEnumeratingWithState:&v94 objects:v115 count:16];
                            if (v69) {
                              continue;
                            }
                            break;
                          }
                        }

                        int v45 = 0;
                        int v73 = 1;
                        id v52 = v85;
                        goto LABEL_47;
                      }
                    }
LABEL_40:
                    ;
                  }
                  id v93 = [v56 countByEnumeratingWithState:&v98 objects:v116 count:16];
                  if (v93) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v54 = v82 + 1;
              id v52 = v85;
              uint64_t v53 = v80;
            }
            while ((id)(v82 + 1) != v81);
            int v73 = 0;
            int v45 = 1;
            id v81 = [v85 countByEnumeratingWithState:&v102 objects:v117 count:16];
          }
          while (v81);
        }
        else
        {
          int v73 = 0;
        }
LABEL_47:

        id v6 = v79;
        uint64_t v21 = v87;
        if (!v45) {
          break;
        }
      }
      if ((id)++v21 == v84)
      {
        id v84 = [obj countByEnumeratingWithState:&v110 objects:v119 count:16];
        if (v84) {
          goto LABEL_4;
        }
        int v73 = 0;
        break;
      }
    }
  }
  else
  {
    int v73 = 0;
  }

  if (v73) {
    double v74 = v4;
  }
  else {
    double v74 = 1.79769313e308;
  }
  if (v73) {
    double v75 = v3;
  }
  else {
    double v75 = 1.79769313e308;
  }

  double v76 = v75;
  double v77 = v74;
  result.CGFloat y = v77;
  result.double x = v76;
  return result;
}

+ (id)_connectionActionMidpointsFromBoundaries:(id)a3
{
  double v3 = [a3 crl_sortedArray];
  double v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v3 count] - 1);
  if ([v3 count] != (id)1)
  {
    id v5 = 0;
    do
    {
      id v6 = [v3 objectAtIndexedSubscript:v5];
      [v6 crl_CGFloatValue];
      double v8 = v7;

      BOOL v9 = [v3 objectAtIndexedSubscript:v5 + 1];
      [v9 crl_CGFloatValue];
      double v11 = v10;

      double v12 = +[NSNumber crl_numberWithCGFloat:(v8 + v11) * 0.5];
      [v4 setObject:v12 atIndexedSubscript:v5];

      ++v5;
    }
    while (v5 < (char *)[v3 count] - 1);
  }

  return v4;
}

+ (id)_disconnectionActionTestValuesFromBoundaries:(id)a3 withCanvasSnapRadius:(double)a4
{
  id v5 = [a3 crl_sortedArray];
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3 * (void)[v5 count]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    double v10 = a4 + 1.0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        double v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v13 crl_CGFloatValue];
        double v15 = v10 + v14;
        double v16 = +[NSNumber crl_numberWithCGFloat:v14 - v10];
        v24[0] = v16;
        v24[1] = v13;
        double v17 = +[NSNumber crl_numberWithCGFloat:v15];
        v24[2] = v17;
        double v18 = +[NSArray arrayWithObjects:v24 count:3];
        [v6 addObjectsFromArray:v18];
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_layoutsForConnectionActionNames
{
  char v21 = 0;
  v2 = [(CRLCanvasKnobAccessibilityElement *)self parentRep];
  double v3 = [v2 crlaxInteractiveCanvasController];

  double v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v21);
  if (v21) {
    abort();
  }
  id v6 = (void *)v5;

  id v7 = [v6 canvas];
  id v8 = [v7 allRepsOrdered];

  id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) layout:v17];
        [v9 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v12);
  }

  return v9;
}

+ (void)_addBoundariesFromRect:(CGRect)a3 toXBoundarySet:(id)a4 andYBoundarySet:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a5;
  id v11 = a4;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  id v12 = +[NSNumber crl_numberWithCGFloat:CGRectGetMinX(v17)];
  [v11 addObject:v12];

  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  uint64_t v13 = +[NSNumber crl_numberWithCGFloat:CGRectGetMaxX(v18)];
  [v11 addObject:v13];

  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v14 = +[NSNumber crl_numberWithCGFloat:CGRectGetMinY(v19)];
  [v10 addObject:v14];

  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  id v15 = +[NSNumber crl_numberWithCGFloat:CGRectGetMaxY(v20)];
  [v10 addObject:v15];
}

- (CRLCanvasRepAccessibility)parentRep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRep);

  return (CRLCanvasRepAccessibility *)WeakRetained;
}

- (void)setParentRep:(id)a3
{
}

- (unint64_t)knobTag
{
  return self->_knobTag;
}

- (void)setKnobTag:(unint64_t)a3
{
  self->_unint64_t knobTag = a3;
}

- (unint64_t)knobNodeIndex
{
  return self->_knobNodeIndex;
}

- (void)setKnobNodeIndex:(unint64_t)a3
{
  self->_knobNodeIndeCGFloat x = a3;
}

- (NSString)crlaxIdentifier
{
  return self->_crlaxIdentifier;
}

- (void)setCrlaxIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxIdentifier, 0);

  objc_destroyWeak((id *)&self->_parentRep);
}

@end