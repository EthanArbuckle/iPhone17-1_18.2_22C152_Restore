@interface TSWPRulerControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)tsaxMarkerLayers;
- (NSString)tsaxCurrentRulerUnitsDescription;
- (double)_tsaxTickFrameSpacing;
- (double)tsaxEquivalentValueInCurrentRulerUnitsForModelValue:(double)a3;
- (double)tsaxPointValueForNumberOfTicks:(int64_t)a3;
- (id)_tsaxRulerMarkerController;
- (id)_tsaxRulerUnitsInstance;
- (void)_tsaxSetupRulerController;
- (void)dealloc;
- (void)setInteractiveCanvasController:(id)a3;
- (void)tsaxLoadAccessibilityInformation;
@end

@implementation TSWPRulerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPRulerController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (double)tsaxPointValueForNumberOfTicks:(int64_t)a3
{
  [(TSWPRulerControllerAccessibility *)self _tsaxTickFrameSpacing];
  return v4 * (double)a3;
}

- (NSArray)tsaxMarkerLayers
{
  id v2 = [(TSWPRulerControllerAccessibility *)self _tsaxRulerMarkerController];

  return (NSArray *)[v2 tsaxMarkerLayers];
}

- (double)tsaxEquivalentValueInCurrentRulerUnitsForModelValue:(double)a3
{
  id v4 = [(TSWPRulerControllerAccessibility *)self _tsaxRulerUnitsInstance];

  [v4 tsaxConvertPointsToRulerUnits:a3];
  return result;
}

- (NSString)tsaxCurrentRulerUnitsDescription
{
  id v2 = [(TSWPRulerControllerAccessibility *)self _tsaxRulerUnitsInstance];

  return (NSString *)[v2 tsaxLocalizedCompatibleRulerUnitsForCanvas];
}

- (void)dealloc
{
  [self->_tsaxRulerMarkerController tsaxSetParentRulerController:0];
  v3.receiver = self;
  v3.super_class = (Class)TSWPRulerControllerAccessibility;
  [(TSWPRulerControllerAccessibility *)&v3 dealloc];
}

- (void)setInteractiveCanvasController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPRulerControllerAccessibility;
  [(TSWPRulerControllerAccessibility *)&v4 setInteractiveCanvasController:a3];
  [(TSWPRulerControllerAccessibility *)self _tsaxSetupRulerController];
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPRulerControllerAccessibility;
  [(TSWPRulerControllerAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(TSWPRulerControllerAccessibility *)self _tsaxSetupRulerController];
}

- (void)_tsaxSetupRulerController
{
  id v3 = [(TSWPRulerControllerAccessibility *)self _tsaxRulerMarkerController];

  [v3 tsaxSetParentRulerController:self];
}

- (double)_tsaxTickFrameSpacing
{
  [(TSWPRulerControllerAccessibility *)self tsaxCGFloatValueForKey:@"tickFrameSpacing"];
  return result;
}

- (id)_tsaxRulerUnitsInstance
{
  Class v2 = NSClassFromString(@"TSKRulerUnits");
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(objc_class *)v2 tsaxValueForKey:@"instance"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_tsaxRulerMarkerController
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPRulerControllerAccessibility *)self tsaxValueForKey:@"rulerMarkerController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end