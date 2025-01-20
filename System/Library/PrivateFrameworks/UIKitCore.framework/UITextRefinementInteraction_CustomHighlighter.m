@interface UITextRefinementInteraction_CustomHighlighter
- (BOOL)doesControlDelegate;
- (UITextRefinementInteraction_CustomHighlighter)initWithLongPressGesture:(id)a3;
@end

@implementation UITextRefinementInteraction_CustomHighlighter

- (UITextRefinementInteraction_CustomHighlighter)initWithLongPressGesture:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextRefinementInteraction_CustomHighlighter;
  v5 = [(UITextInteraction *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    [v6 setName:@"com.apple.UIKit.textLoupe"];
    [(UITextInteraction *)v5 addGestureRecognizer:v6 withName:0x1ED1740E0];
  }
  return v5;
}

- (BOOL)doesControlDelegate
{
  return 0;
}

@end