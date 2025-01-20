@interface _UIInterfaceActionSelectByPressGestureRecognizer
- (UIFocusedInterfaceActionPressDelegate)pressDelegate;
- (UIInterfaceAction)interfaceActionOnPressBegan;
- (UIInterfaceActionGroupView)actionGroupView;
- (_UIInterfaceActionSelectByPressGestureRecognizer)initWithFocusedInterfaceActionPressDelegate:(id)a3;
- (void)_gestureChanged:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)setActionGroupView:(id)a3;
- (void)setInterfaceActionOnPressBegan:(id)a3;
- (void)setPressDelegate:(id)a3;
@end

@implementation _UIInterfaceActionSelectByPressGestureRecognizer

- (_UIInterfaceActionSelectByPressGestureRecognizer)initWithFocusedInterfaceActionPressDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIInterfaceActionSelectByPressGestureRecognizer;
  v5 = [(UITapGestureRecognizer *)&v8 initWithTarget:self action:sel__gestureChanged_];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pressDelegate, v4);
    [(UITapGestureRecognizer *)v6 setAllowedPressTypes:&unk_1ED3EF068];
    [(UIGestureRecognizer *)v6 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
  }

  return v6;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIInterfaceActionSelectByPressGestureRecognizer;
  [(UITapGestureRecognizer *)&v7 pressesBegan:a3 withEvent:a4];
  v5 = [(_UIInterfaceActionSelectByPressGestureRecognizer *)self pressDelegate];
  v6 = [v5 focusedInterfaceAction];
  [(_UIInterfaceActionSelectByPressGestureRecognizer *)self setInterfaceActionOnPressBegan:v6];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(_UIInterfaceActionSelectByPressGestureRecognizer *)self pressDelegate];
  v9 = [v8 focusedInterfaceAction];

  v10 = [(_UIInterfaceActionSelectByPressGestureRecognizer *)self interfaceActionOnPressBegan];

  if (v9 == v10)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIInterfaceActionSelectByPressGestureRecognizer;
    [(UITapGestureRecognizer *)&v11 pressesEnded:v6 withEvent:v7];
  }
  else
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionSelectByPressGestureRecognizer;
  [(UIGestureRecognizer *)&v3 reset];
  [(_UIInterfaceActionSelectByPressGestureRecognizer *)self setInterfaceActionOnPressBegan:0];
}

- (void)_gestureChanged:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(_UIInterfaceActionSelectByPressGestureRecognizer *)self pressDelegate];
    id v6 = [v4 focusedInterfaceAction];

    if (v6)
    {
      v5 = [(_UIInterfaceActionSelectByPressGestureRecognizer *)self pressDelegate];
      [v5 handlePressedFocusedInterfaceAction:v6];
    }
  }
}

- (UIFocusedInterfaceActionPressDelegate)pressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pressDelegate);
  return (UIFocusedInterfaceActionPressDelegate *)WeakRetained;
}

- (void)setPressDelegate:(id)a3
{
}

- (UIInterfaceActionGroupView)actionGroupView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionGroupView);
  return (UIInterfaceActionGroupView *)WeakRetained;
}

- (void)setActionGroupView:(id)a3
{
}

- (UIInterfaceAction)interfaceActionOnPressBegan
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interfaceActionOnPressBegan);
  return (UIInterfaceAction *)WeakRetained;
}

- (void)setInterfaceActionOnPressBegan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interfaceActionOnPressBegan);
  objc_destroyWeak((id *)&self->_actionGroupView);
  objc_destroyWeak((id *)&self->_pressDelegate);
}

@end