@interface _UIApplicationSceneKeyboardClientComponent
- (BOOL)isKeyboardDockDisabled;
- (BOOL)suppressKeyboardFocusRequests;
- (UIEdgeInsets)minimumKeyboardPadding;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation _UIApplicationSceneKeyboardClientComponent

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v12 = a4;
  v5 = [v12 settingsDiff];
  int v6 = [v5 containsProperty:sel_hardwareKeyboardExclusivityIdentifier];

  if (v6)
  {
    v7 = [v12 settings];
    v8 = [v7 hardwareKeyboardExclusivityIdentifier];

    v9 = [(FBSSceneComponent *)self clientScene];
    v10 = +[UIScene _sceneForFBSScene:v9];

    v11 = [v10 keyboardSceneDelegate];
    [v11 setHardwareKeyboardExclusivityIdentifier:v8];
  }
}

- (BOOL)isKeyboardDockDisabled
{
  v2 = [(FBSSceneComponent *)self clientScene];
  v3 = [v2 settings];
  char v4 = [v3 keyboardDockDisabled];

  return v4;
}

- (BOOL)suppressKeyboardFocusRequests
{
  v2 = [(FBSSceneComponent *)self clientScene];
  v3 = [v2 settings];
  char v4 = [v3 suppressKeyboardFocusRequests];

  return v4;
}

- (UIEdgeInsets)minimumKeyboardPadding
{
  v2 = [(FBSSceneComponent *)self clientScene];
  v3 = [v2 settings];
  [v3 minimumKeyboardPadding];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

@end