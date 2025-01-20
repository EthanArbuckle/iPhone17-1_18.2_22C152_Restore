@interface SBHomeAffordanceInteractionManager
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGRect)_homeAffordanceHitTestRectOfSize:(int64_t)a3 forHomeAffordanceInteraction:(id)a4;
- (SBHomeAffordanceInteractionManager)initWithWindowScene:(id)a3;
- (SBWindowScene)windowScene;
- (id)_assistantController;
- (id)_firstHomeAffordanceInteractionForGestureRecognizer:(id)a3;
- (id)_firstHomeAffordanceInteractionForGestureRecognizer:(id)a3 touch:(id)a4;
- (id)_systemGestureManager;
- (id)acquireDisableHomeAffordanceDoubleTapGestureAssertionWithReason:(id)a3;
- (id)newHomeAffordanceInteraction;
- (int64_t)hitTestRectSize;
- (void)_bounceDoubleTapFailureRecognized:(id)a3;
- (void)_bounceDoubleTapRecognized:(id)a3;
- (void)_bounceTapRecognized:(id)a3;
- (void)_edgePanChanged:(id)a3;
- (void)_gestureRecognizer:(id)a3 didFailToRecognizeDoubleTapWithHomeAffordanceInteraction:(id)a4;
- (void)_gestureRecognizer:(id)a3 didRecognizeClickWithHomeAffordanceInteraction:(id)a4;
- (void)_gestureRecognizer:(id)a3 didRecognizeDoubleTapWithHomeAffordanceInteraction:(id)a4;
- (void)_gestureRecognizer:(id)a3 didRecognizeTapWithHomeAffordanceInteraction:(id)a4;
- (void)_logShouldReceiveTouchIfNeeded:(BOOL)a3 forGestureRecognizer:(id)a4 touch:(id)a5;
- (void)_revealTapRecognized:(id)a3;
- (void)_updateBounceTapGestureRecognizers;
- (void)dealloc;
- (void)registerHomeAffordanceInteraction:(id)a3;
- (void)setHitTestRectSize:(int64_t)a3;
- (void)unregisterHomeAffordanceInteraction:(id)a3;
- (void)updateHomeAffordanceHitTestRectForHomeAffordanceInteraction:(id)a3;
@end

@implementation SBHomeAffordanceInteractionManager

- (void)updateHomeAffordanceHitTestRectForHomeAffordanceInteraction:(id)a3
{
  BOOL v4 = self->_currentHomeAffordanceInteraction == a3;
  id v5 = a3;
  [(SBHomeAffordanceInteractionManager *)self _homeAffordanceHitTestRectOfSize:v4 forHomeAffordanceInteraction:v5];
  objc_msgSend(v5, "setHomeAffordanceHitTestRect:");
}

- (CGRect)_homeAffordanceHitTestRectOfSize:(int64_t)a3 forHomeAffordanceInteraction:(id)a4
{
  id v5 = a4;
  [v5 homeAffordanceFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (a3 == 1)
  {
    [v5 expandedHomeAffordanceHitTestRectOutsets];
  }
  else
  {
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    if (!a3) {
      objc_msgSend(v5, "standardHomeAffordanceHitTestRectOutsets", 0.0, 0.0, 0.0, 0.0);
    }
  }
  double v18 = v7 + v16;
  double v19 = v9 + v17;
  double v20 = v11 - (v14 + v16);
  double v21 = v13 - (v15 + v17);

  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)registerHomeAffordanceInteraction:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSHashTable *)self->_registeredHomeAffordanceInteractions addObject:a3];
  if (!self->_gesturesEnabled && [(NSHashTable *)self->_registeredHomeAffordanceInteractions count])
  {
    BOOL v4 = SBLogHomeAffordance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v5 = [(NSHashTable *)self->_registeredHomeAffordanceInteractions count];
      int v13 = 134217984;
      NSUInteger v14 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizers; _registeredHomeAffordanceInteractions count changed to %lu",
        (uint8_t *)&v13,
        0xCu);
    }

    self->_gesturesEnabled = 1;
    double v6 = [(SBHomeAffordanceInteractionManager *)self _systemGestureManager];
    [v6 addGestureRecognizer:self->_bounceTapRecognizer withType:96];
    [v6 addGestureRecognizer:self->_revealTapRecognizer withType:99];
    [v6 addGestureRecognizer:self->_revealDoubleTapRecognizer withType:100];
    [v6 addGestureRecognizer:self->_revealEdgePanRecognizer withType:101];
    bounceDoubleTapRecognizer = self->_bounceDoubleTapRecognizer;
    if (bounceDoubleTapRecognizer)
    {
      [v6 addGestureRecognizer:bounceDoubleTapRecognizer withType:97];
      double v8 = SBLogHomeAffordance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer name];
        int v13 = 138543362;
        NSUInteger v14 = (NSUInteger)v9;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Added gesture recognizer: %{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
    bounceDoubleTapFailureRecognizer = self->_bounceDoubleTapFailureRecognizer;
    if (bounceDoubleTapFailureRecognizer)
    {
      [v6 addGestureRecognizer:bounceDoubleTapFailureRecognizer withType:98];
      double v11 = SBLogHomeAffordance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer name];
        int v13 = 138543362;
        NSUInteger v14 = (NSUInteger)v12;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Added gesture recognizer: %{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
    [v6 gestureRecognizerOfType:119 shouldBeRequiredToFailByGestureRecognizer:self->_revealEdgePanRecognizer];
    [v6 gestureRecognizerOfType:120 shouldBeRequiredToFailByGestureRecognizer:self->_revealEdgePanRecognizer];
    [v6 gestureRecognizerOfType:104 shouldBeRequiredToFailByGestureRecognizer:self->_revealEdgePanRecognizer];
    [v6 gestureRecognizerOfType:105 shouldBeRequiredToFailByGestureRecognizer:self->_revealEdgePanRecognizer];
  }
}

- (id)_systemGestureManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = [WeakRetained systemGestureManager];

  return v3;
}

- (id)newHomeAffordanceInteraction
{
  v3 = [SBHomeAffordanceInteraction alloc];
  return [(SBHomeAffordanceInteraction *)v3 initWithHomeAffordanceInteractionManager:self];
}

- (SBHomeAffordanceInteractionManager)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBHomeAffordanceInteractionManager;
  NSUInteger v5 = [(SBHomeAffordanceInteractionManager *)&v22 init];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    uint64_t v7 = _os_feature_enabled_impl();
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v6 action:sel__bounceTapRecognized_];
    bounceTapRecognizer = v6->_bounceTapRecognizer;
    v6->_bounceTapRecognizer = (UITapGestureRecognizer *)v8;

    [(UITapGestureRecognizer *)v6->_bounceTapRecognizer setName:@"homeGrabber.bounce.tap"];
    [(UITapGestureRecognizer *)v6->_bounceTapRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)v6->_bounceTapRecognizer setDelaysTouchesBegan:0];
    [(UITapGestureRecognizer *)v6->_bounceTapRecognizer setDelaysTouchesEnded:0];
    [(UITapGestureRecognizer *)v6->_bounceTapRecognizer setAllowedTouchTypes:&unk_1F3347F58];
    [(UITapGestureRecognizer *)v6->_bounceTapRecognizer sbf_setPencilTouchesAllowed:v7];
    [(UITapGestureRecognizer *)v6->_bounceTapRecognizer setDelegate:v6];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v6 action:sel__revealTapRecognized_];
    revealTapRecognizer = v6->_revealTapRecognizer;
    v6->_revealTapRecognizer = (UITapGestureRecognizer *)v10;

    [(UITapGestureRecognizer *)v6->_revealTapRecognizer setName:@"homeGrabber.reveal.tap"];
    [(UITapGestureRecognizer *)v6->_revealTapRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)v6->_revealTapRecognizer setDelaysTouchesBegan:0];
    [(UITapGestureRecognizer *)v6->_revealTapRecognizer setDelaysTouchesEnded:0];
    [(UITapGestureRecognizer *)v6->_revealTapRecognizer setAllowedTouchTypes:&unk_1F3347F70];
    [(UITapGestureRecognizer *)v6->_revealTapRecognizer sbf_setPencilTouchesAllowed:v7];
    [(UITapGestureRecognizer *)v6->_revealTapRecognizer setDelegate:v6];
    double v12 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4F42EC8]);
    revealDoubleTapRecognizer = v6->_revealDoubleTapRecognizer;
    v6->_revealDoubleTapRecognizer = v12;

    [(UITapGestureRecognizer *)v6->_revealDoubleTapRecognizer setName:@"homeGrabber.reveal.doubleTap"];
    [(UITapGestureRecognizer *)v6->_revealDoubleTapRecognizer setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)v6->_revealDoubleTapRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)v6->_revealDoubleTapRecognizer setDelaysTouchesBegan:0];
    [(UITapGestureRecognizer *)v6->_revealDoubleTapRecognizer setDelaysTouchesEnded:0];
    [(UITapGestureRecognizer *)v6->_revealDoubleTapRecognizer setAllowedTouchTypes:&unk_1F3347F88];
    [(UITapGestureRecognizer *)v6->_revealDoubleTapRecognizer sbf_setPencilTouchesAllowed:v7];
    [(UITapGestureRecognizer *)v6->_revealDoubleTapRecognizer setDelegate:v6];
    [(UITapGestureRecognizer *)v6->_revealTapRecognizer requireGestureRecognizerToFail:v6->_revealDoubleTapRecognizer];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F42D98]) initWithTarget:v6 action:sel__edgePanChanged_ type:3 options:v7];
    revealEdgePanRecognizer = v6->_revealEdgePanRecognizer;
    v6->_revealEdgePanRecognizer = (UIScreenEdgePanGestureRecognizer *)v14;

    [(UIScreenEdgePanGestureRecognizer *)v6->_revealEdgePanRecognizer setName:@"homeGrabber.edgePan"];
    [(UIScreenEdgePanGestureRecognizer *)v6->_revealEdgePanRecognizer setCancelsTouchesInView:0];
    [(UIScreenEdgePanGestureRecognizer *)v6->_revealEdgePanRecognizer setDelaysTouchesBegan:0];
    [(UIScreenEdgePanGestureRecognizer *)v6->_revealEdgePanRecognizer setDelaysTouchesEnded:0];
    [(UIScreenEdgePanGestureRecognizer *)v6->_revealEdgePanRecognizer setEdges:15];
    [(UIScreenEdgePanGestureRecognizer *)v6->_revealEdgePanRecognizer setAllowedTouchTypes:&unk_1F3347FA0];
    [(UIScreenEdgePanGestureRecognizer *)v6->_revealEdgePanRecognizer sbf_setPencilTouchesAllowed:v7];
    [(UIScreenEdgePanGestureRecognizer *)v6->_revealEdgePanRecognizer setDelegate:v6];
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    registeredHomeAffordanceInteractions = v6->_registeredHomeAffordanceInteractions;
    v6->_registeredHomeAffordanceInteractions = (NSHashTable *)v16;

    double v18 = (SiriQuickTypeGestureSource *)objc_alloc_init(MEMORY[0x1E4F9F968]);
    quickTypeGestureSource = v6->_quickTypeGestureSource;
    v6->_quickTypeGestureSource = v18;

    double v20 = [(SBHomeAffordanceInteractionManager *)v6 _assistantController];
    [v20 addObserver:v6];

    [(SBHomeAffordanceInteractionManager *)v6 _updateBounceTapGestureRecognizers];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(SBHomeAffordanceInteractionManager *)self _assistantController];
  [v3 removeObserver:self];

  [(SiriQuickTypeGestureSource *)self->_quickTypeGestureSource invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBHomeAffordanceInteractionManager;
  [(SBHomeAffordanceInteractionManager *)&v4 dealloc];
}

- (void)unregisterHomeAffordanceInteraction:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSHashTable *)self->_registeredHomeAffordanceInteractions removeObject:a3];
  if (self->_gesturesEnabled && ![(NSHashTable *)self->_registeredHomeAffordanceInteractions count])
  {
    objc_super v4 = SBLogHomeAffordance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v5 = [(NSHashTable *)self->_registeredHomeAffordanceInteractions count];
      int v11 = 134217984;
      NSUInteger v12 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizers; _registeredHomeAffordanceInteractions count changed to %lu",
        (uint8_t *)&v11,
        0xCu);
    }

    self->_gesturesEnabled = 0;
    double v6 = [(SBHomeAffordanceInteractionManager *)self _systemGestureManager];
    [v6 removeGestureRecognizer:self->_bounceTapRecognizer];
    [v6 removeGestureRecognizer:self->_revealTapRecognizer];
    [v6 removeGestureRecognizer:self->_revealDoubleTapRecognizer];
    [v6 removeGestureRecognizer:self->_revealEdgePanRecognizer];
    if (self->_bounceDoubleTapRecognizer)
    {
      objc_msgSend(v6, "removeGestureRecognizer:");
      uint64_t v7 = SBLogHomeAffordance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer name];
        int v11 = 138543362;
        NSUInteger v12 = (NSUInteger)v8;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Removed gesture recognizer: %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
    if (self->_bounceDoubleTapFailureRecognizer)
    {
      objc_msgSend(v6, "removeGestureRecognizer:");
      double v9 = SBLogHomeAffordance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer name];
        int v11 = 138543362;
        NSUInteger v12 = (NSUInteger)v10;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Removed gesture recognizer: %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (id)acquireDisableHomeAffordanceDoubleTapGestureAssertionWithReason:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  double v6 = [v4 setWithArray:&unk_1F3347FB8];
  uint64_t v7 = [(SBHomeAffordanceInteractionManager *)self _systemGestureManager];
  uint64_t v8 = [v7 acquireSystemGestureDisableAssertionForReason:v5 forSystemGestureTypes:v6];

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    NSUInteger v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[SBHomeAffordanceInteractionManager gestureRecognizer:shouldReceiveTouch:]"];
    [v12 handleFailureInFunction:v13 file:@"SBHomeAffordanceInteractionManager.m" lineNumber:227 description:@"this call must be made on the main thread"];
  }
  if (self->_bounceTapRecognizer == v6)
  {
    double v9 = [(SBHomeAffordanceInteractionManager *)self _firstHomeAffordanceInteractionForGestureRecognizer:v6 touch:v7];
    LOBYTE(v8) = v9 != 0;
  }
  else if (self->_bounceDoubleTapRecognizer == v6 || self->_bounceDoubleTapFailureRecognizer == v6)
  {
    if ([v7 _isPointerTouch])
    {
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v10 = [(SBHomeAffordanceInteractionManager *)self _firstHomeAffordanceInteractionForGestureRecognizer:v6 touch:v7];
      BOOL v8 = v10 != 0;
    }
    [(SBHomeAffordanceInteractionManager *)self _logShouldReceiveTouchIfNeeded:v8 forGestureRecognizer:v6 touch:v7];
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)_assistantController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = [WeakRetained assistantController];

  return v3;
}

- (void)_bounceTapRecognized:(id)a3
{
  id v10 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = [NSString stringWithUTF8String:"-[SBHomeAffordanceInteractionManager _bounceTapRecognized:]"];
    [v8 handleFailureInFunction:v9 file:@"SBHomeAffordanceInteractionManager.m" lineNumber:251 description:@"this call must be made on the main thread"];
  }
  int v4 = objc_msgSend(v10, "sbf_hasPointerTouch");
  id v5 = [(SBHomeAffordanceInteractionManager *)self _systemGestureManager];
  char v6 = [v5 areSystemGesturesDisabledForAccessibility];

  id v7 = [(SBHomeAffordanceInteractionManager *)self _firstHomeAffordanceInteractionForGestureRecognizer:v10];
  if (!v4 || (v6 & 1) != 0) {
    [(SBHomeAffordanceInteractionManager *)self _gestureRecognizer:v10 didRecognizeTapWithHomeAffordanceInteraction:v7];
  }
  else {
    [(SBHomeAffordanceInteractionManager *)self _gestureRecognizer:v10 didRecognizeClickWithHomeAffordanceInteraction:v7];
  }
}

- (void)_bounceDoubleTapRecognized:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  if (([v4 isMainThread] & 1) == 0)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"-[SBHomeAffordanceInteractionManager _bounceDoubleTapRecognized:]"];
    [v6 handleFailureInFunction:v7 file:@"SBHomeAffordanceInteractionManager.m" lineNumber:266 description:@"this call must be made on the main thread"];
  }
  id v8 = [(SBHomeAffordanceInteractionManager *)self _firstHomeAffordanceInteractionForGestureRecognizer:v5];
  [(SBHomeAffordanceInteractionManager *)self _gestureRecognizer:v5 didRecognizeDoubleTapWithHomeAffordanceInteraction:v8];
}

- (void)_bounceDoubleTapFailureRecognized:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  if (([v4 isMainThread] & 1) == 0)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"-[SBHomeAffordanceInteractionManager _bounceDoubleTapFailureRecognized:]"];
    [v6 handleFailureInFunction:v7 file:@"SBHomeAffordanceInteractionManager.m" lineNumber:273 description:@"this call must be made on the main thread"];
  }
  id v8 = [(SBHomeAffordanceInteractionManager *)self _firstHomeAffordanceInteractionForGestureRecognizer:v5];
  [(SBHomeAffordanceInteractionManager *)self _gestureRecognizer:v5 didFailToRecognizeDoubleTapWithHomeAffordanceInteraction:v8];
}

- (void)_revealTapRecognized:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[SBHomeAffordanceInteractionManager _revealTapRecognized:]"];
    [v14 handleFailureInFunction:v15 file:@"SBHomeAffordanceInteractionManager.m" lineNumber:280 description:@"this call must be made on the main thread"];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v4 = (void *)[(NSHashTable *)self->_registeredHomeAffordanceInteractions copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v16 + 1) + 8 * v8) view];
        uint64_t v10 = objc_opt_class();
        id v11 = v9;
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            NSUInteger v12 = v11;
          }
          else {
            NSUInteger v12 = 0;
          }
        }
        else
        {
          NSUInteger v12 = 0;
        }
        id v13 = v12;

        objc_msgSend(v13, "_noteActiveForTouchThatShouldUnhideImmediately:", objc_msgSend(v11, "isHidden"));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)_edgePanChanged:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v16 = [NSString stringWithUTF8String:"-[SBHomeAffordanceInteractionManager _edgePanChanged:]"];
    [v15 handleFailureInFunction:v16 file:@"SBHomeAffordanceInteractionManager.m" lineNumber:289 description:@"this call must be made on the main thread"];
  }
  if ([v4 state] == 1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = (void *)[(NSHashTable *)self->_registeredHomeAffordanceInteractions copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * v9) view];
          uint64_t v11 = objc_opt_class();
          id v12 = v10;
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              id v13 = v12;
            }
            else {
              id v13 = 0;
            }
          }
          else
          {
            id v13 = 0;
          }
          id v14 = v13;

          [v14 _noteActiveForTouchThatShouldUnhideImmediately:0];
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
}

- (void)_logShouldReceiveTouchIfNeeded:(BOOL)a3 forGestureRecognizer:(id)a4 touch:(id)a5
{
  BOOL v6 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = SBLogHomeAffordance();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

  if (v11)
  {
    id v12 = [(SBHomeAffordanceInteractionManager *)self _firstHomeAffordanceInteractionForGestureRecognizer:v8 touch:v9];
    id v13 = v12;
    if (v12)
    {
      id v14 = [v12 view];
      _UISystemGestureLocationForTouchInView();
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      [v13 homeAffordanceHitTestRect];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
    }
    else
    {
      id v14 = 0;
      CGFloat v20 = *MEMORY[0x1E4F1DB20];
      CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      CGFloat v18 = INFINITY;
      CGFloat v16 = INFINITY;
    }
    v27 = SBLogHomeAffordance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = [v8 name];
      int v33 = [v9 _isPointerTouch];
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      v47.x = v16;
      v47.y = v18;
      v31 = NSStringFromCGPoint(v47);
      v48.origin.x = v20;
      v48.origin.y = v22;
      v48.size.width = v24;
      v48.size.height = v26;
      v32 = NSStringFromCGRect(v48);
      *(_DWORD *)buf = 138544642;
      v35 = v28;
      __int16 v36 = 1026;
      BOOL v37 = v6;
      __int16 v38 = 1026;
      int v39 = v33;
      __int16 v40 = 2114;
      v41 = v30;
      __int16 v42 = 2114;
      v43 = v31;
      __int16 v44 = 2114;
      v45 = v32;
        "n in view: %{public}@; hit test rect in view: %{public}@)",
        buf,
        0x36u);
    }
  }
}

- (id)_firstHomeAffordanceInteractionForGestureRecognizer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(v4, "sbf_activeTouches", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(SBHomeAffordanceInteractionManager *)self _firstHomeAffordanceInteractionForGestureRecognizer:v4 touch:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v10)
        {
          BOOL v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)_firstHomeAffordanceInteractionForGestureRecognizer:(id)a3 touch:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_registeredHomeAffordanceInteractions copy];
  id v9 = (id)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = [v12 view];
        _UISystemGestureLocationForTouchInView();
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        [v12 homeAffordanceHitTestRect];
        v26.x = v15;
        v26.y = v17;
        if (CGRectContainsPoint(v27, v26))
        {
          id v9 = v12;

          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_updateBounceTapGestureRecognizers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(SBHomeAffordanceInteractionManager *)self _assistantController];
  uint64_t v4 = [v3 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  uint64_t v5 = SBLogHomeAffordance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 67109120;
    LODWORD(v25) = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizers with isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled: %{BOOL}u", (uint8_t *)&v24, 8u);
  }

  [(UITapGestureRecognizer *)self->_bounceTapRecognizer _wantsGESEvents:v4];
  bounceDoubleTapRecognizer = self->_bounceDoubleTapRecognizer;
  if (v4)
  {
    if (!bounceDoubleTapRecognizer)
    {
      id v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__bounceDoubleTapRecognized_];
      uint64_t v8 = self->_bounceDoubleTapRecognizer;
      self->_bounceDoubleTapRecognizer = v7;

      [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer setName:@"homeGrabber.bounce.doubleTap"];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer setNumberOfTapsRequired:2];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer setCancelsTouchesInView:0];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer setDelaysTouchesBegan:0];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer setDelaysTouchesEnded:0];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer setAllowedTouchTypes:&unk_1F3347FD0];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer setDelegate:self];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer _wantsGESEvents:1];
      if (self->_gesturesEnabled)
      {
        id v9 = [(SBHomeAffordanceInteractionManager *)self _systemGestureManager];
        [v9 addGestureRecognizer:self->_bounceDoubleTapRecognizer withType:97];

        uint64_t v10 = SBLogHomeAffordance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v11 = [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer name];
          int v24 = 138543362;
          double v25 = v11;
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Added gesture recognizer: %{public}@", (uint8_t *)&v24, 0xCu);
        }
      }
    }
    if (!self->_bounceDoubleTapFailureRecognizer)
    {
      id v12 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__bounceDoubleTapFailureRecognized_];
      bounceDoubleTapFailureRecognizer = self->_bounceDoubleTapFailureRecognizer;
      self->_bounceDoubleTapFailureRecognizer = v12;

      [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer setName:@"homeGrabber.bounce.doubleTapFailure"];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer setCancelsTouchesInView:0];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer setDelaysTouchesBegan:0];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer setDelaysTouchesEnded:0];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer setAllowedTouchTypes:&unk_1F3347FE8];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer setDelegate:self];
      [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer _wantsGESEvents:1];
      if (self->_gesturesEnabled)
      {
        double v14 = [(SBHomeAffordanceInteractionManager *)self _systemGestureManager];
        [v14 addGestureRecognizer:self->_bounceDoubleTapFailureRecognizer withType:98];

        CGFloat v15 = SBLogHomeAffordance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          double v16 = [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer name];
          int v24 = 138543362;
          double v25 = v16;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Added gesture recognizer: %{public}@", (uint8_t *)&v24, 0xCu);
        }
      }
      [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer requireGestureRecognizerToFail:self->_bounceDoubleTapRecognizer];
    }
  }
  else
  {
    if (bounceDoubleTapRecognizer)
    {
      if (self->_gesturesEnabled)
      {
        CGFloat v17 = [(SBHomeAffordanceInteractionManager *)self _systemGestureManager];
        [v17 removeGestureRecognizer:self->_bounceDoubleTapRecognizer];

        uint64_t v18 = SBLogHomeAffordance();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = [(UITapGestureRecognizer *)self->_bounceDoubleTapRecognizer name];
          int v24 = 138543362;
          double v25 = v19;
          _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Removed gesture recognizer: %{public}@", (uint8_t *)&v24, 0xCu);
        }
        bounceDoubleTapRecognizer = self->_bounceDoubleTapRecognizer;
      }
      self->_bounceDoubleTapRecognizer = 0;
    }
    long long v20 = self->_bounceDoubleTapFailureRecognizer;
    if (v20)
    {
      if (self->_gesturesEnabled)
      {
        long long v21 = [(SBHomeAffordanceInteractionManager *)self _systemGestureManager];
        [v21 removeGestureRecognizer:self->_bounceDoubleTapFailureRecognizer];

        long long v22 = SBLogHomeAffordance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          double v23 = [(UITapGestureRecognizer *)self->_bounceDoubleTapFailureRecognizer name];
          int v24 = 138543362;
          double v25 = v23;
          _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Removed gesture recognizer: %{public}@", (uint8_t *)&v24, 0xCu);
        }
        long long v20 = self->_bounceDoubleTapFailureRecognizer;
      }
      self->_bounceDoubleTapFailureRecognizer = 0;
    }
  }
}

- (void)_gestureRecognizer:(id)a3 didRecognizeClickWithHomeAffordanceInteraction:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "view", a3);
  uint64_t v6 = objc_opt_class();
  id v10 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v10;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  [v8 _noteClick];
  id v9 = [(SBHomeAffordanceInteractionManager *)self _assistantController];
  [v9 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];
}

- (void)_gestureRecognizer:(id)a3 didRecognizeTapWithHomeAffordanceInteraction:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 view];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v11 = v10;
    }
    else {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  id v12 = v11;

  [v12 _noteTap];
  long long v13 = [(SBHomeAffordanceInteractionManager *)self _assistantController];
  int v14 = [v13 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  if (v14)
  {
    CGFloat v15 = self->_currentHomeAffordanceInteraction;
    objc_storeStrong((id *)&self->_currentHomeAffordanceInteraction, a4);
    [(SBHomeAffordanceInteraction *)v15 setNeedsUpdate];
    [(SBHomeAffordanceInteraction *)self->_currentHomeAffordanceInteraction notifyDidRecognizeSingleTap];
    [(SBHomeAffordanceInteraction *)self->_currentHomeAffordanceInteraction setNeedsUpdate];
    double v16 = objc_msgSend(v6, "sbf_activeTouches");
    CGFloat v17 = [v16 anyObject];
    _UISystemGestureLocationForTouchInView();
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    long long v22 = SBLogHomeAffordance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v29.x = v19;
      v29.y = v21;
      double v23 = NSStringFromCGPoint(v29);
      int v26 = 138543362;
      CGRect v27 = v23;
      _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Recognized single tap at %{public}@", (uint8_t *)&v26, 0xCu);
    }
    self->_isTrackingPossibleDoubleTap = 1;
    if (!self->_quickTypePrewarmAssertion)
    {
      int v24 = [(SiriQuickTypeGestureSource *)self->_quickTypeGestureSource prewarm];
      quickTypePrewarmAssertion = self->_quickTypePrewarmAssertion;
      self->_quickTypePrewarmAssertion = v24;
    }
  }
}

- (void)_gestureRecognizer:(id)a3 didRecognizeDoubleTapWithHomeAffordanceInteraction:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBHomeAffordanceInteractionManager *)self _assistantController];
  int v9 = [v8 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  if (v9)
  {
    id v10 = self->_currentHomeAffordanceInteraction;
    currentHomeAffordanceInteraction = self->_currentHomeAffordanceInteraction;
    self->_currentHomeAffordanceInteraction = 0;

    [(SBHomeAffordanceInteraction *)v10 notifyDidRecognizeDoubleTap];
    [(SBHomeAffordanceInteraction *)v10 setNeedsUpdate];
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      long long v13 = [WeakRetained sceneManager];
      int v14 = [v13 policyAggregator];

      if ([v14 allowsCapability:5]) {
        [(SiriQuickTypeGestureSource *)self->_quickTypeGestureSource activate];
      }
    }
    if (self->_isTrackingPossibleDoubleTap)
    {
      CGFloat v15 = objc_msgSend(v6, "sbf_activeTouches");
      double v16 = [v15 anyObject];
      CGFloat v17 = [v7 view];
      _UISystemGestureLocationForTouchInView();
      CGFloat v19 = v18;
      CGFloat v21 = v20;

      long long v22 = SBLogHomeAffordance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v28.x = v19;
        v28.y = v21;
        double v23 = NSStringFromCGPoint(v28);
        int v25 = 138543362;
        int v26 = v23;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Recognized double tap at %{public}@", (uint8_t *)&v25, 0xCu);
      }
      self->_isTrackingPossibleDoubleTap = 0;
    }
    quickTypePrewarmAssertion = self->_quickTypePrewarmAssertion;
    if (quickTypePrewarmAssertion)
    {
      self->_quickTypePrewarmAssertion = 0;
    }
  }
}

- (void)_gestureRecognizer:(id)a3 didFailToRecognizeDoubleTapWithHomeAffordanceInteraction:(id)a4
{
  uint64_t v5 = [(SBHomeAffordanceInteractionManager *)self _assistantController];
  int v6 = [v5 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  if (v6)
  {
    id v7 = self->_currentHomeAffordanceInteraction;
    currentHomeAffordanceInteraction = self->_currentHomeAffordanceInteraction;
    self->_currentHomeAffordanceInteraction = 0;

    [(SBHomeAffordanceInteraction *)v7 notifyDidFailToRecognizeDoubleTap];
    [(SBHomeAffordanceInteraction *)v7 setNeedsUpdate];
    if (self->_isTrackingPossibleDoubleTap)
    {
      int v9 = SBLogHomeAffordance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Failed to recognize double tap", v12, 2u);
      }

      self->_isTrackingPossibleDoubleTap = 0;
    }
    quickTypePrewarmAssertion = self->_quickTypePrewarmAssertion;
    if (quickTypePrewarmAssertion)
    {
      [(SiriAssertion *)quickTypePrewarmAssertion invalidate];
      BOOL v11 = self->_quickTypePrewarmAssertion;
      self->_quickTypePrewarmAssertion = 0;
    }
  }
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (int64_t)hitTestRectSize
{
  return self->_hitTestRectSize;
}

- (void)setHitTestRectSize:(int64_t)a3
{
  self->_hitTestRectSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_quickTypePrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_quickTypeGestureSource, 0);
  objc_storeStrong((id *)&self->_currentHomeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_registeredHomeAffordanceInteractions, 0);
  objc_storeStrong((id *)&self->_revealEdgePanRecognizer, 0);
  objc_storeStrong((id *)&self->_revealDoubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_revealTapRecognizer, 0);
  objc_storeStrong((id *)&self->_bounceDoubleTapFailureRecognizer, 0);
  objc_storeStrong((id *)&self->_bounceDoubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_bounceTapRecognizer, 0);
}

@end