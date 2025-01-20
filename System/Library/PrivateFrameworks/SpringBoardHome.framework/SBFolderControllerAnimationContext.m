@interface SBFolderControllerAnimationContext
+ (SBFolderControllerAnimationContext)contextWithScreen:(id)a3 animationWindow:(id)a4 fallbackIconContainer:(id)a5;
- (SBFolderControllerAnimationContext)initWithScreen:(id)a3 animationWindow:(id)a4 fallbackIconContainer:(id)a5;
- (UIScreen)screen;
- (UIView)fallbackIconContainer;
- (UIWindow)animationWindow;
@end

@implementation SBFolderControllerAnimationContext

+ (SBFolderControllerAnimationContext)contextWithScreen:(id)a3 animationWindow:(id)a4 fallbackIconContainer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithScreen:v10 animationWindow:v9 fallbackIconContainer:v8];

  return (SBFolderControllerAnimationContext *)v11;
}

- (SBFolderControllerAnimationContext)initWithScreen:(id)a3 animationWindow:(id)a4 fallbackIconContainer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBFolderControllerAnimationContext;
  v12 = [(SBFolderControllerAnimationContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_screen, a3);
    objc_storeWeak((id *)&v13->_animationWindow, v10);
    objc_storeStrong((id *)&v13->_fallbackIconContainer, a5);
  }

  return v13;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (UIWindow)animationWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationWindow);
  return (UIWindow *)WeakRetained;
}

- (UIView)fallbackIconContainer
{
  return self->_fallbackIconContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackIconContainer, 0);
  objc_destroyWeak((id *)&self->_animationWindow);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end