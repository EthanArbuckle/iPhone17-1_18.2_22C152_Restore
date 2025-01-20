@interface SiriSharedUISmartDialogView
- (BOOL)_hasNoDialog;
- (BOOL)_isConversationSnippetHintType:(id)a3;
- (BOOL)_shouldAddVibrancyForSnippet:(id)a3;
- (BOOL)_showSpeech;
- (BOOL)allowAutomaticConversationSnippetViewScaling;
- (BOOL)canRelayoutSnippet;
- (BOOL)contentSupportsCollapsingForHeight:(double)a3;
- (BOOL)hasResult;
- (BOOL)isActive;
- (BOOL)isCurrentlyTrackingGesture;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (BOOL)layerHasOpacity;
- (BOOL)ongoingASR;
- (BOOL)onlyContainsSnippet;
- (BOOL)revealRecognizedSpeech;
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
- (SRUIFLocalization)localization;
- (SRUIFSpeechRecognitionHypothesis)speechRecognitionHypothesis;
- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate;
- (SiriSharedUICompactConversationViewDelegate)delegate;
- (SiriSharedUIDropletContentDelegate)dropletContainerDelegate;
- (SiriSharedUILatencyViewModel)latencyViewModel;
- (SiriSharedUISAEUserUtteranceViewModel)userUtteranceViewModel;
- (SiriSharedUISmartDialogView)initWithFrame:(CGRect)a3;
- (SiriSharedUISmartDialogView)initWithResultView:(id)a3;
- (SiriSharedUISmartDialogView)initWithStreamingTextView:(id)a3 emojiMaskStreamingTextView:(id)a4;
- (SiriSharedUIStackableContentDelegate)stackContainerDelegate;
- (SiriSharedUIStandardScrollView)scrollView;
- (SiriSharedUIViewStackConstraints)stackConstraints;
- (UIEdgeInsets)serverUtteranceContentInsets;
- (UIEdgeInsets)snippetContentInsets;
- (UIEdgeInsets)userUtteranceContentInsets;
- (UIView)_smartDialogView;
- (UIView)snippetBackgroundView;
- (UIView)snippetContainerView;
- (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer)_smartDialogContainer;
- (double)attachmentYOffset;
- (double)maxSnippetWidth;
- (id)_conversationAppearAnimation;
- (id)_conversationDisappearAnimation;
- (id)_keyForSnippet:(id)a3;
- (id)animatingLayer;
- (id)contentContainerView;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)enclosedContainerView;
- (id)parserSpeakableObjectProviderForServerUtterance:(id)a3;
- (id)prepareForUpdatesPendingCompletionBlocks;
- (int64_t)_animatedPresentationType;
- (int64_t)attachmentType;
- (int64_t)currentExpandablePlatterStyle;
- (int64_t)state;
- (void)_adjustCornerRadiusForSnippetView:(id)a3 vibrancyView:(id)a4;
- (void)_adjustHintCornerRadiusForSnippetView:(id)a3 vibrancyView:(id)a4;
- (void)_prepareHintForAnimation;
- (void)_reloadConversationSnippetViewsIfHint;
- (void)_resetExpansionStateForNewContent;
- (void)_setBackgroundViewsVisible:(BOOL)a3;
- (void)_setSmartDialogContainer:(id)a3;
- (void)_setSmartDialogView:(id)a3;
- (void)_setupSubviews;
- (void)_updateAmbientSnippetScaling;
- (void)_updateSubviewContentInsets;
- (void)animateAppearanceIfNeeded;
- (void)animateFadeOutWithCompletion:(id)a3;
- (void)animateForDrillIn;
- (void)canRelayoutSnippet;
- (void)didCompleteAnimatedFadeOut;
- (void)finalizePopAnimationOfType:(int64_t)a3;
- (void)layoutSubviews;
- (void)prepareForDrillInAnimation;
- (void)prepareForPopAnimationOfType:(int64_t)a3;
- (void)prepareForUpdatesToServerUtterance:(BOOL)a3 conversationSnippetViews:(BOOL)a4 speechRecognitionHypothesis:(BOOL)a5 latencyViewModel:(BOOL)a6 updateBlock:(id)a7;
- (void)relayout;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)serverUtteranceView:(id)a3 utteranceViewDidAppear:(id)a4;
- (void)serverUtteranceView:(id)a3 utteranceViewDidDisappear:(id)a4;
- (void)setAllowAutomaticConversationSnippetViewScaling:(BOOL)a3;
- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3;
- (void)setAttachmentType:(int64_t)a3;
- (void)setAttachmentYOffset:(double)a3;
- (void)setConversationSnippetViews:(id)a3;
- (void)setCurrentExpandablePlatterStyle:(int64_t)a3;
- (void)setCustomAttachmentConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDropletContainerDelegate:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setLatencyViewModel:(id)a3;
- (void)setLocalization:(id)a3;
- (void)setPopoverViewController:(id)a3;
- (void)setRevealRecognizedSpeech:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setServerUtterances:(id)a3;
- (void)setShowCollapsedUI:(BOOL)a3;
- (void)setShowingCollapsedUI:(BOOL)a3;
- (void)setSmartDialogCard:(id)a3;
- (void)setSmartDialogPlugin:(id)a3;
- (void)setSnippetBackgroundView:(id)a3;
- (void)setSnippetContainerView:(id)a3;
- (void)setSpeechRecognitionHypothesis:(id)a3;
- (void)setSpeechRecognitionHypothesisForSuggestion:(id)a3;
- (void)setStackConstraints:(id)a3;
- (void)setStackContainerDelegate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUseLowerPriorityHeightConstraint:(BOOL)a3;
- (void)setUserUtterance:(id)a3;
- (void)setUserUtteranceViewModel:(id)a3;
- (void)smartDialogSizeDidChangeWithSize:(CGSize)a3;
- (void)snippetContentDidUpdate;
- (void)snippetContentDidUpdateForHint;
- (void)transitionToResult;
- (void)triggerSmartDialogAnimationWithDelay:(double)a3;
- (void)updateContentSizeWithAnimation:(BOOL)a3;
- (void)updateUserUtteranceVisibilityIfNeeded;
- (void)userDidReportConcern;
- (void)userUtteranceView:(id)a3 speechRecognitionHypothesisDidAppear:(id)a4;
- (void)userUtteranceView:(id)a3 speechRecognitionHypothesisDidDisappear:(id)a4;
- (void)userUtteranceViewContentHeightDidUpdate:(id)a3;
- (void)userUtteranceViewTapped:(id)a3;
@end

@implementation SiriSharedUISmartDialogView

- (SiriSharedUISmartDialogView)initWithStreamingTextView:(id)a3 emojiMaskStreamingTextView:(id)a4
{
  return -[SiriSharedUISmartDialogView initWithFrame:](self, "initWithFrame:", a3, a4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (SiriSharedUISmartDialogView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUISmartDialogView;
  v3 = -[SiriSharedUISmartDialogView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v4 = v3;
  if (v3)
  {
    v3->_state = 1;
    [(SiriSharedUISmartDialogView *)v3 _setupSubviews];
    v5 = [(SiriSharedUISmartDialogView *)v4 layer];
    [v5 setOpacity:0.0];
    [(SiriSharedUISmartDialogView *)v4 setIsActive:1];
    [v5 setCornerRadius:28.0];
    [v5 setMasksToBounds:0];
  }
  return v4;
}

- (SiriSharedUISmartDialogView)initWithResultView:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriSharedUISmartDialogView;
  v5 = -[SiriSharedUISmartDialogView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 snippetView];
    objc_super v7 = (void *)v6;
    if (v6)
    {
      v12[0] = v6;
      v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      [(SiriSharedUISmartDialogView *)v5 setConversationSnippetViews:v8];
    }
    v5->_state = 1;
    [(SiriSharedUISmartDialogView *)v5 _setupSubviews];
    v9 = [(SiriSharedUISmartDialogView *)v5 layer];
    [v9 setOpacity:0.0];
    [(SiriSharedUISmartDialogView *)v5 setIsActive:1];
    [v9 setCornerRadius:28.0];
    v5->_snippetLayoutCount = 0;
  }
  return v5;
}

- (void)_setupSubviews
{
  v3 = [MEMORY[0x263F5E700] platterViewWithStyle:0];
  platterView = self->_platterView;
  self->_platterView = v3;

  v5 = [(PLPlatterView *)self->_platterView layer];
  [v5 setHitTestsAsOpaque:1];

  uint64_t v6 = [(PLPlatterView *)self->_platterView backgroundView];
  [v6 setHidden:1];

  [(PLPlatterView *)self->_platterView _setContinuousCornerRadius:28.0];
  [(SiriSharedUISmartDialogView *)self addSubview:self->_platterView];
  objc_super v7 = objc_alloc_init(SiriSharedUIStandardView);
  containerView = self->_containerView;
  self->_containerView = &v7->super;

  [(UIView *)self->_containerView setClipsToBounds:1];
  v9 = self->_containerView;
  v10 = [MEMORY[0x263F825C8] clearColor];
  [(UIView *)v9 setBackgroundColor:v10];

  objc_super v11 = [(PLPlatterView *)self->_platterView customContentView];
  [v11 addSubview:self->_containerView];

  v12 = objc_alloc_init(SiriSharedUIStandardScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v12;

  [(SiriSharedUIStandardScrollView *)self->_scrollView setScrollEnabled:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setDelegate:self];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(SiriSharedUIStandardScrollView *)self->_scrollView setKeyboardDismissMode:2];
  [(UIView *)self->_containerView addSubview:self->_scrollView];
  id v24 = objc_alloc_init(MEMORY[0x263F754B0]);
  [(SiriSharedUISmartDialogView *)self setLocalization:v24];
  [(PLPlatterView *)self->_platterView _continuousCornerRadius];
  v15 = -[SiriSharedUICompactUserUtteranceView initWithContentInsets:cornerRadius:]([SiriSharedUICompactUserUtteranceView alloc], "initWithContentInsets:cornerRadius:", 20.0, 24.0, 0.0, 24.0, v14);
  userUtteranceView = self->_userUtteranceView;
  self->_userUtteranceView = v15;

  [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView setDelegate:self];
  [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:self->_userUtteranceView];
  v17 = [[_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer alloc] initWithDelegate:self];
  smartDialogContainer = self->_smartDialogContainer;
  self->_smartDialogContainer = v17;

  v19 = [(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer view];
  smartDialogView = self->_smartDialogView;
  self->_smartDialogView = v19;

  [(UIView *)self->_smartDialogView setHidden:1];
  [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:self->_smartDialogView];
  v21 = objc_alloc_init(SiriSharedUIStandardView);
  snippetContainerView = self->_snippetContainerView;
  self->_snippetContainerView = &v21->super;

  [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:self->_snippetContainerView];
  [(SiriSharedUISmartDialogView *)self setCurrentExpandablePlatterStyle:0];
  uint64_t v23 = SiriSharedUILanguageSemanticContentAttribute();
  SiriSharedUIRecursiveSetSemanticContentAttribute(self, v23);
}

- (id)contentContainerView
{
  return self->_scrollView;
}

- (void)setPopoverViewController:(id)a3
{
}

- (void)prepareForDrillInAnimation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_isDrilledIn = 1;
  [(SiriSharedUISmartDialogView *)self _setBackgroundViewsVisible:0];
  v3 = [(UIView *)self->_snippetContainerView subviews];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v8 performSelector:sel_prepareForDrillInAnimation];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)prepareForPopAnimationOfType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  self->_isDrilledIn = 0;
  [(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer setAllowDrillingInAndOut:a3 == 1];
  uint64_t v5 = [(UIView *)self->_snippetContainerView subviews];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          long long v11 = [NSNumber numberWithInteger:a3];
          [v10 performSelector:sel_prepareForPopAnimationOfType_ withObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)finalizePopAnimationOfType:(int64_t)a3
{
}

- (void)_setBackgroundViewsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)a3;
  [(UIView *)self->_snippetBackgroundView setAlpha:(double)a3];
  uint64_t v6 = [(PLPlatterView *)self->_platterView backgroundMaterialView];
  [v6 setAlpha:v5];

  uint64_t v7 = [(PLPlatterView *)self->_platterView backgroundView];
  [v7 setAlpha:v5];

  platterView = self->_platterView;
  [(PLPlatterView *)platterView setHasShadow:v3];
}

- (id)prepareForUpdatesPendingCompletionBlocks
{
  prepareForUpdatesPendingCompletionBlocks = self->_prepareForUpdatesPendingCompletionBlocks;
  if (!prepareForUpdatesPendingCompletionBlocks)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    double v5 = self->_prepareForUpdatesPendingCompletionBlocks;
    self->_prepareForUpdatesPendingCompletionBlocks = v4;

    prepareForUpdatesPendingCompletionBlocks = self->_prepareForUpdatesPendingCompletionBlocks;
  }
  return prepareForUpdatesPendingCompletionBlocks;
}

- (void)prepareForUpdatesToServerUtterance:(BOOL)a3 conversationSnippetViews:(BOOL)a4 speechRecognitionHypothesis:(BOOL)a5 latencyViewModel:(BOOL)a6 updateBlock:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a7;
  BOOL v13 = 0;
  int v14 = ![(SiriSharedUISmartDialogView *)self _showSpeech];
  if ((v14 & 1) == 0 && v8) {
    BOOL v13 = !self->_waitingForFinalSpeechHypothesis;
  }
  int v15 = (v9 || v7 || v10) & v14;
  v16 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    BOOL runningPrepareForUpdates = self->_runningPrepareForUpdates;
    *(_DWORD *)buf = 136315906;
    v27 = "-[SiriSharedUISmartDialogView prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHyp"
          "othesis:latencyViewModel:updateBlock:]";
    __int16 v28 = 1024;
    BOOL v29 = runningPrepareForUpdates;
    __int16 v30 = 1024;
    BOOL v31 = v13;
    __int16 v32 = 1024;
    int v33 = v15;
    _os_log_impl(&dword_20C9D5000, v16, OS_LOG_TYPE_DEFAULT, "%s #compact prepareForUpdates isAlreadyRunningPrepareForUpdates: %d, meetsRequirementsForASRUpdating: %d, meetsRequirementsForContentUpdating: %d", buf, 0x1Eu);
  }
  if ((v15 | v13) != 1 || self->_runningPrepareForUpdates)
  {
    if (v12)
    {
      if (self->_runningPrepareForUpdates)
      {
        v21 = [(SiriSharedUISmartDialogView *)self prepareForUpdatesPendingCompletionBlocks];
        v22 = (void *)[v12 copy];
        uint64_t v23 = _Block_copy(v22);
        [v21 addObject:v23];
      }
      else
      {
        (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
      }
    }
  }
  else
  {
    self->_BOOL runningPrepareForUpdates = 1;
    if (v13) {
      self->_waitingForFinalSpeechHypothesis = 1;
    }
    if (v12)
    {
      v18 = [(SiriSharedUISmartDialogView *)self prepareForUpdatesPendingCompletionBlocks];
      v19 = (void *)[v12 copy];
      v20 = _Block_copy(v19);
      [v18 addObject:v20];
    }
    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __148__SiriSharedUISmartDialogView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke;
    v24[3] = &unk_2640E3870;
    objc_copyWeak(&v25, (id *)buf);
    [(SiriSharedUISmartDialogView *)self animateFadeOutWithCompletion:v24];
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __148__SiriSharedUISmartDialogView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 484) = 0;
    BOOL v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v7 = "-[SiriSharedUISmartDialogView prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHy"
           "pothesis:latencyViewModel:updateBlock:]_block_invoke";
      _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact processing any pending update completionBlocks", buf, 0xCu);
    }
    uint64_t v4 = objc_alloc_init(SiriSharedUIAnimationContext);
    [(SiriSharedUIAnimationContext *)v4 setAnimationDuration:0.0];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __148__SiriSharedUISmartDialogView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke_34;
    v5[3] = &unk_2640E37F8;
    v5[4] = v2;
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v5 context:v4 completion:0];
  }
}

uint64_t __148__SiriSharedUISmartDialogView_prepareForUpdatesToServerUtterance_conversationSnippetViews_speechRecognitionHypothesis_latencyViewModel_updateBlock___block_invoke_34(uint64_t a1)
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
    [(SiriSharedUISmartDialogView *)self animateAppearanceIfNeeded];
    self->_requestedAppearanceAnimation = 0;
  }
}

- (void)animateFadeOutWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SiriSharedUISmartDialogView *)self layerHasOpacity])
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[SiriSharedUISmartDialogView animateFadeOutWithCompletion:]";
      _os_log_impl(&dword_20C9D5000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeOut of conversationView", buf, 0xCu);
    }
    self->_runningAnimatedFadeOut = 1;
    [MEMORY[0x263F158F8] begin];
    objc_initWeak((id *)buf, self);
    uint64_t v6 = (void *)MEMORY[0x263F158F8];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    long long v12 = __60__SiriSharedUISmartDialogView_animateFadeOutWithCompletion___block_invoke;
    BOOL v13 = &unk_2640E3898;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v4;
    [v6 setCompletionBlock:&v10];
    BOOL v7 = [(SiriSharedUISmartDialogView *)self animatingLayer];
    uint64_t v8 = [(SiriSharedUISmartDialogView *)self _conversationDisappearAnimation];
    [v7 addAnimation:v8 forKey:@"conversationDisappearance"];

    long long v9 = [(SiriSharedUISmartDialogView *)self animatingLayer];
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

void __60__SiriSharedUISmartDialogView_animateFadeOutWithCompletion___block_invoke(uint64_t a1)
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
    block[2] = __60__SiriSharedUISmartDialogView_animateFadeOutWithCompletion___block_invoke_2;
    block[3] = &unk_2640E37F8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __60__SiriSharedUISmartDialogView_animateFadeOutWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteAnimatedFadeOut];
}

- (void)animateAppearanceIfNeeded
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!self->_isDrilledIn)
  {
    if (self->_runningAnimatedFadeOut)
    {
      self->_requestedAppearanceAnimation = 1;
    }
    else if (![(SiriSharedUISmartDialogView *)self layerHasOpacity])
    {
      uint64_t v3 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        long long v9 = "-[SiriSharedUISmartDialogView animateAppearanceIfNeeded]";
        _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeIn of conversationView", (uint8_t *)&v8, 0xCu);
      }
      [MEMORY[0x263F158F8] begin];
      id v4 = [(SiriSharedUISmartDialogView *)self animatingLayer];
      uint64_t v5 = [(SiriSharedUISmartDialogView *)self _conversationAppearAnimation];
      [v4 addAnimation:v5 forKey:@"conversationAppearance"];

      uint64_t v6 = [(SiriSharedUISmartDialogView *)self animatingLayer];
      LODWORD(v7) = 1.0;
      [v6 setOpacity:v7];

      if (self->_isInAmbient) {
        +[SiriSharedUICAFiltering applyGaussianBlurFilterToView:self];
      }
      [MEMORY[0x263F158F8] commit];
    }
  }
}

- (void)animateForDrillIn
{
  smartDialogContainer = self->_smartDialogContainer;
  id v4 = [MEMORY[0x263F825C8] systemBlueColor];
  [(SiriSharedUISmartDialogContainer *)smartDialogContainer updateHeaderWithText:&stru_26C1A19D8 color:v4];

  uint64_t v5 = self->_smartDialogContainer;
  [(SiriSharedUISmartDialogContainer *)v5 updateBodyWithText:@"\n"];
}

- (id)_conversationAppearAnimation
{
  if ([(SiriSharedUISmartDialogView *)self _showSpeech]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  id v4 = NSNumber;
  [(SiriSharedUISmartDialogView *)self frame];
  uint64_t v6 = [v4 numberWithDouble:v5];
  double v7 = +[SiriSharedUIAnimationUtilities animationForStyle:v3 expectedWidthForStyle:v6 presentationType:[(SiriSharedUISmartDialogView *)self _animatedPresentationType]];

  return v7;
}

- (id)_conversationDisappearAnimation
{
  int64_t v2 = [(SiriSharedUISmartDialogView *)self _animatedPresentationType];
  return +[SiriSharedUIAnimationUtilities animationForStyle:2 expectedWidthForStyle:0 presentationType:v2];
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
}

- (BOOL)layerHasOpacity
{
  int64_t v2 = [(SiriSharedUISmartDialogView *)self animatingLayer];
  [v2 opacity];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (id)animatingLayer
{
  int64_t v2 = self;
  float v3 = [(SiriSharedUISmartDialogView *)self layer];
  [v3 opacity];
  float v5 = v4;

  if (v5 != 0.0) {
    int64_t v2 = (SiriSharedUISmartDialogView *)v2->_scrollView;
  }
  uint64_t v6 = [(SiriSharedUISmartDialogView *)v2 layer];
  return v6;
}

- (void)transitionToResult
{
  self->_state = 1;
}

- (BOOL)ongoingASR
{
  float v3 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel speech];
  if (v3)
  {
    float v4 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel speech];
    if ([v4 isFinal])
    {
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v6 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel speech];
      double v7 = [v6 backingAceObject];
      BOOL v5 = v7 != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasResult
{
  return ![(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer shouldBeHidden]
      || [(NSArray *)self->_conversationSnippetViews count] != 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_state)
  {
    -[SiriSharedUILatencyView sizeThatFits:](self->_latencyView, "sizeThatFits:", a3.width, a3.height);
    double v7 = v6;
    -[SiriSharedUICompactUserUtteranceView sizeThatFits:](self->_userUtteranceView, "sizeThatFits:", width, height);
    double v9 = v8;
    -[SiriSharedUISmartDialogContainer sizeThatFits:](self->_smartDialogContainer, "sizeThatFits:", width + -48.0, height);
    double v11 = v10;
    -[SiriSharedUISmartDialogView _sizeThatFitsAllSnippets:](self, "_sizeThatFitsAllSnippets:", width, height);
    double v13 = v12;
    if (self->_isInAmbient)
    {
      if (self->_isInAmbientInteractivity) {
        id v14 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
      }
      else {
        id v14 = &SiriSharedUICompactAmbientContentScaleAmount;
      }
      double v13 = v12 * *(double *)v14;
      double v15 = 20.0;
    }
    else
    {
      double v15 = 0.0;
    }
    double v19 = -0.0;
    if (v7 > 0.0) {
      double v19 = v7;
    }
    double v20 = v19 + v15;
    if (v9 <= 0.0)
    {
      p_smartDialogView = &self->_smartDialogView;
      if ([(UIView *)self->_smartDialogView isHidden])
      {
LABEL_25:
        BOOL v24 = [(UIView *)*p_smartDialogView isHidden];
        if (v13 <= 0.0)
        {
          if (v24) {
            double v28 = v20;
          }
          else {
            double v28 = v20 + 20.0;
          }
          goto LABEL_38;
        }
        if (v9 == 0.0 && v24) {
          goto LABEL_32;
        }
        if ([(UIView *)*p_smartDialogView isHidden])
        {
LABEL_34:
          [(SiriSharedUISmartDialogView *)self snippetContentInsets];
          double v28 = v20 + v13 + v27;
LABEL_38:
          if (!self->_currentExpandablePlatterStyle)
          {
            BOOL v29 = [(SiriSharedUISmartDialogView *)self dropletContainerDelegate];
            [v29 dropletContentMaximumContainerHeight];
            double v31 = v30;

            if (v28 >= v31) {
              double v28 = v31;
            }
          }
          double v17 = width;
          double v18 = v28;
          goto LABEL_43;
        }
        if (self->_isInAmbient) {
LABEL_32:
        }
          [(SiriSharedUISmartDialogView *)self snippetContentInsets];
        else {
          double v26 = 16.0;
        }
        double v20 = v20 + v26;
        goto LABEL_34;
      }
      if (!self->_isInAmbient)
      {
        double v23 = 20.0;
        goto LABEL_24;
      }
    }
    else
    {
      if ([(SiriSharedUISmartDialogView *)self _showSpeech])
      {
        double v20 = v9 + v20;
        if ([(UIView *)self->_smartDialogView isHidden])
        {
          [(SiriSharedUISmartDialogView *)self serverUtteranceContentInsets];
          double v20 = v20 + v21;
        }
      }
      p_smartDialogView = &self->_smartDialogView;
      if ([(UIView *)self->_smartDialogView isHidden]) {
        goto LABEL_25;
      }
      if (!self->_isInAmbient)
      {
        double v23 = 12.0;
LABEL_24:
        double v20 = v20 + v11 + v23;
        goto LABEL_25;
      }
    }
    [(SiriSharedUISmartDialogView *)self serverUtteranceContentInsets];
    goto LABEL_24;
  }
  userUtteranceView = self->_userUtteranceView;
  -[SiriSharedUICompactUserUtteranceView sizeThatFits:](userUtteranceView, "sizeThatFits:");
LABEL_43:
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  v133.receiver = self;
  v133.super_class = (Class)SiriSharedUISmartDialogView;
  [(SiriSharedUISmartDialogView *)&v133 layoutSubviews];
  [(SiriSharedUISmartDialogView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(SiriSharedUISmartDialogView *)self animationContextForFrameAndLayoutUpdate];

  if (v11)
  {
    v132[0] = MEMORY[0x263EF8330];
    v132[1] = 3221225472;
    v132[2] = __45__SiriSharedUISmartDialogView_layoutSubviews__block_invoke;
    v132[3] = &unk_2640E38C0;
    v132[4] = self;
    *(double *)&v132[5] = v4;
    *(double *)&v132[6] = v6;
    *(double *)&v132[7] = v8;
    *(double *)&v132[8] = v10;
    double v12 = [(SiriSharedUISmartDialogView *)self animationContextForFrameAndLayoutUpdate];
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v132 context:v12 completion:0];
  }
  else
  {
    -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v4, v6, v8, v10);
  }
  -[UIView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
  scrollView = self->_scrollView;
  [(UIView *)self->_containerView bounds];
  -[SiriSharedUIStandardScrollView setFrame:](scrollView, "setFrame:");
  -[SiriSharedUILatencyView sizeThatFits:](self->_latencyView, "sizeThatFits:", v8, v10);
  double v15 = v14;
  double v17 = v16;
  -[SiriSharedUICompactUserUtteranceView sizeThatFits:](self->_userUtteranceView, "sizeThatFits:", v8, v10);
  id obj = v18;
  double v118 = v19;
  -[SiriSharedUISmartDialogContainer sizeThatFits:](self->_smartDialogContainer, "sizeThatFits:", v8 + -48.0, 1.79769313e308);
  double v124 = v20;
  double v116 = v21;
  v146.origin.CGFloat x = v4;
  v146.origin.CGFloat y = v6;
  v146.size.double width = v8;
  v146.size.CGFloat height = v10;
  double Width = CGRectGetWidth(v146);
  uint64_t v23 = 541;
  if (self->_isInAmbient) {
    double v24 = 20.0;
  }
  else {
    double v24 = 0.0;
  }
  v147.origin.CGFloat x = v4;
  v147.origin.CGFloat y = v6;
  double v113 = v8;
  v147.size.double width = v8;
  v147.size.CGFloat height = v10;
  double v114 = CGRectGetWidth(v147);
  [(SiriSharedUISmartDialogView *)self snippetContentInsets];
  double v121 = v25;
  double v26 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v120 = *MEMORY[0x263F001B0];
  double v27 = (double *)MEMORY[0x263F001A8];
  v126 = self;
  if (v15 == *MEMORY[0x263F001B0] && v17 == v26)
  {
    -[SiriSharedUILatencyView setFrame:](self->_latencyView, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v28 = 0.0;
    CGFloat MaxY = 0.0;
  }
  else
  {
    -[SiriSharedUILatencyView setFrame:](self->_latencyView, "setFrame:", Width * 0.5 - v15 * 0.5, v24, v15, v17);
    [(SiriSharedUILatencyView *)self->_latencyView frame];
    CGFloat MaxY = CGRectGetMaxY(v148);
    [(SiriSharedUILatencyView *)self->_latencyView frame];
    double v24 = CGRectGetMaxY(v149);
    [(SiriSharedUILatencyView *)self->_latencyView frame];
    double v28 = CGRectGetMaxY(v150);
    [(SiriSharedUILatencyView *)self->_latencyView frame];
    double v121 = CGRectGetMaxY(v151);
  }
  double v30 = v118;
  double v31 = v120;
  BOOL v32 = v118 == v26 && *(double *)&obj == v120;
  if (v32)
  {
    -[SiriSharedUICompactUserUtteranceView setFrame:](self->_userUtteranceView, "setFrame:", *v27, v27[1], v27[2], v27[3]);
    double v33 = v26;
    double v34 = MaxY;
  }
  else
  {
    if ([(SiriSharedUISmartDialogView *)self hasResult]) {
      double v35 = v24;
    }
    else {
      double v35 = v10 * 0.5 - v118 * 0.5 + -10.0;
    }
    if ([(NSArray *)self->_serverUtterances count] || !self->_hasHintConversationSnippets)
    {
      userUtteranceView = self->_userUtteranceView;
    }
    else
    {
      userUtteranceView = self->_userUtteranceView;
      [(SiriSharedUISmartDialogView *)self serverUtteranceContentInsets];
      double v30 = v118 + v37;
    }
    double v33 = v26;
    -[SiriSharedUICompactUserUtteranceView setFrame:](userUtteranceView, "setFrame:", 0.0, v35, *(double *)&obj, v30);
    [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
    double v34 = CGRectGetMaxY(v152);
    [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
    double v28 = CGRectGetMaxY(v153);
    [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
    double v38 = CGRectGetMaxY(v154);
    [(SiriSharedUISmartDialogView *)self serverUtteranceContentInsets];
    double v121 = v38 + v39;
    [(UIView *)self->_smartDialogView isHidden];
  }
  v40 = [(SiriSharedUISmartDialogView *)self dropletContainerDelegate];
  [v40 setDropletContainerUserUtteranceViewHeight:0.0];

  v41 = self;
  if ([(UIView *)self->_smartDialogView isHidden])
  {
    -[UIView setFrame:](self->_smartDialogView, "setFrame:", *v27, v27[1], v27[2], v27[3]);
  }
  else
  {
    double v42 = 12.0;
    if (v32) {
      double v42 = 20.0;
    }
    if (self->_isInAmbient) {
      [(SiriSharedUISmartDialogView *)self serverUtteranceContentInsets];
    }
    CGFloat v43 = v28 + v42;
    -[UIView setFrame:](self->_smartDialogView, "setFrame:", v114 * 0.5 - v124 * 0.5, v43, v124, v116);
    v155.origin.CGFloat x = v114 * 0.5 - v124 * 0.5;
    v155.origin.CGFloat y = v43;
    v155.size.double width = v124;
    v155.size.CGFloat height = v116;
    double v34 = CGRectGetMaxY(v155);
    v156.origin.CGFloat x = v114 * 0.5 - v124 * 0.5;
    v156.origin.CGFloat y = v43;
    v156.size.double width = v124;
    v156.size.CGFloat height = v116;
    double v121 = CGRectGetMaxY(v156);
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  obja = self->_conversationSnippetViews;
  uint64_t v44 = [(NSArray *)obja countByEnumeratingWithState:&v128 objects:v144 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v129;
    double v117 = v27[1];
    double v119 = *v27;
    double v47 = v27[3];
    double v115 = v27[2];
    double v125 = 0.0;
    double v48 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v129 != v46) {
          objc_enumerationMutation(obja);
        }
        v50 = *(void **)(*((void *)&v128 + 1) + 8 * i);
        conversationSnippetVibrancyViews = v41->_conversationSnippetVibrancyViews;
        v52 = [(SiriSharedUISmartDialogView *)v41 _keyForSnippet:v50];
        v53 = [(NSDictionary *)conversationSnippetVibrancyViews objectForKey:v52];

        v41 = v126;
        [(SiriSharedUISmartDialogView *)v126 _sizeOfSnippet:v50];
        BOOL v56 = v54 == v31 && v55 == v33;
        if (v56)
        {
          objc_msgSend(v50, "setFrame:", v119, v117, v115, v47);
          -[UIView setFrame:](v126->_snippetBackgroundView, "setFrame:", v119, v117, v115, v47);
          -[UIView setFrame:](v53, "setFrame:", v119, v117, v115, v47);
        }
        else
        {
          double v57 = v54;
          double v58 = v55;
          uint64_t v59 = v46;
          uint64_t v60 = v23;
          objc_msgSend(v50, "setFrame:", 0.0, v48, v54, v55);
          v61 = [(UIView *)v126->_snippetBackgroundView superview];
          snippetContainerView = v126->_snippetContainerView;

          BOOL v56 = v61 == snippetContainerView;
          v41 = v126;
          if (v56) {
            -[UIView setFrame:](v126->_snippetBackgroundView, "setFrame:", 0.0, v48, v57, v58);
          }
          double v63 = v33;
          -[UIView setFrame:](v53, "setFrame:", 0.0, v48, v57, v58);
          uint64_t v23 = v60;
          [(UIView *)v53 setHidden:*((unsigned __int8 *)&v126->super.super.super.super.isa + v60)];
          hintVibrancyView = v126->_hintVibrancyView;
          if (hintVibrancyView) {
            BOOL v65 = hintVibrancyView == v53;
          }
          else {
            BOOL v65 = 0;
          }
          if (v65)
          {
            v66 = [(UIView *)v53 layer];
            LODWORD(v67) = 1.0;
            [v66 setOpacity:v67];

            v41 = v126;
          }
          [v50 frame];
          CGFloat x = v68;
          CGFloat y = v70;
          CGFloat v73 = v72;
          CGFloat height = v74;
          if (*((unsigned char *)&v41->super.super.super.super.isa + v60))
          {
            double v76 = 1.0;
            if (!v41->_isInAmbientInteractivity) {
              double v76 = 2.0;
            }
            CGAffineTransformMakeScale(&v127, v76, v76);
            v157.origin.CGFloat x = x;
            v157.origin.CGFloat y = y;
            v157.size.double width = v73;
            v157.size.CGFloat height = height;
            CGRect v158 = CGRectApplyAffineTransform(v157, &v127);
            CGFloat x = v158.origin.x;
            CGFloat y = v158.origin.y;
            CGFloat v73 = v158.size.width;
            CGFloat height = v158.size.height;
          }
          uint64_t v46 = v59;
          v159.origin.CGFloat x = x;
          v159.origin.CGFloat y = y;
          v159.size.double width = v73;
          v159.size.CGFloat height = height;
          double v77 = CGRectGetMaxY(v159);
          [(SiriSharedUISmartDialogView *)v41 snippetContentInsets];
          double v48 = v77 + v78;
          v160.origin.CGFloat x = x;
          v160.origin.CGFloat y = y;
          v160.size.double width = v73;
          v160.size.CGFloat height = height;
          double v31 = v120;
          double v34 = v121 + CGRectGetMaxY(v160);
          double v79 = v125;
          if (v125 < v57) {
            double v79 = v57;
          }
          double v125 = v79;
          double v33 = v63;
        }
      }
      uint64_t v45 = [(NSArray *)obja countByEnumeratingWithState:&v128 objects:v144 count:16];
    }
    while (v45);
  }
  else
  {
    double v125 = 0.0;
    double v48 = 0.0;
  }

  if (*((unsigned char *)&v41->super.super.super.super.isa + v23))
  {
    unint64_t v80 = 0x2676EA000;
    double v81 = v125;
    if (v41->_allowAutomaticConversationSnippetViewScaling)
    {
      v82 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
      if (!v41->_isInAmbientInteractivity) {
        v82 = &SiriSharedUICompactAmbientContentScaleAmount;
      }
      double v81 = v125 * *(double *)v82;
    }
  }
  else
  {
    unint64_t v80 = 0x2676EA000uLL;
    double v81 = v125;
  }
  if (![(UIView *)v41->_smartDialogView isHidden])
  {
    [(SiriSharedUISmartDialogView *)v41 serverUtteranceContentInsets];
    double v121 = v121 + v83;
    if ([(NSArray *)v41->_conversationSnippetViews count])
    {
      if (*((unsigned char *)&v41->super.super.super.super.isa + v23))
      {
        [(SiriSharedUISmartDialogView *)v41 serverUtteranceContentInsets];
        double v85 = v84;
      }
      else
      {
        double v85 = 16.0;
      }
      [(SiriSharedUISmartDialogView *)v41 snippetContentInsets];
      double v34 = v34 + v85 + v87;
    }
    else
    {
      if (*((unsigned char *)&v41->super.super.super.super.isa + v23)) {
        [(SiriSharedUISmartDialogView *)v41 serverUtteranceContentInsets];
      }
      else {
        double v86 = 20.0;
      }
      double v34 = v34 + v86;
    }
  }
  [(SiriSharedUISmartDialogView *)v41 snippetContentInsets];
  if (*((unsigned char *)&v41->super.super.super.super.isa + *(int *)(v80 + 2180)))
  {
    [(SiriSharedUISmartDialogView *)v41 bounds];
    double v81 = v89;
    double v90 = 0.0;
  }
  else
  {
    double v90 = v88;
  }
  -[UIView setFrame:](v41->_snippetContainerView, "setFrame:", v90, v121, v81, v48);
  -[SiriSharedUIStandardScrollView setContentSize:](v41->_scrollView, "setContentSize:", v113, v34);
  [(SiriSharedUIStandardScrollView *)v41->_scrollView frame];
  if (v34 <= v91)
  {
    [(SiriSharedUISmartDialogContainer *)v41->_smartDialogContainer updateWithSnippetFrameInGlobal:0];
  }
  else if ([(SiriSharedUISmartDialogView *)v41 isActive])
  {
    v92 = v41->_scrollView;
    [(SiriSharedUIStandardScrollView *)v92 frame];
    double v94 = v93;
    double v96 = v95;
    double v98 = v97;
    double v100 = v99;
    v101 = [(SiriSharedUISmartDialogView *)v41 enclosedContainerView];
    -[SiriSharedUIStandardScrollView convertRect:toView:](v92, "convertRect:toView:", v101, v94, v96, v98, v100);
    double v103 = v102;
    double v105 = v104;
    double v107 = v106;
    double v109 = v108;

    v110 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v135 = "-[SiriSharedUISmartDialogView layoutSubviews]";
      __int16 v136 = 2048;
      double v137 = v103;
      __int16 v138 = 2048;
      double v139 = v105;
      __int16 v140 = 2048;
      double v141 = v107;
      __int16 v142 = 2048;
      double v143 = v109;
      _os_log_impl(&dword_20C9D5000, v110, OS_LOG_TYPE_DEFAULT, "%s #smartDialog - snippet frame in global: (%f, %f, %f, %f)", buf, 0x34u);
    }
    v111 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v103, v105, v107, v109);
    [(SiriSharedUISmartDialogContainer *)v41->_smartDialogContainer updateWithSnippetFrameInGlobal:v111];
  }
  if (!v41->_currentExpandablePlatterStyle)
  {
    [(SiriSharedUIStandardScrollView *)v41->_scrollView frame];
    [(SiriSharedUIStandardScrollView *)v41->_scrollView setScrollEnabled:v34 > v112];
  }
}

uint64_t __45__SiriSharedUISmartDialogView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)enclosedContainerView
{
  return 0;
}

- (void)_resetExpansionStateForNewContent
{
  if ([(SiriSharedUISmartDialogView *)self transitionToExpandablePlatterStyle:1])
  {
    id v3 = [(SiriSharedUISmartDialogView *)self delegate];
    [v3 conversationViewDidResetExpandedState:self];
  }
}

- (void)setServerUtterances:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  double v4 = (NSArray *)a3;
  serverUtterances = self->_serverUtterances;
  if (serverUtterances != v4 && ![(NSArray *)serverUtterances isEqualToArray:v4])
  {
    double v6 = (NSArray *)[(NSArray *)v4 copy];
    double v7 = self->_serverUtterances;
    self->_serverUtterances = v6;

    double v8 = [MEMORY[0x263F825C8] systemBlueColor];
    if ([(NSArray *)self->_serverUtterances count])
    {
      [(SiriSharedUISmartDialogView *)self transitionToResult];
      double v9 = [MEMORY[0x263EFF980] array];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      double v10 = self->_serverUtterances;
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v10);
            }
            double v15 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "text", (void)v28);
            [v9 addObject:v15];
          }
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v12);
      }

      double v16 = [v9 componentsJoinedByString:@"\n\n"];
    }
    else
    {
      double v16 = 0;
    }
    if ([(__CFString *)v16 length]) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = [(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer shouldBeHidden];
    }
    [(UIView *)self->_smartDialogView setHidden:v17];
    [(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer updateHeaderWithText:&stru_26C1A19D8 color:v8];
    if (v17) {
      double v18 = &stru_26C1A19D8;
    }
    else {
      double v18 = v16;
    }
    [(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer updateBodyWithText:v18];
    smartDialogView = self->_smartDialogView;
    uint64_t v20 = SiriSharedUILanguageSemanticContentAttribute();
    SiriSharedUIRecursiveSetSemanticContentAttribute(smartDialogView, v20);
    [(SiriSharedUISmartDialogView *)self _resetExpansionStateForNewContent];
    if (!v17)
    {
      [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
      if (!CGRectEqualToRect(v34, *MEMORY[0x263F001A8]))
      {
        [(SiriSharedUISmartDialogView *)self bounds];
        -[SiriSharedUISmartDialogContainer sizeThatFits:](self->_smartDialogContainer, "sizeThatFits:", v21, v22);
        double v24 = v23;
        double v26 = v25;
        [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
        double MinX = CGRectGetMinX(v35);
        [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView frame];
        -[UIView setFrame:](self->_smartDialogView, "setFrame:", MinX, CGRectGetMaxY(v36), v24, v26);
        [(UIView *)self->_smartDialogView layoutIfNeeded];
      }
    }
    [(SiriSharedUISmartDialogView *)self _reloadConversationSnippetViewsIfHint];
    [(SiriSharedUISmartDialogView *)self updateContentSizeWithAnimation:1];
  }
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
          if (-[SiriSharedUISmartDialogView _isConversationSnippetHintType:](self, "_isConversationSnippetHintType:", v8, (void)v12))
          {
            conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
            double v10 = [(SiriSharedUISmartDialogView *)self _keyForSnippet:v8];
            uint64_t v11 = [(NSDictionary *)conversationSnippetVibrancyViews objectForKey:v10];

            [(SiriSharedUISmartDialogView *)self _adjustHintCornerRadiusForSnippetView:v8 vibrancyView:v11];
          }
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
}

- (void)setUserUtteranceViewModel:(id)a3
{
  uint64_t v4 = (SiriSharedUISAEUserUtteranceViewModel *)a3;
  if (self->_userUtteranceViewModel != v4)
  {
    double v19 = v4;
    uint64_t v5 = [SiriSharedUISAEUserUtteranceViewModel alloc];
    uint64_t v6 = [(SiriSharedUISAEUserUtteranceViewModel *)v19 speech];
    double v7 = (void *)[v6 copy];
    uint64_t v8 = [(SiriSharedUISAEUserUtteranceViewModel *)v19 latencySummary];
    uint64_t v9 = [(SiriSharedUISAEUserUtteranceViewModel *)v19 shouldShow];
    double v10 = [(SiriSharedUISAEUserUtteranceViewModel *)v19 taskIdentifier];
    uint64_t v11 = [(SiriSharedUISAEUserUtteranceViewModel *)v5 initWithSpeech:v7 latencySummary:v8 shouldShow:v9 taskIdentifier:v10];
    userUtteranceViewModel = self->_userUtteranceViewModel;
    self->_userUtteranceViewModel = v11;

    if ([(SiriSharedUISmartDialogView *)self ongoingASR]
      || [(SiriSharedUISAEUserUtteranceViewModel *)v19 shouldShow])
    {
      self->_state = 0;
    }
    long long v13 = [(SiriSharedUISAEUserUtteranceViewModel *)v19 latencySummary];

    userUtteranceView = self->_userUtteranceView;
    if (v13)
    {
      long long v15 = [(SiriSharedUISAEUserUtteranceViewModel *)v19 latencySummary];
      [(SiriSharedUICompactUserUtteranceView *)userUtteranceView setLatencySummary:v15];
    }
    else
    {
      double v16 = [(SiriSharedUISAEUserUtteranceViewModel *)v19 speech];
      [(SiriSharedUICompactUserUtteranceView *)userUtteranceView setSpeechRecognitionHypothesis:v16];

      uint64_t v17 = [(SiriSharedUISAEUserUtteranceViewModel *)v19 speech];
      LODWORD(v16) = [v17 isFinal];

      if (v16) {
        self->_waitingForFinalSpeechHypothesis = 0;
      }
    }
    double v18 = self->_userUtteranceView;
    [(SiriSharedUISmartDialogView *)self maxSnippetWidth];
    -[SiriSharedUICompactUserUtteranceView setMaxWidth:](v18, "setMaxWidth:");
    [(SiriSharedUISmartDialogView *)self updateContentSizeWithAnimation:0];
    uint64_t v4 = v19;
  }
}

- (void)setSpeechRecognitionHypothesisForSuggestion:(id)a3
{
  uint64_t v4 = (SRUIFSpeechRecognitionHypothesis *)[a3 copy];
  speechRecognitionHypothesisForSuggestion = self->_speechRecognitionHypothesisForSuggestion;
  self->_speechRecognitionHypothesisForSuggestion = v4;
  MEMORY[0x270F9A758](v4, speechRecognitionHypothesisForSuggestion);
}

- (void)setSmartDialogPlugin:(id)a3
{
  uint64_t v5 = (SAUIPluginSnippet *)a3;
  p_smartDialogPlugin = &self->_smartDialogPlugin;
  if (self->_smartDialogPlugin != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_smartDialogPlugin, a3);
    [(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer updateWithSmartDialogPluginView:v7];
    [(UIView *)self->_smartDialogView setHidden:[(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer shouldBeHidden]];
    if (v7) {
      [(SiriSharedUISmartDialogView *)self transitionToResult];
    }
    p_smartDialogPlugin = (SAUIPluginSnippet **)[(SiriSharedUISmartDialogView *)self updateContentSizeWithAnimation:1];
  }
  MEMORY[0x270F9A790](p_smartDialogPlugin);
}

- (void)setSmartDialogCard:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_smartDialogCard, a3);
  [(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer updateWithSmartDialogCard:v5];
  [(UIView *)self->_smartDialogView setHidden:[(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer shouldBeHidden]];
  if (v5) {
    [(SiriSharedUISmartDialogView *)self transitionToResult];
  }
  [(SiriSharedUISmartDialogView *)self updateContentSizeWithAnimation:1];
}

- (BOOL)onlyContainsSnippet
{
  if ([(NSArray *)self->_serverUtterances count]) {
    return 0;
  }
  else {
    return ![(SiriSharedUISmartDialogView *)self _showSpeech];
  }
}

- (void)setLatencyViewModel:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(SiriSharedUILatencyViewModel *)self->_latencyViewModel isEqualToViewModel:v11];
  id v5 = v11;
  if ((v4 & 1) == 0)
  {
    int v6 = [v11 viewShouldUpdateFromOldModel:self->_latencyViewModel];
    double v7 = (SiriSharedUILatencyViewModel *)[v11 copy];
    latencyViewModel = self->_latencyViewModel;
    self->_latencyViewModel = v7;

    uint64_t v4 = [(SiriSharedUISmartDialogView *)self ongoingASR];
    if ((v4 & 1) != 0
      || ([(SiriSharedUISmartDialogView *)self latencyViewModel],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 shouldDisplay],
          v9,
          v10))
    {
      self->_state = 0;
    }
    id v5 = v11;
    if (v6)
    {
      uint64_t v4 = [(SiriSharedUISmartDialogView *)self updateContentSizeWithAnimation:1];
      id v5 = v11;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)updateUserUtteranceVisibilityIfNeeded
{
  BOOL v3 = [(SiriSharedUISmartDialogView *)self _showSpeech];
  userUtteranceView = self->_userUtteranceView;
  if (v3)
  {
    id v6 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel speech];
    [(SiriSharedUICompactUserUtteranceView *)userUtteranceView setSpeechRecognitionHypothesis:v6];
  }
  else
  {
    id v5 = self->_userUtteranceView;
    [(SiriSharedUICompactUserUtteranceView *)v5 setSpeechRecognitionHypothesis:0];
  }
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
  double v2 = 16.0;
  if (self->_isInAmbient)
  {
    char v4 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel speech];
    if (v4)
    {
    }
    else
    {
      id v6 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel latencySummary];

      if (!v6)
      {
        double v5 = 4.0;
        goto LABEL_7;
      }
    }
    double v5 = 4.0;
    double v2 = 6.0;
  }
  else
  {
    double v5 = 16.0;
  }
LABEL_7:
  double v7 = 16.0;
  double v8 = 16.0;
  double v9 = v2;
  result.right = v8;
  result.bottom = v5;
  result.left = v7;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)userUtteranceContentInsets
{
  double v2 = 16.0;
  double v3 = 20.0;
  if (self->_isInAmbient) {
    double v3 = 16.0;
  }
  double v4 = 4.0;
  if (!self->_isInAmbient)
  {
    double v4 = 0.0;
    double v2 = 24.0;
  }
  double v5 = v2;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (BOOL)_hasNoDialog
{
  BOOL v3 = [(UIView *)self->_smartDialogView isHidden];
  if (v3)
  {
    [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView bounds];
    LOBYTE(v3) = v5 == *(double *)(MEMORY[0x263F001B0] + 8) && v4 == *MEMORY[0x263F001B0];
  }
  return v3;
}

- (UIEdgeInsets)snippetContentInsets
{
  if (self->_isInAmbient)
  {
    double v2 = 4.0;
    double v3 = 16.0;
    double v4 = 16.0;
  }
  else
  {
    BOOL v6 = [(SiriSharedUISmartDialogView *)self _hasNoDialog];
    double v3 = 0.0;
    double v2 = 0.0;
    double v4 = 0.0;
    if (!v6)
    {
      double v3 = 6.0;
      if (self->_hasHintConversationSnippets) {
        double v3 = 0.0;
      }
      double v2 = 8.0;
      if (self->_hasHintConversationSnippets) {
        double v2 = 0.0;
      }
      double v4 = v2;
    }
  }
  double v7 = v4;
  result.right = v7;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setSnippetBackgroundView:(id)a3
{
  id v5 = a3;
  p_snippetBackgroundView = (id *)&self->_snippetBackgroundView;
  id v7 = *p_snippetBackgroundView;
  if (*p_snippetBackgroundView != v5)
  {
    id v8 = v5;
    [v7 removeFromSuperview];
    objc_storeStrong(p_snippetBackgroundView, a3);
    id v5 = v8;
  }
  MEMORY[0x270F9A758](v7, v5);
}

- (void)setConversationSnippetViews:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_conversationSnippetViews = &self->_conversationSnippetViews;
  if (![(NSArray *)self->_conversationSnippetViews isEqualToArray:v5])
  {
    self->_snippetLayoutCount = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v7 = *p_conversationSnippetViews;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v43 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_conversationSnippetViews, a3);
    if ([(NSArray *)*p_conversationSnippetViews count]) {
      [(SiriSharedUISmartDialogView *)self transitionToResult];
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v12 = [(NSDictionary *)self->_conversationSnippetVibrancyViews allValues];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * j) removeFromSuperview];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v14);
    }

    id v28 = v5;
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = *p_conversationSnippetViews;
    uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (!v33)
    {
      LOBYTE(v32) = 1;
      goto LABEL_45;
    }
    uint64_t v31 = *(void *)v35;
    int v32 = 1;
    while (1)
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(void **)(*((void *)&v34 + 1) + 8 * k);
        uint64_t v19 = SiriSharedUILanguageSemanticContentAttribute();
        SiriSharedUIRecursiveSetSemanticContentAttribute(v18, v19);
        if (objc_opt_respondsToSelector())
        {
          [(SiriSharedUISmartDialogView *)self snippetContentInsets];
          objc_msgSend(v18, "viewInsetsInConversationView:");
        }
        if (objc_opt_respondsToSelector()) {
          v32 &= [v18 shouldAutomaticallyScaleContentInAmbient];
        }
        BOOL v20 = [(SiriSharedUISmartDialogView *)self _isConversationSnippetHintType:v18];
        if (![(SiriSharedUISmartDialogView *)self _shouldAddVibrancyForSnippet:v18]
          && !v20)
        {
          double v21 = 0;
          goto LABEL_35;
        }
        if (!v20)
        {
          double v21 = [[SiriSharedUICompactConversationSnippetVibrancyView alloc] initWithStyle:0];
          if (!v21) {
            goto LABEL_35;
          }
LABEL_34:
          double v23 = [(SiriSharedUISmartDialogView *)self _keyForSnippet:v18];
          [(NSDictionary *)v29 setObject:v21 forKey:v23];

          goto LABEL_35;
        }
        self->_hasHintConversationSnippets = 1;
        double v21 = [[SiriSharedUICompactConversationSnippetVibrancyView alloc] initWithStyle:1];
        [(UIView *)self->_snippetContainerView frame];
        -[SiriSharedUICompactConversationSnippetVibrancyView setFrame:](v21, "setFrame:");
        double v22 = [(SiriSharedUICompactConversationSnippetVibrancyView *)v21 layer];
        [v22 setOpacity:0.0];

        objc_storeStrong((id *)&self->_hintVibrancyView, v21);
        objc_storeStrong((id *)&self->_hintSnippetView, v18);
        if (v21) {
          goto LABEL_34;
        }
LABEL_35:
        snippetContainerView = self->_snippetContainerView;
        if (snippetContainerView)
        {
          [(UIView *)snippetContainerView addSubview:v18];
          double v25 = (void *)[objc_alloc(MEMORY[0x263F82628]) initWithDelegate:self];
          [(UIView *)self->_snippetContainerView addInteraction:v25];
          [(UIView *)self->_snippetContainerView insertSubview:self->_snippetBackgroundView belowSubview:v18];
          snippetBackgroundView = self->_snippetBackgroundView;
          [(UIView *)self->_snippetContainerView frame];
          -[UIView setFrame:](snippetBackgroundView, "setFrame:");
        }
        else
        {
          [(SiriSharedUIStandardScrollView *)self->_scrollView addContentView:v18];
        }
        if (v20) {
          [(SiriSharedUISmartDialogView *)self _adjustHintCornerRadiusForSnippetView:v18 vibrancyView:v21];
        }
        else {
          [(SiriSharedUISmartDialogView *)self _adjustCornerRadiusForSnippetView:v18 vibrancyView:v21];
        }
        [v18 setClipsToBounds:1];
      }
      uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (!v33)
      {
LABEL_45:

        conversationSnippetVibrancyViews = self->_conversationSnippetVibrancyViews;
        self->_conversationSnippetVibrancyViews = v29;

        [(SiriSharedUISmartDialogView *)self setAllowAutomaticConversationSnippetViewScaling:v32 & 1];
        [(SiriSharedUISmartDialogView *)self updateContentSizeWithAnimation:1];
        self->_didSetConversationSnippets = 1;
        id v5 = v28;
        break;
      }
    }
  }
}

- (BOOL)canRelayoutSnippet
{
  p_snippetLayoutCount = (uint64_t *)&self->_snippetLayoutCount;
  unint64_t v3 = self->_snippetLayoutCount + 1;
  self->_snippetLayoutCount = v3;
  if (v3 >= 0x3E8)
  {
    double v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      [(SiriSharedUISmartDialogView *)p_snippetLayoutCount canRelayoutSnippet];
    }
  }
  return v3 < 0x3E8;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = a3;
  id v7 = [v6 view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = [v6 view];
  uint64_t v17 = [v16 subviews];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = [v6 view];
    BOOL v20 = [v19 subviews];
    double v21 = [v20 firstObject];
    [v21 frame];
    double v9 = v22;
    double v11 = v23;
    double v13 = v24;
    double v15 = v25;
  }
  BOOL v26 = [(SiriSharedUISmartDialogView *)self _hasNoDialog];
  double v27 = &SiriSharedUISmartDialogPlatterCornerRadius;
  if (!v26) {
    double v27 = (uint64_t *)&SiriSharedUISmartDialogSnippetCornerRadius;
  }
  double v28 = *(double *)v27;
  id v29 = objc_alloc_init(MEMORY[0x263F82AD0]);
  long long v30 = [MEMORY[0x263F825C8] clearColor];
  [v29 setBackgroundColor:v30];

  uint64_t v31 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v28);
  [v29 setVisiblePath:v31];

  id v32 = objc_alloc(MEMORY[0x263F82CC8]);
  uint64_t v33 = [v6 view];
  long long v34 = (void *)[v32 initWithView:v33 parameters:v29];

  return v34;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__SiriSharedUISmartDialogView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_2640E3910;
  v6[4] = self;
  double v4 = [MEMORY[0x263F82610] configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];
  return v4;
}

id __85__SiriSharedUISmartDialogView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  double v2 = (void *)MEMORY[0x263F823D0];
  unint64_t v3 = [*(id *)(a1 + 32) localization];
  double v4 = [v3 localizedStringWithSiriLanguageForKey:@"Report a Concern"];
  id v5 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.bubble"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__SiriSharedUISmartDialogView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v11[3] = &unk_2640E38E8;
  v11[4] = *(void *)(a1 + 32);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v11];

  id v7 = (void *)MEMORY[0x263F82940];
  v12[0] = v6;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  double v9 = [v7 menuWithChildren:v8];

  return v9;
}

uint64_t __85__SiriSharedUISmartDialogView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) userDidReportConcern];
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
  [(SiriSharedUISmartDialogView *)self frame];
  double Height = CGRectGetHeight(v6);
  if (!self->_automaticallyCollapseWhenResultIsScrolled) {
    return 0;
  }
  return [(SiriSharedUISmartDialogView *)self contentSupportsCollapsingForHeight:Height];
}

- (void)snippetContentDidUpdate
{
}

- (void)snippetContentDidUpdateForHint
{
  if ([(NSArray *)self->_serverUtterances count]
    || [(NSArray *)self->_conversationSnippetViews count] > 1)
  {
    goto LABEL_6;
  }
  unint64_t v3 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel speech];
  if (v3)
  {

LABEL_6:
    [(SiriSharedUISmartDialogView *)self _prepareHintForAnimation];
    uint64_t v5 = 1;
    goto LABEL_7;
  }
  double v4 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel latencySummary];

  if (v4) {
    goto LABEL_6;
  }
  uint64_t v5 = 0;
LABEL_7:
  [(SiriSharedUISmartDialogView *)self updateContentSizeWithAnimation:v5];
}

- (void)_prepareHintForAnimation
{
  [(SiriSharedUISmartDialogView *)self _sizeOfSnippet:self->_hintSnippetView];
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
  [(SiriSharedUISmartDialogView *)self maxSnippetWidth];
  -[SiriSharedUISmartDialogView sizeThatFits:](self, "sizeThatFits:");
  result.CGFloat height = v4;
  result.double width = v3;
  return result;
}

- (double)maxSnippetWidth
{
  if (SiriSharedUIDeviceIsPad())
  {
    BOOL IsLargeFormatPad = SiriSharedUIDeviceIsLargeFormatPad();
    double v4 = (double *)&SiriSharedUISAEContentMaxWidthPadLarge;
    if (!IsLargeFormatPad) {
      double v4 = (double *)&SiriSharedUISAEContentMaxWidthPadRegular;
    }
  }
  else
  {
    double v4 = (double *)&SiriSharedUICompactContentMaxWidth;
  }
  double v5 = *v4;
  if (self->_isInAmbient)
  {
    double v6 = 2.0;
    double v7 = 52.0;
  }
  else
  {
    BOOL IsPad = SiriSharedUIDeviceIsPad();
    CGRect v9 = (double *)&SiriSharedUICompactPlatterAmbientHorizontalPadding;
    if (!IsPad) {
      CGRect v9 = (double *)&SiriSharedUICompactPlatterHorizontalPadding;
    }
    double v7 = *v9;
    double v6 = 1.0;
  }
  double v10 = v5 * v6;
  double v11 = [(SiriSharedUISmartDialogView *)self dropletContainerDelegate];
  [v11 dropletContentMaximumContainerWidth];
  double v13 = v12 + v7 * -2.0;

  if (v10 >= v13) {
    return v13;
  }
  else {
    return v10;
  }
}

- (CGSize)intrinsicContentSize
{
  [(SiriSharedUISmartDialogView *)self _fittingSize];
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
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(SiriSharedUISmartDialogView *)self _fittingSize];
  double v6 = v5;
  double v8 = v7;
  [(SiriSharedUISmartDialogView *)self _updateSubviewContentInsets];
  CGRect v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    double v12 = "-[SiriSharedUISmartDialogView updateContentSizeWithAnimation:]";
    __int16 v13 = 2048;
    double v14 = v6;
    __int16 v15 = 2048;
    double v16 = v8;
    _os_log_impl(&dword_20C9D5000, v9, OS_LOG_TYPE_DEFAULT, "%s #smartDialog updateContentSizeWithAnimation: %f %f", (uint8_t *)&v11, 0x20u);
  }
  double v10 = [(SiriSharedUISmartDialogView *)self dropletContainerDelegate];
  objc_msgSend(v10, "dropletContentWillUpdateLayout:withUpdatedContentSize:animated:", self, v3, v6, v8);

  [(SiriSharedUISmartDialogView *)self invalidateIntrinsicContentSize];
}

- (void)setAllowAutomaticConversationSnippetViewScaling:(BOOL)a3
{
  if (self->_allowAutomaticConversationSnippetViewScaling != a3)
  {
    self->_allowAutomaticConversationSnippetViewScaling = a3;
    [(SiriSharedUISmartDialogView *)self _updateAmbientSnippetScaling];
  }
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient != a3)
  {
    BOOL v3 = a3;
    self->_isInAmbient = a3;
    [(SiriSharedUISmartDialogView *)self _updateSubviewContentInsets];
    [(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView setIsInAmbient:v3];
    [(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer setIsInAmbient:v3];
    [(SiriSharedUISmartDialogView *)self _updateAmbientSnippetScaling];
    id v5 = [(PLPlatterView *)self->_platterView backgroundView];
    [v5 setHidden:self->_isInAmbient];
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbientInteractivity != a3)
  {
    self->_isInAmbientInteractivitCGFloat y = a3;
    -[SiriSharedUICompactUserUtteranceView setIsInAmbientInteractivity:](self->_userUtteranceView, "setIsInAmbientInteractivity:");
    [(SiriSharedUISmartDialogView *)self _updateAmbientSnippetScaling];
  }
}

- (void)_updateSubviewContentInsets
{
  userUtteranceView = self->_userUtteranceView;
  [(SiriSharedUISmartDialogView *)self userUtteranceContentInsets];
  -[SiriSharedUICompactUserUtteranceView setContentInsets:](userUtteranceView, "setContentInsets:");
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
    snippetContainerView = self->_snippetContainerView;
    CGAffineTransformMakeScale(&v10, *(CGFloat *)v2, *(CGFloat *)v2);
    double v4 = &v10;
    id v5 = snippetContainerView;
  }
  else
  {
    id v5 = self->_snippetContainerView;
    long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v7 = *MEMORY[0x263F000D0];
    long long v8 = v6;
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    double v4 = (CGAffineTransform *)&v7;
  }
  -[UIView setTransform:](v5, "setTransform:", v4, v7, v8, v9);
}

- (BOOL)_showSpeech
{
  BOOL v3 = [MEMORY[0x263F285A0] sharedPreferences];
  BOOL v4 = ([v3 alwaysShowRecognizedSpeech] & 1) != 0 || self->_revealRecognizedSpeech;

  return v4;
}

- (void)setShowCollapsedUI:(BOOL)a3
{
  if (self->_showingCollapsedUI != a3) {
    self->_showingCollapsedUI = a3;
  }
}

- (void)setCurrentExpandablePlatterStyle:(int64_t)a3
{
  self->_int64_t currentExpandablePlatterStyle = a3;
  if (a3 == 2)
  {
    [(SiriSharedUISmartDialogView *)self setShowCollapsedUI:1];
    BOOL v4 = [(SiriSharedUISmartDialogView *)self delegate];
    [v4 conversationViewDidTransitionToCollapsedState:self];

    goto LABEL_9;
  }
  [(SiriSharedUISmartDialogView *)self setShowCollapsedUI:0];
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
  id v8 = [(SiriSharedUISmartDialogView *)self delegate];
  [v8 conversationViewDidTransitionToExpandedState:self];
}

- (BOOL)transitionToExpandablePlatterStyle:(int64_t)a3
{
  int64_t currentExpandablePlatterStyle = self->_currentExpandablePlatterStyle;
  if (currentExpandablePlatterStyle != a3 && currentExpandablePlatterStyle != 0)
  {
    if (a3 == 4)
    {
      [(SiriSharedUISmartDialogView *)self setNeedsLayout];
    }
    else if (a3 == 1)
    {
      [(SiriSharedUISmartDialogView *)self updateContentSizeWithAnimation:0];
    }
    [(SiriSharedUISmartDialogView *)self setCurrentExpandablePlatterStyle:a3];
    [(SiriSharedUISmartDialogView *)self invalidateIntrinsicContentSize];
  }
  return currentExpandablePlatterStyle != 0;
}

- (void)userUtteranceViewTapped:(id)a3
{
  if ([(SiriSharedUICompactUserUtteranceView *)self->_userUtteranceView currentDisplayType] == 1)
  {
    BOOL v4 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel speech];
    uint64_t v5 = [v4 userUtterance];
    id v9 = [(id)v5 bestTextInterpretation];

    p_interactionDelegate = &self->_interactionDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_interactionDelegate);
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v8 = objc_loadWeakRetained((id *)p_interactionDelegate);
      [v8 siriViewControllerShouldRequestTextInputWithUtterance:v9];
    }
  }
}

- (void)userUtteranceView:(id)a3 speechRecognitionHypothesisDidAppear:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [v8 backingAceObject];

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
  uint64_t v5 = [v8 backingAceObject];

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
  uint64_t v5 = [WeakRetained parserSpeakableObjectProviderForConversationView:self];

  return v5;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  id v10 = [(SiriSharedUISmartDialogView *)self delegate];
  [v5 contentOffset];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(v10, "conversationViewContentScrolled:toContentOffset:", self, v7, v9);
}

- (CGSize)_sizeOfSnippet:(id)a3
{
  id v4 = a3;
  [(SiriSharedUISmartDialogView *)self _fittingSize];
  double v6 = v5;
  [(SiriSharedUISmartDialogView *)self snippetContentInsets];
  double v8 = v6 - v7;
  [(SiriSharedUISmartDialogView *)self snippetContentInsets];
  double v10 = v8 - v9;
  if (self->_isInAmbient && self->_allowAutomaticConversationSnippetViewScaling)
  {
    if (self->_isInAmbientInteractivity) {
      int v11 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    }
    else {
      int v11 = &SiriSharedUICompactAmbientContentScaleAmount;
    }
    double v10 = v10 / *(double *)v11;
  }
  -[SiriSharedUISmartDialogView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", v4, v10, 1.79769313e308);
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
  [(SiriSharedUISmartDialogView *)self snippetContentInsets];
  double v7 = v6;
  [(SiriSharedUISmartDialogView *)self snippetContentInsets];
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
        -[SiriSharedUISmartDialogView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", *(void *)(*((void *)&v24 + 1) + 8 * v18), v15, height, (void)v24);
        double v11 = fmax(v11, v19);
        double v10 = v10 + v17 + v20;
        [(SiriSharedUISmartDialogView *)self snippetContentInsets];
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
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(SiriSharedUISmartDialogView *)self _hasNoDialog];
  double v9 = (double *)&SiriSharedUISmartDialogPlatterCornerRadius;
  if (!v8) {
    double v9 = (double *)&SiriSharedUISmartDialogSnippetCornerRadius;
  }
  double v10 = *v9;
  [v7 _setContinuousCornerRadius:*v9];

  [v6 _setContinuousCornerRadius:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    snippetBackgroundView = self->_snippetBackgroundView;
    [(UIView *)snippetBackgroundView setContinuousCornerRadius:v10];
  }
}

- (void)_adjustHintCornerRadiusForSnippetView:(id)a3 vibrancyView:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([(NSArray *)self->_serverUtterances count]
    || [(NSArray *)self->_conversationSnippetViews count] > 1)
  {
    goto LABEL_6;
  }
  id v7 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel speech];
  if (v7)
  {

LABEL_6:
    uint64_t v9 = 12;
    goto LABEL_7;
  }
  BOOL v8 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtteranceViewModel latencySummary];

  if (v8) {
    goto LABEL_6;
  }
  uint64_t v9 = 15;
LABEL_7:
  [v12 _setContinuousCornerRadius:28.0];
  [v6 _setContinuousCornerRadius:28.0];
  double v10 = [v12 layer];
  [v10 setMaskedCorners:v9];

  double v11 = [v6 layer];
  [v11 setMaskedCorners:v9];
}

- (void)userUtteranceViewContentHeightDidUpdate:(id)a3
{
  [(SiriSharedUISmartDialogView *)self updateContentSizeWithAnimation:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained conversationViewDidUpdatePresentedContentHeight:self];
}

- (void)smartDialogSizeDidChangeWithSize:(CGSize)a3
{
}

- (void)userDidReportConcern
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  [WeakRetained userDidReportConcern];
}

- (void)setInteractionDelegate:(id)a3
{
  p_interactionDelegate = &self->_interactionDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_interactionDelegate, v5);
  [(SiriSharedUISmartDialogContainer *)self->_smartDialogContainer setInteractionDelegate:v5];
}

- (void)triggerSmartDialogAnimationWithDelay:(double)a3
{
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
  return self->_doNotUse;
}

- (void)setSpeechRecognitionHypothesis:(id)a3
{
}

- (SiriSharedUILatencyViewModel)latencyViewModel
{
  return self->_latencyViewModel;
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

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)revealRecognizedSpeech
{
  return self->_revealRecognizedSpeech;
}

- (void)setRevealRecognizedSpeech:(BOOL)a3
{
  self->_revealRecognizedSpeech = a3;
}

- (UIView)snippetBackgroundView
{
  return self->_snippetBackgroundView;
}

- (SiriSharedUISAEUserUtteranceViewModel)userUtteranceViewModel
{
  return self->_userUtteranceViewModel;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
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

- (UIView)snippetContainerView
{
  return self->_snippetContainerView;
}

- (void)setSnippetContainerView:(id)a3
{
}

- (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer)_smartDialogContainer
{
  return self->_smartDialogContainer;
}

- (void)_setSmartDialogContainer:(id)a3
{
}

- (UIView)_smartDialogView
{
  return self->_smartDialogView;
}

- (void)_setSmartDialogView:(id)a3
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

- (SRUIFLocalization)localization
{
  return self->_localization;
}

- (void)setLocalization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localization, 0);
  objc_storeStrong((id *)&self->_smartDialogView, 0);
  objc_storeStrong((id *)&self->_smartDialogContainer, 0);
  objc_storeStrong((id *)&self->_snippetContainerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_userUtteranceViewModel, 0);
  objc_storeStrong((id *)&self->_snippetBackgroundView, 0);
  objc_destroyWeak((id *)&self->dropletContainerDelegate);
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, 0);
  objc_storeStrong((id *)&self->customAttachmentConstraints, 0);
  objc_storeStrong((id *)&self->stackConstraints, 0);
  objc_destroyWeak((id *)&self->stackContainerDelegate);
  objc_storeStrong((id *)&self->_latencyViewModel, 0);
  objc_storeStrong((id *)&self->_doNotUse, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_conversationSnippetViews, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesisForSuggestion, 0);
  objc_storeStrong((id *)&self->_smartDialogPlugin, 0);
  objc_storeStrong((id *)&self->_smartDialogCard, 0);
  objc_storeStrong((id *)&self->_prepareForUpdatesPendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_hintSnippetView, 0);
  objc_storeStrong((id *)&self->_hintVibrancyView, 0);
  objc_storeStrong((id *)&self->_conversationSnippetVibrancyViews, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_userUtteranceView, 0);
  objc_storeStrong((id *)&self->_latencyView, 0);
}

- (void)canRelayoutSnippet
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  int v4 = "-[SiriSharedUISmartDialogView canRelayoutSnippet]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_20C9D5000, a2, OS_LOG_TYPE_ERROR, "%s #smartDialog: _snippetLayoutCount=%ld. Layout loop happens?", (uint8_t *)&v3, 0x16u);
}

@end