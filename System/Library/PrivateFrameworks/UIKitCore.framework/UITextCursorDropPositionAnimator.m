@interface UITextCursorDropPositionAnimator
- (BOOL)_hasActiveCaretSelection;
- (CGRect)_currentCaretRect;
- (UITextCursorDropPositionAnimator)initWithTextCursorView:(id)a3 textInput:(id)a4;
- (UITextCursorView)cursorView;
- (UITextInput)textInput;
- (id)_cursorColor;
- (id)_hostView;
- (void)_performWithAnimation:(BOOL)a3 :(id)a4;
- (void)_performWithAnimation:(BOOL)a3 :(id)a4 completion:(id)a5;
- (void)animateAlongsideChanges:(id)a3 completion:(id)a4;
- (void)placeCursorAtPosition:(id)a3 animated:(BOOL)a4;
- (void)setCursorVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation UITextCursorDropPositionAnimator

- (UITextCursorDropPositionAnimator)initWithTextCursorView:(id)a3 textInput:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UITextCursorDropPositionAnimator;
  v9 = [(UITextCursorDropPositionAnimator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cursorView, a3);
    objc_storeStrong((id *)&v10->_textInput, a4);
  }

  return v10;
}

- (id)_hostView
{
  return (id)[(UITextCursorView *)self->_cursorView superview];
}

- (void)_performWithAnimation:(BOOL)a3 :(id)a4
{
}

- (void)_performWithAnimation:(BOOL)a3 :(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = (void (**)(void))a4;
  v9 = (void (**)(void))a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  v10 = (void (**)(void))_Block_copy(aBlock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_2;
  v21[3] = &unk_1E52D9F70;
  v21[4] = self;
  v11 = (void (**)(void))_Block_copy(v21);
  if (v6)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_3;
    v18[3] = &unk_1E52DE9A0;
    v19 = v8;
    v20 = v10;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_4;
    v15 = &unk_1E5305850;
    v16 = v9;
    v17 = v11;
    +[UIView _animateUsingSpringWithTension:1 friction:v18 interactive:&v12 animations:400.0 completion:35.0];
  }
  else
  {
    v8[2](v8);
    v10[2](v10);
    v11[2](v11);
    if (v9) {
      v9[2](v9);
    }
  }
  [(NSMutableArray *)self->_alongsideAnimations removeAllObjects];
  [(NSMutableArray *)self->_alongsideCompletions removeAllObjects];
}

void __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)animateAlongsideChanges:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v17)
  {
    alongsideAnimations = self->_alongsideAnimations;
    if (!alongsideAnimations)
    {
      long long v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v9 = self->_alongsideAnimations;
      self->_alongsideAnimations = v8;

      alongsideAnimations = self->_alongsideAnimations;
    }
    v10 = (void *)[v17 copy];
    uint64_t v11 = _Block_copy(v10);
    [(NSMutableArray *)alongsideAnimations addObject:v11];
  }
  if (v6)
  {
    alongsideCompletions = self->_alongsideCompletions;
    if (!alongsideCompletions)
    {
      uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v14 = self->_alongsideCompletions;
      self->_alongsideCompletions = v13;

      alongsideCompletions = self->_alongsideCompletions;
    }
    v15 = (void *)[v6 copy];
    v16 = _Block_copy(v15);
    [(NSMutableArray *)alongsideCompletions addObject:v16];
  }
}

- (void)placeCursorAtPosition:(id)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (![(UITextCursorDropPositionAnimator *)self _hasActiveCaretSelection])
  {
    if (self->_didPerformInitialUpdate) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  self->_didPerformInitialUpdate = 1;
  [(UITextInput *)self->_textInput caretRectForPosition:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(UITextCursorDropPositionAnimator *)self _hostView];
  v16 = [(UITextInput *)self->_textInput textInputView];
  objc_msgSend(v15, "convertRect:fromView:", v16, v8, v10, v12, v14);
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__UITextCursorDropPositionAnimator_placeCursorAtPosition_animated___block_invoke;
  v25[3] = &unk_1E52DA520;
  v25[4] = self;
  v25[5] = v18;
  v25[6] = v20;
  v25[7] = v22;
  v25[8] = v24;
  [(UITextCursorDropPositionAnimator *)self _performWithAnimation:v4 :v25];
}

uint64_t __67__UITextCursorDropPositionAnimator_placeCursorAtPosition_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setCursorVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isCursorVisible != a3)
  {
    self->_isCursorVisible = a3;
    if (a4)
    {
      if (a3)
      {
        [(UITextCursorView *)self->_cursorView setHidden:0];
        [(UITextCursorView *)self->_cursorView setAlpha:0.0];
        if ([(UITextCursorDropPositionAnimator *)self _hasActiveCaretSelection])
        {
          [(UITextCursorDropPositionAnimator *)self _currentCaretRect];
          -[UITextCursorView setFrame:](self->_cursorView, "setFrame:");
        }
        CGAffineTransformMakeScale(&v11, 2.0, 2.0);
        cursorView = self->_cursorView;
        CGAffineTransform v10 = v11;
        [(UITextCursorView *)cursorView setTransform:&v10];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __62__UITextCursorDropPositionAnimator_setCursorVisible_animated___block_invoke;
        v9[3] = &unk_1E52D9F70;
        v9[4] = self;
        [(UITextCursorDropPositionAnimator *)self _performWithAnimation:1 :v9];
        goto LABEL_8;
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __62__UITextCursorDropPositionAnimator_setCursorVisible_animated___block_invoke_2;
      v8[3] = &unk_1E52D9F70;
      v8[4] = self;
      [(UITextCursorDropPositionAnimator *)self _performWithAnimation:1 :v8];
    }
    else
    {
      [(UITextCursorView *)self->_cursorView setHidden:!a3];
      if (a3)
      {
LABEL_8:
        double v7 = [(UITextCursorDropPositionAnimator *)self _cursorColor];
        [(UITextCursorView *)self->_cursorView setTintColor:v7];

        return;
      }
    }
    self->_didPerformInitialUpdate = 0;
  }
}

uint64_t __62__UITextCursorDropPositionAnimator_setCursorVisible_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __62__UITextCursorDropPositionAnimator_setCursorVisible_animated___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _dismissalAnimatesBackToCurrentCursorPosition];
  long long v3 = *(id **)(a1 + 32);
  if (v2)
  {
    [v3 _currentCaretRect];
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
    return objc_msgSend(v4, "setFrame:");
  }
  else
  {
    [v3[4] setAlpha:0.0];
    CGAffineTransformMakeScale(&v8, 0.8, 0.8);
    id v6 = *(void **)(*(void *)(a1 + 32) + 32);
    CGAffineTransform v7 = v8;
    return [v6 setTransform:&v7];
  }
}

- (CGRect)_currentCaretRect
{
  [(UITextInput *)self->_textInput _caretRect];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_hasActiveCaretSelection
{
  int v3 = [(UITextInput *)self->_textInput isFirstResponder];
  if (v3)
  {
    [(UITextCursorDropPositionAnimator *)self _currentCaretRect];
    LOBYTE(v3) = !CGRectIsEmpty(v5);
  }
  return v3;
}

- (id)_cursorColor
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(UITextInput *)self->_textInput insertionPointColor],
        (int v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v3 = +[UIColor insertionPointColor];
  }
  return v3;
}

- (UITextCursorView)cursorView
{
  return self->_cursorView;
}

- (UITextInput)textInput
{
  return self->_textInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInput, 0);
  objc_storeStrong((id *)&self->_cursorView, 0);
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
}

@end