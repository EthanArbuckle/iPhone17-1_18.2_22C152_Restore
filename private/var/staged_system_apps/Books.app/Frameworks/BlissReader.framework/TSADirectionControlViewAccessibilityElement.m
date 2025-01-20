@interface TSADirectionControlViewAccessibilityElement
- (CGRect)accessibilityFrame;
- (TSADirectionControlViewControllerAccessibility)directionViewController;
- (UIView)directionView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setDirectionViewController:(id)a3;
@end

@implementation TSADirectionControlViewAccessibilityElement

- (UIView)directionView
{
  v2 = [(TSADirectionControlViewAccessibilityElement *)self directionViewController];

  return (UIView *)[(TSADirectionControlViewControllerAccessibility *)v2 tsaxDirectionView];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString(@"direction.control.description");
}

- (id)accessibilityValue
{
  v2 = [(TSADirectionControlViewAccessibilityElement *)self directionViewController];

  return [(TSADirectionControlViewControllerAccessibility *)v2 accessibilityValue];
}

- (CGRect)accessibilityFrame
{
  v2 = [(TSADirectionControlViewAccessibilityElement *)self directionView];

  [(UIView *)v2 accessibilityFrame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)accessibilityIncrement
{
  v2 = [(TSADirectionControlViewAccessibilityElement *)self directionViewController];

  [(TSADirectionControlViewControllerAccessibility *)v2 accessibilityIncrement];
}

- (void)accessibilityDecrement
{
  v2 = [(TSADirectionControlViewAccessibilityElement *)self directionViewController];

  [(TSADirectionControlViewControllerAccessibility *)v2 accessibilityDecrement];
}

- (TSADirectionControlViewControllerAccessibility)directionViewController
{
  return self->_directionViewController;
}

- (void)setDirectionViewController:(id)a3
{
  self->_directionViewController = (TSADirectionControlViewControllerAccessibility *)a3;
}

@end