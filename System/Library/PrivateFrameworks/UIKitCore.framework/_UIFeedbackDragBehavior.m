@interface _UIFeedbackDragBehavior
- (void)snappedToFinalPosition;
@end

@implementation _UIFeedbackDragBehavior

- (void)snappedToFinalPosition
{
  id v4 = [(_UIDragFeedbackGenerator *)self _dragConfiguration];
  v3 = [v4 interactionEndedFeedback];
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v3, 1.79769313e308, 1.79769313e308);
}

@end