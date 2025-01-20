@interface _UIFocusSystemPFEDebugOverlayView
- (id)updatedAttributedLabelContent;
@end

@implementation _UIFocusSystemPFEDebugOverlayView

- (id)updatedAttributedLabelContent
{
  v2 = [(UIView *)self _focusSystem];
  v3 = +[UIFocusDebugger preferredFocusEnvironmentsForEnvironment:v2];
  v4 = [v3 attributedDescription];

  return v4;
}

@end