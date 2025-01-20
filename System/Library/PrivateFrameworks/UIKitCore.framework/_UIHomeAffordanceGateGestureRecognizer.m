@interface _UIHomeAffordanceGateGestureRecognizer
+ (uint64_t)isAvailable;
- (BOOL)_isAllowedToReceiveGESEvents;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)tapIsPossibleForTapRecognizer:(id)a3;
- (_UIHomeAffordanceGateGestureRecognizer)init;
- (double)_touchSloppinessFactor;
- (id)name;
- (void)_notifier:(id)a3 homeAffordanceDoubleTapGestureDidSucceed:(BOOL)a4;
- (void)_notifier:(id)a3 homeAffordanceFrameDidChange:(CGRect)a4;
- (void)_windowDidMoveToNilScene:(id)a3;
- (void)_windowDidMoveToScene:(id)a3;
- (void)reset;
- (void)setState:(int64_t)a3;
- (void)setView:(id)a3;
- (void)tapRecognizerFailedToRecognizeTap:(id)a3;
- (void)tapRecognizerRecognizedTap:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIHomeAffordanceGateGestureRecognizer

- (BOOL)_isAllowedToReceiveGESEvents
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_didReceiveTouch
    || [a3 count] != 1
    || ([a3 anyObject],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 _locationInSceneReferenceSpace],
        v37.x = v8,
        v37.y = v9,
        BOOL v10 = CGRectContainsPoint(self->_homeAffordanceFrame, v37),
        v7,
        !v10))
  {
    v15 = objc_msgSend(a3, "anyObject", a3, a4);
    [v15 _locationInSceneReferenceSpace];
    v38.x = v16;
    v38.y = v17;
    BOOL v18 = CGRectContainsPoint(self->_homeAffordanceFrame, v38);

    if (v18)
    {
      if (self->_didReceiveTouch)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceGestureGate", &qword_1EB25CEE0);
        if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
          goto LABEL_14;
        }
        v20 = *(NSObject **)(CategoryCachedImpl + 8);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 134217984;
        v33 = self;
        v21 = "<%p> home affordance gate received the second touch";
      }
      else
      {
        if ((unint64_t)[a3 count] < 2) {
          goto LABEL_14;
        }
        unint64_t v23 = __UILogGetCategoryCachedImpl("HomeAffordanceGestureGate", &qword_1EB25CEE8);
        if ((*(unsigned char *)v23 & 1) == 0) {
          goto LABEL_14;
        }
        v20 = *(NSObject **)(v23 + 8);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 134217984;
        v33 = self;
        v21 = "<%p> home affordance gate received too many simultaneous touches";
      }
    }
    else
    {
      unint64_t v22 = __UILogGetCategoryCachedImpl("HomeAffordanceGestureGate", &qword_1EB25CED8);
      if ((*(unsigned char *)v22 & 1) == 0) {
        goto LABEL_14;
      }
      v20 = *(NSObject **)(v22 + 8);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 134217984;
      v33 = self;
      v21 = "<%p> home affordance gate received touch outside of target region";
    }
    _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
LABEL_14:
    [(_UIHomeAffordanceGateGestureRecognizer *)self setState:5];
    return;
  }
  unint64_t v11 = __UILogGetCategoryCachedImpl("HomeAffordanceGestureGate", &_MergedGlobals_3_17);
  if (*(unsigned char *)v11)
  {
    v24 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)MEMORY[0x1E4F29238];
      v26 = v24;
      v27 = [a3 anyObject];
      [v27 _locationInSceneReferenceSpace];
      v31[0] = v28;
      v31[1] = v29;
      v30 = [v25 valueWithBytes:v31 objCType:"{CGPoint=dd}"];
      *(_DWORD *)buf = 134218242;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v30;
      _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "<%p> home affordance gate received the first touch in region: %@", buf, 0x16u);
    }
  }
  self->_didReceiveTouch = 1;
  tapRecognizer = self->_tapRecognizer;
  if (!tapRecognizer)
  {
    v13 = (UITapRecognizer *)objc_opt_new();
    v14 = self->_tapRecognizer;
    self->_tapRecognizer = v13;

    [(UITapRecognizer *)self->_tapRecognizer setDelegate:self];
    tapRecognizer = self->_tapRecognizer;
  }
  [(UITapRecognizer *)tapRecognizer touchesBegan:a3 withEvent:a4];
}

- (void)setState:(int64_t)a3
{
  if ((unint64_t)a3 > 5 || ((1 << a3) & 0x29) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIHomeAffordanceGateGestureRecognizer.m", 62, @"Invalid parameter not satisfying: %@", @"state == UIGestureRecognizerStatePossible || state == UIGestureRecognizerStateEnded || state == UIGestureRecognizerStateFailed" object file lineNumber description];
  }
  [(BSAbsoluteMachTimer *)self->_timeoutTimer cancel];
  v7.receiver = self;
  v7.super_class = (Class)_UIHomeAffordanceGateGestureRecognizer;
  [(UIGestureRecognizer *)&v7 setState:a3];
}

- (void)reset
{
  [(UITapRecognizer *)self->_tapRecognizer _reset];
  self->_didReceiveTouch = 0;
  [(BSAbsoluteMachTimer *)self->_timeoutTimer invalidate];
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;
}

- (id)name
{
  return @"com.apple.UIKit.HomeAffordanceGate";
}

+ (uint64_t)isAvailable
{
  self;
  uint64_t result = _UIDeviceSupportsGlobalEdgeSwipeTouches();
  if (result)
  {
    return _UIApplicationSupportsHomeAffordanceObservation();
  }
  return result;
}

- (_UIHomeAffordanceGateGestureRecognizer)init
{
  self;
  if (!_UIDeviceSupportsGlobalEdgeSwipeTouches()
    || (_UIApplicationSupportsHomeAffordanceObservation() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UIHomeAffordanceGateGestureRecognizer.m" lineNumber:43 description:@"Home affordance gate feature is disabled."];
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIHomeAffordanceGateGestureRecognizer;
  return [(UIGestureRecognizer *)&v6 initWithTarget:0 action:0];
}

- (void)_windowDidMoveToScene:(id)a3
{
  id v22 = [a3 object];
  id v5 = [(UIGestureRecognizer *)self view];

  objc_super v6 = v22;
  if (v22 != v5)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = v22;
    if (v12)
    {
      v13 = NSString;
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      CGFloat v16 = [v13 stringWithFormat:@"<%@: %p>", v15, v12];
    }
    else
    {
      CGFloat v16 = @"(nil)";
    }

    CGFloat v17 = [v12 windowScene];
    if (v17)
    {
      BOOL v18 = NSString;
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = [v18 stringWithFormat:@"<%@: %p>", v20, v17];
    }
    else
    {
      v21 = @"(nil)";
    }
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIHomeAffordanceGateGestureRecognizer.m", 197, @"Window scene notification is out of sync with home affordance gate: %@; window; %@; windowScene: %@;",
      self,
      v16,
      v21);

    objc_super v6 = v22;
  }
  objc_super v7 = [v6 windowScene];
  CGFloat v8 = [v7 _homeAffordanceSceneNotifier];
  CGFloat v9 = [v8 registerHomeAffordanceObserver:self inWindow:v22];
  homeAffordanceObserver = self->_homeAffordanceObserver;
  self->_homeAffordanceObserver = v9;
}

- (void)setView:(id)a3
{
  id v5 = [(UIGestureRecognizer *)self view];
  v15.receiver = self;
  v15.super_class = (Class)_UIHomeAffordanceGateGestureRecognizer;
  [(UIGestureRecognizer *)&v15 setView:a3];
  castToWindow(a3);
  objc_claimAutoreleasedReturnValue();
  castToWindow(v5);
  objc_claimAutoreleasedReturnValue();
  if (self)
  {
    objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:0x1ED1601E0 object:v5];

    objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:@"_UIWindowWillMoveToNilSceneNotification" object:v5];

    homeAffordanceObserver = self->_homeAffordanceObserver;
    self->_homeAffordanceObserver = 0;

    if (a3)
    {
      CGFloat v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel__windowDidMoveToScene_ name:0x1ED1601E0 object:a3];

      BOOL v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel__windowDidMoveToNilScene_ name:@"_UIWindowWillMoveToNilSceneNotification" object:a3];

      unint64_t v11 = [a3 windowScene];
      id v12 = [v11 _homeAffordanceSceneNotifier];
      v13 = [v12 registerHomeAffordanceObserver:self inWindow:a3];
      v14 = self->_homeAffordanceObserver;
      self->_homeAffordanceObserver = v13;
    }
  }
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (double)_touchSloppinessFactor
{
  v2 = [(UIGestureRecognizer *)self view];
  [v2 _touchSloppinessFactor];
  double v4 = v3;

  return v4;
}

- (BOOL)tapIsPossibleForTapRecognizer:(id)a3
{
  return 1;
}

- (void)tapRecognizerFailedToRecognizeTap:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceGestureGate", &tapRecognizerFailedToRecognizeTap____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v5 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134217984;
      objc_super v7 = self;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "<%p> Home affordance gate failed to recognize tap.", (uint8_t *)&v6, 0xCu);
    }
  }
  [(_UIHomeAffordanceGateGestureRecognizer *)self setState:5];
}

- (void)tapRecognizerRecognizedTap:(id)a3
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  timeoutTimer = self->_timeoutTimer;
  if (has_internal_diagnostics)
  {
    if (timeoutTimer)
    {
      unint64_t v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "The timer must not run at this point", (uint8_t *)location, 2u);
      }
    }
  }
  else if (timeoutTimer)
  {
    id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &tapRecognizerRecognizedTap____s_category) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "The timer must not run at this point", (uint8_t *)location, 2u);
    }
  }
  int v6 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"com.apple.UIKit.HomeAffordanceGateTimer"];
  objc_super v7 = self->_timeoutTimer;
  self->_timeoutTimer = v6;

  objc_initWeak(location, self);
  uint64_t v8 = self->_timeoutTimer;
  uint64_t v9 = MEMORY[0x1E4F14428];
  id v10 = MEMORY[0x1E4F14428];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69___UIHomeAffordanceGateGestureRecognizer_tapRecognizerRecognizedTap___block_invoke;
  v13[3] = &unk_1E52F3060;
  objc_copyWeak(&v14, location);
  [(BSAbsoluteMachTimer *)v8 scheduleWithFireInterval:v9 leewayInterval:v13 queue:0.5 handler:0.0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(location);
}

- (void)_notifier:(id)a3 homeAffordanceFrameDidChange:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceGestureGate", &_notifier_homeAffordanceFrameDidChange____s_category_0);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v10 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unint64_t v11 = (void *)MEMORY[0x1E4F29238];
      *(CGFloat *)id v14 = x;
      *(CGFloat *)&v14[1] = y;
      *(CGFloat *)&v14[2] = width;
      *(CGFloat *)&v14[3] = height;
      id v12 = v10;
      v13 = [v11 valueWithBytes:v14 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      *(_DWORD *)buf = 134218242;
      CGFloat v16 = self;
      __int16 v17 = 2112;
      BOOL v18 = v13;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "<%p> Home affordance frame updated: %@", buf, 0x16u);
    }
  }
  self->_homeAffordanceFrame.origin.CGFloat x = x;
  self->_homeAffordanceFrame.origin.CGFloat y = y;
  self->_homeAffordanceFrame.size.CGFloat width = width;
  self->_homeAffordanceFrame.size.CGFloat height = height;
}

- (void)_notifier:(id)a3 homeAffordanceDoubleTapGestureDidSucceed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceGestureGate", &_notifier_homeAffordanceDoubleTapGestureDidSucceed____s_category_0);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v8 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = NSNumber;
      id v10 = v8;
      unint64_t v11 = [v9 numberWithBool:v4];
      int v12 = 134218242;
      v13 = self;
      __int16 v14 = 2112;
      objc_super v15 = v11;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "<%p> Home affordance double tap did succeed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  if (v4) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 5;
  }
  [(_UIHomeAffordanceGateGestureRecognizer *)self setState:v7];
}

- (void)_windowDidMoveToNilScene:(id)a3
{
  homeAffordanceObserver = self->_homeAffordanceObserver;
  self->_homeAffordanceObserver = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceObserver, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end