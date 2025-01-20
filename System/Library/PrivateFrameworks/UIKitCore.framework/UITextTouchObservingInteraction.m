@interface UITextTouchObservingInteraction
- (UILongPressGestureRecognizer)longPressGesture;
- (UIView)view;
- (void)_addGestureRecognizers;
- (void)_createGestureRecognizersIfNecessary;
- (void)_removeGestureRecognizers;
- (void)didMoveToView:(id)a3;
- (void)longPressObserved:(id)a3;
- (void)setLongPressGesture:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UITextTouchObservingInteraction

- (void)willMoveToView:(id)a3
{
  if (!a3) {
    [(UITextTouchObservingInteraction *)self _removeGestureRecognizers];
  }
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    [(UITextTouchObservingInteraction *)self _addGestureRecognizers];
  }
}

- (void)_addGestureRecognizers
{
  [(UITextTouchObservingInteraction *)self _createGestureRecognizersIfNecessary];
  id v4 = [(UITextTouchObservingInteraction *)self view];
  v3 = [(UITextTouchObservingInteraction *)self longPressGesture];
  [v4 addGestureRecognizer:v3];
}

- (void)_removeGestureRecognizers
{
  id v4 = [(UITextTouchObservingInteraction *)self view];
  v3 = [(UITextTouchObservingInteraction *)self longPressGesture];
  [v4 removeGestureRecognizer:v3];
}

- (void)_createGestureRecognizersIfNecessary
{
  v3 = [(UITextTouchObservingInteraction *)self longPressGesture];

  if (!v3)
  {
    v5 = [(UILongPressGestureRecognizer *)[_UITouchObservingLongPress alloc] initWithTarget:self action:sel_longPressObserved_];
    [(UIGestureRecognizer *)v5 setEnabled:1];
    [(UIGestureRecognizer *)v5 setDelegate:self];
    [(UIGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(UILongPressGestureRecognizer *)v5 setMinimumPressDuration:0.0];
    [(UILongPressGestureRecognizer *)v5 setNumberOfTouchesRequired:3];
    id v4 = +[_UITextSelectionSettings sharedInstance];
    [v4 allowableSeparation];
    -[UILongPressGestureRecognizer _setAllowableSeparation:](v5, "_setAllowableSeparation:");

    [(UILongPressGestureRecognizer *)v5 _setAllowableTouchTimeSeparation:0.06];
    [(UITextTouchObservingInteraction *)self setLongPressGesture:v5];
  }
}

- (void)longPressObserved:(id)a3
{
  uint64_t v3 = [a3 state];
  if ((unint64_t)(v3 - 3) >= 3)
  {
    if (v3 != 1) {
      return;
    }
    id v4 = +[UIKeyboardImpl sharedInstance];
    id v6 = v4;
    uint64_t v5 = 1;
  }
  else
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    id v6 = v4;
    uint64_t v5 = 0;
  }
  objc_msgSend(v4, "set_mimicShiftBeingHeld:", v5);
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end