@interface _UIHomeAffordanceSceneNotifier
- (BOOL)_hasInvalidated;
- (CGRect)homeAffordanceSceneReferenceFrameForWindow:(id)a3;
- (NSMutableSet)_registeredObserverRecords;
- (NSString)debugDescription;
- (NSString)description;
- (UIScene)_scene;
- (_UIHomeAffordanceSceneNotifier)init;
- (_UIHomeAffordanceSceneNotifier)initWithScene:(id)a3;
- (_UISceneUIWindowHosting)windowHostingScene;
- (id)registerHomeAffordanceObserver:(id)a3 inWindow:(id)a4;
- (id)succinctDescription;
- (void)_evaluateExpectsViewServiceObservers;
- (void)_homeAffordanceLegacyViewServiceUpdateSource:(CGFloat)a3 frameDidChange:(CGFloat)a4;
- (void)_homeAffordanceLegacyViewServiceUpdateSource:(uint64_t)a3 doubleTapGestureDidSucceed:;
- (void)_homeAffordanceSceneUpdateSource:(CGFloat)a3 frameDidChange:(CGFloat)a4;
- (void)_homeAffordanceSceneUpdateSource:(uint64_t)a3 doubleTapGestureDidSucceed:;
- (void)_legacyViewServiceSessionDidAssociateWithWindow:(id)a3;
- (void)_legacyViewServiceSessionDidDisassociateFromWindow:(id)a3;
- (void)_legacyViewServiceSessionDidInvalidate:(id)a3;
- (void)_legacyViewServiceSessionWasCreated:(id)a3;
- (void)_reset;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
- (void)_unregisterHomeAffordanceObserverForRecord:(id)a3;
- (void)_viewServiceWindow:(void *)a3 didAssociateWithLegacyViewServiceSession:;
- (void)_viewServiceWindow:(void *)a3 didDisassociateFromLegacyViewServiceSession:;
- (void)appendDescriptionToStream:(id)a3;
- (void)cleanupForDetachingWindow:(id)a3;
- (void)dealloc;
@end

@implementation _UIHomeAffordanceSceneNotifier

- (_UIHomeAffordanceSceneNotifier)initWithScene:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)_UIHomeAffordanceSceneNotifier;
  v4 = [(_UIHomeAffordanceSceneNotifier *)&v29 init];
  if (v4)
  {
    v5 = *(id *)(__UILogGetCategoryCachedImpl("HomeAffordanceObservation", &initWithScene____s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSString;
      v7 = v4;
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = [v6 stringWithFormat:@"<%@: %p>", v9, v7];

      id v11 = v10;
      if (a3)
      {
        v12 = NSString;
        id v13 = a3;
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        v16 = [v12 stringWithFormat:@"<%@: %p>", v15, v13];
      }
      else
      {
        v16 = @"(nil)";
      }
      *(_DWORD *)buf = 138543618;
      id v31 = v11;
      __int16 v32 = 2114;
      v33 = v16;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Initializing: %{public}@; with scene: %{public}@",
        buf,
        0x16u);
    }
    objc_storeWeak((id *)&v4->_scene, a3);
    -[_UIHomeAffordanceSceneNotifier _evaluateExpectsViewServiceObservers]((uint64_t)v4);
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v4 selector:sel__legacyViewServiceSessionWasCreated_ name:@"_UIViewServiceSessionWasCreatedNotification" object:0];
    [v17 addObserver:v4 selector:sel__legacyViewServiceSessionDidInvalidate_ name:@"_UIViewServiceSessionDidInvalidateNotification" object:0];
    [v17 addObserver:v4 selector:sel__legacyViewServiceSessionDidAssociateWithWindow_ name:@"_UIViewServiceSessionDidAssociateNonPrimaryHostedWindowNotification" object:0];
    [v17 addObserver:v4 selector:sel__legacyViewServiceSessionDidDisassociateFromWindow_ name:@"_UIViewServiceSessionDidDisassociateNonPrimaryHostedWindowNotification" object:0];
    objc_initWeak((id *)buf, v4);
    v18 = (objc_class *)objc_opt_class();
    Name = class_getName(v18);
    v20 = NSString;
    id WeakRetained = objc_loadWeakRetained((id *)&v4->_scene);
    v22 = [WeakRetained _sceneIdentifier];
    v23 = [v20 stringWithFormat:@"UIKit - %s - %@", Name, v22];

    id v24 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v28, (id *)buf);
    uint64_t v25 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureToken = v4->_stateCaptureToken;
    v4->_stateCaptureToken = (BSInvalidatable *)v25;

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  return v4;
}

- (void)_setScene:(id)a3
{
}

- (void)_evaluateExpectsViewServiceObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([*(id *)(a1 + 48) count])
    {
      int v2 = 1;
    }
    else
    {
      v3 = +[_UIActiveViewServiceSessionTracker sharedTracker];
      int v2 = -[_UIActiveViewServiceSessionTracker hasTrackedSessions]((uint64_t)v3);
    }
    unsigned int v4 = *(unsigned __int8 *)(a1 + 8);
    if (v2 != ((v4 >> 1) & 1))
    {
      *(unsigned char *)(a1 + 8) = v4 & 0xFD | (2 * v2);
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_evaluateExpectsViewServiceObservers___s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v6 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
            v7 = @"YES";
          }
          else {
            v7 = @"NO";
          }
          v8 = v6;
          v9 = [(id)a1 succinctDescription];
          int v10 = 138412546;
          id v11 = v7;
          __int16 v12 = 2112;
          id v13 = v9;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Updated expecting legacy view service observers: %@; notifier: %@",
            (uint8_t *)&v10,
            0x16u);
        }
      }
    }
  }
}

- (id)registerHomeAffordanceObserver:(id)a3 inWindow:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v7 = [(_UIHomeAffordanceSceneNotifier *)self _scene];
  if (v7
    && (v8 = v7, char v9 = [v7 _hasInvalidated], v8, (v9 & 1) == 0)
    && _UIHomeAffordanceValidateObserver(self, a3, a4, (*(unsigned char *)&self->_flags & 2) != 0))
  {
    int v10 = [(NSMapTable *)self->_hostedWindowToLegacyViewServiceSessions objectForKey:a4];
    id v11 = -[_UIHomeAffordanceObservationRecord initWithObserver:window:viewServiceSessionIdentifier:]([_UIHomeAffordanceObservationRecord alloc], a3, a4, v10);
    registeredObserverRecords = self->_registeredObserverRecords;
    if (!registeredObserverRecords)
    {
      id v13 = (NSMutableSet *)objc_opt_new();
      uint64_t v14 = self->_registeredObserverRecords;
      self->_registeredObserverRecords = v13;

      registeredObserverRecords = self->_registeredObserverRecords;
    }
    [(NSMutableSet *)registeredObserverRecords addObject:v11];
    v15 = _UIHomeAffordanceRegistrationTokenForNotifierAndRecord(self, (uint64_t)v11);
    if (os_variant_has_internal_diagnostics())
    {
      v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("HomeAffordanceObservation", &registerHomeAffordanceObserver_inWindow____s_category)+ 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = [(_UIHomeAffordanceSceneNotifier *)self succinctDescription];
        int v20 = 138543618;
        id v21 = a3;
        __int16 v22 = 2114;
        v23 = v19;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "Registered home affordance observer: %{public}@; notifier: %{public}@",
          (uint8_t *)&v20,
          0x16u);
      }
    }
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (_UISceneUIWindowHosting)windowHostingScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (_UISceneUIWindowHosting *)WeakRetained;
}

- (CGRect)homeAffordanceSceneReferenceFrameForWindow:(id)a3
{
  if (a3)
  {
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      int v10 = -[NSMapTable objectForKey:](self->_hostedWindowToLegacyViewServiceSessions, "objectForKey:");
      if (v10)
      {
        id v11 = [(NSMapTable *)self->_legacyViewServiceSessionToHomeAffordanceSceneReferenceFrames objectForKey:v10];
        [v11 CGRectValue];
        CGFloat x = v12;
        CGFloat y = v13;
        CGFloat width = v14;
        CGFloat height = v15;
      }
      else
      {
        CGFloat x = self->_homeAffordanceSceneReferenceFrameForScene.origin.x;
        CGFloat y = self->_homeAffordanceSceneReferenceFrameForScene.origin.y;
        CGFloat width = self->_homeAffordanceSceneReferenceFrameForScene.size.width;
        CGFloat height = self->_homeAffordanceSceneReferenceFrameForScene.size.height;
      }
    }
    else
    {
      CGFloat x = self->_homeAffordanceSceneReferenceFrameForScene.origin.x;
      CGFloat y = self->_homeAffordanceSceneReferenceFrameForScene.origin.y;
      CGFloat width = self->_homeAffordanceSceneReferenceFrameForScene.size.width;
      CGFloat height = self->_homeAffordanceSceneReferenceFrameForScene.size.height;
    }
  }
  else
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIHomeAffordanceSceneNotifier.m" lineNumber:612 description:@"Invalid home affordance frame request with nil window"];

    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)_hasInvalidated
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_unregisterHomeAffordanceObserverForRecord:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = [(_UIHomeAffordanceSceneNotifier *)self _scene];
  if (v5)
  {
    v6 = v5;
    char v7 = [v5 _hasInvalidated];

    if ((v7 & 1) == 0)
    {
      [(NSMutableSet *)self->_registeredObserverRecords removeObject:a3];
      if (os_variant_has_internal_diagnostics())
      {
        v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_unregisterHomeAffordanceObserverForRecord____s_category)+ 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          char v9 = v8;
          int v10 = -[_UIHomeAffordanceObservationRecord observer]((id *)a3);
          id v11 = [(_UIHomeAffordanceSceneNotifier *)self succinctDescription];
          int v12 = 138543618;
          double v13 = v10;
          __int16 v14 = 2114;
          double v15 = v11;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Unregistered home affordance observer: %{public}@; notifier: %{public}@",
            (uint8_t *)&v12,
            0x16u);
        }
      }
    }
  }
}

- (NSString)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  unsigned int v4 = [MEMORY[0x1E4F4F728] debugStyle];
  v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = a3;
  v6[5] = self;
  [a3 appendProem:self block:v6];
  if ([a3 hasDebugStyle])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_2;
    v5[3] = &unk_1E52D9F98;
    v5[4] = a3;
    v5[5] = self;
    [a3 appendBodySectionWithName:0 block:v5];
  }
}

- (_UIHomeAffordanceSceneNotifier)init
{
  unsigned int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIHomeAffordanceSceneNotifier.m", 498, @"%s: init is not allowed on %@", "-[_UIHomeAffordanceSceneNotifier init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)_reset
{
  registeredObserverRecords = self->_registeredObserverRecords;
  self->_registeredObserverRecords = 0;

  -[_UIHomeAffordanceSceneNotifier _evaluateExpectsViewServiceObservers]((uint64_t)self);
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_homeAffordanceSceneReferenceFrameForScene.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_homeAffordanceSceneReferenceFrameForScene.size = v4;
  hostedWindowToLegacyViewServiceSessions = self->_hostedWindowToLegacyViewServiceSessions;
  self->_hostedWindowToLegacyViewServiceSessions = 0;

  legacyViewServiceSessionToHomeAffordanceSceneReferenceFrames = self->_legacyViewServiceSessionToHomeAffordanceSceneReferenceFrames;
  self->_legacyViewServiceSessionToHomeAffordanceSceneReferenceFrames = 0;
}

- (void)_sceneWillInvalidate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([a3 _hasInvalidated])
  {
    *(unsigned char *)&self->_flags |= 1u;
    v5 = *(id *)(__UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_sceneWillInvalidate____s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(_UIHomeAffordanceSceneNotifier *)self succinctDescription];
      if (a3)
      {
        char v7 = NSString;
        id v8 = a3;
        char v9 = (objc_class *)objc_opt_class();
        int v10 = NSStringFromClass(v9);
        id v11 = [v7 stringWithFormat:@"<%@: %p>", v10, v8];
      }
      else
      {
        id v11 = @"(nil)";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v6;
      __int16 v17 = 2114;
      double v18 = v11;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Resetting home affordance notifier: %{public}@; for invalidating scene: %{public}@",
        buf,
        0x16u);
    }
    [(_UIHomeAffordanceSceneNotifier *)self _reset];
    [(BSInvalidatable *)self->_stateCaptureToken invalidate];
    int v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v14[0] = @"_UIViewServiceSessionWasCreatedNotification";
    v14[1] = @"_UIViewServiceSessionDidInvalidateNotification";
    v14[2] = @"_UIViewServiceSessionDidAssociateNonPrimaryHostedWindowNotification";
    v14[3] = @"_UIViewServiceSessionDidDisassociateNonPrimaryHostedWindowNotification";
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
    -[NSNotificationCenter _uiRemoveObserver:names:](v12, self, v13);
  }
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIHomeAffordanceSceneNotifier;
  [(_UIHomeAffordanceSceneNotifier *)&v3 dealloc];
}

- (void)cleanupForDetachingWindow:(id)a3
{
}

- (void)_homeAffordanceSceneUpdateSource:(CGFloat)a3 frameDidChange:(CGFloat)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v12 = [(id)a1 _scene];
    if (v12)
    {
      double v13 = v12;
      char v14 = [v12 _hasInvalidated];

      if ((v14 & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        uint64_t v16 = [WeakRetained _FBSScene];
        __int16 v17 = [v16 _homeAffordanceClientSceneComponent];

        if (v17 == a2)
        {
          v29.origin.CGFloat x = a3;
          v29.origin.CGFloat y = a4;
          v29.size.CGFloat width = a5;
          v29.size.CGFloat height = a6;
          if (!CGRectEqualToRect(v29, *(CGRect *)(a1 + 72)))
          {
            unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_homeAffordanceSceneUpdateSource_frameDidChange____s_category);
            if (*(unsigned char *)CategoryCachedImpl)
            {
              int v20 = *(NSObject **)(CategoryCachedImpl + 8);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                id v21 = v20;
                v30.origin.CGFloat x = a3;
                v30.origin.CGFloat y = a4;
                v30.size.CGFloat width = a5;
                v30.size.CGFloat height = a6;
                __int16 v22 = NSStringFromCGRect(v30);
                v23 = [(id)a1 succinctDescription];
                *(_DWORD *)buf = 138543618;
                uint64_t v25 = v22;
                __int16 v26 = 2114;
                v27 = v23;
                _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Received home affordance frame change for scene: %{public}@; notifier: %{public}@",
                  buf,
                  0x16u);
              }
            }
            *(CGFloat *)(a1 + 72) = a3;
            *(CGFloat *)(a1 + 80) = a4;
            *(CGFloat *)(a1 + 88) = a5;
            *(CGFloat *)(a1 + 96) = a6;
            _UIHomeAffordanceNotifyObserversFrameDidChange((void *)a1, *(void **)(a1 + 40), 0, a3, a4, a5, a6);
          }
        }
        else
        {
          double v18 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__homeAffordanceSceneUpdateSource_frameDidChange_, a1, @"_UIHomeAffordanceSceneNotifier.m", 651, @"Unexpected frame update from other FrontBoard-based scene component: %@; notifier component: %@",
            a2,
            v17);
        }
      }
    }
  }
}

- (void)_homeAffordanceSceneUpdateSource:(uint64_t)a3 doubleTapGestureDidSucceed:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v6 = [a1 _scene];
    if (v6)
    {
      char v7 = v6;
      char v8 = [v6 _hasInvalidated];

      if ((v8 & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained(a1 + 4);
        int v10 = [WeakRetained _FBSScene];
        id v11 = [v10 _homeAffordanceClientSceneComponent];

        if (v11 == a2)
        {
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_homeAffordanceSceneUpdateSource_doubleTapGestureDidSucceed____s_category);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            char v14 = *(NSObject **)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              double v15 = v14;
              uint64_t v16 = [a1 succinctDescription];
              *(_DWORD *)buf = 67109378;
              int v18 = a3;
              __int16 v19 = 2114;
              int v20 = v16;
              _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Received doubleTapGestureDidSucceed for scene: %d; notifier: %{public}@",
                buf,
                0x12u);
            }
          }
          _UIHomeAffordanceNotifyObserversDoubleTapGestureDidSucceed(a1, a1[5], a3, 0);
        }
        else
        {
          int v12 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__homeAffordanceSceneUpdateSource_doubleTapGestureDidSucceed_, a1, @"_UIHomeAffordanceSceneNotifier.m", 673, @"Unexpected didSucceed update from other FrontBoard-based scene component: %@; notifier component: %@",
            a2,
            v11);
        }
      }
    }
  }
}

- (void)_viewServiceWindow:(void *)a3 didAssociateWithLegacyViewServiceSession:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2 && a3)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_viewServiceWindow_didAssociateWithLegacyViewServiceSession____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v39 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = NSString;
          id v41 = a2;
          v42 = v39;
          v43 = (objc_class *)objc_opt_class();
          v44 = NSStringFromClass(v43);
          v45 = [v40 stringWithFormat:@"<%@: %p>", v44, v41];

          id v46 = v45;
          v47 = [a1 succinctDescription];
          *(_DWORD *)buf = 138543874;
          v59 = v45;
          __int16 v60 = 2114;
          v61 = a3;
          __int16 v62 = 2114;
          v63 = v47;
          _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "Hosted window: %{public}@; did associate with legacy view service session: %{public}@; notifier: %{public}@",
            buf,
            0x20u);
        }
      }
      id v7 = a1[7];
      if (!v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:512];
        id v9 = a1[7];
        a1[7] = (id)v8;

        id v7 = a1[7];
      }
      id v50 = [v7 objectForKey:a2];
      int v10 = objc_msgSend(a1[8], "objectForKey:");
      id v11 = [a1[8] objectForKey:a3];
      v49 = v10;
      [v10 CGRectValue];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      [v11 CGRectValue];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      v66.origin.CGFloat x = v13;
      v66.origin.CGFloat y = v15;
      v66.size.CGFloat width = v17;
      v66.size.CGFloat height = v19;
      v67.origin.CGFloat x = v21;
      v67.origin.CGFloat y = v23;
      v67.size.CGFloat width = v25;
      v67.size.CGFloat height = v27;
      BOOL v48 = CGRectEqualToRect(v66, v67);
      [a1[7] setObject:a3 forKey:a2];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v28 = a1[5];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v54;
        do
        {
          uint64_t v32 = 0;
          do
          {
            if (*(void *)v54 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8 * v32);
            if (v33)
            {
              id WeakRetained = objc_loadWeakRetained((id *)(v33 + 16));
              if (WeakRetained == a2)
              {
                v35 = *(void **)(v33 + 24);

                if (v35 == a3) {
                  goto LABEL_17;
                }
                id v36 = a3;
                id WeakRetained = *(id *)(v33 + 24);
                *(void *)(v33 + 24) = v36;
              }
            }
            else
            {
              id WeakRetained = 0;
            }

LABEL_17:
            ++v32;
          }
          while (v30 != v32);
          uint64_t v37 = [v28 countByEnumeratingWithState:&v53 objects:v57 count:16];
          uint64_t v30 = v37;
        }
        while (v37);
      }

      if (!v48)
      {
        id v38 = a1[5];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __94___UIHomeAffordanceSceneNotifier__viewServiceWindow_didAssociateWithLegacyViewServiceSession___block_invoke;
        v52[3] = &unk_1E52DD0B0;
        v52[4] = a2;
        v52[5] = a3;
        _UIHomeAffordanceNotifyObserversFrameDidChange(a1, v38, (uint64_t)v52, v21, v23, v25, v27);
      }
    }
    else
    {
      id v51 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", sel__viewServiceWindow_didAssociateWithLegacyViewServiceSession_, a1, @"_UIHomeAffordanceSceneNotifier.m", 721, @"Invalid view service window transition: window: %@; newLegacyViewServiceSession: %@; notifier: %@",
        a2,
        a3,
        a1);
    }
  }
}

- (void)_viewServiceWindow:(void *)a3 didDisassociateFromLegacyViewServiceSession:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2 && a3)
    {
      id v6 = [a1[7] objectForKey:a2];
      id v7 = a3;
      uint64_t v8 = v7;
      if (v6 == v7)
      {
      }
      else
      {
        if (!v6)
        {

LABEL_23:
          return;
        }
        int v9 = [v6 isEqual:v7];

        if (!v9) {
          goto LABEL_23;
        }
      }
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_viewServiceWindow_didDisassociateFromLegacyViewServiceSession____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        double v24 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          double v25 = NSString;
          id v26 = a2;
          double v27 = v24;
          id v28 = (objc_class *)objc_opt_class();
          uint64_t v29 = NSStringFromClass(v28);
          uint64_t v30 = [v25 stringWithFormat:@"<%@: %p>", v29, v26];

          id v31 = v30;
          uint64_t v32 = [a1 succinctDescription];
          *(_DWORD *)buf = 138543874;
          id v41 = v30;
          __int16 v42 = 2114;
          v43 = v8;
          __int16 v44 = 2114;
          v45 = v32;
          _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Hosted window: %{public}@; did disassociate from legacy view service session: %{public}@; notifier: %{public}@",
            buf,
            0x20u);
        }
      }
      [a1[7] removeObjectForKey:a2];
      id v11 = [a1[8] objectForKey:v8];
      double v12 = *MEMORY[0x1E4F1DB28];
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      [v11 CGRectValue];
      v49.origin.CGFloat x = v12;
      v49.origin.CGFloat y = v13;
      v49.size.CGFloat width = v14;
      v49.size.CGFloat height = v15;
      BOOL v16 = CGRectEqualToRect(v48, v49);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __97___UIHomeAffordanceSceneNotifier__viewServiceWindow_didDisassociateFromLegacyViewServiceSession___block_invoke;
      aBlock[3] = &unk_1E52DD0B0;
      aBlock[4] = a2;
      aBlock[5] = v8;
      CGFloat v17 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
      if (!v16) {
        _UIHomeAffordanceNotifyObserversFrameDidChange(a1, a1[5], (uint64_t)v17, v12, v13, v14, v15);
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v18 = a1[5];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            if (v17[2](v17, v23)) {
              -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:](v23, 0);
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v20);
      }

      goto LABEL_23;
    }
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__viewServiceWindow_didDisassociateFromLegacyViewServiceSession_, a1, @"_UIHomeAffordanceSceneNotifier.m", 762, @"Invalid view service window transition: window: %@; oldLegacyViewServiceSession: %@; notifier: %@",
      a2,
      a3,
      a1);
  }
}

- (void)_legacyViewServiceSessionWasCreated:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  CGSize v4 = [a3 object];
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
  uint64_t v8 = v7;

  if (v8) {
    id WeakRetained = objc_loadWeakRetained(v8 + 9);
  }
  else {
    id WeakRetained = 0;
  }
  int v10 = [WeakRetained _windowHostingScene];

  if (v8)
  {
    if (v10)
    {
      id v11 = [(_UIHomeAffordanceSceneNotifier *)self windowHostingScene];

      if (v10 == v11)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_legacyViewServiceSessionWasCreated____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          double v24 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            double v25 = v24;
            id v26 = [(_UIHomeAffordanceSceneNotifier *)self succinctDescription];
            *(_DWORD *)buf = 138543618;
            id v33 = v8;
            __int16 v34 = 2114;
            long long v35 = v26;
            _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Legacy view service session was created in scene: %{public}@; notifier: %{public}@",
              buf,
              0x16u);
          }
        }
        trackedLegacyViewServiceSessions = self->_trackedLegacyViewServiceSessions;
        if (!trackedLegacyViewServiceSessions)
        {
          double v14 = (NSMutableArray *)objc_opt_new();
          double v15 = self->_trackedLegacyViewServiceSessions;
          self->_trackedLegacyViewServiceSessions = v14;

          trackedLegacyViewServiceSessions = self->_trackedLegacyViewServiceSessions;
        }
        id v16 = v8[7];
        [(NSMutableArray *)trackedLegacyViewServiceSessions addObject:v16];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        CGFloat v17 = objc_msgSend(v8[1], "copy", 0);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v28 != v20) {
                objc_enumerationMutation(v17);
              }
              double v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              id v23 = v8[7];
              -[_UIHomeAffordanceSceneNotifier _viewServiceWindow:didAssociateWithLegacyViewServiceSession:]((id *)&self->super.isa, v22, v23);
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v19);
        }
      }
    }
  }
  -[_UIHomeAffordanceSceneNotifier _evaluateExpectsViewServiceObservers]((uint64_t)self);
}

- (void)_legacyViewServiceSessionDidInvalidate:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  CGSize v4 = [a3 object];
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
  uint64_t v8 = v7;

  if (v8)
  {
    id v9 = v8[7];
    if ([(NSMutableArray *)self->_trackedLegacyViewServiceSessions containsObject:v9])
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_legacyViewServiceSessionDidInvalidate____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v21 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          double v22 = v21;
          id v23 = [(_UIHomeAffordanceSceneNotifier *)self succinctDescription];
          *(_DWORD *)buf = 138543618;
          id v31 = v8;
          __int16 v32 = 2114;
          id v33 = v23;
          _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Legacy view service session did invalidate: %{public}@; notifier: %{public}@",
            buf,
            0x16u);
        }
      }
      double v24 = v8;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = (void *)[(NSMapTable *)self->_hostedWindowToLegacyViewServiceSessions copy];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            id v17 = [(NSMapTable *)self->_hostedWindowToLegacyViewServiceSessions objectForKey:v16];
            id v18 = v9;
            uint64_t v19 = v18;
            if (v17 == v18)
            {

LABEL_20:
              -[_UIHomeAffordanceSceneNotifier _viewServiceWindow:didDisassociateFromLegacyViewServiceSession:]((void **)&self->super.isa, v16, v19);
              goto LABEL_22;
            }
            if (v9 && v17)
            {
              int v20 = [v17 isEqual:v18];

              if (v20) {
                goto LABEL_20;
              }
            }
            else
            {
            }
LABEL_22:
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
      }

      [(NSMapTable *)self->_legacyViewServiceSessionToHomeAffordanceSceneReferenceFrames removeObjectForKey:v9];
      [(NSMutableArray *)self->_trackedLegacyViewServiceSessions removeObject:v9];
      uint64_t v8 = v24;
    }
  }
  else
  {
    id v9 = 0;
  }
  -[_UIHomeAffordanceSceneNotifier _evaluateExpectsViewServiceObservers]((uint64_t)self);
}

- (void)_legacyViewServiceSessionDidAssociateWithWindow:(id)a3
{
  uint64_t v5 = [a3 object];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v19 = v8;

  id v9 = v19;
  if (v19)
  {
    trackedLegacyViewServiceSessions = self->_trackedLegacyViewServiceSessions;
    id v11 = v19[7];
    LODWORD(trackedLegacyViewServiceSessions) = [(NSMutableArray *)trackedLegacyViewServiceSessions containsObject:v11];

    id v9 = v19;
    if (trackedLegacyViewServiceSessions)
    {
      uint64_t v12 = [a3 userInfo];
      uint64_t v13 = [v12 objectForKey:@"_UIViewServiceSessionAssociatedNonPrimaryWindowKey"];
      uint64_t v14 = objc_opt_class();
      id v15 = v13;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
      }
      else
      {
        id v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        id v18 = v19[7];
        -[_UIHomeAffordanceSceneNotifier _viewServiceWindow:didAssociateWithLegacyViewServiceSession:]((id *)&self->super.isa, v17, v18);
      }
      id v9 = v19;
    }
  }
}

- (void)_legacyViewServiceSessionDidDisassociateFromWindow:(id)a3
{
  uint64_t v5 = [a3 object];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v19 = v8;

  id v9 = v19;
  if (v19)
  {
    trackedLegacyViewServiceSessions = self->_trackedLegacyViewServiceSessions;
    id v11 = v19[7];
    LODWORD(trackedLegacyViewServiceSessions) = [(NSMutableArray *)trackedLegacyViewServiceSessions containsObject:v11];

    id v9 = v19;
    if (trackedLegacyViewServiceSessions)
    {
      uint64_t v12 = [a3 userInfo];
      uint64_t v13 = [v12 objectForKey:@"_UIViewServiceSessionAssociatedNonPrimaryWindowKey"];
      uint64_t v14 = objc_opt_class();
      id v15 = v13;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
      }
      else
      {
        id v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        id v18 = v19[7];
        -[_UIHomeAffordanceSceneNotifier _viewServiceWindow:didDisassociateFromLegacyViewServiceSession:]((void **)&self->super.isa, v17, v18);
      }
      id v9 = v19;
    }
  }
}

- (void)_homeAffordanceLegacyViewServiceUpdateSource:(CGFloat)a3 frameDidChange:(CGFloat)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!*(void *)(a1 + 64))
    {
      uint64_t v12 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:512];
      uint64_t v13 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v12;
    }
    uint64_t v14 = [a2 _sessionIdentifier];
    id v15 = [*(id *)(a1 + 64) objectForKey:v14];
    id v16 = v15;
    if (v15)
    {
      [v15 CGRectValue];
      v43.origin.CGFloat x = v17;
      v43.origin.CGFloat y = v18;
      v43.size.CGFloat width = v19;
      v43.size.CGFloat height = v20;
      v41.origin.CGFloat x = a3;
      v41.origin.CGFloat y = a4;
      v41.size.CGFloat width = a5;
      v41.size.CGFloat height = a6;
      BOOL v21 = CGRectEqualToRect(v41, v43);
      double v22 = *(void **)(a1 + 64);
      id v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a3, a4, a5, a6);
      [v22 setObject:v23 forKey:v14];

      if (v21)
      {
LABEL_10:

        return;
      }
    }
    else
    {
      double v24 = *(void **)(a1 + 64);
      long long v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a3, a4, a5, a6);
      [v24 setObject:v25 forKey:v14];
    }
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_homeAffordanceLegacyViewServiceUpdateSource_frameDidChange____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      long long v28 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        long long v29 = v28;
        v42.origin.CGFloat x = a3;
        v42.origin.CGFloat y = a4;
        v42.size.CGFloat width = a5;
        v42.size.CGFloat height = a6;
        long long v30 = NSStringFromCGRect(v42);
        id v31 = [(id)a1 succinctDescription];
        *(_DWORD *)buf = 138543874;
        long long v35 = v14;
        __int16 v36 = 2112;
        long long v37 = v30;
        __int16 v38 = 2114;
        v39 = v31;
        _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Received home affordance frame change for legacy view service session: %{public}@; frame: %@; notifier: %{public}@",
          buf,
          0x20u);
      }
    }
    long long v27 = *(void **)(a1 + 40);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __94___UIHomeAffordanceSceneNotifier__homeAffordanceLegacyViewServiceUpdateSource_frameDidChange___block_invoke;
    v32[3] = &unk_1E52DD0D8;
    id v33 = v14;
    _UIHomeAffordanceNotifyObserversFrameDidChange((void *)a1, v27, (uint64_t)v32, a3, a4, a5, a6);

    goto LABEL_10;
  }
}

- (void)_homeAffordanceLegacyViewServiceUpdateSource:(uint64_t)a3 doubleTapGestureDidSucceed:
{
  if (a1)
  {
    uint64_t v5 = [a2 _sessionIdentifier];
    uint64_t v6 = (void *)a1[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __106___UIHomeAffordanceSceneNotifier__homeAffordanceLegacyViewServiceUpdateSource_doubleTapGestureDidSucceed___block_invoke;
    v8[3] = &unk_1E52DD0D8;
    id v9 = v5;
    id v7 = v5;
    _UIHomeAffordanceNotifyObserversDoubleTapGestureDidSucceed(a1, v6, a3, (uint64_t)v8);
  }
}

- (id)succinctDescription
{
  objc_super v3 = (void *)MEMORY[0x1E4F4F720];
  CGSize v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (NSMutableSet)_registeredObserverRecords
{
  return self->_registeredObserverRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyViewServiceSessionToHomeAffordanceSceneReferenceFrames, 0);
  objc_storeStrong((id *)&self->_hostedWindowToLegacyViewServiceSessions, 0);
  objc_storeStrong((id *)&self->_trackedLegacyViewServiceSessions, 0);
  objc_storeStrong((id *)&self->_registeredObserverRecords, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
}

@end