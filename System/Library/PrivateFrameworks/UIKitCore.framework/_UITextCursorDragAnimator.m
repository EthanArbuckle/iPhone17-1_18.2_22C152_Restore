@interface _UITextCursorDragAnimator
- (UITextCursorView)_cursorView;
- (UITextInput)_textInput;
- (id)_initWithTextCursorView:(id)a3 textInput:(id)a4;
- (void)_animateAlongsideChanges:(id)a3 completion:(id)a4;
- (void)_setCursorVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateCursorForPosition:(id)a3 animated:(BOOL)a4;
@end

@implementation _UITextCursorDragAnimator

- (id)_initWithTextCursorView:(id)a3 textInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UITextCursorDragAnimator;
  v8 = [(_UITextCursorDragAnimator *)&v12 init];
  if (v8)
  {
    v9 = [[UITextCursorDropPositionAnimator alloc] initWithTextCursorView:v6 textInput:v7];
    impl = v8->_impl;
    v8->_impl = v9;
  }
  return v8;
}

- (UITextCursorView)_cursorView
{
  return [(UITextCursorDropPositionAnimator *)self->_impl cursorView];
}

- (UITextInput)_textInput
{
  return [(UITextCursorDropPositionAnimator *)self->_impl textInput];
}

- (void)_setCursorVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_updateCursorForPosition:(id)a3 animated:(BOOL)a4
{
}

- (void)_animateAlongsideChanges:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end