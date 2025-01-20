@interface UITextIndirectEditableInteraction
- (UITextIndirectEditableInteraction)initWithView:(id)a3;
@end

@implementation UITextIndirectEditableInteraction

- (UITextIndirectEditableInteraction)initWithView:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UITextIndirectEditableInteraction;
  v4 = [(UITextInteraction *)&v9 init];
  v5 = v4;
  if (a3 && v4)
  {
    uint64_t v6 = +[_UIKeyboardBasedTextSelectionGestureController sharedInstance];
    textSelectionGestureController = v5->_textSelectionGestureController;
    v5->_textSelectionGestureController = (_UIKeyboardTextSelectionGestureController *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end