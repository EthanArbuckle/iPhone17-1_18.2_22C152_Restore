@interface _UIContextMenuPresentationAnimation
- ($0B15E5176FD367B837238C983E599B83)_dismissedMenuLayoutForPresentedLayout:(SEL)a3 previewLayout:(id *)a4 anchor:(id *)a5;
- (BOOL)_hasVisibleBackground;
- (BOOL)_isDismissingToDrag;
- (BOOL)_shouldAnimateBackgroundEffects;
- (BOOL)isDismissTransition;
- (BOOL)isSingleItemMenu;
- (UITargetedPreview)sourcePreview;
- (UITargetedPreview)stashedDismissalPreview;
- (UIViewFloatAnimatableProperty)animationProgress;
- (_UIContextMenuAnimator)alongsideAnimator;
- (_UIContextMenuLayoutArbiterOutput)expandedLayout;
- (_UIContextMenuPresentationAnimation)initWithUIController:(id)a3 asDismissal:(BOOL)a4;
- (_UIContextMenuReparentingContainerView)reparentingContainerView;
- (_UIContextMenuUIController)uiController;
- (_UIGroupCompletion)groupCompletion;
- (_UIPortalView)reparentingPortalView;
- (id)_accessoryViews;
- (id)_backgroundView;
- (id)_containerView;
- (id)_dismissalPreviewForSecondaryItemPreview:(id)a3;
- (id)_menuView;
- (id)_platterTransitionView;
- (id)_platterView;
- (id)_secondarySourcePreviews;
- (id)_targetedPreviewForDismissalAnimation;
- (id)accessoryAnimationBlock;
- (id)reparentingAnimationBlock;
- (unint64_t)dismissalStyle;
- (void)_actuallyPerformTransition;
- (void)_anchorTransitionViewToTargetedPreview:(id)a3;
- (void)_installAccessories;
- (void)_performReduceMotionAppearanceTransition;
- (void)_performReduceMotionDisappearanceTransition;
- (void)_prepareAnimatablePropertyBasedAnimations;
- (void)_prepareOverallAnimationCompletion;
- (void)_prepareReparentingAnimationWithDismissalTarget:(id)a3;
- (void)_presentation_applyBackgroundEffectWithProgress:(double)a3;
- (void)_setBackgroundVisible:(BOOL)a3;
- (void)_updateAccessoryAttachment:(id)a3;
- (void)performTransition;
- (void)prepareTransitionToView:(id)a3;
- (void)setAccessoryAnimationBlock:(id)a3;
- (void)setAlongsideAnimator:(id)a3;
- (void)setAnimationProgress:(id)a3;
- (void)setDismissalStyle:(unint64_t)a3;
- (void)setExpandedLayout:(id)a3;
- (void)setGroupCompletion:(id)a3;
- (void)setIsDismissTransition:(BOOL)a3;
- (void)setIsSingleItemMenu:(BOOL)a3;
- (void)setReparentingAnimationBlock:(id)a3;
- (void)setReparentingContainerView:(id)a3;
- (void)setReparentingPortalView:(id)a3;
- (void)setSourcePreview:(id)a3;
- (void)setStashedDismissalPreview:(id)a3;
- (void)setUiController:(id)a3;
- (void)transitionDidEnd:(BOOL)a3;
@end

@implementation _UIContextMenuPresentationAnimation

- (_UIContextMenuPresentationAnimation)initWithUIController:(id)a3 asDismissal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIContextMenuPresentationAnimation;
  v7 = [(_UIContextMenuPresentationAnimation *)&v21 init];
  v8 = v7;
  if (v7)
  {
    [(_UIContextMenuPresentationAnimation *)v7 setUiController:v6];
    [(_UIContextMenuPresentationAnimation *)v8 setIsDismissTransition:v4];
    v9 = [(_UIContextMenuPresentationAnimation *)v8 uiController];
    v10 = [v9 flocker];
    [(_UIContextMenuPresentationAnimation *)v8 setIsSingleItemMenu:v10 == 0];

    if (v4)
    {
      objc_initWeak(&location, v8);
      uint64_t v18 = MEMORY[0x1E4F143A8];
      objc_copyWeak(&v19, &location);
      v11 = [(_UIContextMenuPresentationAnimation *)v8 uiController];
      v12 = [v11 flocker];
      [v12 setUnflockPreviewProvider:&v18];

      v13 = objc_opt_new();
      [(_UIContextMenuPresentationAnimation *)v8 setGroupCompletion:v13];

      v14 = [(_UIContextMenuPresentationAnimation *)v8 groupCompletion];
      v15 = [(_UIContextMenuPresentationAnimation *)v8 uiController];
      v16 = [v15 flocker];
      [v16 setGroupCompletion:v14];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }

  return v8;
}

- (void)prepareTransitionToView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIContextMenuPresentationAnimation *)self isDismissTransition];
  id v6 = [(_UIContextMenuPresentationAnimation *)self _containerView];
  v7 = [(_UIContextMenuPresentationAnimation *)self _platterTransitionView];
  v8 = [(_UIContextMenuPresentationAnimation *)self _platterView];
  v9 = [(_UIContextMenuPresentationAnimation *)self _menuView];
  if (v5)
  {
    v10 = [(_UIContextMenuPresentationAnimation *)self uiController];
    v11 = [v10 currentLayout];
    [(_UIContextMenuPresentationAnimation *)self setExpandedLayout:v11];

    [v8 freezeExpandedPreview];
  }
  else
  {
    v12 = [(_UIContextMenuPresentationAnimation *)self _backgroundView];
    [v12 setAutoresizingMask:18];
    [v6 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    objc_super v21 = [(_UIContextMenuPresentationAnimation *)self uiController];
    v22 = [v21 menuStyle];
    [v22 preferredBackgroundInsets];
    objc_msgSend(v12, "setFrame:", v14 + v26, v16 + v23, v18 - (v26 + v24), v20 - (v23 + v25));

    v27 = _UIClickPresentationBackgroundColor(0);
    [v12 setBackgroundColor:v27];

    [v6 addSubview:v12];
    [v6 bounds];
    objc_msgSend(v7, "setFrame:");
    [v7 setAutoresizingMask:18];
    [v6 addSubview:v7];
    [v7 addSubview:v8];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v28 = [(_UIContextMenuPresentationAnimation *)self sourcePreview];
    _itemLayoutFromPreview((uint64_t)&v93, v28, v7, 1);

    v29 = [(_UIContextMenuPresentationAnimation *)self sourcePreview];
    [v8 setCollapsedPreview:v29];

    v30 = [(_UIContextMenuPresentationAnimation *)self sourcePreview];
    [v30 _transferAnimationsToView:v8];

    if (![v8 alwaysCompact]
      || ([v8 collapsedPreview],
          v31 = objc_claimAutoreleasedReturnValue(),
          [v31 parameters],
          v32 = objc_claimAutoreleasedReturnValue(),
          uint64_t v33 = [v32 copy],
          v32,
          v31,
          !v33))
    {
      uint64_t v33 = _DefaultParametersForView(v4);
      if ((_UIApplicationProcessIsSpringBoard() & 1) == 0)
      {
        v34 = [v6 traitCollection];
        uint64_t v35 = [v34 userInterfaceIdiom];

        if (v35 != 6)
        {
          v36 = [(_UIContextMenuPresentationAnimation *)self sourcePreview];
          v37 = [v36 parameters];
          [v37 backgroundColor];
          v73 = v12;
          id v38 = v4;
          v40 = v39 = (void *)v33;
          [v39 setBackgroundColor:v40];

          uint64_t v33 = (uint64_t)v39;
          id v4 = v38;
          v12 = v73;
        }
      }
    }
    v72 = (void *)v33;
    v41 = [[UITargetedPreview alloc] initWithView:v4 parameters:v33];
    [v8 setExpandedPreview:v41];

    if (v9)
    {
      if (v8)
      {
        v42 = [(_UIContextMenuPresentationAnimation *)self uiController];
        v43 = [v42 menuStyle];
        int v44 = [v43 previewOverlapsMenu];

        if (v44) {
          [v7 insertSubview:v9 belowSubview:v8];
        }
        else {
          [v7 insertSubview:v9 aboveSubview:v8];
        }
      }
      else
      {
        [v7 addSubview:v9];
      }
      v49 = [(_UIContextMenuPresentationAnimation *)self uiController];
      v50 = [v49 currentLayout];
      [(_UIContextMenuPresentationAnimation *)self setExpandedLayout:v50];

      long long v89 = v97;
      long long v90 = v98;
      long long v91 = v99;
      long long v92 = v100;
      long long v85 = v93;
      long long v86 = v94;
      long long v87 = v95;
      long long v88 = v96;
      _UIContextMenuItemLayoutApply((double *)&v85, v8, 0);
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      v51 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
      v52 = v51;
      if (v51) {
        [v51 menu];
      }
      else {
        memset(v84, 0, sizeof(v84));
      }
      v53 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
      v54 = v53;
      if (v53)
      {
        [v53 anchor];
      }
      else
      {
        uint64_t v83 = 0;
        memset(v82, 0, sizeof(v82));
      }
      long long v78 = v97;
      long long v79 = v98;
      long long v80 = v99;
      long long v81 = v100;
      long long v74 = v93;
      long long v75 = v94;
      long long v76 = v95;
      long long v77 = v96;
      [(_UIContextMenuPresentationAnimation *)self _dismissedMenuLayoutForPresentedLayout:v84 previewLayout:&v74 anchor:v82];

      long long v78 = v89;
      long long v79 = v90;
      long long v80 = v91;
      long long v81 = v92;
      long long v74 = v85;
      long long v75 = v86;
      long long v76 = v87;
      long long v77 = v88;
      v47 = (double *)&v74;
      v48 = v9;
    }
    else
    {
      v45 = [(_UIContextMenuPresentationAnimation *)self uiController];
      v46 = [v45 currentLayout];
      [(_UIContextMenuPresentationAnimation *)self setExpandedLayout:v46];

      long long v89 = v97;
      long long v90 = v98;
      long long v91 = v99;
      long long v92 = v100;
      long long v85 = v93;
      long long v86 = v94;
      long long v87 = v95;
      long long v88 = v96;
      v47 = (double *)&v85;
      v48 = v8;
    }
    _UIContextMenuItemLayoutApply(v47, v48, 0);
    [v8 layoutIfNeeded];
    [v9 layoutIfNeeded];
    if (![(_UIContextMenuPresentationAnimation *)self isSingleItemMenu])
    {
      v55 = [(_UIContextMenuPresentationAnimation *)self uiController];
      v56 = [v55 flocker];

      v57 = [[UITargetedPreview alloc] initWithView:v8];
      [v56 setPrimaryPlatterPreview:v57];

      v58 = [(_UIContextMenuPresentationAnimation *)self _secondarySourcePreviews];
      [v56 setSecondaryPlatterViews:v58];

      v59 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
      uint64_t v60 = [v59 type];

      if (v60 == 3) {
        [v56 setSettings:3];
      }
      [v56 install];
    }
    v61 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
    uint64_t v62 = [v61 type];

    BOOL v63 = v62 == 3;
    uint64_t v64 = v62 == 3;
    if (!v63) {
      [(_UIContextMenuPresentationAnimation *)self _installAccessories];
    }
    v65 = [v6 traitCollection];
    v66 = _UIContextMenuGetPlatformMetrics([v65 userInterfaceIdiom]);

    uint64_t v67 = [v66 previewShadowSettings];
    if (v67)
    {
      v68 = (void *)v67;
      v69 = [v66 previewShadowSettings];
      [v69 opacity];
      double v71 = v70;

      if (v71 > 0.0) {
        uint64_t v64 = [v66 enableShadowsForStandardSizeMenus];
      }
    }
    [v9 setShowsShadow:v64];
  }
}

- ($0B15E5176FD367B837238C983E599B83)_dismissedMenuLayoutForPresentedLayout:(SEL)a3 previewLayout:(id *)a4 anchor:(id *)a5
{
  double x = a4->var1.x;
  double y = a4->var1.y;
  double z = a4->var1.z;
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, 0.2, 0.2);
  CGFloat v13 = a4->var0.origin.x;
  CGFloat v14 = a4->var0.origin.y;
  CGFloat width = a4->var0.size.width;
  CGFloat height = a4->var0.size.height;
  v42.origin.double x = a4->var0.origin.x;
  v42.origin.double y = v14;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double v17 = CGRectGetHeight(v42);
  v43.origin.double x = v13;
  v43.origin.double y = v14;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  CGFloat v18 = CGRectGetWidth(v43);
  double v19 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
  uint64_t v20 = [v19 type];

  if (v20 != 3)
  {
    long long v22 = *(_OWORD *)&a5->var3.b;
    long long v37 = *(_OWORD *)&a5->var2.y;
    long long v38 = v22;
    long long v23 = *(_OWORD *)&a5->var3.ty;
    long long v39 = *(_OWORD *)&a5->var3.d;
    long long v40 = v23;
    CGSize size = a5->var0.size;
    v34.origin = a5->var0.origin;
    v34.CGSize size = size;
    long long v25 = *(_OWORD *)&a5->var1.z;
    long long v35 = *(_OWORD *)&a5->var1.x;
    long long v36 = v25;
    v44.origin.double x = _UIContextMenuItemFrameFromLayout(&v34);
    CGFloat v26 = v44.origin.x;
    CGFloat v27 = v44.origin.y;
    CGFloat v28 = v44.size.width;
    CGFloat v29 = v44.size.height;
    double MinX = CGRectGetMinX(v44);
    v45.origin.double x = v26;
    v45.origin.double y = v27;
    v45.size.CGFloat width = v28;
    v45.size.CGFloat height = v29;
    double v33 = fmax(MinX, fmin(a4->var1.x, CGRectGetMaxX(v45)));
    v46.origin.double x = v26;
    v46.origin.double y = v27;
    v46.size.CGFloat width = v28;
    v46.size.CGFloat height = v29;
    double MinY = CGRectGetMinY(v46);
    v47.origin.double x = v26;
    v47.origin.double y = v27;
    v47.size.CGFloat width = v28;
    v47.size.CGFloat height = v29;
    double x = v33;
    double y = fmax(MinY, fmin(a4->var1.y, CGRectGetMaxY(v47)));
    double z = a4->var1.z;
  }
  retstr->var0.origin.double x = 0.0;
  retstr->var0.origin.double y = 0.0;
  retstr->var0.size.CGFloat width = v18;
  retstr->var0.size.CGFloat height = fmin(v17, 110.0);
  retstr->var1.double x = x;
  retstr->var1.double y = y;
  retstr->var1.double z = z;
  retstr->var2 = a4->var2;
  long long v32 = *(_OWORD *)&v41.c;
  *(_OWORD *)&retstr->var3.a = *(_OWORD *)&v41.a;
  *(_OWORD *)&retstr->var3.c = v32;
  *(_OWORD *)&retstr->var3.tdouble x = *(_OWORD *)&v41.tx;
  retstr->var4 = 0.0;
  return result;
}

- (void)_anchorTransitionViewToTargetedPreview:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(_UIContextMenuPresentationAnimation *)self _isDismissingToDrag]
    || ([v4 view],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [(_UIContextMenuPresentationAnimation *)self _platterView],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {
    if ([v4 _sourceViewIsInViewHierarchy])
    {
      v7 = [v4 view];
    }
    else
    {
      v8 = [v4 target];
      v7 = [v8 container];
    }
    v9 = [(_UIContextMenuPresentationAnimation *)self _platterTransitionView];
    v10 = [v9 layer];
    [v10 removeAnimationForKey:@"PlatterAnchorViewMatchMoveAnimation"];

    v11 = [v7 layer];
    v12 = objc_opt_new();
    [v12 setSourceLayer:v11];
    [v12 setKeyPath:@"position"];
    [v12 setDuration:INFINITY];
    [v9 center];
    double v14 = v13;
    double v16 = v15;
    double v17 = [v9 superview];
    double v18 = _UIContextMenuConvertPointBetweenViews(v17, v7, v14, v16);
    double v20 = v19;

    objc_super v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v18, v20);
    v24[0] = v21;
    long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v12 setSourcePoints:v22];

    long long v23 = [v9 layer];
    [v23 addAnimation:v12 forKey:@"PlatterAnchorViewMatchMoveAnimation"];
  }
}

- (void)_actuallyPerformTransition
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIContextMenuPresentationAnimation *)self isDismissTransition];
  [(_UIContextMenuPresentationAnimation *)self _prepareAnimatablePropertyBasedAnimations];
  id v4 = [(_UIContextMenuPresentationAnimation *)self _platterTransitionView];
  BOOL v5 = [v4 traitCollection];
  long long v38 = _UIContextMenuGetPlatformMetrics([v5 userInterfaceIdiom]);

  id v6 = [(_UIContextMenuPresentationAnimation *)self _platterView];
  v7 = [(_UIContextMenuPresentationAnimation *)self _menuView];
  v8 = [(_UIContextMenuPresentationAnimation *)self animationProgress];
  [v8 setValue:1.0];

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v9 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
  v10 = v9;
  if (v9)
  {
    [v9 preview];
  }
  else
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v11 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
  v12 = v11;
  if (v11)
  {
    [v11 menu];
  }
  else
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
  }

  if (v3)
  {
    uint64_t v66 = 0;
    uint64_t v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__147;
    double v70 = __Block_byref_object_dispose__147;
    id v71 = 0;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke;
    v65[3] = &unk_1E52E3210;
    v65[5] = &v66;
    v65[4] = self;
    +[UIView performWithoutAnimation:v65];
    _itemLayoutFromPreview((uint64_t)location, (void *)v67[5], v4, [(_UIContextMenuPresentationAnimation *)self dismissalStyle] != 1);
    long long v84 = v61;
    long long v85 = v62;
    long long v86 = v63;
    long long v87 = v64;
    long long v80 = *(_OWORD *)location;
    long long v81 = v58;
    long long v82 = v59;
    long long v83 = v60;
    if ([(id)v67[5] _previewMode] != 4)
    {
      if ([(_UIContextMenuPresentationAnimation *)self _isDismissingToDrag])
      {
        double v13 = [(_UIContextMenuPresentationAnimation *)self uiController];
        double v14 = [v13 flocker];
        BOOL v15 = v14 == 0;

        if (v15) {
          *((void *)&v87 + 1) = 0x3FE999999999999ALL;
        }
      }
    }
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_2;
    v52[3] = &unk_1E52E9B00;
    v56 = &v66;
    id v16 = v4;
    id v53 = v16;
    v54 = self;
    id v17 = v6;
    id v55 = v17;
    +[UIView performWithoutAnimation:v52];
    double v18 = [(id)v67[5] target];
    id v19 = [v18 container];
    BOOL v20 = v19 == v16;

    if (v20) {
      [v16 setAlpha:0.0];
    }
    if ([(_UIContextMenuPresentationAnimation *)self _isDismissingToDrag])
    {
      uint64_t v21 = 1;
    }
    else
    {
      [v17 setHideChromeWhenCollapsed:1];
      uint64_t v21 = 0;
    }
    [v17 setCollapsedShadowStyle:v21];
    double v24 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
    long long v25 = v24;
    if (v24)
    {
      [v24 anchor];
    }
    else
    {
      uint64_t v51 = 0;
      memset(v50, 0, sizeof(v50));
    }
    v49[4] = v76;
    v49[5] = v77;
    v49[6] = v78;
    v49[7] = v79;
    v49[0] = v72;
    v49[1] = v73;
    v49[2] = v74;
    v49[3] = v75;
    v48[4] = v84;
    v48[5] = v85;
    v48[6] = v86;
    v48[7] = v87;
    v48[0] = v80;
    v48[1] = v81;
    v48[2] = v82;
    v48[3] = v83;
    [(_UIContextMenuPresentationAnimation *)self _dismissedMenuLayoutForPresentedLayout:v49 previewLayout:v48 anchor:v50];
    long long v76 = v61;
    long long v77 = v62;
    long long v78 = v63;
    long long v79 = v64;
    long long v72 = *(_OWORD *)location;
    long long v73 = v58;
    long long v74 = v59;
    long long v75 = v60;

    _Block_object_dispose(&v66, 8);
    double v23 = 0.0;
  }
  else
  {
    [v38 baseMenuOffset];
    double v23 = v22;
  }
  if ([(_UIContextMenuPresentationAnimation *)self _hasVisibleBackground])
  {
    if ([(_UIContextMenuPresentationAnimation *)self _shouldAnimateBackgroundEffects])
    {
      if (v3) {
        double v26 = 0.0;
      }
      else {
        double v26 = 1.0;
      }
      CGFloat v27 = [(_UIContextMenuPresentationAnimation *)self uiController];
      CGFloat v28 = [v27 backgroundViewAnimationProgress];
      [v28 setValue:v26];
    }
    else
    {
      [(_UIContextMenuPresentationAnimation *)self _setBackgroundVisible:!v3];
    }
  }
  if (!v3
    || [(_UIContextMenuPresentationAnimation *)self _isDismissingToDrag]
    || [(_UIContextMenuPresentationAnimation *)self isSingleItemMenu])
  {
    long long v61 = v84;
    long long v62 = v85;
    long long v63 = v86;
    long long v64 = v87;
    *(_OWORD *)id location = v80;
    long long v58 = v81;
    long long v59 = v82;
    long long v60 = v83;
    _UIContextMenuItemLayoutApply((double *)location, v6, 0);
  }
  else
  {
    [v6 setAlpha:*((double *)&v87 + 1)];
  }
  CGFloat v29 = [v6 layer];
  [v29 setZPosition:v23];

  [v6 setExpanded:!v3];
  [v6 layoutIfNeeded];
  long long v61 = v76;
  long long v62 = v77;
  long long v63 = v78;
  long long v64 = v79;
  *(_OWORD *)id location = v72;
  long long v58 = v73;
  long long v59 = v74;
  long long v60 = v75;
  _UIContextMenuItemLayoutApply((double *)location, v7, 0);
  [v7 layoutIfNeeded];
  if (!v3)
  {
    v30 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
    BOOL v31 = [v30 type] == 3;

    if (v31)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_3;
      v46[3] = &unk_1E52D9F70;
      id v47 = v7;
      +[UIView _performWithoutRetargetingAnimations:v46];
    }
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v32 = [(_UIContextMenuPresentationAnimation *)self _accessoryViews];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v88 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v32);
        }
        [(_UIContextMenuPresentationAnimation *)self _updateAccessoryAttachment:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v88 count:16];
    }
    while (v33);
  }

  objc_initWeak(location, self);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_4;
  v39[3] = &unk_1E52FF568;
  BOOL v41 = !v3;
  objc_copyWeak(&v40, location);
  [(_UIContextMenuPresentationAnimation *)self setAccessoryAnimationBlock:v39];
  [(_UIContextMenuPresentationAnimation *)self uiController];
  if (v3) {
    long long v36 = {;
  }
    long long v37 = [v36 flocker];
    objc_msgSend(v37, "unflockToDrag:animated:", -[_UIContextMenuPresentationAnimation _isDismissingToDrag](self, "_isDismissingToDrag"), 1);
  }
  else {
    long long v36 = {;
  }
    long long v37 = [v36 flocker];
    [v37 flock];
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(location);
}

- (void)performTransition
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UIContextMenuPresentationAnimation_performTransition__block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  id v4 = [(_UIContextMenuPresentationAnimation *)self _platterView];
  if ([(_UIContextMenuPresentationAnimation *)self _isDismissingToDrag]
    || !_AXSReduceMotionEnabled())
  {
    [v4 setShouldMorphContents:1];
    v3[2](v3);
  }
  else
  {
    [v4 setShouldMorphContents:0];
    if ([(_UIContextMenuPresentationAnimation *)self isDismissTransition])
    {
      [(_UIContextMenuPresentationAnimation *)self _performReduceMotionDisappearanceTransition];
    }
    else
    {
      +[UIView performWithoutAnimation:v3];
      [(_UIContextMenuPresentationAnimation *)self _performReduceMotionAppearanceTransition];
    }
  }
  BOOL v5 = [(_UIContextMenuPresentationAnimation *)self alongsideAnimator];
  [v5 performAllAnimations];

  [(_UIContextMenuPresentationAnimation *)self _prepareOverallAnimationCompletion];
}

- (void)_performReduceMotionAppearanceTransition
{
  v2 = [(_UIContextMenuPresentationAnimation *)self _containerView];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79___UIContextMenuPresentationAnimation__performReduceMotionAppearanceTransition__block_invoke;
  v4[3] = &unk_1E52D9F70;
  id v5 = v2;
  id v3 = v2;
  +[UIView performWithoutAnimation:v4];
  [v3 setAlpha:1.0];
}

- (void)_performReduceMotionDisappearanceTransition
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82___UIContextMenuPresentationAnimation__performReduceMotionDisappearanceTransition__block_invoke;
  v15[3] = &unk_1E52D9F70;
  v15[4] = self;
  +[UIView performWithoutAnimation:v15];
  id v3 = [(_UIContextMenuPresentationAnimation *)self _containerView];
  [v3 setAlpha:0.0];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(_UIContextMenuPresentationAnimation *)self _accessoryViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8++) setVisible:0 animated:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  v9 = [(_UIContextMenuPresentationAnimation *)self uiController];
  v10 = [v9 flocker];
  [v10 unflockToDrag:0 animated:0];
}

- (id)_targetedPreviewForDismissalAnimation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  char v43 = 0;
  id v3 = [(_UIContextMenuPresentationAnimation *)self uiController];
  id v4 = objc_msgSend(v3, "dismissalPreviewForStyle:clientReturnedPreview:", -[_UIContextMenuPresentationAnimation dismissalStyle](self, "dismissalStyle"), &v43);

  if (!v4 && !v43)
  {
    uint64_t v5 = [(_UIContextMenuPresentationAnimation *)self sourcePreview];
    if ([(UITargetedPreview *)v5 _sourceViewIsInViewHierarchy])
    {
      uint64_t v6 = [(UITargetedPreview *)v5 view];
      uint64_t v7 = [v6 _window];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        BOOL v9 = [(UITargetedPreview *)v5 _isVisible];

        if (v9)
        {
          v10 = [(UITargetedPreview *)v5 view];
          long long v11 = [v10 layer];
          long long v12 = [v11 presentationLayer];
          long long v13 = v12;
          if (v12)
          {
            id v14 = v12;
          }
          else
          {
            uint64_t v34 = [(UITargetedPreview *)v5 view];
            id v14 = [v34 layer];
          }
          memset(&buf, 0, sizeof(buf));
          if (v14) {
            [v14 transform];
          }
          else {
            memset(&v42, 0, sizeof(v42));
          }
          CATransform3DGetAffineTransform(&buf, &v42);
          long long v35 = [UIPreviewTarget alloc];
          long long v36 = [(UITargetedPreview *)v5 target];
          long long v37 = [v36 container];
          long long v38 = [(UITargetedPreview *)v5 target];
          [v38 center];
          CGAffineTransform v41 = buf;
          long long v39 = -[UIPreviewTarget initWithContainer:center:transform:](v35, "initWithContainer:center:transform:", v37, &v41);

          uint64_t v40 = [(UITargetedPreview *)v5 retargetedPreviewWithTarget:v39];

          uint64_t v5 = (UITargetedPreview *)v40;
          if (v40) {
            goto LABEL_20;
          }
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  BOOL v15 = v4;
  if (!v4)
  {
LABEL_16:
    BOOL v20 = [(_UIContextMenuPresentationAnimation *)self _platterView];
    if (v20)
    {
      uint64_t v21 = [(_UIContextMenuPresentationAnimation *)self _platterView];
      [v20 setHidesCollapsedSourceView:0];
    }
    else
    {
      uint64_t v21 = [(_UIContextMenuPresentationAnimation *)self _menuView];
    }
    double v22 = [(_UIContextMenuPresentationAnimation *)self _platterTransitionView];
    [v21 frame];
    double v25 = v24 + v23 * 0.5;
    double v28 = v27 + v26 * 0.5;
    memset(&buf, 0, sizeof(buf));
    CGAffineTransformMakeScale(&buf, 0.35, 0.35);
    CGFloat v29 = _DefaultParametersForView(v21);
    v30 = [UIPreviewTarget alloc];
    CGAffineTransform v41 = buf;
    BOOL v31 = -[UIPreviewTarget initWithContainer:center:transform:](v30, "initWithContainer:center:transform:", v22, &v41, v25, v28);
    uint64_t v5 = [[UITargetedPreview alloc] initWithView:v21 parameters:v29 target:v31];

    goto LABEL_20;
  }
  uint64_t v5 = v15;
  if (![(UITargetedPreview *)v15 _isVisible])
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v6 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        goto LABEL_14;
      }
      uint64_t v17 = [(UITargetedPreview *)v5 view];
      double v18 = [(UITargetedPreview *)v5 target];
      id v19 = [v18 container];
      LODWORD(buf.a) = 138412546;
      *(void *)((char *)&buf.a + 4) = v17;
      WORD2(buf.b) = 2112;
      *(void *)((char *)&buf.b + 6) = v19;
      _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Dismissal preview with view %@ and container %@ is invalid. Its container must be in the view hierarchy, and both the container and view must not be hidden.", (uint8_t *)&buf, 0x16u);
    }
    else
    {
      id v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_targetedPreviewForDismissalAnimation___s_category)
                         + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      uint64_t v6 = v16;
      uint64_t v17 = [(UITargetedPreview *)v5 view];
      double v18 = [(UITargetedPreview *)v5 target];
      id v19 = [v18 container];
      LODWORD(buf.a) = 138412546;
      *(void *)((char *)&buf.a + 4) = v17;
      WORD2(buf.b) = 2112;
      *(void *)((char *)&buf.b + 6) = v19;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Dismissal preview with view %@ and container %@ is invalid. Its container must be in the view hierarchy, and both the container and view must not be hidden.", (uint8_t *)&buf, 0x16u);
    }

LABEL_14:
    goto LABEL_15;
  }
LABEL_20:
  long long v32 = [(UITargetedPreview *)v5 view];
  [v32 _bringAncestorControlledCollectionSubviewToFrontAmongCoplanarPeers];

  [(_UIContextMenuPresentationAnimation *)self setStashedDismissalPreview:v5];
  return v5;
}

- (id)_dismissalPreviewForSecondaryItemPreview:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIContextMenuPresentationAnimation *)self uiController];
  uint64_t v6 = [v4 _internalIdentifier];

  uint64_t v7 = objc_msgSend(v5, "dismissalPreviewForSecondaryItem:style:", v6, -[_UIContextMenuPresentationAnimation dismissalStyle](self, "dismissalStyle"));

  return v7;
}

- (void)transitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_UIContextMenuPresentationAnimation *)self groupCompletion];
  [v5 complete];

  if (v3)
  {
    if (![(_UIContextMenuPresentationAnimation *)self isDismissTransition])
    {
      uint64_t v6 = [(_UIContextMenuPresentationAnimation *)self _menuView];
      [v6 didCompleteMenuAppearanceAnimation];
    }
    id v7 = [(_UIContextMenuPresentationAnimation *)self alongsideAnimator];
    [v7 performAllCompletions];
  }
}

- (void)_prepareOverallAnimationCompletion
{
  if ([(_UIContextMenuPresentationAnimation *)self isDismissTransition])
  {
    if (![(_UIContextMenuPresentationAnimation *)self _isDismissingToDrag])
    {
      BOOL v3 = [(_UIContextMenuPresentationAnimation *)self _containerView];
      id v4 = [(_UIContextMenuPresentationAnimation *)self reparentingPortalView];
      uint64_t v5 = [(_UIContextMenuPresentationAnimation *)self reparentingContainerView];
      uint64_t v6 = [(_UIContextMenuPresentationAnimation *)self _platterTransitionView];
      id v7 = [(_UIContextMenuPresentationAnimation *)self groupCompletion];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73___UIContextMenuPresentationAnimation__prepareOverallAnimationCompletion__block_invoke;
      v12[3] = &unk_1E52DD450;
      id v13 = v3;
      id v14 = v4;
      id v15 = v5;
      id v16 = v6;
      id v8 = v6;
      id v9 = v5;
      id v10 = v4;
      id v11 = v3;
      [v7 addCompletion:v12];
    }
  }
}

- (void)_prepareAnimatablePropertyBasedAnimations
{
  v17[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  [(_UIContextMenuPresentationAnimation *)self setAnimationProgress:v3];

  objc_initWeak(&location, self);
  id v4 = [(_UIContextMenuPresentationAnimation *)self animationProgress];
  v17[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_2;
  v13[3] = &unk_1E52DC308;
  objc_copyWeak(&v14, &location);
  +[UIView _createUnsafeTransformerWithInputAnimatableProperties:v5 modelValueSetter:&__block_literal_global_409 presentationValueSetter:v13];

  if ([(_UIContextMenuPresentationAnimation *)self _hasVisibleBackground])
  {
    uint64_t v6 = [(_UIContextMenuPresentationAnimation *)self uiController];
    id v7 = [v6 backgroundViewAnimationProgress];
    id v16 = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_3;
    v11[3] = &unk_1E52DC308;
    objc_copyWeak(&v12, &location);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_4;
    v9[3] = &unk_1E52DC308;
    objc_copyWeak(&v10, &location);
    +[UIView _createUnsafeTransformerWithInputAnimatableProperties:v8 modelValueSetter:v11 presentationValueSetter:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_presentation_applyBackgroundEffectWithProgress:(double)a3
{
  BOOL v5 = [(_UIContextMenuPresentationAnimation *)self isDismissTransition];
  double v6 = 0.3;
  if (!v5) {
    double v6 = 0.0;
  }
  double v7 = fmax(fmin((a3 - v6) / (1.0 - v6), 1.0), 0.0);
  id v8 = [(_UIContextMenuPresentationAnimation *)self _backgroundView];
  id v9 = [v8 _backgroundHost];
  id v10 = [v9 contentView];

  if (v10)
  {
    double v11 = (1.0 - v7) * 0.0;
    id v12 = [NSNumber numberWithDouble:v7 * 0.024 + v11];
    [v10 _setPresentationValue:v12 forKey:@"zoom"];

    id v13 = [NSNumber numberWithDouble:1.0 - v7 + v7 * 0.5];
    [v10 _setPresentationValue:v13 forKey:@"scale"];

    id v14 = [NSNumber numberWithDouble:v7 * 10.0 + v11];
    [v10 _setPresentationValue:v14 forKey:@"filters.gaussianBlur.inputRadius"];
  }
  id v15 = [v8 backgroundColor];
  id v16 = +[UIColor clearColor];
  double v26 = 0.0;
  double v27 = 0.0;
  double v24 = 0.0;
  double v25 = 0.0;
  id v17 = v15;
  [v16 getRed:&v27 green:&v26 blue:&v25 alpha:&v24];
  double v22 = 0.0;
  double v23 = 0.0;
  double v20 = 0.0;
  double v21 = 0.0;
  [v17 getRed:&v23 green:&v22 blue:&v21 alpha:&v20];

  double v18 = +[UIColor colorWithRed:(1.0 - v7) * v27 + v7 * v23 green:(1.0 - v7) * v26 + v7 * v22 blue:(1.0 - v7) * v25 + v7 * v21 alpha:(1.0 - v7) * v24 + v7 * v20];

  id v19 = v18;
  objc_msgSend(v8, "_setPresentationValue:forKey:", objc_msgSend(v19, "CGColor"), @"backgroundColor");
}

- (void)_prepareReparentingAnimationWithDismissalTarget:(id)a3
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v4 = [(_UIContextMenuPresentationAnimation *)self _platterTransitionView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [v4 superview];
  id v14 = [v51 target];
  id v15 = [v14 container];

  id v16 = [_UIContextMenuReparentingContainerView alloc];
  [v4 bounds];
  id v17 = -[UIView initWithFrame:](v16, "initWithFrame:");
  [(UIView *)v17 _setOverrideUserInterfaceRenderingMode:1];
  double v18 = [v13 traitCollection];
  -[UIView setOverrideUserInterfaceStyle:](v17, "setOverrideUserInterfaceStyle:", [v18 userInterfaceStyle]);

  id v19 = [v15 window];
  _UIGetTransformBetweenViews(v19, v15, 1, (uint64_t)v59);
  v58[0] = v59[0];
  v58[1] = v59[1];
  v58[2] = v59[2];
  [(UIView *)v17 setTransform:v58];

  uint64_t v20 = -[UIView _subviewsNeedAxisFlipping](v15);
  double v21 = [(UIView *)v17 layer];
  [v21 setFlipsHorizontalAxis:v20];

  [(UIView *)v17 setUserInteractionEnabled:0];
  double v22 = -[UIView _center3D](v4);
  double v24 = _UIContextMenuConvertPointBetweenViews(v13, v15, v22, v23);
  -[UIView _setCenter3D:](v17, v24, v25, 0.0);
  double v26 = objc_opt_new();
  [(UIView *)v17 bounds];
  objc_msgSend(v26, "setFrame:");
  double v27 = [(UIView *)v17 layer];
  [v27 addSublayer:v26];

  double v28 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2C0]];
  v60[0] = v28;
  CGFloat v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
  v30 = [(UIView *)v17 layer];
  [v30 setFilters:v29];

  BOOL v31 = [(UIView *)v17 layer];
  [v31 setValue:&unk_1ED3F2238 forKeyPath:@"filters.opacityPair.inputAmount"];

  [(_UIContextMenuPresentationAnimation *)self setReparentingContainerView:v17];
  long long v32 = [v51 view];
  [v15 insertSubview:v17 aboveSubview:v32];

  uint64_t v33 = -[_UIPortalView initWithFrame:]([_UIPortalView alloc], "initWithFrame:", v6, v8, v10, v12);
  [(_UIPortalView *)v33 setSourceView:v4];
  [(_UIPortalView *)v33 setAllowsBackdropGroups:1];
  [(_UIPortalView *)v33 setMatchesTransform:1];
  [(_UIPortalView *)v33 setMatchesPosition:1];
  uint64_t v34 = [(UIView *)v33 layer];
  [v34 setAllowsGroupOpacity:1];

  [v13 addSubview:v33];
  [(_UIContextMenuPresentationAnimation *)self setReparentingPortalView:v33];

  [(UIView *)v17 addSubview:v4];
  [(UIView *)v17 bounds];
  objc_msgSend(v4, "setCenter:", v36 + v35 * 0.5, v38 + v37 * 0.5);
  long long v39 = [v15 _window];
  uint64_t v40 = [v39 windowScene];
  CGAffineTransform v41 = [v13 _window];
  CATransform3D v42 = [v41 windowScene];
  BOOL v43 = v40 == v42;

  if (!v43)
  {
    long long v44 = [v15 _window];
    uint64_t v45 = [v44 windowScene];
    [v45 _synchronizeDrawing];

    CGRect v46 = [v13 _window];
    id v47 = [v46 windowScene];
    [v47 _synchronizeDrawing];
  }
  objc_initWeak(&location, self);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __87___UIContextMenuPresentationAnimation__prepareReparentingAnimationWithDismissalTarget___block_invoke;
  v52[3] = &unk_1E52FF590;
  objc_copyWeak(&v56, &location);
  v48 = v17;
  id v53 = v48;
  id v49 = v51;
  id v54 = v49;
  id v50 = v4;
  id v55 = v50;
  [(_UIContextMenuPresentationAnimation *)self setReparentingAnimationBlock:v52];

  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);
}

- (void)_installAccessories
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v3 = [(_UIContextMenuPresentationAnimation *)self _accessoryViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v8)
        {
          [*(id *)(*((void *)&v15 + 1) + 8 * i) anchor];
          uint64_t v9 = v14 - 1;
          double v10 = 0.5;
          double v11 = 0.5;
          if ((unint64_t)(v14 - 1) <= 7)
          {
            double v10 = dbl_186B9B358[v9];
            double v11 = dbl_186B9B398[v9];
          }
        }
        else
        {
          double v10 = 0.5;
          double v11 = 0.5;
          long long v14 = 0u;
        }
        switch(*((void *)&v14 + 1))
        {
          case 1:
            double v10 = 0.0;
            break;
          case 2:
            double v11 = 0.0;
            break;
          case 4:
            double v10 = 1.0;
            break;
          case 8:
            double v11 = 1.0;
            break;
          default:
            break;
        }
        if (!objc_msgSend(v8, "location", (void)v14)) {
          double v10 = 0.0;
        }
        double v12 = [v8 layer];
        objc_msgSend(v12, "setAnchorPoint:", v11, v10);

        id v13 = [(_UIContextMenuPresentationAnimation *)self _containerView];
        [v13 addSubview:v8];

        [v8 setVisible:0 animated:0];
        [(_UIContextMenuPresentationAnimation *)self _updateAccessoryAttachment:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)_updateAccessoryAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIContextMenuPresentationAnimation *)self _containerView];
  uint64_t v6 = [(_UIContextMenuPresentationAnimation *)self uiController];
  double v7 = [v6 menuConfiguration];
  double v8 = [v7 sourcePreview];

  uint64_t v9 = [v8 target];
  double v10 = [v9 container];
  double v11 = [v10 _window];

  uint64_t v12 = [v4 location];
  if (v12 == 2)
  {
    id v47 = [(_UIContextMenuPresentationAnimation *)self _menuView];
LABEL_7:
    v48 = v47;
    [v47 frame];
    double v43 = v49;
    double v44 = v50;
    double v45 = v51;
    double v46 = v52;

    goto LABEL_9;
  }
  if (v12 == 1)
  {
    id v47 = [(_UIContextMenuPresentationAnimation *)self _platterView];
    goto LABEL_7;
  }
  if (v12)
  {
    double v43 = *MEMORY[0x1E4F1DB28];
    double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [v11 bounds];
    double v17 = _UIContextMenuProjectFrameFromViewToView(v11, v5, v13, v14, v15, v16);
    double v72 = v18;
    double v73 = v17;
    double v74 = v19;
    double v75 = v20;
    [v11 safeAreaInsets];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    CGFloat v29 = [v11 traitCollection];
    v30 = _UIContextMenuGetPlatformMetrics([v29 userInterfaceIdiom]);

    [v30 minimumContainerInsets];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;

    double v39 = fmax(v22, v32);
    double v40 = fmax(v24, v34);
    double v41 = fmax(v26, v36);
    double v42 = fmax(v28, v38);
    double v43 = v73 + v40;
    double v44 = v72 + v39;
    double v45 = v74 - (v40 + v42);
    double v46 = v75 - (v39 + v41);
  }
LABEL_9:
  id v53 = [v5 traitCollection];
  id v54 = _UIContextMenuGetPlatformMetrics([v53 userInterfaceIdiom]);

  [v54 baseMenuOffset];
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  if (v4)
  {
    [v4 anchor];
    uint64_t v61 = v77 - 1;
    double v62 = 0.5;
    double v63 = 0.5;
    if ((unint64_t)(v77 - 1) <= 7)
    {
      double v62 = dbl_186B9B3D8[v61];
      double v63 = dbl_186B9B418[v61];
    }
  }
  else
  {
    long long v77 = 0u;
    double v62 = 0.5;
    double v63 = 0.5;
  }
  switch(*((void *)&v77 + 1))
  {
    case 1:
      double v62 = 0.0;
      break;
    case 2:
      double v63 = 0.0;
      break;
    case 4:
      double v62 = 1.0;
      break;
    case 8:
      double v63 = 1.0;
      break;
    default:
      break;
  }
  double v76 = v62;
  objc_msgSend(v4, "attachmentOffsetWithReferenceFrame:", _UIContextMenuProjectFrameFromViewToView(v5, v11, v43, v44, v45, v46));
  double v65 = v56 + v64;
  double v67 = v58 + v66;
  objc_msgSend(v4, "setOffset:", v65, v67);
  uint64_t v68 = [v4 layer];
  [v68 setZPosition:v60];

  v78.origin.double x = v43;
  v78.origin.double y = v44;
  v78.size.CGFloat width = v45;
  v78.size.CGFloat height = v46;
  double MinX = CGRectGetMinX(v78);
  v79.origin.double x = v43;
  v79.origin.double y = v44;
  v79.size.CGFloat width = v45;
  v79.size.CGFloat height = v46;
  double v70 = v65 + MinX + v63 * CGRectGetWidth(v79);
  v80.origin.double x = v43;
  v80.origin.double y = v44;
  v80.size.CGFloat width = v45;
  v80.size.CGFloat height = v46;
  double MinY = CGRectGetMinY(v80);
  v81.origin.double x = v43;
  v81.origin.double y = v44;
  v81.size.CGFloat width = v45;
  v81.size.CGFloat height = v46;
  objc_msgSend(v4, "setCenter:", v70, v67 + MinY + v76 * CGRectGetHeight(v81));
}

- (BOOL)_shouldAnimateBackgroundEffects
{
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return !v3 && !_AXSReduceMotionEnabled() && _AXSEnhanceBackgroundContrastEnabled() == 0;
}

- (BOOL)_isDismissingToDrag
{
  return [(_UIContextMenuPresentationAnimation *)self dismissalStyle] == 1;
}

- (id)_containerView
{
  v2 = [(_UIContextMenuPresentationAnimation *)self uiController];
  uint64_t v3 = [v2 platterContainerView];

  return v3;
}

- (id)_platterTransitionView
{
  v2 = [(_UIContextMenuPresentationAnimation *)self uiController];
  uint64_t v3 = [v2 platterTransitionView];

  return v3;
}

- (id)_backgroundView
{
  v2 = [(_UIContextMenuPresentationAnimation *)self uiController];
  uint64_t v3 = [v2 backgroundEffectView];

  return v3;
}

- (id)_platterView
{
  v2 = [(_UIContextMenuPresentationAnimation *)self uiController];
  uint64_t v3 = [v2 contentPlatterView];

  return v3;
}

- (id)_menuView
{
  v2 = [(_UIContextMenuPresentationAnimation *)self uiController];
  uint64_t v3 = [v2 menuView];

  return v3;
}

- (id)_accessoryViews
{
  v2 = [(_UIContextMenuPresentationAnimation *)self uiController];
  uint64_t v3 = [v2 menuConfiguration];
  id v4 = [v3 accessoryViews];

  return v4;
}

- (id)_secondarySourcePreviews
{
  v2 = [(_UIContextMenuPresentationAnimation *)self uiController];
  uint64_t v3 = [v2 menuConfiguration];
  id v4 = [v3 secondarySourcePreviews];

  return v4;
}

- (void)_setBackgroundVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIContextMenuPresentationAnimation *)self _hasVisibleBackground])
  {
    id v15 = [(_UIContextMenuPresentationAnimation *)self _backgroundView];
    if (v3)
    {
      uint64_t v5 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
      uint64_t v6 = [v5 type];

      double v7 = [(_UIContextMenuPresentationAnimation *)self uiController];
      double v8 = [v7 menuStyle];
      uint64_t v9 = [v8 preferredBackgroundEffects];

      if (v6 != 3 && ![v9 count])
      {
        uint64_t v10 = _UIClickPresentationBackgroundEffects(1);

        uint64_t v9 = (void *)v10;
      }
      [v15 setBackgroundEffects:v9];
      double v11 = [(_UIContextMenuPresentationAnimation *)self uiController];
      uint64_t v12 = [v11 menuStyle];
      double v13 = [v12 preferredBackgroundColor];

      if (v6 != 3 && !v13)
      {
        double v13 = _UIClickPresentationBackgroundColor(1);
      }
      [v15 setBackgroundColor:v13];
    }
    if (![(_UIContextMenuPresentationAnimation *)self _shouldAnimateBackgroundEffects])
    {
      double v14 = 0.0;
      if (v3) {
        double v14 = 1.0;
      }
      [v15 setAlpha:v14];
    }
  }
}

- (BOOL)_hasVisibleBackground
{
  BOOL v3 = [(_UIContextMenuPresentationAnimation *)self uiController];
  id v4 = [v3 menuStyle];

  uint64_t v5 = [v4 preferredBackgroundEffects];
  if ([v5 count])
  {
    BOOL v6 = 1;
  }
  else
  {
    double v7 = [v4 preferredBackgroundColor];

    if (v7)
    {
      BOOL v6 = 1;
      goto LABEL_6;
    }
    uint64_t v5 = [(_UIContextMenuPresentationAnimation *)self expandedLayout];
    BOOL v6 = [v5 type] != 3;
  }

LABEL_6:
  return v6;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
}

- (_UIContextMenuUIController)uiController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiController);
  return (_UIContextMenuUIController *)WeakRetained;
}

- (void)setUiController:(id)a3
{
}

- (_UIContextMenuAnimator)alongsideAnimator
{
  return self->_alongsideAnimator;
}

- (void)setAlongsideAnimator:(id)a3
{
}

- (unint64_t)dismissalStyle
{
  return self->_dismissalStyle;
}

- (void)setDismissalStyle:(unint64_t)a3
{
  self->_dismissalStyle = a3;
}

- (BOOL)isDismissTransition
{
  return self->_isDismissTransition;
}

- (void)setIsDismissTransition:(BOOL)a3
{
  self->_isDismissTransition = a3;
}

- (BOOL)isSingleItemMenu
{
  return self->_isSingleItemMenu;
}

- (void)setIsSingleItemMenu:(BOOL)a3
{
  self->_isSingleItemMenu = a3;
}

- (_UIPortalView)reparentingPortalView
{
  return self->_reparentingPortalView;
}

- (void)setReparentingPortalView:(id)a3
{
}

- (_UIContextMenuReparentingContainerView)reparentingContainerView
{
  return self->_reparentingContainerView;
}

- (void)setReparentingContainerView:(id)a3
{
}

- (UIViewFloatAnimatableProperty)animationProgress
{
  return self->_animationProgress;
}

- (void)setAnimationProgress:(id)a3
{
}

- (id)reparentingAnimationBlock
{
  return self->_reparentingAnimationBlock;
}

- (void)setReparentingAnimationBlock:(id)a3
{
}

- (id)accessoryAnimationBlock
{
  return self->_accessoryAnimationBlock;
}

- (void)setAccessoryAnimationBlock:(id)a3
{
}

- (_UIContextMenuLayoutArbiterOutput)expandedLayout
{
  return self->_expandedLayout;
}

- (void)setExpandedLayout:(id)a3
{
}

- (_UIGroupCompletion)groupCompletion
{
  return self->_groupCompletion;
}

- (void)setGroupCompletion:(id)a3
{
}

- (UITargetedPreview)stashedDismissalPreview
{
  return self->_stashedDismissalPreview;
}

- (void)setStashedDismissalPreview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedDismissalPreview, 0);
  objc_storeStrong((id *)&self->_groupCompletion, 0);
  objc_storeStrong((id *)&self->_expandedLayout, 0);
  objc_storeStrong(&self->_accessoryAnimationBlock, 0);
  objc_storeStrong(&self->_reparentingAnimationBlock, 0);
  objc_storeStrong((id *)&self->_animationProgress, 0);
  objc_storeStrong((id *)&self->_reparentingContainerView, 0);
  objc_storeStrong((id *)&self->_reparentingPortalView, 0);
  objc_storeStrong((id *)&self->_alongsideAnimator, 0);
  objc_destroyWeak((id *)&self->_uiController);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
}

@end