@interface CRLCanvasHostedAccessibilityElement
- (BOOL)isAccessibilityElement;
- (CGRect)frame;
- (CGRect)frameInUnscaledCanvas;
- (CRLCanvasAccessibility)parentCanvas;
@end

@implementation CRLCanvasHostedAccessibilityElement

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CRLCanvasAccessibility)parentCanvas
{
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Abstract method", v3, v4, v5, v6, v7, vars0))abort(); {
  }
    }
  return 0;
}

- (CGRect)frameInUnscaledCanvas
{
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Abstract method", v3, v4, v5, v6, v7, vars0))abort(); {
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
  uint64_t v3 = [(CRLCanvasHostedAccessibilityElement *)self parentCanvas];
  [(CRLCanvasHostedAccessibilityElement *)self frameInUnscaledCanvas];
  [v3 crlaxScreenFrameFromUnscaledCanvas:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

@end