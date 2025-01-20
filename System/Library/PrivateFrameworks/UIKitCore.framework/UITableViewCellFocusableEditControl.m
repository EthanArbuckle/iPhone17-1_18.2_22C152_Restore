@interface UITableViewCellFocusableEditControl
- (BOOL)_shouldHandlePressEvent:(id)a3;
- (BOOL)wantsImageShadow;
- (BOOL)wantsMaskingWhileAnimatingDisabled;
- (id)_currentImage;
- (void)_updateFloatingViewForCurrentTraits;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UITableViewCellFocusableEditControl

- (void)_updateFloatingViewForCurrentTraits
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cell);
  v4 = [WeakRetained traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  BOOL v6 = v5 == 1000 || v5 == 2;
  focusedFloatingContentView = self->_focusedFloatingContentView;
  if (v6)
  {
    v7 = +[UIColor colorWithWhite:1.0 alpha:0.2];
    [(_UIFloatingContentView *)focusedFloatingContentView setBackgroundColor:v7 forState:0];

    v10 = self->_focusedFloatingContentView;
    double v11 = 1.0;
    double v12 = 0.2;
  }
  else
  {
    v9 = +[UIColor colorWithWhite:1.0 alpha:0.5];
    [(_UIFloatingContentView *)focusedFloatingContentView setBackgroundColor:v9 forState:0];

    v10 = self->_focusedFloatingContentView;
    double v11 = 1.0;
    double v12 = 0.5;
  }
  id v13 = +[UIColor colorWithWhite:v11 alpha:v12];
  -[_UIFloatingContentView setBackgroundColor:forState:](v10, "setBackgroundColor:forState:");
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellFocusableEditControl;
  [(UITableViewCellEditControl *)&v4 traitCollectionDidChange:a3];
  [(UITableViewCellEditControl *)self _updateImageView];
  [(UITableViewCellFocusableEditControl *)self _updateFloatingViewForCurrentTraits];
}

- (id)_currentImage
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellFocusableEditControl;
  v2 = [(UITableViewCellEditControl *)&v4 _currentImage];
  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellFocusableEditControl;
  [(UITableViewCellEditControl *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[_UIFloatingContentView setFrame:](self->_focusedFloatingContentView, "setFrame:");
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellFocusableEditControl;
  [(UITableViewCellEditControl *)&v4 setHighlighted:a3];
  [(_UIFloatingContentView *)self->_focusedFloatingContentView setControlState:[(UIControl *)self state] animated:+[UIView _isInAnimationBlock]];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellFocusableEditControl;
  [(UITableViewCellEditControl *)&v4 setSelected:a3];
  [(_UIFloatingContentView *)self->_focusedFloatingContentView setControlState:[(UIControl *)self state] animated:+[UIView _isInAnimationBlock]];
}

- (BOOL)wantsMaskingWhileAnimatingDisabled
{
  return [(_UIFloatingContentView *)self->_focusedFloatingContentView clipsContentToBounds];
}

- (BOOL)wantsImageShadow
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellFocusableEditControl;
  [(UIView *)&v5 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  [(_UIFloatingContentView *)self->_focusedFloatingContentView setControlState:[(UIControl *)self state] animated:1];
  [(UITableViewCellEditControl *)self _updateImageView];
}

- (BOOL)_shouldHandlePressEvent:(id)a3
{
  return 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UITableViewCellFocusableEditControl *)self _shouldHandlePressEvent:v7])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__UITableViewCellFocusableEditControl_pressesBegan_withEvent___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    +[UIView animateWithDuration:v9 animations:0.1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellFocusableEditControl;
    [(UIResponder *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

uint64_t __62__UITableViewCellFocusableEditControl_pressesBegan_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:1];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UITableViewCellFocusableEditControl *)self _shouldHandlePressEvent:v7])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__UITableViewCellFocusableEditControl_pressesEnded_withEvent___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    +[UIView animateWithDuration:v9 animations:0.1];
    [(UIControl *)self sendActionsForControlEvents:0x2000];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellFocusableEditControl;
    [(UIResponder *)&v8 pressesEnded:v6 withEvent:v7];
  }
}

uint64_t __62__UITableViewCellFocusableEditControl_pressesEnded_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:0];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UITableViewCellFocusableEditControl *)self _shouldHandlePressEvent:v7])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__UITableViewCellFocusableEditControl_pressesCancelled_withEvent___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    +[UIView animateWithDuration:v9 animations:0.1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellFocusableEditControl;
    [(UIResponder *)&v8 pressesCancelled:v6 withEvent:v7];
  }
}

uint64_t __66__UITableViewCellFocusableEditControl_pressesCancelled_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:0];
}

- (void).cxx_destruct
{
}

@end