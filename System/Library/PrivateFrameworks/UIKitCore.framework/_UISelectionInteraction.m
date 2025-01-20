@interface _UISelectionInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isHinting;
- (BOOL)simulatePressesCallbacksForLegacyBehavior;
- (UITapGestureRecognizer)selectGestureRecognizer;
- (UIView)view;
- (_UIFocusSelectObserverGestureRecognizer)selectHighlightRecognizer;
- (_UISelectionInteraction)init;
- (_UISelectionInteractionDelegate)delegate;
- (void)didMoveToView:(id)a3;
- (void)highlightGestureHandler:(id)a3;
- (void)selectGestureHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSimulatePressesCallbacksForLegacyBehavior:(BOOL)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UISelectionInteraction

- (void)didMoveToView:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v4 = [(_UISelectionInteraction *)self selectGestureRecognizer];
    [v6 addGestureRecognizer:v4];

    v5 = [(_UISelectionInteraction *)self selectHighlightRecognizer];
    [v6 addGestureRecognizer:v5];
  }
  [(_UISelectionInteraction *)self setView:v6];
}

- (void)setView:(id)a3
{
}

- (_UIFocusSelectObserverGestureRecognizer)selectHighlightRecognizer
{
  selectHighlightRecognizer = self->_selectHighlightRecognizer;
  if (!selectHighlightRecognizer)
  {
    v4 = [[_UIFocusSelectObserverGestureRecognizer alloc] initWithTarget:self action:sel_highlightGestureHandler_];
    [(UIGestureRecognizer *)v4 setDelegate:self];
    v5 = self->_selectHighlightRecognizer;
    self->_selectHighlightRecognizer = v4;

    selectHighlightRecognizer = self->_selectHighlightRecognizer;
  }
  return selectHighlightRecognizer;
}

- (UITapGestureRecognizer)selectGestureRecognizer
{
  selectGestureRecognizer = self->_selectGestureRecognizer;
  if (!selectGestureRecognizer)
  {
    v4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel_selectGestureHandler_];
    [(UITapGestureRecognizer *)v4 setAllowedPressTypes:&unk_1ED3EFBD8];
    [(UIGestureRecognizer *)v4 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(UIGestureRecognizer *)v4 setEnabled:[(_UISelectionInteraction *)self isEnabled]];
    [(UIGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v4 setDelegate:self];
    v5 = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = v4;

    selectGestureRecognizer = self->_selectGestureRecognizer;
  }
  return selectGestureRecognizer;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)willMoveToView:(id)a3
{
  id v4 = [(_UISelectionInteraction *)self view];
  if (v4)
  {
    if (self->_selectHighlightRecognizer) {
      objc_msgSend(v4, "removeGestureRecognizer:");
    }
    if (self->_selectGestureRecognizer) {
      objc_msgSend(v4, "removeGestureRecognizer:");
    }
  }
  [(_UISelectionInteraction *)self setView:0];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v6;
  char v7 = objc_opt_respondsToSelector();

  if (v7) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v8;
}

- (_UISelectionInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISelectionInteraction;
  result = [(_UISelectionInteraction *)&v3 init];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    -[UIGestureRecognizer setEnabled:](self->_selectGestureRecognizer, "setEnabled:");
    selectHighlightRecognizer = self->_selectHighlightRecognizer;
    [(UIGestureRecognizer *)selectHighlightRecognizer setEnabled:v3];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectHighlightRecognizer, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
}

- (void)setSimulatePressesCallbacksForLegacyBehavior:(BOOL)a3
{
  self->_simulatePressesCallbacksForLegacyBehavior = a3;
}

- (BOOL)isHinting
{
  UIGestureRecognizerState v3 = [(UIGestureRecognizer *)self->_selectHighlightRecognizer state];
  if (v3 != UIGestureRecognizerStateBegan) {
    LOBYTE(v3) = [(UIGestureRecognizer *)self->_selectHighlightRecognizer state] == UIGestureRecognizerStateChanged;
  }
  return v3;
}

- (void)selectGestureHandler:(id)a3
{
  id v8 = a3;
  id v4 = [(_UISelectionInteraction *)self selectGestureRecognizer];

  id v5 = v8;
  if (v4 == v8)
  {
    BOOL v6 = [v8 state] == 3;
    id v5 = v8;
    if (v6)
    {
      char v7 = [(_UISelectionInteraction *)self delegate];
      [v7 _selectionInteractionDidSelect:self];

      id v5 = v8;
    }
  }
}

- (void)highlightGestureHandler:(id)a3
{
  id v11 = a3;
  id v4 = [(_UISelectionInteraction *)self selectHighlightRecognizer];

  id v5 = v11;
  if (v4 == v11)
  {
    uint64_t v6 = [v11 state];
    if ((unint64_t)(v6 - 3) >= 2)
    {
      BOOL v10 = v6 == 1;
      id v5 = v11;
      if (!v10 || (*(unsigned char *)&self->_flags & 1) == 0) {
        goto LABEL_2;
      }
      v9 = [(_UISelectionInteraction *)self delegate];
      [v9 _selectionInteractionDidBeginHinting:self];
    }
    else
    {
      id v5 = v11;
      if ((*(unsigned char *)&self->_flags & 2) == 0) {
        goto LABEL_2;
      }
      char v7 = [(_UISelectionInteraction *)self selectGestureRecognizer];
      uint64_t v8 = [v7 state];

      id v5 = v11;
      if (v8 == 3) {
        goto LABEL_2;
      }
      v9 = [(_UISelectionInteraction *)self delegate];
      [v9 _selectionInteractionDidCancelHinting:self];
    }

    id v5 = v11;
  }
LABEL_2:
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  selectGestureRecognizer = self->_selectGestureRecognizer;
  if (selectGestureRecognizer && (unint64_t)(selectGestureRecognizer->super._state - 1) < 3)
  {
    BOOL v5 = 1;
  }
  else
  {
    selectHighlightRecognizer = self->_selectHighlightRecognizer;
    if (selectHighlightRecognizer) {
      BOOL v5 = (unint64_t)(selectHighlightRecognizer->super._state - 1) < 3;
    }
    else {
      BOOL v5 = 0;
    }
  }
  char v7 = selectGestureRecognizer;
  if ([(UIGestureRecognizer *)v7 state] == UIGestureRecognizerStateCancelled) {
    goto LABEL_7;
  }
  uint64_t v9 = [(UIGestureRecognizer *)v7 state];

  if (v9 == 5) {
    return 0;
  }
  char v7 = self->_selectHighlightRecognizer;
  if ([(UIGestureRecognizer *)v7 state] == UIGestureRecognizerStateCancelled)
  {
LABEL_7:
    char v8 = 0;
LABEL_8:

    return v8;
  }
  uint64_t v11 = [(UIGestureRecognizer *)v7 state];

  BOOL v12 = v11 == 5;
  char v8 = v11 != 5;
  char v13 = v12 || v5;
  if ((v13 & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      return 1;
    }
    char v7 = [(_UISelectionInteraction *)self delegate];
    char v8 = [(_UIFocusSelectObserverGestureRecognizer *)v7 _selectionInteractionShouldBegin:self];
    goto LABEL_8;
  }
  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_selectGestureRecognizer != a3) {
    goto LABEL_2;
  }
  char v8 = self;
  id v9 = v6;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || ![(_UISelectionInteraction *)v8 simulatePressesCallbacksForLegacyBehavior])
  {

    char v7 = 0;
    goto LABEL_8;
  }
  int v10 = [v9 cancelsTouchesInView];

  if (v10)
  {
    char v8 = [v9 allowedPressTypes];
    char v7 = [(_UISelectionInteraction *)v8 containsObject:&unk_1ED3F4290];
LABEL_8:

    goto LABEL_9;
  }
LABEL_2:
  char v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_selectGestureRecognizer == a3
    && ((dyld_program_sdk_at_least() & 1) != 0
     || -[_UISelectionInteraction simulatePressesCallbacksForLegacyBehavior](self, "simulatePressesCallbacksForLegacyBehavior"))&& [v6 _isGestureType:0])
  {
    id v9 = [v6 allowedPressTypes];
    char v7 = [v9 containsObject:&unk_1ED3F4290];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (_UISelectionInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISelectionInteractionDelegate *)WeakRetained;
}

- (BOOL)simulatePressesCallbacksForLegacyBehavior
{
  return self->_simulatePressesCallbacksForLegacyBehavior;
}

@end