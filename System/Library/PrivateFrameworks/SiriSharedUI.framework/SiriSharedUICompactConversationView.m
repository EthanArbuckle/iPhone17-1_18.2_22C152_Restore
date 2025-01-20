@interface SiriSharedUICompactConversationView
- (BOOL)_isConversationSnippetHintType:(id)a3;
- (BOOL)_shouldAddVibrancyForSnippet:(id)a3;
- (BOOL)_useShadowForPlatter;
- (BOOL)allowAutomaticConversationSnippetViewScaling;
- (BOOL)contentSupportsCollapsingForHeight:(double)a3;
- (BOOL)isCurrentlyTrackingGesture;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (BOOL)layerHasOpacity;
- (BOOL)showingCollapsedUI;
- (BOOL)transitionToExpandablePlatterStyle:(int64_t)a3;
- (BOOL)useLowerPriorityHeightConstraint;
- (BOOL)willAutomaticallyCollapseWhenResultIsScrolled;
- (CGSize)_fittingSize;
- (CGSize)_sizeOfSnippet:(id)a3;
- (CGSize)_sizeThatFits:(CGSize)a3 forSnippet:(id)a4;
- (CGSize)_sizeThatFitsAllSnippets:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)conversationSnippetViews;
- (NSArray)customAttachmentConstraints;
- (NSArray)serverUtterances;
- (NSString)userUtterance;
- (SRUIFSpeechRecognitionHypothesis)speechRecognitionHypothesis;
- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate;
- (SiriSharedUICompactConversationView)initWithFrame:(CGRect)a3;
- (SiriSharedUICompactConversationView)initWithStreamingTextView:(id)a3 emojiMaskStreamingTextView:(id)a4;
- (SiriSharedUICompactConversationViewDelegate)delegate;
- (SiriSharedUICompactServerUtteranceView)_serverUtteranceView;
- (SiriSharedUIDropletContentDelegate)dropletContainerDelegate;
- (SiriSharedUIExpandablePlatterPanGestureRecognizer)expandablePlatterGesture;
- (SiriSharedUILatencyViewModel)latencyViewModel;
- (SiriSharedUIStackableContentDelegate)stackContainerDelegate;
- (SiriSharedUIStandardScrollView)scrollView;
- (SiriSharedUIViewStackConstraints)stackConstraints;
- (UIEdgeInsets)serverUtteranceContentInsets;
- (UIEdgeInsets)snippetContentInsets;
- (UIEdgeInsets)userUtteranceContentInsets;
- (UIView)conversationSnippetContainerView;
- (double)attachmentYOffset;
- (id)_conversationAppearAnimation;
- (id)_conversationDisappearAnimation;
- (id)_keyForSnippet:(id)a3;
- (id)parserSpeakableObjectProviderForServerUtterance:(id)a3;
- (id)prepareForUpdatesPendingCompletionBlocks;
- (int64_t)_animatedPresentationType;
- (int64_t)attachmentType;
- (int64_t)currentExpandablePlatterStyle;
- (void)_adjustCornerRadiusForSnippetView:(id)a3 vibrancyView:(id)a4;
- (void)_adjustHintCornerRadiusForSnippetView:(id)a3 vibrancyView:(id)a4;
- (void)_prepareHintForAnimation;
- (void)_reloadConversationSnippetViewsIfHint;
- (void)_resetExpandablePlatterGestureState;
- (void)_resetExpansionStateForNewContent;
- (void)_setServerUtteranceView:(id)a3;
- (void)_setupSubviews;
- (void)_updateAmbientSnippetScaling;
- (void)_updateExpandableDrawerUI;
- (void)_updateExpandedHeight;
- (void)_updateSubviewContentInsets;
- (void)animateAppearanceIfNeeded;
- (void)animateFadeOutWithCompletion:(id)a3;
- (void)animateForDrillIn;
- (void)didCompleteAnimatedFadeOut;
- (void)expandablePlatterGesture:(id)a3 didCompleteTransitionToStyle:(int64_t)a4 phaseHeight:(double)a5;
- (void)expandablePlatterGesture:(id)a3 trackingGestureDidUpdateHeight:(double)a4;
- (void)expandablePlatterGestureDidBeginWithRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)prepareForUpdatesToServerUtterance:(BOOL)a3 conversationSnippetViews:(BOOL)a4 speechRecognitionHypothesis:(BOOL)a5 latencyViewModel:(BOOL)a6 updateBlock:(id)a7;
- (void)relayout;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)serverUtteranceView:(id)a3 utteranceViewDidAppear:(id)a4;
- (void)serverUtteranceView:(id)a3 utteranceViewDidDisappear:(id)a4;
- (void)setAllowAutomaticConversationSnippetViewScaling:(BOOL)a3;
- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3;
- (void)setAttachmentType:(int64_t)a3;
- (void)setAttachmentYOffset:(double)a3;
- (void)setConversationSnippetContainerView:(id)a3;
- (void)setConversationSnippetViews:(id)a3;
- (void)setCurrentExpandablePlatterStyle:(int64_t)a3;
- (void)setCustomAttachmentConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDropletContainerDelegate:(id)a3;
- (void)setExpandablePlatterGesture:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setLatencyViewModel:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setServerUtterances:(id)a3;
- (void)setShowCollapsedUI:(BOOL)a3;
- (void)setShowingCollapsedUI:(BOOL)a3;
- (void)setSpeechRecognitionHypothesis:(id)a3;
- (void)setStackConstraints:(id)a3;
- (void)setStackContainerDelegate:(id)a3;
- (void)setUseLowerPriorityHeightConstraint:(BOOL)a3;
- (void)setUserUtterance:(id)a3;
- (void)snippetContentDidUpdate;
- (void)snippetContentDidUpdateForHint;
- (void)updateContentSizeWithAnimation:(BOOL)a3;
- (void)userUtteranceView:(id)a3 speechRecognitionHypothesisDidAppear:(id)a4;
- (void)userUtteranceView:(id)a3 speechRecognitionHypothesisDidDisappear:(id)a4;
- (void)userUtteranceViewContentHeightDidUpdate:(id)a3;
- (void)userUtteranceViewTapped:(id)a3;
@end

@implementation SiriSharedUICompactConversationView

- (SiriSharedUICompactConversationView)initWithStreamingTextView:(id)a3 emojiMaskStreamingTextView:(id)a4
{
  return -[SiriSharedUICompactConversationView initWithFrame:](self, "initWithFrame:", a3, a4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (SiriSharedUICompactConversationView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUICompactConversationView;
  v3 = -[SiriSharedUICompactConversationView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v4 = v3;
  if (v3)
  {
    [(SiriSharedUICompactConversationView *)v3 _setupSubviews];
    v5 = [(SiriSharedUICompactConversationView *)v4 layer];
    [v5 setOpacity:0.0];
  }
  return v4;
}

- (void)_setupSubviews
{
  v3 = [[SiriSharedUIExpandablePlatterPanGestureRecognizer alloc] initWithExpansionDelegate:self];
  [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)v3 setCollapsedHeight:60.0];
  [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)v3 setInitialHeight:300.0];
  [(SiriSharedUICompactConversationView *)self addGestureRecognizer:v3];
  expandablePlatterGesture = self->_expandablePlatterGesture;
  self->_expandablePlatterGesture = v3;
  v5 = v3;

  v6 = [MEMORY[0x263F5E700] platterViewWithBlurEffectStyle:9];
  platterView = self->_platterView;
  self->_platterView = v6;

  [(PLPlatterView *)self->_platterView _setContinuousCornerRadius:23.5];
  [(SiriSharedUICompactConversationView *)self addSubview:self->_platterView];
  v8 = [SiriSharedUIAdaptiveGrabberView alloc];
  v9 = -[SiriSharedUIAdaptiveGrabberView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  grabberView = self->_grabberView;
  self->_grabberView = v9;

  [(SiriSharedUIAdaptiveGrabberView *)self->_grabberView sizeToFit];
  [(SiriSharedUIAdaptiveGrabberView *)self->_grabberView setStyle:0 animated:0];
  [(SiriSharedUICompactConversationView *)self addSubview:self->_grabberView];
  [(SiriSharedUIAdaptiveGrabberView *)self->_grabberView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(SiriSharedUIAdaptiveGrabberView *)self->_grabberView centerXAnchor];
  v12 = [(SiriSharedUICompactConversationView *)self centerXAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [(SiriSharedUIAdaptiveGrabberView *)self->_grabberView topAnchor];
  v15 = [(SiriSharedUICompactConversationView *)self topAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = objc_alloc_init(SiriSharedUIStandardView);
  containerView = self->_containerView;
  self->_containerView = &v17->super;

  [(UIView *)self->_containerView setClipsToBounds:1];
  v19 = self->_containerView;
  v20 = [MEMORY[0x263F825C8] clearColor];
  [(UIView *)v19 setBackgroundColor:v20];

  v21 = [(PLPlatterView *)self->_platterView customContentView];
  [v21 addSubview:self->_containerView];

  v22 = objc_alloc_init(SiriSharedUIStandardScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v22;

  [(SiriSharedUIStandardScrollView *)self->_scrollView setScrollEnabled:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setDelegate:self];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setKeyboardDismissMode:2];
  [(UIView *)self->_containerView addSubview:self->_scrollView];
  [(PLPlatterView *)self->_platterView _continuousCornerRadius];
  v25 = -[SiriSharedUICompactUserUtteranceView initWithContentInsets:cornerRadius:]([SiriSharedUICompactUserUtteranceView alloc], "initWithContentInsets:cornerRadius:", 16.0, 16.0, 0.0, 16.0, v24);
  userUtteranceView = self->_userUtteranceView;
  self->_userUtteranceView = v25;

  [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView setDelegate:self];
  [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:self->_userUtteranceView];
  v27 = -[SiriSharedUICompactServerUtteranceView initWithContentInsets:delegate:]([SiriSharedUICompactServerUtteranceView alloc], "initWithContentInsets:delegate:", self, 16.0, 16.0, 16.0, 16.0);
  serverUtteranceView = self->_serverUtteranceView;
  self->_serverUtteranceView = v27;

  [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:self->_serverUtteranceView];
  v29 = objc_alloc_init(SiriSharedUIStandardView);
  conversationSnippetContainerView = self->_conversationSnippetContainerView;
  self->_conversationSnippetContainerView = &v29->super;

  [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:self->_conversationSnippetContainerView];
  [(SiriSharedUICompactConversationView *)self setCurrentExpandablePlatterStyle:1];
  uint64_t v31 = SiriSharedUILanguageSemanticContentAttribute();
  SiriSharedUIRecursiveSetSemanticContentAttribute(self, v31);
}

- (id)prepareForUpdatesPendingCompletionBlocks
{
  prepareForUpdatesPendingCompletionBlocks = self->_prepareForUpdatesPendingCompletionBlocks;
  if (!prepareForUpdatesPendingCompletionBlocks)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v5 = self->_prepareForUpdatesPendingCompletionBlocks;
    self->_prepareForUpdatesPendingCompletionBlocks = v4;

    prepareForUpdatesPendingCompletionBlocks = self->_prepareForUpdatesPendingCompletionBlocks;
  }
  return prepareForUpdatesPendingCompletionBlocks;
}

- (void)prepareForUpdatesToServerUtterance:(BOOL)a3 conversationSnippetViews:(BOOL)a4 speechRecognitionHypothesis:(BOOL)a5 latencyViewModel:(BOOL)a6 updateBlock:(id)a7
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v11 = a7;
  v12 = [(SiriSharedUICompactConversationView *)self delegate];
  int v13 = [v12 conversationViewShouldAlwaysShowSpeechFeedback:self];

  BOOL v14 = 0;
  if (((v13 ^ 1) & 1) == 0 && v7) {
    BOOL v14 = !self->_waitingForFinalSpeechHypothesis;
  }
  int v15 = (v9 || v8) & (v13 ^ 1);
  v16 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    BOOL runningPrepareForUpdates = self->_runningPrepareForUpdates;
    *(_DWORD *)buf = 136315906;
    v28 = "-[SiriSharedUICompactConversationView prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecogn"
          "itionHypothesis:latencyViewModel:updateBlock:]";
    __int16 v29 = 1024;
    BOOL v30 = runningPrepareForUpdates;
    __int16 v31 = 1024;
    BOOL v32 = v14;
    __int16 v33 = 1024;
    int v34 = v15;
    _os_log_impl(&dword_20C9D5000, v16, OS_LOG_TYPE_DEFAULT, "%s #compact prepareForUpdates isAlreadyRunningPrepareForUpdates: %d, meetsRequirementsForASRUpdating: %d, meetsRequirementsForContentUpdating: %d", buf, 0x1Eu);
  }
  if (self->_runningPrepareForUpdates || (v14 | v15) == 0)
  {
    if (v11)
    {
      if (self->_runningPrepareForUpdates)
      {
        v19 = [(SiriSharedUICompactConversationView *)self prepareForUpdatesPendingCompletionBlocks];
        v20 = (void *)[v11 copy];
        v21 = _Block_copy(v20);
        [v19 addObject:v21];
      }
      else
      {
        (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
      }
    }
  }
  else
  {
    self->_BOOL runningPrepareForUpdates = 1;
    if (v14) {
      self->_waitingForFinalSpeechHypothesis = 1;
    }
    if (v11)
    {
      v22 = [(SiriSharedUICompactConversationView *)self prepareForUpdatesPendingCompletionBlocks];
      v23 = (void *)[v11 copy];
      double v24 = _Block_copy(v23);
      [v22 addObject:v24];
    }
    objc_initWeak((id *)buf, self);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __156__SiriSharedUICompactConversationView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke;
    v25[3] = &unk_2640E3870;
    objc_copyWeak(&v26, (id *)buf);
    [(SiriSharedUICompactConversationView *)self animateFadeOutWithCompletion:v25];
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

void __156__SiriSharedUICompactConversationView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 483) = 0;
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v7 = "-[SiriSharedUICompactConversationView prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecog"
           "nitionHypothesis:latencyViewModel:updateBlock:]_block_invoke";
      _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact processing any pending update completionBlocks", buf, 0xCu);
    }
    v4 = objc_alloc_init(SiriSharedUIAnimationContext);
    [(SiriSharedUIAnimationContext *)v4 setAnimationDuration:0.0];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __156__SiriSharedUICompactConversationView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke_11;
    v5[3] = &unk_2640E37F8;
    v5[4] = v2;
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v5 context:v4 completion:0];
  }
}

uint64_t __156__SiriSharedUICompactConversationView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke_11(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "prepareForUpdatesPendingCompletionBlocks", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  BOOL v7 = [*(id *)(a1 + 32) prepareForUpdatesPendingCompletionBlocks];
  [v7 removeAllObjects];

  [*(id *)(a1 + 32) updateContentSizeWithAnimation:0];
  [*(id *)(a1 + 32) setNeedsDisplay];
  [*(id *)(a1 + 32) layoutIfNeeded];
  return [MEMORY[0x263F158F8] commit];
}

- (void)didCompleteAnimatedFadeOut
{
  self->_runningAnimatedFadeOut = 0;
  if (self->_requestedAppearanceAnimation)
  {
    [(SiriSharedUICompactConversationView *)self animateAppearanceIfNeeded];
    self->_requestedAppearanceAnimation = 0;
  }
}

- (void)animateFadeOutWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SiriSharedUICompactConversationView *)self layerHasOpacity])
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SiriSharedUICompactConversationView animateFadeOutWithCompletion:]";
      _os_log_impl(&dword_20C9D5000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeOut of conversationView", buf, 0xCu);
    }
    self->_runningAnimatedFadeOut = 1;
    [MEMORY[0x263F158F8] begin];
    objc_initWeak((id *)buf, self);
    uint64_t v6 = (void *)MEMORY[0x263F158F8];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    long long v12 = __68__SiriSharedUICompactConversationView_animateFadeOutWithCompletion___block_invoke;
    int v13 = &unk_2640E3898;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v4;
    [v6 setCompletionBlock:&v10];
    BOOL v7 = [(SiriSharedUICompactConversationView *)self layer];
    uint64_t v8 = [(SiriSharedUICompactConversationView *)self _conversationDisappearAnimation];
    [v7 addAnimation:v8 forKey:@"conversationDisappearance"];

    long long v9 = [(SiriSharedUICompactConversationView *)self layer];
    [v9 setOpacity:0.0];

    [MEMORY[0x263F158F8] commit];
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __68__SiriSharedUICompactConversationView_animateFadeOutWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__SiriSharedUICompactConversationView_animateFadeOutWithCompletion___block_invoke_2;
    block[3] = &unk_2640E37F8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __68__SiriSharedUICompactConversationView_animateFadeOutWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteAnimatedFadeOut];
}

- (void)animateAppearanceIfNeeded
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_runningAnimatedFadeOut)
  {
    self->_requestedAppearanceAnimation = 1;
  }
  else if (![(SiriSharedUICompactConversationView *)self layerHasOpacity])
  {
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      long long v9 = "-[SiriSharedUICompactConversationView animateAppearanceIfNeeded]";
      _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeIn of conversationView", (uint8_t *)&v8, 0xCu);
    }
    [MEMORY[0x263F158F8] begin];
    id v4 = [(SiriSharedUICompactConversationView *)self layer];
    uint64_t v5 = [(SiriSharedUICompactConversationView *)self _conversationAppearAnimation];
    [v4 addAnimation:v5 forKey:@"conversationAppearance"];

    uint64_t v6 = [(SiriSharedUICompactConversationView *)self layer];
    LODWORD(v7) = 1.0;
    [v6 setOpacity:v7];

    if (self->_isInAmbient) {
      +[SiriSharedUICAFiltering applyGaussianBlurFilterToView:self];
    }
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)animateForDrillIn
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__SiriSharedUICompactConversationView_animateForDrillIn__block_invoke;
  v2[3] = &unk_2640E3A78;
  v2[4] = self;
  [(SiriSharedUICompactConversationView *)self animateFadeOutWithCompletion:v2];
}

uint64_t __56__SiriSharedUICompactConversationView_animateForDrillIn__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) didCompleteAnimatedFadeOut];
  }
  return result;
}

- (id)_conversationAppearAnimation
{
  uint64_t v3 = [(SiriSharedUICompactConversationView *)self delegate];
  int v4 = [v3 conversationViewShouldAlwaysShowSpeechFeedback:self];

  if (v4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 3;
  }
  uint64_t v6 = NSNumber;
  [(SiriSharedUICompactConversationView *)self frame];
  int v8 = [v6 numberWithDouble:v7];
  long long v9 = +[SiriSharedUIAnimationUtilities animationForStyle:v5 expectedWidthForStyle:v8 presentationType:[(SiriSharedUICompactConversationView *)self _animatedPresentationType]];

  return v9;
}

- (id)_conversationDisappearAnimation
{
  int64_t v2 = [(SiriSharedUICompactConversationView *)self _animatedPresentationType];
  return +[SiriSharedUIAnimationUtilities animationForStyle:2 expectedWidthForStyle:0 presentationType:v2];
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
}

- (BOOL)layerHasOpacity
{
  int64_t v2 = [(SiriSharedUICompactConversationView *)self layer];
  [v2 opacity];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[SiriSharedUICompactUserUtteranceView sizeThatFits:](self->_userUtteranceView, "sizeThatFits:");
  double v7 = v6;
  -[SiriSharedUICompactServerUtteranceView sizeThatFits:](self->_serverUtteranceView, "sizeThatFits:", width, height);
  double v9 = v8;
  -[SiriSharedUICompactConversationView _sizeThatFitsAllSnippets:](self, "_sizeThatFitsAllSnippets:", width, height);
  double v11 = v10;
  if (self->_isInAmbient)
  {
    if (self->_isInAmbientInteractivity) {
      long long v12 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    }
    else {
      long long v12 = &SiriSharedUICompactAmbientContentScaleAmount;
    }
    double v11 = v10 * *(double *)v12;
  }
  double v13 = 0.0;
  if (v7 > 0.0)
  {
    double v13 = v7 + 0.0;
    if (v9 == 0.0)
    {
      [(SiriSharedUICompactConversationView *)self serverUtteranceContentInsets];
      double v13 = v13 + v14;
    }
  }
  double v15 = -0.0;
  if (v9 > 0.0) {
    double v15 = v9;
  }
  double v16 = v15 + v13;
  if (v11 > 0.0)
  {
    if (v9 == 0.0 && v7 == 0.0)
    {
      [(SiriSharedUICompactConversationView *)self snippetContentInsets];
      double v16 = v16 + v17;
    }
    [(SiriSharedUICompactConversationView *)self snippetContentInsets];
    double v16 = v16 + v11 + v18;
  }
  if (!self->_currentExpandablePlatterStyle)
  {
    v19 = [(SiriSharedUICompactConversationView *)self delegate];
    [v19 maximumHeightForConversationView:self];
    double v21 = v20;

    if (v16 >= v21) {
      double v16 = v21;
    }
  }
  double v22 = width;
  double v23 = v16;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  v96.receiver = self;
  v96.super_class = (Class)SiriSharedUICompactConversationView;
  [(SiriSharedUICompactConversationView *)&v96 layoutSubviews];
  [(SiriSharedUICompactConversationView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(SiriSharedUICompactConversationView *)self animationContextForFrameAndLayoutUpdate];

  if (v11)
  {
    v95[0] = MEMORY[0x263EF8330];
    v95[1] = 3221225472;
    v95[2] = __53__SiriSharedUICompactConversationView_layoutSubviews__block_invoke;
    v95[3] = &unk_2640E38C0;
    v95[4] = self;
    *(double *)&v95[5] = v4;
    *(double *)&v95[6] = v6;
    *(double *)&v95[7] = v8;
    *(double *)&v95[8] = v10;
    long long v12 = [(SiriSharedUICompactConversationView *)self animationContextForFrameAndLayoutUpdate];
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v95 context:v12 completion:0];
  }
  else
  {
    -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v4, v6, v8, v10);
  }
  [(PLPlatterView *)self->_platterView setHasShadow:[(SiriSharedUICompactConversationView *)self _useShadowForPlatter]];
  -[UIView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
  scrollView = self->_scrollView;
  [(UIView *)self->_containerView bounds];
  -[SiriSharedUIStandardScrollView setFrame:](scrollView, "setFrame:");
  -[SiriSharedUICompactUserUtteranceView sizeThatFits:](self->_userUtteranceView, "sizeThatFits:", v8, v10);
  double v15 = v14;
  double v17 = v16;
  -[SiriSharedUICompactServerUtteranceView sizeThatFits:](self->_serverUtteranceView, "sizeThatFits:", v8, 1.79769313e308);
  v99.size.CGFloat height = v10;
  double v19 = v18;
  double v21 = v20;
  CGFloat v80 = v6;
  CGFloat v81 = v4;
  v99.origin.CGFloat x = v4;
  v99.origin.CGFloat y = v6;
  v99.size.double width = v8;
  double rect = v99.size.height;
  double Width = CGRectGetWidth(v99);
  [(SiriSharedUICompactConversationView *)self snippetContentInsets];
  double v88 = v23;
  double v24 = *MEMORY[0x263F001B0];
  v25 = (double *)MEMORY[0x263F001A8];
  double v79 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v15 == *MEMORY[0x263F001B0] && v17 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v26 = Width * 0.5 - v19 * 0.5;
    -[SiriSharedUICompactUserUtteranceView setFrame:](self->_userUtteranceView, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v27 = 0.0;
    double MaxY = 0.0;
  }
  else
  {
    double v29 = 0.0;
    if (![(NSArray *)self->_serverUtterances count]
      && ![(NSArray *)self->_conversationSnippetViews count])
    {
      double v29 = rect * 0.5 - v17 * 0.5 + -8.0;
    }
    if ([(NSArray *)self->_serverUtterances count] || !self->_hasHintConversationSnippets)
    {
      userUtteranceView = self->_userUtteranceView;
    }
    else
    {
      userUtteranceView = self->_userUtteranceView;
      [(SiriSharedUICompactConversationView *)self serverUtteranceContentInsets];
      double v17 = v17 + v31;
    }
    double v26 = 0.0;
    -[SiriSharedUICompactUserUtteranceView setFrame:](userUtteranceView, "setFrame:", 0.0, v29, v15, v17);
    [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
    double MaxY = CGRectGetMaxY(v100);
    [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
    double v27 = CGRectGetMaxY(v101);
    [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
    double v32 = CGRectGetMaxY(v102);
    [(SiriSharedUICompactConversationView *)self snippetContentInsets];
    double v88 = v32 + v33;
    if ([(SiriSharedUIStandardView *)self->_serverUtteranceView isSemanticContentAttributeRightToLeft])
    {
      v103.origin.CGFloat y = v80;
      v103.origin.CGFloat x = v81;
      v103.size.double width = v8;
      v103.size.CGFloat height = rect;
      double v26 = CGRectGetWidth(v103) - v19;
    }
  }
  serverUtteranceView = self->_serverUtteranceView;
  if (v19 == v24 && v21 == v79)
  {
    -[SiriSharedUICompactServerUtteranceView setFrame:](serverUtteranceView, "setFrame:", *v25, v25[1], v25[2], v25[3]);
  }
  else
  {
    -[SiriSharedUICompactServerUtteranceView setFrame:](serverUtteranceView, "setFrame:", v26, v27, v19, v21);
    [(SiriSharedUICompactServerUtteranceView *)self->_serverUtteranceView frame];
    double MaxY = CGRectGetMaxY(v104);
    [(SiriSharedUICompactServerUtteranceView *)self->_serverUtteranceView frame];
    double v88 = CGRectGetMaxY(v105);
  }
  double v83 = v8;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v35 = self->_conversationSnippetViews;
  uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v91 objects:v97 count:16];
  double v37 = v79;
  if (v36)
  {
    uint64_t v38 = v36;
    BOOL v39 = 0;
    uint64_t v40 = *(void *)v92;
    double v86 = v25[1];
    double v87 = *v25;
    double v84 = v25[3];
    double v85 = v25[2];
    double v89 = 0.0;
    double v41 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v92 != v40) {
          objc_enumerationMutation(v35);
        }
        v43 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
        v45 = [(SiriSharedUICompactConversationView *)self _keyForSnippet:v43];
        v46 = [(NSDictionary *)conversationSnippetVibrancyViews objectForKey:v45];

        [(SiriSharedUICompactConversationView *)self _sizeOfSnippet:v43];
        if (v47 == v24 && v48 == v37)
        {
          objc_msgSend(v43, "setFrame:", v87, v86, v85, v84);
          -[UIView setFrame:](v46, "setFrame:", v87, v86, v85, v84);
        }
        else
        {
          double v50 = v47;
          double v51 = v48;
          double v52 = v37;
          double v53 = v24;
          objc_msgSend(v43, "setFrame:", 0.0, v41, v47, v48);
          -[UIView setFrame:](v46, "setFrame:", 0.0, v41, v50, v51);
          hintVibrancyView = self->_hintVibrancyView;
          if (hintVibrancyView) {
            BOOL v55 = hintVibrancyView == v46;
          }
          else {
            BOOL v55 = 0;
          }
          if (v55)
          {
            v56 = [(UIView *)v46 layer];
            LODWORD(v57) = 1.0;
            [v56 setOpacity:v57];
          }
          [v43 frame];
          CGFloat x = v58;
          CGFloat y = v60;
          CGFloat v63 = v62;
          CGFloat height = v64;
          if (self->_isInAmbient)
          {
            double v66 = 1.0;
            if (!self->_isInAmbientInteractivity) {
              double v66 = 2.0;
            }
            CGAffineTransformMakeScale(&v90, v66, v66);
            v106.origin.CGFloat x = x;
            v106.origin.CGFloat y = y;
            v106.size.double width = v63;
            v106.size.CGFloat height = height;
            CGRect v107 = CGRectApplyAffineTransform(v106, &v90);
            CGFloat x = v107.origin.x;
            CGFloat y = v107.origin.y;
            CGFloat v63 = v107.size.width;
            CGFloat height = v107.size.height;
          }
          v108.origin.CGFloat x = x;
          v108.origin.CGFloat y = y;
          v108.size.double width = v63;
          v108.size.CGFloat height = height;
          double v67 = CGRectGetMaxY(v108);
          [(SiriSharedUICompactConversationView *)self snippetContentInsets];
          double v41 = v67 + v68;
          v109.origin.CGFloat x = x;
          v109.origin.CGFloat y = y;
          v109.size.double width = v63;
          v109.size.CGFloat height = height;
          double MaxY = v88 + CGRectGetMaxY(v109);
          double v69 = v89;
          if (v89 < v50) {
            double v69 = v50;
          }
          double v89 = v69;
          if (v39)
          {
            BOOL v39 = 1;
          }
          else
          {
            v110.origin.CGFloat y = v80;
            v110.origin.CGFloat x = v81;
            v110.size.CGFloat height = rect;
            v110.size.double width = v83;
            BOOL v39 = floor(MaxY) > floor(CGRectGetHeight(v110));
          }
          double v24 = v53;
          double v37 = v52;
        }
      }
      uint64_t v38 = [(NSArray *)v35 countByEnumeratingWithState:&v91 objects:v97 count:16];
    }
    while (v38);
  }
  else
  {
    BOOL v39 = 0;
    double v89 = 0.0;
    double v41 = 0.0;
  }

  if (self->_isInAmbient)
  {
    unint64_t v70 = 0x2676EA000;
    double v71 = v89;
    if (self->_allowAutomaticConversationSnippetViewScaling)
    {
      v72 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
      if (!self->_isInAmbientInteractivity) {
        v72 = &SiriSharedUICompactAmbientContentScaleAmount;
      }
      double v71 = v89 * *(double *)v72;
    }
  }
  else
  {
    unint64_t v70 = 0x2676EA000uLL;
    double v71 = v89;
  }
  [(SiriSharedUICompactConversationView *)self snippetContentInsets];
  if (*((unsigned char *)&self->super.super.super.super.isa + *(int *)(v70 + 2592)))
  {
    [(SiriSharedUICompactConversationView *)self bounds];
    double v71 = v74;
    double v75 = 0.0;
  }
  else
  {
    double v75 = v73;
  }
  -[UIView setFrame:](self->_conversationSnippetContainerView, "setFrame:", v75, v88, v71, v41);
  -[SiriSharedUIStandardScrollView setContentSize:](self->_scrollView, "setContentSize:", v83, MaxY);
  if (!self->_currentExpandablePlatterStyle)
  {
    [(SiriSharedUIStandardScrollView *)self->_scrollView frame];
    [(SiriSharedUIStandardScrollView *)self->_scrollView setScrollEnabled:MaxY > v76];
  }
  if (v39) {
    double v77 = 40.0;
  }
  else {
    double v77 = 0.0;
  }
  -[SiriSharedUIStandardScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 0.0, v77, 0.0);
  [(SiriSharedUICompactConversationView *)self _updateExpandableDrawerUI];
  v78 = [(SiriSharedUICompactConversationView *)self stackContainerDelegate];
  [v78 stackableContentDidLayout:self];
}

uint64_t __53__SiriSharedUICompactConversationView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_updateExpandableDrawerUI
{
  [(SiriSharedUIStandardScrollView *)self->_scrollView contentSize];
  double v4 = v3;
  [(SiriSharedUICompactConversationView *)self frame];
  int64_t currentExpandablePlatterStyle = self->_currentExpandablePlatterStyle;
  BOOL v7 = currentExpandablePlatterStyle == 3 || self->_currentlyTrackingGesture;
  double v8 = floor(v4);
  if (v8 > floor(v5)) {
    BOOL v7 = 1;
  }
  BOOL v9 = currentExpandablePlatterStyle != 4;
  BOOL v10 = currentExpandablePlatterStyle != 4 && v7;
  [(SiriSharedUIAdaptiveGrabberView *)self->_grabberView setHidden:v10 ^ 1];
  [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self->_expandablePlatterGesture setEnabled:v10];
  [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self->_expandablePlatterGesture setScrollViewContentHeight:v4];
  expandablePlatterGesture = self->_expandablePlatterGesture;
  BOOL v12 = v8 > 200.0 && v9;
  [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)expandablePlatterGesture setAllowExpandedState:v12];
}

- (void)_resetExpansionStateForNewContent
{
  if ([(SiriSharedUICompactConversationView *)self transitionToExpandablePlatterStyle:1])
  {
    id v3 = [(SiriSharedUICompactConversationView *)self delegate];
    [v3 conversationViewDidResetExpandedState:self];
  }
}

- (void)setServerUtterances:(id)a3
{
  id v4 = a3;
  uint64_t serverUtterances = (uint64_t)self->_serverUtterances;
  if ((id)serverUtterances != v4)
  {
    v25 = v4;
    uint64_t serverUtterances = [(id)serverUtterances isEqualToArray:v4];
    id v4 = v25;
    if ((serverUtterances & 1) == 0)
    {
      double v6 = (NSArray *)[v25 copy];
      BOOL v7 = self->_serverUtterances;
      self->_uint64_t serverUtterances = v6;

      [(SiriSharedUICompactServerUtteranceView *)self->_serverUtteranceView setUtterances:self->_serverUtterances];
      serverUtteranceView = self->_serverUtteranceView;
      uint64_t v9 = SiriSharedUILanguageSemanticContentAttribute();
      SiriSharedUIRecursiveSetSemanticContentAttribute(serverUtteranceView, v9);
      [(SiriSharedUICompactConversationView *)self _resetExpansionStateForNewContent];
      if (v25
        && ([(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame],
            !CGRectEqualToRect(v27, *MEMORY[0x263F001A8])))
      {
        [(SiriSharedUICompactConversationView *)self bounds];
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        -[SiriSharedUICompactServerUtteranceView sizeThatFits:](self->_serverUtteranceView, "sizeThatFits:", v15, v17);
        double v20 = v19;
        double v22 = v21;
        [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
        double MinX = CGRectGetMinX(v28);
        [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
        double MaxY = CGRectGetMaxY(v29);
        if ([(SiriSharedUIStandardView *)self->_serverUtteranceView isSemanticContentAttributeRightToLeft])
        {
          v30.origin.CGFloat x = v12;
          v30.origin.CGFloat y = v14;
          v30.size.double width = v16;
          v30.size.CGFloat height = v18;
          double MinX = CGRectGetWidth(v30) - v20;
        }
        -[SiriSharedUICompactServerUtteranceView setFrame:](self->_serverUtteranceView, "setFrame:", MinX, MaxY, v20, v22);
        [(SiriSharedUICompactServerUtteranceView *)self->_serverUtteranceView layoutIfNeeded];
        uint64_t v10 = 1;
      }
      else
      {
        uint64_t v10 = 0;
      }
      [(SiriSharedUICompactConversationView *)self _reloadConversationSnippetViewsIfHint];
      uint64_t serverUtterances = [(SiriSharedUICompactConversationView *)self updateContentSizeWithAnimation:v10];
      id v4 = v25;
    }
  }
  MEMORY[0x270F9A758](serverUtterances, v4);
}

- (void)_reloadConversationSnippetViewsIfHint
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_didSetConversationSnippets)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = self->_conversationSnippetViews;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (-[SiriSharedUICompactConversationView _isConversationSnippetHintType:](self, "_isConversationSnippetHintType:", v8, (void)v12))
          {
            conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
            uint64_t v10 = [(SiriSharedUICompactConversationView *)self _keyForSnippet:v8];
            double v11 = [(NSDictionary *)conversationSnippetVibrancyViews objectForKey:v10];

            [(SiriSharedUICompactConversationView *)self _adjustHintCornerRadiusForSnippetView:v8 vibrancyView:v11];
          }
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
}

- (void)setSpeechRecognitionHypothesis:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (SRUIFSpeechRecognitionHypothesis *)[v4 copy];
  speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
  self->_speechRecognitionHypothesis = v5;

  [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView setSpeechRecognitionHypothesis:v4];
  int v7 = [v4 isFinal];

  if (v7) {
    self->_waitingForFinalSpeechHypothesis = 0;
  }
  [(SiriSharedUICompactConversationView *)self updateContentSizeWithAnimation:0];
}

- (BOOL)_isConversationSnippetHintType:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isHint];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (UIEdgeInsets)serverUtteranceContentInsets
{
  if (self->_isInAmbient)
  {
    double v2 = 6.0;
    if (!self->_speechRecognitionHypothesis) {
      double v2 = 16.0;
    }
    double v3 = 4.0;
  }
  else
  {
    double v2 = 16.0;
    double v3 = 16.0;
  }
  double v4 = 16.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)userUtteranceContentInsets
{
  if (self->_isInAmbient) {
    double v2 = 4.0;
  }
  else {
    double v2 = 0.0;
  }
  double v3 = 16.0;
  double v4 = 16.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)snippetContentInsets
{
  if (self->_isInAmbient)
  {
    double v2 = 16.0;
    double v3 = 4.0;
  }
  else
  {
    if (self->_hasHintConversationSnippets) {
      double v3 = 0.0;
    }
    else {
      double v3 = 8.0;
    }
    double v2 = v3;
  }
  double v4 = v2;
  double v5 = v2;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (void)setConversationSnippetViews:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSArray *)self->_conversationSnippetViews isEqualToArray:v4])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    double v5 = self->_conversationSnippetViews;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v41 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v7);
    }

    uint64_t v10 = (NSArray *)[v4 copy];
    conversationSnippetViews = self->_conversationSnippetViews;
    self->_conversationSnippetViews = v10;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v12 = [(NSDictionary *)self->_conversationSnippetVibrancyViews allValues];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * j) removeFromSuperview];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    CGRect v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = self->_conversationSnippetViews;
    uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (!v17)
    {
      LOBYTE(v31) = 1;
      goto LABEL_45;
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    int v31 = 1;
    while (1)
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(obj);
        }
        double v21 = *(void **)(*((void *)&v32 + 1) + 8 * k);
        uint64_t v22 = SiriSharedUILanguageSemanticContentAttribute();
        SiriSharedUIRecursiveSetSemanticContentAttribute(v21, v22);
        if (objc_opt_respondsToSelector())
        {
          [(SiriSharedUICompactConversationView *)self snippetContentInsets];
          objc_msgSend(v21, "viewInsetsInConversationView:");
        }
        if (objc_opt_respondsToSelector()) {
          v31 &= [v21 shouldAutomaticallyScaleContentInAmbient];
        }
        BOOL v23 = [(SiriSharedUICompactConversationView *)self _isConversationSnippetHintType:v21];
        if (![(SiriSharedUICompactConversationView *)self _shouldAddVibrancyForSnippet:v21]&& !v23)
        {
          double v24 = 0;
          goto LABEL_33;
        }
        if (!v23)
        {
          double v24 = [[SiriSharedUICompactConversationSnippetVibrancyView alloc] initWithStyle:0];
          if (!v24) {
            goto LABEL_33;
          }
LABEL_32:
          double v26 = [(SiriSharedUICompactConversationView *)self _keyForSnippet:v21];
          [(NSDictionary *)v29 setObject:v24 forKey:v26];

          goto LABEL_33;
        }
        self->_hasHintConversationSnippets = 1;
        double v24 = [[SiriSharedUICompactConversationSnippetVibrancyView alloc] initWithStyle:1];
        [(UIView *)self->_conversationSnippetContainerView frame];
        -[SiriSharedUICompactConversationSnippetVibrancyView setFrame:](v24, "setFrame:");
        v25 = [(SiriSharedUICompactConversationSnippetVibrancyView *)v24 layer];
        [v25 setOpacity:0.0];

        objc_storeStrong((id *)&self->_hintVibrancyView, v24);
        objc_storeStrong((id *)&self->_hintSnippetView, v21);
        if (v24) {
          goto LABEL_32;
        }
LABEL_33:
        conversationSnippetContainerView = self->_conversationSnippetContainerView;
        if (conversationSnippetContainerView)
        {
          [(UIView *)conversationSnippetContainerView addSubview:v21];
          if (v24) {
            [(UIView *)self->_conversationSnippetContainerView addSubview:v24];
          }
        }
        else
        {
          [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:v21];
          if (v24) {
            [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:v24];
          }
        }
        if (v23) {
          [(SiriSharedUICompactConversationView *)self _adjustHintCornerRadiusForSnippetView:v21 vibrancyView:v24];
        }
        else {
          [(SiriSharedUICompactConversationView *)self _adjustCornerRadiusForSnippetView:v21 vibrancyView:v24];
        }
        [v21 setClipsToBounds:1];
      }
      uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (!v18)
      {
LABEL_45:

        conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
        self->_conversationSnippetVibrancyViews = v29;

        [(SiriSharedUICompactConversationView *)self setAllowAutomaticConversationSnippetViewScaling:v31 & 1];
        [(SiriSharedUICompactConversationView *)self updateContentSizeWithAnimation:0];
        self->_didSetConversationSnippets = 1;
        break;
      }
    }
  }
}

- (BOOL)contentSupportsCollapsingForHeight:(double)a3
{
  return 10.0 + 60.0 < a3;
}

- (BOOL)willAutomaticallyCollapseWhenResultIsScrolled
{
  if (self->_isInAmbient) {
    return 0;
  }
  [(SiriSharedUICompactConversationView *)self frame];
  double Height = CGRectGetHeight(v6);
  if (!self->_automaticallyCollapseWhenResultIsScrolled) {
    return 0;
  }
  return [(SiriSharedUICompactConversationView *)self contentSupportsCollapsingForHeight:Height];
}

- (void)snippetContentDidUpdate
{
}

- (void)snippetContentDidUpdateForHint
{
  if ([(NSArray *)self->_serverUtterances count]
    || [(NSArray *)self->_conversationSnippetViews count] > 1
    || self->_speechRecognitionHypothesis)
  {
    [(SiriSharedUICompactConversationView *)self _prepareHintForAnimation];
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  [(SiriSharedUICompactConversationView *)self updateContentSizeWithAnimation:v3];
}

- (void)_prepareHintForAnimation
{
  [(SiriSharedUICompactConversationView *)self _sizeOfSnippet:self->_hintSnippetView];
  double v5 = v4;
  if (v4 != *MEMORY[0x263F001B0] || v3 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(UIView *)self->_hintVibrancyView frame];
    if (CGRectEqualToRect(v9, *MEMORY[0x263F001A8]))
    {
      -[UIView setFrame:](self->_hintVibrancyView, "setFrame:", 0.0, 0.0, v5, 0.0);
      -[UIView setFrame:](self->_hintSnippetView, "setFrame:", 0.0, 0.0, v5, 0.0);
      [(UIView *)self->_hintSnippetView layoutIfNeeded];
      hintVibrancyView = self->_hintVibrancyView;
      [(UIView *)hintVibrancyView layoutIfNeeded];
    }
  }
}

- (CGSize)_fittingSize
{
  double v3 = 2.0;
  if (!self->_isInAmbient) {
    double v3 = 1.0;
  }
  double v4 = 556.0 * v3;
  double v5 = (double *)&SiriSharedUICompactPlatterAmbientHorizontalPadding;
  if (!self->_isInAmbient) {
    double v5 = (double *)&SiriSharedUICompactPlatterHorizontalPadding;
  }
  double v6 = *v5;
  uint64_t v7 = [(SiriSharedUICompactConversationView *)self stackContainerDelegate];
  [v7 stackableContentMaximumContainerWidth];
  double v9 = v8 + v6 * -2.0;

  if (v4 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v4;
  }
  -[SiriSharedUICompactConversationView sizeThatFits:](self, "sizeThatFits:", v10, 1.79769313e308);
  result.CGFloat height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(SiriSharedUICompactConversationView *)self _fittingSize];
  int64_t currentExpandablePlatterStyle = self->_currentExpandablePlatterStyle;
  if (currentExpandablePlatterStyle == 2)
  {
    currentExpandedGesturedouble Height = 60.0;
  }
  else
  {
    currentExpandedGesturedouble Height = self->_currentExpandedGestureHeight;
    if (currentExpandedGestureHeight <= 0.0)
    {
      if (currentExpandablePlatterStyle)
      {
        currentExpandedGesturedouble Height = v4;
        if (!self->_isInAmbient)
        {
          currentExpandedGesturedouble Height = 200.0;
          if (v4 < 200.0) {
            currentExpandedGesturedouble Height = v4;
          }
        }
      }
      else
      {
        currentExpandedGesturedouble Height = v4;
      }
    }
  }
  double v7 = currentExpandedGestureHeight;
  result.CGFloat height = v7;
  result.double width = v3;
  return result;
}

- (void)relayout
{
}

- (void)updateContentSizeWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(SiriSharedUICompactConversationView *)self _fittingSize];
  double v6 = v5;
  double v8 = v7;
  [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self->_expandablePlatterGesture setInitialHeight:v7];
  [(SiriSharedUICompactConversationView *)self _updateSubviewContentInsets];
  double v9 = [(SiriSharedUICompactConversationView *)self stackContainerDelegate];
  objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, v3, v6, v8);

  [(SiriSharedUICompactConversationView *)self invalidateIntrinsicContentSize];
}

- (void)setAllowAutomaticConversationSnippetViewScaling:(BOOL)a3
{
  if (self->_allowAutomaticConversationSnippetViewScaling != a3)
  {
    self->_allowAutomaticConversationSnippetViewScaling = a3;
    [(SiriSharedUICompactConversationView *)self _updateAmbientSnippetScaling];
  }
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient != a3)
  {
    BOOL v3 = a3;
    self->_isInAmbient = a3;
    [(SiriSharedUICompactConversationView *)self _updateSubviewContentInsets];
    [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView setIsInAmbient:v3];
    [(SiriSharedUICompactServerUtteranceView *)self->_serverUtteranceView setIsInAmbient:v3];
    [(SiriSharedUICompactConversationView *)self _updateAmbientSnippetScaling];
    double v5 = [(PLPlatterView *)self->_platterView backgroundView];
    [v5 setHidden:self->_isInAmbient];

    platterView = self->_platterView;
    BOOL v7 = [(SiriSharedUICompactConversationView *)self _useShadowForPlatter];
    [(PLPlatterView *)platterView setHasShadow:v7];
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbientInteractivity != a3)
  {
    BOOL v3 = a3;
    self->_isInAmbientInteractivitCGFloat y = a3;
    -[SiriSharedUICompactUserUtteranceView setIsInAmbientInteractivity:](self->_userUtteranceView, "setIsInAmbientInteractivity:");
    [(SiriSharedUICompactServerUtteranceView *)self->_serverUtteranceView setIsInAmbientInteractivity:v3];
    [(SiriSharedUICompactConversationView *)self _updateAmbientSnippetScaling];
  }
}

- (void)_updateSubviewContentInsets
{
  userUtteranceView = self->_userUtteranceView;
  [(SiriSharedUICompactConversationView *)self userUtteranceContentInsets];
  -[SiriSharedUICompactUserUtteranceView setContentInsets:](userUtteranceView, "setContentInsets:");
  serverUtteranceView = self->_serverUtteranceView;
  [(SiriSharedUICompactConversationView *)self serverUtteranceContentInsets];
  -[SiriSharedUICompactServerUtteranceView setContentInsets:](serverUtteranceView, "setContentInsets:");
}

- (void)_updateAmbientSnippetScaling
{
  if (self->_isInAmbient && self->_allowAutomaticConversationSnippetViewScaling)
  {
    if (self->_isInAmbientInteractivity) {
      double v2 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    }
    else {
      double v2 = &SiriSharedUICompactAmbientContentScaleAmount;
    }
    conversationSnippetContainerView = self->_conversationSnippetContainerView;
    CGAffineTransformMakeScale(&v10, *(CGFloat *)v2, *(CGFloat *)v2);
    double v4 = &v10;
    double v5 = conversationSnippetContainerView;
  }
  else
  {
    double v5 = self->_conversationSnippetContainerView;
    long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v7 = *MEMORY[0x263F000D0];
    long long v8 = v6;
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    double v4 = (CGAffineTransform *)&v7;
  }
  -[UIView setTransform:](v5, "setTransform:", v4, v7, v8, v9);
}

- (BOOL)_useShadowForPlatter
{
  [(SiriSharedUICompactConversationView *)self bounds];
  return CGRectGetHeight(v4) > 0.0 && !self->_isInAmbient;
}

- (void)setShowCollapsedUI:(BOOL)a3
{
  if (self->_showingCollapsedUI != a3)
  {
    self->_showingCollapsedUI = a3;
    [(SiriSharedUIAdaptiveGrabberView *)self->_grabberView setStyle:a3 animated:1];
  }
}

- (void)setCurrentExpandablePlatterStyle:(int64_t)a3
{
  self->_int64_t currentExpandablePlatterStyle = a3;
  if (a3 == 2)
  {
    [(SiriSharedUICompactConversationView *)self setShowCollapsedUI:1];
    CGRect v4 = [(SiriSharedUICompactConversationView *)self delegate];
    [v4 conversationViewDidTransitionToCollapsedState:self];

    goto LABEL_9;
  }
  [(SiriSharedUICompactConversationView *)self setShowCollapsedUI:0];
  if (a3 == 1)
  {
    self->_automaticallyCollapseWhenResultIsScrolled = 1;
    goto LABEL_10;
  }
  if (a3 == 4)
  {
    self->_automaticallyCollapseWhenResultIsScrolled = 0;
    scrollView = self->_scrollView;
    uint64_t v7 = 1;
    goto LABEL_11;
  }
  if (a3 != 3)
  {
LABEL_9:
    self->_automaticallyCollapseWhenResultIsScrolled = 0;
LABEL_10:
    scrollView = self->_scrollView;
    uint64_t v7 = 0;
LABEL_11:
    [(SiriSharedUIStandardScrollView *)scrollView setScrollEnabled:v7];
    return;
  }
  self->_automaticallyCollapseWhenResultIsScrolled = 0;
  [(SiriSharedUIStandardScrollView *)self->_scrollView setScrollEnabled:1];
  id v8 = [(SiriSharedUICompactConversationView *)self delegate];
  [v8 conversationViewDidTransitionToExpandedState:self];
}

- (BOOL)transitionToExpandablePlatterStyle:(int64_t)a3
{
  int64_t currentExpandablePlatterStyle = self->_currentExpandablePlatterStyle;
  if (currentExpandablePlatterStyle != a3 && currentExpandablePlatterStyle != 0)
  {
    switch(a3)
    {
      case 1:
        [(SiriSharedUICompactConversationView *)self _resetExpandablePlatterGestureState];
        [(SiriSharedUICompactConversationView *)self updateContentSizeWithAnimation:0];
        break;
      case 2:
        expandablePlatterGesture = self->_expandablePlatterGesture;
        [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)expandablePlatterGesture collapsedHeight];
        id v8 = self;
        long long v9 = expandablePlatterGesture;
        uint64_t v10 = 2;
        goto LABEL_9;
      case 3:
        double v11 = self->_expandablePlatterGesture;
        [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)v11 expandedHeight];
        id v8 = self;
        long long v9 = v11;
        uint64_t v10 = 3;
LABEL_9:
        -[SiriSharedUICompactConversationView expandablePlatterGesture:didCompleteTransitionToStyle:phaseHeight:](v8, "expandablePlatterGesture:didCompleteTransitionToStyle:phaseHeight:", v9, v10);
        break;
      case 4:
        [(SiriSharedUICompactConversationView *)self setNeedsLayout];
        break;
      default:
        break;
    }
    [(SiriSharedUICompactConversationView *)self setCurrentExpandablePlatterStyle:a3];
    [(SiriSharedUICompactConversationView *)self invalidateIntrinsicContentSize];
  }
  return currentExpandablePlatterStyle != 0;
}

- (void)userUtteranceViewTapped:(id)a3
{
  id v4 = [(SiriSharedUICompactConversationView *)self delegate];
  [v4 tapToEditRequestedFromView:self];
}

- (void)userUtteranceView:(id)a3 speechRecognitionHypothesisDidAppear:(id)a4
{
  id v8 = a4;
  double v5 = [v8 backingAceObject];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = [v8 backingAceObject];
    [WeakRetained conversationView:self viewDidAppearForAceObject:v7];
  }
}

- (void)userUtteranceView:(id)a3 speechRecognitionHypothesisDidDisappear:(id)a4
{
  id v8 = a4;
  double v5 = [v8 backingAceObject];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = [v8 backingAceObject];
    [WeakRetained conversationView:self viewDidDisappearForAceObject:v7];
  }
}

- (void)serverUtteranceView:(id)a3 utteranceViewDidAppear:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained conversationView:self viewDidAppearForAceObject:v6];
}

- (void)serverUtteranceView:(id)a3 utteranceViewDidDisappear:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained conversationView:self viewDidDisappearForAceObject:v6];
}

- (id)parserSpeakableObjectProviderForServerUtterance:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = [WeakRetained parserSpeakableObjectProviderForConversationView:self];

  return v5;
}

- (void)expandablePlatterGesture:(id)a3 didCompleteTransitionToStyle:(int64_t)a4 phaseHeight:(double)a5
{
  [(SiriSharedUICompactConversationView *)self setCurrentExpandablePlatterStyle:a4];
  self->_currentExpandedGesturedouble Height = a5;
  [(SiriSharedUICompactConversationView *)self frame];
  double v8 = v7;
  long long v9 = [(SiriSharedUICompactConversationView *)self stackContainerDelegate];
  objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, 1, v8, a5);

  uint64_t v10 = [(SiriSharedUICompactConversationView *)self delegate];
  [v10 conversationView:self didUpdateHeightDuringExpansionTransition:1 didCompleteGesture:a5];

  [(SiriSharedUICompactConversationView *)self invalidateIntrinsicContentSize];
}

- (void)expandablePlatterGesture:(id)a3 trackingGestureDidUpdateHeight:(double)a4
{
  [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self->_expandablePlatterGesture collapsedHeight];
  [(SiriSharedUICompactConversationView *)self setShowCollapsedUI:v6 >= a4];
  self->_currentExpandedGesturedouble Height = a4;
  [(SiriSharedUICompactConversationView *)self frame];
  double v8 = v7;
  long long v9 = [(SiriSharedUICompactConversationView *)self stackContainerDelegate];
  objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, 0, v8, a4);

  uint64_t v10 = [(SiriSharedUICompactConversationView *)self delegate];
  [v10 conversationView:self didUpdateHeightDuringExpansionTransition:0 didCompleteGesture:a4];

  [(SiriSharedUICompactConversationView *)self invalidateIntrinsicContentSize];
}

- (void)_updateExpandedHeight
{
  BOOL v3 = [(SiriSharedUICompactConversationView *)self delegate];
  [v3 expectedExpandedHeightForConversationView:self];
  double v5 = v4;

  if (v5 > 0.0)
  {
    expandablePlatterGesture = self->_expandablePlatterGesture;
    [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)expandablePlatterGesture setExpandedHeight:v5];
  }
}

- (void)expandablePlatterGestureDidBeginWithRecognizer:(id)a3
{
  [(SiriSharedUICompactConversationView *)self _updateExpandedHeight];
  self->_currentlyTrackingGesture = 1;
  [(SiriSharedUICompactConversationView *)self frame];
  self->_currentExpandedGesturedouble Height = CGRectGetHeight(v6);
  id v4 = [(SiriSharedUICompactConversationView *)self delegate];
  [v4 conversationViewDidBeginExpandTransition:self];
}

- (void)_resetExpandablePlatterGestureState
{
  self->_currentlyTrackingGesture = 0;
  self->_currentExpandedGesturedouble Height = 0.0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  id v10 = [(SiriSharedUICompactConversationView *)self delegate];
  [v5 contentOffset];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(v10, "conversationViewContentScrolled:toContentOffset:", self, v7, v9);
}

- (CGSize)_sizeOfSnippet:(id)a3
{
  id v4 = a3;
  [(SiriSharedUICompactConversationView *)self bounds];
  double v6 = v5;
  [(SiriSharedUICompactConversationView *)self snippetContentInsets];
  double v8 = v6 - v7;
  [(SiriSharedUICompactConversationView *)self snippetContentInsets];
  double v10 = v8 - v9;
  if (self->_isInAmbient && self->_allowAutomaticConversationSnippetViewScaling)
  {
    if (self->_isInAmbientInteractivity) {
      double v11 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    }
    else {
      double v11 = &SiriSharedUICompactAmbientContentScaleAmount;
    }
    double v10 = v10 / *(double *)v11;
  }
  -[SiriSharedUICompactConversationView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", v4, v10, 1.79769313e308);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.CGFloat height = v17;
  result.double width = v16;
  return result;
}

- (CGSize)_sizeThatFitsAllSnippets:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(SiriSharedUICompactConversationView *)self snippetContentInsets];
  double v7 = v6;
  [(SiriSharedUICompactConversationView *)self snippetContentInsets];
  double v9 = v8;
  double v11 = *MEMORY[0x263F001B0];
  double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v12 = self->_conversationSnippetViews;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    double v15 = width - v7 - v9;
    uint64_t v16 = *(void *)v25;
    double v17 = 0.0;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v12);
        }
        -[SiriSharedUICompactConversationView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", *(void *)(*((void *)&v24 + 1) + 8 * v18), v15, height, (void)v24);
        double v11 = fmax(v11, v19);
        double v10 = v10 + v17 + v20;
        [(SiriSharedUICompactConversationView *)self snippetContentInsets];
        double v17 = v21;
        ++v18;
      }
      while (v14 != v18);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  double v22 = v11;
  double v23 = v10;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 forSnippet:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = [v6 collectionViewLayout];
    [v7 collectionViewContentSize];
    double v9 = v8;
  }
  else
  {
    objc_msgSend(v6, "sizeThatFits:", width, height);
    double width = v10;
    double v9 = v11;
  }

  double v12 = width;
  double v13 = v9;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (BOOL)_shouldAddVibrancyForSnippet:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    int v4 = [v3 suppressVibrantBackground] ^ 1;
  }
  else
  {
    double v5 = [v3 backgroundColor];
    if (v5)
    {
      id v6 = [v3 backgroundColor];
      double v7 = [MEMORY[0x263F825C8] clearColor];
      LOBYTE(v4) = [v6 isEqual:v7];
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (id)_keyForSnippet:(id)a3
{
  return (id)[MEMORY[0x263F08D40] valueWithNonretainedObject:a3];
}

- (void)_adjustCornerRadiusForSnippetView:(id)a3 vibrancyView:(id)a4
{
  id v5 = a4;
  [a3 _setContinuousCornerRadius:17.5];
  [v5 _setContinuousCornerRadius:17.5];
}

- (void)_adjustHintCornerRadiusForSnippetView:(id)a3 vibrancyView:(id)a4
{
  uint64_t serverUtterances = self->_serverUtterances;
  id v7 = a4;
  id v8 = a3;
  if ([(NSArray *)serverUtterances count] || [(NSArray *)self->_conversationSnippetViews count] > 1)
  {
    uint64_t v9 = 12;
  }
  else if (self->_speechRecognitionHypothesis)
  {
    uint64_t v9 = 12;
  }
  else
  {
    uint64_t v9 = 15;
  }
  [v8 _setContinuousCornerRadius:23.5];
  [v7 _setContinuousCornerRadius:23.5];
  double v10 = [v8 layer];

  [v10 setMaskedCorners:v9];
  id v11 = [v7 layer];

  [v11 setMaskedCorners:v9];
}

- (void)userUtteranceViewContentHeightDidUpdate:(id)a3
{
  [(SiriSharedUICompactConversationView *)self updateContentSizeWithAnimation:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained conversationViewDidUpdatePresentedContentHeight:self];
}

- (int64_t)attachmentType
{
  return self->attachmentType;
}

- (void)setAttachmentType:(int64_t)a3
{
  self->attachmentType = a3;
}

- (double)attachmentYOffset
{
  return self->attachmentYOffset;
}

- (void)setAttachmentYOffset:(double)a3
{
  self->attachmentYOffset = a3;
}

- (NSArray)conversationSnippetViews
{
  return self->_conversationSnippetViews;
}

- (BOOL)isCurrentlyTrackingGesture
{
  return self->_currentlyTrackingGesture;
}

- (SiriSharedUICompactConversationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUICompactConversationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)userUtterance
{
  return self->_userUtterance;
}

- (void)setUserUtterance:(id)a3
{
}

- (NSArray)serverUtterances
{
  return self->_serverUtterances;
}

- (SRUIFSpeechRecognitionHypothesis)speechRecognitionHypothesis
{
  return self->_speechRecognitionHypothesis;
}

- (SiriSharedUILatencyViewModel)latencyViewModel
{
  return self->_latencyViewModel;
}

- (void)setLatencyViewModel:(id)a3
{
}

- (SiriSharedUIStackableContentDelegate)stackContainerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->stackContainerDelegate);
  return (SiriSharedUIStackableContentDelegate *)WeakRetained;
}

- (void)setStackContainerDelegate:(id)a3
{
}

- (SiriSharedUIViewStackConstraints)stackConstraints
{
  return self->stackConstraints;
}

- (void)setStackConstraints:(id)a3
{
}

- (NSArray)customAttachmentConstraints
{
  return self->customAttachmentConstraints;
}

- (void)setCustomAttachmentConstraints:(id)a3
{
}

- (BOOL)useLowerPriorityHeightConstraint
{
  return self->useLowerPriorityHeightConstraint;
}

- (void)setUseLowerPriorityHeightConstraint:(BOOL)a3
{
  self->useLowerPriorityHeightConstraint = a3;
}

- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate
{
  return self->animationContextForFrameAndLayoutUpdate;
}

- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3
{
}

- (SiriSharedUIDropletContentDelegate)dropletContainerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->dropletContainerDelegate);
  return (SiriSharedUIDropletContentDelegate *)WeakRetained;
}

- (void)setDropletContainerDelegate:(id)a3
{
}

- (SiriSharedUIStandardScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)showingCollapsedUI
{
  return self->_showingCollapsedUI;
}

- (void)setShowingCollapsedUI:(BOOL)a3
{
  self->_showingCollapsedUI = a3;
}

- (int64_t)currentExpandablePlatterStyle
{
  return self->_currentExpandablePlatterStyle;
}

- (SiriSharedUIExpandablePlatterPanGestureRecognizer)expandablePlatterGesture
{
  return self->_expandablePlatterGesture;
}

- (void)setExpandablePlatterGesture:(id)a3
{
}

- (UIView)conversationSnippetContainerView
{
  return self->_conversationSnippetContainerView;
}

- (void)setConversationSnippetContainerView:(id)a3
{
}

- (SiriSharedUICompactServerUtteranceView)_serverUtteranceView
{
  return self->_serverUtteranceView;
}

- (void)_setServerUtteranceView:(id)a3
{
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (BOOL)allowAutomaticConversationSnippetViewScaling
{
  return self->_allowAutomaticConversationSnippetViewScaling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverUtteranceView, 0);
  objc_storeStrong((id *)&self->_conversationSnippetContainerView, 0);
  objc_storeStrong((id *)&self->_expandablePlatterGesture, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->dropletContainerDelegate);
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, 0);
  objc_storeStrong((id *)&self->customAttachmentConstraints, 0);
  objc_storeStrong((id *)&self->stackConstraints, 0);
  objc_destroyWeak((id *)&self->stackContainerDelegate);
  objc_storeStrong((id *)&self->_latencyViewModel, 0);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesis, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_conversationSnippetViews, 0);
  objc_storeStrong((id *)&self->_prepareForUpdatesPendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_hintSnippetView, 0);
  objc_storeStrong((id *)&self->_hintVibrancyView, 0);
  objc_storeStrong((id *)&self->_conversationSnippetVibrancyViews, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_userUtteranceView, 0);
}

@end