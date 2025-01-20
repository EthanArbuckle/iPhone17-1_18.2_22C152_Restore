@interface UITextInteractionInputDelegate
- (UITextInteraction)rootInteraction;
- (void)selectionDidChange:(id)a3;
- (void)selectionWillChange:(id)a3;
- (void)setRootInteraction:(id)a3;
- (void)textDidChange:(id)a3;
- (void)textWillChange:(id)a3;
@end

@implementation UITextInteractionInputDelegate

- (void)selectionWillChange:(id)a3
{
  id v6 = a3;
  v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 delegate];

  if (v4 == v6)
  {
    v5 = +[UIKeyboardImpl activeInstance];
    [v5 selectionWillChange:v6];
  }
}

- (void)selectionDidChange:(id)a3
{
  id v9 = a3;
  id v4 = [(UITextInteractionInputDelegate *)self rootInteraction];
  v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 delegate];

  if (v6 == v9)
  {
    v7 = +[UIKeyboardImpl activeInstance];
    [v7 selectionDidChange:v9];
  }
  v8 = [v4 assistantDelegate];
  [v8 selectionChanged];
}

- (void)textWillChange:(id)a3
{
  id v7 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 delegate];

  if (v5 == v7)
  {
    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 textWillChange:v7];
  }
  else
  {
    [(UITextInteractionInputDelegate *)self selectionWillChange:v7];
  }
}

- (void)textDidChange:(id)a3
{
  id v7 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 delegate];

  if (v5 == v7)
  {
    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 textDidChange:v7];
  }
  else
  {
    [(UITextInteractionInputDelegate *)self selectionDidChange:v7];
  }
}

- (UITextInteraction)rootInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootInteraction);
  return (UITextInteraction *)WeakRetained;
}

- (void)setRootInteraction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end