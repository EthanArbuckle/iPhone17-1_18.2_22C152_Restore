@interface _UIKeyboardWindowScene
+ (BOOL)alwaysKeepContexts;
+ (BOOL)autoInvalidates;
+ (BOOL)shouldAllowComponents;
- (BOOL)_affectsScreenOrientation;
- (_UIKeyboardWindowScene)initWithScreen:(id)a3 session:(id)a4 lookupKey:(id)a5;
- (id)_fixupInheritedSettings:(id)a3;
- (id)_homeAffordanceSceneNotifier;
- (void)_setSettingsScene:(id)a3;
@end

@implementation _UIKeyboardWindowScene

- (id)_homeAffordanceSceneNotifier
{
  if (!_UIDeviceSupportsGlobalEdgeSwipeTouches()) {
    goto LABEL_6;
  }
  int v3 = _UIApplicationSupportsHomeAffordanceObservation();
  v4 = 0;
  if (self && v3)
  {
    if (![(UIScene *)self _hostsWindows] || [(UIScene *)self _hasInvalidated])
    {
LABEL_6:
      v4 = 0;
      goto LABEL_7;
    }
    v4 = [(UIScene *)self _existingHomeAffordanceSceneNotifier];
    if (!v4)
    {
      v4 = [[_UIHomeAffordanceSceneNotifierProxy alloc] initWithScene:self];
      [(UIWindowScene *)self _registerSceneComponent:v4 forKey:@"_UIHomeAffordanceSceneNotifierComponentKey"];
    }
  }
LABEL_7:
  return v4;
}

+ (BOOL)alwaysKeepContexts
{
  return 0;
}

+ (BOOL)shouldAllowComponents
{
  return 0;
}

+ (BOOL)autoInvalidates
{
  return 0;
}

- (_UIKeyboardWindowScene)initWithScreen:(id)a3 session:(id)a4 lookupKey:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardWindowScene;
  v5 = [(_UIScreenBasedWindowScene *)&v9 initWithScreen:a3 session:a4 lookupKey:a5];
  if (v5)
  {
    v6 = [(_UIFocusSystemSceneComponent *)[_UIFocusSystemKeyboardSceneComponent alloc] initWithScene:v5];
    [(UIWindowScene *)v5 _registerSceneComponent:v6 forKey:_UIFocusSystemSceneComponentKey];
    v7 = [[_UIHomeAffordanceSceneNotifierProxy alloc] initWithScene:v5];
    [(UIWindowScene *)v5 _registerSceneComponent:v7 forKey:@"_UIHomeAffordanceSceneNotifierComponentKey"];
  }
  return v5;
}

- (void)_setSettingsScene:(id)a3
{
  id v5 = a3;
  if ([(UIScene *)self _hasSettingsScene])
  {
    v6 = [(UIScene *)self _settingsScene];
  }
  else
  {
    v6 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIKeyboardWindowScene;
  [(UIScene *)&v15 _setSettingsScene:v5];
  if ([(UIScene *)self _hasSettingsScene])
  {
    v7 = [(UIScene *)self _settingsScene];
  }
  else
  {
    v7 = 0;
  }
  if (_UIDeviceSupportsGlobalEdgeSwipeTouches()
    && _UIApplicationSupportsHomeAffordanceObservation())
  {
    id v8 = v6;
    id v9 = v7;
    if (v8 != v9)
    {
      v10 = v9;
      if (v8 && v9)
      {
        char v11 = [v8 isEqual:v9];

        if (v11) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      v12 = [(_UIKeyboardWindowScene *)self _homeAffordanceSceneNotifier];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIScreenBasedWindowScene.m", 573, @"Invalid home affordance notifier class for scene: %@; notifier: %@",
          self,
          v12);
        goto LABEL_19;
      }
      id v13 = v12;
      if (!v13)
      {
        v12 = 0;
        goto LABEL_21;
      }
      id v8 = v13;
      v14 = [v10 _homeAffordanceSceneNotifier];
      -[_UIHomeAffordanceSceneNotifierProxy setTargetHomeAffordanceNotifier:](v8, v14);
    }
    v12 = v8;
LABEL_19:

LABEL_21:
  }
LABEL_22:
}

- (id)_fixupInheritedSettings:(id)a3
{
  v4 = [(_UIScreenBasedWindowScene *)self screen];
  [v4 _referenceBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [a3 frame];
  v18.origin.x = v6;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  if (CGRectEqualToRect(v17, v18))
  {
    id v13 = a3;
  }
  else
  {
    v14 = (void *)[a3 mutableCopy];
    objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);
    id v13 = (id)[v14 copy];
  }
  return v13;
}

- (BOOL)_affectsScreenOrientation
{
  return 0;
}

@end