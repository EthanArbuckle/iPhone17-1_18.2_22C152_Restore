@interface _UITextDragCaretView
- (BOOL)_isRemoveAnimatesBackToCaret;
- (BOOL)rangesExcludeSelection;
- (CGRect)_configureMask:(id)a3 withPath:(id)a4;
- (_UITextDragCaretView)initWithTextInputView:(id)a3;
- (id)_caretColor;
- (id)_maskForRects:(id)a3;
- (id)_rangeColor;
- (id)_rectsForRange:(id)a3;
- (void)_insertAtRangeOrPosition:(id)a3 animations:(id)a4 completion:(id)a5 animated:(BOOL)a6;
- (void)_performUpdate:(id)a3;
- (void)_updateToRangeOrPosition:(id)a3 animations:(id)a4 completion:(id)a5 animated:(BOOL)a6;
- (void)insertAtPosition:(id)a3;
- (void)insertAtPosition:(id)a3 animations:(id)a4 completion:(id)a5;
- (void)insertAtRange:(id)a3;
- (void)insertAtRange:(id)a3 animations:(id)a4 completion:(id)a5;
- (void)remove;
- (void)removeWithAnimations:(id)a3 completion:(id)a4;
- (void)removeWithAnimations:(id)a3 completion:(id)a4 animated:(BOOL)a5;
- (void)setRangesExcludeSelection:(BOOL)a3;
- (void)updateToPosition:(id)a3;
- (void)updateToPosition:(id)a3 animations:(id)a4 completion:(id)a5;
- (void)updateToRange:(id)a3;
- (void)updateToRange:(id)a3 animations:(id)a4 completion:(id)a5;
@end

@implementation _UITextDragCaretView

- (_UITextDragCaretView)initWithTextInputView:(id)a3
{
  objc_initWeak(&location, a3);
  v9.receiver = self;
  v9.super_class = (Class)_UITextDragCaretView;
  v4 = [(UIView *)&v9 init];
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_view, v5);

    uint64_t v6 = [MEMORY[0x1E4F39C88] layer];
    mask = v4->_mask;
    v4->_mask = (CAShapeLayer *)v6;

    [(UIView *)v4 setUserInteractionEnabled:0];
  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)insertAtPosition:(id)a3
{
}

- (void)insertAtPosition:(id)a3 animations:(id)a4 completion:(id)a5
{
}

- (void)insertAtRange:(id)a3
{
}

- (void)insertAtRange:(id)a3 animations:(id)a4 completion:(id)a5
{
}

- (void)_insertAtRangeOrPosition:(id)a3 animations:(id)a4 completion:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained addSubview:self];

  id v14 = v10;
  char v15 = objc_opt_respondsToSelector();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v15) {
      goto LABEL_6;
    }
LABEL_7:
    id v17 = v14;
    goto LABEL_8;
  }
  int v16 = [v14 isEmpty];
  if ((v15 & 1) == 0) {
    goto LABEL_7;
  }
  if (!v16)
  {
LABEL_6:
    id v18 = v14;
    v19 = 0;
    goto LABEL_9;
  }
  id v17 = [v14 start];
LABEL_8:
  v19 = v17;
  id v18 = 0;
LABEL_9:

  id v20 = v18;
  id v21 = v19;
  v63 = v20;
  v64 = v12;
  v22 = v11;
  BOOL v23 = v6;
  if (v21)
  {
    v24 = [(_UITextDragCaretView *)self _caretColor];
    [(UIView *)self setBackgroundColor:v24];

    id v25 = objc_loadWeakRetained((id *)&self->_view);
    [v25 caretRectForPosition:v21];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    id v34 = objc_loadWeakRetained((id *)&self->_view);
    v35 = [v34 textInputView];
    objc_msgSend(v25, "convertRect:fromView:", v35, v27, v29, v31, v33);
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;

    v44 = 0;
  }
  else
  {
    v45 = [(_UITextDragCaretView *)self _rangeColor];
    [(UIView *)self setBackgroundColor:v45];

    mask = self->_mask;
    v47 = [(_UITextDragCaretView *)self _rectsForRange:v20];
    v48 = [(_UITextDragCaretView *)self _maskForRects:v47];
    [(_UITextDragCaretView *)self _configureMask:mask withPath:v48];
    double v37 = v49;
    double v39 = v50;
    double v41 = v51;
    double v43 = v52;

    v44 = self->_mask;
  }
  id v53 = objc_loadWeakRetained((id *)&self->_view);
  if ([v53 isFirstResponder])
  {
    id v54 = objc_loadWeakRetained((id *)&self->_view);
    [v54 _caretRect];
    BOOL IsEmpty = CGRectIsEmpty(v76);

    if (!IsEmpty)
    {
      id v56 = objc_loadWeakRetained((id *)&self->_view);
      [v56 _caretRect];
      -[UIView setFrame:](self, "setFrame:");

      v57 = [(UIView *)self layer];
      [v57 setMask:0];

      goto LABEL_17;
    }
  }
  else
  {
  }
  -[UIView setAlpha:](self, "setAlpha:", 0.0, v63);
  CGAffineTransformMakeScale(&v75, 2.0, 2.0);
  CGAffineTransform v74 = v75;
  [(UIView *)self setTransform:&v74];
  -[UIView setFrame:](self, "setFrame:", v37, v39, v41, v43);
LABEL_17:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80___UITextDragCaretView__insertAtRangeOrPosition_animations_completion_animated___block_invoke;
  aBlock[3] = &unk_1E530A070;
  aBlock[4] = self;
  double v70 = v37;
  double v71 = v39;
  double v72 = v41;
  double v73 = v43;
  v58 = v44;
  v68 = v58;
  id v59 = v22;
  id v69 = v59;
  v60 = _Block_copy(aBlock);
  v61 = v60;
  if (v64) {
    v62 = v64;
  }
  else {
    v62 = (void (**)(void))&__block_literal_global_550;
  }
  if (v23)
  {
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __80___UITextDragCaretView__insertAtRangeOrPosition_animations_completion_animated___block_invoke_3;
    v65[3] = &unk_1E52E8F50;
    v66 = v62;
    +[UIView _animateUsingSpringWithTension:0 friction:v61 interactive:v65 animations:400.0 completion:35.0];
  }
  else
  {
    (*((void (**)(void *))v60 + 2))(v60);
    v62[2](v62);
  }
}

- (void)updateToPosition:(id)a3
{
}

- (void)updateToPosition:(id)a3 animations:(id)a4 completion:(id)a5
{
}

- (void)updateToRange:(id)a3
{
}

- (void)updateToRange:(id)a3 animations:(id)a4 completion:(id)a5
{
}

- (void)_updateToRangeOrPosition:(id)a3 animations:(id)a4 completion:(id)a5 animated:(BOOL)a6
{
  BOOL v68 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10) {
    v12 = v10;
  }
  else {
    v12 = &__block_literal_global_18_5;
  }
  if (v11) {
    v13 = v11;
  }
  else {
    v13 = &__block_literal_global_20_7;
  }
  id v69 = v9;
  char v14 = objc_opt_respondsToSelector();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v14) {
      goto LABEL_12;
    }
LABEL_13:
    id v16 = v69;
    goto LABEL_14;
  }
  int v15 = [v69 isEmpty];
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
  if (!v15)
  {
LABEL_12:
    id v17 = v69;
    id v18 = 0;
    goto LABEL_15;
  }
  id v16 = [v69 start];
LABEL_14:
  id v18 = v16;
  id v17 = 0;
LABEL_15:

  id v19 = v17;
  id v20 = v18;
  if (v20)
  {
    id v67 = v17;
    id v21 = v18;
    uint64_t v22 = objc_opt_new();
    p_view = &self->_view;
    id v24 = objc_loadWeakRetained((id *)&self->_view);
    id v25 = self;
    id v26 = v19;
    double v27 = v13;
    double v28 = v12;
    id v29 = v24;
    [v24 caretRectForPosition:v20];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    double v39 = [WeakRetained textInputView];
    objc_msgSend(v29, "convertRect:fromView:", v39, v31, v33, v35, v37);
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;

    v12 = v28;
    v13 = v27;
    id v19 = v26;
    self = v25;
    v48 = (void *)v22;
    id v18 = v21;
    id v17 = v67;
  }
  else
  {
    double v49 = [(_UITextDragCaretView *)self _rectsForRange:v19];
    v48 = [(_UITextDragCaretView *)self _maskForRects:v49];

    [v48 bounds];
    CGFloat v41 = v50;
    CGFloat v43 = v51;
    CGFloat v45 = v52;
    CGFloat v47 = v53;
  }
  [(UIView *)self frame];
  v72.origin.x = v41;
  v72.origin.y = v43;
  v72.size.width = v45;
  v72.size.height = v47;
  if (!CGRectEqualToRect(v71, v72))
  {
    uint64_t v54 = objc_opt_new();
    objc_storeStrong((id *)(v54 + 8), v18);
    objc_storeStrong((id *)(v54 + 16), v17);
    objc_storeStrong((id *)(v54 + 24), v48);
    v55 = _Block_copy(v12);
    id v56 = *(void **)(v54 + 32);
    *(void *)(v54 + 32) = v55;

    v57 = _Block_copy(v13);
    v58 = *(void **)(v54 + 40);
    *(void *)(v54 + 40) = v57;

    *(unsigned char *)(v54 + 48) = v68;
    if (!v20) {
      goto LABEL_23;
    }
    if (!v68) {
      goto LABEL_23;
    }
    id v59 = objc_loadWeakRetained((id *)&self->_view);
    [v59 tokenizer];
    v60 = v48;
    v61 = self;
    id v62 = v19;
    v63 = v13;
    v65 = v64 = v12;
    int v66 = [v65 isPosition:v20 atBoundary:4 inDirection:1];

    v12 = v64;
    v13 = v63;
    id v19 = v62;
    self = v61;
    v48 = v60;

    if (v66) {
      [(_UITextDragCaretView *)self performSelector:sel__performUpdate_ withObject:v54 afterDelay:0.5];
    }
    else {
LABEL_23:
    }
      [(_UITextDragCaretView *)self _performUpdate:v54];
  }
}

- (void)_performUpdate:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self];
  id v5 = *((id *)v4 + 1);
  id v6 = *((id *)v4 + 3);
  v7 = _Block_copy(*((const void **)v4 + 4));
  v8 = (void (**)(void))_Block_copy(*((const void **)v4 + 5));
  int v9 = v4[48];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___UITextDragCaretView__performUpdate___block_invoke;
  aBlock[3] = &unk_1E52E32C0;
  aBlock[4] = self;
  id v10 = v5;
  id v18 = v10;
  id v11 = v6;
  id v19 = v11;
  char v21 = v9;
  id v12 = v7;
  id v20 = v12;
  v13 = _Block_copy(aBlock);
  char v14 = v13;
  if (v9)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39___UITextDragCaretView__performUpdate___block_invoke_2;
    v15[3] = &unk_1E52E8F50;
    id v16 = v8;
    +[UIView _animateUsingSpringWithTension:1 friction:v14 interactive:v15 animations:400.0 completion:35.0];
  }
  else
  {
    (*((void (**)(void *))v13 + 2))(v13);
    v8[2](v8);
  }
}

- (void)remove
{
}

- (void)removeWithAnimations:(id)a3 completion:(id)a4
{
}

- (void)removeWithAnimations:(id)a3 completion:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(_UITextDragCaretView *)self _isRemoveAnimatesBackToCaret])
  {
    id v10 = v23;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    id v11 = __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke;
  }
  else
  {
    id v10 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    id v11 = __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke_2;
  }
  v10[2] = v11;
  v10[3] = &unk_1E52DA160;
  v10[4] = self;
  id v12 = v8;
  v10[5] = v12;
  v13 = (void (**)(void))_Block_copy(v10);

  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke_3;
  id v19 = &unk_1E5305158;
  id v20 = self;
  id v14 = v9;
  id v21 = v14;
  int v15 = (void (**)(void *, uint64_t, void))_Block_copy(&v16);
  if (v5)
  {
    +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v13, v15, 400.0, 35.0, v16, v17, v18, v19, v20);
  }
  else
  {
    v13[2](v13);
    v15[2](v15, 1, 0);
  }
}

- (BOOL)_isRemoveAnimatesBackToCaret
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ([WeakRetained isFirstResponder])
  {
    id v4 = objc_loadWeakRetained((id *)p_view);
    [v4 _caretRect];
    BOOL v5 = !CGRectIsEmpty(v7);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_caretColor
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || (id v5 = objc_loadWeakRetained((id *)p_view),
        [v5 insertionPointColor],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    id v6 = +[UIColor insertionPointColor];
  }
  return v6;
}

- (id)_rangeColor
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || (id v5 = objc_loadWeakRetained((id *)p_view),
        [v5 selectionHighlightColor],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    id v6 = +[UIColor selectionHighlightColor];
  }
  return v6;
}

- (id)_rectsForRange:(id)a3
{
  p_view = &self->_view;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  id v6 = [WeakRetained selectionRectsForRange:v4];

  return v6;
}

- (id)_maskForRects:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [v11 rect];
        if (!CGRectIsEmpty(v56))
        {
          [v11 rect];
          id v12 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
          [v5 appendPath:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v8);
  }

  if ([(_UITextDragCaretView *)self rangesExcludeSelection])
  {
    p_view = &self->_view;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v15 = [WeakRetained selectedTextRange];
    if (!v15)
    {
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v16 = (void *)v15;
    id v17 = objc_loadWeakRetained((id *)p_view);
    id v18 = [v17 selectedTextRange];
    if ([v18 _isCaret])
    {

      goto LABEL_14;
    }
    id v20 = objc_loadWeakRetained((id *)p_view);
    id v21 = [v20 selectedTextRange];
    char v43 = [v21 isEmpty];

    if ((v43 & 1) == 0)
    {
      id WeakRetained = objc_opt_new();
      id v22 = objc_loadWeakRetained((id *)p_view);
      BOOL v23 = [v22 selectedTextRange];
      id v24 = [v22 selectionRectsForRange:v23];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v6 = v24;
      uint64_t v25 = [v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v45 != v27) {
              objc_enumerationMutation(v6);
            }
            id v29 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            [v29 rect];
            if (!CGRectIsEmpty(v57))
            {
              [v29 rect];
              double v30 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
              [WeakRetained appendPath:v30];
            }
          }
          uint64_t v26 = [v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v26);
      }

      [v5 bounds];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      [WeakRetained bounds];
      v59.origin.x = v39;
      v59.origin.y = v40;
      v59.size.width = v41;
      v59.size.height = v42;
      v58.origin.x = v32;
      v58.origin.y = v34;
      v58.size.width = v36;
      v58.size.height = v38;
      if (CGRectIntersectsRect(v58, v59))
      {
        [v5 setUsesEvenOddFillRule:1];
        [v5 appendPath:WeakRetained];
      }
      goto LABEL_14;
    }
  }
LABEL_15:

  return v5;
}

- (CGRect)_configureMask:(id)a3 withPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  CGAffineTransformMakeTranslation(&v28, -v7, -v9);
  [v5 applyTransform:&v28];
  id v15 = v5;
  objc_msgSend(v6, "setPath:", objc_msgSend(v15, "CGPath"));
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  objc_msgSend(v6, "setFrame:", v17, v19, v21, v23);
  double v24 = v8;
  double v25 = v10;
  double v26 = v12;
  double v27 = v14;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)rangesExcludeSelection
{
  return self->_rangesExcludeSelection;
}

- (void)setRangesExcludeSelection:(BOOL)a3
{
  self->_rangesExcludeSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end