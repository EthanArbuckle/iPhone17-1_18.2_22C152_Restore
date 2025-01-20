@interface TSWPRulerMarkerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (NSString)tsaxLabel;
- (NSString)tsaxValueWithUnits;
- (TSWPRulerMarkerControllerAccessibility)tsaxParentRulerMarkerController;
- (double)_tsaxModelValue;
- (double)tsaxValue;
- (id)accessibilityHint;
- (int)_tsaxType;
- (void)tsaxSetParentRulerMarkerController:(id)a3;
@end

@implementation TSWPRulerMarkerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPRulerMarker";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSWPRulerMarkerControllerAccessibility)tsaxParentRulerMarkerController
{
  return (TSWPRulerMarkerControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_5738D7);
}

- (void)tsaxSetParentRulerMarkerController:(id)a3
{
}

- (NSString)tsaxLabel
{
  unsigned int v2 = [(TSWPRulerMarkerAccessibility *)self _tsaxType];
  if (v2 > 7) {
    return 0;
  }
  v3 = off_46BEC0[v2];

  return TSAccessibilityLocalizedString((uint64_t)v3);
}

- (NSString)tsaxValueWithUnits
{
  [(TSWPRulerMarkerAccessibility *)self tsaxValue];
  id v3 = TSAccessibilityLocalizedNumber((uint64_t)+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"ruler.formatter.general %@ %@"), v3, [(TSWPRulerMarkerControllerAccessibility *)[(TSWPRulerMarkerAccessibility *)self tsaxParentRulerMarkerController] tsaxCurrentRulerUnitsDescription]];
}

- (double)tsaxValue
{
  id v3 = [(TSWPRulerMarkerAccessibility *)self tsaxParentRulerMarkerController];
  [(TSWPRulerMarkerAccessibility *)self _tsaxModelValue];
  double v5 = v4;
  uint64_t v6 = [(TSWPRulerMarkerAccessibility *)self _tsaxType];

  [(TSWPRulerMarkerControllerAccessibility *)v3 tsaxEquivalentValueInCurrentRulerUnitsForModelValue:v6 andMarkerType:v5];
  return result;
}

- (double)_tsaxModelValue
{
  [(TSWPRulerMarkerAccessibility *)self tsaxCGFloatValueForKey:@"modelValue"];
  return result;
}

- (int)_tsaxType
{
  return [(TSWPRulerMarkerAccessibility *)self tsaxUnsignedIntValueForKey:@"type"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString(@"ruler.adjustment.hint");
}

@end