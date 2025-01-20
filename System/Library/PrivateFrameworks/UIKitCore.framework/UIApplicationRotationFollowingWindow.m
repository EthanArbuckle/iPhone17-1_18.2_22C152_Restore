@interface UIApplicationRotationFollowingWindow
+ (BOOL)_isSystemWindow;
- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)_shouldControlAutorotation;
- (BOOL)isInterfaceAutorotationDisabled;
- (BOOL)limitToWindowLevel;
- (UIApplicationRotationFollowingWindow)init;
- (UIApplicationRotationFollowingWindow)initWithWindowScene:(id)a3;
- (id)__autorotationSanityCheckObjectFromSource:(id)a3 selector:(SEL)a4;
- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 attached:(BOOL)a5;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 displayConfiguration:(id)a5;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 scene:(id)a5 attached:(BOOL)a6;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5;
- (id)_topMostWindow;
- (int64_t)priorityLevel;
- (void)_commonApplicationRotationFollowingWindowInit;
- (void)applicationWindow:(id)a3 didRotateWithOrientation:(int64_t)a4 duration:(double)a5;
- (void)setLimitToWindowLevel:(BOOL)a3;
- (void)setPriorityLevel:(int64_t)a3;
@end

@implementation UIApplicationRotationFollowingWindow

- (BOOL)isInterfaceAutorotationDisabled
{
  v8.receiver = self;
  v8.super_class = (Class)UIApplicationRotationFollowingWindow;
  if ([(UIWindow *)&v8 isInterfaceAutorotationDisabled]) {
    return 1;
  }
  v4 = [(UIWindow *)self rootViewController];
  v5 = [(UIApplicationRotationFollowingWindow *)self _topMostWindow];
  v6 = [v4 _safeWindowForAutorotationBelowWindow:v5];
  char v3 = [v6 isInterfaceAutorotationDisabled];

  return v3;
}

- (void)applicationWindow:(id)a3 didRotateWithOrientation:(int64_t)a4 duration:(double)a5
{
  id v16 = a3;
  objc_super v8 = [(UIWindow *)self rootViewController];

  if (!v8 || [(UIWindow *)self _isHostedInAnotherProcess]) {
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_3;
    }
    id v10 = [(UIWindow *)self screen];

    if (v10 != v16) {
      goto LABEL_3;
    }
    goto LABEL_14;
  }
  v9 = [(UIWindow *)self windowScene];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    v11 = [v16 windowScene];
    v12 = [(UIWindow *)self windowScene];

    if (v11 != v12) {
      goto LABEL_3;
    }
  }
  v13 = [v16 screen];
  v14 = [(UIWindow *)self screen];

  if (v13 == v14)
  {
LABEL_14:
    if ([(UIApplicationRotationFollowingWindow *)self _shouldAutorotateToInterfaceOrientation:a4])
    {
      v15 = [(UIWindow *)self rootViewController];
      [(UIWindow *)self _setRotatableClient:v15 toOrientation:a4 updateStatusBar:0 duration:0 force:1 isRotating:a5];
    }
  }
LABEL_3:
}

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  if (self->super._viewOrientation)
  {
    v5 = [(UIWindow *)self rootViewController];
    v6 = [(UIApplicationRotationFollowingWindow *)self _topMostWindow];
    v7 = [v5 _safeWindowForAutorotationBelowWindow:v6];

    objc_super v8 = [v7 rootViewController];
    v9 = [v8 _safeViewControllerForRotationWithDismissCheck:1];

    if (v9)
    {
      if (a3 && [v9 _overrideInterfaceOrientationMechanics] == a3)
      {
        unsigned __int8 v10 = 1;
        goto LABEL_14;
      }
      char v16 = 0;
      unsigned __int8 v11 = [v7 _shouldAutorotateToInterfaceOrientation:a3 checkForDismissal:1 isRotationDisabled:&v16];
      v12 = [v9 _existingView];
      v13 = [v12 _window];

      unsigned __int8 v10 = [v13 interfaceOrientation] == a3;
      if (!v16)
      {
        if ((v11 & 1) != 0 || objc_msgSend(v9, "__supportedInterfaceOrientations")) {
          unsigned __int8 v10 = v11;
        }

        goto LABEL_14;
      }

      if (v13)
      {
LABEL_14:

        return v10;
      }
    }
    v15.receiver = self;
    v15.super_class = (Class)UIApplicationRotationFollowingWindow;
    unsigned __int8 v10 = [(UIWindow *)&v15 _shouldAutorotateToInterfaceOrientation:a3];
    goto LABEL_14;
  }
  return 1;
}

- (void)setLimitToWindowLevel:(BOOL)a3
{
  self->_limitToWindowLevel = a3;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIApplicationRotationFollowingWindow;
  id v5 = -[UIWindow _initWithFrame:debugName:windowScene:](&v8, sel__initWithFrame_debugName_windowScene_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5) {
    [v5 _commonApplicationRotationFollowingWindowInit];
  }
  return v6;
}

- (void)setPriorityLevel:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->_priorityLevel = a3;
  char v3 = self;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = GetRotationFollowingWindows();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v6 + v7;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        if (*(UIApplicationRotationFollowingWindow **)(*((void *)&v12 + 1) + 8 * v9) == v3)
        {

          if (v7 + v9 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unsigned __int8 v11 = GetRotationFollowingWindows();
            objc_msgSend(v11, "removePointerAtIndex:", v7 + v9, (void)v12);
          }
          goto LABEL_12;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }

LABEL_12:
  InsertWindow(v3);
}

- (void)_commonApplicationRotationFollowingWindowInit
{
  [(UIWindow *)self _setWindowControlsStatusBarOrientation:0];
  InsertWindow(self);
}

- (id)_topMostWindow
{
  if (!self->_limitToWindowLevel) {
    self = 0;
  }
  return self;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (UIApplicationRotationFollowingWindow)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIApplicationRotationFollowingWindow;
  v2 = [(UIWindow *)&v5 init];
  char v3 = v2;
  if (v2) {
    [(UIApplicationRotationFollowingWindow *)v2 _commonApplicationRotationFollowingWindowInit];
  }
  return v3;
}

- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIApplicationRotationFollowingWindow;
  id v4 = -[UIWindow _initWithFrame:attached:](&v7, sel__initWithFrame_attached_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v5 = v4;
  if (v4) {
    [v4 _commonApplicationRotationFollowingWindowInit];
  }
  return v5;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 attached:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIApplicationRotationFollowingWindow;
  id v5 = -[UIWindow _initWithFrame:debugName:attached:](&v8, sel__initWithFrame_debugName_attached_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v6 = v5;
  if (v5) {
    [v5 _commonApplicationRotationFollowingWindowInit];
  }
  return v6;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 scene:(id)a5 attached:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)UIApplicationRotationFollowingWindow;
  id v6 = -[UIWindow _initWithFrame:debugName:scene:attached:](&v9, sel__initWithFrame_debugName_scene_attached_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v7 = v6;
  if (v6) {
    [v6 _commonApplicationRotationFollowingWindowInit];
  }
  return v7;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 displayConfiguration:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIApplicationRotationFollowingWindow;
  id v5 = -[UIWindow _initWithFrame:debugName:displayConfiguration:](&v8, sel__initWithFrame_debugName_displayConfiguration_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = v5;
  if (v5) {
    [v5 _commonApplicationRotationFollowingWindowInit];
  }
  return v6;
}

- (UIApplicationRotationFollowingWindow)initWithWindowScene:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIApplicationRotationFollowingWindow;
  char v3 = [(UIWindow *)&v6 initWithWindowScene:a3];
  id v4 = v3;
  if (v3) {
    [(UIApplicationRotationFollowingWindow *)v3 _commonApplicationRotationFollowingWindowInit];
  }
  return v4;
}

- (id)__autorotationSanityCheckObjectFromSource:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  objc_super v7 = NSStringFromSelector(a4);
  NSLog(&cfstr_RotationErrorR_0.isa, v6, v7, self);

  return 0;
}

- (int64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (BOOL)limitToWindowLevel
{
  return self->_limitToWindowLevel;
}

@end