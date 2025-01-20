@interface UIWKTextInteractionAssistant
+ (void)initialize;
- (void)be_addGestureRecognizersToView:(id)a3;
- (void)be_rangeSelectionEnded:(CGPoint)a3;
- (void)be_rangeSelectionStarted:(CGPoint)a3;
@end

@implementation UIWKTextInteractionAssistant

+ (void)initialize
{
  BESwizzleInstanceMethods((objc_class *)a1, "rangeSelectionStarted:", "be_rangeSelectionStarted:");
  BESwizzleInstanceMethods((objc_class *)a1, "rangeSelectionEnded:", "be_rangeSelectionEnded:");

  BESwizzleInstanceMethods((objc_class *)a1, "addGestureRecognizersToView:", "be_addGestureRecognizersToView:");
}

- (void)be_rangeSelectionStarted:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(UIWKTextInteractionAssistant *)self view];
  v7 = [v6 be_textInteractionAssistantDelegate];
  [v7 setIgnorePageTurnGestures:1];

  -[UIWKTextInteractionAssistant be_rangeSelectionStarted:](self, "be_rangeSelectionStarted:", x, y);
}

- (void)be_rangeSelectionEnded:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(UIWKTextInteractionAssistant *)self view];
  v7 = [v6 be_textInteractionAssistantDelegate];
  [v7 setIgnorePageTurnGestures:0];

  -[UIWKTextInteractionAssistant be_rangeSelectionEnded:](self, "be_rangeSelectionEnded:", x, y);
}

- (void)be_addGestureRecognizersToView:(id)a3
{
  id v4 = a3;
  [(UIWKTextInteractionAssistant *)self be_addGestureRecognizersToView:v4];
  id v6 = [(UIWKTextInteractionAssistant *)self view];
  v5 = [v6 be_textInteractionAssistantDelegate];
  [v5 adjustGesturesForTextInteractionAssistant:self view:v4];
}

@end