@interface SBHLibraryZoomAnimator
+ (BOOL)validateWithLibrary:(id)a3 context:(id)a4;
- (BOOL)_targetViewHasMatchMove:(id)a3;
- (CGRect)_sourceFrameForPodViewAtIndex:(unint64_t)a3 inCoordinateSpace:(id)a4 withContext:(id)a5;
- (CGRect)_sourceFrameForPodViewAtIndex:(unint64_t)a3 inCoordinateSpace:(id)a4 withContext:(id)a5 forUnscaledPositioning:(BOOL)a6;
- (CGRect)_targetFrameForPodView:(id)a3 atIndex:(unint64_t)a4 forEndpoint:(int64_t)a5 withContext:(id)a6;
- (NSArray)pauseLayoutAssertions;
- (SBHLibraryZoomAnimator)init;
- (SBIconImageInfo)_iconImageInfoForPodViewAtIndex:(SEL)a3;
- (id)_flyingPodIconViewAtIndex:(unint64_t)a3;
- (id)_retargetedAnimationSettingsForSettings:(id)a3 normalizedTier:(double)a4 endpoint:(int64_t)a5;
- (void)_addPositionToTargetView:(id)a3 matchingSourceView:(id)a4 initialSourceFrame:(CGRect)a5;
- (void)_configureAlphaForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5;
- (void)_configureBackgroundViewForEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)_configureCategoryStackAlphaForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5;
- (void)_configureCrossfadeDestinationContentForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5;
- (void)_configureCrossfadeSourceContentForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5;
- (void)_configureDockIndicatorViewsForEndpoint:(int64_t)a3 preparing:(BOOL)a4 withContext:(id)a5;
- (void)_configureLayoutForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5 includeYPosition:(BOOL)a6;
- (void)_configureScaleForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5 includeYTranslation:(BOOL)a6;
- (void)_configureSearchViewsForEndpoint:(int64_t)a3 preparing:(BOOL)a4 withContext:(id)a5;
- (void)_displayLinkFired:(id)a3;
- (void)_matchMoveTargetView:(id)a3 withSourceView:(id)a4;
- (void)_matchMoveTargetView:(id)a3 withSourceView:(id)a4 usingSourceFrame:(CGRect)a5 targetFrame:(CGRect)a6;
- (void)_removeMatchMoveFromTargetView:(id)a3;
- (void)_removePositionAdditionFromTargetView:(id)a3;
- (void)_setIconImageInfo:(SBIconImageInfo *)a3 forPodViewAtIndex:(unint64_t)a4;
- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5;
- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)setPauseLayoutAssertions:(id)a3;
@end

@implementation SBHLibraryZoomAnimator

+ (BOOL)validateWithLibrary:(id)a3 context:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if ([v5 isPresentingSearch])
    {
      v7 = @"Library is presenting search";
    }
    else if ([v5 isPresentingFolder])
    {
      v7 = @"Library is presenting a pod";
    }
    else
    {
      v8 = [v6 iconListView];
      uint64_t v9 = [v8 numberOfDisplayedIconViews];

      if (v9)
      {
        v10 = [v6 libraryPodIconView];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_15;
        }
        v7 = @"No source library pod icon view to zoom to/from";
      }
      else
      {
        v7 = @"Library is not displaying any icon views to zoom";
      }
    }
  }
  else
  {
    v7 = @"No Library view controller provided";
  }
  v12 = SBLogLibrary();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_INFO, "SBHLibraryZoomAnimator validation failed for reason: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (SBHLibraryZoomAnimator)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryZoomAnimator;
  v2 = [(SBHLibraryZoomAnimator *)&v10 init];
  if (v2)
  {
    v3 = +[SBHHomeScreenDomain rootSettings];
    v4 = [v3 iconAnimationSettings];

    uint64_t v5 = [v4 libraryWaveOpenSettings];
    openSettings = v2->_openSettings;
    v2->_openSettings = (SBHLibraryWaveZoomSettings *)v5;

    uint64_t v7 = [v4 libraryWaveCloseSettings];
    closeSettings = v2->_closeSettings;
    v2->_closeSettings = (SBHLibraryWaveZoomSettings *)v7;
  }
  return v2;
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 userInfo];
  objc_storeWeak((id *)&self->_context, v7);
  v8 = [MEMORY[0x1E4F1CA48] array];
  flyingPodViews = self->_flyingPodViews;
  self->_flyingPodViews = v8;

  objc_super v10 = [MEMORY[0x1E4F1CA48] array];
  fadingPodViews = self->_fadingPodViews;
  self->_fadingPodViews = v10;

  v12 = [MEMORY[0x1E4F1CA48] array];
  crossfadeViews = self->_crossfadeViews;
  self->_crossfadeViews = v12;

  int v14 = [MEMORY[0x1E4F1CA48] array];
  libraryIconViews = self->_libraryIconViews;
  self->_libraryIconViews = v14;

  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  flyingPodWrapperViews = self->_flyingPodWrapperViews;
  self->_flyingPodWrapperViews = v16;

  v18 = [v7 containerView];
  v19 = [v7 iconListView];
  v20 = [v7 libraryIconViewController];
  v21 = [v20 categoryStackView];

  unint64_t v22 = [v19 numberOfDisplayedIconViews];
  unint64_t v23 = [v19 iconColumnsForCurrentOrientation];
  if (v22 >= v23) {
    unint64_t v22 = v23;
  }
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  v85[3] = 0;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v80[3] = &unk_1E6AAF730;
  v80[4] = self;
  id v70 = v18;
  id v81 = v70;
  v83 = v85;
  unint64_t v84 = v22;
  id v69 = v21;
  id v82 = v69;
  [v19 enumerateDisplayedIconViewsUsingBlock:v80];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v25 = self->_libraryIconViews;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_2;
  v77[3] = &unk_1E6AAF758;
  id v71 = v19;
  id v78 = v71;
  id v72 = v24;
  id v79 = v72;
  [(NSMutableArray *)v25 enumerateObjectsUsingBlock:v77];
  [(SBHLibraryZoomAnimator *)self setPauseLayoutAssertions:v72];
  v26 = [v71 layout];
  v27 = [(NSMutableArray *)self->_libraryIconViews firstObject];
  v28 = [v27 icon];
  v29 = [v28 gridSizeClass];
  [v26 iconImageInfoForGridSizeClass:v29];
  self->_libraryIconImageInfo.size.width = v30;
  self->_libraryIconImageInfo.size.height = v31;
  self->_libraryIconImageInfo.scale = v32;
  self->_libraryIconImageInfo.continuousCornerRadius = v33;

  [(NSMutableArray *)self->_flyingPodWrapperViews enumerateObjectsWithOptions:2 usingBlock:&__block_literal_global_26];
  v34 = (void *)MEMORY[0x1E4FB1EB0];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_4;
  v73[3] = &unk_1E6AAF7C8;
  v73[4] = self;
  int64_t v75 = a3;
  id v35 = v7;
  id v74 = v35;
  char v76 = 1;
  [v34 performWithoutAnimation:v73];
  if (!self->_presentationSourceOrderingAssertion)
  {
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v38 = [v35 acquireOrderPresentationSourceContainerViewBeforeLibraryViewAssertionForReason:v37];
    presentationSourceOrderingAssertion = self->_presentationSourceOrderingAssertion;
    self->_presentationSourceOrderingAssertion = v38;
  }
  v40 = [v35 sourceContainerView];
  v68 = v6;
  v41 = (void *)[objc_alloc(MEMORY[0x1E4FB2248]) initWithSourceView:v40];
  [v40 bounds];
  objc_msgSend(v41, "setFrame:");
  [v41 setHidesSourceView:1];
  [v41 setMatchesPosition:1];
  [v41 setMatchesTransform:1];
  [v41 setAllowsHitTesting:1];
  [v41 setAllowsBackdropGroups:1];
  [v41 setForwardsClientHitTestingToSourceView:1];
  objc_storeStrong((id *)&self->_presentationSourcePortalView, v41);
  v42 = [(NSMutableArray *)self->_fadingPodViews firstObject];
  v43 = [v42 superview];
  [v70 insertSubview:v41 aboveSubview:v43];

  v44 = [v35 libraryPodIconView];
  v45 = [_SBHLibraryZoomAnimatorTouchForwardingView alloc];
  v46 = -[_SBHLibraryZoomAnimatorTouchForwardingView initWithFrame:](v45, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_SBHLibraryZoomAnimatorTouchForwardingView *)v46 setTouchForwardingTargetView:v44];
  v47 = [(_SBHLibraryZoomAnimatorTouchForwardingView *)v46 layer];
  [v47 setHitTestsAsOpaque:1];

  v48 = [v35 libraryView];
  v49 = [v48 superview];

  [v49 addSubview:v46];
  v50 = [v44 layer];
  v51 = [v50 presentationLayer];
  v52 = v51;
  if (v51)
  {
    id v53 = v51;
  }
  else
  {
    id v53 = [v44 layer];
  }
  v54 = v53;

  [v54 bounds];
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  v63 = [v49 layer];
  objc_msgSend(v54, "convertRect:toLayer:", v63, v56, v58, v60, v62);
  -[_SBHLibraryZoomAnimatorTouchForwardingView setFrame:](v46, "setFrame:");

  [(SBHLibraryZoomAnimator *)self _matchMoveTargetView:v46 withSourceView:v44];
  objc_storeStrong((id *)&self->_sourceTouchForwardingView, v46);
  v64 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
  displayLink = self->_displayLink;
  self->_displayLink = v64;

  v66 = self->_displayLink;
  v67 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v66 addToRunLoop:v67 forMode:*MEMORY[0x1E4F1C4B0]];

  self->_podsWantDisplayLinkInfluencedPositioning = 0;
  _Block_object_dispose(v85, 8);
}

void __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:v3];
  v4 = [SBHTouchPassThroughView alloc];
  [*(id *)(a1 + 40) bounds];
  uint64_t v5 = -[SBHTouchPassThroughView initWithFrame:](v4, "initWithFrame:");
  [(SBHTouchPassThroughView *)v5 setAutoresizingMask:18];
  [*(id *)(a1 + 40) addSubview:v5];
  id v6 = v3;
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v13 = v6;
  if (v7 >= *(void *)(a1 + 64))
  {
    [(SBHTouchPassThroughView *)v5 addSubview:v6];
    [*(id *)(*(void *)(a1 + 32) + 56) addObject:v13];
    [*(id *)(*(void *)(a1 + 32) + 64) addObject:v13];
    [*(id *)(*(void *)(a1 + 32) + 80) addObject:v5];
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    if (v7)
    {
      uint64_t v9 = [*(id *)(a1 + 48) traitCollection];
      objc_super v10 = [v8 backgroundViewForIndex:v7 compatibleWithTraitCollection:v9];

      [*(id *)(a1 + 48) bounds];
      objc_msgSend(v10, "setBounds:");
      BOOL v11 = [[SBHLibraryPodCrossfadeView alloc] initWithBackgroundView:v10 podIconView:v13];
    }
    else
    {
      objc_super v10 = [*(id *)(a1 + 48) matchingCategoryStackView];
      [v10 setInnerIconImageInfoFrozen:1];
      [v10 setNumberOfCategories:1];
      BOOL v11 = [[SBHLibraryPodCrossfadeView alloc] initWithForegroundView:v10 podIconView:v13];
    }
    v12 = v11;

    [(SBHTouchPassThroughView *)v5 addSubview:v12];
    [(SBHLibraryPodCrossfadeView *)v12 setNeedsLayout];
    [(SBHLibraryPodCrossfadeView *)v12 layoutIfNeeded];
    [*(id *)(*(void *)(a1 + 32) + 56) addObject:v12];
    [*(id *)(*(void *)(a1 + 32) + 72) addObject:v12];
    [*(id *)(*(void *)(a1 + 32) + 80) addObject:v5];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

void __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) pauseLayoutForIconView:a2 forReason:@"SBHLibraryZoomAnimatorIconLayoutPauseReason"];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    id v3 = v4;
  }
}

void __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 superview];
  [v3 bringSubviewToFront:v2];
}

void __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_5;
  v6[3] = &unk_1E6AAF7A0;
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = v2;
  uint64_t v8 = v4;
  id v7 = v5;
  [v3 enumerateObjectsUsingBlock:v6];
  [*(id *)(a1 + 32) _configureSearchViewsForEndpoint:*(void *)(a1 + 48) preparing:*(unsigned __int8 *)(a1 + 56) withContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureBackgroundViewForEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureDockIndicatorViewsForEndpoint:*(void *)(a1 + 48) preparing:*(unsigned __int8 *)(a1 + 56) withContext:*(void *)(a1 + 40)];
}

uint64_t __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _configureLayoutForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40) includeYPosition:1];
  [*(id *)(a1 + 32) _configureAlphaForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureScaleForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40) includeYTranslation:0];
  [*(id *)(a1 + 32) _configureCategoryStackAlphaForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureCrossfadeSourceContentForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 32);
  return [v7 _configureCrossfadeDestinationContentForPodViewAtIndex:a3 forEndpoint:v5 withContext:v6];
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  objc_super v10 = [v8 userInfo];
  ++self->_transitionToken;
  self->_endpointAnimatingTo = a3;
  BOOL alreadyAnimating = self->_alreadyAnimating;
  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"SBIconZoomExpansionAnimationWillBeginNotification" object:self];

  id v13 = [v10 podScrollView];
  [v13 contentOffset];
  objc_msgSend(v13, "_setContentOffsetPinned:animated:", 0);
  if ([v8 wantsAnimation])
  {
    BOOL v14 = a3 == 1;
    uint64_t v15 = 2 * (a3 == 1);
    if (alreadyAnimating) {
      uint64_t v15 = (2 * (a3 == 1)) | 4;
    }
    uint64_t v147 = v15;
    uint64_t v139 = (2 * (a3 == 1)) | 4;
    int64_t v149 = a3;
    if (alreadyAnimating) {
      int v16 = 1;
    }
    else {
      int v16 = [v10 shouldUseTranslatingAnimationBehavior];
    }
    v19 = [v10 iconListView];
    unint64_t v20 = [v19 iconColumnsForCurrentOrientation];

    uint64_t v21 = [(NSMutableArray *)self->_flyingPodViews count];
    v148 = v9;
    int v135 = v16;
    uint64_t v133 = [(NSMutableArray *)self->_crossfadeViews count];
    unint64_t v22 = 0;
    if (v21)
    {
      for (unint64_t i = 0; i != v21; ++i)
      {
        if (v22 <= i % v20 + 2 * (i / v20)) {
          unint64_t v22 = i % v20 + 2 * (i / v20);
        }
      }
    }
    v144 = v10;
    id v24 = [v10 libraryPodIconView];
    v25 = [v24 layer];
    v26 = [v25 presentationLayer];
    v27 = v26;
    BOOL v145 = v14;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [v24 layer];
    }
    v29 = v28;

    [v29 bounds];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    v141 = v24;
    v38 = [v24 window];
    v39 = [v38 layer];
    objc_msgSend(v29, "convertRect:toLayer:", v39, v31, v33, v35, v37);
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;

    v48 = [(NSMutableArray *)self->_flyingPodWrapperViews firstObject];
    v49 = [v48 layer];
    v50 = [v49 presentationLayer];
    v51 = v50;
    v140 = v29;
    if (v50)
    {
      id v52 = v50;
    }
    else
    {
      id v52 = [v48 layer];
    }
    id v53 = v52;

    [v53 bounds];
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    double v61 = v60;
    double v62 = [v48 window];
    v63 = [v62 layer];
    v137 = v53;
    objc_msgSend(v53, "convertRect:toLayer:", v63, v55, v57, v59, v61);
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;

    id v72 = [v144 libraryView];
    v73 = [v72 layer];
    id v74 = [v73 presentationLayer];
    int64_t v75 = v74;
    v142 = v13;
    id v143 = v8;
    v136 = v72;
    CGFloat v130 = v71;
    CGFloat v131 = v69;
    CGFloat v76 = v67;
    CGFloat v77 = v65;
    CGFloat v78 = v47;
    CGFloat v79 = v45;
    CGFloat v80 = v43;
    CGFloat v81 = v41;
    if (v74)
    {
      id v82 = v74;
    }
    else
    {
      id v82 = [v72 layer];
    }
    v83 = v82;
    v138 = v48;

    v134 = v83;
    [v83 frame];
    CGFloat v85 = v84;
    CGFloat v87 = v86;
    self->_startTime = CACurrentMediaTime();
    self->_initialLibraryOrigin.x = v85;
    self->_initialLibraryOrigin.y = v87;
    self->_initialSourceContentFrame.origin.x = v81;
    self->_initialSourceContentFrame.origin.y = v80;
    self->_initialSourceContentFrame.size.width = v79;
    self->_initialSourceContentFrame.size.height = v78;
    self->_initialTargetContentFrame.origin.x = v77;
    self->_initialTargetContentFrame.origin.y = v76;
    self->_initialTargetContentFrame.size.width = v131;
    self->_initialTargetContentFrame.size.height = v130;
    self->_podsWantDisplayLinkInfluencedPositioning = 1;
    flyingPodWrapperViews = self->_flyingPodWrapperViews;
    v178[0] = MEMORY[0x1E4F143A8];
    v178[1] = 3221225472;
    v178[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v178[3] = &unk_1E6AAF7F0;
    BOOL v179 = v145;
    v178[4] = self;
    [(NSMutableArray *)flyingPodWrapperViews enumerateObjectsUsingBlock:v178];
    uint64_t v89 = 240;
    if (v149 == 1) {
      uint64_t v89 = 232;
    }
    id v90 = *(id *)((char *)&self->super.isa + v89);
    v91 = [v90 centralAnimationSettings];
    v92 = [v91 BSAnimationSettings];

    v93 = [v90 podFadeSettings];
    v129 = [v93 BSAnimationSettings];

    id v94 = v92;
    v95 = v94;
    if (v135)
    {
      double v96 = 0.0;
      if (v149 == 1) {
        double v96 = 1.0;
      }
      v95 = [(SBHLibraryZoomAnimator *)self _retargetedAnimationSettingsForSettings:v94 normalizedTier:v149 endpoint:v96];
    }
    v132 = v95;
    [v95 duration];
    double v98 = v97;
    [v90 interPodWaveDelay];
    double v100 = v99;
    double v101 = v98 + (double)v22 * v99;
    if (!v135) {
      double v98 = v98 + (double)v22 * v99;
    }
    [v144 noteWillAnimateToEndpoint:v149 withAnimationDuration:v98];
    flyingPodViews = self->_flyingPodViews;
    v162[0] = MEMORY[0x1E4F143A8];
    v162[1] = 3221225472;
    v162[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
    v162[3] = &unk_1E6AAF840;
    unint64_t v169 = v20;
    unint64_t v170 = v22;
    char v176 = v135;
    BOOL v177 = v145;
    id v102 = v94;
    double v171 = v100;
    double v172 = v98;
    id v163 = v102;
    v164 = self;
    int64_t v173 = v149;
    uint64_t v174 = v147;
    id v103 = v144;
    id v165 = v103;
    uint64_t v175 = v21;
    id v168 = v148;
    id v104 = v90;
    id v166 = v104;
    id v167 = v129;
    id v105 = v129;
    [(NSMutableArray *)flyingPodViews enumerateObjectsUsingBlock:v162];
    unint64_t v106 = (v133 - 1) % v20 + 2 * ((v133 - 1) / v20);
    if (v135)
    {
      double v107 = 0.0;
      double v108 = 0.0;
      if (v22) {
        double v108 = (double)v106 / (double)v22;
      }
      v109 = -[SBHLibraryZoomAnimator _retargetedAnimationSettingsForSettings:normalizedTier:endpoint:](self, "_retargetedAnimationSettingsForSettings:normalizedTier:endpoint:", v102, v149, v108, flyingPodViews);
      [v109 duration];
      double v111 = v110;
    }
    else
    {
      [v102 duration];
      double v111 = v112;
      if (v149 == 1) {
        double v107 = v100 * (double)v106;
      }
      else {
        double v107 = v101 - v100 * (double)v106 - v112;
      }
    }
    v113 = objc_msgSend(v103, "libraryIconViewController", flyingPodViews);
    v114 = [v113 dismissalView];

    v115 = (void *)MEMORY[0x1E4FB1EB0];
    v159[0] = MEMORY[0x1E4F143A8];
    v159[1] = 3221225472;
    v159[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_10;
    v159[3] = &unk_1E6AAD728;
    id v160 = v114;
    BOOL v161 = v145;
    id v146 = v114;
    [v115 animateWithDuration:v147 delay:v159 options:0 animations:v111 completion:v107];
    v116 = [v103 searchBar];
    v117 = [v116 layer];
    v118 = [v117 animationForKey:@"opacity"];

    if (v118) {
      uint64_t v119 = v139;
    }
    else {
      uint64_t v119 = v147;
    }
    [v104 relativeSearchDuration];
    v120 = (void *)MEMORY[0x1E4FB1EB0];
    v156[0] = MEMORY[0x1E4F143A8];
    v156[1] = 3221225472;
    v156[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_11;
    v156[3] = &unk_1E6AADF50;
    double v122 = v98 * v121;
    v156[4] = self;
    int64_t v158 = v149;
    id v123 = v103;
    id v157 = v123;
    [v120 animateWithDuration:v119 delay:v156 options:0 animations:v122 completion:0.0];
    [v104 relativeBackgroundDuration];
    double v125 = v98 * v124;
    v126 = (void *)MEMORY[0x1E4FB1EB0];
    v153[0] = MEMORY[0x1E4F143A8];
    v153[1] = 3221225472;
    v153[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_12;
    v153[3] = &unk_1E6AADF50;
    id v154 = v123;
    int64_t v155 = v149;
    v153[4] = self;
    id v127 = v123;
    [v126 animateWithDuration:v147 delay:v153 options:0 animations:v125 completion:0.0];

    id v13 = v142;
    id v8 = v143;
    uint64_t v9 = (void (**)(void))v148;
    id v18 = v141;
  }
  else
  {
    [v10 noteWillAnimateToEndpoint:a3 withAnimationDuration:0.0];
    v17 = (void *)MEMORY[0x1E4FB1EB0];
    v150[0] = MEMORY[0x1E4F143A8];
    v150[1] = 3221225472;
    v150[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_13;
    v150[3] = &unk_1E6AADF50;
    id v151 = v10;
    int64_t v152 = a3;
    v150[4] = self;
    id v18 = v10;
    [v17 performWithoutAnimation:v150];
    if (v9) {
      v9[2](v9);
    }
  }
  self->_BOOL alreadyAnimating = 1;
}

void __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v15 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    int v5 = [v4 _targetViewHasMatchMove:v3];
    uint64_t v6 = [v15 layer];
    id v7 = [v6 presentationLayer];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v15 layer];
    }
    objc_super v10 = v9;

    [v10 position];
    double v12 = v11;
    double v14 = v13;
    [*(id *)(a1 + 32) _removeMatchMoveFromTargetView:v15];
    if (v5) {
      objc_msgSend(v15, "setCenter:", v12, v14);
    }
  }
  else
  {
    [v4 _removePositionAdditionFromTargetView:v3];
  }
}

void __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v80 = a2;
  unint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = a3 % *(void *)(a1 + 80) + 2 * (a3 / *(void *)(a1 + 80));
  if (v5) {
    double v7 = (double)(unint64_t)v6 / (double)v5;
  }
  else {
    double v7 = 0.0;
  }
  if (*(unsigned char *)(a1 + 136) && *(unsigned char *)(a1 + 137)) {
    double v7 = 1.0 - v7;
  }
  id v8 = *(id *)(a1 + 32);
  id v9 = v8;
  if (*(unsigned char *)(a1 + 136))
  {
    objc_super v10 = [*(id *)(a1 + 40) _retargetedAnimationSettingsForSettings:v8 normalizedTier:*(void *)(a1 + 112) endpoint:v7];

    [v10 duration];
    double v12 = v11;
    double v13 = 0.0;
    id v9 = v10;
  }
  else
  {
    [v8 duration];
    double v12 = v14;
    if (*(unsigned char *)(a1 + 137)) {
      double v13 = *(double *)(a1 + 96) * (double)(unint64_t)v6;
    }
    else {
      double v13 = *(double *)(a1 + 104) - (double)(unint64_t)v6 * *(double *)(a1 + 96) - v14;
    }
  }
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0) {
    NSLog(&cfstr_WhyAreWeCalcul.isa);
  }
  id v15 = (void *)MEMORY[0x1E4F4F898];
  int v16 = objc_msgSend(MEMORY[0x1E4F4F898], "factoryWithSettings:", v9, *(void *)&v7);
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
  v106[3] = &unk_1E6AAE228;
  v17 = *(void **)(a1 + 48);
  v106[4] = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 112);
  uint64_t v19 = *(void *)(a1 + 120);
  unint64_t v108 = a3;
  uint64_t v109 = v18;
  id v107 = v17;
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_4;
  v101[3] = &unk_1E6AAF818;
  char v105 = *(unsigned char *)(a1 + 137);
  uint64_t v103 = *(void *)(a1 + 128);
  unint64_t v104 = a3;
  id v102 = *(id *)(a1 + 72);
  [v15 animateWithFactory:v16 additionalDelay:v19 options:v106 actions:v101 completion:v13];

  unint64_t v20 = (void *)[v9 mutableCopy];
  uint64_t v21 = [*(id *)(a1 + 56) zEffectControlPoint1Settings];
  [v21 pointValue];
  double v23 = v22;
  double v25 = v24;

  v26 = [*(id *)(a1 + 56) zEffectControlPoint2Settings];
  [v26 pointValue];
  double v28 = v27;
  double v30 = v29;

  *(float *)&double v31 = v23;
  *(float *)&double v32 = v25;
  *(float *)&double v33 = v28;
  *(float *)&double v34 = v30;
  CGFloat v79 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v31 :v32 :v33 :v34];
  objc_msgSend(v20, "setTimingFunction:");
  double v35 = (void *)MEMORY[0x1E4F4F898];
  double v36 = [MEMORY[0x1E4F4F898] factoryWithSettings:v20];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_5;
  v97[3] = &unk_1E6AAE228;
  double v37 = *(void **)(a1 + 48);
  v97[4] = *(void *)(a1 + 40);
  uint64_t v38 = *(void *)(a1 + 112);
  uint64_t v39 = *(void *)(a1 + 120);
  unint64_t v99 = a3;
  uint64_t v100 = v38;
  id v98 = v37;
  [v35 animateWithFactory:v36 additionalDelay:v39 options:v97 actions:0 completion:v13];

  [*(id *)(a1 + 56) upperPodRelativeCrossfadeDuration];
  double v41 = v12 * v40;
  double v42 = v13 + v12 - v12 * v40;
  if (*(unsigned char *)(a1 + 137)) {
    double v43 = v13;
  }
  else {
    double v43 = v42;
  }
  double v44 = 2.0;
  if (*(unsigned char *)(a1 + 137))
  {
    uint64_t v45 = 0x20000;
  }
  else
  {
    double v44 = 1.0;
    uint64_t v45 = 0x10000;
  }
  double v46 = (void *)MEMORY[0x1E4FB1EB0];
  double v47 = v41 / v44;
  uint64_t v48 = *(void *)(a1 + 120) | v45;
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_6;
  v93[3] = &unk_1E6AAE228;
  v49 = *(void **)(a1 + 48);
  v93[4] = *(void *)(a1 + 40);
  uint64_t v50 = *(void *)(a1 + 112);
  unint64_t v95 = a3;
  uint64_t v96 = v50;
  id v94 = v49;
  [v46 animateWithDuration:v48 delay:v93 options:0 animations:v47 completion:v43];
  double v51 = 2.0;
  if (*(unsigned char *)(a1 + 137))
  {
    double v51 = 1.0;
    uint64_t v52 = 0x10000;
  }
  else
  {
    uint64_t v52 = 0x20000;
  }
  id v53 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v54 = *(void *)(a1 + 120) | v52;
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_7;
  v89[3] = &unk_1E6AAE228;
  double v55 = *(void **)(a1 + 48);
  v89[4] = *(void *)(a1 + 40);
  uint64_t v56 = *(void *)(a1 + 112);
  unint64_t v91 = a3;
  uint64_t v92 = v56;
  double v57 = v41 / v51;
  id v90 = v55;
  [v53 animateWithDuration:v54 delay:v89 options:0 animations:v57 completion:v43];
  [*(id *)(a1 + 56) upperPodRelativeStackAlphaDuration];
  double v59 = v12 * v58;
  double v60 = v13 + v12 - v59;
  double v61 = v13 - v59;
  if (v61 < 0.0) {
    double v61 = 0.0;
  }
  if (*(unsigned char *)(a1 + 137)) {
    uint64_t v62 = 0x20000;
  }
  else {
    uint64_t v62 = 0x10000;
  }
  if (*(unsigned char *)(a1 + 137)) {
    double v63 = v61;
  }
  else {
    double v63 = v60;
  }
  double v64 = (void *)MEMORY[0x1E4FB1EB0];
  double v65 = *(double *)(a1 + 96);
  uint64_t v66 = *(void *)(a1 + 120) | v62;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_8;
  v85[3] = &unk_1E6AAE228;
  double v67 = *(void **)(a1 + 48);
  v85[4] = *(void *)(a1 + 40);
  uint64_t v68 = *(void *)(a1 + 112);
  unint64_t v87 = a3;
  uint64_t v88 = v68;
  id v86 = v67;
  [v64 animateWithDuration:v66 delay:v85 options:0 animations:v65 completion:v63];
  [*(id *)(a1 + 56) podRelativeFadeDelay];
  double v70 = v69;
  id v71 = *(id *)(a1 + 64);
  if (*(unsigned char *)(a1 + 136))
  {
    uint64_t v72 = [*(id *)(a1 + 40) _retargetedAnimationSettingsForSettings:v71 normalizedTier:*(void *)(a1 + 112) endpoint:v78];

    id v71 = (id)v72;
  }
  v73 = (void *)MEMORY[0x1E4F4F898];
  id v74 = [MEMORY[0x1E4F4F898] factoryWithSettings:v71];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_9;
  v81[3] = &unk_1E6AAE228;
  int64_t v75 = *(void **)(a1 + 48);
  v81[4] = *(void *)(a1 + 40);
  uint64_t v76 = *(void *)(a1 + 112);
  uint64_t v77 = *(void *)(a1 + 120);
  unint64_t v83 = a3;
  uint64_t v84 = v76;
  id v82 = v75;
  [v73 animateWithFactory:v74 additionalDelay:v77 options:v81 actions:v13 + v12 * v70];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureLayoutForPodViewAtIndex:*(void *)(a1 + 48) forEndpoint:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40) includeYPosition:0];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_4(uint64_t result)
{
  if (*(unsigned char *)(result + 56)) {
    uint64_t v1 = *(void *)(result + 40) - 1;
  }
  else {
    uint64_t v1 = 0;
  }
  if (*(void *)(result + 48) == v1)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureScaleForPodViewAtIndex:*(void *)(a1 + 48) forEndpoint:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40) includeYTranslation:1];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureCrossfadeDestinationContentForPodViewAtIndex:*(void *)(a1 + 48) forEndpoint:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40)];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureCrossfadeSourceContentForPodViewAtIndex:*(void *)(a1 + 48) forEndpoint:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40)];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureCategoryStackAlphaForPodViewAtIndex:*(void *)(a1 + 48) forEndpoint:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40)];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureAlphaForPodViewAtIndex:*(void *)(a1 + 48) forEndpoint:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40)];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_10(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureSearchViewsForEndpoint:*(void *)(a1 + 48) preparing:0 withContext:*(void *)(a1 + 40)];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureBackgroundViewForEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
}

void __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_14;
  v6[3] = &unk_1E6AAF7A0;
  unint64_t v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = v2;
  uint64_t v8 = v4;
  id v7 = v5;
  [v3 enumerateObjectsUsingBlock:v6];
  [*(id *)(a1 + 32) _configureSearchViewsForEndpoint:*(void *)(a1 + 48) preparing:0 withContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureBackgroundViewForEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _configureLayoutForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40) includeYPosition:1];
  [*(id *)(a1 + 32) _configureAlphaForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureScaleForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40) includeYTranslation:0];
  [*(id *)(a1 + 32) _configureCategoryStackAlphaForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureCrossfadeSourceContentForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 32);
  return [v7 _configureCrossfadeDestinationContentForPodViewAtIndex:a3 forEndpoint:v5 withContext:v6];
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  uint64_t v6 = [a4 userInfo];
  *(_WORD *)&self->_podsWantDisplayLinkInfluencedPositioning = 0;
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v15[3] = &unk_1E6AADF50;
  id v16 = v6;
  int64_t v17 = a3;
  v15[4] = self;
  id v9 = v6;
  [v8 performWithoutAnimation:v15];
  objc_super v10 = [(_UIPortalView *)self->_presentationSourcePortalView window];
  double v11 = [v10 windowScene];
  [v11 _synchronizeDrawing];

  [(BSInvalidatable *)self->_presentationSourceOrderingAssertion invalidate];
  presentationSourceOrderingAssertion = self->_presentationSourceOrderingAssertion;
  self->_presentationSourceOrderingAssertion = 0;

  [(_UIPortalView *)self->_presentationSourcePortalView setSourceView:0];
  [(_UIPortalView *)self->_presentationSourcePortalView removeFromSuperview];
  presentationSourcePortalView = self->_presentationSourcePortalView;
  self->_presentationSourcePortalView = 0;

  [(UIView *)self->_sourceTouchForwardingView removeFromSuperview];
  sourceTouchForwardingView = self->_sourceTouchForwardingView;
  self->_sourceTouchForwardingView = 0;
}

void __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _configureDockIndicatorViewsForEndpoint:*(void *)(a1 + 48) preparing:0 withContext:*(void *)(a1 + 40)];
  if (!*(void *)(a1 + 48))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 56);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_2;
    v18[3] = &unk_1E6AAF7A0;
    v18[4] = v2;
    uint64_t v20 = 1;
    id v19 = *(id *)(a1 + 40);
    [v3 enumerateObjectsUsingBlock:v18];
    [*(id *)(a1 + 32) _configureSearchViewsForEndpoint:1 preparing:0 withContext:*(void *)(a1 + 40)];
  }
  uint64_t v4 = [*(id *)(a1 + 40) iconListView];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_3;
  v16[3] = &unk_1E6AAEB78;
  id v6 = v4;
  id v17 = v6;
  [v5 enumerateObjectsUsingBlock:v16];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  id v7 = [*(id *)(a1 + 32) pauseLayoutAssertions];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) invalidate];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v21 count:16];
    }
    while (v9);
  }
  [*(id *)(a1 + 32) setPauseLayoutAssertions:0];
  [v6 layoutIconsNow];
  [*(id *)(*(void *)(a1 + 32) + 80) enumerateObjectsUsingBlock:&__block_literal_global_47];
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
}

uint64_t __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _configureLayoutForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40) includeYPosition:1];
  [*(id *)(a1 + 32) _configureAlphaForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureScaleForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40) includeYTranslation:0];
  [*(id *)(a1 + 32) _configureCategoryStackAlphaForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureCrossfadeSourceContentForPodViewAtIndex:a3 forEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 32);
  return [v7 _configureCrossfadeDestinationContentForPodViewAtIndex:a3 forEndpoint:v5 withContext:v6];
}

void __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v4;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v8];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v3 icon];
  id v7 = [v5 displayedIconViewForIcon:v6];

  if (v7 == v3) {
    [*(id *)(a1 + 32) addSubview:v3];
  }
}

uint64_t __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (id)_retargetedAnimationSettingsForSettings:(id)a3 normalizedTier:(double)a4 endpoint:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = 240;
  if (a5 == 1) {
    uint64_t v9 = 232;
  }
  id v10 = *(id *)((char *)&self->super.isa + v9);
  if ([v8 isSpringAnimation])
  {
    id v11 = v8;
    long long v12 = [v10 retargetedMassSettings];
    long long v13 = [v10 retargetedStiffnessSettings];
    long long v14 = [v10 retargetedInitialVelocitySettings];
    [v11 damping];
    double v16 = v15;
    [v11 stiffness];
    double v18 = v17;
    [v11 mass];
    double v20 = sqrt(v18 * v19);
    double v21 = v16 / (v20 + v20);
    [v12 lowerBoundFactor];
    double v23 = v22;
    [v11 mass];
    double v25 = v23 * v24;
    [v12 upperBoundFactor];
    double v27 = v26;
    [v11 mass];
    double v29 = v27 * v28 * a4 + (1.0 - a4) * v25;
    [v13 lowerBoundFactor];
    double v31 = v30;
    [v11 stiffness];
    double v33 = v31 * v32;
    [v13 upperBoundFactor];
    double v35 = v34;
    [v11 stiffness];
    double v37 = v35 * v36 * a4 + (1.0 - a4) * v33;
    [v14 lowerBoundFactor];
    double v39 = v38;
    [v11 initialVelocity];
    double v41 = v39 * v40;
    [v14 upperBoundFactor];
    double v43 = v42;
    [v11 initialVelocity];
    double v45 = v43 * v44 * a4 + (1.0 - a4) * v41;
    double v46 = (void *)[v11 mutableCopy];

    [v46 setInitialVelocity:v45];
    [v46 setStiffness:v37];
    [v46 setDamping:(v21 + v21) * sqrt(v29 * v37)];
    [v46 setMass:v29];
  }
  else
  {
    long long v12 = [v10 retargetedBasicDurationSettings];
    [v12 lowerBoundFactor];
    double v48 = v47;
    [v8 duration];
    double v50 = v48 * v49;
    [v12 upperBoundFactor];
    double v52 = v51;
    [v8 duration];
    double v54 = v52 * v53 * a4 + (1.0 - a4) * v50;
    double v46 = (void *)[v8 mutableCopy];
    [v46 setDuration:v54];
  }

  return v46;
}

- (void)_displayLinkFired:(id)a3
{
  if (self->_podsWantDisplayLinkInfluencedPositioning)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    int64_t endpointAnimatingTo = self->_endpointAnimatingTo;
    uint64_t v6 = [WeakRetained libraryPodIconView];
    flyingPodViews = self->_flyingPodViews;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__SBHLibraryZoomAnimator__displayLinkFired___block_invoke;
    v9[3] = &unk_1E6AAF7A0;
    id v10 = v6;
    int64_t v11 = endpointAnimatingTo;
    v9[4] = self;
    id v8 = v6;
    [(NSMutableArray *)flyingPodViews enumerateObjectsUsingBlock:v9];
  }
}

void __44__SBHLibraryZoomAnimator__displayLinkFired___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 layer];
  long long v4 = [v3 animationForKey:@"position"];

  if (v4)
  {
    uint64_t v5 = [v4 beginTimeMode];
    uint64_t v6 = (void *)*MEMORY[0x1E4F39D60];

    if (v5 == v6) {
      double v7 = 0.0;
    }
    else {
      double v7 = *(double *)(*(void *)(a1 + 32) + 88);
    }
    [v4 beginTime];
    CFTimeInterval v9 = v7 + v8;
    CFTimeInterval v10 = CACurrentMediaTime();
    uint64_t v11 = *(void *)(a1 + 48);
    if (v10 >= v9)
    {
      if (v11) {
        goto LABEL_12;
      }
      long long v12 = [v14 superview];
      if (([*(id *)(a1 + 32) _targetViewHasMatchMove:v12] & 1) == 0)
      {
        long long v13 = *(double **)(a1 + 32);
        objc_msgSend(v13, "_matchMoveTargetView:withSourceView:usingSourceFrame:targetFrame:", v12, *(void *)(a1 + 40), v13[15], v13[16], v13[17], v13[18], v13[19], v13[20], v13[21], v13[22]);
      }
    }
    else
    {
      if (v11 != 1) {
        goto LABEL_12;
      }
      long long v12 = [v14 superview];
      objc_msgSend(*(id *)(a1 + 32), "_addPositionToTargetView:matchingSourceView:initialSourceFrame:", v12, *(void *)(a1 + 40), *(double *)(*(void *)(a1 + 32) + 120), *(double *)(*(void *)(a1 + 32) + 128), *(double *)(*(void *)(a1 + 32) + 136), *(double *)(*(void *)(a1 + 32) + 144));
    }
  }
LABEL_12:
}

- (void)_configureBackgroundViewForEndpoint:(int64_t)a3 withContext:(id)a4
{
  if (a3 == 1) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [a4 backgroundView];
  [v5 setWeighting:v4];
}

- (void)_configureSearchViewsForEndpoint:(int64_t)a3 preparing:(BOOL)a4 withContext:(id)a5
{
  if (a3 != 1 || !a4)
  {
    if (a3 == 1) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    double v8 = [a5 searchBar];
    [v8 setAlpha:v7];
    if (a3 == 1)
    {
      [(SBHLibraryWaveZoomSettings *)self->_closeSettings searchScale];
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v13.c = v9;
      *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    else
    {
      [(SBHLibraryWaveZoomSettings *)self->_openSettings searchScale];
      memset(&v13, 0, sizeof(v13));
      CGAffineTransformMakeScale(&v13, v10, v10);
    }
    uint64_t v11 = [v8 searchTextField];
    CGAffineTransform v12 = v13;
    [v11 setTransform:&v12];
  }
}

- (void)_configureLayoutForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5 includeYPosition:(BOOL)a6
{
  id v10 = a5;
  uint64_t v11 = [(NSMutableArray *)self->_flyingPodViews objectAtIndex:a3];
  CGAffineTransform v12 = [(SBHLibraryZoomAnimator *)self _flyingPodIconViewAtIndex:a3];
  [(SBHLibraryZoomAnimator *)self _targetFrameForPodView:v11 atIndex:a3 forEndpoint:a4 withContext:v10];
  double v14 = v13;
  if (a4)
  {
    -[SBHLibraryZoomAnimator _setIconImageInfo:forPodViewAtIndex:](self, "_setIconImageInfo:forPodViewAtIndex:", a3, self->_libraryIconImageInfo.size.width, self->_libraryIconImageInfo.size.height, self->_libraryIconImageInfo.scale, self->_libraryIconImageInfo.continuousCornerRadius);
    [v12 setIconLabelAlpha:1.0];
    [v12 layoutIfNeeded];
    [v11 layoutIfNeeded];
    double v15 = [v12 customIconImageViewController];
    double v16 = [v15 iconListView];
    double v17 = v16;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v33 = *MEMORY[0x1E4F1DAB8];
    long long v34 = v18;
    long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v19 = (CGAffineTransform *)&v33;
  }
  else
  {
    [v11 bounds];
    double v21 = v14 / v20;
    [(SBHLibraryZoomAnimator *)self _iconImageInfoForPodViewAtIndex:a3];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = [v10 libraryPodIconView];
    [v28 iconImageInfo];
    double v30 = v29 / v21;

    -[SBHLibraryZoomAnimator _setIconImageInfo:forPodViewAtIndex:](self, "_setIconImageInfo:forPodViewAtIndex:", a3, v23, v25, v27, v30);
    [v12 setIconLabelAlpha:0.0];
    [v12 layoutIfNeeded];
    [v11 layoutIfNeeded];
    double v15 = [v12 customIconImageViewController];
    double v17 = [v15 iconListView];
    CGAffineTransformMakeScale(&v36, 0.875, 0.875);
    double v19 = &v36;
    double v16 = v17;
  }
  objc_msgSend(v16, "setTransform:", v19, v33, v34, v35);

  UIRectGetCenter();
  double v32 = v31;
  if (!a6) {
    [v11 center];
  }
  [v11 setCenter:v32];
}

- (void)_configureCrossfadeDestinationContentForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5
{
  if ([(NSMutableArray *)self->_crossfadeViews count] > a3)
  {
    double v8 = [(NSMutableArray *)self->_crossfadeViews objectAtIndex:a3];
    id v10 = v8;
    double v9 = 0.0;
    if (a4 == 1) {
      double v9 = 1.0;
    }
    [v8 setPodIconViewCrossfadeFraction:v9];
  }
}

- (void)_configureCrossfadeSourceContentForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5
{
  if ([(NSMutableArray *)self->_crossfadeViews count] > a3)
  {
    double v8 = [(NSMutableArray *)self->_crossfadeViews objectAtIndex:a3];
    id v10 = v8;
    double v9 = 0.0;
    if (a4 == 1) {
      double v9 = 1.0;
    }
    [v8 setSourceViewCrossfadeFraction:v9];
  }
}

- (void)_configureAlphaForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5
{
  if ([(NSMutableArray *)self->_crossfadeViews count] <= a3)
  {
    double v8 = [(NSMutableArray *)self->_flyingPodViews objectAtIndex:a3];
    id v10 = v8;
    double v9 = 0.0;
    if (a4 == 1) {
      double v9 = 1.0;
    }
    [v8 setAlpha:v9];
  }
}

- (void)_configureScaleForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5 includeYTranslation:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  uint64_t v11 = [(NSMutableArray *)self->_flyingPodViews objectAtIndex:a3];
  memset(&v26, 0, sizeof(v26));
  if (!a4)
  {
    [(SBHLibraryZoomAnimator *)self _sourceFrameForPodViewAtIndex:a3 inCoordinateSpace:0 withContext:v10];
    double v17 = v16;
    long long v18 = [v10 libraryPodIconView];
    [v18 iconContentScale];
    double v20 = v19;

    [v11 bounds];
    CGAffineTransformMakeScale(&v26, v20 * (v17 / v21), v20 * (v17 / v21));
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v26.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v26.c = v12;
  *(_OWORD *)&v26.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (v6)
  {
LABEL_3:
    [(SBHLibraryZoomAnimator *)self _targetFrameForPodView:v11 atIndex:a3 forEndpoint:a4 withContext:v10];
    UIRectGetCenter();
    double v14 = v13;
    [v11 center];
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeTranslation(&v25, 0.0, v14 - v15);
    CGAffineTransform t1 = v26;
    CGAffineTransform v22 = v25;
    CGAffineTransformConcat(&v24, &t1, &v22);
    CGAffineTransform v26 = v24;
  }
LABEL_4:
  CGAffineTransform v25 = v26;
  [v11 setTransform:&v25];
}

- (void)_configureCategoryStackAlphaForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5
{
  id v15 = a5;
  if (a3 && [(NSMutableArray *)self->_crossfadeViews count] > a3)
  {
    double v8 = [(NSMutableArray *)self->_flyingPodViews objectAtIndex:a3];
    double v9 = [v15 libraryIconViewController];
    id v10 = [v9 categoryStackView];

    double v11 = 1.0;
    double v12 = 1.0;
    if (a4 != 1)
    {
      objc_msgSend(v10, "alphaForStackedViewAtIndex:", a3, 1.0);
      double v11 = 0.0;
    }
    [v8 setAlpha:v12];
    double v13 = [(NSMutableArray *)self->_crossfadeViews objectAtIndex:a3];
    double v14 = [v13 podIconView];
    [v14 setIconImageAlpha:v11];
  }
}

- (void)_configureDockIndicatorViewsForEndpoint:(int64_t)a3 preparing:(BOOL)a4 withContext:(id)a5
{
  if (a3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = a4;
  }
  if (v5) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  if (a3 == 1) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  id v10 = [a5 libraryIconViewController];
  double v8 = [v10 categoryStackView];
  [v8 setAlpha:v6];

  double v9 = [v10 dismissalView];
  [v9 setAlpha:v7];
}

- (id)_flyingPodIconViewAtIndex:(unint64_t)a3
{
  BOOL v5 = -[NSMutableArray objectAtIndex:](self->_flyingPodViews, "objectAtIndex:");
  if ([(NSMutableArray *)self->_crossfadeViews count] <= a3)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v5 podIconView];
  }
  double v7 = v6;

  return v7;
}

- (SBIconImageInfo)_iconImageInfoForPodViewAtIndex:(SEL)a3
{
  BOOL v5 = [(NSMutableArray *)self->_flyingPodViews objectAtIndex:a4];
  [(NSMutableArray *)self->_crossfadeViews count];
  [v5 iconImageInfo];

  return result;
}

- (void)_setIconImageInfo:(SBIconImageInfo *)a3 forPodViewAtIndex:(unint64_t)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  -[NSMutableArray objectAtIndex:](self->_flyingPodViews, "objectAtIndex:", a3, a4);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_crossfadeViews count];
  objc_msgSend(v13, "setIconImageInfo:", v11, v10, v9, v8);
}

- (CGRect)_targetFrameForPodView:(id)a3 atIndex:(unint64_t)a4 forEndpoint:(int64_t)a5 withContext:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  double v12 = v11;
  if (a5)
  {
    id v13 = [v10 iconListView];

    id v10 = [(NSMutableArray *)self->_libraryIconViews objectAtIndex:a4];
    double v14 = [v10 icon];
    [v13 rectForIcon:v14];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = [v12 superview];

    objc_msgSend(v13, "convertRect:toView:", v23, v16, v18, v20, v22);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
  }
  else
  {
    id v13 = [v11 superview];

    [(SBHLibraryZoomAnimator *)self _sourceFrameForPodViewAtIndex:a4 inCoordinateSpace:v13 withContext:v10 forUnscaledPositioning:1];
    double v25 = v32;
    double v27 = v33;
    double v29 = v34;
    double v31 = v35;
  }

  double v36 = v25;
  double v37 = v27;
  double v38 = v29;
  double v39 = v31;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (CGRect)_sourceFrameForPodViewAtIndex:(unint64_t)a3 inCoordinateSpace:(id)a4 withContext:(id)a5
{
  [(SBHLibraryZoomAnimator *)self _sourceFrameForPodViewAtIndex:a3 inCoordinateSpace:a4 withContext:a5 forUnscaledPositioning:0];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_sourceFrameForPodViewAtIndex:(unint64_t)a3 inCoordinateSpace:(id)a4 withContext:(id)a5 forUnscaledPositioning:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__SBHLibraryZoomAnimator__sourceFrameForPodViewAtIndex_inCoordinateSpace_withContext_forUnscaledPositioning___block_invoke;
  aBlock[3] = &unk_1E6AAF868;
  id v12 = v10;
  id v53 = v12;
  id v13 = v11;
  id v54 = v13;
  double v55 = self;
  double v14 = (double (**)(void *, void *))_Block_copy(aBlock);
  double v15 = [v13 libraryPodIconView];
  if (v15)
  {
    if (a3 && [(NSMutableArray *)self->_crossfadeViews count] > a3)
    {
      if (a3 >= 2) {
        unint64_t v16 = 2;
      }
      else {
        unint64_t v16 = a3;
      }
      double v17 = [v13 libraryIconViewController];
      double v18 = [v17 categoryStackView];

      if (v6)
      {
        [v15 bounds];
        CGFloat v50 = v19;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        [v15 iconContentScale];
        CGFloat v27 = v26;
        [v18 frameForStackedViewAtIndex:v16];
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;
        CGFloat v35 = v34;
        CGAffineTransformMakeScale(&v51, v27, v27);
        v56.origin.x = v29;
        v56.origin.y = v31;
        v56.size.width = v33;
        v56.size.height = v35;
        CGRectApplyAffineTransform(v56, &v51);
        v57.origin.x = v50;
        v57.origin.y = v21;
        v57.size.width = v23;
        v57.size.height = v25;
        CGRectGetWidth(v57);
        UIRectCenteredRect();
      }
      else
      {
        [v18 frameForStackedViewAtIndex:v16];
      }
      double v36 = v14[2](v14, v15);
      double v38 = v43;
      double v40 = v44;
      double v42 = v45;
    }
    else
    {
      [v15 bounds];
      double v36 = v14[2](v14, v15);
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
    }
  }
  else
  {
    NSLog(&cfstr_ShouldAlwaysHa.isa);
    double v36 = *MEMORY[0x1E4F1DB28];
    double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v46 = v36;
  double v47 = v38;
  double v48 = v40;
  double v49 = v42;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

double __109__SBHLibraryZoomAnimator__sourceFrameForPodViewAtIndex_inCoordinateSpace_withContext_forUnscaledPositioning___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  id v12 = v11;
  if (*(void *)(a1 + 32))
  {
    id v13 = [v11 layer];
    double v14 = [v13 presentationLayer];
    double v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v12 layer];
    }
    double v17 = v16;

    double v18 = [v12 window];
    double v19 = [v18 layer];
    objc_msgSend(v17, "convertRect:toLayer:", v19, a3, a4, a5, a6);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    double v28 = [*(id *)(a1 + 40) libraryView];
    objc_msgSend(v28, "convertRect:toView:", *(void *)(a1 + 32), v21, v23, v25, v27);
    double v30 = v29;

    a3 = v30 - *(double *)(*(void *)(a1 + 48) + 104);
  }

  return a3;
}

- (void)_matchMoveTargetView:(id)a3 withSourceView:(id)a4
{
  id v53 = a3;
  id v6 = a4;
  double v7 = [v6 layer];
  double v8 = [v7 presentationLayer];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 layer];
  }
  id v11 = v10;

  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [v6 window];
  double v21 = [v20 layer];
  objc_msgSend(v11, "convertRect:toLayer:", v21, v13, v15, v17, v19);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = [v53 layer];
  CGFloat v31 = [v30 presentationLayer];
  double v32 = v31;
  if (v31)
  {
    id v33 = v31;
  }
  else
  {
    id v33 = [v53 layer];
  }
  double v34 = v33;

  [v34 bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v43 = [v53 window];
  double v44 = [v43 layer];
  objc_msgSend(v34, "convertRect:toLayer:", v44, v36, v38, v40, v42);
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;

  -[SBHLibraryZoomAnimator _matchMoveTargetView:withSourceView:usingSourceFrame:targetFrame:](self, "_matchMoveTargetView:withSourceView:usingSourceFrame:targetFrame:", v53, v6, v23, v25, v27, v29, v46, v48, v50, v52);
}

- (void)_matchMoveTargetView:(id)a3 withSourceView:(id)a4 usingSourceFrame:(CGRect)a5 targetFrame:(CGRect)a6
{
  double y = a5.origin.y;
  double x = a5.origin.x;
  v19[1] = *MEMORY[0x1E4F143B8];
  double v9 = (void *)MEMORY[0x1E4F39C00];
  id v10 = a4;
  id v11 = a3;
  double v12 = [v9 animation];
  double v13 = [v10 layer];

  [v12 setSourceLayer:v13];
  [v12 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v12 setRemovedOnCompletion:0];
  [v12 setDuration:INFINITY];
  [v12 setAppliesY:1];
  [v12 setAppliesX:1];
  UIRectGetCenter();
  double v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v14 - x, v15 - y);
  v19[0] = v16;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v12 setSourcePoints:v17];

  double v18 = [v11 layer];

  [v18 addAnimation:v12 forKey:@"SBHLibraryPodViewMatchMoveKey"];
}

- (BOOL)_targetViewHasMatchMove:(id)a3
{
  id v3 = [a3 layer];
  double v4 = [v3 animationForKey:@"SBHLibraryPodViewMatchMoveKey"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_removeMatchMoveFromTargetView:(id)a3
{
  id v3 = [a3 layer];
  [v3 removeAnimationForKey:@"SBHLibraryPodViewMatchMoveKey"];
}

- (void)_addPositionToTargetView:(id)a3 matchingSourceView:(id)a4 initialSourceFrame:(CGRect)a5
{
  double y = a5.origin.y;
  id v28 = a4;
  id v7 = a3;
  double v8 = [v28 layer];
  double v9 = [v8 presentationLayer];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v28 layer];
  }
  double v12 = v11;

  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = [v28 window];
  double v22 = [v21 layer];
  objc_msgSend(v12, "convertRect:toLayer:", v22, v14, v16, v18, v20);
  double v24 = v23;

  double v25 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.y"];
  double v26 = [NSNumber numberWithDouble:v24 - y];
  [v25 setFromValue:v26];

  [v25 setToValue:&unk_1F300ED10];
  [v25 setAdditive:1];
  [v25 setDuration:0.05];
  double v27 = [v7 layer];

  [v27 addAnimation:v25 forKey:@"SBHLibraryPodViewAdditivePositionKey"];
}

- (void)_removePositionAdditionFromTargetView:(id)a3
{
  id v3 = [a3 layer];
  [v3 removeAnimationForKey:@"SBHLibraryPodViewAdditivePositionKey"];
}

- (NSArray)pauseLayoutAssertions
{
  return self->_pauseLayoutAssertions;
}

- (void)setPauseLayoutAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseLayoutAssertions, 0);
  objc_storeStrong((id *)&self->_closeSettings, 0);
  objc_storeStrong((id *)&self->_openSettings, 0);
  objc_storeStrong((id *)&self->_sourceTouchForwardingView, 0);
  objc_storeStrong((id *)&self->_presentationSourcePortalView, 0);
  objc_storeStrong((id *)&self->_presentationSourceOrderingAssertion, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_flyingPodWrapperViews, 0);
  objc_storeStrong((id *)&self->_crossfadeViews, 0);
  objc_storeStrong((id *)&self->_fadingPodViews, 0);
  objc_storeStrong((id *)&self->_flyingPodViews, 0);
  objc_storeStrong((id *)&self->_libraryIconViews, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end