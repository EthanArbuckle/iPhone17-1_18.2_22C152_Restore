@interface _UIHomeAffordanceObserverProxyInteraction
- (NSString)debugDescription;
- (NSString)description;
- (UIView)view;
- (_UIHomeAffordanceObserverProxyInteraction)init;
- (id)succinctDescription;
- (uint64_t)_configureCoalescedFrameEvaluationDisplayLinkForScreen:(id *)a1;
- (uint64_t)_disableCoalescedFrameEvaluation;
- (void)_coalescedFrameEvaluationDisplayLinkTicked:(id)a3;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_notifier:(id)a3 homeAffordanceDoubleTapGestureDidSucceed:(BOOL)a4;
- (void)_notifier:(id)a3 homeAffordanceFrameDidChange:(CGRect)a4;
- (void)_updateHomeAffordanceObservationIfNeededForWindow:(id)a3 withTargetNotifier:;
- (void)_windowDidMoveToScene:(id)a3;
- (void)_windowHostingSceneDidMoveToScreen:(id)a3;
- (void)_windowWillMoveToNilScene:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)initWithIntersectedFrameHandler:(void *)a3 doubleTapGestureHandler:;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIHomeAffordanceObserverProxyInteraction

- (_UIHomeAffordanceObserverProxyInteraction)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIHomeAffordanceObserverProxyInteraction.m", 82, @"%s: init is not allowed on %@", "-[_UIHomeAffordanceObserverProxyInteraction init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)initWithIntersectedFrameHandler:(void *)a3 doubleTapGestureHandler:
{
  v3 = a1;
  if (!a1) {
    return v3;
  }
  if (a2)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel_initWithIntersectedFrameHandler_doubleTapGestureHandler_, v3, @"_UIHomeAffordanceObserverProxyInteraction.m", 89, @"Invalid initialization of %@: proxyIntersectedFrameHandler is required", objc_opt_class() object file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:sel_initWithIntersectedFrameHandler_doubleTapGestureHandler_, v3, @"_UIHomeAffordanceObserverProxyInteraction.m", 90, @"Invalid initialization of %@: proxyDoubleTapGestureHandler is required", objc_opt_class() object file lineNumber description];

LABEL_4:
  v13.receiver = v3;
  v13.super_class = (Class)_UIHomeAffordanceObserverProxyInteraction;
  v3 = objc_msgSendSuper2(&v13, sel_init);
  if (v3)
  {
    uint64_t v6 = [a2 copy];
    v7 = (void *)v3[1];
    v3[1] = v6;

    uint64_t v8 = [a3 copy];
    v9 = (void *)v3[2];
    v3[2] = v8;
  }
  return v3;
}

- (void)dealloc
{
  v6[3] = *MEMORY[0x1E4F143B8];
  [(_UIInvalidatable *)self->_homeAffordanceRegistrationToken _invalidate];
  [(CADisplayLink *)self->_coalescedFrameEvaluationDisplayLink invalidate];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"_UIWindowHostingSceneDidMoveToScreenNotification";
  v6[1] = 0x1ED1601E0;
  v6[2] = @"_UIWindowWillMoveToNilSceneNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIHomeAffordanceObserverProxyInteraction;
  [(_UIHomeAffordanceObserverProxyInteraction *)&v5 dealloc];
}

- (void)_notifier:(id)a3 homeAffordanceFrameDidChange:(CGRect)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_homeAffordanceRegistrationToken)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    -[_UIHomeAffordanceObserverProxyInteraction _disableCoalescedFrameEvaluation]((uint64_t)self);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    if (!CGRectEqualToRect(v28, *MEMORY[0x1E4F1DB28]))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      CGFloat x = _UIHomeAffordanceSceneReferenceFrameIntersectionWithView(WeakRetained, x, y, width, height);
      CGFloat y = v10;
      CGFloat width = v11;
      CGFloat height = v12;
    }
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    if (!CGRectEqualToRect(v29, self->_lastNotifiedHomeAffordanceFrameIntersection))
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_notifier_homeAffordanceFrameDidChange____s_category_1);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v15 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = v15;
          v30.origin.CGFloat x = x;
          v30.origin.CGFloat y = y;
          v30.size.CGFloat width = width;
          v30.size.CGFloat height = height;
          v17 = NSStringFromCGRect(v30);
          v18 = [(_UIHomeAffordanceObserverProxyInteraction *)self succinctDescription];
          id v19 = objc_loadWeakRetained((id *)&self->_homeAffordanceNotifier);
          v20 = [v19 succinctDescription];
          int v21 = 138543874;
          v22 = v17;
          __int16 v23 = 2114;
          v24 = v18;
          __int16 v25 = 2114;
          v26 = v20;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Sending intersected home affordance frame to proxy handler: %{public}@; self: %{public}@; notifier: %{public}@",
            (uint8_t *)&v21,
            0x20u);
        }
      }
      proxyIntersectedFrameHandler = (void (**)(double, double, double, double))self->_proxyIntersectedFrameHandler;
      if (proxyIntersectedFrameHandler)
      {
        proxyIntersectedFrameHandler[2](x, y, width, height);
        self->_lastNotifiedHomeAffordanceFrameIntersection.origin.CGFloat x = x;
        self->_lastNotifiedHomeAffordanceFrameIntersection.origin.CGFloat y = y;
        self->_lastNotifiedHomeAffordanceFrameIntersection.size.CGFloat width = width;
        self->_lastNotifiedHomeAffordanceFrameIntersection.size.CGFloat height = height;
      }
    }
  }
}

- (uint64_t)_disableCoalescedFrameEvaluation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 24))
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_disableCoalescedFrameEvaluation___s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v3 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          v4 = v3;
          objc_super v5 = [(id)v1 succinctDescription];
          int v6 = 138543362;
          v7 = v5;
          _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Disabling coalesced frame evaluation: %{public}@", (uint8_t *)&v6, 0xCu);
        }
      }
    }
    *(unsigned char *)(v1 + 24) &= ~1u;
    return [*(id *)(v1 + 64) setPaused:1];
  }
  return result;
}

- (void)_notifier:(id)a3 homeAffordanceDoubleTapGestureDidSucceed:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_homeAffordanceRegistrationToken)
  {
    BOOL v4 = a4;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_notifier_homeAffordanceDoubleTapGestureDidSucceed____s_category_1);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v9 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        double v10 = v9;
        double v11 = [(_UIHomeAffordanceObserverProxyInteraction *)self succinctDescription];
        double v12 = [a3 succinctDescription];
        v13[0] = 67109634;
        v13[1] = v4;
        __int16 v14 = 2114;
        v15 = v11;
        __int16 v16 = 2114;
        v17 = v12;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Sending doubleTapGestureDidSucceed to proxy handler: %d; self: %{public}@; notifier: %{public}@",
          (uint8_t *)v13,
          0x1Cu);
      }
    }
    proxyDoubleTapGestureHandler = (void (**)(id, BOOL))self->_proxyDoubleTapGestureHandler;
    if (proxyDoubleTapGestureHandler) {
      proxyDoubleTapGestureHandler[2](proxyDoubleTapGestureHandler, v4);
    }
  }
}

- (void)_coalescedFrameEvaluationDisplayLinkTicked:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char interactionFlags = (char)self->_interactionFlags;
  -[_UIHomeAffordanceObserverProxyInteraction _disableCoalescedFrameEvaluation]((uint64_t)self);
  if ((interactionFlags & 1) != 0 && self->_homeAffordanceRegistrationToken)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_coalescedFrameEvaluationDisplayLinkTicked____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v18 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = v18;
        v20 = [(_UIHomeAffordanceObserverProxyInteraction *)self succinctDescription];
        int v21 = 138543362;
        v22 = v20;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Performing coalesced frame evaluation: %{public}@", (uint8_t *)&v21, 0xCu);
      }
    }
    if (self->_homeAffordanceRegistrationToken)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceNotifier);
      id v7 = objc_loadWeakRetained((id *)&self->_view);
      uint64_t v8 = [v7 _window];
      [WeakRetained homeAffordanceSceneReferenceFrameForWindow:v8];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      id v17 = objc_loadWeakRetained((id *)&self->_homeAffordanceNotifier);
      -[_UIHomeAffordanceObserverProxyInteraction _notifier:homeAffordanceFrameDidChange:](self, "_notifier:homeAffordanceFrameDidChange:", v17, v10, v12, v14, v16);
    }
  }
}

- (uint64_t)_configureCoalescedFrameEvaluationDisplayLinkForScreen:(id *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1[8];
  if (!v3)
  {
    uint64_t v4 = [a2 displayLinkWithTarget:a1 selector:sel__coalescedFrameEvaluationDisplayLinkTicked_];
    id v5 = a1[8];
    a1[8] = (id)v4;

    id v6 = a1[8];
    id v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

    id v3 = a1[8];
  }
  uint64_t result = [v3 isPaused];
  if (result)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_configureCoalescedFrameEvaluationDisplayLinkForScreen____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      double v10 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        double v11 = v10;
        double v12 = [a1 succinctDescription];
        int v13 = 138543362;
        double v14 = v12;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Scheduling coalesced frame evaluation: %{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
    return [a1[8] setPaused:0];
  }
  return result;
}

- (void)_updateHomeAffordanceObservationIfNeededForWindow:(id)a3 withTargetNotifier:
{
  if (a1)
  {
    id v6 = a1 + 5;
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v41 = WeakRetained;
    id v9 = a2;
    if (v41 == v9)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v9 && v41) {
        char v10 = [v41 isEqual:v9];
      }
    }

    id v11 = objc_loadWeakRetained(a1 + 6);
    if (a3) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    int v13 = v12;

    id v14 = objc_loadWeakRetained(a1 + 6);
    uint64_t v15 = v14;
    BOOL v16 = 0;
    location = v6;
    char v39 = v10;
    if (a3 && v14)
    {
      id v17 = objc_loadWeakRetained(a1 + 6);
      BOOL v16 = v17 != a3;
    }
    id v18 = objc_loadWeakRetained(a1 + 6);
    if (a3) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v18 == 0;
    }
    int v20 = v19;

    int v21 = v13 | v16;
    if (((v13 | v16) & 1) != 0 || !v20)
    {
      -[_UIHomeAffordanceObserverProxyInteraction _disableCoalescedFrameEvaluation]((uint64_t)a1);
      if (v16)
      {
        id v22 = objc_loadWeakRetained(a1 + 6);
        uint64_t v23 = [v22 windowHostingScene];
        [v8 removeObserver:a1 name:@"_UIWindowHostingSceneDidMoveToScreenNotification" object:v23];

        [a1[7] _invalidate];
      }
      if (v21)
      {
        objc_storeWeak(a1 + 6, a3);
        uint64_t v24 = [a3 registerHomeAffordanceObserver:a1 inWindow:v9];
        id v25 = a1[7];
        a1[7] = (id)v24;

        [a3 homeAffordanceSceneReferenceFrameForWindow:v9];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        v34 = [a3 windowHostingScene];
        [v8 addObserver:a1 selector:sel__windowHostingSceneDidMoveToScreen_ name:@"_UIWindowHostingSceneDidMoveToScreenNotification" object:v34];
      }
      else
      {
        double v27 = *MEMORY[0x1E4F1DB28];
        double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
      id v35 = objc_loadWeakRetained(a1 + 6);
      objc_msgSend(a1, "_notifier:homeAffordanceFrameDidChange:", v35, v27, v29, v31, v33);

      if ((v20 & 1) == 0)
      {
        id v36 = objc_loadWeakRetained(a1 + 6);
        v37 = [v36 windowHostingScene];
        [v8 removeObserver:a1 name:@"_UIWindowHostingSceneDidMoveToScreenNotification" object:v37];

        [a1[7] _invalidate];
        id v38 = a1[7];
        a1[7] = 0;

        objc_storeWeak(a1 + 6, 0);
      }
    }
    if ((v39 & 1) == 0)
    {
      if (v41)
      {
        [v8 removeObserver:a1 name:0x1ED1601E0 object:v41];
        [v8 removeObserver:a1 name:@"_UIWindowWillMoveToNilSceneNotification" object:v41];
      }
      if (v9)
      {
        [v8 addObserver:a1 selector:sel__windowDidMoveToScene_ name:0x1ED1601E0 object:v9];
        [v8 addObserver:a1 selector:sel__windowWillMoveToNilScene_ name:@"_UIWindowWillMoveToNilSceneNotification" object:v9];
      }
    }
    objc_storeWeak(location, v9);
  }
}

- (void)willMoveToView:(id)a3
{
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    -[UIView _removeGeometryChangeObserver:](WeakRetained, self);
  }
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v6 = objc_storeWeak((id *)&self->_view, a3);

  if (self && a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    -[UIView _addGeometryChangeObserver:](WeakRetained, self);
  }
  id v8 = objc_loadWeakRetained((id *)p_view);
  id v11 = [v8 _window];

  id v9 = [v11 _windowHostingScene];
  char v10 = [v9 _homeAffordanceSceneNotifier];

  -[_UIHomeAffordanceObserverProxyInteraction _updateHomeAffordanceObservationIfNeededForWindow:withTargetNotifier:]((id *)&self->super.isa, v11, v10);
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v8 = [WeakRetained _window];

  id v6 = [v8 _windowHostingScene];
  id v7 = [v6 _homeAffordanceSceneNotifier];

  -[_UIHomeAffordanceObserverProxyInteraction _updateHomeAffordanceObservationIfNeededForWindow:withTargetNotifier:]((id *)&self->super.isa, v8, v7);
}

- (void)_windowDidMoveToScene:(id)a3
{
  uint64_t v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v15 = v7;

  id v8 = v15;
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v10 = [WeakRetained _window];

    id v8 = v15;
    if (v10 == v15)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_view);
      BOOL v12 = [v11 _window];

      int v13 = [v12 _windowHostingScene];
      id v14 = [v13 _homeAffordanceSceneNotifier];

      -[_UIHomeAffordanceObserverProxyInteraction _updateHomeAffordanceObservationIfNeededForWindow:withTargetNotifier:]((id *)&self->super.isa, v12, v14);
      id v8 = v15;
    }
  }
}

- (void)_windowWillMoveToNilScene:(id)a3
{
  uint64_t v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  int v13 = v7;

  id v8 = v13;
  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v10 = [WeakRetained _window];

    id v8 = v13;
    if (v10 == v13)
    {
      if ((v13[12] & 0x1000) != 0) {
        id v11 = 0;
      }
      else {
        id v11 = v13;
      }
      id v12 = v11;

      -[_UIHomeAffordanceObserverProxyInteraction _updateHomeAffordanceObservationIfNeededForWindow:withTargetNotifier:]((id *)&self->super.isa, v12, 0);
      id v8 = v12;
    }
  }
}

- (void)_windowHostingSceneDidMoveToScreen:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v25 = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceNotifier);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_homeAffordanceNotifier);
    id v11 = [v10 windowHostingScene];

    if (v11 == v25)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_homeAffordanceNotifier);
      int v13 = [v12 windowHostingScene];
      id v14 = [v13 _screen];
      if (self)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_handleScreenChangeForCoalescedFrameEvaluationDisplayLink____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          id v18 = *(id *)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            BOOL v19 = [(_UIHomeAffordanceObserverProxyInteraction *)self succinctDescription];
            if (v14)
            {
              int v20 = NSString;
              id v21 = v14;
              id v22 = (objc_class *)objc_opt_class();
              uint64_t v23 = NSStringFromClass(v22);
              uint64_t v24 = [v20 stringWithFormat:@"<%@: %p>", v23, v21];
            }
            else
            {
              uint64_t v24 = @"(nil)";
            }
            *(_DWORD *)buf = 138543618;
            double v27 = v19;
            __int16 v28 = 2114;
            double v29 = v24;
            _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Handling screen change for coalesced frame evaluation: %{public}@; screen: %{public}@",
              buf,
              0x16u);
          }
        }
        char interactionFlags = (char)self->_interactionFlags;
        [(CADisplayLink *)self->_coalescedFrameEvaluationDisplayLink invalidate];
        coalescedFrameEvaluationDisplayLink = self->_coalescedFrameEvaluationDisplayLink;
        self->_coalescedFrameEvaluationDisplayLink = 0;

        if (interactionFlags) {
          -[_UIHomeAffordanceObserverProxyInteraction _configureCoalescedFrameEvaluationDisplayLinkForScreen:]((id *)&self->super.isa, v14);
        }
      }
    }
  }
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if (self->_homeAffordanceRegistrationToken)
  {
    if ((a3->var0 & 0x1036) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceNotifier);
      id v6 = [WeakRetained windowHostingScene];
      id v7 = [v6 _screen];
      -[_UIHomeAffordanceObserverProxyInteraction _configureCoalescedFrameEvaluationDisplayLinkForScreen:]((id *)&self->super.isa, v7);

      *(unsigned char *)&self->_interactionFlags |= 1u;
    }
  }
}

- (void)appendDescriptionToStream:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71___UIHomeAffordanceObserverProxyInteraction_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E52D9F98;
  void v6[4] = a3;
  v6[5] = self;
  [a3 appendProem:self block:v6];
  if ([a3 hasDebugStyle])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71___UIHomeAffordanceObserverProxyInteraction_appendDescriptionToStream___block_invoke_2;
    v5[3] = &unk_1E52D9F98;
    v5[4] = a3;
    v5[5] = self;
    [a3 appendBodySectionWithName:0 block:v5];
  }
}

- (id)succinctDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (NSString)debugDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] debugStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedFrameEvaluationDisplayLink, 0);
  objc_storeStrong((id *)&self->_homeAffordanceRegistrationToken, 0);
  objc_destroyWeak((id *)&self->_homeAffordanceNotifier);
  objc_destroyWeak((id *)&self->_window);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong(&self->_proxyDoubleTapGestureHandler, 0);
  objc_storeStrong(&self->_proxyIntersectedFrameHandler, 0);
}

@end