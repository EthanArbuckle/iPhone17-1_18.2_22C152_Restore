@interface _UIPointerArbiterCore_iOS
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)hasRunningTransaction;
- (BOOL)updatesPausedViaAssertion;
- (NSMapTable)pointerRegionToMatchMoveSourceMap;
- (NSMutableArray)pendingTransactionBlocks;
- (PSPointerClientController)pointerClientController;
- (PSPointerHoverRegion)lastSentHoverRegion;
- (PSPointerPortalSourceCollection)pointerPortalSourceCollection;
- (UIPointerRegion)activePointerRegion;
- (UIPointerRegion)scrollingRegion;
- (UIPointerStyle)activePointerStyle;
- (_UIAssertionController)pauseAssertionController;
- (_UILumaTrackingBackdropView)samplingBackdropView;
- (_UIPointerArbiterCore_iOS)init;
- (_UIPortalView)overlayEffectPortalView;
- (_UIPortalView)pointerPortalView;
- (id)_coordinateSpaceSourceViewForRegion:(id)a3 withStyle:(id)a4;
- (id)_hoverRegionWithStyle:(id)a3 forRegion:(id)a4;
- (id)_pointerShapeForStyle:(id)a3 region:(id)a4;
- (id)_psPointerShapeFromUIPointerShape:(id)a3 atScale:(double)a4;
- (id)obtainPointerUpdatePauseAssertion;
- (int64_t)pointerState;
- (unint64_t)lastMaterialLuminance;
- (unint64_t)transactionRevisionID;
- (void)_clearMatchMoveSourceForRegion:(id)a3 immediately:(BOOL)a4;
- (void)_getPointerRegion:(id *)a3 andStyle:(id *)a4 atLocation:(CGPoint)a5 inWindow:(id)a6;
- (void)_notifyPointerStateDidChange;
- (void)_performNextTransaction;
- (void)_performTransactionUsingBlock:(id)a3;
- (void)_prepareContentMatchMoveSourceForPointerRegion:(id)a3 completion:(id)a4;
- (void)_preparePointerPortalSourceCollectionWithCompletion:(id)a3;
- (void)_setActiveHoverRegion:(id)a3 style:(id)a4 forPointerRegion:(id)a5 transactionID:(unint64_t)a6 completion:(id)a7;
- (void)applyStyle:(id)a3 forRegion:(id)a4 effectSourceHandler:(id)a5 completion:(id)a6;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4;
- (void)beginScrollingWithRegion:(id)a3;
- (void)endScrollingWithRegion:(id)a3;
- (void)exitRegion:(id)a3 removeStyle:(BOOL)a4 completion:(id)a5;
- (void)pointerClientController:(id)a3 didInvalidatePortalSourceCollections:(id)a4 matchMoveSources:(id)a5;
- (void)pointerClientControllerClientInteractionStateDidChange:(id)a3;
- (void)pointerClientControllerWillDecelerate:(id)a3 targetPointerPosition:(CGPoint *)a4 velocity:(CGPoint)a5 inContextID:(unsigned int)a6 cursorRegionLookupRadius:(double)a7 cursorRegionLookupResolution:(double)a8 lookupConeAngle:(double)a9;
- (void)setActivePointerRegion:(id)a3;
- (void)setActivePointerStyle:(id)a3;
- (void)setHasRunningTransaction:(BOOL)a3;
- (void)setLastMaterialLuminance:(unint64_t)a3;
- (void)setLastSentHoverRegion:(id)a3;
- (void)setOverlayEffectPortalView:(id)a3;
- (void)setPauseAssertionController:(id)a3;
- (void)setPendingTransactionBlocks:(id)a3;
- (void)setPointerClientController:(id)a3;
- (void)setPointerPortalSourceCollection:(id)a3;
- (void)setPointerPortalView:(id)a3;
- (void)setPointerRegionToMatchMoveSourceMap:(id)a3;
- (void)setSamplingBackdropView:(id)a3;
- (void)setScrollingRegion:(id)a3;
- (void)setTransactionRevisionID:(unint64_t)a3;
- (void)setUpdatesPausedViaAssertion:(BOOL)a3;
@end

@implementation _UIPointerArbiterCore_iOS

- (_UIPointerArbiterCore_iOS)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPointerArbiterCore_iOS;
  v2 = [(_UIPointerArbiterCore_iOS *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pointerClientController = v2->_pointerClientController;
    v2->_pointerClientController = (PSPointerClientController *)v3;

    [(PSPointerClientController *)v2->_pointerClientController setDelegate:v2];
    v2->_lastMaterialLuminance = 0;
  }
  return v2;
}

- (void)applyStyle:(id)a3 forRegion:(id)a4 effectSourceHandler:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(void))a6;
  if ([(_UIPointerArbiterCore_iOS *)self pointerState] == 1)
  {
    v14 = [(_UIPointerArbiterCore_iOS *)self _hoverRegionWithStyle:v10 forRegion:v11];
    v15 = (void *)([(_UIPointerArbiterCore_iOS *)self transactionRevisionID] + 1);
    [(_UIPointerArbiterCore_iOS *)self setTransactionRevisionID:v15];
    objc_initWeak((id *)location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke;
    v19[3] = &unk_1E52EF8C0;
    objc_copyWeak(v25, (id *)location);
    id v16 = v14;
    id v20 = v16;
    id v21 = v11;
    id v23 = v12;
    id v22 = v10;
    v25[1] = v15;
    v24 = v13;
    [(_UIPointerArbiterCore_iOS *)self _performTransactionUsingBlock:v19];

    objc_destroyWeak(v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerArbiter", &applyStyle_forRegion_effectSourceHandler_completion____s_category)+ 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v11;
      __int16 v27 = 2048;
      int64_t v28 = [(_UIPointerArbiterCore_iOS *)self pointerState];
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring applyStyle:forRegion: %@ because pointer state is not enabled (%ld)", location, 0x16u);
    }
    if (v13) {
      v13[2](v13);
    }
  }
}

- (void)exitRegion:(id)a3 removeStyle:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)([(_UIPointerArbiterCore_iOS *)self transactionRevisionID] + 1);
  [(_UIPointerArbiterCore_iOS *)self setTransactionRevisionID:v10];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63___UIPointerArbiterCore_iOS_exitRegion_removeStyle_completion___block_invoke;
  v13[3] = &unk_1E52EF8E8;
  objc_copyWeak(v16, &location);
  BOOL v17 = a4;
  id v11 = v8;
  id v14 = v11;
  v16[1] = v10;
  id v12 = v9;
  id v15 = v12;
  [(_UIPointerArbiterCore_iOS *)self _performTransactionUsingBlock:v13];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)_setActiveHoverRegion:(id)a3 style:(id)a4 forPointerRegion:(id)a5 transactionID:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(void))a7;
  if (v12)
  {
    [(_UIPointerArbiterCore_iOS *)self setActivePointerStyle:v13];
    [(_UIPointerArbiterCore_iOS *)self setActivePointerRegion:v14];
    [(_UIPointerArbiterCore_iOS *)self setLastSentHoverRegion:v12];
LABEL_4:
    objc_initWeak(&location, self);
    id v16 = [(_UIPointerArbiterCore_iOS *)self pointerClientController];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __99___UIPointerArbiterCore_iOS__setActiveHoverRegion_style_forPointerRegion_transactionID_completion___block_invoke;
    v17[3] = &unk_1E52EF910;
    id v18 = v12;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a6;
    id v19 = v14;
    id v20 = v15;
    [v16 setActiveHoverRegion:v18 transitionCompletion:v17];

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
    goto LABEL_5;
  }
  [(_UIPointerArbiterCore_iOS *)self setActivePointerStyle:0];
  [(_UIPointerArbiterCore_iOS *)self setActivePointerRegion:0];
  [(_UIPointerArbiterCore_iOS *)self setLastSentHoverRegion:0];
  if ([(_UIPointerArbiterCore_iOS *)self pointerState]) {
    goto LABEL_4;
  }
  [(_UIPointerArbiterCore_iOS *)self _clearMatchMoveSourceForRegion:v14 immediately:0];
  if (v15) {
    v15[2](v15);
  }
LABEL_5:
}

- (void)_clearMatchMoveSourceForRegion:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72___UIPointerArbiterCore_iOS__clearMatchMoveSourceForRegion_immediately___block_invoke;
  v11[3] = &unk_1E52D9F98;
  v11[4] = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = _Block_copy(v11);
  id v9 = v8;
  if (v4)
  {
    (*((void (**)(void *))v8 + 2))(v8);
  }
  else
  {
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    dispatch_after(v10, MEMORY[0x1E4F14428], v9);
  }
}

- (int64_t)pointerState
{
  uint64_t v3 = [(_UIPointerArbiterCore_iOS *)self pointerClientController];
  uint64_t v4 = [v3 clientInteractionState];
  uint64_t v5 = 1;
  if (v4 == 2) {
    uint64_t v5 = 2;
  }
  if (v4) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = 0;
  }

  if (v6 == 1)
  {
    id v7 = [(_UIPointerArbiterCore_iOS *)self scrollingRegion];

    if (v7) {
      int64_t v6 = 3;
    }
    else {
      int64_t v6 = 1;
    }
  }
  if (self->_updatesPausedViaAssertion) {
    return 0;
  }
  else {
    return v6;
  }
}

- (void)_notifyPointerStateDidChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v2 = +[_UIPointerArbiter sharedArbiter];
  [v3 postNotificationName:0x1ED14D680 object:v2];
}

- (void)beginScrollingWithRegion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIPointerArbiterCore_iOS *)self pointerState])
  {
    uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerArbiter", &qword_1EB260930) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "beginScrollingWithRegion: %@", (uint8_t *)&v14, 0xCu);
    }
    int64_t v6 = [(_UIPointerArbiterCore_iOS *)self lastSentHoverRegion];

    if (!v6)
    {
      id v12 = 0;
LABEL_16:
      [(_UIPointerArbiterCore_iOS *)self applyStyle:v12 forRegion:v4 effectSourceHandler:0 completion:0];
      [(_UIPointerArbiterCore_iOS *)self setScrollingRegion:v4];
      [(_UIPointerArbiterCore_iOS *)self _notifyPointerStateDidChange];

      goto LABEL_17;
    }
    id v7 = [(_UIPointerArbiterCore_iOS *)self activePointerStyle];
    id v8 = v7;
    if (v7)
    {
      if ([v7 type] == 2)
      {
        id v9 = [v8 pointerShape];
        [v9 beamLength];
        double v11 = v10;

        if (v11 > 0.0)
        {
          id v12 = (id)[v8 copy];
          [v12 setConstrainedAxes:0];
LABEL_15:

          goto LABEL_16;
        }
      }
      if (![v8 type])
      {
        id v12 = v8;
        goto LABEL_15;
      }
    }
    id v12 = 0;
    goto LABEL_15;
  }
  id v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerArbiter", &_MergedGlobals_1063) + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring beginScrollingWithRegion: %@ because pointer state is disabled", (uint8_t *)&v14, 0xCu);
  }
LABEL_17:
}

- (void)endScrollingWithRegion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_UIPointerArbiterCore_iOS *)self scrollingRegion];
  if (v5
    && (int64_t v6 = (void *)v5,
        [(_UIPointerArbiterCore_iOS *)self scrollingRegion],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7 == v4))
  {
    double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerArbiter", &qword_1EB260940) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "endScrollingWithRegion: %@", buf, 0xCu);
    }
    [(_UIPointerArbiterCore_iOS *)self setScrollingRegion:0];
    [(_UIPointerArbiterCore_iOS *)self _notifyPointerStateDidChange];
    id v12 = (void *)UIApp;
    id v13 = [v4 referenceView];
    int v14 = [v13 _window];
    [v12 _resendHoverEventForWindow:v14];

    dispatch_time_t v15 = dispatch_time(0, 50000000);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v16[2] = __52___UIPointerArbiterCore_iOS_endScrollingWithRegion___block_invoke;
    v16[3] = &unk_1E52D9F98;
    id v17 = v4;
    id v18 = self;
    dispatch_after(v15, MEMORY[0x1E4F14428], v16);
  }
  else
  {
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerArbiter", &qword_1EB260938) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      double v10 = [(_UIPointerArbiterCore_iOS *)self scrollingRegion];
      *(_DWORD *)buf = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring endScrollingWithRegion: %@ because scrollingRegion does not match: %@", buf, 0x16u);
    }
  }
}

- (id)obtainPointerUpdatePauseAssertion
{
  pauseAssertionController = self->_pauseAssertionController;
  if (!pauseAssertionController)
  {
    id v4 = [[_UIAssertionController alloc] initWithAssertionSubject:self];
    uint64_t v5 = self->_pauseAssertionController;
    self->_pauseAssertionController = v4;

    pauseAssertionController = self->_pauseAssertionController;
  }
  return [(_UIAssertionController *)pauseAssertionController vendAssertionOfType:0 initialState:1];
}

- (void)pointerClientController:(id)a3 didInvalidatePortalSourceCollections:(id)a4 matchMoveSources:(id)a5
{
  int64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerArbiter", &pointerClientController_didInvalidatePortalSourceCollections_matchMoveSources____s_category)+ 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "pointerClientController:didInvalidatePortalSourceCollections:matchMoveSources:", v11, 2u);
  }
  [(_UIPointerArbiterCore_iOS *)self setPointerRegionToMatchMoveSourceMap:0];
  [(_UIPointerArbiterCore_iOS *)self setPointerPortalSourceCollection:0];
  id v7 = [(_UIPointerArbiterCore_iOS *)self pointerPortalView];
  [v7 removeFromSuperview];

  [(_UIPointerArbiterCore_iOS *)self setPointerPortalView:0];
  id v8 = [(_UIPointerArbiterCore_iOS *)self overlayEffectPortalView];
  [v8 removeFromSuperview];

  [(_UIPointerArbiterCore_iOS *)self setOverlayEffectPortalView:0];
  id v9 = [(_UIPointerArbiterCore_iOS *)self samplingBackdropView];
  [v9 removeFromSuperview];

  double v10 = [(_UIPointerArbiterCore_iOS *)self samplingBackdropView];
  [v10 setPaused:1];

  [(_UIPointerArbiterCore_iOS *)self setSamplingBackdropView:0];
  [(_UIPointerArbiterCore_iOS *)self setLastSentHoverRegion:0];
}

- (void)pointerClientControllerWillDecelerate:(id)a3 targetPointerPosition:(CGPoint *)a4 velocity:(CGPoint)a5 inContextID:(unsigned int)a6 cursorRegionLookupRadius:(double)a7 cursorRegionLookupResolution:(double)a8 lookupConeAngle:(double)a9
{
  uint64_t v12 = *(void *)&a6;
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v17 = a3;
  if (a4)
  {
    id v18 = +[UIWindow _windowWithContextId:v12];
    id v19 = [v18 layer];
    objc_msgSend(v19, "convertPoint:fromLayer:", 0, a4->x, a4->y);
    double v21 = v20;
    double v23 = v22;

    id v84 = 0;
    id v85 = 0;
    -[_UIPointerArbiterCore_iOS _getPointerRegion:andStyle:atLocation:inWindow:](self, "_getPointerRegion:andStyle:atLocation:inWindow:", &v85, &v84, v18, v21, v23);
    id v24 = v85;
    id v25 = v84;
    double v72 = v23;
    if (v24)
    {
      double v26 = v21;
LABEL_41:
      v47 = [(_UIPointerArbiterCore_iOS *)self _hoverRegionWithStyle:v25 forRegion:v24];
      v48 = [(_UIPointerArbiterCore_iOS *)self _coordinateSpaceSourceViewForRegion:v24 withStyle:v25];
      objc_msgSend(v18, "convertPoint:toView:", v48, v21, v72);
      double v50 = v49;
      double v52 = v51;
      objc_msgSend(v18, "convertPoint:toView:", v48, v26, v23);
      CGFloat v54 = v53;
      CGFloat v56 = v55;
      [v47 contentBounds];
      double v57 = v87.origin.x;
      double v58 = v87.origin.y;
      double width = v87.size.width;
      double height = v87.size.height;
      v86.CGFloat x = v54;
      v86.CGFloat y = v56;
      if (CGRectContainsPoint(v87, v86))
      {
        if ([v47 pointerRecenteringAxes] == 3)
        {
          double v50 = v57 + width * 0.5;
          double v52 = v58 + height * 0.5;
        }
        else if ([v47 pointerRecenteringAxes])
        {
          double v50 = v57 + width * 0.5;
          if (v58 >= v52) {
            double v62 = v58;
          }
          else {
            double v62 = v52;
          }
          if (v58 + height <= v62) {
            double v52 = v58 + height;
          }
          else {
            double v52 = v62;
          }
        }
        else if (([v47 pointerRecenteringAxes] & 2) != 0)
        {
          double v52 = v58 + height * 0.5;
          if (v57 >= v50) {
            double v61 = v57;
          }
          else {
            double v61 = v50;
          }
          if (v57 + width <= v61) {
            double v50 = v57 + width;
          }
          else {
            double v50 = v61;
          }
        }
      }
      objc_msgSend(v48, "convertPoint:toView:", v18, v50, v52);
      double v21 = v63;
      double v65 = v64;
    }
    else
    {
      double v27 = hypot(x, y);
      if (fabs(x) >= 2.22044605e-16)
      {
        if (fabs(y) >= 2.22044605e-16)
        {
          double v28 = atan(x / y);
          if (y < 0.0) {
            double v28 = v28 + 3.14159265;
          }
          if (y > 0.0 && x < 0.0) {
            double v28 = v28 + 6.28318531;
          }
        }
        else
        {
          double v28 = dbl_186B968D0[x > 0.0];
        }
      }
      else
      {
        double v28 = 3.14159265;
        if (y > 0.0) {
          double v28 = 0.0;
        }
      }
      double v73 = v28;
      __double2 v30 = __sincos_stret(a9 * 0.5);
      uint64_t v31 = 0;
      if (v27 <= a7) {
        double v32 = v27;
      }
      else {
        double v32 = a7;
      }
      double v77 = (v30.__cosval * a7 + v32) / (v30.__sinval * a7);
      double v78 = v32;
      unint64_t v33 = vcvtpd_s64_f64(a7 / a8);
      double v26 = v21;
      double v74 = v21;
      double v71 = a8;
      while (v31 != v33)
      {
        double v75 = v26;
        double v76 = v23;
        id v24 = 0;
        double v34 = (double)(unint64_t)++v31 * a8;
        double v35 = round(v34 * 6.28318531 / a8);
        double v79 = (v34 * 6.28318531 / v35 / (v34 * 6.28318531) + v34 * 6.28318531 / v35 / (v34 * 6.28318531)) * 3.14159265;
        double v36 = 0.0;
        double v37 = v73;
        do
        {
          __double2 v38 = __sincos_stret(v36);
          __double2 v39 = __sincos_stret(v37 - v36);
          if (v77 * (v34 * v38.__sinval) - v78 < v34 * v38.__cosval && v24 == 0)
          {
            __double2 v41 = __sincos_stret(v37 + v36);
            double v42 = v72 + v34 * v41.__cosval;
            double v43 = v74 + v34 * v41.__sinval;
            id v82 = v25;
            id v83 = 0;
            -[_UIPointerArbiterCore_iOS _getPointerRegion:andStyle:atLocation:inWindow:](self, "_getPointerRegion:andStyle:atLocation:inWindow:", &v83, &v82, v18, v43, v42);
            id v24 = v83;
            id v44 = v82;

            if (v24)
            {
              double v75 = v43;
              double v76 = v42;
              id v25 = v44;
            }
            else
            {
              id v80 = v44;
              id v81 = 0;
              -[_UIPointerArbiterCore_iOS _getPointerRegion:andStyle:atLocation:inWindow:](self, "_getPointerRegion:andStyle:atLocation:inWindow:", &v81, &v80, v18, v74 + v34 * v39.__sinval, v72 + v34 * v39.__cosval);
              id v24 = v81;
              id v25 = v80;

              if (v24) {
                double v45 = v72 + v34 * v39.__cosval;
              }
              else {
                double v45 = v76;
              }
              double v46 = v75;
              if (v24) {
                double v46 = v74 + v34 * v39.__sinval;
              }
              double v75 = v46;
              double v76 = v45;
              if (!v24) {
                id v24 = 0;
              }
            }
            double v37 = v73;
          }
          else if (v24)
          {
            double v21 = v74;
            double v26 = v75;
            double v23 = v76;
            goto LABEL_41;
          }
          double v36 = v79 + v36;
        }
        while (v36 < 3.14159265);
        double v21 = v74;
        double v26 = v75;
        a8 = v71;
        double v23 = v76;
        if (v24) {
          goto LABEL_41;
        }
      }
      id v24 = 0;
      double v65 = v72;
    }
    v66 = [v18 layer];
    objc_msgSend(v66, "convertPoint:toLayer:", 0, v21, v65);
    CGFloat v68 = v67;
    CGFloat v70 = v69;

    a4->CGFloat x = v68;
    a4->CGFloat y = v70;
  }
}

- (void)pointerClientControllerClientInteractionStateDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerArbiter", &pointerClientControllerClientInteractionStateDidChange____s_category)+ 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    int v8 = 134217984;
    uint64_t v9 = [v3 clientInteractionState];
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "pointerClientControllerClientInteractionStateDidChange: %ld", (uint8_t *)&v8, 0xCu);
  }
  int64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = +[_UIPointerArbiter sharedArbiter];
  [v6 postNotificationName:0x1ED14D680 object:v7];
}

- (void)_performNextTransaction
{
  if (![(_UIPointerArbiterCore_iOS *)self hasRunningTransaction])
  {
    id v3 = [(_UIPointerArbiterCore_iOS *)self pendingTransactionBlocks];
    id v4 = [v3 firstObject];

    if (v4)
    {
      uint64_t v5 = [(_UIPointerArbiterCore_iOS *)self pendingTransactionBlocks];
      [v5 removeObjectAtIndex:0];

      [(_UIPointerArbiterCore_iOS *)self setHasRunningTransaction:1];
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __52___UIPointerArbiterCore_iOS__performNextTransaction__block_invoke;
      v6[3] = &unk_1E52DC308;
      objc_copyWeak(&v7, &location);
      ((void (**)(void, void *))v4)[2](v4, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_performTransactionUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIPointerArbiterCore_iOS *)self pendingTransactionBlocks];

  if (!v5)
  {
    int64_t v6 = objc_opt_new();
    [(_UIPointerArbiterCore_iOS *)self setPendingTransactionBlocks:v6];
  }
  id v7 = [(_UIPointerArbiterCore_iOS *)self pendingTransactionBlocks];
  int v8 = _Block_copy(v4);

  [v7 addObject:v8];
  if (![(_UIPointerArbiterCore_iOS *)self hasRunningTransaction])
  {
    [(_UIPointerArbiterCore_iOS *)self _performNextTransaction];
  }
}

- (void)_prepareContentMatchMoveSourceForPointerRegion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void *))a4;
  int v8 = [(_UIPointerArbiterCore_iOS *)self pointerRegionToMatchMoveSourceMap];
  uint64_t v9 = [v8 objectForKey:v6];

  if (v9)
  {
    uint64_t v10 = [_UIPointerContentEffectAnimationBuilder alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_4;
    v14[3] = &unk_1E52EF958;
    id v16 = &__block_literal_global_242;
    id v11 = v9;
    id v15 = v11;
    uint64_t v12 = [(_UIPointerContentEffectAnimationBuilder *)v10 initWithCreationHandler:v14];
    v7[2](v7, v11, v12);
  }
  else
  {
    objc_initWeak(&location, self);
    id v13 = [(_UIPointerArbiterCore_iOS *)self pointerClientController];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_2;
    v17[3] = &unk_1E52EF980;
    objc_copyWeak(&v21, &location);
    id v18 = v6;
    id v19 = v7;
    id v20 = &__block_literal_global_242;
    [v13 createContentMatchMoveSourcesWithCount:1 completion:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)_preparePointerPortalSourceCollectionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIPointerArbiterCore_iOS *)self pointerPortalSourceCollection];
  if (!v5) {
    goto LABEL_8;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(_UIPointerArbiterCore_iOS *)self pointerPortalView];
  if (!v7) {
    goto LABEL_7;
  }
  int v8 = (void *)v7;
  uint64_t v9 = [(_UIPointerArbiterCore_iOS *)self overlayEffectPortalView];
  if (!v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v10 = (void *)v9;
  id v11 = [(_UIPointerArbiterCore_iOS *)self samplingBackdropView];

  if (!v11)
  {
LABEL_8:
    id v17 = [(_UIPointerArbiterCore_iOS *)self pointerClientController];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81___UIPointerArbiterCore_iOS__preparePointerPortalSourceCollectionWithCompletion___block_invoke;
    v18[3] = &unk_1E52EF9A8;
    v18[4] = self;
    id v19 = v4;
    [v17 createPointerPortalSourceCollectionWithCompletion:v18];

    goto LABEL_9;
  }
  uint64_t v12 = [(_UIPointerArbiterCore_iOS *)self samplingBackdropView];
  [v12 setPaused:0];

  id v13 = [(_UIPointerArbiterCore_iOS *)self pointerPortalSourceCollection];
  int v14 = [(_UIPointerArbiterCore_iOS *)self pointerPortalView];
  id v15 = [(_UIPointerArbiterCore_iOS *)self overlayEffectPortalView];
  id v16 = [(_UIPointerArbiterCore_iOS *)self samplingBackdropView];
  (*((void (**)(id, void *, void *, void *, void *))v4 + 2))(v4, v13, v14, v15, v16);

LABEL_9:
}

- (id)_coordinateSpaceSourceViewForRegion:(id)a3 withStyle:(id)a4
{
  id v5 = a4;
  id v6 = [a3 referenceView];
  if (v5 && [v5 type] == 1)
  {
    uint64_t v7 = [v5 targetedPreview];
    int v8 = [v7 _sourceViewIsInViewHierarchy];

    uint64_t v9 = [v5 targetedPreview];
    uint64_t v10 = v9;
    if (v8)
    {
      uint64_t v11 = [v9 view];
    }
    else
    {
      uint64_t v12 = [v9 target];
      uint64_t v11 = [v12 container];

      id v6 = v12;
    }

    id v6 = (void *)v11;
  }

  return v6;
}

- (id)_hoverRegionWithStyle:(id)a3 forRegion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  int v8 = 0;
  if (!v5 || !v6) {
    goto LABEL_33;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F92120]);
  [v7 rect];
  objc_msgSend(v5, "_contentSlipMappedToRegionSize:", v10, v11);
  double v13 = v12;
  double v15 = v14;
  [v7 rect];
  objc_msgSend(v5, "_pointerSlipMappedToRegionSize:", v16, v17);
  double v19 = v18;
  double v21 = v20;
  [v5 contentScale];
  [v9 setContentHoverInverseScale:1.0 / v22];
  double v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v13, v15);
  [v9 setContentSlipValue:v23];

  objc_msgSend(v9, "setPointerRecenteringAxes:", objc_msgSend(v5, "constrainedAxes"));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v9, "setPointerLatchingAxes:", objc_msgSend(v7, "latchingAxes"));
  }
  id v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v19, v21);
  [v9 setPointerSlipValue:v24];

  objc_msgSend(v9, "setShouldPointerSuppressMirroring:", objc_msgSend(v5, "_suppressesMirroring"));
  id v25 = [v5 pointerShape];
  int v26 = [v25 isEmpty];

  v109 = v9;
  if (v26 || (uint64_t v58 = [v5 type]) == 0)
  {
    uint64_t v27 = [MEMORY[0x1E4F92138] systemShape];
LABEL_7:
    v108 = (void *)v27;
    goto LABEL_8;
  }
  if (v58 == 2)
  {
    uint64_t v27 = [(_UIPointerArbiterCore_iOS *)self _pointerShapeForStyle:v5 region:v7];
    goto LABEL_7;
  }
  if (v58 == 1)
  {
    v59 = [v5 targetedPreview];
    v60 = [v59 target];
    double v61 = [v60 container];

    [v5 contentScale];
    CGFloat v63 = v62;
    double v64 = [v5 pointerShape];
    double v65 = [v64 path];

    if ([v5 options])
    {
      uint64_t v78 = [(_UIPointerArbiterCore_iOS *)self _pointerShapeForStyle:v5 region:v7];
    }
    else
    {
      if (v65)
      {
        v66 = (void *)[v65 copy];
        [v65 bounds];
        double v69 = v68 + v67 * 0.5;
        double v72 = v71 + v70 * 0.5;
        CGAffineTransformMakeTranslation(&v114, -v69, -v72);
        [v66 applyTransform:&v114];
        if (([v5 options] & 0x40) != 0)
        {
          CGAffineTransformMakeScale(&v113, v63, v63);
          [v66 applyTransform:&v113];
        }
        double v73 = _UIPointerShapeOffsetFromModelPosition(v61, v7, v69, v72);
        CGAffineTransformMakeTranslation(&v112, v73, v74);
        [v66 applyTransform:&v112];
        double v75 = (void *)MEMORY[0x1E4F92138];
        id v76 = v66;
        v108 = objc_msgSend(v75, "customShapeWithPath:usesEvenOddFillRule:", objc_msgSend(v76, "CGPath"), objc_msgSend(v76, "usesEvenOddFillRule"));

        goto LABEL_40;
      }
      double v79 = [v5 pointerShape];
      [v79 rect];
      double x = v80;
      double y = v82;
      double width = v84;
      double height = v86;

      double v88 = _UIPointerShapeOffsetFromModelPosition(v61, v7, x + width * 0.5, y + height * 0.5);
      double v90 = v89;
      if (([v5 options] & 0x40) != 0)
      {
        CGAffineTransformMakeScale(&v111, v63, v63);
        v116.origin.double x = x;
        v116.origin.double y = y;
        v116.size.double width = width;
        v116.size.double height = height;
        CGRect v117 = CGRectApplyAffineTransform(v116, &v111);
        double x = v117.origin.x;
        double y = v117.origin.y;
        double width = v117.size.width;
        double height = v117.size.height;
      }
      [v61 _currentScreenScale];
      UIRectCenteredAboutPointScale(x, y, width, height, v88, v90, v91);
      double v93 = v92;
      double v95 = v94;
      double v97 = v96;
      double v99 = v98;
      v100 = [v5 pointerShape];
      int v101 = [v100 isCircle];

      v102 = (void *)MEMORY[0x1E4F92138];
      if (!v101)
      {
        v103 = [v5 pointerShape];
        [v103 effectiveCornerRadius];
        double v105 = v104;
        v106 = [v5 pointerShape];
        v107 = [v106 cornerCurve];
        v108 = objc_msgSend(v102, "roundedRectWithBounds:cornerRadius:cornerCurve:", v107, v93, v95, v97, v99, v105);

        goto LABEL_40;
      }
      uint64_t v78 = objc_msgSend(MEMORY[0x1E4F92138], "circleWithBounds:", v93, v95, v97, v99);
    }
    v108 = (void *)v78;
LABEL_40:

    goto LABEL_8;
  }
  v108 = 0;
LABEL_8:
  double v28 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v29 = [v5 accessories];
  unint64_t v30 = [v29 count];

  if (v30 >= 4) {
    uint64_t v31 = 4;
  }
  else {
    uint64_t v31 = v30;
  }
  if (v31)
  {
    for (uint64_t i = 0; i != v31; ++i)
    {
      unint64_t v33 = [v5 accessories];
      double v34 = [v33 objectAtIndexedSubscript:i];

      double v35 = [v5 targetedPreview];
      double v36 = [v35 target];
      double v37 = [v36 container];
      __double2 v38 = v37;
      if (v37)
      {
        id v39 = v37;
      }
      else
      {
        id v39 = [v7 referenceView];
      }
      v40 = v39;

      __double2 v41 = objc_opt_new();
      double v42 = [v34 shape];
      [v40 _currentScreenScale];
      double v43 = -[_UIPointerArbiterCore_iOS _psPointerShapeFromUIPointerShape:atScale:](self, "_psPointerShapeFromUIPointerShape:atScale:", v42);
      [v41 setShape:v43];

      [v34 position];
      objc_msgSend(v41, "setOffset:");
      [v34 position];
      [v41 setAngle:v44];
      objc_msgSend(v41, "setOrientationMatchesAngle:", objc_msgSend(v34, "orientationMatchesAngle"));
      [v28 addObject:v41];
    }
  }
  int v8 = v109;
  if ([v28 count]) {
    [v109 setAccessories:v28];
  }
  double v45 = [(_UIPointerArbiterCore_iOS *)self _coordinateSpaceSourceViewForRegion:v7 withStyle:v5];
  double v46 = [v45 layer];
  v47 = [v46 context];
  objc_msgSend(v109, "setCoordinateSpaceSourceContextID:", objc_msgSend(v47, "contextId"));

  [v109 setCoordinateSpaceSourceLayerRenderID:CALayerGetRenderId()];
  [v7 rect];
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  CGFloat v56 = [v7 referenceView];
  objc_msgSend(v45, "convertRect:fromView:", v56, v49, v51, v53, v55);
  objc_msgSend(v109, "setContentBounds:");

  [v109 setPointerShape:v108];
  objc_msgSend(v109, "setShouldPointerUnderlayContent:", objc_msgSend(v5, "pointerUnderlapsContent"));
  if ([v5 pointerUnderlapsContent])
  {
    if (([v5 options] & 2) != 0) {
      uint64_t v57 = 2;
    }
    else {
      uint64_t v57 = 1;
    }
  }
  else
  {
    uint64_t v57 = 0;
  }
  [v109 setOverlayEffectStyle:v57];
  objc_msgSend(v5, "_pointerIntensityForMaterialLuminance:", -[_UIPointerArbiterCore_iOS lastMaterialLuminance](self, "lastMaterialLuminance"));
  objc_msgSend(v109, "setPointerVisualIntensity:");
  objc_msgSend(v109, "setPreferredPointerMaterialLuminance:", -[_UIPointerArbiterCore_iOS lastMaterialLuminance](self, "lastMaterialLuminance"));

LABEL_33:
  return v8;
}

- (id)_pointerShapeForStyle:(id)a3 region:(id)a4
{
  id v5 = a3;
  id v6 = [v5 pointerShape];
  if ([v6 isElastic])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F92138];
    [v6 pinnedPoint];
    uint64_t v8 = objc_msgSend(v7, "elasticRoundedRectPinnedAtPoint:");
  }
  else
  {
    if (([v6 isEmpty] & 1) == 0 && (objc_msgSend(v5, "options") & 0x800) == 0)
    {
      id v9 = [v5 targetedPreview];
      double v10 = [v9 target];
      double v11 = [v10 container];
      [v11 _currentScreenScale];
      double v12 = -[_UIPointerArbiterCore_iOS _psPointerShapeFromUIPointerShape:atScale:](self, "_psPointerShapeFromUIPointerShape:atScale:", v6);

      goto LABEL_8;
    }
    uint64_t v8 = [MEMORY[0x1E4F92138] systemShape];
  }
  double v12 = (void *)v8;
LABEL_8:

  return v12;
}

- (id)_psPointerShapeFromUIPointerShape:(id)a3 atScale:(double)a4
{
  id v5 = a3;
  id v6 = [v5 path];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F92138];
    id v9 = v6;
    double v10 = objc_msgSend(v8, "customShapeWithPath:usesEvenOddFillRule:", objc_msgSend(v9, "CGPath"), objc_msgSend(v9, "usesEvenOddFillRule"));
  }
  else
  {
    [v5 rect];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    UIRectCenteredAboutPointScale(v11, v13, v15, v17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a4);
    CGFloat rect = v19;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    v39.origin.double x = v12;
    v39.origin.double y = v14;
    v39.size.double width = v16;
    v39.size.double height = v18;
    CGFloat MinX = CGRectGetMinX(v39);
    v40.origin.double x = v12;
    v40.origin.double y = v14;
    v40.size.double width = v16;
    v40.size.double height = v18;
    CGFloat MinY = CGRectGetMinY(v40);
    v41.origin.double x = rect;
    v41.origin.double y = v21;
    v41.size.double width = v23;
    v41.size.double height = v25;
    CGRect v42 = CGRectOffset(v41, MinX, MinY);
    double x = v42.origin.x;
    double y = v42.origin.y;
    double width = v42.size.width;
    double height = v42.size.height;
    double v32 = (void *)MEMORY[0x1E4F92138];
    [v5 effectiveCornerRadius];
    double v34 = v33;
    double v35 = [v5 cornerCurve];
    double v10 = objc_msgSend(v32, "roundedRectWithBounds:cornerRadius:cornerCurve:", v35, x, y, width, height, v34);
  }
  return v10;
}

- (void)_getPointerRegion:(id *)a3 andStyle:(id *)a4 atLocation:(CGPoint)a5 inWindow:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  objc_msgSend(v9, "convertPoint:toWindow:", 0, x, y);
  double v11 = v10;
  double v13 = v12;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __76___UIPointerArbiterCore_iOS__getPointerRegion_andStyle_atLocation_inWindow___block_invoke;
  v38[3] = &__block_descriptor_48_e32__CAPoint3D_ddd_16__0__UIWindow_8l;
  *(double *)&v38[4] = v10;
  *(double *)&v38[5] = v12;
  uint64_t v14 = _UIHitTestGestureContainer(0, v9, (uint64_t)v9, 0, (uint64_t)v38, 1.0);
  double v15 = (void *)v14;
  if (!v14) {
    goto LABEL_24;
  }
  id v16 = (id)v14;
  while (!_IsKindOfUIView((uint64_t)v16))
  {
LABEL_15:
    id v16 = (id)[v16 _parentGestureRecognizerContainer];
    if (!v16) {
      goto LABEL_24;
    }
  }
  double v17 = [v16 interactions];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v19)
  {
LABEL_13:

    goto LABEL_15;
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v35;
LABEL_6:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v35 != v21) {
      objc_enumerationMutation(v18);
    }
    CGFloat v23 = *(void **)(*((void *)&v34 + 1) + 8 * v22);
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v23 isEnabled]) {
      break;
    }
    if (v20 == ++v22)
    {
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v20) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  id v24 = v23;

  if (!v24) {
    goto LABEL_15;
  }
  CGFloat v25 = [v24 view];
  objc_msgSend(v25, "convertPoint:fromView:", 0, v11, v13);
  double v27 = v26;
  double v29 = v28;

  unint64_t v30 = [(id)UIApp _hoverEventForWindow:v9];
  uint64_t v31 = objc_msgSend(v24, "_pointerRegionAtPoint:modifiers:", objc_msgSend(v30, "modifierFlags"), v27, v29);
  if (v31)
  {
    double v32 = [v24 _pointerStyleForRegion:v31];
    if (a3) {
      *a3 = v31;
    }
    if (a4) {
      *a4 = v32;
    }
  }
LABEL_24:
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = a4 == 1;
  }
  [(_UIPointerArbiterCore_iOS *)self setLastMaterialLuminance:v7];
  uint64_t v8 = [(_UIPointerArbiterCore_iOS *)self lastSentHoverRegion];

  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69___UIPointerArbiterCore_iOS_backgroundLumaView_didTransitionToLevel___block_invoke;
    v9[3] = &unk_1E52EF9F0;
    objc_copyWeak(&v10, &location);
    [(_UIPointerArbiterCore_iOS *)self _performTransactionUsingBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return !a3 && self->_updatesPausedViaAssertion;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (!a4)
  {
    if (a3 && !self->_updatesPausedViaAssertion)
    {
      uint64_t v7 = [(_UIPointerArbiterCore_iOS *)self activePointerRegion];
      [(_UIPointerArbiterCore_iOS *)self exitRegion:v7 removeStyle:1 completion:0];
    }
    self->_updatesPausedViaAssertion = a3;
    [(_UIPointerArbiterCore_iOS *)self _notifyPointerStateDidChange];
  }
}

- (BOOL)hasRunningTransaction
{
  return self->_hasRunningTransaction;
}

- (void)setHasRunningTransaction:(BOOL)a3
{
  self->_hasRunningTransaction = a3;
}

- (NSMutableArray)pendingTransactionBlocks
{
  return self->_pendingTransactionBlocks;
}

- (void)setPendingTransactionBlocks:(id)a3
{
}

- (UIPointerStyle)activePointerStyle
{
  return self->_activePointerStyle;
}

- (void)setActivePointerStyle:(id)a3
{
}

- (UIPointerRegion)activePointerRegion
{
  return self->_activePointerRegion;
}

- (void)setActivePointerRegion:(id)a3
{
}

- (PSPointerHoverRegion)lastSentHoverRegion
{
  return self->_lastSentHoverRegion;
}

- (void)setLastSentHoverRegion:(id)a3
{
}

- (unint64_t)lastMaterialLuminance
{
  return self->_lastMaterialLuminance;
}

- (void)setLastMaterialLuminance:(unint64_t)a3
{
  self->_lastMaterialLuminance = a3;
}

- (NSMapTable)pointerRegionToMatchMoveSourceMap
{
  return self->_pointerRegionToMatchMoveSourceMap;
}

- (void)setPointerRegionToMatchMoveSourceMap:(id)a3
{
}

- (PSPointerClientController)pointerClientController
{
  return self->_pointerClientController;
}

- (void)setPointerClientController:(id)a3
{
}

- (PSPointerPortalSourceCollection)pointerPortalSourceCollection
{
  return self->_pointerPortalSourceCollection;
}

- (void)setPointerPortalSourceCollection:(id)a3
{
}

- (_UIPortalView)pointerPortalView
{
  return self->_pointerPortalView;
}

- (void)setPointerPortalView:(id)a3
{
}

- (_UIPortalView)overlayEffectPortalView
{
  return self->_overlayEffectPortalView;
}

- (void)setOverlayEffectPortalView:(id)a3
{
}

- (_UILumaTrackingBackdropView)samplingBackdropView
{
  return self->_samplingBackdropView;
}

- (void)setSamplingBackdropView:(id)a3
{
}

- (unint64_t)transactionRevisionID
{
  return self->_transactionRevisionID;
}

- (void)setTransactionRevisionID:(unint64_t)a3
{
  self->_transactionRevisionID = a3;
}

- (UIPointerRegion)scrollingRegion
{
  return self->_scrollingRegion;
}

- (void)setScrollingRegion:(id)a3
{
}

- (_UIAssertionController)pauseAssertionController
{
  return self->_pauseAssertionController;
}

- (void)setPauseAssertionController:(id)a3
{
}

- (BOOL)updatesPausedViaAssertion
{
  return self->_updatesPausedViaAssertion;
}

- (void)setUpdatesPausedViaAssertion:(BOOL)a3
{
  self->_updatesPausedViaAssertion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseAssertionController, 0);
  objc_storeStrong((id *)&self->_scrollingRegion, 0);
  objc_storeStrong((id *)&self->_samplingBackdropView, 0);
  objc_storeStrong((id *)&self->_overlayEffectPortalView, 0);
  objc_storeStrong((id *)&self->_pointerPortalView, 0);
  objc_storeStrong((id *)&self->_pointerPortalSourceCollection, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
  objc_storeStrong((id *)&self->_pointerRegionToMatchMoveSourceMap, 0);
  objc_storeStrong((id *)&self->_lastSentHoverRegion, 0);
  objc_storeStrong((id *)&self->_activePointerRegion, 0);
  objc_storeStrong((id *)&self->_activePointerStyle, 0);
  objc_storeStrong((id *)&self->_pendingTransactionBlocks, 0);
}

@end