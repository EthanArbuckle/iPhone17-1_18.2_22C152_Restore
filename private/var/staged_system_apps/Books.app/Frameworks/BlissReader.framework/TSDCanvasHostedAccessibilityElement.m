@interface TSDCanvasHostedAccessibilityElement
- (CGRect)frame;
- (CGRect)frameInUnscaledCanvas;
- (TSDCanvasAccessibility)parentCanvas;
@end

@implementation TSDCanvasHostedAccessibilityElement

- (TSDCanvasAccessibility)parentCanvas
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Abstract method", v3, v4, v5, v6, v7, vars0))abort(); {
  }
    }
  return 0;
}

- (CGRect)frameInUnscaledCanvas
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Abstract method", v3, v4, v5, v6, v7, vars0))abort(); {
  }
    }
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)frame
{
  uint64_t v3 = [(TSDCanvasHostedAccessibilityElement *)self parentCanvas];
  [(TSDCanvasHostedAccessibilityElement *)self frameInUnscaledCanvas];

  -[TSDCanvasAccessibility tsaxScreenFrameFromUnscaledCanvas:](v3, "tsaxScreenFrameFromUnscaledCanvas:");
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

@end