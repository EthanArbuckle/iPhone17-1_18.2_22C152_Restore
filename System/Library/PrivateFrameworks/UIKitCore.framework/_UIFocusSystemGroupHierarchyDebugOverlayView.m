@interface _UIFocusSystemGroupHierarchyDebugOverlayView
- (id)updatedAttributedLabelContent;
@end

@implementation _UIFocusSystemGroupHierarchyDebugOverlayView

- (id)updatedAttributedLabelContent
{
  v2 = +[UIFocusDebugger focusGroupsForEnvironment:self];
  v3 = [v2 attributedDescription];

  return v3;
}

@end