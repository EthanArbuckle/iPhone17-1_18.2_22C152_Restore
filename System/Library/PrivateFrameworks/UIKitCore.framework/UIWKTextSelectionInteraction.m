@interface UIWKTextSelectionInteraction
- (void)didUpdateSelectionWithGesture:(id)a3;
- (void)twoFingerRangedSelectGesture:(id)a3;
- (void)willUpdateSelectionWithGesture:(id)a3;
@end

@implementation UIWKTextSelectionInteraction

- (void)willUpdateSelectionWithGesture:(id)a3
{
  v3 = objc_msgSend(-[UITextInteraction _textInput](self, "_textInput", a3), "interactionAssistant");
  [v3 willChangeSelection];
}

- (void)didUpdateSelectionWithGesture:(id)a3
{
  uint64_t v5 = [(UIResponder *)[(UITextInteraction *)self view] isEditable];
  v6 = objc_msgSend(-[UITextInteraction _textInput](self, "_textInput"), "interactionAssistant");
  [a3 location];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = gestureTypeForGestureRecognizer(a3, [(UIResponder *)[(UITextInteraction *)self view] isEditable]);
  uint64_t v12 = [a3 state];
  objc_msgSend(v6, "selectionChangedWithGestureAt:withGesture:withState:withFlags:", v11, v12, v5, v8, v10);
}

- (void)twoFingerRangedSelectGesture:(id)a3
{
  v4 = [(UITextInteraction *)self assistantDelegate];
  [(UITextInteraction_AssistantDelegate *)v4 setFirstResponderIfNecessary];
  [(UITextInteraction_AssistantDelegate *)v4 setSelectionHighlightMode:0];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "touches"), "objectAtIndex:", 0), "locationInView:", objc_msgSend((id)-[UITextInteraction_AssistantDelegate view](v4, "view"), "textInputView"));
  double v6 = v5;
  double v8 = v7;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "touches"), "objectAtIndex:", 1), "locationInView:", objc_msgSend((id)-[UITextInteraction_AssistantDelegate view](v4, "view"), "textInputView"));
  double v10 = v9;
  double v12 = v11;
  objc_msgSend((id)-[UITextInteraction_AssistantDelegate activeSelection](v4, "activeSelection"), "setGranularity:", 1);
  [(UITextInteraction_AssistantDelegate *)v4 view];
  char v13 = objc_opt_respondsToSelector();
  v14 = (void *)[(UITextInteraction_AssistantDelegate *)v4 view];
  if (v13)
  {
    uint64_t v15 = [a3 state];
    objc_msgSend(v14, "changeSelectionWithTouchesFrom:to:withGesture:withState:", 11, v15, v6, v8, v10, v12);
  }
  else if (objc_opt_respondsToSelector())
  {
    v16 = (void *)[(UITextInteraction_AssistantDelegate *)v4 view];
    uint64_t v17 = [a3 state];
    objc_msgSend(v16, "setSelectionFromPoint:toPoint:gesture:state:", 11, v17, v6, v8, v10, v12);
  }
}

@end