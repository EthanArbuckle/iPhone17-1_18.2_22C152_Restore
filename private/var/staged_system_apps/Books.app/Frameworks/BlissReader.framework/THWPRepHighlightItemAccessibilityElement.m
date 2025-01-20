@interface THWPRepHighlightItemAccessibilityElement
- (BOOL)accessibilityActivate;
- (id)highlight;
@end

@implementation THWPRepHighlightItemAccessibilityElement

- (id)highlight
{
  v3 = [(TSDRepAccessibility *)[(THWPRepCustomRotorItemAccessibilityElement *)self parentRep] tsaxCanvasView];
  [(THWPRepHighlightItemAccessibilityElement *)self accessibilityActivationPoint];
  -[TSDCanvasViewAccessibility convertPoint:fromView:](v3, "convertPoint:fromView:", 0);
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:]([(TSWPRepAccessibility *)[(THWPRepCustomRotorItemAccessibilityElement *)self parentRep] tsaxInteractiveCanvasController], "tsaxConvertBoundsToUnscaledPoint:", v4, v5);
  double v7 = v6;
  double v9 = v8;
  v10 = [(THWPRepAccessibility *)[(THWPRepCustomRotorItemAccessibilityElement *)self parentRep] thaxHighlightController];

  return -[THWPHighlightControllerAccessibility thaxHighlightAtCanvasPoint:](v10, "thaxHighlightAtCanvasPoint:", v7, v9);
}

- (BOOL)accessibilityActivate
{
  id v3 = [(THWPRepHighlightItemAccessibilityElement *)self highlight];
  if (v3)
  {
    [(THWPHighlightControllerAccessibility *)[(THWPRepAccessibility *)[(THWPRepCustomRotorItemAccessibilityElement *)self parentRep] thaxHighlightController] thaxShowEditorForHighlight:v3];
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Could not perform AX activate on highlight item, falling back to tap", v5, v6, v7, v8, v9, v11))abort(); {
  }
    }
  return v3 != 0;
}

@end