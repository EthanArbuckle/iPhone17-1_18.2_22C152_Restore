@interface _UITextFloatingCursorSession
- (CGPoint)floatingCursorPositionForPoint:(CGPoint)a3 lineSnapping:(BOOL)a4;
- (UIStandardTextCursorView)floatingCursorView;
- (UITextSelectionDisplayInteraction)manager;
- (_UITextFloatingCursorSession)initWithCursorView:(id)a3 selectionManager:(id)a4;
- (id)_selectionContainerView;
- (id)_springAnimation;
- (void)_invalidate;
- (void)_invalidateAnimated:(BOOL)a3;
- (void)_updateCursorFadedHiddenForFloatingCursorAtPoint:(CGPoint)a3;
- (void)dealloc;
- (void)updateWithPoint:(CGPoint)a3 inContainer:(id)a4 animated:(BOOL)a5;
@end

@implementation _UITextFloatingCursorSession

- (_UITextFloatingCursorSession)initWithCursorView:(id)a3 selectionManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_UITextFloatingCursorSession;
  v8 = [(_UITextFloatingCursorSession *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v7);
    v9->_isValid = 1;
    uint64_t v10 = [v6 _createFloatingCursorView];
    floatingCursorView = v9->_floatingCursorView;
    v9->_floatingCursorView = (UIStandardTextCursorView *)v10;

    v12 = [(_UITextFloatingCursorSession *)v9 _selectionContainerView];
    [v12 addSubview:v9->_floatingCursorView];

    uint64_t v13 = [v7 _obtainGhostCursorAssertion];
    ghostCursorAssertion = v9->_ghostCursorAssertion;
    v9->_ghostCursorAssertion = (UITextCursorAssertion *)v13;

    [v6 frame];
    double v17 = v16 + v15 * 0.5;
    double v20 = v19 + v18 * 0.5;
    v21 = [v6 superview];
    -[_UITextFloatingCursorSession updateWithPoint:inContainer:animated:](v9, "updateWithPoint:inContainer:animated:", v21, 0, v17, v20);
  }
  return v9;
}

- (void)updateWithPoint:(CGPoint)a3 inContainer:(id)a4 animated:(BOOL)a5
{
  if (self->_isValid)
  {
    BOOL v5 = a5;
    double y = a3.y;
    double x = a3.x;
    id v9 = a4;
    uint64_t v10 = [(_UITextFloatingCursorSession *)self _selectionContainerView];
    objc_msgSend(v10, "convertPoint:fromCoordinateSpace:", v9, x, y);

    -[_UITextFloatingCursorSession floatingCursorPositionForPoint:lineSnapping:](self, "floatingCursorPositionForPoint:lineSnapping:", 1, x, y);
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    if (v5)
    {
      double v15 = [(_UITextFloatingCursorSession *)self _springAnimation];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __69___UITextFloatingCursorSession_updateWithPoint_inContainer_animated___block_invoke;
      v17[3] = &unk_1E52DD178;
      v17[4] = self;
      v17[5] = v13;
      v17[6] = v14;
      +[UIView _animateUsingSpringBehavior:v15 tracking:0 animations:v17 completion:0];
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __69___UITextFloatingCursorSession_updateWithPoint_inContainer_animated___block_invoke_2;
      v16[3] = &unk_1E52DD178;
      v16[4] = self;
      v16[5] = v11;
      v16[6] = v12;
      +[UIView _animateByRetargetingAnimations:v16 completion:0];
    }
    -[_UITextFloatingCursorSession _updateCursorFadedHiddenForFloatingCursorAtPoint:](self, "_updateCursorFadedHiddenForFloatingCursorAtPoint:", x, y);
  }
}

- (void)_invalidateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isValid = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  BOOL v5 = _Block_copy(aBlock);
  id v6 = v5;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    v8 = [WeakRetained cursorView];

    id v9 = [(_UITextFloatingCursorSession *)self _springAnimation];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke_2;
    v13[3] = &unk_1E52D9F98;
    v13[4] = self;
    id v14 = v8;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke_3;
    v11[3] = &unk_1E52E8F50;
    id v12 = v6;
    id v10 = v8;
    +[UIView _animateUsingSpringBehavior:v9 tracking:0 animations:v13 completion:v11];
  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }
}

- (void)_invalidate
{
}

- (void)dealloc
{
  if (self->_isValid) {
    [(_UITextFloatingCursorSession *)self _invalidateAnimated:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)_UITextFloatingCursorSession;
  [(_UITextFloatingCursorSession *)&v3 dealloc];
}

- (id)_springAnimation
{
  return +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.18];
}

- (void)_updateCursorFadedHiddenForFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_manager = &self->_manager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  id v7 = [WeakRetained cursorView];
  [v7 frame];
  double v10 = v9 + v8 * 0.5;
  double v13 = v12 + v11 * 0.5;

  BOOL v14 = vabdd_f64(v10, x) < 15.0;
  BOOL v15 = vabdd_f64(v13, y) < 30.0 && v14;
  id v16 = objc_loadWeakRetained((id *)p_manager);
  [v16 _setCursorFadedHiddenForFloatingCursor:v15 animated:1];
}

- (id)_selectionContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_super v3 = [WeakRetained _hostViewAboveText];

  return v3;
}

- (CGPoint)floatingCursorPositionForPoint:(CGPoint)a3 lineSnapping:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  p_manager = &self->_manager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  double v10 = [WeakRetained textInput];
  char v11 = objc_opt_respondsToSelector();

  id v12 = objc_loadWeakRetained((id *)p_manager);
  double v13 = [v12 textInput];
  BOOL v14 = v13;
  if (v11)
  {
    [v13 selectionClipRect];
LABEL_5:
    double v20 = v15;
    double v21 = v16;
    double v22 = v17;
    double v23 = v18;

    goto LABEL_7;
  }
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v12 = objc_loadWeakRetained((id *)p_manager);
    BOOL v14 = [v12 textInput];
    [v14 _selectionClipRect];
    goto LABEL_5;
  }
  double v20 = *MEMORY[0x1E4F1DB20];
  double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_7:
  id v24 = objc_loadWeakRetained((id *)p_manager);
  v25 = [v24 textInput];
  v26 = [v25 textInputView];

  v56.origin.double x = v20;
  v56.origin.double y = v21;
  v56.size.width = v22;
  v56.size.height = v23;
  if (CGRectIsNull(v56))
  {
    [v26 bounds];
    double v20 = v27;
    double v21 = v28;
    double v22 = v29;
    double v23 = v30;
  }
  v31 = [(_UITextFloatingCursorSession *)self _selectionContainerView];
  objc_msgSend(v31, "convertRect:fromView:", v26, v20, v21, v22, v23);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  [(UIView *)self->_floatingCursorView bounds];
  double v41 = v40 * 0.5;
  [(UIView *)self->_floatingCursorView bounds];
  double v43 = v42 * 0.5;
  double v44 = v37 - (v41 + v41);
  double v45 = v39 - (v43 + v43);
  if (v44 >= 0.0)
  {
    if (x >= v33 + v41)
    {
      double v46 = v33 + v41 + v44;
      if (x > v46) {
        double x = v46;
      }
    }
    else
    {
      double x = v33 + v41;
    }
  }
  if (v45 >= 0.0)
  {
    double v47 = v35 + v43;
    if (y >= v47)
    {
      double v48 = v47 + v45;
      if (y > v48) {
        double y = v48;
      }
    }
    else
    {
      double y = v47;
    }
  }
  if (v4)
  {
    id v49 = objc_loadWeakRetained((id *)p_manager);
    v50 = [v49 _cursorView];

    [v50 frame];
    double y = v52 + v51 * 0.5 + (y - (v52 + v51 * 0.5)) * 0.3;
  }
  double v53 = x;
  double v54 = y;
  result.double y = v54;
  result.double x = v53;
  return result;
}

- (UITextSelectionDisplayInteraction)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (UITextSelectionDisplayInteraction *)WeakRetained;
}

- (UIStandardTextCursorView)floatingCursorView
{
  return self->_floatingCursorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingCursorView, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_ghostCursorAssertion, 0);
}

@end