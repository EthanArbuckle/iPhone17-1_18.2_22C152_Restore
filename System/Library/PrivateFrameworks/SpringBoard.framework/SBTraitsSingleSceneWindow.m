@interface SBTraitsSingleSceneWindow
+ (BOOL)_isSecure;
- (BOOL)isContentHidden;
- (BOOL)isSceneContentVisible;
- (SBTraitsSingleSceneWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)rootViewController;
- (void)setRootViewController:(id)a3;
- (void)setSceneContentVisible:(BOOL)a3;
@end

@implementation SBTraitsSingleSceneWindow

- (SBTraitsSingleSceneWindow)initWithWindowScene:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBTraitsSingleSceneWindow;
  v3 = [(SBTraitsSingleSceneWindow *)&v6 initWithWindowScene:a3];
  v4 = v3;
  if (v3)
  {
    v3->_sceneContentVisible = 1;
    [(SBTraitsSingleSceneWindow *)v3 setAutorotates:0 forceUpdateInterfaceOrientation:1];
    [(SBTraitsSingleSceneWindow *)v4 beginDisablingInterfaceAutorotation];
  }
  return v4;
}

- (void)setRootViewController:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"SBTraitsSingleSceneWindow.m", 25, @"Invalid parameter not satisfying: %@", @"rootViewController == nil || [rootViewController isKindOfClass:[SBTraitsOrientedContentViewController class]]" object file lineNumber description];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)SBTraitsSingleSceneWindow;
  [(SBTraitsSingleSceneWindow *)&v7 setRootViewController:v5];
}

- (id)rootViewController
{
  v4.receiver = self;
  v4.super_class = (Class)SBTraitsSingleSceneWindow;
  v2 = [(SBTraitsSingleSceneWindow *)&v4 rootViewController];
  return v2;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsSingleSceneWindow;
  -[SBTraitsSingleSceneWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (SBTraitsSingleSceneWindow *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  if (v5 == self) {
    objc_super v7 = 0;
  }
  else {
    objc_super v7 = v5;
  }

  return v7;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)isContentHidden
{
  return !self->_sceneContentVisible;
}

- (BOOL)isSceneContentVisible
{
  return self->_sceneContentVisible;
}

- (void)setSceneContentVisible:(BOOL)a3
{
  self->_sceneContentVisible = a3;
}

@end