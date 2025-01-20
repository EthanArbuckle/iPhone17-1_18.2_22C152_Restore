@interface _UITextEffectsRemoteView
+ (BOOL)_requiresWindowTouches;
- (int)textEffectsVisibilityLevel;
@end

@implementation _UITextEffectsRemoteView

+ (BOOL)_requiresWindowTouches
{
  return 0;
}

- (int)textEffectsVisibilityLevel
{
  v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v4 = [v3 responder];
  v5 = [v4 _window];

  v6 = [(_UIRemoteView *)self remoteViewController];
  v7 = [v6 view];
  v8 = [v7 window];

  if (v5) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || ([v5 level], double v11 = v10, objc_msgSend(v8, "level"), v11 <= v12)) {
    int v13 = 500;
  }
  else {
    int v13 = 9;
  }

  return v13;
}

@end