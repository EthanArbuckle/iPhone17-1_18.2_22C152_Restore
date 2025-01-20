@interface TSTFormulaInteractiveCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxFormulaEditingTextRep;
@end

@implementation TSTFormulaInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTFormulaInteractiveCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxFormulaEditingTextRep
{
  return [(TSTFormulaInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"p_formulaEditingTextRep"];
}

@end