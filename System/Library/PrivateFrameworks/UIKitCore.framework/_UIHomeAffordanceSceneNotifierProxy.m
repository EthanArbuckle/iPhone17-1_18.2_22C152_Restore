@interface _UIHomeAffordanceSceneNotifierProxy
- (BOOL)_hasInvalidated;
- (CGRect)homeAffordanceSceneReferenceFrameForWindow:(id)a3;
- (NSMutableSet)_registeredObserverRecords;
- (NSString)debugDescription;
- (NSString)description;
- (UIScene)_scene;
- (_UIHomeAffordanceSceneNotifierProxy)init;
- (_UIHomeAffordanceSceneNotifierProxy)initWithScene:(id)a3;
- (_UISceneUIWindowHosting)windowHostingScene;
- (id)registerHomeAffordanceObserver:(id)a3 inWindow:(id)a4;
- (id)succinctDescription;
- (void)_notifier:(id)a3 homeAffordanceDoubleTapGestureDidSucceed:(BOOL)a4;
- (void)_notifier:(id)a3 homeAffordanceFrameDidChange:(CGRect)a4;
- (void)_reset;
- (void)_resetTargetNotifierSceneState;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
- (void)_targetNotifierSceneDidDisconnect:(id)a3;
- (void)_targetNotifierSceneDidMoveToScreen:(id)a3;
- (void)_unregisterHomeAffordanceObserverForRecord:(id)a3;
- (void)_updateTargetNotifierRegistrationWithNotifier:(char)a3 forMovingScreens:;
- (void)_windowDidBecomeAppKeyNotification:(id)a3;
- (void)_windowDidResignAppKeyNotification:(id)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
- (void)setTargetHomeAffordanceNotifier:(void *)a1;
@end

@implementation _UIHomeAffordanceSceneNotifierProxy

- (void)_windowDidResignAppKeyNotification:(id)a3
{
  v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  BOOL ShouldUpdateTargetForKeyWindow = _UIHomeAffordanceNotifierShouldUpdateTargetForKeyWindow(self, v8);
  if (ShouldUpdateTargetForKeyWindow)
  {
    -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, 0, 0);
  }
}

- (void)_windowDidBecomeAppKeyNotification:(id)a3
{
  v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v10 = v7;

  if (_UIHomeAffordanceNotifierShouldUpdateTargetForKeyWindow(self, v10))
  {
    id v8 = [v10 _windowHostingScene];
    v9 = [v8 _homeAffordanceSceneNotifier];
    -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, v9, 0);
  }
}

- (void)_updateTargetNotifierRegistrationWithNotifier:(char)a3 forMovingScreens:
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v89 = (id *)(a1 + 48);
  id v6 = *(id *)(a1 + 48);
  v90 = a2;
  id v7 = a2;
  char v91 = [v6 _hasInvalidated];
  id v8 = [(id)a1 windowHostingScene];
  v9 = [v6 windowHostingScene];
  id v10 = [v7 windowHostingScene];
  v93 = v8;
  v96 = [v8 _screen];
  v94 = v9;
  v97 = [v9 _screen];
  v95 = v10;
  v98 = [v10 _screen];
  [(id)a1 _registeredObserverRecords];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v99 objects:buf count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v100;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v100 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v99 + 1) + 8 * v15);
        if (v16) {
          id WeakRetained = objc_loadWeakRetained((id *)(v16 + 8));
        }
        else {
          id WeakRetained = 0;
        }

        if (WeakRetained == v7)
        {

          v36 = [MEMORY[0x1E4F28B00] currentHandler];
          v37 = [(id)a1 succinctDescription];
          v38 = [v7 succinctDescription];
          objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateTargetNotifierRegistrationWithNotifier_forMovingScreens_, a1, @"_UIHomeAffordanceSceneNotifier.m", 1157, @"Invalid target home affordance notifier. The target notifier is an observer of this notifier: self: %@; target: %@",
            v37,
            v38);

          v39 = v93;
          goto LABEL_84;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v18 = [v11 countByEnumeratingWithState:&v99 objects:buf count:16];
      uint64_t v13 = v18;
    }
    while (v18);
  }

  v19 = v96;
  if (v6) {
    BOOL v20 = v97 == v96;
  }
  else {
    BOOL v20 = 1;
  }
  int v21 = !v20;
  if ((a3 & 1) == 0 && v98 && v98 != v96)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v22 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_31;
      }
      loga = v22;
      int v88 = v21;
      v72 = [v7 succinctDescription];
      v73 = NSString;
      id v74 = v98;
      v75 = (objc_class *)objc_opt_class();
      v76 = NSStringFromClass(v75);
      v77 = [v73 stringWithFormat:@"<%@: %p>", v76, v74];

      id v78 = v77;
      v79 = [(id)a1 succinctDescription];
      id v80 = v96;
      if (v80)
      {
        v82 = NSString;
        v83 = (objc_class *)objc_opt_class();
        v84 = NSStringFromClass(v83);
        v81 = [v82 stringWithFormat:@"<%@: %p>", v84, v80];
      }
      else
      {
        v81 = @"(nil)";
      }

      *(_DWORD *)buf = 138413058;
      v104 = v72;
      __int16 v105 = 2112;
      uint64_t v106 = (uint64_t)v78;
      __int16 v107 = 2112;
      id v108 = v79;
      __int16 v109 = 2112;
      *(void *)v110 = v81;
      v22 = loga;
      _os_log_fault_impl(&dword_1853B0000, loga, OS_LOG_TYPE_FAULT, "Unregistering proxy from target home affordance notifier as they are not on the same screen, which is unsupported: target: %@; target screen: %@; self: %@; self screen: %@",
        buf,
        0x2Au);

      v19 = v96;
    }
    else
    {
      v22 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_945) + 8);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

        goto LABEL_32;
      }
      log = v22;
      int v88 = v21;
      v85 = [v7 succinctDescription];
      v23 = NSString;
      id v24 = v98;
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      v27 = [v23 stringWithFormat:@"<%@: %p>", v26, v24];

      id v28 = v27;
      v29 = [(id)a1 succinctDescription];
      id v30 = v96;
      if (v30)
      {
        v31 = NSString;
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v34 = v33 = v29;
        v35 = [v31 stringWithFormat:@"<%@: %p>", v34, v30];

        v29 = v33;
      }
      else
      {
        v35 = @"(nil)";
      }

      *(_DWORD *)buf = 138413058;
      v22 = log;
      v104 = v85;
      __int16 v105 = 2112;
      uint64_t v106 = (uint64_t)v28;
      __int16 v107 = 2112;
      id v108 = v29;
      __int16 v109 = 2112;
      *(void *)v110 = v35;
      _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "Unregistering proxy from target home affordance notifier as they are not on the same screen, which is unsupported: target: %@; target screen: %@; self: %@; self screen: %@",
        buf,
        0x2Au);
    }
    int v21 = v88;
    goto LABEL_31;
  }
LABEL_32:
  if (v7) {
    BOOL v40 = v6 == v7;
  }
  else {
    BOOL v40 = 1;
  }
  int v41 = !v40;
  if (v6) {
    char v42 = v91;
  }
  else {
    char v42 = 0;
  }
  if (v42)
  {
    int v43 = 1;
  }
  else
  {
    if (v6) {
      BOOL v44 = v7 == 0;
    }
    else {
      BOOL v44 = 0;
    }
    int v43 = v44;
  }
  v39 = v93;
  if ([*(id *)(a1 + 32) count])
  {
    if (v6 && v97 == v19)
    {
      int v45 = *(void *)(a1 + 40) ? 1 : v43;
      if (v45 != 1)
      {
        int v48 = 0;
        int v47 = 1;
        goto LABEL_71;
      }
    }
    if (v98) {
      int v46 = v41;
    }
    else {
      int v46 = 0;
    }
    if (v98 == v19) {
      int v47 = v46;
    }
    else {
      int v47 = 0;
    }
  }
  else
  {
    int v47 = 0;
  }
  if ((v47 | v43)) {
    goto LABEL_69;
  }
  if (!*(void *)(a1 + 40))
  {
    int v47 = 0;
LABEL_69:
    int v48 = 0;
    goto LABEL_71;
  }
  int v47 = 0;
  if ([*(id *)(a1 + 32) count]) {
    int v48 = v41 | v21;
  }
  else {
    int v48 = 1;
  }
LABEL_71:
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &qword_1EB25F030);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v68 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v69 = v68;
      v92 = [(id)a1 succinctDescription];
      uint64_t v70 = [v6 succinctDescription];
      *(_DWORD *)buf = 138544898;
      v104 = v92;
      __int16 v105 = 2114;
      uint64_t v106 = v70;
      v71 = (void *)v70;
      __int16 v107 = 2114;
      id v108 = v7;
      __int16 v109 = 1024;
      *(_DWORD *)v110 = v41;
      *(_WORD *)&v110[4] = 1024;
      *(_DWORD *)&v110[6] = v47;
      __int16 v111 = 1024;
      int v112 = v48;
      __int16 v113 = 1024;
      int v114 = v43;
      _os_log_impl(&dword_1853B0000, v69, OS_LOG_TYPE_ERROR, "Update target notifier registration requested for notifier: %{public}@; _targetHomeAffordanceNotifier: %{public}"
        "@; targetHomeAffordanceNotifier: %{public}@; shouldUpdateToNewTarget: %d; shouldRegister: %d; shouldUnregister: "
        "%d; shouldCleanUpOldTargetAndRegistration %d",
        buf,
        0x38u);
    }
  }
  if ((v41 | v47 | v48 | v43) == 1)
  {
    if (v41)
    {
      -[_UIHomeAffordanceSceneNotifierProxy _resetTargetNotifierSceneState](a1);
      objc_storeStrong(v89, v90);
      v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v50 addObserver:a1 selector:sel__targetNotifierSceneDidMoveToScreen_ name:@"_UIWindowHostingSceneDidMoveToScreenNotification" object:v95];
      [v50 addObserver:a1 selector:sel__targetNotifierSceneDidDisconnect_ name:@"UISceneDidDisconnectNotification" object:v95];
    }
    v51 = (_OWORD *)MEMORY[0x1E4F1DB28];
    if (v47)
    {
      v52 = [v93 _allWindows];
      v53 = [v52 firstObject];

      uint64_t v54 = [*(id *)(a1 + 48) registerHomeAffordanceObserver:a1 inWindow:v53];
      v55 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v54;

      [*(id *)(a1 + 48) homeAffordanceSceneReferenceFrameForWindow:v53];
      double v57 = v56;
      double v59 = v58;
      double v61 = v60;
      double v63 = v62;
    }
    else
    {
      double v57 = *MEMORY[0x1E4F1DB28];
      double v59 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v61 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v63 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    if ([*(id *)(a1 + 32) count]) {
      objc_msgSend((id)a1, "_notifier:homeAffordanceFrameDidChange:", *(void *)(a1 + 48), v57, v59, v61, v63);
    }
    if (v48)
    {
      [*(id *)(a1 + 40) _invalidate];
      v64 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      long long v65 = v51[1];
      *(_OWORD *)(a1 + 56) = *v51;
      *(_OWORD *)(a1 + 72) = v65;
    }
    if (v43)
    {
      [*(id *)(a1 + 40) _invalidate];
      v66 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      long long v67 = v51[1];
      *(_OWORD *)(a1 + 56) = *v51;
      *(_OWORD *)(a1 + 72) = v67;
      -[_UIHomeAffordanceSceneNotifierProxy _resetTargetNotifierSceneState](a1);
    }
  }
LABEL_84:
}

- (_UISceneUIWindowHosting)windowHostingScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (_UISceneUIWindowHosting *)WeakRetained;
}

- (void)_resetTargetNotifierSceneState
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    v3 = [v2 windowHostingScene];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:a1 name:@"_UIWindowHostingSceneDidMoveToScreenNotification" object:v3];
    [v4 removeObserver:a1 name:@"UISceneDidDisconnectNotification" object:v3];

    v2 = *(void **)(a1 + 48);
  }
  *(void *)(a1 + 48) = 0;
}

- (NSMutableSet)_registeredObserverRecords
{
  return self->_registeredObserverRecords;
}

- (void)_notifier:(id)a3 homeAffordanceFrameDidChange:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v10 = [(_UIHomeAffordanceSceneNotifierProxy *)self _scene];
  if (v10)
  {
    id v11 = v10;
    char v12 = [v10 _hasInvalidated];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = self->_targetHomeAffordanceNotifier;
      if (v13)
      {
        double v14 = *MEMORY[0x1E4F1DB28];
        CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        v100.origin.double x = x;
        v100.origin.double y = y;
        v100.size.double width = width;
        v100.size.double height = height;
        v107.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
        v107.origin.double y = v15;
        v107.size.double width = v16;
        v107.size.double height = v17;
        if (CGRectEqualToRect(v100, v107))
        {
          double v18 = height;
          double v19 = width;
          double v20 = y;
          double v21 = x;
        }
        else
        {
          CGFloat v87 = v17;
          CGFloat v88 = v16;
          CGFloat v89 = v15;
          double v90 = v14;
          v26 = [(_UIHomeAffordanceNotifying *)v13 windowHostingScene];
          v27 = [(_UIHomeAffordanceSceneNotifierProxy *)self windowHostingScene];
          id v28 = [v26 _screen];
          v29 = [v27 _screen];
          if (v28 == v29)
          {
            [v26 _referenceBounds];
            double v31 = v30;
            double v33 = v32;
            [v27 _referenceBounds];
            double v85 = v34;
            double v86 = v35;
            v36 = [v26 _coordinateSpace];
            v37 = [v27 _coordinateSpace];
            uint64_t v38 = [v26 _interfaceOrientation];
            uint64_t v84 = [v27 _interfaceOrientation];
            double v39 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(v38, x, y, width, height, v31, v33);
            double v41 = v40;
            double v43 = v42;
            double v45 = v44;
            int v46 = [v26 _screen];
            int v47 = [v46 fixedCoordinateSpace];
            objc_msgSend(v36, "convertRect:toCoordinateSpace:", v47, v39, v41, v43, v45);
            double v49 = v48;
            double v51 = v50;
            double v53 = v52;
            double v55 = v54;

            double v56 = [v28 fixedCoordinateSpace];
            objc_msgSend(v37, "convertRect:fromCoordinateSpace:", v56, v49, v51, v53, v55);
            CGFloat v58 = v57;
            CGFloat v60 = v59;
            CGFloat v62 = v61;
            CGFloat v64 = v63;

            [v37 bounds];
            v108.origin.double x = v65;
            v108.origin.double y = v66;
            v108.size.double width = v67;
            v108.size.double height = v68;
            v101.origin.double x = v58;
            v101.origin.double y = v60;
            v101.size.double width = v62;
            v101.size.double height = v64;
            CGRect v102 = CGRectIntersection(v101, v108);
            double v21 = v102.origin.x;
            double v20 = v102.origin.y;
            double v19 = v102.size.width;
            double v18 = v102.size.height;
            BOOL IsNull = CGRectIsNull(v102);
            CGFloat v71 = v87;
            CGFloat v70 = v88;
            if (IsNull)
            {
              double v18 = v87;
              double v19 = v88;
            }
            CGFloat v73 = v89;
            double v72 = v90;
            if (IsNull)
            {
              double v20 = v89;
              double v21 = v90;
            }
            v103.origin.double x = v21;
            v103.origin.double y = v20;
            v103.size.double width = v19;
            v103.size.double height = v18;
            if (!CGRectEqualToRect(v103, *(CGRect *)(&v70 - 2)))
            {
              double v21 = _UIWindowConvertRectFromSceneSpaceToSceneReferenceSpace(v84, v21, v20, v19, v18, v85, v86);
              double v20 = v74;
              double v19 = v75;
              double v18 = v76;
            }
          }
          else
          {
            v36 = [MEMORY[0x1E4F28B00] currentHandler];
            v37 = objc_msgSend(NSString, "stringWithUTF8String:", "CGRect _UIHomeAffordanceConvertSceneReferenceFrameFromSceneToScene(CGRect, UIScene<_UISceneUIWindowHosting> * _Nonnull const __strong, UIScene<_UISceneUIWindowHosting> * _Nonnull const __strong)");
            objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, @"_UIHomeAffordanceSceneNotifier.m", 314, @"Invalid conversion attempt between scenes on different screens: fromScene: %@; toScene: %@",
              v26,
              v27);
            double v18 = v17;
            double v19 = v88;
            double v20 = v15;
            double v21 = v90;
          }
        }
        v104.origin.double x = v21;
        v104.origin.double y = v20;
        v104.size.double width = v19;
        v104.size.double height = v18;
        if (!CGRectEqualToRect(v104, self->_lastReceivedHomeAffordanceSceneReferenceFrame))
        {
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_notifier_homeAffordanceFrameDidChange____s_category);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            id v78 = *(NSObject **)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              v79 = v78;
              v105.origin.double x = x;
              v105.origin.double y = y;
              v105.size.double width = width;
              v105.size.double height = height;
              id v80 = NSStringFromCGRect(v105);
              v106.origin.double x = v21;
              v106.origin.double y = v20;
              v106.size.double width = v19;
              v106.size.double height = v18;
              v81 = NSStringFromCGRect(v106);
              v82 = [(_UIHomeAffordanceNotifying *)v13 succinctDescription];
              v83 = [(_UIHomeAffordanceSceneNotifierProxy *)self succinctDescription];
              *(_DWORD *)buf = 138544130;
              v92 = v80;
              __int16 v93 = 2114;
              v94 = v81;
              __int16 v95 = 2114;
              v96 = v82;
              __int16 v97 = 2114;
              v98 = v83;
              _os_log_impl(&dword_1853B0000, v79, OS_LOG_TYPE_ERROR, "Received proxy home affordance frame update from target notifier: %{public}@; converted frame: %{public}"
                "@; target notifier: %{public}@; proxy: %{public}@",
                buf,
                0x2Au);
            }
          }
          self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin.double x = v21;
          self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin.double y = v20;
          self->_lastReceivedHomeAffordanceSceneReferenceFrame.size.double width = v19;
          self->_lastReceivedHomeAffordanceSceneReferenceFrame.size.double height = v18;
          _UIHomeAffordanceNotifyObserversFrameDidChange(self, self->_registeredObserverRecords, 0, v21, v20, v19, v18);
        }
      }
      else
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        v23 = [(_UIHomeAffordanceSceneNotifierProxy *)self succinctDescription];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
        v25 = [WeakRetained succinctDescription];
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIHomeAffordanceSceneNotifier.m", 1305, @"Unexpected target notifier update for proxy notifier: %@; scene: %@",
          v23,
          v25);
      }
    }
  }
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (_UIHomeAffordanceSceneNotifierProxy)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIHomeAffordanceSceneNotifier.m", 979, @"%s: init is not allowed on %@", "-[_UIHomeAffordanceSceneNotifierProxy init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (_UIHomeAffordanceSceneNotifierProxy)initWithScene:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v6 = [(id)UIApp isFrontBoard];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34.receiver = self;
    v34.super_class = (Class)_UIHomeAffordanceSceneNotifierProxy;
    id v7 = [(_UIHomeAffordanceSceneNotifierProxy *)&v34 init];
    if (v7)
    {
      id v8 = *(id *)(__UILogGetCategoryCachedImpl("HomeAffordanceObservation", &initWithScene____s_category_235)+ 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = NSString;
        id v10 = v7;
        id v11 = (objc_class *)objc_opt_class();
        char v12 = NSStringFromClass(v11);
        uint64_t v13 = [v9 stringWithFormat:@"<%@: %p>", v12, v10];

        id v14 = v13;
        if (a3)
        {
          CGFloat v15 = NSString;
          id v16 = a3;
          CGFloat v17 = (objc_class *)objc_opt_class();
          double v18 = NSStringFromClass(v17);
          double v19 = [v15 stringWithFormat:@"<%@: %p>", v18, v16];
        }
        else
        {
          double v19 = @"(nil)";
        }
        *(_DWORD *)buf = 138543618;
        id v36 = v14;
        __int16 v37 = 2114;
        uint64_t v38 = v19;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Initializing: %{public}@; with scene: %{public}@",
          buf,
          0x16u);
      }
      if (v6)
      {
        double v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v20 addObserver:v7 selector:sel__windowDidBecomeAppKeyNotification_ name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];
        [v20 addObserver:v7 selector:sel__windowDidResignAppKeyNotification_ name:@"_UIWindowDidResignApplicationKeyNotification" object:0];
      }
      objc_storeWeak((id *)&v7->_scene, a3);
      objc_initWeak((id *)buf, v7);
      double v21 = (objc_class *)objc_opt_class();
      Name = class_getName(v21);
      v23 = NSString;
      id WeakRetained = objc_loadWeakRetained((id *)&v7->_scene);
      v25 = [WeakRetained _sceneIdentifier];
      v26 = [v23 stringWithFormat:@"UIKit - %s - %@", Name, v25];

      id v27 = MEMORY[0x1E4F14428];
      objc_copyWeak(&v33, (id *)buf);
      uint64_t v28 = BSLogAddStateCaptureBlockWithTitle();
      stateCaptureToken = v7->_stateCaptureToken;
      v7->_stateCaptureToken = (BSInvalidatable *)v28;

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    self = v7;
    double v30 = self;
  }
  else
  {
    double v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"_UIHomeAffordanceSceneNotifier.m", 989, @"Unexpected scene class for notifier: %@", a3 object file lineNumber description];

    double v30 = 0;
  }

  return v30;
}

- (void)_reset
{
  registeredObserverRecords = self->_registeredObserverRecords;
  self->_registeredObserverRecords = 0;

  [(_UIInvalidatable *)self->_targetNotifierRegistrationToken _invalidate];
  targetNotifierRegistrationToken = self->_targetNotifierRegistrationToken;
  self->_targetNotifierRegistrationToken = 0;

  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_lastReceivedHomeAffordanceSceneReferenceFrame.size = v5;
  -[_UIHomeAffordanceSceneNotifierProxy _resetTargetNotifierSceneState]((uint64_t)self);
}

- (void)_sceneWillInvalidate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a3 _hasInvalidated])
  {
    *(unsigned char *)&self->_flags |= 1u;
    CGSize v5 = *(id *)(__UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_sceneWillInvalidate____s_category_240)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(_UIHomeAffordanceSceneNotifierProxy *)self succinctDescription];
      if (a3)
      {
        id v7 = NSString;
        id v8 = a3;
        v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        id v11 = [v7 stringWithFormat:@"<%@: %p>", v10, v8];
      }
      else
      {
        id v11 = @"(nil)";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      CGFloat v15 = v11;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Resetting home affordance notifier: %{public}@; for invalidating scene: %{public}@",
        buf,
        0x16u);
    }
    [(_UIHomeAffordanceSceneNotifierProxy *)self _reset];
    [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  }
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"_UIWindowDidBecomeApplicationKeyNotification";
  v6[1] = @"_UIWindowDidResignApplicationKeyNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIHomeAffordanceSceneNotifierProxy;
  [(_UIHomeAffordanceSceneNotifierProxy *)&v5 dealloc];
}

- (BOOL)_hasInvalidated
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_unregisterHomeAffordanceObserverForRecord:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(_UIHomeAffordanceSceneNotifierProxy *)self _scene];
  if (v5)
  {
    int v6 = v5;
    char v7 = [v5 _hasInvalidated];

    if ((v7 & 1) == 0)
    {
      [(NSMutableSet *)self->_registeredObserverRecords removeObject:a3];
      if (os_variant_has_internal_diagnostics())
      {
        id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_unregisterHomeAffordanceObserverForRecord____s_category_241)+ 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          id v10 = -[_UIHomeAffordanceObservationRecord observer]((id *)a3);
          id v11 = [(_UIHomeAffordanceSceneNotifierProxy *)self succinctDescription];
          int v12 = 138543618;
          uint64_t v13 = v10;
          __int16 v14 = 2114;
          CGFloat v15 = v11;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Unregistered home affordance observer: %{public}@; notifier: %{public}@",
            (uint8_t *)&v12,
            0x16u);
        }
      }
      if (![(NSMutableSet *)self->_registeredObserverRecords count])
      {
        if (self->_targetNotifierRegistrationToken) {
          -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, self->_targetHomeAffordanceNotifier, 0);
        }
      }
    }
  }
}

- (id)registerHomeAffordanceObserver:(id)a3 inWindow:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v7 = [(_UIHomeAffordanceSceneNotifierProxy *)self _scene];
  id v8 = v7;
  if (v7)
  {
    char v9 = [v7 _hasInvalidated];

    if ((v9 & 1) != 0 || !_UIHomeAffordanceValidateObserver(self, a3, a4, 0))
    {
      id v8 = 0;
    }
    else
    {
      if ([(NSMutableSet *)self->_registeredObserverRecords count]) {
        BOOL v10 = 0;
      }
      else {
        BOOL v10 = self->_targetHomeAffordanceNotifier != 0;
      }
      id v11 = -[_UIHomeAffordanceObservationRecord initWithObserver:window:viewServiceSessionIdentifier:]([_UIHomeAffordanceObservationRecord alloc], a3, a4, 0);
      registeredObserverRecords = self->_registeredObserverRecords;
      if (!registeredObserverRecords)
      {
        uint64_t v13 = (NSMutableSet *)objc_opt_new();
        __int16 v14 = self->_registeredObserverRecords;
        self->_registeredObserverRecords = v13;

        registeredObserverRecords = self->_registeredObserverRecords;
      }
      [(NSMutableSet *)registeredObserverRecords addObject:v11];
      id v8 = _UIHomeAffordanceRegistrationTokenForNotifierAndRecord(self, (uint64_t)v11);
      if (v10) {
        -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, self->_targetHomeAffordanceNotifier, 0);
      }
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("HomeAffordanceObservation", &registerHomeAffordanceObserver_inWindow____s_category_242)+ 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          CGFloat v17 = v16;
          double v18 = [(_UIHomeAffordanceSceneNotifierProxy *)self succinctDescription];
          int v19 = 138543874;
          id v20 = a3;
          __int16 v21 = 2114;
          v22 = v8;
          __int16 v23 = 2114;
          id v24 = v18;
          _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Registered home affordance observer: %{public}@; token: %{public}@; notifier: %{public}@",
            (uint8_t *)&v19,
            0x20u);
        }
      }
    }
  }
  return v8;
}

- (CGRect)homeAffordanceSceneReferenceFrameForWindow:(id)a3
{
  double x = self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin.x;
  double y = self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin.y;
  double width = self->_lastReceivedHomeAffordanceSceneReferenceFrame.size.width;
  double height = self->_lastReceivedHomeAffordanceSceneReferenceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetHomeAffordanceNotifier:(void *)a1
{
  if (a1)
  {
    v4 = [a1 _scene];
    if (v4)
    {
      objc_super v5 = v4;
      char v6 = [v4 _hasInvalidated];

      if ((v6 & 1) == 0)
      {
        -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)a1, a2, 0);
      }
    }
  }
}

- (void)_targetNotifierSceneDidMoveToScreen:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(_UIHomeAffordanceSceneNotifierProxy *)self _scene];
  if (v5)
  {
    char v6 = v5;
    char v7 = [v5 _hasInvalidated];

    if ((v7 & 1) == 0)
    {
      id v8 = self->_targetHomeAffordanceNotifier;
      char v9 = [a3 userInfo];
      BOOL v10 = [v9 objectForKeyedSubscript:@"_UIWindowHostingSceneOldScreenUserInfoKey"];

      id v11 = [a3 userInfo];
      int v12 = [v11 objectForKeyedSubscript:@"_UIWindowHostingSceneNewScreenUserInfoKey"];

      uint64_t v13 = *(id *)(__UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_targetNotifierSceneDidMoveToScreen____s_category)+ 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [(_UIHomeAffordanceNotifying *)v8 succinctDescription];
        id v14 = [(_UIHomeAffordanceSceneNotifierProxy *)self succinctDescription];
        id v15 = v10;
        if (v15)
        {
          uint64_t v16 = NSString;
          CGFloat v17 = (objc_class *)objc_opt_class();
          double v18 = NSStringFromClass(v17);
          int v19 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
        }
        else
        {
          int v19 = @"(nil)";
        }

        id v20 = v19;
        id v21 = v12;
        if (v21)
        {
          v22 = NSString;
          __int16 v23 = (objc_class *)objc_opt_class();
          id v24 = NSStringFromClass(v23);
          uint64_t v25 = [v22 stringWithFormat:@"<%@: %p>", v24, v21];
        }
        else
        {
          uint64_t v25 = @"(nil)";
        }

        *(_DWORD *)buf = 138544130;
        uint64_t v28 = v26;
        __int16 v29 = 2114;
        id v30 = v14;
        __int16 v31 = 2114;
        double v32 = v20;
        __int16 v33 = 2114;
        objc_super v34 = v25;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "Current target home affordance notifier: %{public}@; for notifier: %{public}@; did move from screen: %{public}"
          "@; to screen: %{public}@",
          buf,
          0x2Au);
      }
      -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, self->_targetHomeAffordanceNotifier, 1);
    }
  }
}

- (void)_targetNotifierSceneDidDisconnect:(id)a3
{
  v4 = [(_UIHomeAffordanceSceneNotifierProxy *)self _scene];
  if (v4)
  {
    objc_super v5 = v4;
    char v6 = [v4 _hasInvalidated];

    if ((v6 & 1) == 0)
    {
      targetHomeAffordanceNotifier = self->_targetHomeAffordanceNotifier;
      -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, targetHomeAffordanceNotifier, 0);
    }
  }
}

- (void)_notifier:(id)a3 homeAffordanceDoubleTapGestureDidSucceed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v7 = [(_UIHomeAffordanceSceneNotifierProxy *)self _scene];
  if (v7)
  {
    id v8 = v7;
    char v9 = [v7 _hasInvalidated];

    if ((v9 & 1) == 0)
    {
      BOOL v10 = self->_targetHomeAffordanceNotifier;
      if (v10)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &_notifier_homeAffordanceDoubleTapGestureDidSucceed____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v16 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            CGFloat v17 = v16;
            double v18 = [(_UIHomeAffordanceNotifying *)v10 succinctDescription];
            int v19 = [(_UIHomeAffordanceSceneNotifierProxy *)self succinctDescription];
            *(_DWORD *)buf = 67109634;
            BOOL v21 = v4;
            __int16 v22 = 2114;
            __int16 v23 = v18;
            __int16 v24 = 2114;
            uint64_t v25 = v19;
            _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Received proxy doubleTapGestureDidSucceed from target notifier: %d; target notifier: %{public}@; proxy: %{public}@",
              buf,
              0x1Cu);
          }
        }
        _UIHomeAffordanceNotifyObserversDoubleTapGestureDidSucceed(self, self->_registeredObserverRecords, v4, 0);
      }
      else
      {
        int v12 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v13 = [(_UIHomeAffordanceSceneNotifierProxy *)self succinctDescription];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
        id v15 = [WeakRetained succinctDescription];
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIHomeAffordanceSceneNotifier.m", 1337, @"Unexpected target notifier update for proxy notifier: %@; scene: %@",
          v13,
          v15);
      }
    }
  }
}

- (void)appendDescriptionToStream:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke;
  void v6[3] = &unk_1E52D9F98;
  v6[4] = a3;
  v6[5] = self;
  [a3 appendProem:self block:v6];
  if ([a3 hasDebugStyle])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_2;
    v5[3] = &unk_1E52D9F98;
    v5[4] = a3;
    v5[5] = self;
    [a3 appendBodySectionWithName:0 block:v5];
  }
}

- (id)succinctDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  BOOL v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  objc_super v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (NSString)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  BOOL v4 = [MEMORY[0x1E4F4F728] debugStyle];
  objc_super v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetHomeAffordanceNotifier, 0);
  objc_storeStrong((id *)&self->_targetNotifierRegistrationToken, 0);
  objc_storeStrong((id *)&self->_registeredObserverRecords, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
}

@end