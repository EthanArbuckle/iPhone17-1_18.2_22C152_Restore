@interface _UITextChoiceInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UITapGestureRecognizer)underlineTap;
- (UIView)textView;
- (UIView)view;
- (_UITextChoiceInteraction)initWithDelegate:(id)a3;
- (_UITextChoiceInteractionDelegate)delegate;
- (void)createGestureRecognizer;
- (void)didMoveToView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTextView:(id)a3;
- (void)setUnderlineTap:(id)a3;
- (void)tapInteraction:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UITextChoiceInteraction

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UIView *)WeakRetained;
}

- (_UITextChoiceInteraction)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextChoiceInteraction;
  v5 = [(_UITextChoiceInteraction *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)willMoveToView:(id)a3
{
  id v4 = [(_UITextChoiceInteraction *)self textView];

  if (v4)
  {
    id v6 = [(_UITextChoiceInteraction *)self textView];
    v5 = [(_UITextChoiceInteraction *)self underlineTap];
    [v6 removeGestureRecognizer:v5];
  }
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  [(_UITextChoiceInteraction *)self createGestureRecognizer];
  id v4 = [(_UITextChoiceInteraction *)self underlineTap];
  [v5 addGestureRecognizer:v4];

  [(_UITextChoiceInteraction *)self setTextView:v5];
}

- (void)createGestureRecognizer
{
  v3 = [(_UITextChoiceInteraction *)self underlineTap];

  if (!v3)
  {
    id v4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel_tapInteraction_];
    [(_UITextChoiceInteraction *)self setUnderlineTap:v4];

    id v5 = [(_UITextChoiceInteraction *)self underlineTap];
    [v5 setNumberOfTapsRequired:1];

    id v6 = [(_UITextChoiceInteraction *)self underlineTap];
    [v6 setNumberOfTouchesRequired:1];

    v7 = [(_UITextChoiceInteraction *)self underlineTap];
    [v7 setDelegate:self];
  }
  id v8 = [(_UITextChoiceInteraction *)self underlineTap];
  [v8 setEnabled:1];
}

- (void)tapInteraction:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 3)
  {
    id v4 = [(_UITextChoiceInteraction *)self delegate];
    id v5 = [(_UITextChoiceInteraction *)self textView];
    [v6 locationInView:v5];
    objc_msgSend(v4, "textChoiceInteraction:receivedTapAtLocation:", self);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextChoiceInteraction *)self delegate];
  id v6 = [(_UITextChoiceInteraction *)self textView];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  LOBYTE(self) = objc_msgSend(v5, "textChoiceInteraction:shouldRespondToTapAtPoint:", self, v8, v10);
  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (_UITextChoiceInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextChoiceInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UIView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (UITapGestureRecognizer)underlineTap
{
  return self->_underlineTap;
}

- (void)setUnderlineTap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlineTap, 0);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end