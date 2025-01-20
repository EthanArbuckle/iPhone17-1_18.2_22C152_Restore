@interface UIInputWindowControllerHostingItem
- (BOOL)_isForDragToDismiss;
- (BOOL)_isForSelf:(id)a3;
- (BOOL)_isForSplitKeyboard;
- (BOOL)_shouldShowInputDockView;
- (BOOL)animatingBackdrops;
- (BOOL)dontDismissReachability;
- (BOOL)hideInputAssistantBackdrop;
- (BOOL)hideInputView;
- (BOOL)hideInputViewBackdrops;
- (BOOL)isChangingPlacement;
- (BOOL)isOnScreenRotating;
- (BOOL)keyboardController;
- (BOOL)scrollKeyboardActive;
- (BOOL)useCombinedBackdrop;
- (CGPoint)positionConstraintConstant;
- (CGRect)fullInputViewAndAssistantFrame;
- (CGRect)fullScreenFrame;
- (CGRect)notificationsFrame;
- (CGRect)visibleFrame;
- (TUIInputAssistantHostView)inputAssistantHostView;
- (UIEdgeInsets)_aligningInsetsForChildInputViewController:(id)a3 includeSceneBounds:(BOOL)a4;
- (UIEdgeInsets)inputViewPadding;
- (UIFlickingAssistantViewSupport)flickingAssistantViewSupport;
- (UIInputSetHostView)hostView;
- (UIInputViewSet)inputViewSet;
- (UIInputViewSetPlacement)placement;
- (UIInputViewSetPlacementApplicator)applicator;
- (UIInputWindowController)owner;
- (UIInputWindowControllerHosting)container;
- (UIInputWindowControllerHostingItem)initWithContainer:(id)a3;
- (UIKBInputBackdropView)_inputAccessoryBackdropView;
- (UIKBInputBackdropView)_inputAssistantBackdropView;
- (UIKBInputBackdropView)_inputBackdropView;
- (UISplitKeyboardSupport)splitKeyboardController;
- (UIView)containerView;
- (UIView)dockView;
- (UIView)floatingKeyboardMaskView;
- (UIView)inputAccessoryView;
- (UIView)inputAssistantView;
- (UIView)inputView;
- (UIView)scrollTrackingView;
- (UIView)view;
- (_UIKBLightEffectsBackground)_inputCombinedBackdropView;
- (_UIRemoteKeyboardControllerDelegate)controllerDelegate;
- (double)offsetForSplitTransition;
- (id)_updateOrCreateConstraintInDict:(id)a3 key:(id)a4 fromItem:(id)a5 toItem:(id)a6 tracker:(id)a7 creator:(id)a8;
- (id)constructNotificationInfoForScrollWithMode:(unint64_t)a3;
- (id)inputAccessoryViewController;
- (id)inputAssistantViewController;
- (id)inputViewController;
- (id)ownerView;
- (id)viewMatchingConstraintForAttribute:(int64_t)a3 primaryView:(id)a4 secondaryView:(id)a5;
- (int64_t)inputViewBackdropStyle;
- (void)_fillInNotificationInfo:(id)a3 forDismissMode:(unint64_t)a4;
- (void)_updateBackdropViews;
- (void)checkPlaceholdersForRemoteKeyboards;
- (void)cleanUpLightEffectsTransition;
- (void)clearInputAccessoryViewEdgeConstraints;
- (void)clearInputAssistantViewEdgeConstraints;
- (void)clearInputViewEdgeConstraints;
- (void)clearInteractiveTransitionStateIfNecessary;
- (void)clearVisibilityConstraints;
- (void)completeTransition:(id)a3 withInfo:(id)a4;
- (void)configureDockViewController:(BOOL)a3;
- (void)configureFlickingAssistantViewController:(BOOL)a3;
- (void)configureScrollDismissController:(BOOL)a3;
- (void)configureSplitKeyboardController:(BOOL)a3;
- (void)createAnimationMatchWithInfo:(id)a3;
- (void)dealloc;
- (void)didFinishTranslation;
- (void)didFinishTranslationFromPlacement:(id)a3 to:(id)a4;
- (void)disableViewSizingConstraints:(unint64_t)a3 forNewView:(id)a4;
- (void)enumerateBoundingRects:(id)a3;
- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4;
- (void)finalizeTransitionToRenderConfig:(id)a3;
- (void)finishScrollViewTransition;
- (void)finishSplitTransition;
- (void)finishSplitTransition:(BOOL)a3;
- (void)initializeTranslateGestureRecognizerIfNecessary;
- (void)performAnimatedTransitionToRenderConfig:(id)a3;
- (void)placementNeedsUpdate:(id)a3;
- (void)prepareForSplitTransition;
- (void)prepareTranslationFromPlacement:(id)a3 to:(id)a4;
- (void)rebuildConstraints:(id)a3 forView:(id)a4 toMatchView:(id)a5 tracker:(id)a6;
- (void)refreshApplicator;
- (void)removeInputAssistantHostView;
- (void)removeMatchMoveAnimationIfNeeded;
- (void)resetBackdropHeight;
- (void)resetInputViewVisibility;
- (void)resetPlacement;
- (void)resetVerticalConstraint;
- (void)setAccessoryViewVisible:(BOOL)a3 delay:(double)a4;
- (void)setAnimatingBackdrops:(BOOL)a3;
- (void)setApplicator:(id)a3;
- (void)setCombinedBackdropView:(id)a3;
- (void)setControllerDelegate:(id)a3;
- (void)setDontDismissReachability:(BOOL)a3;
- (void)setFloatingKeyboardMaskView:(id)a3;
- (void)setHideInputAssistantBackdrop:(BOOL)a3;
- (void)setHideInputView:(BOOL)a3;
- (void)setHideInputViewBackdrops:(BOOL)a3;
- (void)setHostView:(id)a3;
- (void)setInputAccessoryBackdropView:(id)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setInputAssistantBackdropView:(id)a3;
- (void)setInputAssistantView:(id)a3;
- (void)setInputBackdropView:(id)a3;
- (void)setInputView:(id)a3;
- (void)setInterfaceAutorotationDisabled:(BOOL)a3;
- (void)setPlacement;
- (void)setPlacement:(id)a3;
- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6;
- (void)someViewDidLayoutSubviews;
- (void)startTransition:(id)a3 withInfo:(id)a4;
- (void)transitionDidFinish:(BOOL)a3;
- (void)transitionInAnimatedForRenderConfig:(id)a3;
- (void)updateCombinedBackdropView;
- (void)updateCombinedBackdropViewAnimated:(BOOL)a3 forKeyboardUp:(BOOL)a4;
- (void)updateConstraintInsets;
- (void)updateEmptyHeightConstraint;
- (void)updateForKeyplaneChangeWithContext:(id)a3;
- (void)updateInputAccessoryBackdropView;
- (void)updateInputAssistantBackdropView;
- (void)updateInputAssistantViewLayering;
- (void)updateInputBackdropView;
- (void)updateInputBackdropViewVisibility;
- (void)updateKeyboardDockViewVisibility;
- (void)updateProgress:(double)a3 startHeight:(double)a4 endHeight:(double)a5;
- (void)updateRenderConfigForCombinedBackdrop:(id)a3;
- (void)updateSupportsDockViewController;
- (void)updateTransition:(id)a3 withInfo:(id)a4;
- (void)updateViewConstraints;
- (void)updateViewSizingConstraints;
- (void)updateViewSizingConstraints:(id)a3;
- (void)updateVisibilityConstraintsForPlacement:(id)a3;
- (void)willBeginTranslation;
- (void)willBeginTranslationFromPlacement:(id)a3 to:(id)a4;
@end

@implementation UIInputWindowControllerHostingItem

- (void)setDontDismissReachability:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIInputWindowControllerHostingItem *)self owner];
  [v4 setDontDismissReachability:v3];
}

- (BOOL)isOnScreenRotating
{
  v2 = [(UIInputWindowControllerHostingItem *)self owner];
  char v3 = [v2 isOnScreenRotating];

  return v3;
}

- (UIView)containerView
{
  v2 = [(UIInputWindowControllerHostingItem *)self owner];
  char v3 = [v2 view];

  return (UIView *)v3;
}

- (UIInputSetHostView)hostView
{
  return self->_hostView;
}

- (void)setHideInputViewBackdrops:(BOOL)a3
{
  if (a3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [(UIView *)self->_inputBackdropView setAlpha:v5];
  [(UIView *)self->_inputAccessoryBackdropView setAlpha:v5];
  if (![(UIInputWindowControllerHostingItem *)self useCombinedBackdrop] || !a3)
  {
    inputCombinedBackdropView = self->_inputCombinedBackdropView;
    [(UIView *)inputCombinedBackdropView setAlpha:v5];
  }
}

- (BOOL)useCombinedBackdrop
{
  double v5 = [(UIInputWindowControllerHostingItem *)self owner];
  v6 = [v5 view];
  v7 = [v6 _inheritedRenderConfig];
  char v8 = [v7 animatedBackground];
  if ((v8 & 1) != 0
    || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), v2 = objc_claimAutoreleasedReturnValue(), [v2 restorableRenderConfig], char v3 = objc_claimAutoreleasedReturnValue(), (objc_msgSend(v3, "animatedBackground") & 1) != 0)|| -[UIInputWindowControllerHostingItem animatingBackdrops](self, "animatingBackdrops"))
  {
    v9 = [(UIInputWindowControllerHostingItem *)self owner];
    v10 = [v9 expectedPlacement];
    int v11 = [v10 isFloatingAssistantView] ^ 1;

    if (v8) {
      goto LABEL_8;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

LABEL_8:
  return v11;
}

- (BOOL)animatingBackdrops
{
  return self->_animatingBackdrops;
}

- (void)updateInputAssistantViewLayering
{
  id v11 = [(UIInputWindowControllerHostingItem *)self inputAssistantView];
  char v3 = [(UIInputWindowControllerHostingItem *)self inputView];
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled])
  {
    id v4 = [v11 superview];
    if (v4 != self->_hostView)
    {
LABEL_3:

      goto LABEL_5;
    }
    double v5 = [v3 superview];
    hostView = self->_hostView;

    if (v5 == hostView)
    {
      v7 = +[UIKeyboardInputModeController sharedInputModeController];
      id v4 = [v7 currentInputMode];

      int v8 = [(UIInputSetHostView *)v4 isEmojiInputMode];
      v9 = self->_hostView;
      if (v8)
      {
        v10 = [(UIInputWindowControllerHostingItem *)self inputView];
        [(UIView *)v9 insertSubview:v11 belowSubview:v10];
      }
      else
      {
        [(UIView *)self->_hostView bringSubviewToFront:v11];
      }
      goto LABEL_3;
    }
  }
LABEL_5:
}

- (void)updateViewConstraints
{
  v401[3] = *MEMORY[0x1E4F143B8];
  char v3 = [(UIInputWindowControllerHostingItem *)self container];
  char v4 = [v3 useCrescendoHostingItem];

  if ((v4 & 1) == 0)
  {
    double v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:100];
    v6 = [(UIInputWindowControllerHostingItem *)self owner];
    unint64_t v7 = 0x1E4F5B000uLL;
    if ([v6 isRotating])
    {
      uint64_t v8 = [(NSMutableDictionary *)self->_inputViewEdgeConstraints count];

      if (v8)
      {
        v9 = [(UIInputWindowControllerHostingItem *)self owner];
        [v9 updateKeyboardDockViewVisibility];

        [(UIInputWindowControllerHostingItem *)self updateViewSizingConstraints:v5];
        [MEMORY[0x1E4F5B268] activateConstraints:v5];
        [(UIInputWindowControllerHostingItem *)self updateConstraintInsets];
LABEL_139:

        return;
      }
    }
    else
    {
    }
    [(UIInputWindowControllerHostingItem *)self updateViewSizingConstraints:v5];
    [MEMORY[0x1E4F5B268] activateConstraints:v5];
    [v5 removeAllObjects];
    uint64_t v10 = [(UIInputWindowControllerHostingItem *)self inputView];
    id v11 = [(UIInputWindowControllerHostingItem *)self inputAssistantView];
    v12 = [(UIInputWindowControllerHostingItem *)self inputAccessoryView];
    v13 = v11;
    if (+[UIKeyboardImpl shouldMergeAssistantBarWithKeyboardLayout])
    {

      v14 = 0;
    }
    v15 = [(id)v10 superview];
    hostView = self->_hostView;

    v270 = v12;
    BOOL v265 = v15 == hostView;
    if (v15 != hostView)
    {
      if ([(NSMutableDictionary *)self->_inputViewEdgeConstraints count]) {
        [(UIInputWindowControllerHostingItem *)self clearInputViewEdgeConstraints];
      }
      goto LABEL_82;
    }
    [(NSLayoutConstraint *)self->_emptyHeightConstraint setActive:0];
    if (+[UIKeyboard usesInputSystemUI]
      && !+[UIKeyboard usesLocalKeyboard])
    {
    }
    else if (v14)
    {
      int v17 = 1;
      v18 = v14;
      goto LABEL_19;
    }
    if (!v12)
    {
      id v261 = [(UIInputWindowControllerHostingItem *)self hostView];

      v14 = 0;
      int v17 = 0;
LABEL_20:
      v267 = v14;
      if (v12) {
        int v19 = 1;
      }
      else {
        int v19 = v17;
      }
      if (v19) {
        uint64_t v20 = 4;
      }
      else {
        uint64_t v20 = 3;
      }
      if (!self->_inputViewEdgeConstraints)
      {
        v21 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
        inputViewEdgeConstraints = self->_inputViewEdgeConstraints;
        self->_inputViewEdgeConstraints = v21;
      }
      v23 = [(UIInputWindowControllerHostingItem *)self inputViewController];
      [(UIInputWindowControllerHostingItem *)self _aligningInsetsForChildInputViewController:v23 includeSceneBounds:0];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;

      v32 = self->_inputViewEdgeConstraints;
      v33 = self->_hostView;
      v393[0] = MEMORY[0x1E4F143A8];
      v393[1] = 3221225472;
      v393[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke;
      v393[3] = &unk_1E52FC1B8;
      uint64_t v263 = v10;
      id v34 = (id)v10;
      id v394 = v34;
      v395 = self;
      double v396 = v25;
      double v397 = v27;
      double v398 = v29;
      double v399 = v31;
      v35 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v32 key:&unk_1ED3F52C8 fromView:v34 toView:v33 tracker:v5 creator:v393];
      [v35 setConstant:v27];

      v36 = self->_inputViewEdgeConstraints;
      v37 = self->_hostView;
      v386[0] = MEMORY[0x1E4F143A8];
      v386[1] = 3221225472;
      v386[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_2;
      v386[3] = &unk_1E52FC1B8;
      id v38 = v34;
      id v387 = v38;
      v388 = self;
      double v389 = v25;
      double v390 = v27;
      double v391 = v29;
      double v392 = v31;
      v39 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v36 key:&unk_1ED3F52E0 fromView:v38 toView:v37 tracker:v5 creator:v386];
      [v39 setConstant:v31];

      if ([v261 isDescendantOfView:self->_hostView])
      {
        v40 = self->_inputViewEdgeConstraints;
        v378[0] = MEMORY[0x1E4F143A8];
        v378[1] = 3221225472;
        v378[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_3;
        v378[3] = &unk_1E52FC1E0;
        id v379 = v38;
        id v380 = v261;
        uint64_t v381 = v20;
        double v382 = v25;
        double v383 = v27;
        double v384 = v29;
        double v385 = v31;
        v41 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v40 key:&unk_1ED3F52F8 fromView:v379 toView:v380 tracker:v5 creator:v378];
        [v41 setConstant:v25];
      }
      v42 = self->_inputViewEdgeConstraints;
      uint64_t v368 = MEMORY[0x1E4F143A8];
      uint64_t v369 = 3221225472;
      v370 = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_4;
      v371 = &unk_1E52FC1B8;
      id v372 = v38;
      v373 = self;
      double v374 = v25;
      double v375 = v27;
      double v376 = v29;
      double v377 = v31;
      id v256 = v372;
      v43 = -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v42, &unk_1ED3F5310);
      [v43 setConstant:v29];

      v44 = self->_inputBackdropView;
      if ([(UIView *)v44 isDescendantOfView:self->_hostView])
      {
        if (!self->_inputBackdropBackgroundViewEdgeConstraints)
        {
          v45 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
          inputBackdropBackgroundViewEdgeConstraints = self->_inputBackdropBackgroundViewEdgeConstraints;
          self->_inputBackdropBackgroundViewEdgeConstraints = v45;
        }
        v47 = self->_inputBackdropBackgroundView;
        v12 = v270;
        if ([(UIView *)v47 isDescendantOfView:self->_hostView])
        {
          v48 = self->_inputBackdropBackgroundViewEdgeConstraints;
          v49 = self->_hostView;
          v365[0] = MEMORY[0x1E4F143A8];
          v365[1] = 3221225472;
          v365[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_5;
          v365[3] = &unk_1E52FC208;
          v50 = v47;
          v366 = v50;
          v367 = self;
          id v51 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v48 key:&unk_1ED3F52C8 fromView:v50 toView:v49 tracker:v5 creator:v365];
          v52 = self->_inputBackdropBackgroundViewEdgeConstraints;
          v53 = self->_hostView;
          v362[0] = MEMORY[0x1E4F143A8];
          v362[1] = 3221225472;
          v362[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_6;
          v362[3] = &unk_1E52FC208;
          v54 = v50;
          v363 = v54;
          v364 = self;
          id v55 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v52 key:&unk_1ED3F52E0 fromView:v54 toView:v53 tracker:v5 creator:v362];
          v56 = self->_inputBackdropBackgroundViewEdgeConstraints;
          v359[0] = MEMORY[0x1E4F143A8];
          v359[1] = 3221225472;
          v359[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_7;
          v359[3] = &unk_1E52FC208;
          v57 = v54;
          v360 = v57;
          id v58 = v256;
          id v361 = v58;
          v59 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v56 key:&unk_1ED3F52F8 fromView:v57 toView:v58 tracker:v5 creator:v359];
          [v59 setConstant:v25];

          v60 = self->_inputBackdropBackgroundViewEdgeConstraints;
          v356[0] = MEMORY[0x1E4F143A8];
          v356[1] = 3221225472;
          v356[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_8;
          v356[3] = &unk_1E52FC208;
          v357 = v57;
          id v61 = v58;
          unint64_t v7 = 0x1E4F5B000;
          id v358 = v61;
          id v62 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v60 key:@"height" fromView:v357 toView:v61 tracker:v5 creator:v356];
        }
        inputBackdropViewEdgeConstraints = self->_inputBackdropViewEdgeConstraints;
        if (!inputBackdropViewEdgeConstraints)
        {
          v64 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
          v65 = self->_inputBackdropViewEdgeConstraints;
          self->_inputBackdropViewEdgeConstraints = v64;

          inputBackdropViewEdgeConstraints = self->_inputBackdropViewEdgeConstraints;
        }
        [(UIInputWindowControllerHostingItem *)self rebuildConstraints:inputBackdropViewEdgeConstraints forView:v44 toMatchView:self->_inputBackdropBackgroundView tracker:v5];
      }
      else
      {
        if ([(NSMutableDictionary *)self->_inputBackdropViewEdgeConstraints count])
        {
          v66 = (void *)MEMORY[0x1E4F5B268];
          v67 = [(NSMutableDictionary *)self->_inputBackdropViewEdgeConstraints allValues];
          [v66 deactivateConstraints:v67];

          [(NSMutableDictionary *)self->_inputBackdropViewEdgeConstraints removeAllObjects];
        }
        v12 = v270;
        if ([(NSMutableDictionary *)self->_inputBackdropBackgroundViewEdgeConstraints count])
        {
          v68 = (void *)MEMORY[0x1E4F5B268];
          v69 = [(NSMutableDictionary *)self->_inputBackdropBackgroundViewEdgeConstraints allValues];
          [v68 deactivateConstraints:v69];

          [(NSMutableDictionary *)self->_inputBackdropBackgroundViewEdgeConstraints removeAllObjects];
        }
      }
      inputCombinedBackdropView = self->_inputCombinedBackdropView;
      v71 = [(UIInputWindowControllerHostingItem *)self ownerView];
      LODWORD(inputCombinedBackdropView) = [(UIView *)inputCombinedBackdropView isDescendantOfView:v71];

      inputCombinedBackdropViewEdgeConstraints = self->_inputCombinedBackdropViewEdgeConstraints;
      if (inputCombinedBackdropView)
      {
        if (!inputCombinedBackdropViewEdgeConstraints)
        {
          v73 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
          v74 = self->_inputCombinedBackdropViewEdgeConstraints;
          self->_inputCombinedBackdropViewEdgeConstraints = v73;
        }
        v257 = v13;
        v75 = [(UIInputWindowControllerHostingItem *)self applicator];
        v76 = [v75 backdropContainer];
        v77 = v76;
        if (v76)
        {
          id v78 = v76;
        }
        else
        {
          id v78 = [(UIInputWindowControllerHostingItem *)self ownerView];
        }
        v83 = v256;

        v84 = self->_inputCombinedBackdropView;
        v85 = self->_inputCombinedBackdropViewEdgeConstraints;
        v353[0] = MEMORY[0x1E4F143A8];
        v353[1] = 3221225472;
        v353[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_9;
        v353[3] = &unk_1E52FC208;
        v86 = v84;
        v354 = v86;
        id v87 = v78;
        id v355 = v87;
        v88 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v85 key:&unk_1ED3F52F8 fromView:v86 toView:v87 tracker:v5 creator:v353];
        [v88 setConstant:0.0];

        v89 = self->_inputCombinedBackdropViewEdgeConstraints;
        v350[0] = MEMORY[0x1E4F143A8];
        v350[1] = 3221225472;
        v350[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_10;
        v350[3] = &unk_1E52FC208;
        v90 = v86;
        v351 = v90;
        id v91 = v87;
        id v352 = v91;
        v92 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v89 key:&unk_1ED3F52C8 fromView:v90 toView:v91 tracker:v5 creator:v350];
        [v92 setConstant:0.0];

        v93 = self->_inputCombinedBackdropViewEdgeConstraints;
        v347[0] = MEMORY[0x1E4F143A8];
        v347[1] = 3221225472;
        v347[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_11;
        v347[3] = &unk_1E52FC208;
        id v94 = v91;
        id v348 = v94;
        v95 = v90;
        v349 = v95;
        v96 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v93 key:&unk_1ED3F5310 fromView:v94 toView:v95 tracker:v5 creator:v347];
        [v96 setConstant:0.0];

        v97 = self->_inputCombinedBackdropViewEdgeConstraints;
        v344[0] = MEMORY[0x1E4F143A8];
        v344[1] = 3221225472;
        v344[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_12;
        v344[3] = &unk_1E52FC208;
        id v98 = v94;
        id v345 = v98;
        v99 = v95;
        v346 = v99;
        v100 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v97 key:&unk_1ED3F52E0 fromView:v98 toView:v99 tracker:v5 creator:v344];
        [v100 setConstant:0.0];

        if (v256)
        {
          v101 = [v256 superview];

          if (v101)
          {
            v102 = [(UIInputWindowControllerHostingItem *)self applicator];
            v103 = [v102 backdropContainer];
            v104 = v103;
            if (v103)
            {
              id v105 = v103;
            }
            else
            {
              id v105 = [(UIInputWindowControllerHostingItem *)self hostView];
            }
            if (!self->_backdropInnerGuideConstraints)
            {
              v106 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              backdropInnerGuideConstraints = self->_backdropInnerGuideConstraints;
              self->_backdropInnerGuideConstraints = v106;
            }
            id v254 = v98;
            v108 = self->_inputCombinedBackdropView;
            v401[0] = v256;
            v401[1] = v108;
            v401[2] = v105;
            uint64_t v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:v401 count:3];
            v253 = [(NSMutableDictionary *)self->_backdropInnerGuideConstraints objectForKey:@"items"];
            v110 = (void *)v109;
            if (([v253 isEqual:v109] & 1) == 0)
            {
              id v252 = v105;
              v111 = v44;
              long long v343 = 0u;
              long long v342 = 0u;
              long long v341 = 0u;
              long long v340 = 0u;
              uint64_t v112 = [&unk_1ED3F0808 countByEnumeratingWithState:&v340 objects:v400 count:16];
              if (v112)
              {
                uint64_t v113 = v112;
                uint64_t v114 = *(void *)v341;
                do
                {
                  for (uint64_t i = 0; i != v113; ++i)
                  {
                    if (*(void *)v341 != v114) {
                      objc_enumerationMutation(&unk_1ED3F0808);
                    }
                    v116 = [(NSMutableDictionary *)self->_backdropInnerGuideConstraints objectForKey:*(void *)(*((void *)&v340 + 1) + 8 * i)];
                    [v116 setActive:0];
                  }
                  uint64_t v113 = [&unk_1ED3F0808 countByEnumeratingWithState:&v340 objects:v400 count:16];
                }
                while (v113);
              }
              [(NSMutableDictionary *)self->_backdropInnerGuideConstraints removeAllObjects];
              v44 = v111;
              v83 = v256;
              id v105 = v252;
            }
            [(NSMutableDictionary *)self->_backdropInnerGuideConstraints setObject:v110 forKey:@"items"];
            v117 = self->_backdropInnerGuideConstraints;
            v118 = [(_UIKBLightEffectsBackground *)self->_inputCombinedBackdropView fullBackdropLayoutGuide];
            v338[0] = MEMORY[0x1E4F143A8];
            v338[1] = 3221225472;
            v338[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_13;
            v338[3] = &unk_1E52FC208;
            v338[4] = self;
            id v119 = v105;
            id v339 = v119;
            v120 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v117 key:&unk_1ED3F52F8 fromItem:v118 toItem:v119 tracker:v5 creator:v338];
            [v120 setConstant:0.0];

            v121 = self->_backdropInnerGuideConstraints;
            v122 = [(_UIKBLightEffectsBackground *)self->_inputCombinedBackdropView fullBackdropLayoutGuide];
            v336[0] = MEMORY[0x1E4F143A8];
            v336[1] = 3221225472;
            v336[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_14;
            v336[3] = &unk_1E52FC208;
            v336[4] = self;
            id v123 = v119;
            id v337 = v123;
            v124 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v121 key:&unk_1ED3F52C8 fromItem:v122 toItem:v123 tracker:v5 creator:v336];
            [v124 setConstant:0.0];

            v125 = self->_backdropInnerGuideConstraints;
            v126 = [(_UIKBLightEffectsBackground *)self->_inputCombinedBackdropView fullBackdropLayoutGuide];
            v333[0] = MEMORY[0x1E4F143A8];
            v333[1] = 3221225472;
            v333[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_15;
            v333[3] = &unk_1E52FC208;
            id v127 = v123;
            id v334 = v127;
            v335 = self;
            v128 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v125 key:&unk_1ED3F5310 fromItem:v127 toItem:v126 tracker:v5 creator:v333];
            [v128 setConstant:0.0];

            v129 = self->_backdropInnerGuideConstraints;
            v130 = [(_UIKBLightEffectsBackground *)self->_inputCombinedBackdropView fullBackdropLayoutGuide];
            v330[0] = MEMORY[0x1E4F143A8];
            v330[1] = 3221225472;
            v330[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_16;
            v330[3] = &unk_1E52FC208;
            id v131 = v127;
            id v331 = v131;
            v332 = self;
            v132 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v129 key:&unk_1ED3F52E0 fromItem:v131 toItem:v130 tracker:v5 creator:v330];
            [v132 setConstant:0.0];

            v133 = self->_backdropInnerGuideConstraints;
            v134 = [(_UIKBLightEffectsBackground *)self->_inputCombinedBackdropView assistantLayoutGuide];
            v329[0] = MEMORY[0x1E4F143A8];
            v329[1] = 3221225472;
            v329[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_17;
            v329[3] = &unk_1E52FC230;
            v329[4] = self;
            v135 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v133 key:@"inputBackdropGuides.assistantTop" fromItem:v134 toItem:v131 tracker:v5 creator:v329];
            [v135 setConstant:0.0];

            v136 = self->_backdropInnerGuideConstraints;
            v137 = [(_UIKBLightEffectsBackground *)self->_inputCombinedBackdropView assistantLayoutGuide];
            v326[0] = MEMORY[0x1E4F143A8];
            v326[1] = 3221225472;
            v326[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_18;
            v326[3] = &unk_1E52FC208;
            id v327 = v83;
            v328 = self;
            v138 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v136 key:@"inputBackdropGuides.assistantBottom" fromItem:v327 toItem:v137 tracker:v5 creator:v326];
            [v138 setConstant:0.0];

            v12 = v270;
            id v98 = v254;
          }
        }

        unint64_t v7 = 0x1E4F5B000uLL;
        v13 = v257;
      }
      else
      {
        if ([(NSMutableDictionary *)inputCombinedBackdropViewEdgeConstraints count])
        {
          v79 = *(void **)(v7 + 616);
          v80 = [(NSMutableDictionary *)self->_inputCombinedBackdropViewEdgeConstraints allValues];
          [v79 deactivateConstraints:v80];

          [(NSMutableDictionary *)self->_inputCombinedBackdropViewEdgeConstraints removeAllObjects];
        }
        if ([(NSMutableDictionary *)self->_backdropInnerGuideConstraints count])
        {
          [(NSMutableDictionary *)self->_backdropInnerGuideConstraints removeObjectForKey:@"items"];
          v81 = *(void **)(v7 + 616);
          v82 = [(NSMutableDictionary *)self->_backdropInnerGuideConstraints allValues];
          [v81 deactivateConstraints:v82];

          [(NSMutableDictionary *)self->_backdropInnerGuideConstraints removeAllObjects];
        }
      }
      v139 = [(UIInputWindowControllerHostingItem *)self dockView];
      v140 = [v139 superview];
      v141 = v140;
      if (v140 == self->_hostView)
      {
        BOOL v142 = [(UIInputWindowControllerHostingItem *)self _shouldShowInputDockView];

        if (v142)
        {
          v255 = v44;
          v258 = v13;
          unint64_t v143 = v7;
          inputDockViewEdgeConstraints = self->_inputDockViewEdgeConstraints;
          if (!inputDockViewEdgeConstraints)
          {
            v145 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            v146 = self->_inputDockViewEdgeConstraints;
            self->_inputDockViewEdgeConstraints = v145;

            inputDockViewEdgeConstraints = self->_inputDockViewEdgeConstraints;
          }
          v147 = self->_hostView;
          v323[0] = MEMORY[0x1E4F143A8];
          v323[1] = 3221225472;
          v323[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_19;
          v323[3] = &unk_1E52FC208;
          id v148 = v139;
          id v324 = v148;
          v325 = self;
          v149 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:inputDockViewEdgeConstraints key:&unk_1ED3F52C8 fromView:v148 toView:v147 tracker:v5 creator:v323];
          [v149 setConstant:0.0];

          v150 = self->_inputDockViewEdgeConstraints;
          v151 = self->_hostView;
          v320[0] = MEMORY[0x1E4F143A8];
          v320[1] = 3221225472;
          v320[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_20;
          v320[3] = &unk_1E52FC208;
          id v152 = v148;
          id v321 = v152;
          v322 = self;
          v153 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v150 key:&unk_1ED3F52E0 fromView:v152 toView:v151 tracker:v5 creator:v320];
          [v153 setConstant:0.0];

          v154 = [v256 superview];
          v155 = self->_hostView;

          if (v154 == v155)
          {
            v156 = self->_inputDockViewEdgeConstraints;
            v317[0] = MEMORY[0x1E4F143A8];
            v317[1] = 3221225472;
            v317[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_21;
            v317[3] = &unk_1E52FC208;
            id v318 = v152;
            id v319 = v256;
            id v157 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v156 key:&unk_1ED3F52F8 fromView:v318 toView:v319 tracker:v5 creator:v317];
          }
          v158 = self->_inputDockViewEdgeConstraints;
          v159 = self->_hostView;
          v314[0] = MEMORY[0x1E4F143A8];
          v314[1] = 3221225472;
          v314[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_22;
          v314[3] = &unk_1E52FC208;
          id v315 = v152;
          v316 = self;
          id v160 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v158 key:&unk_1ED3F5310 fromView:v315 toView:v159 tracker:v5 creator:v314];

          unint64_t v7 = v143;
          v12 = v270;
          v13 = v258;
          v44 = v255;
          goto LABEL_81;
        }
      }
      else
      {
      }
      if ([(NSMutableDictionary *)self->_inputDockViewEdgeConstraints count])
      {
        v161 = *(void **)(v7 + 616);
        v162 = [(NSMutableDictionary *)self->_inputDockViewEdgeConstraints allValues];
        [v161 deactivateConstraints:v162];

        [(NSMutableDictionary *)self->_inputDockViewEdgeConstraints removeAllObjects];
      }
LABEL_81:

      uint64_t v10 = v263;
      v14 = v267;
LABEL_82:
      v163 = [(UIView *)v13 superview];
      v164 = self->_hostView;

      if (v163 == v164)
      {
        [(NSLayoutConstraint *)self->_emptyHeightConstraint setActive:0];
        if (v12)
        {
          id v266 = v12;
        }
        else
        {
          id v266 = [(UIInputWindowControllerHostingItem *)self hostView];
        }
        v268 = v14;
        if (v10)
        {
          id v262 = (id)v10;
          uint64_t v168 = 3;
        }
        else
        {
          id v262 = [(UIInputWindowControllerHostingItem *)self hostView];

          uint64_t v168 = 4;
        }
        uint64_t v259 = v168;
        uint64_t v264 = v10;
        unint64_t v169 = v7;
        if (v12) {
          uint64_t v170 = 4;
        }
        else {
          uint64_t v170 = 3;
        }
        if (!self->_assistantViewEdgeConstraints)
        {
          v171 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
          assistantViewEdgeConstraints = self->_assistantViewEdgeConstraints;
          self->_assistantViewEdgeConstraints = v171;
        }
        v173 = [(UIInputWindowControllerHostingItem *)self inputAssistantViewController];
        [(UIInputWindowControllerHostingItem *)self _aligningInsetsForChildInputViewController:v173 includeSceneBounds:0];
        uint64_t v175 = v174;
        double v177 = v176;
        uint64_t v179 = v178;
        double v181 = v180;

        v182 = self->_assistantViewEdgeConstraints;
        v183 = self->_hostView;
        v307[0] = MEMORY[0x1E4F143A8];
        v307[1] = 3221225472;
        v307[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_23;
        v307[3] = &unk_1E52FC1B8;
        v184 = v13;
        v308 = v184;
        v309 = self;
        uint64_t v310 = v175;
        double v311 = v177;
        uint64_t v312 = v179;
        double v313 = v181;
        v185 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v182 key:&unk_1ED3F52C8 fromView:v184 toView:v183 tracker:v5 creator:v307];
        [v185 setConstant:v177];

        v186 = self->_assistantViewEdgeConstraints;
        v187 = self->_hostView;
        v300[0] = MEMORY[0x1E4F143A8];
        v300[1] = 3221225472;
        v300[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_24;
        v300[3] = &unk_1E52FC1B8;
        v188 = v184;
        v301 = v188;
        v302 = self;
        uint64_t v303 = v175;
        double v304 = v177;
        uint64_t v305 = v179;
        double v306 = v181;
        v189 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v186 key:&unk_1ED3F52E0 fromView:v188 toView:v187 tracker:v5 creator:v300];
        [v189 setConstant:v181];

        if ([v266 isDescendantOfView:self->_hostView])
        {
          v190 = self->_assistantViewEdgeConstraints;
          v296[0] = MEMORY[0x1E4F143A8];
          v296[1] = 3221225472;
          v296[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_25;
          v296[3] = &unk_1E52FC258;
          v297 = v188;
          id v298 = v266;
          uint64_t v299 = v170;
          v191 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v190 key:&unk_1ED3F52F8 fromView:v297 toView:v298 tracker:v5 creator:v296];
          [v191 setConstant:0.0];
        }
        unint64_t v7 = v169;
        if (+[UIKeyboardImpl shouldMergeAssistantBarWithKeyboardLayout])
        {
          v192 = [(NSMutableDictionary *)self->_assistantViewEdgeConstraints objectForKey:&unk_1ED3F5310];
          [v5 removeObject:v192];

          v193 = [(NSMutableDictionary *)self->_assistantViewEdgeConstraints objectForKey:&unk_1ED3F5310];
          [v193 setActive:0];

          [(NSMutableDictionary *)self->_assistantViewEdgeConstraints removeObjectForKey:&unk_1ED3F5310];
          v14 = v268;
          v194 = v262;
        }
        else
        {
          v194 = v262;
          v14 = v268;
          if ([v262 isDescendantOfView:self->_hostView])
          {
            v195 = self->_assistantViewEdgeConstraints;
            v292[0] = MEMORY[0x1E4F143A8];
            v292[1] = 3221225472;
            v292[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_26;
            v292[3] = &unk_1E52FC258;
            v293 = v188;
            id v294 = v262;
            uint64_t v295 = v259;
            v196 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v195 key:&unk_1ED3F5310 fromView:v293 toView:v294 tracker:v5 creator:v292];
            [v196 setConstant:0.0];
          }
        }
        v197 = self->_inputAssistantBackdropView;
        BOOL v198 = [(UIView *)v197 isDescendantOfView:self->_hostView];
        assistantBackdropViewEdgeConstraints = self->_assistantBackdropViewEdgeConstraints;
        if (v198)
        {
          if (!assistantBackdropViewEdgeConstraints)
          {
            v200 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
            v201 = self->_assistantBackdropViewEdgeConstraints;
            self->_assistantBackdropViewEdgeConstraints = v200;

            assistantBackdropViewEdgeConstraints = self->_assistantBackdropViewEdgeConstraints;
          }
          [(UIInputWindowControllerHostingItem *)self rebuildConstraints:assistantBackdropViewEdgeConstraints forView:v197 toMatchView:v188 tracker:v5];
          v202 = [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints objectForKey:&unk_1ED3F52C8];
          [v202 setConstant:-v177];

          v203 = [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints objectForKey:&unk_1ED3F52E0];
          [v203 setConstant:-v181];
        }
        else if ([(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints count])
        {
          v204 = *(void **)(v7 + 616);
          v205 = [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints allValues];
          [v204 deactivateConstraints:v205];

          [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints removeAllObjects];
        }

        char v167 = 1;
        uint64_t v10 = v264;
        v12 = v270;
      }
      else
      {
        if ([(NSMutableDictionary *)self->_assistantViewEdgeConstraints count])
        {
          [(UIInputWindowControllerHostingItem *)self clearInputAssistantViewEdgeConstraints];
          if ([(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints count])
          {
            v165 = *(void **)(v7 + 616);
            v166 = [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints allValues];
            [v165 deactivateConstraints:v166];

            [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints removeAllObjects];
          }
        }
        char v167 = v265;
      }
      v206 = [v12 superview];
      v207 = self->_hostView;

      if (v206 == v207)
      {
        [(NSLayoutConstraint *)self->_emptyHeightConstraint setActive:0];
        v208 = v14;
        if (!v14)
        {
          v208 = (UIInputSetHostView *)v10;
          if (!v10) {
            v208 = self->_hostView;
          }
        }
        v269 = v14;
        v209 = v208;
        if ((unint64_t)v14 | v10) {
          uint64_t v210 = 3;
        }
        else {
          uint64_t v210 = 4;
        }
        v211 = [(UIInputWindowControllerHostingItem *)self owner];
        int v212 = [v211 forceAccessoryViewToBottomOfHostView];

        if (v212)
        {
          v213 = self->_hostView;

          uint64_t v210 = 4;
          v209 = v213;
        }
        v260 = v13;
        accessoryViewEdgeConstraints = self->_accessoryViewEdgeConstraints;
        if (accessoryViewEdgeConstraints)
        {
          uint64_t v215 = v10;
          if ([(NSMutableDictionary *)accessoryViewEdgeConstraints count])
          {
            v216 = [(UIInputWindowControllerHostingItem *)self owner];
            int v217 = [v216 isTransitioningBetweenKeyboardStates];

            if (v217) {
              [(UIInputWindowControllerHostingItem *)self clearInputAccessoryViewEdgeConstraints];
            }
          }
        }
        else
        {
          uint64_t v215 = v10;
          v218 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
          v219 = self->_accessoryViewEdgeConstraints;
          self->_accessoryViewEdgeConstraints = v218;
        }
        v220 = [(UIInputWindowControllerHostingItem *)self inputAccessoryViewController];
        [(UIInputWindowControllerHostingItem *)self _aligningInsetsForChildInputViewController:v220 includeSceneBounds:1];
        double v222 = v221;
        double v224 = v223;
        double v226 = v225;
        double v228 = v227;

        v229 = self->_accessoryViewEdgeConstraints;
        v230 = self->_hostView;
        v285[0] = MEMORY[0x1E4F143A8];
        v285[1] = 3221225472;
        v285[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_27;
        v285[3] = &unk_1E52FC1B8;
        id v231 = v12;
        id v286 = v231;
        v287 = self;
        double v288 = v222;
        double v289 = v224;
        double v290 = v226;
        double v291 = v228;
        v232 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v229 key:&unk_1ED3F52C8 fromView:v231 toView:v230 tracker:v5 creator:v285];
        [v232 setConstant:v224];

        v233 = self->_accessoryViewEdgeConstraints;
        v234 = self->_hostView;
        v278[0] = MEMORY[0x1E4F143A8];
        v278[1] = 3221225472;
        v278[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_28;
        v278[3] = &unk_1E52FC1B8;
        id v235 = v231;
        id v279 = v235;
        v280 = self;
        double v281 = v222;
        double v282 = v224;
        double v283 = v226;
        double v284 = v228;
        v236 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v233 key:&unk_1ED3F52E0 fromView:v235 toView:v234 tracker:v5 creator:v278];
        [v236 setConstant:v228];

        v237 = self->_accessoryViewEdgeConstraints;
        v238 = self->_hostView;
        v275[0] = MEMORY[0x1E4F143A8];
        v275[1] = 3221225472;
        v275[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_29;
        v275[3] = &unk_1E52FC208;
        id v239 = v235;
        id v276 = v239;
        v277 = self;
        v240 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v237 key:&unk_1ED3F52F8 fromView:v239 toView:v238 tracker:v5 creator:v275];
        [v240 setConstant:v222];

        if ([(UIView *)v209 isDescendantOfView:self->_hostView])
        {
          v241 = self->_accessoryViewEdgeConstraints;
          v271[0] = MEMORY[0x1E4F143A8];
          v271[1] = 3221225472;
          v271[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_30;
          v271[3] = &unk_1E52FC258;
          id v272 = v239;
          v273 = v209;
          uint64_t v274 = v210;
          v242 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v241 key:&unk_1ED3F5310 fromView:v272 toView:v273 tracker:v5 creator:v271];
          [v242 setConstant:v226];
        }
        v243 = self->_inputAccessoryBackdropView;
        BOOL v244 = [(UIView *)v243 isDescendantOfView:self->_hostView];
        accessoryBackdropViewEdgeConstraints = self->_accessoryBackdropViewEdgeConstraints;
        uint64_t v10 = v215;
        if (v244)
        {
          unint64_t v246 = 0x1E4F5B000;
          if (!accessoryBackdropViewEdgeConstraints)
          {
            v247 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
            v248 = self->_accessoryBackdropViewEdgeConstraints;
            self->_accessoryBackdropViewEdgeConstraints = v247;

            accessoryBackdropViewEdgeConstraints = self->_accessoryBackdropViewEdgeConstraints;
          }
          [(UIInputWindowControllerHostingItem *)self rebuildConstraints:accessoryBackdropViewEdgeConstraints forView:v243 toMatchView:v239 tracker:v5];
        }
        else
        {
          unint64_t v246 = 0x1E4F5B000uLL;
          if ([(NSMutableDictionary *)self->_accessoryBackdropViewEdgeConstraints count])
          {
            v249 = (void *)MEMORY[0x1E4F5B268];
            v250 = [(NSMutableDictionary *)self->_accessoryBackdropViewEdgeConstraints allValues];
            [v249 deactivateConstraints:v250];

            [(NSMutableDictionary *)self->_accessoryBackdropViewEdgeConstraints removeAllObjects];
          }
        }

        [*(id *)(v246 + 616) activateConstraints:v5];
        v14 = v269;
        v12 = v270;
        v13 = v260;
      }
      else
      {
        if ([(NSMutableDictionary *)self->_accessoryViewEdgeConstraints count]) {
          [(UIInputWindowControllerHostingItem *)self clearInputAccessoryViewEdgeConstraints];
        }
        [*(id *)(v7 + 616) activateConstraints:v5];
        if ((v167 & 1) == 0) {
          [(NSLayoutConstraint *)self->_emptyHeightConstraint setActive:1];
        }
      }
      [(UIInputWindowControllerHostingItem *)self updateConstraintInsets];
      v251 = [(UIInputWindowControllerHostingItem *)self placement];
      [(UIInputWindowControllerHostingItem *)self updateVisibilityConstraintsForPlacement:v251];

      goto LABEL_139;
    }
    int v17 = 0;
    v14 = 0;
    v18 = v12;
LABEL_19:
    id v261 = v18;
    goto LABEL_20;
  }
}

- (UIView)inputView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if ([WeakRetained host:self isForPurpose:100])
  {
    char v4 = [(UIInputWindowControllerHostingItem *)self owner];
    double v5 = [v4 _inputView];
  }
  else
  {
    double v5 = 0;
  }

  return (UIView *)v5;
}

- (UIView)inputAssistantView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if ([WeakRetained host:self isForPurpose:102])
  {
    char v4 = [(UIInputWindowControllerHostingItem *)self owner];
    double v5 = [v4 _inputAssistantView];
  }
  else
  {
    double v5 = 0;
  }

  return (UIView *)v5;
}

- (UIInputWindowController)owner
{
  v2 = [(UIInputWindowControllerHostingItem *)self container];
  char v3 = [v2 owner];

  return (UIInputWindowController *)v3;
}

- (UIInputWindowControllerHosting)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (UIInputWindowControllerHosting *)WeakRetained;
}

- (UIInputViewSet)inputViewSet
{
  char v3 = [(UIInputWindowControllerHostingItem *)self owner];
  char v4 = [v3 inputViewSet];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  uint64_t v6 = [WeakRetained host:self isForPurpose:100];
  id v7 = objc_loadWeakRetained((id *)&self->_container);
  uint64_t v8 = [v7 host:self isForPurpose:101];
  id v9 = objc_loadWeakRetained((id *)&self->_container);
  uint64_t v10 = +[UIInputViewSet inputSetWithOriginalInputSet:duplicateInputView:duplicateInputAccessoryView:duplicateInputAssistantView:](UIInputViewSet, "inputSetWithOriginalInputSet:duplicateInputView:duplicateInputAccessoryView:duplicateInputAssistantView:", v4, v6, v8, [v9 host:self isForPurpose:102]);

  return (UIInputViewSet *)v10;
}

- (void)refreshApplicator
{
  id v6 = [(UIInputWindowControllerHostingItem *)self placement];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ![(UIKBInputBackdropView *)self->_inputBackdropView _isTransitioning])
  {
    if ([v6 isFloating]) {
      +[UIKeyboardImpl floatingNormalizedPersistentOffset];
    }
    else {
      +[UIKeyboardImpl normalizedPersistentOffset];
    }
    objc_msgSend(v6, "setOffset:");
  }
  char v3 = self->_applicator;
  char v4 = [(UIInputWindowControllerHostingItem *)self placement];
  double v5 = [v4 applicatorInfoForOwner:self];
  [(UIInputViewSetPlacementApplicator *)v3 applyChanges:v5];
}

- (UIInputViewSetPlacement)placement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  char v4 = [WeakRetained placementForHost:self];

  return (UIInputViewSetPlacement *)v4;
}

- (void)updateVisibilityConstraintsForPlacement:(id)a3
{
  id v33 = a3;
  char v4 = [(UIInputWindowControllerHostingItem *)self container];
  char v5 = [v4 useCrescendoHostingItem];

  if ((v5 & 1) == 0)
  {
    if (+[UIKeyboard isInputSystemUI])
    {
      uint64_t v6 = 1;
    }
    else
    {
      id v7 = [(UIInputWindowControllerHostingItem *)self owner];
      if ([v7 shouldNotifyRemoteKeyboards])
      {
        uint64_t v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        id v9 = [v8 visualModeManager];
        uint64_t v6 = [v9 shouldShowWithinAppWindow];
      }
      else
      {
        uint64_t v6 = 1;
      }
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v33, "applicatorClassForKeyboard:", v6), "applicatorForOwner:withPlacement:", self, v33);
    if (!v10) {
      goto LABEL_24;
    }
    p_applicator = &self->_applicator;
    if (([(UIInputViewSetPlacementApplicator *)self->_applicator isEqual:v10] & 1) == 0)
    {
      v12 = [v10 draggableView];
      if ([v12 isHidden])
      {
      }
      else
      {
        v13 = [v10 twoFingerDraggableView];
        char v14 = [v13 isHidden];

        if ((v14 & 1) == 0)
        {
          v18 = [(UIInputWindowControllerHostingItem *)self inputAccessoryView];
          if (v18)
          {
            [(UIInputViewSetPlacementApplicator *)*p_applicator inputAccessoryPadding];
            double v20 = v19;
            [v10 inputAccessoryPadding];
            BOOL v22 = v20 != v21;
          }
          else
          {
            BOOL v22 = 0;
          }

          v23 = [(UIInputWindowControllerHostingItem *)self owner];
          double v24 = [v23 view];
          double v25 = [(UIInputViewSetPlacementApplicator *)self->_applicator constraints];
          [v24 removeConstraints:v25];

          v15 = self->_applicator;
          objc_storeStrong((id *)&self->_applicator, v10);
          [(UIInputViewSetPlacementApplicator *)self->_applicator prepare];
          double v26 = [(UIInputWindowControllerHostingItem *)self owner];
          double v27 = [v26 view];
          double v28 = [(UIInputViewSetPlacementApplicator *)self->_applicator constraints];
          [v27 addConstraints:v28];

          if (v22)
          {
            double v29 = [(NSMutableDictionary *)self->_accessoryViewEdgeConstraints objectForKey:&unk_1ED3F5310];
            [(UIInputViewSetPlacementApplicator *)self->_applicator inputAccessoryPadding];
            [v29 setConstant:v30];
          }
          [(UISplitKeyboardSupport *)self->_cachedSplitKeyboardController updatedControllerApplicator:self];
          [(UIInputViewSetPlacementApplicator *)v15 invalidate];
          goto LABEL_22;
        }
      }
    }
    if (!*p_applicator
      || ([(UIInputViewSetPlacementApplicator *)*p_applicator allConstraintsActive] & 1) != 0)
    {
      goto LABEL_23;
    }
    v15 = [(UIInputWindowControllerHostingItem *)self owner];
    v16 = [(UIInputViewSetPlacementApplicator *)v15 view];
    int v17 = [(UIInputViewSetPlacementApplicator *)self->_applicator constraints];
    [v16 addConstraints:v17];

LABEL_22:
LABEL_23:
    double v31 = self->_applicator;
    v32 = [v33 applicatorInfoForOwner:self];
    [(UIInputViewSetPlacementApplicator *)v31 applyChanges:v32];

LABEL_24:
  }
}

- (UIView)inputAccessoryView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if ([WeakRetained host:self isForPurpose:101])
  {
    char v4 = [(UIInputWindowControllerHostingItem *)self owner];
    char v5 = [v4 _inputAccessoryView];
  }
  else
  {
    char v5 = 0;
  }

  return (UIView *)v5;
}

- (void)updateViewSizingConstraints:(id)a3
{
  id v51 = a3;
  char v4 = [(UIInputWindowControllerHostingItem *)self inputView];
  char v5 = [(UIInputWindowControllerHostingItem *)self inputAssistantView];
  uint64_t v6 = [(UIInputWindowControllerHostingItem *)self inputAccessoryView];
  [(UIInputWindowControllerHostingItem *)self disableViewSizingConstraints:1 forNewView:v4];
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v7 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    if (![v7 isInputViewPlaceholder]) {
      goto LABEL_9;
    }
    uint64_t v8 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    char v9 = [v8 isCustomInputView];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
      id v7 = [v10 currentUIState];

      if (v7)
      {
        id v11 = [(UIInputWindowControllerHostingItem *)self owner];
        uint64_t v12 = [v11 keyboardOrientation];

        uint64_t v13 = [v7 orientation];
        char v14 = [(UIInputWindowControllerHostingItem *)self owner];
        if ([v14 isRotating])
        {

LABEL_8:
          uint64_t v15 = [v7 assistantBarVisible];
          v16 = [(UIInputWindowControllerHostingItem *)self owner];
          int v17 = [(UIInputWindowControllerHostingItem *)self inputViewController];
          [v16 sizeForInputViewController:v17 inputView:v4 includeAssistantBar:v15];
          double v19 = v18;
          double v21 = v20;

          objc_msgSend(v4, "setFixedSize:", v19, v21);
          goto LABEL_9;
        }

        if ((unint64_t)(v12 - 3) < 2 != (unint64_t)(v13 - 3) < 2) {
          goto LABEL_8;
        }
      }
LABEL_9:
    }
  }
  if (v4
    && SubviewUsesClassicLayout(v4)
    && [v4 isDescendantOfView:self->_hostView])
  {
    BOOL v22 = [(UIInputWindowControllerHostingItem *)self owner];
    v23 = [(UIInputWindowControllerHostingItem *)self inputViewController];
    [v22 sizeForInputViewController:v23 inputView:v4];
    double v25 = v24;

    inputViewHeightConstraint = self->_inputViewHeightConstraint;
    if (inputViewHeightConstraint)
    {
      [(NSLayoutConstraint *)inputViewHeightConstraint setConstant:v25];
    }
    else
    {
      double v29 = [MEMORY[0x1E4F5B268] constraintWithItem:v4 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v25];
      LODWORD(v30) = 1148846080;
      [(NSLayoutConstraint *)v29 setPriority:v30];
      [(NSLayoutConstraint *)v29 setIdentifier:@"inputHeight"];
      double v31 = self->_inputViewHeightConstraint;
      self->_inputViewHeightConstraint = v29;
    }
    [v51 addObject:self->_inputViewHeightConstraint];
  }
  else
  {
    double v27 = self->_inputViewHeightConstraint;
    if (v27)
    {
      [(NSLayoutConstraint *)v27 setActive:0];
      double v28 = self->_inputViewHeightConstraint;
      self->_inputViewHeightConstraint = 0;
    }
  }
  [(UIInputWindowControllerHostingItem *)self disableViewSizingConstraints:2 forNewView:v5];
  if (v5
    && ([v5 isHidden] & 1) == 0
    && SubviewUsesClassicLayout(v5)
    && [v5 isDescendantOfView:self->_hostView])
  {
    v32 = [(UIInputWindowControllerHostingItem *)self placement];
    id v33 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    [v32 inputAssistantViewHeightForInputViewSet:v33];
    double v35 = v34;

    assistantViewHeightConstraint = self->_assistantViewHeightConstraint;
    if (assistantViewHeightConstraint)
    {
      [(NSLayoutConstraint *)assistantViewHeightConstraint setConstant:v35];
    }
    else
    {
      v48 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v35];
      LODWORD(v49) = 1148846080;
      [(NSLayoutConstraint *)v48 setPriority:v49];
      [(NSLayoutConstraint *)v48 setIdentifier:@"assistantHeight"];
      v50 = self->_assistantViewHeightConstraint;
      self->_assistantViewHeightConstraint = v48;
    }
    [v51 addObject:self->_assistantViewHeightConstraint];
  }
  else
  {
    v37 = self->_assistantViewHeightConstraint;
    if (v37)
    {
      [(NSLayoutConstraint *)v37 setActive:0];
      id v38 = self->_assistantViewHeightConstraint;
      self->_assistantViewHeightConstraint = 0;
    }
  }
  [(UIInputWindowControllerHostingItem *)self disableViewSizingConstraints:4 forNewView:v6];
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  if (v39 > 0.0
    && (double v40 = v39, SubviewUsesClassicLayout(v6))
    && [v6 isDescendantOfView:self->_hostView])
  {
    accessoryViewHeightConstraint = self->_accessoryViewHeightConstraint;
    if (accessoryViewHeightConstraint)
    {
      [(NSLayoutConstraint *)accessoryViewHeightConstraint setConstant:v40];
    }
    else
    {
      v44 = [MEMORY[0x1E4F5B268] constraintWithItem:v6 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v40];
      LODWORD(v45) = 1148846080;
      [(NSLayoutConstraint *)v44 setPriority:v45];
      [(NSLayoutConstraint *)v44 setIdentifier:@"accessoryHeight"];
      v46 = self->_accessoryViewHeightConstraint;
      self->_accessoryViewHeightConstraint = v44;
      v47 = v44;

      [v51 addObject:self->_accessoryViewHeightConstraint];
    }
  }
  else
  {
    v42 = self->_accessoryViewHeightConstraint;
    if (v42)
    {
      [(NSLayoutConstraint *)v42 setActive:0];
      v43 = self->_accessoryViewHeightConstraint;
      self->_accessoryViewHeightConstraint = 0;
    }
  }
}

- (void)disableViewSizingConstraints:(unint64_t)a3 forNewView:(id)a4
{
  char v4 = a3;
  id v18 = a4;
  if (v4)
  {
    inputViewHeightConstraint = self->_inputViewHeightConstraint;
    if (inputViewHeightConstraint)
    {
      id v7 = [(NSLayoutConstraint *)inputViewHeightConstraint firstItem];
      if (v7 != v18)
      {

LABEL_6:
        [(NSLayoutConstraint *)self->_inputViewHeightConstraint setActive:0];
        char v9 = self->_inputViewHeightConstraint;
        self->_inputViewHeightConstraint = 0;

        goto LABEL_7;
      }
      uint64_t v8 = [(NSLayoutConstraint *)self->_inputViewHeightConstraint secondItem];

      if (v8) {
        goto LABEL_6;
      }
    }
  }
LABEL_7:
  if ((v4 & 2) != 0)
  {
    assistantViewHeightConstraint = self->_assistantViewHeightConstraint;
    if (assistantViewHeightConstraint)
    {
      id v11 = [(NSLayoutConstraint *)assistantViewHeightConstraint firstItem];
      if (v11 != v18)
      {

LABEL_12:
        [(NSLayoutConstraint *)self->_assistantViewHeightConstraint setActive:0];
        uint64_t v13 = self->_assistantViewHeightConstraint;
        self->_assistantViewHeightConstraint = 0;

        goto LABEL_13;
      }
      uint64_t v12 = [(NSLayoutConstraint *)self->_assistantViewHeightConstraint secondItem];

      if (v12) {
        goto LABEL_12;
      }
    }
  }
LABEL_13:
  if ((v4 & 4) != 0)
  {
    accessoryViewHeightConstraint = self->_accessoryViewHeightConstraint;
    if (accessoryViewHeightConstraint)
    {
      id v15 = [(NSLayoutConstraint *)accessoryViewHeightConstraint firstItem];
      if (v15 == v18)
      {
        v16 = [(NSLayoutConstraint *)self->_accessoryViewHeightConstraint secondItem];

        if (!v16) {
          goto LABEL_19;
        }
      }
      else
      {
      }
      [(NSLayoutConstraint *)self->_accessoryViewHeightConstraint setActive:0];
      int v17 = self->_accessoryViewHeightConstraint;
      self->_accessoryViewHeightConstraint = 0;
    }
  }
LABEL_19:
}

- (void)updateConstraintInsets
{
  char v3 = [(UIInputWindowControllerHostingItem *)self inputView];

  if (v3)
  {
    char v4 = [(UIInputWindowControllerHostingItem *)self inputViewController];
    [(UIInputWindowControllerHostingItem *)self _aligningInsetsForChildInputViewController:v4 includeSceneBounds:0];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    __60__UIInputWindowControllerHostingItem_updateConstraintInsets__block_invoke(self->_inputViewEdgeConstraints, v6, v8, v10, v12);
  }
  uint64_t v13 = [(UIInputWindowControllerHostingItem *)self inputAssistantView];

  if (v13)
  {
    char v14 = [(UIInputWindowControllerHostingItem *)self inputAssistantViewController];
    [(UIInputWindowControllerHostingItem *)self _aligningInsetsForChildInputViewController:v14 includeSceneBounds:0];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    __60__UIInputWindowControllerHostingItem_updateConstraintInsets__block_invoke(self->_assistantViewEdgeConstraints, v16, v18, v20, v22);
    inputAssistantBackdropView = self->_inputAssistantBackdropView;
    if (inputAssistantBackdropView)
    {
      assistantBackdropViewEdgeConstraints = self->_assistantBackdropViewEdgeConstraints;
      double v25 = inputAssistantBackdropView;
      double v26 = [(NSMutableDictionary *)assistantBackdropViewEdgeConstraints objectForKey:&unk_1ED3F52C8];
      [v26 setConstant:-v18];

      double v27 = [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints objectForKey:&unk_1ED3F52E0];
      [v27 setConstant:-v22];

      double v28 = -self->_backdropHeightDelta;
      double v29 = [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints objectForKey:&unk_1ED3F52F8];

      [v29 setConstant:v28];
    }
  }
  double v30 = [(UIInputWindowControllerHostingItem *)self inputAccessoryView];

  if (v30)
  {
    double v31 = [(UIInputWindowControllerHostingItem *)self inputAccessoryViewController];
    [(UIInputWindowControllerHostingItem *)self _aligningInsetsForChildInputViewController:v31 includeSceneBounds:1];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;

    __60__UIInputWindowControllerHostingItem_updateConstraintInsets__block_invoke(self->_accessoryViewEdgeConstraints, v33, v35, v37, v39);
  }
  if (self->_inputBackdropView)
  {
    double v40 = [(UIInputWindowControllerHostingItem *)self inputViewController];
    [(UIInputWindowControllerHostingItem *)self _aligningInsetsForChildInputViewController:v40 includeSceneBounds:0];
    double v42 = v41;

    id v45 = [(NSMutableDictionary *)self->_inputBackdropViewEdgeConstraints objectForKey:&unk_1ED3F52F8];
    double v43 = -v42;
    [v45 setConstant:v43];
    v44 = [(NSMutableDictionary *)self->_inputBackdropViewEdgeConstraints objectForKey:&unk_1ED3F5310];
    [v44 setConstant:v43];
  }
}

- (UIInputWindowControllerHostingItem)initWithContainer:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UIInputWindowControllerHostingItem;
  double v5 = [(UIInputWindowControllerHostingItem *)&v22 init];
  if (v5)
  {
    double v6 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v6 registerController:v5];

    objc_storeWeak((id *)&v5->_container, v4);
    double v7 = [UIInputSetHostView alloc];
    uint64_t v8 = -[UIView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    hostView = v5->_hostView;
    v5->_hostView = (UIInputSetHostView *)v8;

    [(UIView *)v5->_hostView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v10 = [MEMORY[0x1E4F5B268] constraintWithItem:v5->_hostView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
    emptyHeightConstraint = v5->_emptyHeightConstraint;
    v5->_emptyHeightConstraint = (NSLayoutConstraint *)v10;

    [(NSLayoutConstraint *)v5->_emptyHeightConstraint setIdentifier:@"emptyHeight"];
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_container);
    -[NSLayoutConstraint setActive:](v5->_emptyHeightConstraint, "setActive:", [WeakRetained useCrescendoHostingItem] ^ 1);

    uint64_t v13 = [(UIInputWindowControllerHostingItem *)v5 owner];
    char v14 = [v13 placement];
    if ([v14 isFloatingAssistantView])
    {
      double v15 = [(UIInputWindowControllerHostingItem *)v5 owner];
      double v16 = [v15 _window];
      char v17 = [v16 _isAlwaysKeyboardWindow];

      if ((v17 & 1) == 0)
      {
        double v18 = [(UIInputWindowControllerHostingItem *)v5 owner];
        double v19 = [v18 view];
        [v19 insertSubview:v5->_hostView atIndex:0];
LABEL_7:

        [(UIInputWindowControllerHostingItem *)v5 updateSupportsDockViewController];
        double v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v20 addObserver:v5 selector:sel_inputModeDidChange_ name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];

        goto LABEL_8;
      }
    }
    else
    {
    }
    double v18 = [(UIInputWindowControllerHostingItem *)v5 owner];
    double v19 = [v18 view];
    [v19 addSubview:v5->_hostView];
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (void)updateSupportsDockViewController
{
  BOOL supportsDockViewController = self->_supportsDockViewController;
  BOOL v4 = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally];
  self->_BOOL supportsDockViewController = v4;
  if (!supportsDockViewController && v4)
  {
    double v6 = [(UIView *)self->_hostView window];
    if (v6)
    {
      dockViewController = self->_dockViewController;

      if (!dockViewController)
      {
        [(UIInputWindowControllerHostingItem *)self updateKeyboardDockViewVisibility];
        [(UIInputWindowControllerHostingItem *)self updateViewConstraints];
      }
    }
  }
}

- (void)setControllerDelegate:(id)a3
{
}

- (CGRect)notificationsFrame
{
  char v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v4 = [v3 visualModeManager];
  char v5 = [v4 windowingModeEnabled];

  if (v5)
  {
    [(UIInputWindowControllerHostingItem *)self fullScreenFrame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    char v14 = [(UIInputWindowControllerHostingItem *)self hostView];
    double v15 = [v14 window];
    if ([v15 _isHostedInAnotherProcess])
    {
      double v16 = [(UIInputWindowControllerHostingItem *)self hostView];
      char v17 = [v16 window];
      int v18 = [v17 _isTextEffectsWindowNotificationOwner];

      if (v18)
      {
        double v19 = [(UIInputWindowControllerHostingItem *)self hostView];
        [v19 frame];
        v45.origin.CGFloat x = v20;
        v45.origin.CGFloat y = v21;
        v45.size.CGFloat width = v22;
        v45.size.CGFloat height = v23;
        v41.origin.CGFloat x = v7;
        v41.origin.CGFloat y = v9;
        v41.size.CGFloat width = v11;
        v41.size.CGFloat height = v13;
        CGRect v42 = CGRectIntersection(v41, v45);
        CGFloat x = v42.origin.x;
        CGFloat y = v42.origin.y;
        CGFloat width = v42.size.width;
        CGFloat height = v42.size.height;

        v43.origin.CGFloat x = x;
        v43.origin.CGFloat y = y;
        v43.size.CGFloat width = width;
        v43.size.CGFloat height = height;
        if (!CGRectIsEmpty(v43))
        {
          double v28 = [(UIInputWindowControllerHostingItem *)self hostView];
          [v28 frame];
          CGFloat v7 = v29;
          CGFloat v9 = v30;
          CGFloat v11 = v31;
          CGFloat v13 = v32;
        }
      }
    }
    else
    {
    }
  }
  else
  {
    [(UIInputWindowControllerHostingItem *)self visibleFrame];
    CGFloat v7 = v33;
    CGFloat v9 = v34;
    CGFloat v11 = v35;
    CGFloat v13 = v36;
  }
  double v37 = v7;
  double v38 = v9;
  double v39 = v11;
  double v40 = v13;
  result.size.CGFloat height = v40;
  result.size.CGFloat width = v39;
  result.origin.CGFloat y = v38;
  result.origin.CGFloat x = v37;
  return result;
}

- (CGRect)visibleFrame
{
  char v3 = [(UIInputWindowControllerHostingItem *)self placement];
  BOOL v4 = v3;
  if (v3 && ([v3 isVisible] & 1) == 0)
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else if (+[UIKeyboardImpl isFloating] {
         || [v4 isFloatingAssistantView]
  }
         && ([(UIInputWindowControllerHostingItem *)self inputViewSet],
             CGFloat v13 = objc_claimAutoreleasedReturnValue(),
             [v13 inputAccessoryView],
             char v14 = objc_claimAutoreleasedReturnValue(),
             v14,
             v13,
             !v14))
  {
    [(UIInputViewSetPlacementApplicator *)self->_applicator popoverFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v15 = [(UIInputWindowControllerHostingItem *)self hostView];
    [v15 frame];
    double v6 = v16;
    double v8 = v17;
    double v10 = v18;
    double v12 = v19;
  }
  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  double v23 = v12;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (UISplitKeyboardSupport)splitKeyboardController
{
  return self->_cachedSplitKeyboardController;
}

- (void)someViewDidLayoutSubviews
{
  char v3 = [(UIInputWindowControllerHostingItem *)self controllerDelegate];
  [v3 controllerDidLayoutSubviews:self];

  BOOL v4 = [(UIInputWindowControllerHostingItem *)self placement];
  double v5 = [v4 delegate];

  if (v5 == self)
  {
    id v6 = [(UIInputWindowControllerHostingItem *)self placement];
    [v6 checkSizeForOwner:self];
  }
}

- (_UIRemoteKeyboardControllerDelegate)controllerDelegate
{
  return self->_controllerDelegate;
}

- (BOOL)scrollKeyboardActive
{
  return self->_scrolling;
}

- (void)resetPlacement
{
  char v3 = [(UIInputViewSetPlacement *)self->_cachedPlacement delegate];

  if (v3 == self) {
    [(UIInputViewSetPlacement *)self->_cachedPlacement setDelegate:0];
  }
  cachedPlacement = self->_cachedPlacement;
  self->_cachedPlacement = 0;
}

- (void)setPlacement
{
  char v3 = [(UIInputViewSetPlacement *)self->_cachedPlacement delegate];

  if (v3 == self) {
    [(UIInputViewSetPlacement *)self->_cachedPlacement setDelegate:0];
  }
  BOOL v4 = [(UIInputWindowControllerHostingItem *)self placement];
  cachedPlacement = self->_cachedPlacement;
  self->_cachedPlacement = v4;

  id v6 = self->_cachedPlacement;
  [(UIInputViewSetPlacement *)v6 setDelegate:self];
}

- (id)ownerView
{
  v2 = [(UIInputWindowControllerHostingItem *)self owner];
  char v3 = [v2 view];

  return v3;
}

- (void)dealloc
{
  [(UIInputWindowControllerHostingItem *)self resetPlacement];
  [(UIInputWindowControllerHostingItem *)self configureSplitKeyboardController:0];
  [(UIInputWindowControllerHostingItem *)self configureScrollDismissController:0];
  [(UIInputWindowControllerHostingItem *)self configureFlickingAssistantViewController:0];
  [(UIView *)self->_hostView removeFromSuperview];
  if ([(NSLayoutConstraint *)self->_assistantViewHeightConstraint isActive]) {
    [(UIInputWindowControllerHostingItem *)self disableViewSizingConstraints:2 forNewView:0];
  }
  [(TUIInputAssistantHostView *)self->_inputAssistantHostView removeFromSuperview];
  char v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  [v3 unregisterController:self];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];

  v5.receiver = self;
  v5.super_class = (Class)UIInputWindowControllerHostingItem;
  [(UIInputWindowControllerHostingItem *)&v5 dealloc];
}

- (void)setPlacement:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  int v5 = [WeakRetained host:self isForPurpose:200];

  if (v5)
  {
    id v6 = [(UIInputWindowControllerHostingItem *)self owner];
    [v6 setPlacement:v7];
  }
}

- (void)setInputView:(id)a3
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(UIInputWindowControllerHostingItem *)self inputAssistantView];
  id v6 = [v5 superview];
  hostView = self->_hostView;

  double v8 = self->_hostView;
  if (v6 == hostView) {
    [(UIView *)v8 insertSubview:v4 belowSubview:v5];
  }
  else {
    [(UIView *)v8 addSubview:v4];
  }

  if (+[UIKeyboardImpl isFloating]
    && ([(UIInputWindowControllerHostingItem *)self owner],
        double v9 = objc_claimAutoreleasedReturnValue(),
        [v9 inputViewSet],
        double v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isCustomInputView],
        v10,
        v9,
        v11))
  {
    double v12 = [(UIInputWindowControllerHostingItem *)self floatingKeyboardMaskView];

    if (!v12)
    {
      CGFloat v13 = [UIView alloc];
      char v14 = -[UIView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v15 = +[UIColor blackColor];
      [(UIView *)v14 setBackgroundColor:v15];

      double v16 = objc_alloc_init(UIView);
      [(UIInputWindowControllerHostingItem *)self setFloatingKeyboardMaskView:v16];

      double v17 = [(UIInputWindowControllerHostingItem *)self floatingKeyboardMaskView];
      [v17 addSubview:v14];

      double v18 = self->_hostView;
      double v19 = [(UIInputWindowControllerHostingItem *)self floatingKeyboardMaskView];
      [(UIView *)v18 addSubview:v19];

      double v33 = (void *)MEMORY[0x1E4F5B268];
      double v38 = [(UIView *)v14 leadingAnchor];
      double v37 = [(UIView *)self->_hostView leadingAnchor];
      double v36 = [v38 constraintEqualToAnchor:v37];
      v39[0] = v36;
      double v35 = [(UIView *)v14 topAnchor];
      double v34 = [(UIView *)self->_hostView topAnchor];
      double v32 = [v35 constraintEqualToAnchor:v34 constant:-100.0];
      v39[1] = v32;
      double v20 = [(UIView *)self->_hostView trailingAnchor];
      double v21 = [(UIView *)v14 trailingAnchor];
      double v22 = [v20 constraintEqualToAnchor:v21];
      v39[2] = v22;
      double v23 = [(UIView *)self->_hostView bottomAnchor];
      double v24 = [(UIView *)v14 bottomAnchor];
      double v25 = [v23 constraintEqualToAnchor:v24];
      v39[3] = v25;
      double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
      [v33 activateConstraints:v26];
    }
    double v27 = [(UIView *)self->_hostView maskView];

    if (!v27)
    {
      double v28 = self->_hostView;
      double v29 = [(UIInputWindowControllerHostingItem *)self floatingKeyboardMaskView];
      [(UIView *)v28 setMaskView:v29];
    }
  }
  else
  {
    double v30 = [(UIView *)self->_hostView maskView];

    if (v30)
    {
      [(UIView *)self->_hostView setMaskView:0];
      double v31 = [(UIInputWindowControllerHostingItem *)self floatingKeyboardMaskView];
      [v31 removeFromSuperview];

      [(UIInputWindowControllerHostingItem *)self setFloatingKeyboardMaskView:0];
    }
  }
}

- (void)setInputAssistantView:(id)a3
{
  [(UIView *)self->_hostView addSubview:a3];
  [(UIInputWindowControllerHostingItem *)self updateInputAssistantViewLayering];
  id v7 = [(UIInputWindowControllerHostingItem *)self placement];
  if ([v7 isFloatingAssistantView])
  {
    id v4 = [(TUIInputAssistantHostView *)self->_inputAssistantHostView superview];
    hostView = self->_hostView;

    if (v4 != hostView) {
      id v6 = [(UIInputWindowControllerHostingItem *)self inputAssistantHostView];
    }
  }
  else
  {
  }
}

- (void)setInputAccessoryView:(id)a3
{
  id v9 = a3;
  -[UIView addSubview:](self->_hostView, "addSubview:");
  id v4 = [(UIInputWindowControllerHostingItem *)self owner];
  int v5 = [v4 placement];
  if ([v5 isFloatingAssistantView])
  {
    id v6 = [(UIInputWindowControllerHostingItem *)self owner];
    id v7 = [v6 _window];
    char v8 = [v7 _isAlwaysKeyboardWindow];

    if (v8) {
      goto LABEL_6;
    }
    id v4 = [(UIInputWindowControllerHostingItem *)self inputAssistantHostView];
    [v4 setInputAccessoryView:v9];
  }
  else
  {
  }
LABEL_6:
}

- (id)inputViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if ([WeakRetained host:self isForPurpose:100])
  {
    id v4 = [(UIInputWindowControllerHostingItem *)self owner];
    int v5 = [v4 _inputViewController];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)inputAssistantViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if ([WeakRetained host:self isForPurpose:102])
  {
    id v4 = [(UIInputWindowControllerHostingItem *)self owner];
    int v5 = [v4 _inputAssistantViewController];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)inputAccessoryViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if ([WeakRetained host:self isForPurpose:101])
  {
    id v4 = [(UIInputWindowControllerHostingItem *)self owner];
    int v5 = [v4 _inputAccessoryViewController];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (TUIInputAssistantHostView)inputAssistantHostView
{
  v39[4] = *MEMORY[0x1E4F143B8];
  char v3 = [(UIInputWindowControllerHostingItem *)self hostView];
  if (!self->_inputAssistantHostView)
  {
    uint64_t v35 = 0;
    double v36 = &v35;
    uint64_t v37 = 0x2050000000;
    id v4 = (void *)_MergedGlobals_1137;
    uint64_t v38 = _MergedGlobals_1137;
    if (!_MergedGlobals_1137)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __getTUIInputAssistantHostViewClass_block_invoke;
      v34[3] = &unk_1E52D9900;
      v34[4] = &v35;
      __getTUIInputAssistantHostViewClass_block_invoke((uint64_t)v34);
      id v4 = (void *)v36[3];
    }
    int v5 = v4;
    _Block_object_dispose(&v35, 8);
    id v6 = [v5 alloc];
    [v3 frame];
    id v7 = (TUIInputAssistantHostView *)objc_msgSend(v6, "initWithFrame:");
    inputAssistantHostView = self->_inputAssistantHostView;
    self->_inputAssistantHostView = v7;

    [(TUIInputAssistantHostView *)self->_inputAssistantHostView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  id v9 = [v3 subviews];
  double v10 = [(UIInputWindowControllerHostingItem *)self inputAssistantView];
  uint64_t v11 = [v9 indexOfObject:v10];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v11 - 1;
  }
  if (v11) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  double v15 = self->_inputAssistantHostView;
  p_inputAssistantHostView = (id *)&self->_inputAssistantHostView;
  [v3 insertSubview:v15 atIndex:v13];
  id v16 = *p_inputAssistantHostView;
  double v17 = [v3 _inheritedRenderConfig];
  [v16 _setRenderConfig:v17];

  double v28 = (void *)MEMORY[0x1E4F5B268];
  double v33 = [*p_inputAssistantHostView leadingAnchor];
  double v32 = [v3 leadingAnchor];
  double v31 = [v33 constraintEqualToAnchor:v32];
  v39[0] = v31;
  double v30 = [*p_inputAssistantHostView trailingAnchor];
  double v29 = [v3 trailingAnchor];
  double v18 = [v30 constraintEqualToAnchor:v29];
  v39[1] = v18;
  double v19 = [*p_inputAssistantHostView bottomAnchor];
  double v20 = [v3 bottomAnchor];
  double v21 = [v19 constraintEqualToAnchor:v20];
  v39[2] = v21;
  double v22 = [*p_inputAssistantHostView topAnchor];
  double v23 = [v3 topAnchor];
  double v24 = [v22 constraintEqualToAnchor:v23];
  v39[3] = v24;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  [v28 activateConstraints:v25];

  double v26 = (TUIInputAssistantHostView *)*p_inputAssistantHostView;
  return v26;
}

- (void)removeInputAssistantHostView
{
}

void __60__UIInputWindowControllerHostingItem_updateConstraintInsets__block_invoke(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  id v13 = [v9 objectForKey:&unk_1ED3F52C8];
  [v13 setConstant:a3];
  double v10 = [v9 objectForKey:&unk_1ED3F52E0];
  [v10 setConstant:a5];
  uint64_t v11 = [v9 objectForKey:&unk_1ED3F52F8];
  [v11 setConstant:a2];
  uint64_t v12 = [v9 objectForKey:&unk_1ED3F5310];

  [v12 setConstant:a4];
}

- (UIEdgeInsets)_aligningInsetsForChildInputViewController:(id)a3 includeSceneBounds:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [v6 _alignsToContentViewController];
  if (+[_UIRemoteKeyboards enabled])
  {
    char v8 = [(UIInputWindowControllerHostingItem *)self owner];
    int v9 = [v8 shouldNotifyRemoteKeyboards] & v4;
  }
  else
  {
    int v9 = 0;
  }
  double v10 = 0.0;
  if (!v6)
  {
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    goto LABEL_20;
  }
  uint64_t v11 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
  if ((id)v11 == v6)
  {
  }
  else
  {
    uint64_t v12 = (void *)v11;
    id v13 = [(UIInputWindowControllerHostingItem *)self inputAssistantViewController];

    if (v13 != v6)
    {
      id v14 = [(UIInputWindowControllerHostingItem *)self inputAccessoryViewController];

      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      if (v14 != v6) {
        goto LABEL_20;
      }
      double v18 = [(UIInputWindowControllerHostingItem *)self applicator];
      [v18 inputAccessoryPadding];
      goto LABEL_19;
    }
  }
  double v23 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  int v24 = [v23 isCustomInputView];

  if (v24)
  {
    if (+[UIKeyboard usesInputSystemUI])
    {
      double v25 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
      double v26 = [v25 hostedCustomInputView];

      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      if (v26) {
        goto LABEL_40;
      }
    }
    else
    {
      double v27 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
      double v28 = [v27 view];
      [v28 bounds];
      IsEmptCGFloat y = CGRectIsEmpty(v74);

      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      if (IsEmpty) {
        goto LABEL_40;
      }
    }
  }
  id v30 = [(UIInputWindowControllerHostingItem *)self inputAssistantViewController];

  if (v30 == v6)
  {
    double v18 = [(UIInputWindowControllerHostingItem *)self applicator];
    [v18 inputAssistantPadding];
  }
  else
  {
    double v18 = [(UIInputWindowControllerHostingItem *)self container];
    [v18 _inputViewPadding];
  }
LABEL_19:
  double v17 = v19;
  double v16 = v20;
  double v15 = v21;
  double v10 = v22;

LABEL_20:
  if ((v7 | v9) != 1) {
    goto LABEL_40;
  }
  if (!v7) {
    goto LABEL_29;
  }
  double v31 = [v6 _primaryContentResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v31;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_29;
    }
    id v32 = [v31 view];
  }
  double v33 = v32;

  if (v33)
  {
    double v34 = [(UIInputWindowControllerHostingItem *)self hostView];
    [v33 bounds];
    objc_msgSend(v34, "convertRect:fromView:", v33);
    double v36 = v35;
    double v38 = v37;

    double v39 = [(UIInputWindowControllerHostingItem *)self owner];
    double v40 = [v39 view];
    [v40 bounds];
    double v16 = v36 - v41;

    CGRect v42 = [(UIInputWindowControllerHostingItem *)self owner];
    CGRect v43 = [v42 view];
    [v43 bounds];
    double v10 = v44 + v45 - (v36 + v38);
    goto LABEL_38;
  }
LABEL_29:
  if (v9)
  {
    v46 = [(UIInputWindowControllerHostingItem *)self owner];
    if ([v46 isRotating])
    {
    }
    else
    {
      v47 = +[UIKeyboardImpl activeInstance];
      char v48 = [v47 isRotating];

      if ((v48 & 1) == 0)
      {
        double v49 = [(UIInputWindowControllerHostingItem *)self owner];
        v50 = [v49 _window];
        [v50 actualSceneBounds];
        double v53 = v54;
LABEL_35:

        id v55 = [(UIInputWindowControllerHostingItem *)self owner];
        v56 = [v55 view];
        [v56 bounds];
        double v10 = v53 - (v57 + v58);

        v59 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        v60 = [v59 responder];
        double v33 = [v60 _responderWindow];

        double v16 = 0.0;
        if (!v33) {
          goto LABEL_39;
        }
        id v61 = [(UIInputWindowControllerHostingItem *)self inputAccessoryView];
        id v62 = [v61 traitCollection];
        uint64_t v63 = [v62 horizontalSizeClass];
        v64 = [v33 traitCollection];
        uint64_t v65 = [v64 horizontalSizeClass];

        if (v63 == v65) {
          goto LABEL_39;
        }
        v66 = [(UIInputWindowControllerHostingItem *)self owner];
        v67 = [(UIInputWindowControllerHostingItem *)self inputAccessoryViewController];
        [v66 setOverrideTraitCollection:0 forChildViewController:v67];

        CGRect v42 = [(UIInputWindowControllerHostingItem *)self owner];
        CGRect v43 = [v33 traitCollection];
        v68 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", [v43 horizontalSizeClass]);
        v69 = [(UIInputWindowControllerHostingItem *)self inputAccessoryViewController];
        [v42 setOverrideTraitCollection:v68 forChildViewController:v69];

LABEL_38:
LABEL_39:

        goto LABEL_40;
      }
    }
    double v49 = [(UIInputWindowControllerHostingItem *)self owner];
    v50 = [v49 _window];
    id v51 = [(UIInputWindowControllerHostingItem *)self owner];
    objc_msgSend(v50, "actualSceneBoundsForLandscape:", objc_msgSend(v51, "isViewLandscape"));
    double v53 = v52;

    goto LABEL_35;
  }
LABEL_40:

  double v70 = v17;
  double v71 = v16;
  double v72 = v15;
  double v73 = v10;
  result.right = v73;
  result.bottom = v72;
  result.left = v71;
  result.top = v70;
  return result;
}

- (void)clearInputViewEdgeConstraints
{
  char v3 = (void *)MEMORY[0x1E4F5B268];
  BOOL v4 = [(NSMutableDictionary *)self->_inputViewEdgeConstraints allValues];
  [v3 deactivateConstraints:v4];

  [(NSMutableDictionary *)self->_inputViewEdgeConstraints removeAllObjects];
  if ([(NSMutableDictionary *)self->_inputDockViewEdgeConstraints count])
  {
    int v5 = (void *)MEMORY[0x1E4F5B268];
    id v6 = [(NSMutableDictionary *)self->_inputDockViewEdgeConstraints allValues];
    [v5 deactivateConstraints:v6];

    [(NSMutableDictionary *)self->_inputDockViewEdgeConstraints removeAllObjects];
  }
  if ([(NSMutableDictionary *)self->_inputBackdropBackgroundViewEdgeConstraints count])
  {
    int v7 = (void *)MEMORY[0x1E4F5B268];
    char v8 = [(NSMutableDictionary *)self->_inputBackdropBackgroundViewEdgeConstraints allValues];
    [v7 deactivateConstraints:v8];

    [(NSMutableDictionary *)self->_inputBackdropBackgroundViewEdgeConstraints removeAllObjects];
  }
  if ([(NSMutableDictionary *)self->_inputBackdropViewEdgeConstraints count])
  {
    int v9 = (void *)MEMORY[0x1E4F5B268];
    double v10 = [(NSMutableDictionary *)self->_inputBackdropViewEdgeConstraints allValues];
    [v9 deactivateConstraints:v10];

    inputBackdropViewEdgeConstraints = self->_inputBackdropViewEdgeConstraints;
    [(NSMutableDictionary *)inputBackdropViewEdgeConstraints removeAllObjects];
  }
}

- (void)resetInputViewVisibility
{
  id v3 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
  v2 = [v3 view];
  [v2 setAlpha:1.0];
}

- (void)clearInputAssistantViewEdgeConstraints
{
  id v3 = (void *)MEMORY[0x1E4F5B268];
  BOOL v4 = [(NSMutableDictionary *)self->_assistantViewEdgeConstraints allValues];
  [v3 deactivateConstraints:v4];

  [(NSMutableDictionary *)self->_assistantViewEdgeConstraints removeAllObjects];
  if ([(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints count])
  {
    int v5 = (void *)MEMORY[0x1E4F5B268];
    id v6 = [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints allValues];
    [v5 deactivateConstraints:v6];

    assistantBackdropViewEdgeConstraints = self->_assistantBackdropViewEdgeConstraints;
    [(NSMutableDictionary *)assistantBackdropViewEdgeConstraints removeAllObjects];
  }
}

- (void)clearInputAccessoryViewEdgeConstraints
{
  id v3 = (void *)MEMORY[0x1E4F5B268];
  BOOL v4 = [(NSMutableDictionary *)self->_accessoryViewEdgeConstraints allValues];
  [v3 deactivateConstraints:v4];

  [(NSMutableDictionary *)self->_accessoryViewEdgeConstraints removeAllObjects];
  if ([(NSMutableDictionary *)self->_accessoryBackdropViewEdgeConstraints count])
  {
    int v5 = (void *)MEMORY[0x1E4F5B268];
    id v6 = [(NSMutableDictionary *)self->_accessoryBackdropViewEdgeConstraints allValues];
    [v5 deactivateConstraints:v6];

    accessoryBackdropViewEdgeConstraints = self->_accessoryBackdropViewEdgeConstraints;
    [(NSMutableDictionary *)accessoryBackdropViewEdgeConstraints removeAllObjects];
  }
}

- (id)_updateOrCreateConstraintInDict:(id)a3 key:(id)a4 fromItem:(id)a5 toItem:(id)a6 tracker:(id)a7 creator:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  double v18 = (void (**)(void))a8;
  double v19 = [v13 objectForKey:v14];
  if (!v19) {
    goto LABEL_6;
  }
  double v20 = v19;
  id v21 = [v19 firstItem];
  if (v21 != v15)
  {

LABEL_5:
    [v20 setActive:0];
    [v13 removeObjectForKey:v14];

LABEL_6:
    double v20 = v18[2](v18);
    [v17 addObject:v20];
    [v13 setObject:v20 forKey:v14];
    goto LABEL_7;
  }
  id v22 = [v20 secondItem];

  if (v22 != v16) {
    goto LABEL_5;
  }
  if (([v20 isActive] & 1) == 0) {
    [v17 addObject:v20];
  }
LABEL_7:

  return v20;
}

- (id)viewMatchingConstraintForAttribute:(int64_t)a3 primaryView:(id)a4 secondaryView:(id)a5
{
  int v5 = [MEMORY[0x1E4F5B268] constraintWithItem:a5 attribute:a3 relatedBy:0 toItem:a4 attribute:a3 multiplier:1.0 constant:0.0];
  LODWORD(v6) = 1132068864;
  [v5 setPriority:v6];
  [v5 setIdentifier:@"viewMatching"];
  return v5;
}

- (void)rebuildConstraints:(id)a3 forView:(id)a4 toMatchView:(id)a5 tracker:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(UIInputWindowControllerHostingItem *)self container];
  char v15 = [v14 useCrescendoHostingItem];

  if ((v15 & 1) == 0)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke;
    v39[3] = &unk_1E52FC190;
    v39[4] = self;
    id v16 = v12;
    id v40 = v16;
    id v17 = v11;
    id v41 = v17;
    double v18 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v10 key:&unk_1ED3F52C8 fromView:v17 toView:v16 tracker:v13 creator:v39];
    [v18 setConstant:0.0];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_2;
    v36[3] = &unk_1E52FC190;
    v36[4] = self;
    id v19 = v16;
    id v37 = v19;
    id v20 = v17;
    id v38 = v20;
    id v21 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v10 key:&unk_1ED3F52E0 fromView:v20 toView:v19 tracker:v13 creator:v36];
    [v21 setConstant:0.0];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_3;
    v33[3] = &unk_1E52FC190;
    v33[4] = self;
    id v22 = v19;
    id v34 = v22;
    id v23 = v20;
    id v35 = v23;
    int v24 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v10 key:&unk_1ED3F52F8 fromView:v23 toView:v22 tracker:v13 creator:v33];
    [v24 setConstant:0.0];

    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    double v28 = __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_4;
    double v29 = &unk_1E52FC190;
    id v30 = self;
    id v31 = v22;
    id v32 = v23;
    double v25 = [(UIInputWindowControllerHostingItem *)self _updateOrCreateConstraintInDict:v10 key:&unk_1ED3F5310 fromView:v32 toView:v31 tracker:v13 creator:&v26];
    objc_msgSend(v25, "setConstant:", 0.0, v26, v27, v28, v29, v30);
  }
}

uint64_t __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) viewMatchingConstraintForAttribute:1 primaryView:*(void *)(a1 + 40) secondaryView:*(void *)(a1 + 48)];
}

uint64_t __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) viewMatchingConstraintForAttribute:2 primaryView:*(void *)(a1 + 40) secondaryView:*(void *)(a1 + 48)];
}

uint64_t __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) viewMatchingConstraintForAttribute:8 primaryView:*(void *)(a1 + 40) secondaryView:*(void *)(a1 + 48)];
}

uint64_t __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) viewMatchingConstraintForAttribute:4 primaryView:*(void *)(a1 + 40) secondaryView:*(void *)(a1 + 48)];
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 32) attribute:1 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 40) + 272) attribute:1 multiplier:1.0 constant:*(double *)(a1 + 56)];
  [v1 setIdentifier:@"inputView.left"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_2(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 32) attribute:2 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 40) + 272) attribute:2 multiplier:1.0 constant:*(double *)(a1 + 72)];
  [v1 setIdentifier:@"inputView.right"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_3(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 32) attribute:3 relatedBy:0 toItem:*(void *)(a1 + 40) attribute:*(void *)(a1 + 48) multiplier:1.0 constant:*(double *)(a1 + 56)];
  [v1 setIdentifier:@"inputView.top"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_4(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 32) attribute:4 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 40) + 272) attribute:4 multiplier:1.0 constant:*(double *)(a1 + 64)];
  [v1 setIdentifier:@"inputView.bottom"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) leftAnchor];
  id v3 = [*(id *)(a1 + 40) hostView];
  BOOL v4 = [v3 leftAnchor];
  int v5 = [v2 constraintEqualToAnchor:v4];

  [v5 setIdentifier:@"backgroundView.left"];
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rightAnchor];
  id v3 = [*(id *)(a1 + 40) hostView];
  BOOL v4 = [v3 rightAnchor];
  int v5 = [v2 constraintEqualToAnchor:v4];

  [v5 setIdentifier:@"backgroundView.right"];
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_7(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bottomAnchor];
  id v3 = [*(id *)(a1 + 40) bottomAnchor];
  BOOL v4 = [v2 constraintEqualToAnchor:v3];

  [v4 setIdentifier:@"backgroundView.bottom"];
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) heightAnchor];
  id v3 = [*(id *)(a1 + 40) heightAnchor];
  BOOL v4 = [v2 constraintEqualToAnchor:v3];

  [v4 setIdentifier:@"backgroundView.height"];
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_9(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) topAnchor];
  id v3 = [*(id *)(a1 + 40) topAnchor];
  BOOL v4 = [v2 constraintEqualToAnchor:v3];

  [v4 setIdentifier:@"inputBackdrop.top"];
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_10(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) leadingAnchor];
  id v3 = [*(id *)(a1 + 40) leadingAnchor];
  BOOL v4 = [v2 constraintEqualToAnchor:v3];

  [v4 setIdentifier:@"inputBackdrop.leading"];
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_11(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bottomAnchor];
  id v3 = [*(id *)(a1 + 40) bottomAnchor];
  BOOL v4 = [v2 constraintEqualToAnchor:v3];

  [v4 setIdentifier:@"inputBackdrop.bottom"];
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_12(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) trailingAnchor];
  id v3 = [*(id *)(a1 + 40) trailingAnchor];
  BOOL v4 = [v2 constraintEqualToAnchor:v3];

  [v4 setIdentifier:@"inputBackdrop.trailing"];
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_13(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 232) fullBackdropLayoutGuide];
  id v3 = [v2 topAnchor];
  BOOL v4 = [*(id *)(a1 + 40) topAnchor];
  int v5 = [v3 constraintEqualToAnchor:v4];

  [v5 setIdentifier:@"inputBackdropGuides.fullTop"];
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_14(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 232) fullBackdropLayoutGuide];
  id v3 = [v2 leadingAnchor];
  BOOL v4 = [*(id *)(a1 + 40) leadingAnchor];
  int v5 = [v3 constraintEqualToAnchor:v4];

  [v5 setIdentifier:@"inputBackdropGuides.fullLeading"];
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_15(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bottomAnchor];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 232) fullBackdropLayoutGuide];
  BOOL v4 = [v3 bottomAnchor];
  int v5 = [v2 constraintEqualToAnchor:v4];

  [v5 setIdentifier:@"inputBackdropGuides.fullBottom"];
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_16(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) trailingAnchor];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 232) fullBackdropLayoutGuide];
  BOOL v4 = [v3 trailingAnchor];
  int v5 = [v2 constraintEqualToAnchor:v4];

  [v5 setIdentifier:@"inputBackdropGuides.fullTrailing"];
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_17(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 232) assistantLayoutGuide];
  id v3 = [v2 topAnchor];
  BOOL v4 = [*(id *)(a1 + 32) hostView];
  int v5 = [v4 topAnchor];
  double v6 = [v3 constraintEqualToAnchor:v5];

  [v6 setIdentifier:@"inputBackdropGuides.assistantTop"];
  return v6;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_18(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) topAnchor];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 232) assistantLayoutGuide];
  BOOL v4 = [v3 bottomAnchor];
  int v5 = [v2 constraintEqualToAnchor:v4];

  [v5 setIdentifier:@"inputBackdropGuides.assistantBottom"];
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_19(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) leftAnchor];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 272) leftAnchor];
  BOOL v4 = [v2 constraintEqualToAnchor:v3];

  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_20(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rightAnchor];
  id v3 = [*(id *)(a1 + 40) hostView];
  BOOL v4 = [v3 rightAnchor];
  int v5 = [v2 constraintEqualToAnchor:v4];

  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_21(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) topAnchor];
  id v3 = [*(id *)(a1 + 40) topAnchor];
  BOOL v4 = [v2 constraintEqualToAnchor:v3];

  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_22(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bottomAnchor];
  id v3 = [*(id *)(a1 + 40) hostView];
  BOOL v4 = [v3 bottomAnchor];
  int v5 = [v2 constraintEqualToAnchor:v4];

  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_23(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 32) attribute:1 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 40) + 272) attribute:1 multiplier:1.0 constant:*(double *)(a1 + 56)];
  [v1 setIdentifier:@"assistantView.left"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_24(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 32) attribute:2 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 40) + 272) attribute:2 multiplier:1.0 constant:*(double *)(a1 + 72)];
  [v1 setIdentifier:@"assistantView.right"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_25(void *a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:a1[4] attribute:3 relatedBy:0 toItem:a1[5] attribute:a1[6] multiplier:1.0 constant:0.0];
  [v1 setIdentifier:@"assistantView.top"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_26(void *a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:a1[4] attribute:4 relatedBy:0 toItem:a1[5] attribute:a1[6] multiplier:1.0 constant:0.0];
  [v1 setIdentifier:@"assistantView.bottom"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_27(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 32) attribute:1 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 40) + 272) attribute:1 multiplier:1.0 constant:*(double *)(a1 + 56)];
  [v1 setIdentifier:@"accessoryView.left"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_28(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 32) attribute:2 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 40) + 272) attribute:2 multiplier:1.0 constant:*(double *)(a1 + 72)];
  [v1 setIdentifier:@"accessoryView.right"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_29(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 32) attribute:3 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 40) + 272) attribute:3 multiplier:1.0 constant:0.0];
  [v1 setIdentifier:@"accessoryView.top"];
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_30(void *a1)
{
  v1 = [MEMORY[0x1E4F5B268] constraintWithItem:a1[4] attribute:4 relatedBy:0 toItem:a1[5] attribute:a1[6] multiplier:1.0 constant:0.0];
  [v1 setIdentifier:@"accessoryView.bottom"];
  return v1;
}

- (void)resetBackdropHeight
{
  if (self->_backdropHeightDelta != 0.0) {
    [(UIInputWindowControllerHostingItem *)self extendKeyboardBackdropHeight:0.0 withDuration:0.0];
  }
}

- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4
{
  self->_backdropHeightDelta = a3;
  double v6 = +[UIKeyboardImpl activeInstance];
  int v7 = [v6 isMinimized];

  if (v7)
  {
    inputAssistantBackdropView = self->_inputAssistantBackdropView;
    if (self->_backdropHeightDelta == 0.0)
    {
      self->_inputAssistantBackdropView = 0;
    }
    else if (!inputAssistantBackdropView)
    {
      int v9 = [UIKBInputBackdropView alloc];
      id v10 = [(UIInputWindowControllerHostingItem *)self inputAssistantView];
      [v10 bounds];
      id v11 = -[UIKBInputBackdropView initWithFrame:](v9, "initWithFrame:");
      id v12 = self->_inputAssistantBackdropView;
      self->_inputAssistantBackdropView = v11;

      [(UIView *)self->_inputAssistantBackdropView setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    id v13 = [(UIInputWindowControllerHostingItem *)self container];
    [v13 updateViewConstraints];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__UIInputWindowControllerHostingItem_extendKeyboardBackdropHeight_withDuration___block_invoke;
  v14[3] = &unk_1E52D9F70;
  v14[4] = self;
  +[UIView animateWithDuration:50331648 delay:v14 options:0 animations:a4 completion:0.0];
}

void __80__UIInputWindowControllerHostingItem_extendKeyboardBackdropHeight_withDuration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) placement];
  int v3 = [v2 isUndocked];

  if (v3)
  {
    BOOL v4 = *(double **)(a1 + 32);
    double v5 = -v4[5];
    double v6 = [v4 placement];
    [v6 setExtendedHeight:v5];

    int v7 = *(void **)(a1 + 32);
    char v8 = [v7 placement];
    [v7 updateVisibilityConstraintsForPlacement:v8];
  }
  id v14 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKey:&unk_1ED3F52F8];
  int v9 = *(void **)(a1 + 32);
  id v10 = [v9 inputAssistantViewController];
  [v9 _aligningInsetsForChildInputViewController:v10 includeSceneBounds:0];
  double v12 = v11;

  [v14 setConstant:-*(double *)(*(void *)(a1 + 32) + 40) - v12];
  id v13 = [*(id *)(*(void *)(a1 + 32) + 248) superview];
  [v13 layoutIfNeeded];
}

- (CGRect)fullScreenFrame
{
  int v3 = [(UIInputWindowControllerHostingItem *)self placement];
  BOOL v4 = v3;
  if (v3 && ([v3 isVisible] & 1) == 0)
  {
    CGFloat v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_15;
  }
  if (!+[UIKeyboardImpl isFloating])
  {
    if (![v4 isFloatingAssistantView]
      || ([(UIInputWindowControllerHostingItem *)self inputViewSet],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v13 inputAccessoryView],
          id v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      char v15 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
      if ([v15 isInputViewPlaceholder])
      {
        id v16 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
        id v17 = [v16 inputAccessoryView];

        if (v17)
        {
LABEL_13:
          id v62 = [(UIInputWindowControllerHostingItem *)self hostView];
          [v62 frame];
          CGFloat v6 = v63;
          double v8 = v64;
          CGFloat v10 = v65;
          double v12 = v66;

          goto LABEL_15;
        }
        double v18 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
        id v19 = [v18 inputView];
        char v15 = [v19 placeheldView];

        id v20 = [v15 superview];

        if (v20)
        {
          id v21 = [v15 superview];
          id v22 = [(UIInputWindowControllerHostingItem *)self hostView];
          id v23 = [v22 window];
          int v24 = [v23 windowScene];
          double v25 = [v24 coordinateSpace];
          [v21 frame];
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          v77 = v21;
          id v34 = [v21 window];
          id v35 = [v34 screen];
          double v36 = [v35 coordinateSpace];
          objc_msgSend(v25, "convertRect:fromCoordinateSpace:", v36, v27, v29, v31, v33);
          CGFloat v6 = v37;
          double v8 = v38;
          CGFloat v10 = v39;
          double v12 = v40;

          uint64_t v41 = [(UIInputWindowControllerHostingItem *)self hostView];
          [(id)v41 frame];
          v87.origin.CGFloat x = v42;
          v87.origin.CGFloat y = v43;
          v87.size.CGFloat width = v44;
          v87.size.CGFloat height = v45;
          v78.origin.CGFloat x = v6;
          v78.origin.CGFloat y = v8;
          v78.size.CGFloat width = v10;
          v78.size.CGFloat height = v12;
          CGRect v79 = CGRectIntersection(v78, v87);
          CGFloat x = v79.origin.x;
          CGFloat y = v79.origin.y;
          CGFloat width = v79.size.width;
          CGFloat height = v79.size.height;

          v80.origin.CGFloat x = x;
          v80.origin.CGFloat y = y;
          v80.size.CGFloat width = width;
          v80.size.CGFloat height = height;
          LOBYTE(v41) = CGRectIsEmpty(v80);
          v50 = [(UIInputWindowControllerHostingItem *)self hostView];
          id v51 = v50;
          if (v41)
          {
            [v50 origin];
            double v8 = v52;

            uint64_t v53 = [(UIInputWindowControllerHostingItem *)self hostView];
            [(id)v53 frame];
            v88.origin.CGFloat x = v54;
            v88.origin.CGFloat y = v55;
            v88.size.CGFloat width = v56;
            v88.size.CGFloat height = v57;
            v81.origin.CGFloat x = v6;
            v81.origin.CGFloat y = v8;
            v81.size.CGFloat width = v10;
            v81.size.CGFloat height = v12;
            CGRect v82 = CGRectIntersection(v81, v88);
            CGFloat v58 = v82.origin.x;
            CGFloat v59 = v82.origin.y;
            CGFloat v60 = v82.size.width;
            CGFloat v61 = v82.size.height;

            v83.origin.CGFloat x = v58;
            v83.origin.CGFloat y = v59;
            v83.size.CGFloat width = v60;
            v83.size.CGFloat height = v61;
            LOBYTE(v53) = CGRectIsEmpty(v83);

            if (v53) {
              goto LABEL_12;
            }
          }
          else
          {
            [v50 frame];
            double v72 = v71;
            double v73 = [(UIInputWindowControllerHostingItem *)self containerView];
            [v73 frame];
            if (v72 >= CGRectGetMaxY(v84))
            {
              CGRect v74 = [(UIInputWindowControllerHostingItem *)self containerView];
              [v74 frame];
              v89.origin.CGFloat x = v6;
              v89.origin.CGFloat y = v8;
              v89.size.CGFloat width = v10;
              v89.size.CGFloat height = v12;
              BOOL v75 = CGRectIntersectsRect(v85, v89);

              double v76 = -0.0;
              if (v75) {
                double v76 = v12;
              }
              double v8 = v8 + v76;
            }
            else
            {
            }
          }

          goto LABEL_15;
        }
      }
LABEL_12:

      goto LABEL_13;
    }
  }
  [(UIInputViewSetPlacementApplicator *)self->_applicator popoverFrame];
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
LABEL_15:

  double v67 = v6;
  double v68 = v8;
  double v69 = v10;
  double v70 = v12;
  result.size.CGFloat height = v70;
  result.size.CGFloat width = v69;
  result.origin.CGFloat y = v68;
  result.origin.CGFloat x = v67;
  return result;
}

- (CGRect)fullInputViewAndAssistantFrame
{
  int v3 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  if (![v3 isInputViewPlaceholder]) {
    goto LABEL_12;
  }
  BOOL v4 = [(UIInputWindowControllerHostingItem *)self hostView];
  double v5 = [v4 window];
  char v6 = [v5 _isHostedInAnotherProcess];

  if (v6)
  {
LABEL_13:
    double v39 = [(UIInputWindowControllerHostingItem *)self owner];
    double v40 = [v39 inputViewSet];
    uint64_t v41 = [v40 inputView];
    [v41 frame];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;

    int v3 = [(UIInputWindowControllerHostingItem *)self hostView];
    double v11 = [(UIInputWindowControllerHostingItem *)self hostView];
    id v21 = [v11 window];
    double v28 = [v21 coordinateSpace];
    objc_msgSend(v3, "convertRect:toCoordinateSpace:", v28, v43, v45, v47, v49);
    double v32 = v50;
    double v34 = v51;
    double v36 = v52;
    double v38 = v53;
    goto LABEL_14;
  }
  double v7 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  double v8 = [v7 inputView];
  int v3 = [v8 placeheldView];

  double v9 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  CGFloat v10 = [v9 inputView];
  double v11 = [v10 associatedView];

  [v3 frame];
  double x = v12;
  double y = v14;
  double width = v16;
  double height = v18;
  id v20 = [v3 superview];

  if (v20)
  {
    id v21 = [v3 superview];
    id v22 = [v11 superview];

    if (!v22) {
      goto LABEL_9;
    }
    [v11 frame];
    v61.origin.double x = v23;
    v61.origin.double y = v24;
    v61.size.double width = v25;
    v61.size.double height = v26;
    v58.origin.double x = x;
    v58.origin.double y = y;
    v58.size.double width = width;
    v58.size.double height = height;
    CGRect v59 = CGRectUnion(v58, v61);
  }
  else
  {
    double v27 = [v11 superview];

    if (!v27)
    {
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
    id v21 = [v11 superview];
    [v11 frame];
  }
  double x = v59.origin.x;
  double y = v59.origin.y;
  double width = v59.size.width;
  double height = v59.size.height;
LABEL_9:
  if (!v21) {
    goto LABEL_11;
  }
  double v28 = [(UIInputWindowControllerHostingItem *)self hostView];
  double v29 = [v28 window];
  double v30 = [v29 coordinateSpace];
  objc_msgSend(v21, "convertRect:toCoordinateSpace:", v30, x, y, width, height);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

LABEL_14:
  double v54 = v32;
  double v55 = v34;
  double v56 = v36;
  double v57 = v38;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.double y = v55;
  result.origin.double x = v54;
  return result;
}

- (void)updateEmptyHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if ([WeakRetained host:self isForPurpose:0])
  {
    int v3 = [(UIInputWindowControllerHostingItem *)self owner];
    +[UIKeyboardImpl sizeForInterfaceOrientation:](UIKeyboardImpl, "sizeForInterfaceOrientation:", [v3 keyboardOrientation]);
    [(NSLayoutConstraint *)self->_emptyHeightConstraint setConstant:v4];
  }
  else
  {
    [(NSLayoutConstraint *)self->_emptyHeightConstraint setConstant:0.0];
  }
}

- (void)updateViewSizingConstraints
{
  int v3 = [(UIInputWindowControllerHostingItem *)self container];
  char v4 = [v3 useCrescendoHostingItem];

  if ((v4 & 1) == 0)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
    [(UIInputWindowControllerHostingItem *)self updateViewSizingConstraints:v5];
    [MEMORY[0x1E4F5B268] activateConstraints:v5];
  }
}

- (void)setCombinedBackdropView:(id)a3
{
  id v5 = a3;
  p_inputCombinedBackdropView = &self->_inputCombinedBackdropView;
  double v7 = self->_inputCombinedBackdropView;
  objc_storeStrong((id *)&self->_inputCombinedBackdropView, a3);
  if (self->_inputCombinedBackdropView)
  {
    double v8 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    double v9 = [(UIInputWindowControllerHostingItem *)self applicator];
    CGFloat v10 = [v9 backdropContainer];
    double v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [(UIInputWindowControllerHostingItem *)self ownerView];
    }
    double v18 = v12;

    uint64_t v19 = [(UIView *)*p_inputCombinedBackdropView superview];
    if (v19)
    {
      id v20 = (void *)v19;
      id v21 = [(UIView *)*p_inputCombinedBackdropView superview];

      if (v21 != v18)
      {
        [(NSMutableDictionary *)self->_backdropInnerGuideConstraints removeObjectForKey:@"items"];
        id v22 = (void *)MEMORY[0x1E4F5B268];
        CGFloat v23 = [(NSMutableDictionary *)self->_backdropInnerGuideConstraints allValues];
        [v22 deactivateConstraints:v23];

        [(NSMutableDictionary *)self->_backdropInnerGuideConstraints removeAllObjects];
        CGFloat v24 = (void *)MEMORY[0x1E4F5B268];
        CGFloat v25 = [(NSMutableDictionary *)self->_inputCombinedBackdropViewEdgeConstraints allValues];
        [v24 deactivateConstraints:v25];

        [(NSMutableDictionary *)self->_inputCombinedBackdropViewEdgeConstraints removeAllObjects];
        [(UIView *)self->_inputCombinedBackdropView removeFromSuperview];
      }
    }
    [v18 insertSubview:self->_inputCombinedBackdropView atIndex:0];
    CGFloat v26 = [(UIInputWindowControllerHostingItem *)self owner];
    [v26 hideGuideBackdrop:0];

    double v27 = [(UIInputWindowControllerHostingItem *)self owner];
    double v28 = objc_msgSend(v27, "transitionGuideBackdrop:", -[UIInputWindowControllerHostingItem animatingBackdrops](self, "animatingBackdrops"));

    inputCombinedBackdropView = self->_inputCombinedBackdropView;
    if (v28)
    {
      [(_UIKBLightEffectsBackground *)inputCombinedBackdropView setClientBackdropInUse:1];
      double v30 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __62__UIInputWindowControllerHostingItem_setCombinedBackdropView___block_invoke;
      v31[3] = &unk_1E52FC280;
      id v32 = v28;
      [v30 performOnDistributedControllers:v31];
    }
    else
    {
      [(_UIKBLightEffectsBackground *)inputCombinedBackdropView setClientBackdropInUse:0];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F5B268];
    double v14 = [(NSMutableDictionary *)self->_inputCombinedBackdropViewEdgeConstraints allValues];
    [v13 deactivateConstraints:v14];

    [(NSMutableDictionary *)self->_inputCombinedBackdropViewEdgeConstraints removeAllObjects];
    [(NSMutableDictionary *)self->_backdropInnerGuideConstraints removeObjectForKey:@"items"];
    char v15 = (void *)MEMORY[0x1E4F5B268];
    double v16 = [(NSMutableDictionary *)self->_backdropInnerGuideConstraints allValues];
    [v15 deactivateConstraints:v16];

    [(NSMutableDictionary *)self->_backdropInnerGuideConstraints removeAllObjects];
    if (v7)
    {
      [(UIView *)v7 removeFromSuperview];
      id v17 = [(UIInputWindowControllerHostingItem *)self owner];
      [v17 hideGuideBackdrop:1];

      [(UIInputWindowControllerHostingItem *)self cleanUpLightEffectsTransition];
      [(UIInputWindowControllerHostingItem *)self updateInputBackdropView];
      [(UIInputWindowControllerHostingItem *)self updateInputAssistantBackdropView];
    }
  }
}

uint64_t __62__UIInputWindowControllerHostingItem_setCombinedBackdropView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 startTransition:0x1ED149E40 withInfo:*(void *)(a1 + 32)];
}

- (void)setInputBackdropView:(id)a3
{
  id v17 = a3;
  id v5 = self->_inputBackdropView;
  objc_storeStrong((id *)&self->_inputBackdropView, a3);
  if (self->_inputBackdropView)
  {
    inputBackdropBackgroundView = self->_inputBackdropBackgroundView;
    if (!inputBackdropBackgroundView)
    {
      double v7 = [UIView alloc];
      [(UIView *)self->_inputBackdropView frame];
      double v8 = -[UIView initWithFrame:](v7, "initWithFrame:");
      double v9 = self->_inputBackdropBackgroundView;
      self->_inputBackdropBackgroundView = v8;

      [(UIView *)self->_inputBackdropBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        [(UIView *)self->_inputBackdropBackgroundView setUserInteractionEnabled:0];
      }
      CGFloat v10 = [(UIInputWindowControllerHostingItem *)self hostView];
      [v10 insertSubview:self->_inputBackdropBackgroundView atIndex:0];

      inputBackdropBackgroundView = self->_inputBackdropBackgroundView;
    }
    -[UIView addSubview:](inputBackdropBackgroundView, "addSubview:");
  }
  else
  {
    if (v5)
    {
      [(UIView *)v5 removeFromSuperview];
      double v11 = (void *)MEMORY[0x1E4F5B268];
      id v12 = [(NSMutableDictionary *)self->_inputBackdropViewEdgeConstraints allValues];
      [v11 deactivateConstraints:v12];

      [(NSMutableDictionary *)self->_inputBackdropViewEdgeConstraints removeAllObjects];
    }
    id v13 = self->_inputBackdropBackgroundView;
    if (v13)
    {
      [(UIView *)v13 removeFromSuperview];
      double v14 = self->_inputBackdropBackgroundView;
      self->_inputBackdropBackgroundView = 0;

      char v15 = (void *)MEMORY[0x1E4F5B268];
      double v16 = [(NSMutableDictionary *)self->_inputBackdropBackgroundViewEdgeConstraints allValues];
      [v15 deactivateConstraints:v16];

      [(NSMutableDictionary *)self->_inputBackdropBackgroundViewEdgeConstraints removeAllObjects];
    }
  }
}

- (void)setInputAssistantBackdropView:(id)a3
{
  id v16 = a3;
  p_inputAssistantBackdropView = &self->_inputAssistantBackdropView;
  char v6 = self->_inputAssistantBackdropView;
  objc_storeStrong((id *)&self->_inputAssistantBackdropView, a3);
  inputBackdropView = self->_inputBackdropView;
  if (inputBackdropView) {
    [(UIView *)*p_inputAssistantBackdropView setHidden:[(UIView *)inputBackdropView isHidden]];
  }
  if (!*p_inputAssistantBackdropView)
  {
    [(UIView *)v6 removeFromSuperview];
    goto LABEL_12;
  }
  double v8 = [(UIView *)self->_inputBackdropBackgroundView superview];
  double v9 = [(UIInputWindowControllerHostingItem *)self hostView];

  if (v8 == v9)
  {
    id v12 = [(UIInputWindowControllerHostingItem *)self hostView];
    id v13 = v12;
    inputAssistantBackdropView = self->_inputAssistantBackdropView;
    inputBackdropBackgroundView = (UIKBInputBackdropView *)self->_inputBackdropBackgroundView;
LABEL_10:
    [v12 insertSubview:inputAssistantBackdropView aboveSubview:inputBackdropBackgroundView];
    goto LABEL_11;
  }
  CGFloat v10 = [(UIView *)self->_inputBackdropView superview];
  double v11 = [(UIInputWindowControllerHostingItem *)self hostView];

  id v12 = [(UIInputWindowControllerHostingItem *)self hostView];
  id v13 = v12;
  inputAssistantBackdropView = self->_inputAssistantBackdropView;
  if (v10 == v11)
  {
    inputBackdropBackgroundView = self->_inputBackdropView;
    goto LABEL_10;
  }
  [v12 insertSubview:inputAssistantBackdropView atIndex:0];
LABEL_11:

LABEL_12:
}

- (void)setInputAccessoryBackdropView:(id)a3
{
  id v11 = a3;
  id v5 = self->_inputAccessoryBackdropView;
  objc_storeStrong((id *)&self->_inputAccessoryBackdropView, a3);
  if (self->_inputAccessoryBackdropView)
  {
    char v6 = [(UIView *)self->_inputBackdropView superview];
    double v7 = [(UIInputWindowControllerHostingItem *)self hostView];

    double v8 = [(UIInputWindowControllerHostingItem *)self hostView];
    double v9 = v8;
    inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
    if (v6 == v7) {
      [v8 insertSubview:inputAccessoryBackdropView aboveSubview:self->_inputBackdropView];
    }
    else {
      [v8 insertSubview:inputAccessoryBackdropView atIndex:0];
    }
  }
  else
  {
    [(UIView *)v5 removeFromSuperview];
  }
}

- (void)_updateBackdropViews
{
  id v36 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  int v3 = +[UIKeyboardImpl activeInstance];
  if (([v3 splitTransitionInProgress] & 1) != 0
    || [(UIKBInputBackdropView *)self->_inputBackdropView _isTransitioning]
    || ([v36 isEmpty] & 1) != 0
    || !self->_inputBackdropView && !self->_inputAccessoryBackdropView && !self->_inputAssistantBackdropView)
  {
    goto LABEL_18;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 && ([v3 centerFilled] & 1) == 0)
  {
    int v16 = [v36 isSplit];
    id v17 = [(UIInputWindowControllerHostingItem *)self owner];
    double v18 = [v17 view];
    [v18 layoutIfNeeded];

    if (!v16) {
      goto LABEL_10;
    }
    [v36 _leftInputViewSetFrame];
    double Width = CGRectGetWidth(v38);
    [v36 inputViewBounds];
    double v20 = CGRectGetWidth(v39);
    [v36 _rightInputViewSetFrame];
    double v21 = v20 - CGRectGetWidth(v40) - Width;
    [v36 inputViewSplitHeight];
    double v23 = v22;
    [(NSLayoutConstraint *)self->_assistantViewHeightConstraint constant];
    double v25 = v24;
    [v36 inputAccessoryViewBounds];
    double Height = CGRectGetHeight(v41);
    double v27 = Width + v21;
    [v36 inputViewBounds];
    double v28 = CGRectGetWidth(v42) - Width;
    double v29 = [v36 inputAccessoryView];

    if (v29)
    {
      [v36 inputAccessoryViewBounds];
      -[UIKBInputBackdropView layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:](self->_inputAccessoryBackdropView, "layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:", 3, 0.0, 0.0, Width, Height, Width + v21, 0.0, CGRectGetWidth(v43) - Width - v21, Height);
    }
    double v30 = [v36 inputAssistantView];
    if (v30)
    {
    }
    else if (!self->_inputAssistantBackdropView)
    {
      BOOL v31 = 0;
LABEL_31:
      if (v29) {
        int v34 = 1;
      }
      else {
        int v34 = v31;
      }
      if (v34) {
        uint64_t v35 = 12;
      }
      else {
        uint64_t v35 = -1;
      }
      -[UIKBInputBackdropView layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:](self->_inputBackdropView, "layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:", v35, 0.0, 0.0, Width, v23, v27, 0.0, v28 - v21, v23);
      goto LABEL_18;
    }
    BOOL v31 = v25 > 0.0;
    [v36 inputViewBounds];
    double v32 = CGRectGetWidth(v44) - Width - v21;
    if (v29) {
      uint64_t v33 = 0;
    }
    else {
      uint64_t v33 = 3;
    }
    -[UIKBInputBackdropView layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:](self->_inputAssistantBackdropView, "layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:", v33, 0.0, 0.0, Width, v25, v27, 0.0, v32, v25);
    goto LABEL_31;
  }
  char v4 = [(UIInputWindowControllerHostingItem *)self owner];
  id v5 = [v4 view];
  [v5 layoutIfNeeded];

LABEL_10:
  inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
  if (inputAccessoryBackdropView)
  {
    [(UIView *)self->_inputAccessoryBackdropView frame];
    double v8 = v7;
    [(UIView *)self->_inputAccessoryBackdropView frame];
    -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](inputAccessoryBackdropView, "layoutInputBackdropToFullWithRect:", 0.0, 0.0, v8);
  }
  inputCombinedBackdropView = self->_inputCombinedBackdropView;
  if (inputCombinedBackdropView)
  {
    [(UIView *)self->_inputCombinedBackdropView bounds];
    double v11 = v10;
    [(UIView *)self->_inputCombinedBackdropView bounds];
  }
  else
  {
    inputAssistantBackdropView = self->_inputAssistantBackdropView;
    if (inputAssistantBackdropView)
    {
      [(UIView *)self->_inputAssistantBackdropView frame];
      double v14 = v13;
      [(UIView *)self->_inputAssistantBackdropView frame];
      -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](inputAssistantBackdropView, "layoutInputBackdropToFullWithRect:", 0.0, 0.0, v14);
    }
    inputCombinedBackdropView = (_UIKBLightEffectsBackground *)self->_inputBackdropView;
    [(UIView *)inputCombinedBackdropView frame];
    double v11 = v15;
    [(UIView *)self->_inputBackdropView frame];
  }
  -[_UIKBLightEffectsBackground layoutInputBackdropToFullWithRect:](inputCombinedBackdropView, "layoutInputBackdropToFullWithRect:", 0.0, 0.0, v11);
LABEL_18:
}

- (void)updateInputBackdropViewVisibility
{
  if ([(UIInputWindowControllerHostingItem *)self useCombinedBackdrop])
  {
    uint64_t v3 = [(UIView *)self->_inputBackdropView isHidden] ^ 1;
    [(UIInputWindowControllerHostingItem *)self updateCombinedBackdropViewAnimated:1 forKeyboardUp:v3];
  }
  else
  {
    [(UIInputWindowControllerHostingItem *)self setCombinedBackdropView:0];
    char v4 = +[UIKeyboardImpl activeInstance];
    id v7 = v4;
    if (v4) {
      uint64_t v5 = [v4 _isBackdropVisible] ^ 1;
    }
    else {
      uint64_t v5 = 0;
    }
    [(UIView *)self->_inputBackdropView setHidden:v5];
    inputBackdropView = self->_inputBackdropView;
    if (inputBackdropView) {
      [(UIView *)self->_inputAssistantBackdropView setHidden:[(UIView *)inputBackdropView isHidden]];
    }
  }
}

- (void)updateRenderConfigForCombinedBackdrop:(id)a3
{
  id v5 = a3;
  if ([(UIInputWindowControllerHostingItem *)self useCombinedBackdrop])
  {
    inputCombinedBackdropView = self->_inputCombinedBackdropView;
    if (inputCombinedBackdropView) {
      [(_UIKBLightEffectsBackground *)inputCombinedBackdropView _setRenderConfig:v5];
    }
    else {
      [(UIInputWindowControllerHostingItem *)self updateCombinedBackdropView];
    }
  }
}

- (void)updateCombinedBackdropView
{
  uint64_t v3 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  char v4 = [(UIInputWindowControllerHostingItem *)self owner];
  id v5 = [v4 view];
  char v6 = [v5 _inheritedRenderConfig];

  id v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v8 = [v7 restorableRenderConfig];

  if (v8)
  {
    id v9 = v8;

    char v6 = v9;
  }
  double v10 = [v3 inputView];
  if (!v10 || ([v3 isInputViewPlaceholder] & 1) != 0)
  {

LABEL_6:
    double v11 = 0;
    goto LABEL_7;
  }
  int v12 = [v6 animatedBackground];

  if (!v12) {
    goto LABEL_6;
  }
  double v13 = [(UIInputWindowControllerHostingItem *)self _inputCombinedBackdropView];
  double v14 = v13;
  if (v13)
  {
    double v15 = v13;
  }
  else
  {
    int v16 = [_UIKBLightEffectsBackground alloc];
    double v15 = -[_UIKBLightEffectsBackground initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  double v20 = v15;

  [(UIView *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIInputWindowControllerHostingItem *)self setInputBackdropView:0];
  [(UIInputWindowControllerHostingItem *)self setInputAssistantBackdropView:0];
  if (![(UIInputWindowControllerHostingItem *)self animatingBackdrops])
  {
    id v17 = [(UIInputWindowControllerHostingItem *)self owner];
    uint64_t v18 = [v17 updateGuideBackdropRenderConfig:v6 animated:0];

    [(_UIKBLightEffectsBackground *)v20 setClientBackdropInUse:v18];
    [(_UIKBLightEffectsBackground *)v20 _setRenderConfig:v6];
  }
  double v11 = v20;
LABEL_7:
  uint64_t v19 = v11;
  [(UIInputWindowControllerHostingItem *)self setCombinedBackdropView:v11];
}

- (void)updateInputBackdropView
{
  uint64_t v3 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  char v4 = [v3 inputView];
  if (!v4 || ([v3 isInputViewPlaceholder] & 1) != 0)
  {
    double v24 = 0;
    goto LABEL_4;
  }
  BOOL v6 = [(UIInputWindowControllerHostingItem *)self useCombinedBackdrop];

  if (!v6)
  {
    id v7 = [(UIInputWindowControllerHostingItem *)self _inputBackdropView];

    double v8 = [v3 inputView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;

    double v13 = [(UIInputWindowControllerHostingItem *)self hostView];
    [v13 frame];
    double v15 = v14;

    int v16 = [(UIInputWindowControllerHostingItem *)self hostView];
    [v16 frame];
    double v18 = v17;

    uint64_t v19 = [(UIInputWindowControllerHostingItem *)self _inputBackdropView];
    double v20 = v19;
    if (v19) {
      double v21 = v19;
    }
    else {
      double v21 = -[UIKBInputBackdropView initWithFrame:]([UIKBInputBackdropView alloc], "initWithFrame:", v15, v10, v18, v12);
    }
    double v24 = v21;

    [(UIView *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v7) {
      goto LABEL_5;
    }
    char v4 = [(UIInputWindowControllerHostingItem *)self owner];
    double v22 = [v4 view];
    double v23 = [v22 _inheritedRenderConfig];
    [(UIKBInputBackdropView *)v24 _setRenderConfig:v23];

LABEL_4:
LABEL_5:
    id v5 = v24;
    goto LABEL_6;
  }
  id v5 = 0;
LABEL_6:
  double v25 = v5;
  [(UIInputWindowControllerHostingItem *)self setInputBackdropView:v5];
  [(UIInputWindowControllerHostingItem *)self updateInputBackdropViewVisibility];
}

- (void)updateInputAccessoryBackdropView
{
  uint64_t v3 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  char v4 = [v3 inputAccessoryView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v6 = [v3 inputAccessoryView];
    [v6 backgroundEdgeInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [v3 inputAccessoryView];
    [v15 frame];
    double v17 = v16;
    double v19 = v18;

    double v20 = [(UIInputWindowControllerHostingItem *)self hostView];
    [v20 frame];
    double v22 = v21;

    double v23 = [(UIInputWindowControllerHostingItem *)self hostView];
    [v23 frame];
    double v25 = v24;

    CGFloat v26 = [(UIInputWindowControllerHostingItem *)self _inputAccessoryBackdropView];
    double v27 = v26;
    if (v26) {
      double v28 = v26;
    }
    else {
      double v28 = -[UIKBInputBackdropView initWithFrame:]([UIKBInputBackdropView alloc], "initWithFrame:", v10 + v22, v8 + v17, v25 - (v14 + v10), v19 - (v8 + v12));
    }
    double v32 = v28;

    [(UIView *)v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v29 = [(UIInputWindowControllerHostingItem *)self owner];
    double v30 = [v29 view];
    BOOL v31 = [v30 _inheritedRenderConfig];
    [(UIKBInputBackdropView *)v32 _setRenderConfig:v31];

    [(UIInputWindowControllerHostingItem *)self setInputAccessoryBackdropView:v32];
  }
  else
  {
    double v32 = 0;
    [(UIInputWindowControllerHostingItem *)self setInputAccessoryBackdropView:0];
  }
}

- (void)updateInputAssistantBackdropView
{
  uint64_t v3 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  char v4 = [v3 inputAssistantView];
  if (!v4
    || ([v3 isInputAssistantViewPlaceholder] & 1) != 0
    || [(UIInputWindowControllerHostingItem *)self useCombinedBackdrop])
  {
    id v5 = 0;
  }
  else
  {
    [v4 frame];
    double v7 = v6;
    double v9 = v8;
    double v10 = [(UIInputWindowControllerHostingItem *)self hostView];
    [v10 frame];
    double v12 = v11;

    double v13 = [(UIInputWindowControllerHostingItem *)self hostView];
    [v13 frame];
    double v15 = v14;

    double v16 = [(UIInputWindowControllerHostingItem *)self _inputAssistantBackdropView];
    double v17 = v16;
    if (v16) {
      double v18 = v16;
    }
    else {
      double v18 = -[UIKBInputBackdropView initWithFrame:]([UIKBInputBackdropView alloc], "initWithFrame:", v12, v7, v15, v9);
    }
    double v23 = v18;

    [(UIView *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v19 = [(UIInputWindowControllerHostingItem *)self owner];
    double v20 = [v19 view];
    double v21 = [v20 _inheritedRenderConfig];
    [(UIKBInputBackdropView *)v23 _setRenderConfig:v21];

    id v5 = v23;
  }
  double v22 = v5;
  [(UIInputWindowControllerHostingItem *)self setInputAssistantBackdropView:v5];
}

- (UIView)dockView
{
  return (UIView *)[(UISystemKeyboardDockController *)self->_dockViewController dockView];
}

- (UIView)scrollTrackingView
{
  if (+[UIKeyboard inputUIOOP])
  {
    uint64_t v3 = [(UIInputWindowControllerHostingItem *)self hostView];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (UIView *)v3;
}

- (BOOL)_shouldShowInputDockView
{
  uint64_t v3 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  if ([v3 isCustomInputView])
  {
    char v4 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    if ([v4 shouldShowDockView]) {
      BOOL v5 = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally];
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally];
  }

  return v5;
}

- (void)configureDockViewController:(BOOL)a3
{
  if (self->_supportsDockViewController)
  {
    if (a3)
    {
      char v4 = [(UIViewController *)[UISystemKeyboardDockController alloc] initWithNibName:0 bundle:0];
      dockViewController = self->_dockViewController;
      self->_dockViewController = v4;
    }
    else
    {
      dockViewController = self->_dockViewController;
      self->_dockViewController = 0;
    }
  }
}

- (void)updateKeyboardDockViewVisibility
{
  if (self->_supportsDockViewController)
  {
    if (!self->_dockViewController)
    {
      [(UIInputWindowControllerHostingItem *)self configureDockViewController:1];
      hostView = self->_hostView;
      char v4 = [(UIViewController *)self->_dockViewController view];
      [(UIView *)hostView addSubview:v4];
    }
    BOOL v5 = [(UIInputWindowControllerHostingItem *)self _shouldShowInputDockView];
    double v6 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    double v7 = [v6 inputView];
    if (v7)
    {
      double v8 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
      if ([v8 isInputViewPlaceholder])
      {
        int v9 = 0;
      }
      else
      {
        double v10 = +[UIKeyboardImpl activeInstance];
        int v9 = v5 & ([v10 isMinimized] ^ 1);
      }
    }
    else
    {
      int v9 = 0;
    }

    double v11 = +[UIKeyboardInputModeController sharedInputModeController];
    double v12 = [v11 currentInputMode];
    double v13 = [v12 identifier];
    int v14 = [v13 isEqualToString:@"autofillsignup"];

    double v15 = [(UISystemKeyboardDockController *)self->_dockViewController dockView];
    [v15 setHidden:v14 & v9 | v9 ^ 1u];

    if (((v14 & v9) | v9 ^ 1))
    {
      dockViewController = self->_dockViewController;
      [(UISystemKeyboardDockController *)dockViewController updateDockItemsVisibility];
    }
    else
    {
      double v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      double v17 = [v16 responder];
      double v18 = [v17 inputAssistantItem];
      id v20 = [v18 _dictationReplacementAction];

      [(UISystemKeyboardDockController *)self->_dockViewController updateDockItemsVisibilityWithCustomDictationAction:v20];
    }
  }
}

- (void)clearVisibilityConstraints
{
  id v5 = [(UIInputWindowControllerHostingItem *)self owner];
  uint64_t v3 = [v5 view];
  char v4 = [(UIInputViewSetPlacementApplicator *)self->_applicator constraints];
  [v3 removeConstraints:v4];
}

- (void)updateCombinedBackdropViewAnimated:(BOOL)a3 forKeyboardUp:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(UIInputWindowControllerHostingItem *)self animatingBackdrops]) {
    return;
  }
  double v7 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  uint64_t v8 = [v7 inputView];
  if (v8)
  {
    int v9 = (void *)v8;
    double v10 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    int v11 = [v10 isInputViewPlaceholder];

    if (!v11)
    {
      if (a3)
      {
        double v12 = [(UIInputWindowControllerHostingItem *)self owner];
        double v13 = [v12 view];
        int v14 = [v13 _inheritedRenderConfig];

        [(UIInputWindowControllerHostingItem *)self setAnimatingBackdrops:1];
        [(UIInputWindowControllerHostingItem *)self updateCombinedBackdropView];
        if (self->_inputCombinedBackdropView)
        {
          if (v4)
          {
            double v15 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
            uint64_t v16 = [v15 inputView];
            if (v16)
            {
              double v17 = (void *)v16;
              double v18 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
              char v19 = [v18 isInputViewPlaceholder];

              if ((v19 & 1) == 0)
              {
                uint64_t v20 = MEMORY[0x1E4F143A8];
                uint64_t v21 = 3221225472;
                double v22 = __87__UIInputWindowControllerHostingItem_updateCombinedBackdropViewAnimated_forKeyboardUp___block_invoke;
                double v23 = &unk_1E52D9F98;
                double v24 = self;
                id v25 = v14;
                +[UIView performWithoutAnimation:&v20];
              }
            }
            else
            {
            }
          }
          -[UIInputWindowControllerHostingItem performAnimatedTransitionToRenderConfig:](self, "performAnimatedTransitionToRenderConfig:", v14, v20, v21, v22, v23, v24);
        }
        else
        {
          [(UIInputWindowControllerHostingItem *)self setAnimatingBackdrops:0];
        }
      }
      else
      {
        [(UIInputWindowControllerHostingItem *)self setAnimatingBackdrops:0];
        [(UIInputWindowControllerHostingItem *)self updateCombinedBackdropView];
        if (v4 && self->_inputCombinedBackdropView)
        {
          [(UIInputWindowControllerHostingItem *)self updateViewConstraints];
        }
      }
      return;
    }
  }
  else
  {
  }
  [(UIInputWindowControllerHostingItem *)self updateCombinedBackdropView];
  [(UIInputWindowControllerHostingItem *)self setAnimatingBackdrops:0];
}

void __87__UIInputWindowControllerHostingItem_updateCombinedBackdropViewAnimated_forKeyboardUp___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) inputViewSet];
  v2 = [v4 inputView];
  if ([*(id *)(a1 + 40) lightKeyboard]) {
    +[UIKBRenderConfig defaultConfig];
  }
  else {
  uint64_t v3 = +[UIKBRenderConfig darkConfig];
  }
  [v2 _setRenderConfig:v3];
}

- (void)performAnimatedTransitionToRenderConfig:(id)a3
{
  id v4 = a3;
  if ([v4 animatedBackground])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke;
    v10[3] = &unk_1E52D9F70;
    v10[4] = self;
    +[UIView performWithoutAnimation:v10];
    inputCombinedBackdropView = self->_inputCombinedBackdropView;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke_2;
    v8[3] = &unk_1E52D9F98;
    v8[4] = self;
    id v9 = v4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke_3;
    v6[3] = &unk_1E52D9F98;
    v6[4] = self;
    id v7 = v9;
    [(_UIKBLightEffectsBackground *)inputCombinedBackdropView performTransitionToRenderConfig:v7 fromRenderConfig:0 alongsideAnimations:v8 completion:v6];
  }
}

void __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) owner];
  id v3 = [v2 transitionGuideBackdrop:1];

  [*(id *)(*(void *)(a1 + 32) + 232) setClientBackdropInUse:v3 != 0];
}

uint64_t __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionInAnimatedForRenderConfig:*(void *)(a1 + 40)];
}

uint64_t __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finalizeTransitionToRenderConfig:*(void *)(a1 + 40)];
}

- (void)transitionInAnimatedForRenderConfig:(id)a3
{
  id v4 = a3;
  if ([v4 animatedBackground])
  {
    id v5 = [(UIInputWindowControllerHostingItem *)self owner];
    [v5 updateGuideBackdropRenderConfig:v4 animated:1];

    id v9 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    double v6 = [v9 inputView];
    [v6 _setRenderConfig:v4];
  }
  else
  {
    -[UIKBInputBackdropView transitionToStyle:isSplit:](self->_inputBackdropView, "transitionToStyle:isSplit:", [v4 backdropStyle], 0);
    -[UIKBInputBackdropView transitionToStyle:isSplit:](self->_inputAssistantBackdropView, "transitionToStyle:isSplit:", [v4 backdropStyle], 0);
    inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
    uint64_t v8 = [v4 backdropStyle];

    [(UIKBInputBackdropView *)inputAccessoryBackdropView transitionToStyle:v8 isSplit:0];
  }
}

- (void)finalizeTransitionToRenderConfig:(id)a3
{
  if ([a3 animatedBackground]) {
    [(UIInputWindowControllerHostingItem *)self cleanUpLightEffectsTransition];
  }
  [(UIInputWindowControllerHostingItem *)self setAnimatingBackdrops:0];
}

- (void)cleanUpLightEffectsTransition
{
  id v2 = [(_UIKBLightEffectsBackground *)self->_inputCombinedBackdropView layerForPositionMatchMove];
  [v2 removeAnimationForKey:0x1ED149E60];
}

- (void)willBeginTranslation
{
  id v3 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
    [v5 willBeginTranslation];
  }
}

- (void)finishSplitTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
    [v7 finishSplitTransition:v3];
  }
}

- (void)didFinishTranslation
{
  BOOL v3 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
    [v5 didFinishTranslation];
  }
  char v6 = [(UIInputWindowControllerHostingItem *)self container];
  [v6 _updateBackdropViews];

  id v7 = [(UIInputWindowControllerHostingItem *)self placement];
  char v8 = [v7 isUndocked];

  if ((v8 & 1) == 0)
  {
    [(UIInputWindowControllerHostingItem *)self resetVerticalConstraint];
  }
}

- (void)updateProgress:(double)a3 startHeight:(double)a4 endHeight:(double)a5
{
  double v9 = a5 - a4;
  double v10 = -(a5 - a4);
  int v11 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  [v11 setSplitHeightDelta:v10];

  double v12 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  [v12 inputViewBounds];
  double v14 = v13;

  double v15 = v9 * a3;
  uint64_t v16 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  double v17 = v16;
  if (a5 - v9 * a3 == 0.0)
  {
    int v18 = [v16 inputViewKeyboardCanSplit];

    if (v18)
    {
      char v19 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
      [v19 _rightInputViewSetFrame];
      double Height = CGRectGetHeight(v87);
      uint64_t v21 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
      [v21 inputViewBounds];
      double v22 = CGRectGetHeight(v88);
      double v23 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
      [v23 inputAssistantViewBounds];
      double v24 = v22 + CGRectGetHeight(v89);
      id v25 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
      [v25 inputAccessoryViewBounds];
      double v26 = Height - (v24 + CGRectGetHeight(v90));

      self->_double verticalTranslationForSplitKeyboard = v26 * a3;
      +[UIKeyboardImpl persistentOffset];
      if (a3 >= 1.0)
      {
        double verticalTranslationForSplitKeyboard = self->_verticalTranslationForSplitKeyboard;
        if (v27 < verticalTranslationForSplitKeyboard) {
          self->_double verticalTranslationForSplitKeyboard = verticalTranslationForSplitKeyboard + v27 - v26;
        }
      }
    }
    return;
  }
  double v76 = v14;
  double v78 = a3;
  uint64_t v29 = [v16 inputAccessoryView];

  double v30 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  uint64_t v31 = [v30 splitExemptSubview];

  double v32 = +[UIKeyboardImpl activeInstance];
  int v33 = [v32 hideAccessoryViewsDuringSplit];

  int v34 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  int v35 = [v34 _inputViewIsSplit];

  BOOL v36 = [(UIKBInputBackdropView *)self->_inputBackdropView _isTransitioning];
  double v37 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  [v37 inputViewSplitHeight];
  double v39 = v38;

  CGRect v40 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  [v40 _leftInputViewSetFrame];
  double Width = CGRectGetWidth(v91);

  CGRect v42 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  [v42 inputViewBounds];
  double v43 = CGRectGetWidth(v92);
  CGRect v44 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  [v44 _rightInputViewSetFrame];
  double v45 = v43 - CGRectGetWidth(v93) - Width;

  double v46 = +[UIKeyboardImpl activeInstance];
  int v47 = [v46 centerFilled];

  double v48 = [(UIInputWindowControllerHostingItem *)self placement];
  double v49 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  [v48 inputAssistantViewHeightForInputViewSet:v49];
  double v80 = v50;

  double v51 = a5 - v39;
  if (v39 >= a5) {
    double v51 = 0.0;
  }
  double v77 = a4 - v51;
  double v52 = (a4 - v51) / 34.0;
  self->_double verticalTranslationForSplitKeyboard = v15;
  if (v47) {
    double v53 = 0.0;
  }
  else {
    double v53 = v45;
  }
  [(UIKBInputBackdropView *)self->_inputBackdropView _beginSplitTransitionIfNeeded:Width gapWidth:v53];
  if (self->_inputAssistantBackdropView)
  {
    double v55 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    char v56 = [v55 isInputViewPlaceholder];

    int v57 = 0;
    if ((v56 & 1) == 0)
    {
      double v58 = v78;
      double v54 = v80;
      if (v80 > 0.0)
      {
        [(UIKBInputBackdropView *)self->_inputAssistantBackdropView _beginSplitTransitionIfNeeded:Width gapWidth:v53];
        int v57 = 1;
      }
      goto LABEL_17;
    }
  }
  else
  {
    int v57 = 0;
  }
  double v58 = v78;
LABEL_17:
  double v59 = floor(v52);
  if (!v36)
  {
    if (v29)
    {
      objc_msgSend((id)v29, "frame", v54);
      uint64_t v79 = v60;
      uint64_t v61 = [(id)v29 _disableLayoutFlushingCount];
      if (v61 >= 1) {
        uint64_t v62 = v61 + 1;
      }
      else {
        uint64_t v62 = 1;
      }
      [(id)v29 _setDisableLayoutFlushingCount:v62];
      [(id)v29 _disableLayoutFlushing];
    }
    else
    {
      objc_msgSend((id)v31, "frame", v54);
      uint64_t v79 = v63;
    }
    if (v57)
    {
      double v64 = v76;
      -[UIKBInputBackdropView setProgress:withFrame:innerCorners:](self->_inputAssistantBackdropView, "setProgress:withFrame:innerCorners:", 3, 0.0, 0.0, 0.0, v76, v80);
      uint64_t v65 = 12;
    }
    else
    {
      uint64_t v65 = -1;
      double v64 = v76;
    }
    -[UIKBInputBackdropView setProgress:withFrame:innerCorners:](self->_inputBackdropView, "setProgress:withFrame:innerCorners:", v65, 0.0, 0.0, 0.0, v64, a4);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke;
    v85[3] = &unk_1E52E7B00;
    char v86 = v57;
    v85[4] = self;
    *(double *)&v85[5] = v64;
    *(double *)&v85[6] = v80;
    *(double *)&v85[7] = v59;
    v85[8] = 0;
    v85[9] = v79;
    *(double *)&v85[10] = v64;
    *(double *)&v85[11] = v39 + v59;
    v85[12] = v65;
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke_2;
    v83[3] = &unk_1E52DA660;
    v83[4] = self;
    id v84 = (id)v29;
    +[UIView animateWithDuration:50530304 delay:v85 options:v83 animations:1.0 completion:1.0e-100];
  }
  +[UIKeyboardImpl persistentOffset];
  if (v66 >= -0.01 || v66 <= v9 || ((v35 ^ 1) & 1) != 0)
  {
    if (v9 < 0.0 && v66 < 0.0)
    {
      double v68 = 0.0;
      if (v35) {
        double v68 = v9;
      }
      self->_double verticalTranslationForSplitKeyboard = v66 - v68 + self->_verticalTranslationForSplitKeyboard;
    }
  }
  else
  {
    double v67 = +[UIPeripheralHost activeInstance];
    objc_msgSend(v67, "setUndockedWithOffset:animated:", 0, 0.0, v9);
  }
  if (v9 > 0.0 && v77 != a4)
  {
    +[UIKeyboardImpl persistentOffset];
    if (v69 > -20.0)
    {
      double v70 = +[UIPeripheralHost activeInstance];
      objc_msgSend(v70, "setUndockedWithOffset:animated:", 0, 0.0, v58 * -20.0);
    }
  }
  [(UIKBInputBackdropView *)self->_inputBackdropView setGestureProgressForSplit:v58];
  if (v57)
  {
    double v71 = (1.0 - v58) * (v59 + v59) + v80;
    double v72 = -(1.0 - v58);
    if (!v35)
    {
      double v72 = v58;
      double v71 = v80 - (v59 + v59) * v58;
    }
    double v73 = v59 * v72;
    -[NSLayoutConstraint setConstant:](self->_assistantViewHeightConstraint, "setConstant:", v71, v80 - (v59 + v59) * v58);
    CGRect v74 = [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints objectForKey:&unk_1ED3F52F8];
    [v74 setConstant:v73];

    [(UIKBInputBackdropView *)self->_inputAssistantBackdropView setGestureProgressForSplit:v58];
  }
  if (v29 | v31)
  {
    if (v33)
    {
      [(UIInputWindowControllerHostingItem *)self setAccessoryViewVisible:0 delay:0.0];
    }
    else
    {
      BOOL v75 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
      [v75 _beginSplitTransitionIfNeeded];
    }
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke_3;
    v81[3] = &unk_1E52E8040;
    char v82 = v33;
    v81[4] = self;
    *(double *)&v81[5] = v58;
    +[UIView animateWithDuration:2048 delay:v81 options:&__block_literal_global_233 animations:0.0 completion:0.0];
  }
}

uint64_t __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setProgress:withFrame:innerCorners:", 3, 1.0, 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48) + *(double *)(a1 + 56));
  }
  id v2 = *(void **)(*(void *)(a1 + 32) + 240);
  uint64_t v3 = *(void *)(a1 + 96);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  double v6 = *(double *)(a1 + 80);
  double v7 = *(double *)(a1 + 88);
  return objc_msgSend(v2, "setProgress:withFrame:innerCorners:", v3, 1.0, v4, v5, v6, v7);
}

void __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 240) _removeAllAnimations:1];
    -[UIView _popDisableLayoutFlushing](*(void **)(a1 + 40));
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 240) layer];
    LODWORD(v4) = 1.0;
    [v3 setSpeed:v4];

    id v5 = [*(id *)(*(void *)(a1 + 32) + 240) layer];
    [v5 setTimeOffset:1.0];
  }
}

void __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) inputViewSet];
    [v2 _setSplitProgress:*(double *)(a1 + 40)];
  }
}

- (BOOL)keyboardController
{
  id v2 = [(UIInputWindowControllerHostingItem *)self owner];
  char v3 = [v2 shouldNotifyRemoteKeyboards] ^ 1;

  return v3;
}

- (UIEdgeInsets)inputViewPadding
{
  id v2 = [(UIInputWindowControllerHostingItem *)self container];
  [v2 _inputViewPadding];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)hideInputViewBackdrops
{
  [(UIView *)self->_inputBackdropView alpha];
  return v2 != 1.0;
}

- (BOOL)hideInputView
{
  double v2 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
  double v3 = [v2 view];
  [v3 alpha];
  BOOL v5 = v4 != 1.0;

  return v5;
}

- (void)setHideInputView:(BOOL)a3
{
  if (a3) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  id v5 = [(UIInputWindowControllerHostingItem *)self _inputViewController];
  double v4 = [v5 view];
  [v4 setAlpha:v3];
}

- (int64_t)inputViewBackdropStyle
{
  double v2 = [(UIInputWindowControllerHostingItem *)self containerView];
  double v3 = [v2 _inheritedRenderConfig];
  int64_t v4 = [v3 backdropStyle];

  return v4;
}

- (BOOL)hideInputAssistantBackdrop
{
  [(UIView *)self->_inputAssistantBackdropView alpha];
  return v2 != 1.0;
}

- (void)setHideInputAssistantBackdrop:(BOOL)a3
{
  double v3 = 1.0;
  if (a3) {
    double v3 = 0.0;
  }
  [(UIView *)self->_inputAssistantBackdropView setAlpha:v3];
}

- (BOOL)dontDismissReachability
{
  double v2 = [(UIInputWindowControllerHostingItem *)self owner];
  char v3 = [v2 dontDismissReachability];

  return v3;
}

- (void)checkPlaceholdersForRemoteKeyboards
{
  id v2 = [(UIInputWindowControllerHostingItem *)self owner];
  [v2 checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:0 layoutSubviews:0];
}

- (void)updateForKeyplaneChangeWithContext:(id)a3
{
  if (!self->_scrolling)
  {
    id v4 = a3;
    id v5 = [(UIInputWindowControllerHostingItem *)self owner];
    [v5 updateForKeyplaneChangeWithContext:v4];
  }
}

- (UIView)view
{
  id v2 = [(UIInputWindowControllerHostingItem *)self owner];
  char v3 = [v2 view];

  return (UIView *)v3;
}

- (BOOL)isChangingPlacement
{
  id v2 = [(UIInputWindowControllerHostingItem *)self owner];
  char v3 = [v2 isChangingPlacement];

  return v3;
}

- (CGPoint)positionConstraintConstant
{
  [(UIInputViewSetPlacementApplicator *)self->_applicator origin];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (UIInputViewSetPlacementApplicator)applicator
{
  return self->_applicator;
}

- (void)setInterfaceAutorotationDisabled:(BOOL)a3
{
}

- (id)constructNotificationInfoForScrollWithMode:(unint64_t)a3
{
  id v5 = [(UIInputWindowControllerHostingItem *)self owner];
  double v6 = [v5 nextAnimationStyle];

  if ([v6 canDismissWithScrollView])
  {
    double v7 = objc_alloc_init(UIInputViewSetNotificationInfo);
    double v8 = [(UIInputWindowControllerHostingItem *)self owner];
    double v9 = [v8 nextAnimationStyle];
    [(UIInputViewSetNotificationInfo *)v7 populateWithAnimationStyle:v9];

    double v10 = [(UIInputWindowControllerHostingItem *)self owner];
    [(UIInputWindowControllerHostingItem *)self notificationsFrame];
    objc_msgSend(v10, "convertRectFromContainerCoordinateSpaceToScreenSpace:");
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    -[UIInputViewSetNotificationInfo populateStartInfoWithFrame:](v7, "populateStartInfoWithFrame:", v12, v14, v16, v18);
    [(UIInputWindowControllerHostingItem *)self _fillInNotificationInfo:v7 forDismissMode:a3];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)_fillInNotificationInfo:(id)a3 forDismissMode:(unint64_t)a4
{
  id v39 = a3;
  if (a4)
  {
    double v8 = [(UIInputWindowControllerHostingItem *)self dockView];
    [v8 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    double v17 = [(UIInputWindowControllerHostingItem *)self inputView];
    [v17 frame];
    v43.origin.double x = v18;
    v43.origin.double y = v19;
    v43.size.double width = v20;
    v43.size.double height = v21;
    v41.origin.double x = v10;
    v41.origin.double y = v12;
    v41.size.double width = v14;
    v41.size.double height = v16;
    CGRect v42 = CGRectUnion(v41, v43);
    double height = v42.size.height;
  }
  else if (a4)
  {
    [(UIView *)self->_hostView frame];
    double height = v6;
  }
  else
  {
    double height = 0.0;
  }
  [v39 beginFrame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = height + v28;
  double v30 = [(UIInputWindowControllerHostingItem *)self owner];
  objc_msgSend(v30, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v23, v29, v25, v27);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  [v39 addKeyboardNotificationDebuggingInfo:@"_fillInNotificationInfo: (hosting item)"];
  objc_msgSend(v39, "populateEndInfoWithFrame:", v32, v34, v36, v38);
}

- (void)prepareForSplitTransition
{
  id v2 = [(UIInputWindowControllerHostingItem *)self owner];
  [v2 prepareForSplitTransition];
}

- (void)finishSplitTransition
{
  id v2 = [(UIInputWindowControllerHostingItem *)self owner];
  [v2 finishSplitTransition];
}

- (void)placementNeedsUpdate:(id)a3
{
  id v4 = a3;
  self->_scrolling = 0;
  id v5 = [(UIInputWindowControllerHostingItem *)self placement];

  if (v5 == v4)
  {
    double v6 = [v4 applicatorInfoForOwner:self];
    double v7 = (void *)[v6 mutableCopy];
    double v8 = NSNumber;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    CGFloat v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "indexOfHost:", self));
    [v7 setObject:v10 forKey:0x1ED149C20];

    double v11 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__UIInputWindowControllerHostingItem_placementNeedsUpdate___block_invoke;
    v13[3] = &unk_1E52FC280;
    id v14 = v6;
    id v12 = v6;
    [v11 performOnDistributedControllers:v13];
  }
}

uint64_t __59__UIInputWindowControllerHostingItem_placementNeedsUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateTransition:0x1ED149C40 withInfo:*(void *)(a1 + 32)];
}

- (void)startTransition:(id)a3 withInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (![v11 isEqualToString:0x1ED149E40])
  {
    double v7 = [v6 objectForKey:0x1ED149D20];
    char v8 = [v7 BOOLValue];

    if (v8) {
      goto LABEL_10;
    }
    if ([v11 isEqualToString:0x1ED149BC0])
    {
      [(UIInputWindowControllerHostingItem *)self willBeginTranslation];
      double v9 = (void *)MEMORY[0x1E4F1CC38];
    }
    else
    {
      if (![v11 isEqualToString:0x1ED149C60]) {
        goto LABEL_10;
      }
      double v9 = [v6 objectForKey:0x1ED149D00];
      [(UIInputWindowControllerHostingItem *)self willBeginTranslation];
      if (!v9) {
        goto LABEL_10;
      }
    }
    CGFloat v10 = [(UIInputWindowControllerHostingItem *)self owner];
    objc_msgSend(v10, "generateNotificationsForStart:", objc_msgSend(v9, "BOOLValue"));

    goto LABEL_10;
  }
  if (self->_inputCombinedBackdropView) {
    [(UIInputWindowControllerHostingItem *)self createAnimationMatchWithInfo:v6];
  }
LABEL_10:
}

- (BOOL)_isForSelf:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:0x1ED149C20];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 integerValue];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    BOOL v8 = v6 == [WeakRetained indexOfHost:self];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)updateTransition:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke;
  aBlock[3] = &unk_1E52D9F98;
  aBlock[4] = self;
  id v8 = v7;
  id v40 = v8;
  double v9 = (void (**)(void))_Block_copy(aBlock);
  if (+[UIKeyboard isKeyboardProcess]
    && !self->_scrolling
    && [v6 isEqualToString:0x1ED149D80])
  {
    [(UIInputWindowControllerHostingItem *)self createAnimationMatchWithInfo:v8];
  }
  int v10 = [v6 isEqualToString:0x1ED149D80];
  if (!v10)
  {
    int v14 = 0;
    int v13 = 0;
    goto LABEL_11;
  }
  id v11 = [(UIInputWindowControllerHostingItem *)self placement];
  if (![v11 showsKeyboard])
  {
    double v35 = v11;
    int v14 = 0;
    int v13 = 0;
    goto LABEL_11;
  }
  id v12 = [(UIInputWindowControllerHostingItem *)self owner];
  if ([v12 dontDismissKeyboardOnScrolling])
  {
    double v34 = v12;
    double v35 = v11;
    int v13 = 0;
    int v14 = 1;
LABEL_11:
    char v15 = objc_msgSend(v6, "isEqualToString:", 0x1ED149BC0, v31);
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if ([WeakRetained host:self isForPurpose:3])
  {

    goto LABEL_33;
  }
  id v33 = WeakRetained;
  double v34 = v12;
  double v35 = v11;
  int v14 = 1;
  int v13 = 1;
  char v15 = objc_msgSend(v6, "isEqualToString:", 0x1ED149BC0, v33);
LABEL_12:
  if ((v15 & 1) != 0 || [v6 isEqualToString:0x1ED149C00])
  {
    CGFloat v16 = v9;
    id v17 = objc_loadWeakRetained((id *)&self->_container);
    if ([v17 host:self isForPurpose:2])
    {
      BOOL v18 = 1;
    }
    else if ([v6 isEqualToString:0x1ED149C40])
    {
      BOOL v18 = [(UIInputWindowControllerHostingItem *)self _isForSelf:v8];
    }
    else
    {
      BOOL v18 = 0;
    }

    double v9 = v16;
    if (v13)
    {
LABEL_23:

      if ((v14 & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_31;
    }
  }
  else if ([v6 isEqualToString:0x1ED149C40])
  {
    BOOL v18 = [(UIInputWindowControllerHostingItem *)self _isForSelf:v8];
    if (v13) {
      goto LABEL_23;
    }
  }
  else
  {
    BOOL v18 = 0;
    if (v13) {
      goto LABEL_23;
    }
  }
  if (!v14)
  {
LABEL_24:
    if (v10) {
      goto LABEL_25;
    }
    goto LABEL_32;
  }
LABEL_31:

  if (v10)
  {
LABEL_25:

    if (!v18) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
LABEL_32:
  if (!v18)
  {
LABEL_36:
    if ([v6 isEqualToString:0x1ED149C60]
      && (id v21 = objc_loadWeakRetained((id *)&self->_container),
          int v22 = [v21 host:self isForPurpose:2],
          v21,
          v22))
    {
      double v23 = [v8 objectForKey:0x1ED149C80];
      [v23 doubleValue];
      double v25 = v24;
      double v26 = [v8 objectForKey:0x1ED149CA0];
      [v26 doubleValue];
      double v28 = v27;
      double v29 = [v8 objectForKey:0x1ED149CC0];
      [v29 doubleValue];
      [(UIInputWindowControllerHostingItem *)self updateProgress:v25 startHeight:v28 endHeight:v30];
    }
    else if ([v6 isEqualToString:0x1ED149EC0])
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke_2;
      v37[3] = &unk_1E52DA040;
      double v38 = v9;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke_3;
      v36[3] = &unk_1E52DC3A0;
      v36[4] = self;
      +[UIView animateWithDuration:0 delay:v37 options:v36 animations:0.25 completion:0.0];
    }
    else if ([v6 isEqualToString:0x1ED149EE0])
    {
      v9[2](v9);
    }
    goto LABEL_43;
  }
LABEL_33:
  if ([v6 isEqualToString:0x1ED149D80]) {
    self->_scrolling = 1;
  }
  CGFloat v20 = [(UIInputWindowControllerHostingItem *)self applicator];
  [v20 applyChanges:v8];

LABEL_43:
}

void __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicator];
  [v2 applyChanges:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) owner];
  double v3 = [v4 view];
  [v3 layoutIfNeeded];
}

uint64_t __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 24) didUpdateTransition];
  }
  return result;
}

- (void)completeTransition:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:0x1ED149D80])
  {
    id v8 = [(UIInputWindowControllerHostingItem *)self placement];
    if ([v8 showsKeyboard])
    {

      goto LABEL_5;
    }
    BOOL v9 = +[UIKeyboard inputUIOOP];

    if (v9)
    {
LABEL_5:
      if (+[UIKeyboard isKeyboardProcess]) {
        [(UIInputWindowControllerHostingItem *)self createAnimationMatchWithInfo:v7];
      }
      self->_scrolling = 0;
      int v10 = [v7 objectForKey:0x1ED149E00];
      id v11 = [v7 objectForKey:0x1ED149DE0];
      if (v10
        || ([(UIInputWindowControllerHostingItem *)self owner],
            id v12 = objc_claimAutoreleasedReturnValue(),
            char v13 = [v12 dontDismissKeyboardOnScrolling],
            v12,
            (v13 & 1) != 0))
      {
        int v14 = -[UIScrollToDismissSupport cancelNotificationsForMode:](self->_cachedScrollDismissController, "cancelNotificationsForMode:", (int)[v10 intValue]);
        [v14 addKeyboardNotificationDebuggingInfo:@"completeTransition: cancel (hosting item)"];
        char v15 = [(UIInputWindowControllerHostingItem *)self owner];
        [v15 postStartNotifications:2 withInfo:v14];

        [v11 doubleValue];
        double v17 = v16;
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_4;
        v48[3] = &unk_1E52D9F70;
        v48[4] = self;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_5;
        v46[3] = &unk_1E52DA660;
        v46[4] = self;
        id v47 = v14;
        id v18 = v14;
        +[UIView animateWithDuration:0 delay:v48 options:v46 animations:v17 completion:0.0];

LABEL_10:
LABEL_30:

        goto LABEL_31;
      }
      objc_initWeak(&location, self);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke;
      v52[3] = &unk_1E52DC308;
      objc_copyWeak(&v53, &location);
      double v37 = (void *)[v52 copy];
      id interactiveTransitionCleanupBlock = self->_interactiveTransitionCleanupBlock;
      self->_id interactiveTransitionCleanupBlock = v37;

      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_2;
      v49[3] = &unk_1E52D9F98;
      id v50 = v7;
      double v51 = self;
      id v39 = (void (**)(void))_Block_copy(v49);
      if (+[UIKeyboard isKeyboardProcess])
      {
        id v40 = [(UIInputWindowControllerHostingItem *)self owner];
        CGRect v41 = +[UIInputViewAnimationStyle animationStyleImmediate];
        [v40 pushAnimationStyle:v41];

        v39[2](v39);
        CGRect v42 = [(UIInputWindowControllerHostingItem *)self owner];
        [v42 popAnimationStyle];
      }
      else
      {
        if (!v11)
        {
          v39[2](v39);
          goto LABEL_37;
        }
        CGRect v42 = [(UIInputWindowControllerHostingItem *)self owner];
        [v11 doubleValue];
        CGRect v43 = +[UIInputViewAnimationStyle animationStyleAnimated:duration:](UIInputViewAnimationStyle, "animationStyleAnimated:duration:", 1);
        [v42 performOperations:v39 withAnimationStyle:v43];
      }
LABEL_37:

      objc_destroyWeak(&v53);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
    CGFloat v19 = [(UIInputWindowControllerHostingItem *)self owner];
    [v19 moveKeyboardLayoutGuideOffscreen];
  }
  if (![v6 isEqualToString:0x1ED149EC0])
  {
    int v10 = [v7 objectForKey:0x1ED149D00];
    int v21 = [v6 isEqualToString:0x1ED149C00];
    int v22 = [(NSMutableDictionary *)self->_assistantBackdropViewEdgeConstraints objectForKey:&unk_1ED3F52F8];
    [v22 setConstant:0.0];

    double v23 = [(UIInputWindowControllerHostingItem *)self placement];
    double v24 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    [v23 inputAssistantViewHeightForInputViewSet:v24];
    -[NSLayoutConstraint setConstant:](self->_assistantViewHeightConstraint, "setConstant:");

    double v25 = [v7 objectForKey:0x1ED149D40];
    LODWORD(v24) = [v25 BOOLValue];

    if (v24)
    {
      double v26 = +[UIPeripheralHost sharedInstance];
      objc_msgSend(v26, "setUndockedWithOffset:animated:", 0, 0.0, self->_verticalTranslationForSplitKeyboard);

      double v27 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
      [v27 refreshPresentation];

      double v28 = [(UIInputWindowControllerHostingItem *)self owner];
      [v28 checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:v10 != 0 layoutSubviews:1];
    }
    double v29 = [v7 objectForKey:0x1ED149CE0];
    double v30 = v29;
    if (v29) {
      -[UIInputWindowControllerHostingItem transitionDidFinish:](self, "transitionDidFinish:", [v29 BOOLValue]);
    }
    if (v21) {
      [(UIInputSetHostView *)self->_hostView layoutIfNeeded];
    }
    if (v10)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_6;
      aBlock[3] = &unk_1E52D9F98;
      aBlock[4] = self;
      id v45 = v10;
      uint64_t v31 = (void (**)(void))_Block_copy(aBlock);
      double v32 = [v7 objectForKey:0x1ED149D60];
      id v33 = v32;
      if (v32)
      {
        dispatch_time_t v34 = [v32 longLongValue];
        dispatch_after(v34, MEMORY[0x1E4F14428], v31);
      }
      else
      {
        v31[2](v31);
      }
    }
    if (v21) {
      [(UIInputWindowControllerHostingItem *)self didFinishTranslation];
    }
    double v35 = [v7 objectForKey:0x1ED149BE0];
    double v36 = v35;
    if (v35) {
      -[UIInputWindowControllerHostingItem finishSplitTransition:](self, "finishSplitTransition:", [v35 BOOLValue]);
    }

    goto LABEL_30;
  }
  CGFloat v20 = [(UIInputWindowControllerHostingItem *)self owner];
  [v20 generateNotificationsForCompactAssistantFlickGestureCompletion:v7];

LABEL_31:
}

void __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishScrollViewTransition];
  [WeakRetained removeMatchMoveAnimationIfNeeded];
}

void __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:0x1ED149DC0];
  double v3 = [*(id *)(a1 + 40) owner];
  id v4 = [*(id *)(a1 + 32) objectForKey:0x1ED149DA0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_3;
  v5[3] = &unk_1E52D9F70;
  v5[4] = *(void *)(a1 + 40);
  [v3 moveFromPlacement:v4 toPlacement:v2 starting:0 completion:v5];
}

uint64_t __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishScrollViewTransition];
}

uint64_t __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetVerticalConstraint];
}

void __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) finishScrollViewTransition];
  [*(id *)(a1 + 32) removeMatchMoveAnimationIfNeeded];
  id v2 = [*(id *)(a1 + 32) owner];
  [*(id *)(a1 + 32) notificationsFrame];
  objc_msgSend(v2, "convertRectFromContainerCoordinateSpaceToScreenSpace:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(*(id *)(a1 + 40), "populateEndInfoWithFrame:", v4, v6, v8, v10);
  id v11 = [*(id *)(a1 + 32) owner];
  [v11 postEndNotifications:2 withInfo:*(void *)(a1 + 40)];
}

void __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) owner];
  objc_msgSend(v2, "generateNotificationsForStart:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
}

- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v20 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (![WeakRetained host:self isForPurpose:200]) {
    goto LABEL_7;
  }
  if (([v20 isFloatingAssistantView] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v11 = [(UIInputWindowControllerHostingItem *)self placement];
  char v12 = [v11 isFloating];

  if ((v12 & 1) == 0)
  {
LABEL_6:
    id WeakRetained = [(UIInputWindowControllerHostingItem *)self owner];
    [WeakRetained setPlacement:v20 quietly:v8 animated:v7 generateSplitNotification:v6];
LABEL_7:
  }
  char v13 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  char v14 = [v13 keyboardActive];

  if ((v14 & 1) == 0)
  {
    char v15 = [(UIInputWindowControllerHostingItem *)self owner];
    double v16 = [v15 _window];
    double v17 = [v16 screen];
    id v18 = +[UIKeyboardMotionSupport supportForScreen:v17];

    if ([v20 isFloatingAssistantView]) {
      id v19 = v20;
    }
    else {
      id v19 = 0;
    }
    [v18 setRemotePlacement:v19];
  }
}

- (void)transitionDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIInputWindowControllerHostingItem *)self setAccessoryViewVisible:1 delay:0.15];
  double v5 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  [v5 _endSplitTransitionIfNeeded];

  inputBackdropView = self->_inputBackdropView;
  BOOL v7 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  -[UIKBInputBackdropView _endSplitTransitionIfNeeded:](inputBackdropView, "_endSplitTransitionIfNeeded:", [v7 isSplit]);

  inputAssistantBackdropView = self->_inputAssistantBackdropView;
  double v9 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  -[UIKBInputBackdropView _endSplitTransitionIfNeeded:](inputAssistantBackdropView, "_endSplitTransitionIfNeeded:", [v9 isSplit]);

  [(UIInputWindowControllerHostingItem *)self _updateBackdropViews];
  if (v3)
  {
    double v10 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
    [v10 refreshPresentation];
  }
  -[UIView _popDisableLayoutFlushing](self->_inputBackdropView);
  id v11 = [(UIInputWindowControllerHostingItem *)self inputAccessoryView];
  -[UIView _popDisableLayoutFlushing](v11);

  [(UIView *)self->_hostView setNeedsLayout];
  id v12 = [(UIInputWindowControllerHostingItem *)self owner];
  [v12 checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:0 layoutSubviews:1];
}

- (void)createAnimationMatchWithInfo:(id)a3
{
  v38[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:0x1ED149E40];

  if (v5)
  {
    BOOL v6 = self->_inputCombinedBackdropView;
    if (v6)
    {
      BOOL v7 = [v4 objectForKeyedSubscript:0x1ED149E60];

      if (v7)
      {
        double v32 = [(_UIKBLightEffectsBackground *)self->_inputCombinedBackdropView layerForPositionMatchMove];
        [v32 removeAnimationForKey:0x1ED149E60];
        BOOL v8 = [v4 objectForKeyedSubscript:0x1ED149E60];
        double v9 = objc_opt_new();
        double v10 = [v8 objectForKeyedSubscript:0x1ED149E80];
        objc_msgSend(v9, "setSourceContextId:", objc_msgSend(v10, "integerValue"));

        id v11 = [v8 objectForKeyedSubscript:0x1ED149EA0];
        objc_msgSend(v9, "setSourceLayerRenderId:", objc_msgSend(v11, "integerValue"));

        [v9 setDuration:INFINITY];
        [v9 setUsesNormalizedCoordinates:1];
        v36[0] = 0;
        v36[1] = 0;
        id v12 = [MEMORY[0x1E4F29238] valueWithBytes:v36 objCType:"{CGPoint=dd}"];
        v38[0] = v12;
        long long v35 = xmmword_186B8C800;
        char v13 = [MEMORY[0x1E4F29238] valueWithBytes:&v35 objCType:"{CGPoint=dd}"];
        v38[1] = v13;
        __asm { FMOV            V0.2D, #1.0 }
        long long v34 = _Q0;
        id v19 = [MEMORY[0x1E4F29238] valueWithBytes:&v34 objCType:"{CGPoint=dd}"];
        v38[2] = v19;
        long long v33 = xmmword_186B89740;
        id v20 = [MEMORY[0x1E4F29238] valueWithBytes:&v33 objCType:"{CGPoint=dd}"];
        v38[3] = v20;
        int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
        [v9 setSourcePoints:v21];

        int v22 = v32;
        [v32 addAnimation:v9 forKey:0x1ED149E60];

LABEL_8:
      }
    }
  }
  else
  {
    BOOL v6 = [(UIInputWindowControllerHostingItem *)self scrollTrackingView];
    if (v6)
    {
      double v23 = [v4 objectForKeyedSubscript:0x1ED149E80];

      if (v23)
      {
        double v24 = [(UIView *)v6 layer];
        [v24 removeAnimationForKey:@"KeyboardScrollToDismissAnimation"];

        int v22 = objc_opt_new();
        double v25 = [v4 objectForKeyedSubscript:0x1ED149E80];
        objc_msgSend(v22, "setSourceContextId:", objc_msgSend(v25, "integerValue"));

        double v26 = [v4 objectForKeyedSubscript:0x1ED149EA0];
        objc_msgSend(v22, "setSourceLayerRenderId:", objc_msgSend(v26, "integerValue"));

        [v22 setDuration:INFINITY];
        [v22 setUsesNormalizedCoordinates:1];
        double v27 = [v4 objectForKeyedSubscript:0x1ED149E20];
        [v27 floatValue];
        double v29 = v28;

        double v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.5, v29 * 0.5 + 0.5);
        double v37 = v30;
        uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
        [v22 setSourcePoints:v31];

        BOOL v8 = [(UIView *)v6 layer];
        [v8 addAnimation:v22 forKey:@"KeyboardScrollToDismissAnimation"];
        goto LABEL_8;
      }
    }
  }
}

- (void)prepareTranslationFromPlacement:(id)a3 to:(id)a4
{
}

- (void)willBeginTranslationFromPlacement:(id)a3 to:(id)a4
{
  if ([(UISplitKeyboardSupport *)self->_cachedSplitKeyboardController startedPlacementFrom:a3 to:a4 forController:self])
  {
    [(UIInputWindowControllerHostingItem *)self willBeginTranslation];
  }
}

- (void)didFinishTranslationFromPlacement:(id)a3 to:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(UISplitKeyboardSupport *)self->_cachedSplitKeyboardController completedPlacementFrom:v7 to:v6 forController:self])
  {
    [(UIInputWindowControllerHostingItem *)self didFinishTranslation];
  }
  [(UIScrollToDismissSupport *)self->_cachedScrollDismissController completedPlacementFrom:v7 to:v6 forController:self];
}

- (double)offsetForSplitTransition
{
  return self->_verticalTranslationForSplitKeyboard;
}

- (void)resetVerticalConstraint
{
  BOOL v3 = [(UIInputWindowControllerHostingItem *)self placement];
  [(UIInputWindowControllerHostingItem *)self updateVisibilityConstraintsForPlacement:v3];

  id v5 = [(UIInputWindowControllerHostingItem *)self owner];
  id v4 = [v5 view];
  [v4 layoutIfNeeded];
}

- (void)configureSplitKeyboardController:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(UIInputWindowControllerHostingItem *)self owner];
    id v5 = [v4 _window];
    id v6 = [v5 screen];
    obj = +[UIKeyboardMotionSupport supportForScreen:v6];

    cachedSplitKeyboardController = self->_cachedSplitKeyboardController;
    BOOL v8 = obj;
    if (cachedSplitKeyboardController != obj)
    {
      [(UIKeyboardMotionSupport *)cachedSplitKeyboardController setMasterController:0];
      objc_storeStrong((id *)&self->_cachedSplitKeyboardController, obj);
      BOOL v8 = self->_cachedSplitKeyboardController;
    }
    [(UIKeyboardMotionSupport *)v8 setMasterController:self];
    double v9 = obj;
  }
  else
  {
    double v10 = [(UIKeyboardMotionSupport *)self->_cachedSplitKeyboardController masterController];

    if (v10 == self) {
      [(UIKeyboardMotionSupport *)self->_cachedSplitKeyboardController setMasterController:0];
    }
    double v9 = self->_cachedSplitKeyboardController;
    self->_cachedSplitKeyboardController = 0;
  }
}

- (void)setAccessoryViewVisible:(BOOL)a3 delay:(double)a4
{
  BOOL v5 = a3;
  id v7 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  int v8 = [v7 setAccessoryViewVisible:v5 delay:a4];

  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__UIInputWindowControllerHostingItem_setAccessoryViewVisible_delay___block_invoke;
    v9[3] = &unk_1E52D9FC0;
    v9[4] = self;
    BOOL v10 = v5;
    +[UIView animateWithDuration:50331648 delay:v9 options:0 animations:0.15 completion:a4];
  }
}

uint64_t __68__UIInputWindowControllerHostingItem_setAccessoryViewVisible_delay___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 256) setAlpha:(double)*(unint64_t *)&a2];
}

- (BOOL)_isForSplitKeyboard
{
  BOOL v4 = +[UIKeyboard isInputSystemUI];
  if (!v4)
  {
    id v2 = [(UIInputWindowControllerHostingItem *)self owner];
    if ([v2 shouldNotifyRemoteKeyboards])
    {
      char v5 = 0;
LABEL_5:

      return v5;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  char v5 = [WeakRetained host:self isForPurpose:2];

  if (!v4) {
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)_isForDragToDismiss
{
  BOOL v3 = [(UIInputWindowControllerHostingItem *)self owner];
  if ([v3 shouldNotifyRemoteKeyboards])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    char v5 = [WeakRetained host:self isForPurpose:3];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)initializeTranslateGestureRecognizerIfNecessary
{
  BOOL v3 = [(UIInputWindowControllerHostingItem *)self owner];
  BOOL v4 = [v3 _window];
  char v5 = [v4 windowScene];
  int v6 = [v5 _isKeyWindowScene];

  if (+[UIKeyboardImpl rivenInstalled])
  {
    id v7 = [(UIKeyboardMotionSupport *)self->_cachedSplitKeyboardController masterController];
    if (v7 == self)
    {

      if (!v6) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
    int v8 = v7;
    BOOL v9 = [(UIInputWindowControllerHostingItem *)self _isForSplitKeyboard];

    if (v9) {
      [(UIInputWindowControllerHostingItem *)self configureSplitKeyboardController:1];
    }
  }
  if (!v6) {
    goto LABEL_9;
  }
LABEL_6:
  if ([(UIInputWindowControllerHostingItem *)self _isForDragToDismiss]) {
    [(UIInputWindowControllerHostingItem *)self configureScrollDismissController:1];
  }
LABEL_9:
  BOOL v10 = [(UIInputWindowControllerHostingItem *)self placement];
  if (([v10 isFloatingAssistantView] & 1) == 0)
  {

    goto LABEL_16;
  }
  id v11 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  id v12 = [v11 assistantViewController];
  char v13 = [v12 _usesCustomBackground];

  if (v13)
  {
LABEL_16:
    uint64_t v22 = 0;
    goto LABEL_17;
  }
  if (!+[UIKeyboard isInputSystemUI])
  {
    char v14 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    char v15 = [v14 visualModeManager];
    int v16 = [v15 shouldShowWithinAppWindow];

    double v17 = [(UIInputWindowControllerHostingItem *)self owner];
    id v18 = [v17 _window];
    int v19 = [v18 _isAlwaysKeyboardWindow];
    int v20 = v19;
    if (v16)
    {
      char v21 = v6 & ~(_BYTE)v19;

      if ((v21 & 1) == 0) {
        return;
      }
    }
    else
    {

      if (!v20) {
        return;
      }
    }
  }
  double v23 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  int v24 = [v23 keyboardActive];

  if (!v24) {
    return;
  }
  uint64_t v22 = 1;
LABEL_17:
  [(UIInputWindowControllerHostingItem *)self configureFlickingAssistantViewController:v22];
}

- (void)configureScrollDismissController:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(UIInputWindowControllerHostingItem *)self owner];
    char v5 = [v4 _window];
    int v6 = [v5 screen];
    obj = +[UIKeyboardMotionSupport supportForScreen:v6];

    cachedScrollDismissController = self->_cachedScrollDismissController;
    int v8 = obj;
    if (cachedScrollDismissController != obj)
    {
      [(UIKeyboardMotionSupport *)cachedScrollDismissController setMasterController:0];
      objc_storeStrong((id *)&self->_cachedScrollDismissController, obj);
      int v8 = self->_cachedScrollDismissController;
    }
    [(UIKeyboardMotionSupport *)v8 setMasterController:self];
    BOOL v9 = obj;
  }
  else
  {
    BOOL v10 = [(UIKeyboardMotionSupport *)self->_cachedScrollDismissController masterController];

    if (v10 == self) {
      [(UIKeyboardMotionSupport *)self->_cachedScrollDismissController setMasterController:0];
    }
    BOOL v9 = self->_cachedScrollDismissController;
    self->_cachedScrollDismissController = 0;
  }
}

- (void)finishScrollViewTransition
{
}

- (void)clearInteractiveTransitionStateIfNecessary
{
  id interactiveTransitionCleanupBlock = (void (**)(id, SEL))self->_interactiveTransitionCleanupBlock;
  if (interactiveTransitionCleanupBlock)
  {
    interactiveTransitionCleanupBlock[2](interactiveTransitionCleanupBlock, a2);
    id v4 = self->_interactiveTransitionCleanupBlock;
    self->_id interactiveTransitionCleanupBlock = 0;
  }
}

- (void)removeMatchMoveAnimationIfNeeded
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    BOOL v3 = [(UIInputWindowControllerHostingItem *)self scrollTrackingView];
    id v4 = [v3 layer];
    char v5 = [v4 animationForKey:@"KeyboardScrollToDismissAnimation"];

    if (v5)
    {
      id v7 = [(UIInputWindowControllerHostingItem *)self scrollTrackingView];
      int v6 = [v7 layer];
      [v6 removeAnimationForKey:@"KeyboardScrollToDismissAnimation"];
    }
  }
}

- (void)enumerateBoundingRects:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v6 = [(UIInputWindowControllerHostingItem *)self inputViewSet];
  if ([v6 isSplit])
  {
    [v6 _leftInputViewSetFrame];
    v4[2](v4);
    [v6 _rightInputViewSetFrame];
    v4[2](v4);
  }
  else
  {
    char v5 = [(UIInputWindowControllerHostingItem *)self placement];
    [v5 adjustBoundsForNotificationsWithOwner:self];
    v4[2](v4);

    id v4 = (void (**)(void))v5;
  }
}

- (void)configureFlickingAssistantViewController:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(UIInputWindowControllerHostingItem *)self owner];
    char v5 = [v4 _window];
    id v6 = [v5 screen];
    obj = +[UIKeyboardMotionSupport supportForScreen:v6];

    cachedFlickingAssistantViewController = self->_cachedFlickingAssistantViewController;
    int v8 = obj;
    if (cachedFlickingAssistantViewController != obj)
    {
      [(UIKeyboardMotionSupport *)cachedFlickingAssistantViewController setMasterController:0];
      objc_storeStrong((id *)&self->_cachedFlickingAssistantViewController, obj);
      int v8 = self->_cachedFlickingAssistantViewController;
    }
    [(UIKeyboardMotionSupport *)v8 setMasterController:self];
    BOOL v9 = obj;
  }
  else
  {
    BOOL v10 = [(UIKeyboardMotionSupport *)self->_cachedFlickingAssistantViewController masterController];

    if (v10 == self) {
      [(UIKeyboardMotionSupport *)self->_cachedFlickingAssistantViewController setMasterController:0];
    }
    BOOL v9 = self->_cachedFlickingAssistantViewController;
    self->_cachedFlickingAssistantViewController = 0;
  }
}

- (UIFlickingAssistantViewSupport)flickingAssistantViewSupport
{
  return self->_cachedFlickingAssistantViewController;
}

- (_UIKBLightEffectsBackground)_inputCombinedBackdropView
{
  return self->_inputCombinedBackdropView;
}

- (UIKBInputBackdropView)_inputBackdropView
{
  return self->_inputBackdropView;
}

- (UIKBInputBackdropView)_inputAssistantBackdropView
{
  return self->_inputAssistantBackdropView;
}

- (UIKBInputBackdropView)_inputAccessoryBackdropView
{
  return self->_inputAccessoryBackdropView;
}

- (void)setHostView:(id)a3
{
}

- (void)setApplicator:(id)a3
{
}

- (UIView)floatingKeyboardMaskView
{
  return self->_floatingKeyboardMaskView;
}

- (void)setFloatingKeyboardMaskView:(id)a3
{
}

- (void)setAnimatingBackdrops:(BOOL)a3
{
  self->_animatingBackdrops = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingKeyboardMaskView, 0);
  objc_storeStrong((id *)&self->_applicator, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_controllerDelegate, 0);
  objc_storeStrong((id *)&self->_inputAccessoryBackdropView, 0);
  objc_storeStrong((id *)&self->_inputAssistantBackdropView, 0);
  objc_storeStrong((id *)&self->_inputBackdropView, 0);
  objc_storeStrong((id *)&self->_inputCombinedBackdropView, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_inputAssistantHostView, 0);
  objc_storeStrong((id *)&self->_cachedPlacement, 0);
  objc_storeStrong((id *)&self->_dockViewController, 0);
  objc_storeStrong((id *)&self->_inputBackdropBackgroundView, 0);
  objc_storeStrong((id *)&self->_accessoryBackdropViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_assistantBackdropViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_inputDockViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_inputBackdropBackgroundViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_inputBackdropViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_backdropInnerGuideConstraints, 0);
  objc_storeStrong((id *)&self->_inputCombinedBackdropViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_accessoryViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_assistantViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_inputViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_emptyHeightConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_assistantViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, 0);
  objc_storeStrong(&self->_interactiveTransitionCleanupBlock, 0);
  objc_storeStrong((id *)&self->_cachedFlickingAssistantViewController, 0);
  objc_storeStrong((id *)&self->_cachedScrollDismissController, 0);
  objc_storeStrong((id *)&self->_cachedSplitKeyboardController, 0);
}

@end