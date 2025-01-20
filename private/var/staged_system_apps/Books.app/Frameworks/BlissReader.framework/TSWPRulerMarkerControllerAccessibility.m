@interface TSWPRulerMarkerControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- ($F24F406B2B787EFB06265DBA3D28CBD5)tsaxMinMaxModelValuesForRulerMarker:(id)a3;
- (NSArray)tsaxMarkerLayers;
- (NSString)_tsaxLastAnnouncedValue;
- (NSString)tsaxCurrentRulerUnitsDescription;
- (TSWPRulerControllerAccessibility)tsaxParentRulerController;
- (double)_tsaxConvertNumberOfTicksToPoints:(int64_t)a3;
- (double)tsaxEquivalentValueInCurrentRulerUnitsForModelValue:(double)a3 andMarkerType:(int)a4;
- (id)_tsaxDraggingRulerMarker;
- (id)_tsaxParentLayer;
- (void)_tsaxSetDraggingRulerMarker:(id)a3;
- (void)_tsaxSetLastAnnouncedValue:(id)a3;
- (void)addMarker:(id)a3 animation:(int)a4;
- (void)dealloc;
- (void)p_moveDragWithOffset:(CGPoint)a3 rulerPoint:(CGPoint)a4 forceUpdate:(BOOL)a5;
- (void)removeMarker:(id)a3 animation:(int)a4;
- (void)tsaxAdjustValueOfMarker:(id)a3 byNumberOfTicks:(int64_t)a4;
- (void)tsaxSetParentRulerController:(id)a3;
- (void)tsaxValueOfDraggingRulerMarkerWasUpdated:(id)a3;
@end

@implementation TSWPRulerMarkerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPRulerMarkerController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSWPRulerControllerAccessibility)tsaxParentRulerController
{
  return (TSWPRulerControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_5738C5);
}

- (void)tsaxSetParentRulerController:(id)a3
{
}

- (NSString)_tsaxLastAnnouncedValue
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_5738C6);
}

- (void)_tsaxSetLastAnnouncedValue:(id)a3
{
}

- (void)tsaxAdjustValueOfMarker:(id)a3 byNumberOfTicks:(int64_t)a4
{
  [(TSWPRulerMarkerControllerAccessibility *)self _tsaxSetDraggingRulerMarker:a3];
  [(TSWPRulerMarkerControllerAccessibility *)self _tsaxConvertNumberOfTicksToPoints:a4];
  uint64_t v7 = v6;
  [self _tsaxParentLayer].frame;
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  CGFloat MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_261F54;
  v13[3] = &unk_457188;
  v13[4] = self;
  v13[5] = v7;
  v13[6] = 0;
  *(CGFloat *)&v13[7] = MidX;
  v13[8] = CGRectGetMidY(v15);
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v13)) {
    abort();
  }
  [(TSWPRulerMarkerControllerAccessibility *)self _tsaxSetDraggingRulerMarker:0];
}

- (NSString)tsaxCurrentRulerUnitsDescription
{
  v2 = [(TSWPRulerMarkerControllerAccessibility *)self tsaxParentRulerController];

  return [(TSWPRulerControllerAccessibility *)v2 tsaxCurrentRulerUnitsDescription];
}

- (double)tsaxEquivalentValueInCurrentRulerUnitsForModelValue:(double)a3 andMarkerType:(int)a4
{
  uint64_t v16 = 0;
  v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_262120;
  v11[3] = &unk_457B00;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)) {
    abort();
  }
  if (a4 >= 6)
  {
    if (a4 == 6)
    {
      double v7 = v13[3] - a3;
      goto LABEL_4;
    }
    double v7 = 0.0;
    if (a4 != 7) {
      goto LABEL_4;
    }
  }
  double v7 = v17[3] + a3;
LABEL_4:
  [(TSWPRulerControllerAccessibility *)[(TSWPRulerMarkerControllerAccessibility *)self tsaxParentRulerController] tsaxEquivalentValueInCurrentRulerUnitsForModelValue:v7];
  double v9 = v8;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)tsaxMinMaxModelValuesForRulerMarker:(id)a3
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  v11 = &unk_41622E;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_262224;
  v7[3] = &unk_457DA0;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (NSArray)tsaxMarkerLayers
{
  char v18 = 0;
  double v3 = (objc_class *)objc_opt_class();
  double v4 = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSWPRulerMarkerControllerAccessibility *)self tsaxValueForKey:@"markerLayers"], 1, &v18);
  if (v18) {
LABEL_11:
  }
    abort();
  double v5 = v4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v18 = 0;
        v11 = objc_opt_class();
        Class v12 = __TSAccessibilityCastAsSafeCategory(v11, v10, 1, &v18);
        if (v18) {
          goto LABEL_11;
        }
        [(objc_class *)v12 tsaxSetParentRulerMarkerController:self];
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
  return v5;
}

- (void)dealloc
{
  double v3 = [(TSWPRulerMarkerControllerAccessibility *)self tsaxMarkerLayers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        char v12 = 0;
        double v9 = objc_opt_class();
        Class v10 = __TSAccessibilityCastAsSafeCategory(v9, v8, 1, &v12);
        if (v12) {
          abort();
        }
        [(objc_class *)v10 tsaxSetParentRulerMarkerController:0];
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  v11.receiver = self;
  v11.super_class = (Class)TSWPRulerMarkerControllerAccessibility;
  [(TSWPRulerMarkerControllerAccessibility *)&v11 dealloc];
}

- (void)addMarker:(id)a3 animation:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSWPRulerMarkerControllerAccessibility;
  [(TSWPRulerMarkerControllerAccessibility *)&v9 addMarker:a3 animation:*(void *)&a4];
  char v8 = 0;
  uint64_t v6 = objc_opt_class();
  Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)a3, 1, &v8);
  if (v8) {
    abort();
  }
  [(objc_class *)v7 tsaxSetParentRulerMarkerController:self];
}

- (void)removeMarker:(id)a3 animation:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  char v10 = 0;
  Class v7 = objc_opt_class();
  Class v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)a3, 1, &v10);
  if (v10) {
    abort();
  }
  [(objc_class *)v8 tsaxSetParentRulerMarkerController:0];
  v9.receiver = self;
  v9.super_class = (Class)TSWPRulerMarkerControllerAccessibility;
  [(TSWPRulerMarkerControllerAccessibility *)&v9 removeMarker:a3 animation:v4];
}

- (void)p_moveDragWithOffset:(CGPoint)a3 rulerPoint:(CGPoint)a4 forceUpdate:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPRulerMarkerControllerAccessibility;
  -[TSWPRulerMarkerControllerAccessibility p_moveDragWithOffset:rulerPoint:forceUpdate:](&v7, "p_moveDragWithOffset:rulerPoint:forceUpdate:", a5, a3.x, a3.y, a4.x, a4.y);
  id v6 = [[self _tsaxDraggingRulerMarker] tsaxValueWithUnits];
  if ((objc_msgSend(v6, "isEqualToString:", -[TSWPRulerMarkerControllerAccessibility _tsaxLastAnnouncedValue](self, "_tsaxLastAnnouncedValue")) & 1) == 0)
  {
    if ([(TSWPRulerMarkerControllerAccessibility *)self tsaxRespondsToSelector:"tsaxValueOfDraggingRulerMarkerWasUpdated:" fromExtrasProtocol:&OBJC_PROTOCOL___TSWPRulerMarkerControllerAccessibilityExtras])[(TSWPRulerMarkerControllerAccessibility *)self tsaxValueOfDraggingRulerMarkerWasUpdated:v6]; {
    [(TSWPRulerMarkerControllerAccessibility *)self _tsaxSetLastAnnouncedValue:v6];
    }
  }
}

- (void)_tsaxSetDraggingRulerMarker:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_262718;
  v3[3] = &unk_456E38;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (id)_tsaxDraggingRulerMarker
{
  char v5 = 0;
  double v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPRulerMarkerControllerAccessibility *)self tsaxValueForKey:@"draggingRulerMarker"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_tsaxParentLayer
{
  char v5 = 0;
  double v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSWPRulerMarkerControllerAccessibility *)self tsaxValueForKey:@"_parentLayer"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (double)_tsaxConvertNumberOfTicksToPoints:(int64_t)a3
{
  uint64_t v4 = [(TSWPRulerMarkerControllerAccessibility *)self tsaxParentRulerController];

  [(TSWPRulerControllerAccessibility *)v4 tsaxPointValueForNumberOfTicks:a3];
  return result;
}

- (void)tsaxValueOfDraggingRulerMarkerWasUpdated:(id)a3
{
}

@end