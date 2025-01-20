@interface _UIInputViewAnimationAssertion
+ (id)_assertionWithDirection:(int)a3 animated:(BOOL)a4 sceneDelegate:(id)a5;
- (BOOL)animated;
- (BOOL)valid;
- (UIInputViewAnimationStyle)style;
- (UIKeyboardSceneDelegate)sceneDelegate;
- (int)direction;
- (void)invalidate;
- (void)setAnimated:(BOOL)a3;
- (void)setSceneDelegate:(id)a3;
- (void)setStyle:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation _UIInputViewAnimationAssertion

- (void)invalidate
{
  if (self->_valid)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v4 = [(_UIInputViewAnimationAssertion *)self style];
    [WeakRetained popOrRemoveAnimationStyle:v4];

    self->_valid = 0;
  }
}

- (int)direction
{
  return self->_direction;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (UIKeyboardSceneDelegate)sceneDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  return (UIKeyboardSceneDelegate *)WeakRetained;
}

- (void)setSceneDelegate:(id)a3
{
}

- (UIInputViewAnimationStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_sceneDelegate);
}

+ (id)_assertionWithDirection:(int)a3 animated:(BOOL)a4 sceneDelegate:(id)a5
{
  id v7 = a5;
  v8 = [_UIInputViewAnimationAssertion alloc];
  id v9 = v7;
  if (v8)
  {
    v16.receiver = v8;
    v16.super_class = (Class)_UIInputViewAnimationAssertion;
    v10 = objc_msgSendSuper2(&v16, sel_init);
    v8 = v10;
    if (v10)
    {
      v10->_direction = a3;
      v10->_animated = a4;
      objc_storeWeak((id *)&v10->_sceneDelegate, v9);
      uint64_t v11 = +[UIInputViewAnimationStyleDirectional animationStyleAnimated:[(_UIInputViewAnimationAssertion *)v8 animated] duration:[(_UIInputViewAnimationAssertion *)v8 direction] outDirection:0.25];
      style = v8->_style;
      v8->_style = (UIInputViewAnimationStyle *)v11;

      [(UIInputViewAnimationStyle *)v8->_style setForAssertion:1];
      id WeakRetained = objc_loadWeakRetained((id *)&v8->_sceneDelegate);
      v14 = [(_UIInputViewAnimationAssertion *)v8 style];
      [WeakRetained pushAnimationStyle:v14];

      v8->_valid = 1;
    }
  }

  return v8;
}

@end