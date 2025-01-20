@interface TSWPShapeRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxIsIgnored;
- (NSString)tsaxPlaceholderDescription;
- (NSString)tsaxShapeString;
- (TSWPRepAccessibility)tsaxContainedRep;
- (TSWPShapeInfoAccessibility)tsaxInfo;
- (id)tsaxFocusedElement;
- (id)tsaxSummaryDescription;
- (void)willBeginEditingContainedRep;
@end

@implementation TSWPShapeRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPShapeRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxShapeString
{
  v2 = [(TSWPShapeRepAccessibility *)self tsaxInfo];

  return [(TSWPShapeInfoAccessibility *)v2 tsaxShapeString];
}

- (TSWPShapeInfoAccessibility)tsaxInfo
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSWPShapeInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"info"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)tsaxPlaceholderDescription
{
  return 0;
}

- (TSWPRepAccessibility)tsaxContainedRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSWPRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"containedRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)willBeginEditingContainedRep
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeRepAccessibility;
  [(TSWPShapeRepAccessibility *)&v3 willBeginEditingContainedRep];
  if ([(TSWPShapeRepAccessibility *)self tsaxRespondsToSelector:"tsaxShapeRepWillBeginEditingContainedRep:" fromOptionalExtrasProtocol:&OBJC_PROTOCOL___TSWPShapeRepAccessibilityExtas])[(TSWPShapeRepAccessibility *)self tsaxShapeRepWillBeginEditingContainedRep:self]; {
}
  }

- (id)tsaxSummaryDescription
{
  if ([(TSWPShapeInfoAccessibility *)[(TSWPShapeRepAccessibility *)self tsaxInfo] tsaxIsTextBox])
  {
    objc_super v3 = TSAccessibilityLocalizedString(@"rep.summary.textbox.formatter %@");
    v4 = [(TSWPRepAccessibility *)[(TSWPShapeRepAccessibility *)self tsaxContainedRep] tsaxSummaryDescription];
  }
  else
  {
    objc_super v3 = TSAccessibilityLocalizedString(@"rep.summary.shape.formatter %@");
    v4 = [(TSDShapeRepAccessibility *)self tsaxShapeTypeDescription];
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v4);
}

- (BOOL)tsaxIsIgnored
{
  return 1;
}

- (id)tsaxFocusedElement
{
  char v6 = 0;
  objc_super v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"containedRep"], 1, &v6);
  if (v6) {
    abort();
  }
  if (!result)
  {
    v5.receiver = self;
    v5.super_class = (Class)TSWPShapeRepAccessibility;
    return [(TSDRepAccessibility *)&v5 tsaxFocusedElement];
  }
  return result;
}

@end