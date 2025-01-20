@interface _UIKeyboardAnimatorAnimationStyleControllerContext
- (BOOL)inputViewsHidden;
- (CGRect)endFrame;
- (CGRect)startFrame;
- (UIView)animatingView;
- (_UIKeyboardAnimatorAnimationStyleControllerContext)initWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5;
- (void)complete;
- (void)setInputViewsHidden:(BOOL)a3;
@end

@implementation _UIKeyboardAnimatorAnimationStyleControllerContext

- (_UIKeyboardAnimatorAnimationStyleControllerContext)initWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_UIKeyboardAnimatorAnimationStyleControllerContext;
  v12 = [(_UIKeyboardAnimatorAnimationStyleControllerContext *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_host, a3);
    objc_storeStrong((id *)&v13->_start, a4);
    objc_storeStrong((id *)&v13->_end, a5);
    [v9 updateToPlacement:v13->_end withNormalAnimationsAndNotifications:0];
    v14 = [(_UIKeyboardAnimatorAnimationStyleControllerContext *)v13 animatingView];
    [v14 frame];
    v13->_endFrame.origin.x = v15;
    v13->_endFrame.origin.y = v16;
    v13->_endFrame.size.width = v17;
    v13->_endFrame.size.height = v18;

    [v9 updateToPlacement:v13->_start withNormalAnimationsAndNotifications:0];
    v19 = [(_UIKeyboardAnimatorAnimationStyleControllerContext *)v13 animatingView];
    [v19 frame];
    v13->_startFrame.origin.x = v20;
    v13->_startFrame.origin.y = v21;
    v13->_startFrame.size.width = v22;
    v13->_startFrame.size.height = v23;
  }
  return v13;
}

- (UIView)animatingView
{
  return (UIView *)[(UIInputViewAnimationHost *)self->_host viewForTransitionScreenSnapshot];
}

- (void)setInputViewsHidden:(BOOL)a3
{
  self->_hidden = a3;
  -[UIInputViewAnimationHost setInputViewsHidden:](self->_host, "setInputViewsHidden:");
}

- (void)complete
{
}

- (CGRect)startFrame
{
  double x = self->_startFrame.origin.x;
  double y = self->_startFrame.origin.y;
  double width = self->_startFrame.size.width;
  double height = self->_startFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)endFrame
{
  double x = self->_endFrame.origin.x;
  double y = self->_endFrame.origin.y;
  double width = self->_endFrame.size.width;
  double height = self->_endFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)inputViewsHidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end