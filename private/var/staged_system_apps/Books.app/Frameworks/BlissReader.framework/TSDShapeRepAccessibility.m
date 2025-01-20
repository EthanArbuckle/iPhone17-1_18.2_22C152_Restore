@interface TSDShapeRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxIsIgnored;
- (NSString)tsaxShapeLabel;
- (NSString)tsaxShapeTypeDescription;
- (TSDShapeInfoAccessibility)tsaxShapeInfo;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)tsaxHelpDescription;
- (id)tsaxKnobLabel;
@end

@implementation TSDShapeRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDShapeRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSDShapeInfoAccessibility)tsaxShapeInfo
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDShapeInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"shapeInfo"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)tsaxShapeTypeDescription
{
  id v2 = [self tsaxValueForKey:@"shapeInfo" tsaxValueForKey:@"pathSource"];

  return (NSString *)[v2 tsaxLabel];
}

- (NSString)tsaxShapeLabel
{
  v3 = [(TSDRepAccessibility *)self tsaxLockedLabel];
  v4 = [(TSDShapeInfoAccessibility *)[(TSDShapeRepAccessibility *)self tsaxShapeInfo] tsaxShapeTypeDescription];
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString(@"shape");
}

- (id)tsaxHelpDescription
{
  id v3 = [self tsaxValueForKey:@"shapeLayout" tsaxValueForKey:@"layoutInfoGeometry"];
  v4 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];
  [v3 tsaxCGSizeValueForKey:@"size"];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString(@"object.size.formatter %@ %@"), -[TSDInteractiveCanvasControllerAccessibility tsaxDescriptionOfPointValueConvertedToRulerUnit:](v4, "tsaxDescriptionOfPointValueConvertedToRulerUnit:"), [(TSDInteractiveCanvasControllerAccessibility *)v4 tsaxDescriptionOfPointValueConvertedToRulerUnit:v5]);
  [v3 tsaxCGFloatValueForKey:@"angle"];
  if (v6 != 0.0) {
    +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"shape.angle %f"), *(void *)&v6];
  }
  id v7 = [self tsaxValueForKey:@"shapeInfo" tsaxValueForKey:@"style"];
  char v19 = 0;
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = __TSAccessibilityCastAsClass(v8, (uint64_t)[v7 tsaxValueForKey:@"name"], 1, &v19);
  if (v19) {
    abort();
  }
  uint64_t v10 = v9;
  v11 = [(TSDShapeRepAccessibility *)self tsaxShapeLabel];
  [(TSDRepAccessibility *)self tsaxLockedHint];
  return __TSAccessibilityStringForVariables(1, v11, v12, v13, v14, v15, v16, v17, v10);
}

- (BOOL)tsaxIsIgnored
{
  id v2 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];

  return [(TSDInteractiveCanvasControllerAccessibility *)v2 tsaxShapeRepsAreIgnored];
}

- (BOOL)isAccessibilityElement
{
  v5.receiver = self;
  v5.super_class = (Class)TSDShapeRepAccessibility;
  BOOL v3 = [(TSDRepAccessibility *)&v5 isAccessibilityElement];
  if (v3) {
    LOBYTE(v3) = ![(TSDShapeRepAccessibility *)self tsaxIsIgnored];
  }
  return v3;
}

- (id)accessibilityLabel
{
  if ([(TSDRepAccessibility *)self tsaxHasComment]) {
    BOOL v3 = TSAccessibilityLocalizedString(@"annotation.object.has.comment");
  }
  else {
    BOOL v3 = 0;
  }
  v4 = [(TSDShapeRepAccessibility *)self tsaxShapeLabel];
  return __TSAccessibilityStringForVariables(1, v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
}

- (id)accessibilityHint
{
  v12.receiver = self;
  v12.super_class = (Class)TSDShapeRepAccessibility;
  id v3 = [(TSDRepAccessibility *)&v12 accessibilityHint];
  v4 = [(TSDShapeInfoAccessibility *)[(TSDShapeRepAccessibility *)self tsaxShapeInfo] tsaxShapeStyleName];
  return __TSAccessibilityStringForVariables(1, v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
}

@end