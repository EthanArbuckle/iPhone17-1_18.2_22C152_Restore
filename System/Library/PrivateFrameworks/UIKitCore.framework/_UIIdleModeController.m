@interface _UIIdleModeController
- (BOOL)_recordLayoutAttributesStartingAtView:(id)a3;
- (BOOL)isIdleModeEnabled;
- (UIScreen)screen;
- (_UIIdleModeController)initWithScreen:(id)a3;
- (double)_dimmingOverlayWhiteValueForUserInterfaceStyle:(int64_t)a3;
- (double)_dismissalAnimationDuration;
- (double)_presentationAnimationDuration;
- (double)_vignetteAlphaForUserInterfaceStyle:(int64_t)a3;
- (id)_imageForTraitCollection:(id)a3;
- (id)_originalAttributesForView:(id)a3 comparedToIdleModeAttributes:(id)a4;
- (id)_vignetteImageAroundFocusedFrame:(CGRect)a3;
- (unint64_t)style;
- (void)_animateDismissal;
- (void)_animatePresentation;
- (void)_applyDismissalLayoutAttributesToViews;
- (void)_applyLayoutAttributes:(id)a3 toView:(id)a4;
- (void)_applyPresentationLayoutAttributesToViews;
- (void)_completeDismissal;
- (void)_enterIdleMode;
- (void)_enterIdleModeWithOptions:(unint64_t)a3;
- (void)_exitIdleMode;
- (void)_exitIdleModeWithOptions:(unint64_t)a3;
- (void)_postWillEnterNotification;
- (void)_postWillExitNotification;
- (void)_prepareForPresentationWithKeyWindow:(id)a3 focusedView:(id)a4;
- (void)dealloc;
- (void)setIdleModeEnabled:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation _UIIdleModeController

- (_UIIdleModeController)initWithScreen:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIIdleModeController;
  v6 = [(_UIIdleModeController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_screen, a3);
    v7->_style = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(_UIIdleModeController *)self _completeDismissal];
  v3.receiver = self;
  v3.super_class = (Class)_UIIdleModeController;
  [(_UIIdleModeController *)&v3 dealloc];
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 1 && self->_idleModeEnabled) {
      [(_UIIdleModeController *)self _exitIdleModeWithOptions:1];
    }
  }
}

- (void)setIdleModeEnabled:(BOOL)a3
{
  if (self->_idleModeEnabled != a3)
  {
    if (a3) {
      [(_UIIdleModeController *)self _enterIdleMode];
    }
    else {
      [(_UIIdleModeController *)self _exitIdleMode];
    }
    self->_idleModeEnabled = a3;
  }
}

- (void)_enterIdleMode
{
  if (self->_style == 1) {
    [(_UIIdleModeController *)self _postWillEnterNotification];
  }
  else {
    [(_UIIdleModeController *)self _enterIdleModeWithOptions:0];
  }
}

- (void)_exitIdleMode
{
  if (self->_style == 1) {
    [(_UIIdleModeController *)self _postWillExitNotification];
  }
  else {
    [(_UIIdleModeController *)self _exitIdleModeWithOptions:0];
  }
}

- (void)_enterIdleModeWithOptions:(unint64_t)a3
{
  [(_UIIdleModeController *)self _completeDismissal];
  id v5 = +[UIWindow _applicationKeyWindow];
  v6 = [v5 _focusSystem];
  v7 = [v6 _focusedView];

  if ([(_UIIdleModeController *)self _recordLayoutAttributesStartingAtView:v7])
  {
    self->_didApplyVisualEffects = 1;
    [(_UIIdleModeController *)self _prepareForPresentationWithKeyWindow:v5 focusedView:v7];
    [(_UIIdleModeController *)self _presentationAnimationDuration];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51___UIIdleModeController__enterIdleModeWithOptions___block_invoke;
    v8[3] = &unk_1E52D9CD0;
    v8[4] = self;
    v8[5] = a3;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327686, v8, 0);
  }
  else
  {
    self->_didApplyVisualEffects = 0;
  }
}

- (void)_exitIdleModeWithOptions:(unint64_t)a3
{
  if (self->_didApplyVisualEffects)
  {
    dismissalTransactionID = (void *)self->_dismissalTransactionID;
    objc_initWeak(&location, self);
    [(_UIIdleModeController *)self _dismissalAnimationDuration];
    double v7 = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50___UIIdleModeController__exitIdleModeWithOptions___block_invoke;
    v10[3] = &unk_1E52D9CD0;
    v10[4] = self;
    v10[5] = a3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50___UIIdleModeController__exitIdleModeWithOptions___block_invoke_2;
    v8[3] = &unk_1E52EEE78;
    objc_copyWeak(v9, &location);
    v9[1] = dismissalTransactionID;
    +[UIView animateWithDuration:327686 delay:v10 options:v8 animations:v7 completion:0.0];
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)_postWillEnterNotification
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_UIApplicationWillEnterIdleModeNotification" object:UIApp];
}

- (void)_postWillExitNotification
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_UIApplicationWillExitIdleModeNotification" object:UIApp];
}

- (double)_presentationAnimationDuration
{
  int v2 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_IdleModePresentationDuration, @"IdleModePresentationDuration");
  double result = *(double *)&qword_1E8FD52B8;
  if (v2) {
    return 3.0;
  }
  return result;
}

- (double)_dismissalAnimationDuration
{
  int v2 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_IdleModeDismissalDuration, @"IdleModeDismissalDuration");
  double result = *(double *)&qword_1E8FD52C8;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (double)_vignetteAlphaForUserInterfaceStyle:(int64_t)a3
{
  BOOL v3 = a3 == 1000 || a3 == 2;
  double result = 0.35;
  if (v3) {
    return 0.65;
  }
  return result;
}

- (double)_dimmingOverlayWhiteValueForUserInterfaceStyle:(int64_t)a3
{
  BOOL v3 = a3 == 1000 || a3 == 2;
  double result = 0.55;
  if (v3) {
    return 0.4;
  }
  return result;
}

- (id)_imageForTraitCollection:(id)a3
{
  return +[UIImage _kitImageNamed:@"IdleModeGradientOverlay" withTrait:a3];
}

- (id)_vignetteImageAroundFocusedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(UIScreen *)self->_screen traitCollection];
  objc_super v9 = [(_UIIdleModeController *)self _imageForTraitCollection:v8];

  [v9 size];
  double v11 = v10;
  double v13 = v12;
  [(UIScreen *)self->_screen bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(UIScreen *)self->_screen scale];
  _UIGraphicsBeginImageContextWithOptions(0, 0, v15, v17, v18);
  v19 = +[UIColor blackColor];
  [v19 setFill];

  UIRectFillUsingOperation(1, *MEMORY[0x1E4F1DAD8], *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8), v15, v17);
  objc_msgSend(v9, "drawAtPoint:blendMode:alpha:", 17, x + width * 0.5 - v11 * 0.5, y + height * 0.5 - v13 * 0.5, 1.0);
  v20 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();

  return v20;
}

- (void)_applyLayoutAttributes:(id)a3 toView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  memset(&v22, 0, sizeof(v22));
  if (v6) {
    [v6 transform];
  }
  if (v5) {
    [v5 transform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransform t1 = v22;
  CGAffineTransformConcat(&v21, &t1, &t2);
  CGAffineTransform v18 = v21;
  [v7 setTransform:&v18];
  [v7 alpha];
  double v9 = v8;
  [v5 alphaOffset];
  [v7 setAlpha:v9 + v10];
  [v7 center];
  double v12 = v11;
  double v14 = v13;
  [v5 centerOffset];
  double v16 = v12 + v15;
  [v5 centerOffset];
  objc_msgSend(v7, "setCenter:", v16, v14 + v17);
}

- (void)_applyPresentationLayoutAttributesToViews
{
  BOOL v3 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66___UIIdleModeController__applyPresentationLayoutAttributesToViews__block_invoke_2;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView conditionallyAnimate:v3 withAnimation:&__block_literal_global_297 layout:v4 completion:0];
}

- (void)_applyDismissalLayoutAttributesToViews
{
  BOOL v3 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63___UIIdleModeController__applyDismissalLayoutAttributesToViews__block_invoke_2;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView conditionallyAnimate:v3 withAnimation:&__block_literal_global_11_1 layout:v4 completion:0];
}

- (id)_originalAttributesForView:(id)a3 comparedToIdleModeAttributes:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc_init(_UIIdleModeLayoutAttributes);
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  CGAffineTransformInvert(&v13, &v12);
  CGAffineTransform v11 = v13;
  [(_UIIdleModeLayoutAttributes *)v5 setTransform:&v11];
  [v4 alphaOffset];
  [(_UIIdleModeLayoutAttributes *)v5 setAlphaOffset:-v6];
  [v4 centerOffset];
  double v8 = -v7;
  [v4 centerOffset];
  -[_UIIdleModeLayoutAttributes setCenterOffset:](v5, "setCenterOffset:", v8, -v9);

  return v5;
}

- (BOOL)_recordLayoutAttributesStartingAtView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    id v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    viewsToCAFilters = self->_viewsToCAFilters;
    self->_viewsToCAFilters = v5;

    double v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    viewsToAttributes = self->_viewsToAttributes;
    self->_viewsToAttributes = v7;

    double v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    viewsToOriginalAttributes = self->_viewsToOriginalAttributes;
    self->_viewsToOriginalAttributes = v9;

    CGAffineTransform v11 = [_UIViewBlockVisitor alloc];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63___UIIdleModeController__recordLayoutAttributesStartingAtView___block_invoke;
    v20[3] = &unk_1E52F2E98;
    v20[4] = self;
    id v12 = v4;
    id v21 = v12;
    CGAffineTransform v22 = &v23;
    CGAffineTransform v13 = [(_UIViewBlockVisitor *)v11 initWithTraversalDirection:2 visitorBlock:v20];
    double v14 = [v12 window];
    [v14 _receiveVisitor:v13];

    if (*((unsigned char *)v24 + 24))
    {
      BOOL v15 = 1;
    }
    else
    {
      double v16 = self->_viewsToCAFilters;
      self->_viewsToCAFilters = 0;

      double v17 = self->_viewsToAttributes;
      self->_viewsToAttributes = 0;

      CGAffineTransform v18 = self->_viewsToOriginalAttributes;
      self->_viewsToOriginalAttributes = 0;

      BOOL v15 = *((unsigned char *)v24 + 24) != 0;
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_prepareForPresentationWithKeyWindow:(id)a3 focusedView:(id)a4
{
  id v34 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_keyWindow, a3);
  double v8 = [(UIView *)self->_keyWindow layer];
  self->_keyWindowAllowedGroupBlending = [v8 allowsGroupBlending];

  double v9 = [(UIView *)self->_keyWindow layer];
  [v9 setAllowsGroupBlending:0];

  double v10 = objc_alloc_init(UIWindow);
  backgroundWindow = self->_backgroundWindow;
  self->_backgroundWindow = v10;

  id v12 = [v34 windowScene];
  CGAffineTransform v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    BOOL v15 = [v7 _window];
    double v16 = [v15 windowScene];
    double v17 = v16;
    if (v16)
    {
      id v14 = v16;
    }
    else
    {
      CGAffineTransform v18 = [(id)UIApp _defaultSceneIfExists];
      id v14 = +[UIScene _sceneForFBSScene:v18];
    }
  }

  [(UIWindow *)self->_backgroundWindow setWindowScene:v14];
  [(UIScreen *)self->_screen bounds];
  -[UIWindow setFrame:](self->_backgroundWindow, "setFrame:");
  v19 = +[UIColor clearColor];
  [(UIView *)self->_backgroundWindow setBackgroundColor:v19];

  [(UIWindow *)self->_backgroundWindow setWindowLevel:-10.0];
  [(UIView *)self->_backgroundWindow setUserInteractionEnabled:0];
  [(UIWindow *)self->_backgroundWindow setHidden:0];
  v20 = [(UIView *)self->_backgroundWindow layer];
  [v20 setAllowsGroupBlending:0];

  id v21 = self->_backgroundWindow;
  [v7 bounds];
  -[UIView convertRect:fromView:](v21, "convertRect:fromView:", v7);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [UIImageView alloc];
  v31 = -[_UIIdleModeController _vignetteImageAroundFocusedFrame:](self, "_vignetteImageAroundFocusedFrame:", v23, v25, v27, v29);
  v32 = [(UIImageView *)v30 initWithImage:v31];
  vignetteView = self->_vignetteView;
  self->_vignetteView = v32;

  [(UIView *)self->_vignetteView setAlpha:0.0];
  [(UIView *)self->_backgroundWindow addSubview:self->_vignetteView];
}

- (void)_animatePresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(_UIIdleModeController *)self _applyPresentationLayoutAttributesToViews];
  BOOL v3 = [(UIView *)self->_vignetteView traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  [(_UIIdleModeController *)self _vignetteAlphaForUserInterfaceStyle:v4];
  -[UIView setAlpha:](self->_vignetteView, "setAlpha:");
  id v5 = +[UIColor colorWithWhite:1.0 alpha:1.0];
  uint64_t v22 = [v5 CGColor];

  [(_UIIdleModeController *)self _dimmingOverlayWhiteValueForUserInterfaceStyle:v4];
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 CGColor];

  double v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
  [v8 setValue:v7 forKey:@"inputColor"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v9 = self;
  obj = self->_viewsToCAFilters;
  uint64_t v10 = [(NSMapTable *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    uint64_t v13 = *MEMORY[0x1E4F3A480];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        double v16 = [v15 layer];
        double v27 = v8;
        double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
        [v16 setFilters:v17];

        CGAffineTransform v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.multiplyColor.inputColor"];
        v19 = [MEMORY[0x1E4F39C10] functionWithName:v13];
        [v18 setTimingFunction:v19];

        [v18 setFromValue:v22];
        [v18 setToValue:v7];
        [(_UIIdleModeController *)v9 _presentationAnimationDuration];
        objc_msgSend(v18, "setDuration:");
        v20 = [v15 layer];
        [v20 addAnimation:v18 forKey:0];
      }
      uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }
}

- (void)_animateDismissal
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_vignetteView setAlpha:0.0];
  [(_UIIdleModeController *)self _dismissalAnimationDuration];
  double v4 = v3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v17 = self;
  obj = self->_viewsToCAFilters;
  uint64_t v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    double v7 = v4 * 0.5;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = *MEMORY[0x1E4F3A480];
    uint64_t v10 = *MEMORY[0x1E4F39FA8];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v11), "layer", v17);
        id v13 = +[UIColor colorWithWhite:1.0 alpha:1.0];
        uint64_t v14 = [v13 CGColor];

        BOOL v15 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.multiplyColor.inputColor"];
        double v16 = [MEMORY[0x1E4F39C10] functionWithName:v9];
        [v15 setTimingFunction:v16];

        [v15 setToValue:v14];
        [v15 setDuration:v7];
        [v15 setFillMode:v10];
        [v15 setRemovedOnCompletion:0];
        [v12 addAnimation:v15 forKey:@"_UIIdleModeDismissal"];

        ++v11;
      }
      while (v6 != v11);
      uint64_t v6 = [(NSMapTable *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  [(_UIIdleModeController *)v17 _applyDismissalLayoutAttributesToViews];
}

- (void)_completeDismissal
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  viewsToCAFilters = self->_viewsToCAFilters;
  if (viewsToCAFilters)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v4 = viewsToCAFilters;
    uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v10 = -[NSMapTable objectForKey:](self->_viewsToCAFilters, "objectForKey:", v9, (void)v20);
          uint64_t v11 = [v9 layer];
          [v11 removeAnimationForKey:@"_UIIdleModeDismissal"];
          [v11 setFilters:v10];
        }
        uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    BOOL keyWindowAllowedGroupBlending = self->_keyWindowAllowedGroupBlending;
    id v13 = [(UIView *)self->_keyWindow layer];
    [v13 setAllowsGroupBlending:keyWindowAllowedGroupBlending];

    keyWindow = self->_keyWindow;
    self->_keyWindow = 0;

    backgroundWindow = self->_backgroundWindow;
    self->_backgroundWindow = 0;

    vignetteView = self->_vignetteView;
    self->_vignetteView = 0;

    double v17 = self->_viewsToCAFilters;
    self->_viewsToCAFilters = 0;

    viewsToAttributes = self->_viewsToAttributes;
    self->_viewsToAttributes = 0;

    viewsToOriginalAttributes = self->_viewsToOriginalAttributes;
    self->_viewsToOriginalAttributes = 0;

    ++self->_dismissalTransactionID;
  }
}

- (UIScreen)screen
{
  return self->_screen;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)isIdleModeEnabled
{
  return self->_idleModeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_viewsToOriginalAttributes, 0);
  objc_storeStrong((id *)&self->_viewsToAttributes, 0);
  objc_storeStrong((id *)&self->_viewsToCAFilters, 0);
  objc_storeStrong((id *)&self->_keyWindow, 0);
  objc_storeStrong((id *)&self->_vignetteView, 0);
  objc_storeStrong((id *)&self->_backgroundWindow, 0);
}

@end