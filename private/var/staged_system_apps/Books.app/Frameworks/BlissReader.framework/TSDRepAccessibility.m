@interface TSDRepAccessibility
+ (CGPoint)tsaxCurrentRepDragOffset;
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)tsaxSetCurrentRepDragOffset:(CGPoint)a3;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_tsaxCanBeSelected;
- (BOOL)_tsaxCanBeSelectedWithSelectableRepReference:(id *)a3;
- (BOOL)_tsaxKeyCorrespondsToPropertyRequiringAccessToCanvas:(id)a3;
- (BOOL)_tsaxKnobElementCacheIsInvalid;
- (BOOL)_tsaxShouldPreventAccessToCanvas;
- (BOOL)accessibilityEditOperationAction:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxHasComment;
- (BOOL)tsaxIsInInteractiveCanvas;
- (BOOL)tsaxIsLocked;
- (BOOL)tsaxIsReadyToLoadChildren;
- (BOOL)tsaxIsSelectable;
- (BOOL)tsaxIsSelected;
- (BOOL)tsaxSelect;
- (BOOL)tsaxShouldCreateAccessibilityElementForKnob:(id)a3;
- (BOOL)tsaxShouldCreateKnobs;
- (BOOL)tsaxShouldExposeAsAttachmentToken;
- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm;
- (BOOL)tsaxSupportsChangeTracking;
- (BOOL)tsaxWasExplicitlyFocused;
- (CGAffineTransform)tsaxTransformToConvertNaturalFromLayerRelative;
- (CGPoint)accessibilityActivationPoint;
- (CGPoint)tsaxConvertNaturalPointFromUnscaledCanvas:(CGPoint)a3;
- (CGPoint)tsaxConvertNaturalPointToScreenSpace:(CGPoint)a3;
- (CGPoint)tsaxConvertNaturalPointToUnscaledCanvas:(CGPoint)a3;
- (CGRect)tsaxConvertLayerRelativeRectToNaturalRect:(CGRect)a3;
- (CGRect)tsaxConvertNaturalRectFromUnscaledCanvas:(CGRect)a3;
- (CGRect)tsaxConvertNaturalRectToScreenSpace:(CGRect)a3;
- (CGRect)tsaxConvertNaturalRectToUnscaledCanvas:(CGRect)a3;
- (CGRect)tsaxFrameInScreenSpace;
- (CGRect)tsaxFrameInUnscaledCanvas;
- (CGRect)tsaxLayerFrameInScaledCanvas;
- (CGRect)tsaxNaturalBounds;
- (NSArray)_tsaxKnobAccessibilityElementsCache;
- (NSArray)tsaxKnobAccessibilityElements;
- (NSString)_tsaxOriginDescription;
- (NSString)_tsaxRotationDescription;
- (NSString)_tsaxSizeDescription;
- (NSString)tsaxKnobLabel;
- (NSString)tsaxLayoutDescription;
- (NSString)tsaxLockedHint;
- (NSString)tsaxLockedLabel;
- (NSString)tsaxSummaryDescription;
- (TSDCanvasAccessibility)tsaxCanvas;
- (TSDCanvasViewAccessibility)tsaxCanvasView;
- (TSDDrawableCommentAccessibility)tsaxComment;
- (TSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController;
- (TSDLayoutAccessibility)tsaxLayout;
- (TSDRepAccessibility)tsaxParentRep;
- (TSDRepAccessibility)tsaxRepForSelecting;
- (TSDRepContainerAccessibilityElement)tsaxAccessibilityElement;
- (TSDiOSCanvasViewControllerAccessibility)tsaxCanvasViewController;
- (id)_accessibilityParentView;
- (id)_accessibilityTextOperations;
- (id)_tsaxOriginDescriptionRelativeToContainer:(CGRect)a3;
- (id)_tsaxOriginDescriptionUsingPositionValuesFromInspector;
- (id)_tsaxPrimaryEditingController;
- (id)_tsaxRepContainerElementCache;
- (id)accessibilityContainer;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)hitRep:(CGPoint)a3;
- (id)tsaxInfo;
- (id)tsaxKnobElementForTag:(unint64_t)a3;
- (id)tsaxKnobForTag:(unint64_t)a3;
- (id)tsaxNewKnobElementForKnob:(id)a3;
- (id)tsaxValueForKey:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_tsaxSetKnobAccessibilityElementsCache:(id)a3;
- (void)_tsaxSetKnobElementCacheIsInvalid:(BOOL)a3;
- (void)_tsaxSetRepContainerElementCache:(id)a3;
- (void)_tsaxSetShouldPreventAccessToCanvas:(BOOL)a3;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)dealloc;
- (void)dynamicDragDidBegin;
- (void)dynamicallyResizingWithTracker:(id)a3;
- (void)i_willBeRemoved;
- (void)invalidateKnobs;
- (void)tsaxChildWillBeRemoved:(id)a3;
- (void)tsaxDidInvalidateChildren;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
- (void)tsaxPerformExtraCleanupTasksPriorToRemovalFromCanvas;
- (void)tsaxSetWasExplicitlyFocused:(BOOL)a3;
@end

@implementation TSDRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxWasExplicitlyFocused
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573889);
}

- (void)tsaxSetWasExplicitlyFocused:(BOOL)a3
{
}

- (NSArray)_tsaxKnobAccessibilityElementsCache
{
  return (NSArray *)__TSAccessibilityGetAssociatedObject(self, &unk_57388A);
}

- (void)_tsaxSetKnobAccessibilityElementsCache:(id)a3
{
}

- (BOOL)_tsaxShouldPreventAccessToCanvas
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_57388B);
}

- (void)_tsaxSetShouldPreventAccessToCanvas:(BOOL)a3
{
}

- (BOOL)_tsaxKnobElementCacheIsInvalid
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_57388C);
}

- (void)_tsaxSetKnobElementCacheIsInvalid:(BOOL)a3
{
}

- (BOOL)tsaxIsInInteractiveCanvas
{
  return [(TSDRepAccessibility *)self tsaxInteractiveCanvasController] != 0;
}

- (CGRect)tsaxFrameInUnscaledCanvas
{
  [(TSDRepAccessibility *)self tsaxCGRectValueForKey:@"frameInUnscaledCanvas"];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)tsaxLayerFrameInScaledCanvas
{
  [(TSDRepAccessibility *)self tsaxCGRectValueForKey:@"layerFrameInScaledCanvas"];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)tsaxFrameInScreenSpace
{
  double v3 = [(TSDRepAccessibility *)self tsaxCanvas];
  [(TSDRepAccessibility *)self tsaxLayerFrameInScaledCanvas];

  -[TSDCanvasAccessibility tsaxScreenFrameFromLayerFrameInScaledCanvas:](v3, "tsaxScreenFrameFromLayerFrameInScaledCanvas:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (TSDCanvasAccessibility)tsaxCanvas
{
  char v5 = 0;
  double v3 = objc_opt_class();
  CGRect result = (TSDCanvasAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"canvas"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  char v5 = 0;
  double v3 = objc_opt_class();
  CGRect result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDCanvasAccessibility *)[(TSDRepAccessibility *)self tsaxCanvas] tsaxInteractiveCanvasController], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSDCanvasViewAccessibility)tsaxCanvasView
{
  double v2 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];

  return [(TSDInteractiveCanvasControllerAccessibility *)v2 tsaxCanvasView];
}

- (TSDRepAccessibility)tsaxParentRep
{
  char v5 = 0;
  double v3 = objc_opt_class();
  CGRect result = (TSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"parentRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxInfo
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"info"];
}

- (TSDLayoutAccessibility)tsaxLayout
{
  char v5 = 0;
  double v3 = objc_opt_class();
  CGRect result = (TSDLayoutAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"layout"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)tsaxIsSelected
{
  if ([(TSDRepAccessibility *)self tsaxBoolValueForKey:@"isSelected"]) {
    return 1;
  }
  double v4 = [(TSDRepAccessibility *)self tsaxParentRep];

  return [(TSDRepAccessibility *)v4 tsaxIsSelected];
}

- (BOOL)tsaxIsSelectable
{
  return [(TSDRepAccessibility *)self tsaxBoolValueForKey:@"isSelectable"];
}

- (TSDRepAccessibility)tsaxRepForSelecting
{
  CGRect result = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];
  if (result)
  {
    char v5 = 0;
    double v4 = objc_opt_class();
    CGRect result = (TSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v4, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"repForSelecting"], 1, &v5);
    if (v5) {
      abort();
    }
  }
  return result;
}

- (BOOL)tsaxShouldCreateKnobs
{
  return [(TSDRepAccessibility *)self tsaxBoolValueForKey:@"shouldCreateKnobs"];
}

- (CGRect)tsaxNaturalBounds
{
  [(TSDRepAccessibility *)self tsaxCGRectValueForKey:@"naturalBounds"];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)tsaxLayoutDescription
{
  double v3 = [(TSDRepAccessibility *)self _tsaxSizeDescription];
  double v4 = [(TSDRepAccessibility *)self _tsaxOriginDescription];
  [(TSDRepAccessibility *)self _tsaxRotationDescription];
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (BOOL)tsaxIsLocked
{
  return [(TSDRepAccessibility *)self tsaxBoolValueForKey:@"isLocked"];
}

- (NSString)tsaxLockedLabel
{
  if (![(TSDRepAccessibility *)self tsaxIsLocked]) {
    return 0;
  }

  return TSAccessibilityLocalizedString(@"canvas.item.locked.label");
}

- (NSString)tsaxLockedHint
{
  if (![(TSDRepAccessibility *)self tsaxIsLocked]) {
    return 0;
  }

  return TSAccessibilityLocalizedString(@"canvas.item.locked.hint");
}

- (NSArray)tsaxKnobAccessibilityElements
{
  char v31 = 0;
  double v3 = (objc_class *)objc_opt_class();
  id obj = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"knobs"], 1, &v31);
  if (v31) {
LABEL_28:
  }
    abort();
  if ([(TSDRepAccessibility *)self _tsaxKnobElementCacheIsInvalid]
    || (id v4 = -[NSArray count](-[TSDRepAccessibility _tsaxKnobAccessibilityElementsCache](self, "_tsaxKnobAccessibilityElementsCache"), "count"), v4 != [obj count]))
  {
    id v21 = +[NSMutableArray array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v5 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v28;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          char v31 = 0;
          uint64_t v10 = objc_opt_class();
          Class v11 = __TSAccessibilityCastAsSafeCategory(v10, v9, 1, &v31);
          if (v31) {
            goto LABEL_28;
          }
          Class v12 = v11;
          if (v11
            && [(TSDRepAccessibility *)self tsaxShouldCreateAccessibilityElementForKnob:v11])
          {
            long long v25 = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            v13 = [(TSDRepAccessibility *)self _tsaxKnobAccessibilityElementsCache];
            id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v32 count:16];
            if (v14)
            {
              id v15 = v14;
              uint64_t v16 = *(void *)v24;
LABEL_14:
              uint64_t v17 = 0;
              while (1)
              {
                if (*(void *)v24 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(id *)(*((void *)&v23 + 1) + 8 * v17);
                if ([v18 isEqualToKnob:v12]) {
                  break;
                }
                if (v15 == (id)++v17)
                {
                  id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v32 count:16];
                  if (v15) {
                    goto LABEL_14;
                  }
                  goto LABEL_22;
                }
              }
              if (v18) {
                goto LABEL_23;
              }
            }
LABEL_22:
            id v18 = [(TSDRepAccessibility *)self tsaxNewKnobElementForKnob:v12];
LABEL_23:
            [v18 setParentRep:self];
            [v21 tsaxAddObjectIfNotNil:v18];
            uint64_t v7 = v20;
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v6);
    }
    [(TSDRepAccessibility *)self _tsaxSetKnobAccessibilityElementsCache:v21];
    [(TSDRepAccessibility *)self _tsaxSetKnobElementCacheIsInvalid:0];
  }
  return [(TSDRepAccessibility *)self _tsaxKnobAccessibilityElementsCache];
}

- (NSString)tsaxKnobLabel
{
  return (NSString *)&stru_46D7E8;
}

- (id)tsaxKnobForTag:(unint64_t)a3
{
  char v15 = 0;
  id v5 = objc_opt_class();
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  Class v12 = sub_254B78;
  v13 = sub_254B88;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_254B94;
  v8[3] = &unk_458E98;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  uint64_t v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  id result = __TSAccessibilityCastAsSafeCategory(v5, v6, 1, &v15);
  if (v15) {
    abort();
  }
  return result;
}

- (id)tsaxKnobElementForTag:(unint64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(TSDRepAccessibility *)self tsaxKnobAccessibilityElements];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 knobTag] == (id)a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)tsaxShouldExposeAsAttachmentToken
{
  return 0;
}

- (NSString)tsaxSummaryDescription
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (NSString *)[(TSDRepAccessibility *)self accessibilityLabel];
}

- (BOOL)tsaxSupportsChangeTracking
{
  return 0;
}

- (TSDDrawableCommentAccessibility)tsaxComment
{
  char v6 = 0;
  double v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxInfo], 1, &v6);
  if (v6) {
    abort();
  }
  return (TSDDrawableCommentAccessibility *)[(objc_class *)v4 tsaxComment];
}

- (BOOL)tsaxHasComment
{
  return [(TSDRepAccessibility *)self tsaxComment] != 0;
}

- (CGAffineTransform)tsaxTransformToConvertNaturalFromLayerRelative
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x5010000000;
  long long v11 = &unk_41622E;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_254EA4;
  v7[3] = &unk_4573D8;
  v7[4] = self;
  v7[5] = &v8;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  Class v4 = v9;
  long long v5 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v4 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

- (id)tsaxNewKnobElementForKnob:(id)a3
{
  long long v5 = [TSDKnobAccessibilityElement alloc];
  id v6 = [a3 tsaxKnobTag];

  return [(TSDKnobAccessibilityElement *)v5 initWithKnobTag:v6 parentRep:self];
}

- (CGPoint)tsaxConvertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  long long v12 = &unk_41622E;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_255034;
  v7[3] = &unk_46B940;
  v7[4] = self;
  v7[5] = &v9;
  CGPoint v8 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  double v3 = v10[4];
  double v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v5 = v3;
  double v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGRect)tsaxConvertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  uint64_t v16 = &unk_41622E;
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_25516C;
  v11[3] = &unk_46B968;
  v11[4] = self;
  v11[5] = &v13;
  CGRect v12 = a3;
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

- (CGPoint)tsaxConvertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  CGRect v12 = &unk_41622E;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_255290;
  v7[3] = &unk_46B940;
  v7[4] = self;
  v7[5] = &v9;
  CGPoint v8 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  double v3 = v10[4];
  double v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v5 = v3;
  double v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGRect)tsaxConvertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  uint64_t v16 = &unk_41622E;
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2553C8;
  v11[3] = &unk_46B968;
  v11[4] = self;
  v11[5] = &v13;
  CGRect v12 = a3;
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

- (CGPoint)tsaxConvertNaturalPointToScreenSpace:(CGPoint)a3
{
  -[TSDRepAccessibility tsaxConvertNaturalRectToScreenSpace:](self, "tsaxConvertNaturalRectToScreenSpace:", a3.x, a3.y, 0.0, 0.0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)tsaxConvertNaturalRectToScreenSpace:(CGRect)a3
{
  -[TSDRepAccessibility tsaxConvertNaturalRectToUnscaledCanvas:](self, "tsaxConvertNaturalRectToUnscaledCanvas:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertUnscaledToBoundsRect:]([(TSDRepAccessibility *)self tsaxInteractiveCanvasController], "tsaxConvertUnscaledToBoundsRect:", v4, v5, v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(TSDInteractiveCanvasControllerAccessibility *)[(TSDRepAccessibility *)self tsaxInteractiveCanvasController] tsaxCanvasView];

  -[TSDCanvasViewAccessibility tsaxFrameFromBounds:](v16, "tsaxFrameFromBounds:", v9, v11, v13, v15);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)tsaxConvertLayerRelativeRectToNaturalRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (self) {
    [(TSDRepAccessibility *)self tsaxTransformToConvertNaturalFromLayerRelative];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (BOOL)tsaxShouldCreateAccessibilityElementForKnob:(id)a3
{
  return 1;
}

- (void)i_willBeRemoved
{
  [(TSDRepAccessibility *)self _tsaxSetShouldPreventAccessToCanvas:1];
  [(TSDRepAccessibility *)self tsaxPerformCleanupTasksPriorToRemovalFromCanvas];
  if ([(TSDRepAccessibility *)self tsaxRespondsToSelector:"tsaxPerformExtraCleanupTasksPriorToRemovalFromCanvas" fromExtrasProtocol:&OBJC_PROTOCOL___TSDRepAccessibilityExtras])[(TSDRepAccessibility *)self tsaxPerformExtraCleanupTasksPriorToRemovalFromCanvas]; {
  v3.receiver = self;
  }
  v3.super_class = (Class)TSDRepAccessibility;
  [(TSDRepAccessibility *)&v3 i_willBeRemoved];
}

- (void)invalidateKnobs
{
  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  [(TSDRepAccessibility *)&v3 invalidateKnobs];
  [(TSDRepAccessibility *)self _tsaxSetKnobElementCacheIsInvalid:1];
}

- (void)becameSelected
{
  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  [(TSDRepAccessibility *)&v3 becameSelected];
  if ([(TSDRepAccessibility *)self tsaxRespondsToSelector:"tsaxBecameSelected" fromExtrasProtocol:&OBJC_PROTOCOL___TSDRepAccessibilityExtras])[(TSDRepAccessibility *)self tsaxBecameSelected]; {
}
  }

- (void)becameNotSelected
{
  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  [(TSDRepAccessibility *)&v3 becameNotSelected];
  if ([(TSDRepAccessibility *)self tsaxRespondsToSelector:"tsaxBecameNotSelected" fromExtrasProtocol:&OBJC_PROTOCOL___TSDRepAccessibilityExtras])[(TSDRepAccessibility *)self tsaxBecameNotSelected]; {
}
  }

- (id)tsaxValueForKey:(id)a3
{
  if ([(TSDRepAccessibility *)self _tsaxShouldPreventAccessToCanvas]
    && [(TSDRepAccessibility *)self _tsaxKeyCorrespondsToPropertyRequiringAccessToCanvas:a3])
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDRepAccessibility;
  return [(TSDRepAccessibility *)&v6 tsaxValueForKey:a3];
}

- (NSString)_tsaxSizeDescription
{
  objc_super v3 = [(TSDLayoutAccessibility *)[(TSDRepAccessibility *)self tsaxLayout] tsaxInspectorGeometry];
  double v4 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];
  [(TSDLayoutGeometryAccessibility *)v3 tsaxSize];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString(@"object.size.formatter %@ %@"), -[TSDInteractiveCanvasControllerAccessibility tsaxDescriptionOfPointValueConvertedToRulerUnit:](v4, "tsaxDescriptionOfPointValueConvertedToRulerUnit:"), [(TSDInteractiveCanvasControllerAccessibility *)v4 tsaxDescriptionOfPointValueConvertedToRulerUnit:v5]);
}

- (NSString)_tsaxOriginDescription
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"App-specific subclasses must override", v3, v4, v5, v6, v7, vars0))abort(); {
  }
    }
  return 0;
}

- (NSString)_tsaxRotationDescription
{
  [(TSDLayoutGeometryAccessibility *)[(TSDLayoutAccessibility *)[(TSDRepAccessibility *)self tsaxLayout] tsaxInspectorGeometry] tsaxAngle];
  if (v2 == 0.0) {
    return 0;
  }
  else {
    return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"shape.angle %f"), *(void *)&v2];
  }
}

- (id)_tsaxOriginDescriptionUsingPositionValuesFromInspector
{
  uint64_t v3 = [(TSDLayoutAccessibility *)[(TSDRepAccessibility *)self tsaxLayout] tsaxInspectorGeometry];
  uint64_t v4 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];
  [(TSDLayoutGeometryAccessibility *)v3 tsaxOrigin];
  double v6 = v5;
  id v8 = [(TSDInteractiveCanvasControllerAccessibility *)v4 tsaxDescriptionOfPointValueConvertedToRulerUnit:v7];
  id v9 = [(TSDInteractiveCanvasControllerAccessibility *)v4 tsaxDescriptionOfPointValueConvertedToRulerUnit:v6];
  double v10 = +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"object.from.top.offset.formatter %@"), v8];
  double v11 = +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"object.from.left.offset.formatter %@"), v9];
  return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"object.origin.formatter %@ %@"), v10, v11];
}

- (id)_tsaxOriginDescriptionRelativeToContainer:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TSDRepAccessibility *)self tsaxFrameInUnscaledCanvas];
  CGFloat v6 = v5;
  CGFloat rect = v5;
  CGFloat v27 = v7;
  CGFloat v9 = v8 - x;
  CGFloat v11 = v10 - y;
  TSDRectWithSize();
  CGFloat v12 = v29.origin.x;
  CGFloat v13 = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  double MidX = CGRectGetMidX(v29);
  v30.origin.double x = v9;
  v30.origin.double y = v11;
  v30.size.CGFloat width = v6;
  v30.size.CGFloat height = v27;
  double v26 = vabdd_f64(MidX, CGRectGetMidX(v30));
  v31.origin.double x = v12;
  v31.origin.double y = v13;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v31);
  v32.origin.double x = v9;
  v32.origin.double y = v11;
  v32.size.CGFloat width = rect;
  v32.size.CGFloat height = v27;
  double v18 = vabdd_f64(MidY, CGRectGetMidY(v32));
  if (v26 >= 0.001 || v18 >= 0.001)
  {
    if (v26 >= 0.001)
    {
      id v21 = TSAccessibilityLocalizedString(@"object.from.left.offset.formatter %@");
      double v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, TSAccessibilityLocalizedPercent());
    }
    else
    {
      double v20 = TSAccessibilityLocalizedString(@"object.horizontally.centered");
    }
    v22 = v20;
    if (v18 >= 0.001)
    {
      long long v24 = TSAccessibilityLocalizedString(@"object.from.top.offset.formatter %@");
      long long v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, TSAccessibilityLocalizedPercent());
    }
    else
    {
      long long v23 = TSAccessibilityLocalizedString(@"object.vertically.centered");
    }
    return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"object.origin.formatter %@ %@"), v22, v23];
  }
  else
  {
    return TSAccessibilityLocalizedString(@"object.horizontally.and.vertically.centered");
  }
}

- (BOOL)_tsaxKeyCorrespondsToPropertyRequiringAccessToCanvas:(id)a3
{
  unint64_t v4 = 0;
  do
  {
    BOOL result = [a3 isEqualToString:*(&off_46B988 + v4)];
    if (v4 > 3) {
      break;
    }
    ++v4;
  }
  while (!result);
  return result;
}

- (id)_tsaxRepContainerElementCache
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A38);
}

- (void)_tsaxSetRepContainerElementCache:(id)a3
{
}

+ (CGPoint)tsaxCurrentRepDragOffset
{
  double v2 = *(double *)&qword_573A40;
  double v3 = *(double *)&qword_573A48;
  result.double y = v3;
  result.double x = v2;
  return result;
}

+ (void)tsaxSetCurrentRepDragOffset:(CGPoint)a3
{
  xmmword_573A40 = (__int128)a3;
}

- (TSDRepContainerAccessibilityElement)tsaxAccessibilityElement
{
  if (![(TSDRepAccessibility *)self _tsaxRepContainerElementCache]
    && [(TSDRepAccessibility *)self tsaxCanvas])
  {
    [(TSDRepAccessibility *)self _tsaxSetRepContainerElementCache:[[TSDRepContainerAccessibilityElement alloc] initWithRep:self]];
  }

  return (TSDRepContainerAccessibilityElement *)[(TSDRepAccessibility *)self _tsaxRepContainerElementCache];
}

- (TSDiOSCanvasViewControllerAccessibility)tsaxCanvasViewController
{
  double v2 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];

  return [(TSDInteractiveCanvasControllerAccessibility *)v2 tsaxCanvasViewController];
}

- (id)hitRep:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(TSDRepAccessibility *)self isAccessibilityElement]
    && (uint64_t)[(TSDRepAccessibility *)self accessibilityElementCount] <= 0
    && [+[TSAccessibility sharedInstance] needsAccessibilityElements])
  {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)TSDRepAccessibility;
  return -[TSDRepAccessibility hitRep:](&v7, "hitRep:", x, y);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)TSDRepAccessibility;
  unint64_t v3 = [(TSDRepAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(TSDRepAccessibility *)self tsaxIsSelected];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityElements
{
  if ([(TSDRepAccessibility *)self isAccessibilityElement]) {
    return 0;
  }

  return [(TSDRepAccessibility *)self tsaxChildren];
}

- (id)accessibilityContainer
{
  [(TSDCanvasViewAccessibility *)[(TSDRepAccessibility *)self tsaxCanvasView] tsaxEnsureChildrenAreLoaded];
  v4.receiver = self;
  v4.super_class = (Class)TSDRepAccessibility;
  return [(TSDRepAccessibility *)&v4 accessibilityContainer];
}

- (id)accessibilityHint
{
  unint64_t v3 = [(TSDRepAccessibility *)self tsaxLayoutDescription];
  if ([(TSDRepAccessibility *)self _tsaxCanBeSelected]) {
    double v10 = TSAccessibilityLocalizedString(@"select.hint.iOS");
  }
  else {
    double v10 = 0;
  }
  return __TSAccessibilityStringForVariables(1, v10, v4, v5, v6, v7, v8, v9, (uint64_t)v3);
}

- (CGPoint)accessibilityActivationPoint
{
  char v49 = 0;
  unint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxCanvasView], 1, &v49);
  if (v49) {
    abort();
  }
  uint64_t v5 = v4;
  id v6 = [v4 window];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    goto LABEL_13;
  }
  uint64_t v8 = v6;
  [v5 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [(TSDRepAccessibility *)self tsaxLayerFrameInScaledCanvas];
  v65.origin.double x = v10;
  v65.origin.double y = v12;
  v65.size.CGFloat width = v14;
  v65.size.CGFloat height = v16;
  CGRect v52 = CGRectIntersection(v51, v65);
  double y = v52.origin.y;
  double x = v52.origin.x;
  CGFloat width = v52.size.width;
  CGFloat height = v52.size.height;
  double v17 = +[TSAccessibility sharedInstance];
  if ([(TSAccessibility *)v17 isKeyboardVisible])
  {
    [(TSAccessibility *)v17 keyboardFrame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  else
  {
    double v19 = CGRectNull.origin.x;
    double v21 = CGRectNull.origin.y;
    double v23 = CGRectNull.size.width;
    double v25 = CGRectNull.size.height;
  }
  v53.origin.double y = y;
  v53.origin.double x = x;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  if (CGRectIsNull(v53)) {
    goto LABEL_13;
  }
  v54.origin.double x = v19;
  v54.origin.double y = v21;
  v54.size.CGFloat width = v23;
  v54.size.CGFloat height = v25;
  if (CGRectIsNull(v54)) {
    goto LABEL_13;
  }
  [v8 convertRect:0 fromWindow:v19, v21, v23, v25];
  [v5 convertRect:v8 fromView:];
  v66.origin.double x = v10;
  v66.origin.double y = v12;
  v66.size.CGFloat width = v14;
  v66.size.CGFloat height = v16;
  CGRect v56 = CGRectIntersection(v55, v66);
  CGFloat v26 = v56.origin.x;
  CGFloat v27 = v56.origin.y;
  CGFloat v28 = v56.size.width;
  CGFloat v29 = v56.size.height;
  v56.origin.double y = y;
  v56.origin.double x = x;
  v56.size.CGFloat width = width;
  v56.size.CGFloat height = height;
  v67.origin.double x = v26;
  v67.origin.double y = v27;
  v67.size.CGFloat width = v28;
  v67.size.CGFloat height = v29;
  if (!CGRectIntersectsRect(v56, v67)) {
    goto LABEL_13;
  }
  v57.origin.double x = v26;
  v57.origin.double y = v27;
  v57.size.CGFloat width = v28;
  v57.size.CGFloat height = v29;
  v68.origin.double y = y;
  v68.origin.double x = x;
  v68.size.CGFloat width = width;
  v68.size.CGFloat height = height;
  if (CGRectContainsRect(v57, v68))
  {
LABEL_13:
    v48.receiver = self;
    v48.super_class = (Class)TSDRepAccessibility;
    [(TSDRepAccessibility *)&v48 accessibilityActivationPoint];
    CGFloat MidX = v31;
  }
  else
  {
    v58.origin.double x = x;
    v58.origin.double y = y;
    double v34 = height;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v58);
    v59.origin.double x = v26;
    v59.origin.double y = v27;
    v59.size.CGFloat width = v28;
    v59.size.CGFloat height = v29;
    if (MinY >= CGRectGetMinY(v59))
    {
      double v38 = width;
    }
    else
    {
      v60.origin.double x = x;
      v60.origin.double y = y;
      v60.size.CGFloat width = width;
      v60.size.CGFloat height = height;
      CGFloat v43 = CGRectGetWidth(v60);
      v61.origin.double x = v26;
      v61.origin.double y = v27;
      v61.size.CGFloat width = v28;
      v61.size.CGFloat height = v29;
      CGFloat v36 = CGRectGetMinY(v61);
      v62.size.CGFloat height = height;
      double v37 = v36;
      v62.origin.double x = x;
      v62.origin.double y = y;
      v62.size.CGFloat width = width;
      double v34 = v37 - CGRectGetMinY(v62);
      double v38 = v43;
    }
    [v5 tsaxFrameFromBounds:x, y, v38, v34, *(void *)&v43];
    CGFloat v39 = v63.origin.x;
    CGFloat v40 = v63.origin.y;
    CGFloat v41 = v63.size.width;
    CGFloat v42 = v63.size.height;
    CGFloat MidX = CGRectGetMidX(v63);
    v64.origin.double x = v39;
    v64.origin.double y = v40;
    v64.size.CGFloat width = v41;
    v64.size.CGFloat height = v42;
    double MidY = CGRectGetMidY(v64);
  }
  double v33 = MidX;
  result.double y = MidY;
  result.double x = v33;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  if ([(TSDRepAccessibility *)self _tsaxCanBeSelected]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDRepAccessibility;
  return [(TSDRepAccessibility *)&v4 _accessibilitySupportsActivateAction];
}

- (id)_accessibilityParentView
{
  v4.receiver = self;
  v4.super_class = (Class)TSDRepAccessibility;
  id result = [(TSDRepAccessibility *)&v4 _accessibilityParentView];
  if (!result) {
    return [(TSDRepAccessibility *)self tsaxCanvasView];
  }
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)_accessibilityTextOperations
{
  if (![(TSDRepAccessibility *)self tsaxNeedsEditRotorMenu]) {
    return 0;
  }
  id v3 = +[TSAccessibilityEditMenuController sharedController];
  objc_super v4 = [(TSDInteractiveCanvasControllerAccessibility *)[(TSDRepAccessibility *)self tsaxInteractiveCanvasController] tsaxEditMenuItemProvider];

  return [v3 editMenuTitlesForItemProvider:v4];
}

- (BOOL)accessibilityEditOperationAction:(id)a3
{
  unsigned int v5 = [(TSDRepAccessibility *)self tsaxNeedsEditRotorMenu];
  if (v5)
  {
    id v6 = +[TSAccessibilityEditMenuController sharedController];
    BOOL v7 = [(TSDInteractiveCanvasControllerAccessibility *)[(TSDRepAccessibility *)self tsaxInteractiveCanvasController] tsaxEditMenuItemProvider];
    LOBYTE(v5) = [v6 performActionTitled:a3 forEditMenuProvider:v7];
  }
  return v5;
}

- (id)accessibilityCustomActions
{
  if (![(TSDRepAccessibility *)self isAccessibilityElement]) {
    return 0;
  }
  id v3 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];

  return [(TSDInteractiveCanvasControllerAccessibility *)v3 tsaxActionMenuItemsForRep:self];
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  BOOL v3 = +[NSThread isMainThread];
  if (v3) {
    LOBYTE(v3) = [(TSDRepAccessibility *)self tsaxCanvas] != 0;
  }
  return v3;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  if ([(TSDRepAccessibility *)self accessibilityElementsHidden]) {
    return;
  }
  if ([(TSDRepAccessibility *)self conformsToProtocol:NSProtocolFromString(@"TSDContainerRep")])
  {
    char v50 = 0;
    unsigned int v5 = (objc_class *)objc_opt_class();
    id v6 = (void *)__TSAccessibilityCastAsClass(v5, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"childReps"], 1, &v50);
    if (v50) {
      goto LABEL_48;
    }
    BOOL v7 = v6;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v47;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v47 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v46 + 1) + 8 * i) tsaxAccessibilityElement];
          if (v12)
          {
            double v13 = v12;
            [a3 addObject:v12];
            [v13 tsaxEnsureChildrenAreLoaded];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v9);
    }
    if (objc_opt_respondsToSelector())
    {
      id v14 = objc_alloc_init((Class)NSMutableArray);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_27A028;
      v45[3] = &unk_456E38;
      v45[4] = self;
      v45[5] = v14;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v45)) {
        goto LABEL_48;
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v15 = [v14 countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v42;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v14);
            }
            double v19 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
            double v20 = (char *)[v19 accessibilityElementCount];
            if (([v19 isAccessibilityElement] & 1) != 0
              || (unint64_t)(v20 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
            {
              [a3 addObject:v19];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v41 objects:v53 count:16];
        }
        while (v16);
      }
    }
    if (objc_opt_respondsToSelector())
    {
      id v21 = objc_alloc_init((Class)NSMutableArray);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_27A034;
      v40[3] = &unk_456E38;
      v40[4] = self;
      v40[5] = v21;
      if (!__TSAccessibilityPerformSafeBlock((uint64_t)v40))
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v22 = [v21 countByEnumeratingWithState:&v36 objects:v52 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v37;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v21);
              }
              CGFloat v26 = *(void **)(*((void *)&v36 + 1) + 8 * (void)k);
              CGFloat v27 = (char *)[v26 accessibilityElementCount];
              if (([v26 isAccessibilityElement] & 1) != 0
                || (unint64_t)(v27 - 1) < 0x7FFFFFFFFFFFFFFELL
                || objc_msgSend(objc_msgSend(v26, "_accessibilitySubviews"), "count"))
              {
                [a3 addObject:v26];
              }
            }
            id v23 = [v21 countByEnumeratingWithState:&v36 objects:v52 count:16];
          }
          while (v23);
        }

        goto LABEL_40;
      }
LABEL_48:
      abort();
    }
  }
LABEL_40:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v28 = [a3 countByEnumeratingWithState:&v32 objects:v51 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (m = 0; m != v29; m = (char *)m + 1)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * (void)m) setAccessibilityContainer:self];
      }
      id v29 = [a3 countByEnumeratingWithState:&v32 objects:v51 count:16];
    }
    while (v29);
  }
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
}

- (void)tsaxDidInvalidateChildren
{
}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (BOOL)tsaxSelect
{
  uint64_t v7 = 0;
  BOOL v3 = [(TSDRepAccessibility *)self _tsaxCanBeSelectedWithSelectableRepReference:&v7];
  if (v3)
  {
    objc_super v4 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_27A114;
    v6[3] = &unk_456DE0;
    v6[4] = v4;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
      abort();
    }
    [(TSDInteractiveCanvasControllerAccessibility *)v4 tsaxSelectRep:v7];
    TSAccessibilityPostLayoutChangedNotification(0);
  }
  return v3;
}

- (void)dealloc
{
  [(TSDRepAccessibility *)self tsaxAccessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  [(TSDRepAccessibility *)&v3 dealloc];
}

- (void)dynamicDragDidBegin
{
  v2.receiver = self;
  v2.super_class = (Class)TSDRepAccessibility;
  [(TSDRepAccessibility *)&v2 dynamicDragDidBegin];
  [objc_opt_class() tsaxSetCurrentRepDragOffset:CGPointZero.x, CGPointZero.y];
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  objc_super v4 = self;
  v16.receiver = self;
  v16.super_class = (Class)TSDRepAccessibility;
  -[TSDRepAccessibility dynamicallyResizingWithTracker:](&v16, "dynamicallyResizingWithTracker:");
  [a3 tsaxCGRectValueForKey:@"currentBoundsForStandardKnobs"];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(TSDInteractiveCanvasControllerAccessibility *)[(TSDRepAccessibility *)v4 tsaxInteractiveCanvasController] tsaxRulerUnitsInstance];
  LODWORD(v4) = [v9 tsaxRulerUnits];
  id v10 = [[[v9 tsaxLocalizedCompatibleRulerUnitsForCanvas] lowercaseString];
  [v9 tsaxConvertPointsToRulerUnits:v6];
  if (v4 >= 2) {
    CFStringRef v12 = @"%.0f %@";
  }
  else {
    CFStringRef v12 = @"%.2f %@";
  }
  double v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v11, v10);
  [v9 tsaxConvertPointsToRulerUnits:v8];
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString(@"object.resize.size.formatter %@ %@"), v13, +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v14, v10));
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v15);
}

- (void)tsaxPerformExtraCleanupTasksPriorToRemovalFromCanvas
{
  [(TSDRepAccessibility *)self setAccessibilityContainer:0];
  [[(TSDRepAccessibility *)self tsaxParentRep] tsaxInvalidateChildrenImmediately];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_27A38C;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  TSAccessibilityPerformBlockOnMainThread(v3);
}

- (id)_tsaxPrimaryEditingController
{
  objc_super v2 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];
  id v3 = [v2 tsaxValueForKey:@"editorController" tsaxValueForKey:@"textInputEditor"];
  objc_super v4 = NSProtocolFromString(@"TSDCanvasEditor");
  if (([v3 conformsToProtocol:v4] & 1) == 0)
  {
    id v5 = [(TSDInteractiveCanvasControllerAccessibility *)v2 tsaxCanvasEditor];
    if ([v5 conformsToProtocol:v4]) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return v3;
}

- (BOOL)_tsaxCanBeSelectedWithSelectableRepReference:(id *)a3
{
  objc_super v4 = [(TSDRepAccessibility *)self tsaxRepForSelecting];
  id v5 = v4;
  if (v4) {
    LODWORD(v4) = ![(TSDRepAccessibility *)v4 tsaxIsSelected];
  }
  if (a3)
  {
    if (v4) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
    *a3 = v6;
  }
  return (char)v4;
}

- (BOOL)_tsaxCanBeSelected
{
  return [(TSDRepAccessibility *)self _tsaxCanBeSelectedWithSelectableRepReference:0];
}

@end