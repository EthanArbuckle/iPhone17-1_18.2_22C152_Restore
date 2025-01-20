@interface _UIFocusSystemStatusDebugOverlayView
- (id)updatedAttributedLabelContent;
@end

@implementation _UIFocusSystemStatusDebugOverlayView

- (id)updatedAttributedLabelContent
{
  v2 = +[UIFocusDebugger _verboseStatus];
  v3 = [v2 attributedDescription];

  return v3;
}

@end