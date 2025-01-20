@interface _UISizeTrackingView
+ (BOOL)_supportsInvalidatingFocusCache;
+ (_UISizeTrackingView)viewWithRemoteViewController:(id)a3 viewControllerOperatorProxy:(id)a4 textEffectsOperatorProxy:(id)a5;
- (BOOL)_canSendViewServiceActualBoundingPath;
- (BOOL)_fencingEffectsAreVisible;
- (BOOL)_needsTextEffectsUpdateToFrame:(CGRect)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isScrollEnabled;
- (CGRect)_boundsForRemoteViewService;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)_sizeForRemoteViewService;
- (_UIRemoteViewController)remoteViewController;
- (id)_boundingPathForRemoteViewService;
- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (id)focusItemsInRect:(CGRect)a3;
- (id)nextResponder;
- (int64_t)_interfaceOrientationForScene:(id)a3;
- (void)_clearNeedsRemoteViewServiceBoundingPathUpdate;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_prepareForWindowHostingSceneRemoval;
- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4;
- (void)_setNeedsRemoteViewServiceBoundingPathUpdate;
- (void)_textEffectsWindowDidRotate:(id)a3;
- (void)_updateSceneGeometries:(id)a3;
- (void)_updateSceneGeometries:(id)a3 forOrientation:(int64_t)a4;
- (void)_updateTextEffectsGeometries:(CGRect)a3;
- (void)_updateTextEffectsGeometries:(CGRect)a3 textEffectsWindow:(id)a4;
- (void)_updateTextEffectsGeometriesImmediately;
- (void)_updateTextEffectsWindowHostedViewSize;
- (void)_updateTextEffectsWindowSafeAreaInsets;
- (void)_viewDidMoveFromScreen:(id)a3 toScreen:(id)a4;
- (void)_willMoveToWindow:(id)a3;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)updateIntrinsicContentSize:(CGSize)a3;
@end

@implementation _UISizeTrackingView

+ (_UISizeTrackingView)viewWithRemoteViewController:(id)a3 viewControllerOperatorProxy:(id)a4 textEffectsOperatorProxy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow");
  id v11 = objc_alloc((Class)a1);
  uint64_t v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 416), a4);
    objc_storeStrong((id *)(v13 + 424), a5);
    objc_storeWeak((id *)(v13 + 408), v8);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v13 + 448) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v13 + 464) = v14;
    [(id)v13 setAutoresizingMask:18];
    objc_msgSend((id)v13, "setClipsToBounds:", objc_msgSend(v8, "_viewClipsToBounds"));
    [(id)v13 _registerForGeometryChanges];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v13 selector:sel__updateTextEffectsGeometriesImmediately name:@"UITextEffectsWindowOffsetDidChangeNotification" object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v13 selector:sel__updateTextEffectsWindowHostedViewSize name:@"UITextEffectsWindowHostedViewSizeDidChangeNotification" object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v13 selector:sel__updateTextEffectsWindowSafeAreaInsets name:@"UITextEffectsWindowSafeAreaInsetsDidChangeNotification" object:0];

    id v18 = (id)v13;
  }

  return (_UISizeTrackingView *)(id)v13;
}

- (void)dealloc
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UITextEffectsWindowOffsetDidChangeNotification";
  v6[1] = @"UITextEffectsWindowHostedViewSizeDidChangeNotification";
  v6[2] = @"UITextEffectsWindowSafeAreaInsetsDidChangeNotification";
  v6[3] = @"UITextEffectsWindowDidRotateNotification";
  v6[4] = 0x1ED160160;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(UIView *)self _unregisterForGeometryChanges];
  v5.receiver = self;
  v5.super_class = (Class)_UISizeTrackingView;
  [(UIView *)&v5 dealloc];
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double width = -1.0;
  double height = -1.0;
  if (*(unsigned char *)&self->_sizeTrackingViewFlags)
  {
    double width = self->_intrinsicContentSize.width;
    double height = self->_intrinsicContentSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)updateIntrinsicContentSize:(CGSize)a3
{
  self->_intrinsicContentSize = a3;
  *(unsigned char *)&self->_sizeTrackingViewFlags |= 1u;
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (BOOL)_needsTextEffectsUpdateToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(UIView *)self window];
  id v9 = [v8 windowScene];
  id v10 = +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:v9 forViewService:1];

  id v11 = self;
  id v12 = v10;
  [(UIView *)v11 origin];
  double v14 = x - v13;
  [(UIView *)v11 origin];
  double v16 = y - v15;
  v17 = [(UIView *)v11 window];
  objc_msgSend(v17, "convertRect:fromView:", v11, v14, v16, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  v26 = [(UIView *)v11 window];

  objc_msgSend(v12, "convertRect:fromWindow:", v26, v19, v21, v23, v25);
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v36.origin.double x = v28;
  v36.origin.double y = v30;
  v36.size.double width = v32;
  v36.size.double height = v34;
  LOBYTE(v11) = !CGRectEqualToRect(v36, v11->_formerTextEffectsContentFrame);

  return (char)v11;
}

- (void)_updateTextEffectsWindowHostedViewSize
{
  id v4 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0 forViewService:1];
  textEffectsOperatorProxdouble y = self->_textEffectsOperatorProxy;
  [v4 hostedViewSize];
  -[_UISizeTrackingView _remoteTextEffectsWindowSizeFromSize:](self, "_remoteTextEffectsWindowSizeFromSize:");
  objc_msgSend(textEffectsOperatorProxy, "__setHostedViewSize:");
}

- (void)_updateTextEffectsWindowSafeAreaInsets
{
  id v29 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0 forViewService:1];
  [v29 hostedSafeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (!_UIDeviceNativeUserInterfaceIdiom())
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (!dyld_program_sdk_at_least()) {
        goto LABEL_29;
      }
    }
    else
    {
      id v11 = [MEMORY[0x1E4F4F7D0] sharedInstance];
      if ([v11 isCarrierInstall])
      {
        char v12 = dyld_program_sdk_at_least();

        if ((v12 & 1) == 0) {
          goto LABEL_29;
        }
      }
      else
      {
      }
    }
  }
  double v13 = [(UIView *)self traitCollection];
  if ([v13 userInterfaceIdiom])
  {

    goto LABEL_29;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  double v15 = [WeakRetained serviceBundleIdentifier];
  char v16 = [v15 hasPrefix:@"com.apple."];

  if ((v16 & 1) == 0)
  {
    v17 = [(UIView *)self window];
    [v17 safeAreaInsets];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    double v24 = [(UIView *)self window];
    if ((unint64_t)([v24 interfaceOrientation] - 3) > 1)
    {
    }
    else
    {
      if (vabdd_f64(v6, v21) < 0.1 && v6 > 50.0)
      {

LABEL_28:
        double v6 = 44.0;
        double v10 = 44.0;
        goto LABEL_29;
      }

      if (vabdd_f64(v10, v23) < 0.1 && v10 > 50.0) {
        goto LABEL_28;
      }
    }
    double v27 = vabdd_f64(v4, v19);
    if (v4 > 50.0 && v27 < 0.1) {
      double v4 = 44.0;
    }
  }
LABEL_29:
  objc_msgSend(self->_textEffectsOperatorProxy, "__setSafeAreaInsets:", v4, v6, v8, v10);
}

- (void)_updateTextEffectsGeometriesImmediately
{
  [(UIView *)self frame];
  -[_UISizeTrackingView _updateTextEffectsGeometries:](self, "_updateTextEffectsGeometries:");
}

- (void)_textEffectsWindowDidRotate:(id)a3
{
  if (self->_observingTextEffectsWindowRotation)
  {
    self->_observingTextEffectsWindowRotation = 0;
    double v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    double v6 = [v4 defaultCenter];
    double v7 = [v5 object];
    [v6 removeObserver:self name:@"UITextEffectsWindowDidRotateNotification" object:v7];

    [(UIView *)self frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    id v16 = [v5 object];

    -[_UISizeTrackingView _updateTextEffectsGeometries:textEffectsWindow:](self, "_updateTextEffectsGeometries:textEffectsWindow:", v16, v9, v11, v13, v15);
  }
}

- (void)_updateTextEffectsGeometries:(CGRect)a3
{
}

- (void)_updateTextEffectsGeometries:(CGRect)a3 textEffectsWindow:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  uint64_t v11 = [(UIView *)self window];
  if (v11)
  {
    double v12 = (void *)v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
    int v14 = [WeakRetained _shouldUpdateRemoteTextEffectsWindow];

    if (v14)
    {
      if (!v10)
      {
        double v15 = [(UIView *)self _window];
        id v16 = [v15 windowScene];
        id v10 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v16 forViewService:1];
      }
      uint64_t v117 = 0;
      v118 = &v117;
      uint64_t v119 = 0x4010000000;
      v120 = &unk_186D7DBA7;
      long long v121 = 0u;
      long long v122 = 0u;
      id v17 = objc_loadWeakRetained((id *)&self->_viewForRemoteTextEffectsWindowMatchAnimation);
      double v18 = v17;
      if (v17)
      {
        [v17 transform];
        long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&t2.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&t2.c = v19;
        *(_OWORD *)&t2.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        if (!CGAffineTransformEqualToTransform(&t1, &t2))
        {
LABEL_48:

          _Block_object_dispose(&v117, 8);
          goto LABEL_49;
        }
        double v20 = [(UIView *)self window];
        [v18 bounds];
        objc_msgSend(v20, "convertRect:fromView:", v18);
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;

        id v29 = [(UIView *)self window];
        objc_msgSend(v10, "convertRect:fromWindow:", v29, v22, v24, v26, v28);
        CGFloat v30 = v118;
        v118[4] = v31;
        v30[5] = v32;
        v30[6] = v33;
        v30[7] = v34;

        v35 = v118;
      }
      else
      {
        id v36 = v10;
        v37 = self;
        [(UIView *)v37 origin];
        double v39 = v38;
        [(UIView *)v37 origin];
        double v41 = v40;
        v42 = [(UIView *)v37 window];
        objc_msgSend(v42, "convertRect:fromView:", v37, x - v39, y - v41, width, height);
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;

        double v4 = [(UIView *)v37 window];

        objc_msgSend(v36, "convertRect:fromWindow:", v4, v44, v46, v48, v50);
        uint64_t v52 = v51;
        uint64_t v54 = v53;
        uint64_t v56 = v55;
        uint64_t v58 = v57;

        v35 = v118;
        v118[4] = v52;
        v35[5] = v54;
        v35[6] = v56;
        v35[7] = v58;
      }
      CGSize v59 = (CGSize)*((_OWORD *)v35 + 3);
      self->_formerTextEffectsContentFrame.origin = (CGPoint)*((_OWORD *)v35 + 2);
      self->_formerTextEffectsContentFrame.size = v59;
      [v10 actualSceneFrame];
      double v111 = v60;
      double v62 = v61;
      double v63 = *((double *)v118 + 4);
      double v64 = *((double *)v118 + 5);
      double v109 = *((double *)v118 + 7);
      double v110 = *((double *)v118 + 6);
      v65 = [v10 rootViewController];
      v66 = v65;
      if (v65)
      {
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __70___UISizeTrackingView__updateTextEffectsGeometries_textEffectsWindow___block_invoke;
        v112[3] = &unk_1E52E4728;
        id v113 = v65;
        v114 = &v117;
        [v113 performWithSafeTransitionFrames:v112];
      }
      if ([v10 _isHostedInAnotherProcess])
      {
        [v10 hostedSafeInsets];
        double v68 = v67;
        double v70 = v69;
        double v72 = v71;
        double v74 = v73;
      }
      else
      {
        v75 = [(UIView *)self _window];
        [v75 safeAreaInsets];
        double v68 = v76;
        double v70 = v77;
        double v72 = v78;
        double v74 = v79;
      }
      if (!_UIDeviceNativeUserInterfaceIdiom())
      {
        char has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((has_internal_diagnostics & 1) != 0
          || ([MEMORY[0x1E4F4F7D0] sharedInstance],
              double v4 = objc_claimAutoreleasedReturnValue(),
              ([v4 isCarrierInstall] & 1) != 0))
        {
          int v81 = dyld_program_sdk_at_least();
          char v82 = v81;
          if (has_internal_diagnostics)
          {
            if (!v81) {
              goto LABEL_39;
            }
          }
          else
          {

            if ((v82 & 1) == 0)
            {
LABEL_39:
              objc_msgSend(self->_textEffectsOperatorProxy, "__setWindowOffset:", *((double *)v118 + 4), *((double *)v118 + 5));
              objc_msgSend(self->_textEffectsOperatorProxy, "__setSafeAreaInsets:", v68, v70, v72, v74);
              objc_msgSend(self->_textEffectsOperatorProxy, "__setHostedViewReference:", v111 + v63, v62 + v64, v110, v109);
              double v95 = *((double *)v118 + 6);
              double v96 = *((double *)v118 + 7);
              v97 = [(UIView *)self window];
              v98 = [v97 windowScene];
              if ([v98 _enhancedWindowingEnabled])
              {
                uint64_t v99 = MEMORY[0x1E4F1DB30];
                double v100 = *MEMORY[0x1E4F1DB30];

                if (v95 != v100 || v96 != *(double *)(v99 + 8))
                {
                  textEffectsOperatorProxdouble y = self->_textEffectsOperatorProxy;
                  -[_UISizeTrackingView _remoteTextEffectsWindowSizeFromSize:](self, "_remoteTextEffectsWindowSizeFromSize:", v95, v96);
                  objc_msgSend(textEffectsOperatorProxy, "__setHostedViewSize:");
                }
              }
              else
              {
              }
              uint64_t v102 = [v10 interfaceOrientation];
              v103 = [(UIView *)self window];
              uint64_t v104 = [v103 interfaceOrientation];

              [MEMORY[0x1E4F28EB8] defaultCenter];
              if (v102 == v104) {
                v105 = {;
              }
                [v105 removeObserver:self name:@"UITextEffectsWindowDidRotateNotification" object:v10];
                BOOL v106 = 0;
              }
              else {
                v105 = {;
              }
                [v105 addObserver:self selector:sel__textEffectsWindowDidRotate_ name:@"UITextEffectsWindowDidRotateNotification" object:v10];
                BOOL v106 = 1;
              }

              self->_observingTextEffectsWindowRotation = v106;
              goto LABEL_48;
            }
          }
        }
        else
        {
        }
      }
      v83 = [(UIView *)self traitCollection];
      if ([v83 userInterfaceIdiom])
      {

        goto LABEL_39;
      }
      id v84 = objc_loadWeakRetained((id *)&self->_remoteViewController);
      v85 = [v84 serviceBundleIdentifier];
      char v86 = [v85 hasPrefix:@"com.apple."];

      if (v86) {
        goto LABEL_39;
      }
      v87 = [(UIView *)self window];
      [v87 safeAreaInsets];
      double v107 = v89;
      double v108 = v88;
      double v91 = v90;

      v92 = [(UIView *)self window];
      if ((unint64_t)([v92 interfaceOrientation] - 3) > 1)
      {
      }
      else
      {
        if (vabdd_f64(v70, v91) < 0.1 && v70 > 50.0)
        {

LABEL_38:
          double v70 = 44.0;
          double v74 = 44.0;
          goto LABEL_39;
        }

        if (vabdd_f64(v74, v107) < 0.1 && v74 > 50.0) {
          goto LABEL_38;
        }
      }
      double v93 = vabdd_f64(v68, v108);
      if (v68 > 50.0 && v93 < 0.1) {
        double v68 = 44.0;
      }
      goto LABEL_39;
    }
  }
LABEL_49:
}

- (void)_updateSceneGeometries:(id)a3 forOrientation:(int64_t)a4
{
  id v24 = a3;
  double v6 = [(UIView *)self _window];
  double v7 = [v6 windowScene];
  double v8 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v7 forViewService:1];

  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v24)
  {
    if (!a4
      && (([(id)UIApp _isSpringBoard] & 1) != 0
       || (a4 = [(_UISizeTrackingView *)self _interfaceOrientationForScene:v24]) == 0))
    {
      uint64_t v11 = [(UIView *)self window];
      a4 = [v11 interfaceOrientation];
    }
    self->_interfaceOrientation = a4;
    double v12 = [v24 settings];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;

    if ((unint64_t)(a4 - 3) >= 2) {
      double v17 = v16;
    }
    else {
      double v17 = v14;
    }
    if ((unint64_t)(a4 - 3) < 2) {
      double v14 = v16;
    }
  }
  else
  {
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v14 = *MEMORY[0x1E4F1DB30];
    if ([v8 _isHostedInAnotherProcess])
    {
      double v18 = -[UIWindow _fbsScene](v8);

      double v17 = v10;
      double v14 = v9;
      if (!v18)
      {
        [v8 hostedViewSize];
        double v14 = v19;
        double v17 = v20;
      }
    }
  }
  double v21 = [v8 windowScene];
  if ([v21 _enhancedWindowingEnabled])
  {
  }
  else
  {

    if (v14 != v9 || v17 != v10)
    {
      textEffectsOperatorProxdouble y = self->_textEffectsOperatorProxy;
      -[_UISizeTrackingView _remoteTextEffectsWindowSizeFromSize:](self, "_remoteTextEffectsWindowSizeFromSize:", v14, v17);
      objc_msgSend(textEffectsOperatorProxy, "__setHostedViewSize:");
    }
  }
}

- (int64_t)_interfaceOrientationForScene:(id)a3
{
  id v3 = a3;
  double v4 = [v3 clientSettings];
  id v5 = v4;
  if (v4 && [v4 isUISubclass])
  {
    int64_t v6 = [v5 interfaceOrientation];
  }
  else
  {
    double v7 = [v3 settings];
    int64_t v6 = [v7 interfaceOrientation];
  }
  return v6;
}

- (BOOL)_fencingEffectsAreVisible
{
  id v3 = [(UIView *)self window];
  if (v3) {
    BOOL v4 = ![(UIView *)self isHidden];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v6 = a4;
  uint64_t v29 = 0;
  CGFloat v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__227;
  uint64_t v33 = __Block_byref_object_dispose__227;
  id v34 = a3->var9;
  unint64_t var0 = a3->var0;
  if (v6) {
    int v8 = 0;
  }
  else {
    int v8 = (a3->var0 >> 3) & 1;
  }
  if ((var0 & 0x10) != 0)
  {
    BOOL v9 = 1;
  }
  else if ((var0 & 6) != 0)
  {
    [(UIView *)self frame];
    BOOL v9 = -[_UISizeTrackingView _needsTextEffectsUpdateToFrame:](self, "_needsTextEffectsUpdateToFrame:");
  }
  else
  {
    BOOL v9 = 0;
  }
  p_remoteViewController = &self->_remoteViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  unsigned int v12 = (v8 | v9) & ~[WeakRetained _isUpdatingSize];

  if (v12 == 1)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_remoteViewController);
    char v14 = [v13 _needsUnderflowPropertyUpdate];

    BOOL v15 = v30[5] != 0;
  }
  else
  {
    if (!v30[5]) {
      goto LABEL_18;
    }
    char v14 = 0;
    BOOL v15 = 1;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52___UISizeTrackingView__geometryChanged_forAncestor___block_invoke;
  aBlock[3] = &unk_1E530D6C8;
  char v24 = v12;
  char v25 = v14;
  char v26 = v8;
  BOOL v27 = v9;
  BOOL v28 = v15;
  aBlock[4] = self;
  aBlock[5] = &v29;
  double v16 = (void (**)(void))_Block_copy(aBlock);
  id v17 = objc_loadWeakRetained((id *)p_remoteViewController);
  int v18 = objc_msgSend(v17, "__shouldRemoteViewControllerFenceOperations");

  if (v18
    && (id v19 = objc_loadWeakRetained((id *)p_remoteViewController),
        int v20 = objc_msgSend(v19, "__shouldRemoteViewControllerFenceGeometryChange:forAncestor:", a3, v6),
        v19,
        v20))
  {
    id v21 = objc_loadWeakRetained((id *)p_remoteViewController);
    [v21 synchronizeAnimationsInActions:v16];
  }
  else
  {
    v16[2](v16);
  }
  id v22 = objc_loadWeakRetained((id *)p_remoteViewController);
  [v22 updateTouchInterdictionViewLayout];

LABEL_18:
  _Block_object_dispose(&v29, 8);
}

- (CGSize)_sizeForRemoteViewService
{
  [(UIView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (CGRect)_boundsForRemoteViewService
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(_UISizeTrackingView *)self _sizeForRemoteViewService];
  double v8 = v7;
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  result.size.double height = v10;
  result.size.double width = v8;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)_canSendViewServiceActualBoundingPath
{
  double v3 = [(UIView *)self window];
  if (v3)
  {
    [(UIView *)self bounds];
    -[UIView convertRect:toView:](self, "convertRect:toView:", v3);
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [v3 bounds];
    int v16 = _UIRectEquivalentToRectWithAccuracy(v5, v7, v9, v11, v12, v13, v14, v15, 0.1);
    char v17 = [v3 _isHostedInAnotherProcess];
    char v18 = v17 & v16;
    if ((v17 & 1) == 0 && v16) {
      char v18 = [v3 _isSceneSized];
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)_boundingPathForRemoteViewService
{
  if ([(_UISizeTrackingView *)self _canSendViewServiceActualBoundingPath])
  {
    double v3 = [(UIView *)self _effectiveBoundingPathAndBoundingPathView:0];
    double v4 = [v3 boundingPathForCoordinateSpace:self];
  }
  else
  {
    double v5 = [_UIRectangularBoundingPath alloc];
    [(_UISizeTrackingView *)self _boundsForRemoteViewService];
    double v4 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v5, "initWithCoordinateSpace:boundingRect:", self);
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)_UISizeTrackingView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(_UISizeTrackingView *)self _boundingPathMayHaveChangedForView:self relativeToBoundsOriginOnly:0];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)_UISizeTrackingView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(_UISizeTrackingView *)self _boundingPathMayHaveChangedForView:self relativeToBoundsOriginOnly:0];
  }
}

- (void)_setNeedsRemoteViewServiceBoundingPathUpdate
{
  char sizeTrackingViewFlags = (char)self->_sizeTrackingViewFlags;
  *(unsigned char *)&self->_char sizeTrackingViewFlags = sizeTrackingViewFlags | 4;
  if ((sizeTrackingViewFlags & 8) == 0)
  {
    *(unsigned char *)&self->_char sizeTrackingViewFlags = sizeTrackingViewFlags | 0xC;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67___UISizeTrackingView__setNeedsRemoteViewServiceBoundingPathUpdate__block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    [(id)UIApp _performBlockAfterCATransactionCommits:v3];
  }
}

- (void)_clearNeedsRemoteViewServiceBoundingPathUpdate
{
  *(unsigned char *)&self->_sizeTrackingViewFlags &= ~4u;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(UIView *)self window];
  objc_msgSend(v8, "convertPoint:fromWindow:", 0, x, y);
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
  double v10 = v9;
  double v12 = v11;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  objc_msgSend(WeakRetained, "_scrollToTopFromTouchAtViewLocation:resultHandler:", v7, v10, v12);
}

- (void)_willMoveToWindow:(id)a3
{
  id v4 = a3;
  double v5 = [(UIView *)self window];
  if (v5 && (*(unsigned char *)&self->_sizeTrackingViewFlags & 2) != 0)
  {
    [(UIView *)self _removeBoundingPathChangeObserver:self];
    *(unsigned char *)&self->_sizeTrackingViewFlags &= ~2u;
  }
  [(_UISizeTrackingView *)self _setNeedsRemoteViewServiceBoundingPathUpdate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  id v7 = v4;
  if (WeakRetained)
  {
    double v8 = [v5 windowScene];
    uint64_t v9 = [v7 windowScene];
    double v10 = (void *)v9;
    if (v7)
    {
      if (v8 && v9 && v8 != (void *)v9)
      {
        [WeakRetained _setWantsKeyboardEnvironmentEventDeferring:0];
        -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t)WeakRetained);
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60___UIRemoteViewController__viewWillMoveFromWindow_toWindow___block_invoke;
      v12[3] = &unk_1E52D9F98;
      v12[4] = WeakRetained;
      id v13 = v7;
      [WeakRetained _synchronizeAnimationsInActionsIfNecessary:v12];
    }
    else
    {
      [WeakRetained _setWantsKeyboardEnvironmentEventDeferring:0];
      -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t)WeakRetained);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)_UISizeTrackingView;
  [(UIView *)&v11 _willMoveToWindow:v7];
}

- (void)_updateSceneGeometries:(id)a3
{
  id v4 = a3;
  double v5 = [(UIView *)self window];
  -[UIWindow _fbsScene](v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  double v6 = [v4 userInfo];

  id v7 = [v6 objectForKey:0x1ED160180];
  int v8 = [v7 intValue];

  uint64_t v9 = v10;
  if (v10 && self->_interfaceOrientation != v8)
  {
    -[_UISizeTrackingView _updateSceneGeometries:forOrientation:](self, "_updateSceneGeometries:forOrientation:", v10);
    uint64_t v9 = v10;
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (id *)a4;
  v54.receiver = self;
  v54.super_class = (Class)_UISizeTrackingView;
  [(UIView *)&v54 _didMoveFromWindow:v6 toWindow:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  int v9 = [WeakRetained _serviceHasScrollToTopView];

  if (v9)
  {
    [v6 _unregisterScrollToTopView:self];
    [v7 _registerScrollToTopView:self];
  }
  [(UIView *)self frame];
  -[_UISizeTrackingView _updateTextEffectsGeometries:](self, "_updateTextEffectsGeometries:");
  if (v7)
  {
    id v10 = [v7[100] _FBSScene];
    [(_UISizeTrackingView *)self _updateSceneGeometries:v10 forOrientation:0];
    objc_super v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:self selector:sel__updateSceneGeometries_ name:0x1ED160160 object:v7];
  }
  if (v6)
  {
    double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:self name:0x1ED160160 object:v6];
  }
  id v13 = objc_loadWeakRetained((id *)&self->_remoteViewController);
  int v14 = [v13 serviceViewShouldShareTouchesWithHost];

  id v15 = objc_loadWeakRetained((id *)&self->_remoteViewController);
  int v16 = v15;
  if (v7 && v14) {
    [v15 _prepareTouchDeliveryPolicy];
  }
  else {
    [v15 _setTouchDeliveryPolicyAssertion:0];
  }

  id v17 = objc_loadWeakRetained((id *)&self->_remoteViewController);
  [v17 _noteWindowState:v7 != 0];

  if (v7)
  {
    if ((*(unsigned char *)&self->_sizeTrackingViewFlags & 2) == 0)
    {
      char v18 = [v7 screen];
      BOOL v19 = -[UIView _shouldSkipObservingBoundingPathChangesForScreen:]((BOOL)self, v18);

      if (!v19)
      {
        *(unsigned char *)&self->_sizeTrackingViewFlags |= 2u;
        [(UIView *)self _addBoundingPathChangeObserver:self];
      }
    }
  }
  [(_UISizeTrackingView *)self _setNeedsRemoteViewServiceBoundingPathUpdate];
  id v20 = objc_loadWeakRetained((id *)&self->_remoteViewController);
  id v21 = v7;
  if (v20)
  {
    if (!os_variant_has_internal_diagnostics()) {
      goto LABEL_17;
    }
    if (!v21) {
      goto LABEL_17;
    }
    BOOL v27 = [v21 rootViewController];
    char v28 = UIEqual_0(v27, v20);

    uint64_t v29 = [v20 parentViewController];

    CGFloat v30 = [v20 presentingViewController];

    if ((v28 & 1) != 0 || v29 || v30) {
      goto LABEL_17;
    }
    if (os_variant_has_internal_diagnostics())
    {
      id v34 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        goto LABEL_30;
      }
      double v44 = NSString;
      id v45 = v20;
      double v46 = (objc_class *)objc_opt_class();
      double v47 = NSStringFromClass(v46);
      double v48 = [v44 stringWithFormat:@"<%@: %p>", v47, v45];

      double v49 = NSString;
      double v50 = v21;
      id v40 = v48;
      uint64_t v51 = (objc_class *)objc_opt_class();
      uint64_t v52 = NSStringFromClass(v51);
      uint64_t v53 = [v49 stringWithFormat:@"<%@: %p>", v52, v50];

      *(_DWORD *)buf = 138412546;
      uint64_t v56 = v48;
      __int16 v57 = 2112;
      uint64_t v58 = v53;
      _os_log_fault_impl(&dword_1853B0000, v34, OS_LOG_TYPE_FAULT, "A remote view controller's view is in a window without the view controller being properly added to the hierarchy. viewController=%@; window=%@",
        buf,
        0x16u);
    }
    else
    {
      uint64_t v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_viewDidMoveFromWindow_toWindow____s_category) + 8);
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      uint64_t v32 = NSString;
      id v33 = v20;
      id v34 = v31;
      v35 = (objc_class *)objc_opt_class();
      id v36 = NSStringFromClass(v35);
      v37 = [v32 stringWithFormat:@"<%@: %p>", v36, v33];

      double v38 = NSString;
      double v39 = v21;
      id v40 = v37;
      double v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      double v43 = [v38 stringWithFormat:@"<%@: %p>", v42, v39];

      *(_DWORD *)buf = 138412546;
      uint64_t v56 = v37;
      __int16 v57 = 2112;
      uint64_t v58 = v43;
      _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "A remote view controller's view is in a window without the view controller being properly added to the hierarchy. viewController=%@; window=%@",
        buf,
        0x16u);
    }
LABEL_30:

LABEL_17:
    uint64_t v22 = [*((id *)v20 + 139) window];
    if (v22)
    {
      double v23 = (void *)v22;
      char v24 = [*((id *)v20 + 139) window];
      char v25 = [v24 windowScene];
      char v26 = [v21 windowScene];

      if (v25 != v26) {
        [v20 _restoreTextEffectsRemoteView];
      }
    }
    -[_UISceneKeyboardProxyLayerForwardingPresentationViewService sizeTrackingViewDidMoveToWindow:](*((void *)v20 + 177), v21);
    -[_UIRemoteViewController _updateParentHostingRegistryIfNecessaryForWindow:]((uint64_t)v20, v21);
  }
}

- (void)_viewDidMoveFromScreen:(id)a3 toScreen:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_UISizeTrackingView;
  id v6 = a4;
  id v7 = a3;
  [(UIView *)&v13 _viewDidMoveFromScreen:v7 toScreen:v6];
  id WeakRetained = (void **)objc_loadWeakRetained((id *)&self->_remoteViewController);
  id v9 = v7;
  id v10 = v6;
  if (v10 && WeakRetained)
  {
    int v11 = *((unsigned __int8 *)WeakRetained + 1240);
    objc_msgSend(WeakRetained, "_setWantsKeyboardEnvironmentEventDeferring:", 0, v13.receiver, v13.super_class);
    -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t)WeakRetained);
    [WeakRetained _notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:v10];
    if (v11 && !*((unsigned char *)WeakRetained + 1240)) {
      [WeakRetained _setWantsKeyboardEnvironmentEventDeferring:1];
    }
    double v12 = WeakRetained[157];
    if (v12) {
      -[_UIRemoteViewController _updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:newResolvedConfigurations:](WeakRetained, v12, WeakRetained[157]);
    }
  }
}

- (void)_prepareForWindowHostingSceneRemoval
{
  p_remoteViewController = &self->_remoteViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  [WeakRetained _setWantsKeyboardEnvironmentEventDeferring:0];

  id v5 = objc_loadWeakRetained((id *)p_remoteViewController);
  -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t)v5);

  id v6 = objc_loadWeakRetained((id *)p_remoteViewController);
  -[_UIRemoteViewController _updateParentHostingRegistryIfNecessaryForWindow:]((uint64_t)v6, 0);

  v7.receiver = self;
  v7.super_class = (Class)_UISizeTrackingView;
  [(UIView *)&v7 _prepareForWindowHostingSceneRemoval];
}

- (_UIRemoteViewController)remoteViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  return (_UIRemoteViewController *)WeakRetained;
}

- (id)nextResponder
{
  v7.receiver = self;
  v7.super_class = (Class)_UISizeTrackingView;
  double v3 = [(UIView *)&v7 nextResponder];
  uint64_t v4 = -[UIView __viewDelegate]((id *)&self->super.super.super.isa);
  id v5 = (void *)v4;
  if (v3 && v3 == (_WORD *)v4 && (v3[192] & 0x80) != 0)
  {

    double v3 = 0;
  }

  return v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  return 0;
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewForRemoteTextEffectsWindowMatchAnimation);
  objc_storeStrong(&self->_textEffectsOperatorProxy, 0);
  objc_storeStrong(&self->_viewControllerOperatorProxy, 0);
  objc_destroyWeak((id *)&self->_remoteViewController);
}

@end