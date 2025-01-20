@interface UITextEffectsWindowHosted
- (BOOL)_isFullscreen;
- (BOOL)_isTextEffectsWindowHosting;
- (BOOL)_isTextEffectsWindowNotificationOwner;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_usesWindowServerHitTesting;
- (CGRect)actualSceneBounds;
- (CGRect)actualSceneBoundsForLandscape:(BOOL)a3;
- (int64_t)_orientationForRootTransform;
- (int64_t)_orientationForSceneTransform;
- (int64_t)_orientationForViewTransform;
- (void)_sceneBoundsDidChange;
- (void)adjustTextEffectsWindowSizeIfNecessary;
@end

@implementation UITextEffectsWindowHosted

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

- (int64_t)_orientationForSceneTransform
{
  return 1;
}

- (CGRect)actualSceneBoundsForLandscape:(BOOL)a3
{
  BOOL v3 = a3;
  [(UITextEffectsWindow *)self hostedViewSize];
  double v7 = v6;
  double v8 = v5;
  if (v6 == *MEMORY[0x1E4F1DB30] && v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v12.receiver = self;
    v12.super_class = (Class)UITextEffectsWindowHosted;
    [(UITextEffectsWindow *)&v12 actualSceneBoundsForLandscape:v3];
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)actualSceneBounds
{
  [(UITextEffectsWindow *)self hostedViewSize];
  double v5 = v4;
  double v6 = v3;
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v10.receiver = self;
    v10.super_class = (Class)UITextEffectsWindowHosted;
    [(UITextEffectsWindow *)&v10 actualSceneBounds];
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (BOOL)_isFullscreen
{
  [(UITextEffectsWindow *)self hostedViewSize];
  double v5 = v4;
  double v6 = v3;
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v13.receiver = self;
    v13.super_class = (Class)UITextEffectsWindowHosted;
    return [(UITextEffectsWindow *)&v13 _isFullscreen];
  }
  else
  {
    double v8 = [(UIWindow *)self screen];
    objc_msgSend(v8, "_boundsForInterfaceOrientation:", -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
    BOOL v11 = v6 == v10 && v5 == v9;
  }
  return v11;
}

- (void)adjustTextEffectsWindowSizeIfNecessary
{
  double v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v4 = [v3 visualModeManager];
  int v5 = [v4 windowingModeEnabled];

  [(UITextEffectsWindow *)self hostedViewSize];
  if ((*(double *)(MEMORY[0x1E4F1DB30] + 8) != v7 || *MEMORY[0x1E4F1DB30] != v6) && v5 != 0)
  {
    [(UITextEffectsWindow *)self hostedViewSize];
    double v11 = v10;
    [(UITextEffectsWindow *)self hostedViewSize];
    -[UIWindow setBounds:](self, "setBounds:", 0.0, 0.0, v11, v12);
    [(UITextEffectsWindow *)self hostedViewOrigin];
    double v14 = v13;
    [(UITextEffectsWindow *)self hostedViewOrigin];
    [(UIView *)self setOrigin:v14];
  }
}

- (void)_sceneBoundsDidChange
{
  double v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v4 = [v3 visualModeManager];
  int v5 = [v4 windowingModeEnabled];

  [(UITextEffectsWindow *)self _sceneBounds];
  double v7 = v6;
  [(UITextEffectsWindow *)self hostedViewSize];
  double v9 = v7 - v8;
  if (v9 <= 0.0) {
    goto LABEL_5;
  }
  [(UITextEffectsWindow *)self hostedViewSize];
  BOOL v11 = v10 == *MEMORY[0x1E4F1DB30];
  if (v12 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    BOOL v11 = 0;
  }
  if ((v11 | v5) == 1) {
LABEL_5:
  }
    double v9 = 0.0;
  [(UITextEffectsWindow *)self addBottomPadding:v9];
  [(UITextEffectsWindowHosted *)self adjustTextEffectsWindowSizeIfNecessary];
  uint64_t v35 = 0;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  uint64_t v20 = 64;
  -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v20);
  double v13 = [(UITextEffectsWindow *)self rootViewController];
  int v14 = [v13 conformsToProtocol:&unk_1ED5DBDA0];

  if (v14)
  {
    v15 = [(UITextEffectsWindow *)self rootViewController];
    [v15 hostAppSceneBoundsChanged];
  }
  [(UITextEffectsWindow *)self updateEditingOverlayContainer];
  v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v17 = [v16 visualModeManager];
  int v18 = [v17 windowingModeEnabled];

  if (v18)
  {
    v19.receiver = self;
    v19.super_class = (Class)UITextEffectsWindowHosted;
    [(UITextEffectsWindow *)&v19 _sceneBoundsDidChange];
  }
}

- (BOOL)_isTextEffectsWindowHosting
{
  return 0;
}

- (BOOL)_isTextEffectsWindowNotificationOwner
{
  double v3 = [(UIWindow *)self windowScene];
  double v4 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v3];
  char v5 = [v4 useHostedInstance];

  if (v5 & 1) != 0 || ([(id)UIApp _isSpringBoard]) {
    return 1;
  }
  double v7 = [(UIWindow *)self windowScene];
  char v8 = [v7 _isKeyWindowScene];

  return v8;
}

@end