@interface UIAccessibilityMathWebView
- (BOOL)_accessibilityIsMathTouchExplorationView;
@end

@implementation UIAccessibilityMathWebView

- (BOOL)_accessibilityIsMathTouchExplorationView
{
  return 1;
}

@end