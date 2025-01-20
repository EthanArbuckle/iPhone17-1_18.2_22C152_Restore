@interface SiriSharedUISystemAssistantExperienceView
- (BOOL)alwaysShowRecognizedSpeech;
- (BOOL)deviceStateLocked;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)hidesTextRequestView;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (BOOL)isKeyboardShowing;
- (CGSize)conversationViewContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)additionalContentSnippetViews;
- (NSArray)additionalContentViews;
- (NSArray)conversationSnippetViews;
- (NSArray)serverUtterances;
- (SiriSharedUICompactConversationViewHosting)conversationView;
- (SiriSharedUIContentPlatterView)snippetView;
- (SiriSharedUILatencyViewModel)latencyViewModel;
- (SiriSharedUIRectSet)_transitionalContentViewFrames;
- (SiriSharedUISystemAssistantExperienceView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 smartDialogView:(id)a6 additionalContentViews:(id)a7 textRequestView:(id)a8 viewStackContainer:(id)a9;
- (SiriSharedUISystemAssistantExperienceView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 smartDialogView:(id)a6 textRequestView:(id)a7 viewStackContainer:(id)a8;
- (SiriSharedUISystemAssistantExperienceViewDelegate)delegate;
- (SiriSharedUIViewStackContainerHosting)viewStackContainer;
- (double)bottomContentInset;
- (double)effectiveBottomContentInset;
- (double)expectedExpandedHeightForConversationView:(id)a3;
- (double)maximumHeightForConversationView:(id)a3;
- (id)_analytics;
- (id)_instrumentationManager;
- (id)parserSpeakableObjectProviderForConversationView:(id)a3;
- (int64_t)_animatedPresentationType;
- (int64_t)_smartDialogViewAttachmentType;
- (void)_addContentViewsToViewStackContainer;
- (void)_clearAppIconView;
- (void)_clearTransitionalContentViewFrameSnapshots;
- (void)_handleSuggestionContentSizeUpdate;
- (void)_hideContinuerSuggestionsViewIfNeeded;
- (void)_hideStarterSuggestionsViewIfNeeded;
- (void)_removeContentViewsFromViewStackContainer;
- (void)_setTransitionalContentViewFrames:(id)a3;
- (void)_setUpSuggestionsView;
- (void)_snapshotContentViewFramesForTransition;
- (void)_textRequestViewVisibilityDidChange;
- (void)_updateBottomPadding;
- (void)_updateBottomPaddingAnimatedWithContext:(id)a3;
- (void)_updateBottomPaddingAnimatedWithContext:(id)a3 alongsideAnimations:(id)a4;
- (void)_updateExpansionConstraints:(BOOL)a3;
- (void)animateForDrillIn;
- (void)cancelStarterSuggestionsViewIfNeededForUserInput;
- (void)configureAmbientAppIconForBundleIdentifier:(id)a3;
- (void)contentDidUpdate:(BOOL)a3;
- (void)contentDidUpdateForAdditionalContentView:(BOOL)a3;
- (void)conversationView:(id)a3 didUpdateHeightDuringExpansionTransition:(double)a4 didCompleteGesture:(BOOL)a5;
- (void)conversationView:(id)a3 viewDidAppearForAceObject:(id)a4;
- (void)conversationView:(id)a3 viewDidDisappearForAceObject:(id)a4;
- (void)conversationViewContentScrolled:(id)a3 toContentOffset:(CGPoint)a4;
- (void)conversationViewDidBeginExpandTransition:(id)a3;
- (void)conversationViewDidResetExpandedState:(id)a3;
- (void)conversationViewDidTransitionToCollapsedState:(id)a3;
- (void)conversationViewDidTransitionToExpandedState:(id)a3;
- (void)conversationViewDidUpdatePresentedContentHeight:(id)a3;
- (void)didMoveToWindow;
- (void)enableSuggestionsView:(BOOL)a3;
- (void)filterSuggestionsWithText:(id)a3;
- (void)layoutSubviews;
- (void)prepareForUpdatesWithDiff:(unint64_t)a3 updateBlock:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAdditionalContentSnippetViews:(id)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setBottomContentInset:(double)a3 animatedWithContext:(id)a4;
- (void)setConversationSnippetViews:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceStateLocked:(BOOL)a3;
- (void)setHidesTextRequestView:(BOOL)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setIsKeyboardShowing:(BOOL)a3;
- (void)setLatencyViewModel:(id)a3;
- (void)setServerUtterances:(id)a3;
- (void)setSmartDialogView:(id)a3;
- (void)setSpeechRecognitionHypothesis:(id)a3;
- (void)setUpConversationContinuerSuggestionsView:(id)a3 currentMode:(id)a4;
- (void)setUpConversationStarterSuggestionsView;
- (void)setUpConversationStarterSuggestionsView:(BOOL)a3;
- (void)setUpConversationStarterSuggestionsView:(BOOL)a3 invocationSource:(int64_t)a4;
- (void)showFullScreenEffect:(id)a3;
- (void)showStarterSuggestionsViewForTwoShot;
- (void)snippetLayoutDidUpdateForView:(id)a3;
- (void)tapToEditRequestedFromView:(id)a3;
@end

@implementation SiriSharedUISystemAssistantExperienceView

- (SiriSharedUISystemAssistantExperienceView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 smartDialogView:(id)a6 additionalContentViews:(id)a7 textRequestView:(id)a8 viewStackContainer:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id obj = a7;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  v65.receiver = self;
  v65.super_class = (Class)SiriSharedUISystemAssistantExperienceView;
  v25 = -[SiriSharedUISystemAssistantExperienceView initWithFrame:](&v65, sel_initWithFrame_, x, y, width, height);
  if (v25)
  {
    v54 = v24;
    id v55 = v23;
    id v56 = v22;
    id v57 = v21;
    v26 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "-[SiriSharedUISystemAssistantExperienceView initWithFrame:backgroundBlurView:navigationView:smartDialogView:"
            "additionalContentViews:textRequestView:viewStackContainer:]";
      _os_log_impl(&dword_20C9D5000, v26, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    v25->_hidesTextRequestView = 1;
    v25->_reducedOrbOpacitdouble y = 0;
    [(SiriSharedUISystemAssistantExperienceView *)v25 bounds];
    objc_msgSend(v19, "setFrame:");
    [v19 setAutoresizingMask:18];
    id v59 = v19;
    [(SiriSharedUISystemAssistantExperienceView *)v25 addSubview:v19];
    [(SiriSharedUISystemAssistantExperienceView *)v25 bounds];
    objc_msgSend(v20, "setFrame:");
    [v20 setAutoresizingMask:18];
    id v58 = v20;
    [(SiriSharedUISystemAssistantExperienceView *)v25 addSubview:v20];
    p_textRequestView = (id *)&v25->_textRequestView;
    objc_storeStrong((id *)&v25->_textRequestView, a8);
    [(UIView *)v25->_textRequestView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v25->_textRequestView)
    {
      -[SiriSharedUISystemAssistantExperienceView addSubview:](v25, "addSubview:");
      v28 = [(SiriSharedUISystemAssistantExperienceView *)v25 bottomAnchor];
      v29 = [*p_textRequestView bottomAnchor];
      uint64_t v30 = [v28 constraintEqualToAnchor:v29];
      textRequestViewBottomConstraint = v25->_textRequestViewBottomConstraint;
      v25->_textRequestViewBottomConstraint = (NSLayoutConstraint *)v30;

      v32 = (void *)MEMORY[0x263F08938];
      v33 = [*p_textRequestView leadingAnchor];
      v34 = [(SiriSharedUISystemAssistantExperienceView *)v25 leadingAnchor];
      v35 = [v33 constraintEqualToAnchor:v34];
      v67[0] = v35;
      v67[1] = v25->_textRequestViewBottomConstraint;
      v36 = [*p_textRequestView trailingAnchor];
      v37 = [(SiriSharedUISystemAssistantExperienceView *)v25 trailingAnchor];
      v38 = [v36 constraintEqualToAnchor:v37];
      v67[2] = v38;
      v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];
      [v32 activateConstraints:v39];
    }
    objc_storeStrong((id *)&v25->_smartDialogView, a6);
    [(SiriSharedUICompactConversationViewHosting *)v25->_smartDialogView setDelegate:v25];
    [(SiriSharedUICompactConversationViewHosting *)v25->_smartDialogView setAttachmentType:[(SiriSharedUISystemAssistantExperienceView *)v25 _smartDialogViewAttachmentType]];
    v40 = [(SiriSharedUICompactConversationViewHosting *)v25->_smartDialogView hostingView];
    SiriSharedUISetContentHuggingPriority(v40, (const char *)1);

    v41 = [(SiriSharedUICompactConversationViewHosting *)v25->_smartDialogView hostingView];
    SiriSharedUISetContentCompressionResistancePriority(v41, (const char *)1);

    [(SiriSharedUICompactConversationViewHosting *)v25->_smartDialogView setUseLowerPriorityHeightConstraint:1];
    objc_storeStrong((id *)&v25->_additionalContentViews, obj);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v42 = v25->_additionalContentViews;
    uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v62 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          [v47 setDelegate:v25];
          objc_msgSend(v47, "setAttachmentType:", -[SiriSharedUISystemAssistantExperienceView _smartDialogViewAttachmentType](v25, "_smartDialogViewAttachmentType"));
          v48 = [v47 hostingView];
          SiriSharedUISetContentHuggingPriority(v48, (const char *)1);

          v49 = [v47 hostingView];
          SiriSharedUISetContentCompressionResistancePriority(v49, (const char *)1);

          [v47 setAttachmentYOffset:-8.0];
        }
        uint64_t v44 = [(NSArray *)v42 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v44);
    }

    id v24 = v54;
    if (v54)
    {
      v50 = v54;
    }
    else
    {
      v52 = [SiriSharedUIViewStackContainer alloc];
      v50 = -[SiriSharedUIViewStackContainer initWithFrame:contentViews:](v52, "initWithFrame:contentViews:", MEMORY[0x263EFFA68], x, y, width, height);
    }
    viewStackContainer = v25->_viewStackContainer;
    v25->_viewStackContainer = (SiriSharedUIViewStackContainerHosting *)v50;
    id v20 = v58;
    id v19 = v59;
    id v22 = v56;
    id v21 = v57;
    id v23 = v55;

    [(SiriSharedUISystemAssistantExperienceView *)v25 _addContentViewsToViewStackContainer];
    [(SiriSharedUISystemAssistantExperienceView *)v25 _updateBottomPadding];
    [(SiriSharedUISystemAssistantExperienceView *)v25 _textRequestViewVisibilityDidChange];
    [(SiriSharedUISystemAssistantExperienceView *)v25 _setUpSuggestionsView];
  }

  return v25;
}

- (SiriSharedUISystemAssistantExperienceView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 smartDialogView:(id)a6 textRequestView:(id)a7 viewStackContainer:(id)a8
{
  return -[SiriSharedUISystemAssistantExperienceView initWithFrame:backgroundBlurView:navigationView:smartDialogView:additionalContentViews:textRequestView:viewStackContainer:](self, "initWithFrame:backgroundBlurView:navigationView:smartDialogView:additionalContentViews:textRequestView:viewStackContainer:", a4, a5, a6, MEMORY[0x263EFFA68], a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToWindow
{
  id v4 = [(SiriSharedUISystemAssistantExperienceView *)self delegate];
  v3 = [(SiriSharedUISystemAssistantExperienceView *)self window];
  [v4 saeView:self viewDidChangeWindow:v3];
}

- (void)layoutSubviews
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SiriSharedUISystemAssistantExperienceView layoutSubviews]";
    _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUISystemAssistantExperienceView;
  [(SiriSharedUISystemAssistantExperienceView *)&v7 layoutSubviews];
  id v4 = [(SiriSharedUISystemAssistantExperienceView *)self viewStackContainer];
  v5 = [v4 hostingView];
  [(SiriSharedUISystemAssistantExperienceView *)self bounds];
  objc_msgSend(v5, "setFrame:");

  fullScreenEffectContainerView = self->_fullScreenEffectContainerView;
  [(SiriSharedUISystemAssistantExperienceView *)self bounds];
  -[UIView setFrame:](fullScreenEffectContainerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v43 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v6 = self->_additionalContentViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    LOBYTE(v10) = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        int v10 = v10 & ([*(id *)(*((void *)&v37 + 1) + 8 * i) attachmentType] == 0);
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v8);
  }
  else
  {
    int v10 = 1;
  }

  if (SiriSharedUIDeviceIsMac())
  {
    int v12 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView attachmentType]
        ? 0
        : v10;
    if (v12 == 1)
    {
      v13 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView hostingView];
      objc_msgSend(v13, "sizeThatFits:", width, height);
      double v15 = v14;

      [(SiriSharedUISuggestionsHostView *)self->_suggestionsView intrinsicContentSize];
      double v17 = v16;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v18 = self->_additionalContentViews;
      uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v34;
        double v22 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v18);
            }
            id v24 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "hostingView", (void)v33);
            objc_msgSend(v24, "sizeThatFits:", width, height);
            double v26 = v25;

            double v22 = v22 + v26 + 8.0;
          }
          uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v20);
      }
      else
      {
        double v22 = 0.0;
      }

      [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer topPadding];
      double v28 = v15 + v17 + 8.0 + v22 + v27;
      [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer bottomPadding];
      double v30 = v28 + v29;
      if (v30 < height) {
        double height = v30;
      }
    }
  }
  double v31 = width;
  double v32 = height;
  result.double height = v32;
  result.double width = v31;
  return result;
}

- (void)_addContentViewsToViewStackContainer
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  viewStackContainer = self->_viewStackContainer;
  id v4 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView hostingView];
  [(SiriSharedUIViewStackContainerHosting *)viewStackContainer addContentView:v4];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_additionalContentViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = self->_viewStackContainer;
        v11 = [*(id *)(*((void *)&v25 + 1) + 8 * v9) hostingView];
        [(SiriSharedUIViewStackContainerHosting *)v10 addContentView:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  int v12 = self->_viewStackContainer;
  v13 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView hostingView];
  [(SiriSharedUIViewStackContainerHosting *)v12 bringSubviewToFront:v13];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v14 = self->_additionalContentViews;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = self->_viewStackContainer;
        uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "hostingView", (void)v21);
        [(SiriSharedUIViewStackContainerHosting *)v19 bringSubviewToFront:v20];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer relayout];
}

- (void)_removeContentViewsFromViewStackContainer
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  viewStackContainer = self->_viewStackContainer;
  id v4 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView hostingView];
  [(SiriSharedUIViewStackContainerHosting *)viewStackContainer removeContentView:v4];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_additionalContentViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = self->_viewStackContainer;
        v11 = [*(id *)(*((void *)&v21 + 1) + 8 * v9) hostingView];
        [(SiriSharedUIViewStackContainerHosting *)v10 removeContentView:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v12 = self->_additionalContentViews;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "relayout", (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView relayout];
}

- (void)setIsInAmbient:(BOOL)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    if (a3)
    {
      id v4 = [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer scrollView];
      [v4 setDelegate:self];
    }
    [(SiriSharedUISystemAssistantExperienceView *)self _removeContentViewsFromViewStackContainer];
    [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer setIsInAmbient:self->_isInAmbient];
    if (self->_isInAmbient)
    {
      v5 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView stackConstraints];
      [v5 setHeightConstraint:0];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v6 = self->_additionalContentViews;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v41 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = [*(id *)(*((void *)&v40 + 1) + 8 * i) stackConstraints];
            [v11 setHeightConstraint:0];
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
        }
        while (v8);
      }

      [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView setAttachmentType:3];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      int v12 = self->_additionalContentViews;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
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
            [*(id *)(*((void *)&v36 + 1) + 8 * j) setAttachmentType:3];
          }
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
        }
        while (v14);
      }
    }
    else
    {
      [(SiriSharedUISystemAssistantExperienceView *)self _clearAppIconView];
      long long v17 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView stackConstraints];
      [v17 setHeightConstraint:0];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v18 = self->_additionalContentViews;
      uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v33;
        do
        {
          for (uint64_t k = 0; k != v20; ++k)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            long long v23 = [*(id *)(*((void *)&v32 + 1) + 8 * k) stackConstraints];
            [v23 setHeightConstraint:0];
          }
          uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
        }
        while (v20);
      }

      [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView setAttachmentType:[(SiriSharedUISystemAssistantExperienceView *)self _smartDialogViewAttachmentType]];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      int v12 = self->_additionalContentViews;
      uint64_t v24 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v44 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v29;
        do
        {
          for (uint64_t m = 0; m != v25; ++m)
          {
            if (*(void *)v29 != v26) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * m), "setAttachmentType:", -[SiriSharedUISystemAssistantExperienceView _smartDialogViewAttachmentType](self, "_smartDialogViewAttachmentType", (void)v28));
          }
          uint64_t v25 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v44 count:16];
        }
        while (v25);
      }
    }

    [(SiriSharedUISystemAssistantExperienceView *)self _addContentViewsToViewStackContainer];
    [(SiriSharedUISystemAssistantExperienceView *)self _updateBottomPadding];
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbient)
  {
    self->_isInAmbientInteractivitdouble y = a3;
    [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView relayout];
  }
}

- (void)configureAmbientAppIconForBundleIdentifier:(id)a3
{
  v22[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[SiriSharedUIUtilities applicationBundleIdentifierIsThirdParty:v4]&& self->_isInAmbient)
  {
    uint64_t v21 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v4];
    uint64_t v20 = [MEMORY[0x263F827E8] _iconForResourceProxy:v21 format:2];
    v5 = (UIView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v20];
    appIconView = self->_appIconView;
    self->_appIconView = v5;

    [(SiriSharedUISystemAssistantExperienceView *)self addSubview:self->_appIconView];
    [(UIView *)self->_appIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = [(UIView *)self->_appIconView layer];
    [v7 setOpacity:0.0];

    long long v17 = (void *)MEMORY[0x263F08938];
    uint64_t v19 = [(UIView *)self->_appIconView trailingAnchor];
    long long v18 = [(SiriSharedUISystemAssistantExperienceView *)self trailingAnchor];
    uint64_t v8 = [v19 constraintEqualToAnchor:v18 constant:-49.0];
    v22[0] = v8;
    uint64_t v9 = [(UIView *)self->_appIconView bottomAnchor];
    int v10 = [(SiriSharedUISystemAssistantExperienceView *)self bottomAnchor];
    v11 = [v9 constraintEqualToAnchor:v10 constant:-49.0];
    v22[1] = v11;
    int v12 = [(UIView *)self->_appIconView heightAnchor];
    uint64_t v13 = [v12 constraintEqualToConstant:40.0];
    v22[2] = v13;
    uint64_t v14 = [(UIView *)self->_appIconView widthAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:40.0];
    v22[3] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
    [v17 activateConstraints:v16];
  }
  else
  {
    [(SiriSharedUISystemAssistantExperienceView *)self _clearAppIconView];
  }
}

- (void)_clearAppIconView
{
  [(UIView *)self->_appIconView removeFromSuperview];
  appIconView = self->_appIconView;
  self->_appIconView = 0;
}

- (int64_t)_smartDialogViewAttachmentType
{
  return 0;
}

- (void)setSmartDialogView:(id)a3
{
}

- (SiriSharedUICompactConversationViewHosting)conversationView
{
  return self->_smartDialogView;
}

- (CGSize)conversationViewContentSize
{
  [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView portraitContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)snippetLayoutDidUpdateForView:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView conversationSnippetViews];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isHint]) {
      [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView snippetContentDidUpdateForHint];
    }
    else {
      [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView snippetContentDidUpdate];
    }
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = self->_additionalContentViews;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "snippetViews", (void)v15);
          int v14 = [v13 containsObject:v4];

          if (v14) {
            [v12 snippetContentDidUpdate];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)setServerUtterances:(id)a3
{
  if (self->_serverUtterances != a3)
  {
    id v6 = a3;
    id v4 = (NSArray *)[v6 copy];
    serverUtterances = self->_serverUtterances;
    self->_serverUtterances = v4;

    [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView setServerUtterances:v6];
  }
}

- (void)setSpeechRecognitionHypothesis:(id)a3
{
}

- (void)setLatencyViewModel:(id)a3
{
  id v6 = a3;
  if (!-[SiriSharedUILatencyViewModel isEqualToViewModel:](self->_latencyViewModel, "isEqualToViewModel:"))
  {
    id v4 = (SiriSharedUILatencyViewModel *)[v6 copy];
    latencyViewModel = self->_latencyViewModel;
    self->_latencyViewModel = v4;

    [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView setLatencyViewModel:v6];
  }
}

- (void)setConversationSnippetViews:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_conversationSnippetViews, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v6 copy];
    conversationSnippetViews = self->_conversationSnippetViews;
    self->_conversationSnippetViews = v4;

    [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView setConversationSnippetViews:v6];
    [(SiriSharedUISystemAssistantExperienceView *)self setNeedsLayout];
  }
}

- (void)setAdditionalContentSnippetViews:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  id v6 = +[SiriSharedUITranscriptItem additionalContentViewPlatterCategories];
  uint64_t v7 = [v6 count];

  if (v5 == v7)
  {
    if (![(NSArray *)self->_additionalContentSnippetViews isEqualToArray:v4])
    {
      uint64_t v8 = (NSArray *)[v4 copy];
      additionalContentSnippetViews = self->_additionalContentSnippetViews;
      self->_additionalContentSnippetViews = v8;

      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __78__SiriSharedUISystemAssistantExperienceView_setAdditionalContentSnippetViews___block_invoke;
      v11[3] = &unk_2640E37A8;
      v11[4] = self;
      [v4 enumerateObjectsUsingBlock:v11];
      [(SiriSharedUISystemAssistantExperienceView *)self _removeContentViewsFromViewStackContainer];
      [(SiriSharedUISystemAssistantExperienceView *)self _addContentViewsToViewStackContainer];
    }
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriSharedUISystemAssistantExperienceView setAdditionalContentSnippetViews:](v10);
    }
  }
}

void __78__SiriSharedUISystemAssistantExperienceView_setAdditionalContentSnippetViews___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 416);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  [v6 setSnippetViews:v5];
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(SiriSharedUISystemAssistantExperienceView *)self _transitionalContentViewFrames];
  char v7 = objc_msgSend(v6, "containsPoint:", x, y);

  if (v7) {
    return 1;
  }
  if (![(UIView *)self->_textRequestView isHidden])
  {
    [(UIView *)self->_textRequestView alpha];
    if (v9 > 0.0)
    {
      [(UIView *)self->_textRequestView frame];
      v17.double x = x;
      v17.double y = y;
      if (CGRectContainsPoint(v18, v17)) {
        return 1;
      }
    }
  }
  uint64_t v10 = [(SiriSharedUISystemAssistantExperienceView *)self viewStackContainer];
  v11 = [v10 hostingView];

  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  double v13 = v12;
  double v15 = v14;
  long long v16 = [(SiriSharedUISystemAssistantExperienceView *)self viewStackContainer];
  LOBYTE(v10) = objc_msgSend(v16, "hasContentAtPoint:", v13, v15);

  return (char)v10;
}

- (void)setBottomContentInset:(double)a3 animatedWithContext:(id)a4
{
  self->_bottomContentInset = a3;
  [(SiriSharedUISystemAssistantExperienceView *)self _updateBottomPaddingAnimatedWithContext:a4];
}

- (void)setBottomContentInset:(double)a3
{
  id v5 = objc_alloc_init(SiriSharedUIAnimationContext);
  [(SiriSharedUIAnimationContext *)v5 setAnimationDuration:0.0];
  [(SiriSharedUISystemAssistantExperienceView *)self setBottomContentInset:v5 animatedWithContext:a3];
}

- (BOOL)alwaysShowRecognizedSpeech
{
  double v2 = [MEMORY[0x263F285A0] sharedPreferences];
  char v3 = [v2 alwaysShowRecognizedSpeech];

  return v3;
}

- (void)prepareForUpdatesWithDiff:(unint64_t)a3 updateBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v7 = self->_additionalContentViews;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) prepareForUpdatesToSnippetViews:(a3 >> 5) & 1];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  smartDialogView = self->_smartDialogView;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__SiriSharedUISystemAssistantExperienceView_prepareForUpdatesWithDiff_updateBlock___block_invoke;
  v14[3] = &unk_2640E37D0;
  id v13 = v6;
  id v15 = v13;
  [(SiriSharedUICompactConversationViewHosting *)smartDialogView prepareForUpdatesToServerUtterance:(a3 >> 2) & 1 conversationSnippetViews:(a3 >> 1) & 1 speechRecognitionHypothesis:(a3 >> 3) & 1 latencyViewModel:(a3 >> 6) & 1 updateBlock:v14];
  if ((a3 & 0x26) != 0) {
    [(SiriSharedUISystemAssistantExperienceView *)self _hideStarterSuggestionsViewIfNeeded];
  }
}

uint64_t __83__SiriSharedUISystemAssistantExperienceView_prepareForUpdatesWithDiff_updateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contentDidUpdate:(BOOL)a3
{
  if (!a3)
  {
    [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView transitionToExpandablePlatterStyle:4];
    smartDialogView = self->_smartDialogView;
    [(SiriSharedUICompactConversationViewHosting *)smartDialogView animateAppearanceIfNeeded];
  }
}

- (void)contentDidUpdateForAdditionalContentView:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = self->_additionalContentViews;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "animateAppearanceIfNeeded", (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)_updateExpansionConstraints:(BOOL)a3
{
  conversationExpansionConstraint = self->_conversationExpansionConstraint;
  if (a3)
  {
    if (!conversationExpansionConstraint)
    {
      uint64_t v5 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView hostingView];
      uint64_t v6 = [v5 heightAnchor];
      uint64_t v7 = [v6 constraintEqualToConstant:0.0];
      long long v8 = self->_conversationExpansionConstraint;
      self->_conversationExpansionConstraint = v7;

      conversationExpansionConstraint = self->_conversationExpansionConstraint;
    }
    long long v9 = [(SiriSharedUICompactConversationViewHosting *)self->_smartDialogView hostingView];
    [v9 frame];
    [(NSLayoutConstraint *)conversationExpansionConstraint setConstant:CGRectGetHeight(v12)];

    long long v10 = self->_conversationExpansionConstraint;
    *(void *)&a3 = 1;
  }
  else
  {
    long long v10 = self->_conversationExpansionConstraint;
  }
  [(NSLayoutConstraint *)v10 setActive:a3];
}

- (void)showFullScreenEffect:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  fullScreenEffectContainerView = self->_fullScreenEffectContainerView;
  if (!fullScreenEffectContainerView)
  {
    uint64_t v6 = [SiriSharedUIStandardView alloc];
    [(SiriSharedUISystemAssistantExperienceView *)self bounds];
    uint64_t v7 = -[SiriSharedUIStandardView initWithFrame:](v6, "initWithFrame:");
    long long v8 = self->_fullScreenEffectContainerView;
    self->_fullScreenEffectContainerView = v7;

    [(SiriSharedUISystemAssistantExperienceView *)self insertSubview:self->_fullScreenEffectContainerView atIndex:0];
    fullScreenEffectContainerView = self->_fullScreenEffectContainerView;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v9 = [(UIView *)fullScreenEffectContainerView subviews];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v13++) removeFromSuperview];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  [v4 prepareSoundEffect];
  id v14 = objc_alloc((Class)[v4 effectViewClass]);
  [(UIView *)self->_fullScreenEffectContainerView bounds];
  id v15 = objc_msgSend(v14, "initWithFrame:");
  [(UIView *)self->_fullScreenEffectContainerView addSubview:v15];
  [v15 bounds];
  double MidX = CGRectGetMidX(v24);
  [v15 bounds];
  CGFloat v17 = CGRectGetMidY(v25) - 10.0 * 0.5;
  [v15 setFocusPoint:MidX];
  objc_msgSend(v15, "setMessageRect:", MidX - 10.0 * 0.5, v17, 10.0, 10.0);
  [v15 startAnimation];
  [v4 playSoundEffect];
}

- (void)tapToEditRequestedFromView:(id)a3
{
  id v4 = [(SiriSharedUISystemAssistantExperienceView *)self delegate];
  [v4 tapToEditRequestedFromView:self];
}

- (void)conversationViewContentScrolled:(id)a3 toContentOffset:(CGPoint)a4
{
  double y = a4.y;
  uint64_t v6 = [(SiriSharedUISystemAssistantExperienceView *)self _instrumentationManager];
  [v6 emitUserViewRegionInteractionEventWithViewRegion:1 userViewInteraction:3];

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  long long v8 = [v7 UUIDString];
  [v11 setValue:v8 forKey:@"identifier"];

  [v11 setValue:@"ConversationView" forKey:@"viewClass"];
  long long v9 = [NSNumber numberWithDouble:y];
  [v11 setValue:v9 forKey:@"contentOffset"];

  uint64_t v10 = [(SiriSharedUISystemAssistantExperienceView *)self _analytics];
  [v10 logEventWithType:1456 context:v11];
}

- (void)conversationViewDidBeginExpandTransition:(id)a3
{
}

- (void)conversationViewDidResetExpandedState:(id)a3
{
}

- (void)conversationViewDidTransitionToCollapsedState:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[SiriSharedUISystemAssistantExperienceView conversationViewDidTransitionToCollapsedState:]";
    _os_log_impl(&dword_20C9D5000, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: conversationView now collapsed", (uint8_t *)&v10, 0xCu);
  }
  [(SiriSharedUISystemAssistantExperienceView *)self _updateExpansionConstraints:0];
  uint64_t v5 = [(SiriSharedUISystemAssistantExperienceView *)self _instrumentationManager];
  [v5 emitUserViewRegionInteractionEventWithViewRegion:1 userViewInteraction:2];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  long long v8 = [v7 UUIDString];
  [v6 setValue:v8 forKey:@"identifier"];

  [v6 setValue:@"ConversationView" forKey:@"viewClass"];
  [v6 setValue:@"Collapsed" forKey:@"expansionState"];
  long long v9 = [(SiriSharedUISystemAssistantExperienceView *)self _analytics];
  [v9 logEventWithType:1455 context:v6];
}

- (void)conversationViewDidTransitionToExpandedState:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[SiriSharedUISystemAssistantExperienceView conversationViewDidTransitionToExpandedState:]";
    _os_log_impl(&dword_20C9D5000, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: conversationView now expanded", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v5 = [(SiriSharedUISystemAssistantExperienceView *)self _instrumentationManager];
  [v5 emitUserViewRegionInteractionEventWithViewRegion:1 userViewInteraction:1];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  long long v8 = [v7 UUIDString];
  [v6 setValue:v8 forKey:@"identifier"];

  [v6 setValue:@"ConversationView" forKey:@"viewClass"];
  [v6 setValue:@"Expanded" forKey:@"expansionState"];
  long long v9 = [(SiriSharedUISystemAssistantExperienceView *)self _analytics];
  [v9 logEventWithType:1455 context:v6];
}

- (void)conversationView:(id)a3 didUpdateHeightDuringExpansionTransition:(double)a4 didCompleteGesture:(BOOL)a5
{
}

- (double)expectedExpandedHeightForConversationView:(id)a3
{
  [(SiriSharedUISystemAssistantExperienceView *)self frame];
  return CGRectGetHeight(v4) - 80.0;
}

- (void)conversationView:(id)a3 viewDidAppearForAceObject:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained saeView:self viewDidAppearForAceObject:v6];
}

- (void)conversationView:(id)a3 viewDidDisappearForAceObject:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained saeView:self viewDidDisappearForAceObject:v6];
}

- (void)conversationViewDidUpdatePresentedContentHeight:(id)a3
{
  CGRect v4 = [(SiriSharedUISystemAssistantExperienceView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained saeViewDidUpdatePresentedContentHeight:self];
  }
}

- (id)parserSpeakableObjectProviderForConversationView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained parserSpeakableObjectProviderForSAEView:self];

  return v5;
}

- (double)maximumHeightForConversationView:(id)a3
{
  CGRect v4 = [(SiriSharedUISystemAssistantExperienceView *)self delegate];
  [v4 maximumHeightForSAEView:self];
  double v6 = v5;

  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer topPadding];
  double v8 = v7;
  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer bottomPadding];
  return v6 - (v8 + v9) + -8.0;
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
}

- (void)animateForDrillIn
{
}

- (void)_setUpSuggestionsView
{
  if (!self->_suggestionsViewProvider)
  {
    uint64_t v3 = objc_alloc_init(_TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider);
    suggestionsViewProvider = self->_suggestionsViewProvider;
    self->_suggestionsViewProvider = v3;
  }
  objc_initWeak(&location, self);
  double v5 = self->_suggestionsViewProvider;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __66__SiriSharedUISystemAssistantExperienceView__setUpSuggestionsView__block_invoke;
  id v15 = &unk_2640E3A28;
  objc_copyWeak(&v16, &location);
  double v6 = [(SiriSharedUISuggestionsViewProvider *)v5 makeSuggestionsViewWithSuggestionsResizeHandler:&v12];
  suggestionsViewController = self->_suggestionsViewController;
  self->_suggestionsViewController = v6;

  double v8 = [SiriSharedUISuggestionsHostView alloc];
  double v9 = [(UIViewController *)self->_suggestionsViewController view];
  int v10 = [(SiriSharedUISuggestionsHostView *)v8 initWithSuggestionsView:v9];
  suggestionsView = self->_suggestionsView;
  self->_suggestionsView = v10;

  [(SiriSharedUISuggestionsHostView *)self->_suggestionsView setAttachmentType:1];
  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer addContentView:self->_suggestionsView fromViewController:self->_suggestionsViewController];
  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer relayout];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __66__SiriSharedUISystemAssistantExperienceView__setUpSuggestionsView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleSuggestionContentSizeUpdate];
    id WeakRetained = v2;
  }
}

- (void)_handleSuggestionContentSizeUpdate
{
}

- (void)setUpConversationStarterSuggestionsView
{
}

- (void)setUpConversationStarterSuggestionsView:(BOOL)a3
{
}

- (void)setUpConversationStarterSuggestionsView:(BOOL)a3 invocationSource:(int64_t)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  if (self->_suggestionsViewProvider)
  {
    if (!self->_conversationStarterSuggestionsViewCreated && !self->_shouldCancelConversationStarters)
    {
      BOOL v6 = a3;
      objc_initWeak(location, self);
      suggestionsViewProvider = self->_suggestionsViewProvider;
      BOOL deviceStateLocked = self->_deviceStateLocked;
      BOOL isKeyboardShowing = self->_isKeyboardShowing;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __102__SiriSharedUISystemAssistantExperienceView_setUpConversationStarterSuggestionsView_invocationSource___block_invoke;
      v11[3] = &unk_2640E3A50;
      objc_copyWeak(&v12, location);
      [(SiriSharedUISuggestionsViewProvider *)suggestionsViewProvider makeConversationStarterSuggestionsViewWithDeviceLocked:deviceStateLocked keyboardShowing:isKeyboardShowing isVoiceTrigger:v6 invocationSource:a4 suggestionTapHandler:v11];
      self->_conversationStarterSuggestionsViewCreated = 1;
      self->_shouldCancelConversationStarters = 0;
      objc_destroyWeak(&v12);
      objc_destroyWeak(location);
    }
  }
  else
  {
    int v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[SiriSharedUISystemAssistantExperienceView setUpConversationStarterSuggestionsVie"
                                      "w:invocationSource:]";
      _os_log_impl(&dword_20C9D5000, v10, OS_LOG_TYPE_DEFAULT, "%s #suggestions: suggestions provider is nil, can not set up starter suggestions", (uint8_t *)location, 0xCu);
    }
  }
}

void __102__SiriSharedUISystemAssistantExperienceView_setUpConversationStarterSuggestionsView_invocationSource___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  CGRect v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 64);
    [v5 siriRequestCommittedFromSuggestion:v6];
  }
}

- (void)setUpConversationContinuerSuggestionsView:(id)a3 currentMode:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_suggestionsViewProvider)
  {
    if (!self->_conversationContinuerSuggestionsViewCreated && !self->_shouldCancelConversationContinuers)
    {
      objc_initWeak(location, self);
      suggestionsViewProvider = self->_suggestionsViewProvider;
      BOOL deviceStateLocked = self->_deviceStateLocked;
      BOOL isKeyboardShowing = self->_isKeyboardShowing;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __99__SiriSharedUISystemAssistantExperienceView_setUpConversationContinuerSuggestionsView_currentMode___block_invoke;
      v12[3] = &unk_2640E3A50;
      objc_copyWeak(&v13, location);
      [(SiriSharedUISuggestionsViewProvider *)suggestionsViewProvider makeConversationContinuerSuggestionsViewWithRequestId:v6 currentMode:v7 deviceLocked:deviceStateLocked keyboardShowing:isKeyboardShowing suggestionTapHandler:v12];
      self->_conversationContinuerSuggestionsViewCreated = 1;
      self->_shouldCancelConversationContinuers = 0;
      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
  }
  else
  {
    id v11 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[SiriSharedUISystemAssistantExperienceView setUpConversationContinuerSuggestionsV"
                                      "iew:currentMode:]";
      _os_log_impl(&dword_20C9D5000, v11, OS_LOG_TYPE_DEFAULT, "%s #suggestions: suggestions provider is nil, can not set up continuer suggestions", (uint8_t *)location, 0xCu);
    }
  }
}

void __99__SiriSharedUISystemAssistantExperienceView_setUpConversationContinuerSuggestionsView_currentMode___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  CGRect v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 64);
    [v5 siriRequestCommittedFromSuggestion:v6];
  }
}

- (void)cancelStarterSuggestionsViewIfNeededForUserInput
{
  self->_shouldCancelConversationStarters = 1;
  [(SiriSharedUISuggestionsViewProvider *)self->_suggestionsViewProvider hideConversationStarterSuggestionsIfNecessary];
}

- (void)showStarterSuggestionsViewForTwoShot
{
}

- (void)_hideStarterSuggestionsViewIfNeeded
{
  self->_shouldCancelConversationStarters = 1;
  self->_conversationStarterSuggestionsViewCreated = 0;
  [(SiriSharedUISuggestionsViewProvider *)self->_suggestionsViewProvider setShowSuggestions:0];
}

- (void)_hideContinuerSuggestionsViewIfNeeded
{
}

- (void)enableSuggestionsView:(BOOL)a3
{
}

- (void)filterSuggestionsWithText:(id)a3
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  uint64_t v6 = (uint64_t)a3;
  uint64_t v7 = v6;
  if (self->_isInAmbient && !a4 && self->_reducedOrbOpacity)
  {
    uint64_t v9 = v6;
    uint64_t v6 = SiriSharedUIIsTextInputEnabled();
    uint64_t v7 = v9;
    if ((v6 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained scrollDidEndFromView:self];

      uint64_t v7 = v9;
      self->_reducedOrbOpacitdouble y = 0;
    }
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_isInAmbient && self->_reducedOrbOpacity)
  {
    uint64_t v7 = v4;
    uint64_t v4 = SiriSharedUIIsTextInputEnabled();
    uint64_t v5 = v7;
    if ((v4 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained scrollDidEndFromView:self];

      uint64_t v5 = v7;
      self->_reducedOrbOpacitdouble y = 0;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_isInAmbient && !self->_reducedOrbOpacity)
  {
    uint64_t v7 = v4;
    uint64_t v4 = SiriSharedUIIsTextInputEnabled();
    uint64_t v5 = v7;
    if ((v4 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained scrollDidBeginFromView:self];

      uint64_t v5 = v7;
      self->_reducedOrbOpacitdouble y = 1;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_textRequestViewVisibilityDidChange
{
  uint64_t v3 = objc_alloc_init(SiriSharedUIAnimationContext);
  [(SiriSharedUIAnimationContext *)v3 setAnimationOptions:0];
  [(SiriSharedUIAnimationContext *)v3 setAnimationDuration:0.25];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__SiriSharedUISystemAssistantExperienceView__textRequestViewVisibilityDidChange__block_invoke;
  v4[3] = &unk_2640E37F8;
  v4[4] = self;
  [(SiriSharedUISystemAssistantExperienceView *)self _updateBottomPaddingAnimatedWithContext:v3 alongsideAnimations:v4];
}

uint64_t __80__SiriSharedUISystemAssistantExperienceView__textRequestViewVisibilityDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) hidesTextRequestView];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 456) setHidden:v2];
  if (v2)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 456);
    return [v4 resignFirstResponder];
  }
  return result;
}

- (void)setHidesTextRequestView:(BOOL)a3
{
  if (self->_hidesTextRequestView != a3)
  {
    self->_hidesTextRequestView = a3;
    [(SiriSharedUISystemAssistantExperienceView *)self _textRequestViewVisibilityDidChange];
  }
}

- (void)_snapshotContentViewFramesForTransition
{
  v5[1] = *MEMORY[0x263EF8340];
  if (self->_textRequestView)
  {
    v5[0] = self->_textRequestView;
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263EFFA68];
  }
  uint64_t v4 = [[SiriSharedUIRectSet alloc] initWithFramesForViews:v3 inCoordinateSpace:self];
  [(SiriSharedUISystemAssistantExperienceView *)self _setTransitionalContentViewFrames:v4];
}

- (void)_clearTransitionalContentViewFrameSnapshots
{
}

- (void)_updateBottomPaddingAnimatedWithContext:(id)a3 alongsideAnimations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isInAmbient)
  {
    BOOL v8 = [(SiriSharedUISystemAssistantExperienceView *)self hidesTextRequestView];
    double v9 = 14.0;
    if (v8) {
      double v9 = 0.0;
    }
  }
  else
  {
    double v9 = 14.0;
  }
  double v10 = v9 + self->_bottomContentInset;
  [(NSLayoutConstraint *)self->_textRequestViewBottomConstraint setConstant:v10];
  if ([(SiriSharedUISystemAssistantExperienceView *)self hidesTextRequestView])
  {
    id v11 = _Block_copy(v7);
    id v12 = 0;
  }
  else
  {
    [(UIView *)self->_textRequestView frame];
    double v10 = v10 + 16.0 + CGRectGetHeight(v19);
    [(SiriSharedUISystemAssistantExperienceView *)self _snapshotContentViewFramesForTransition];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __105__SiriSharedUISystemAssistantExperienceView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke;
    aBlock[3] = &unk_2640E3820;
    aBlock[4] = self;
    id v18 = v7;
    id v11 = _Block_copy(aBlock);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __105__SiriSharedUISystemAssistantExperienceView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke_2;
    v16[3] = &unk_2640E37F8;
    v16[4] = self;
    id v12 = _Block_copy(v16);
  }
  viewStackContainer = self->_viewStackContainer;
  [v6 animationDuration];
  -[SiriSharedUIViewStackContainerHosting setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:](viewStackContainer, "setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:", [v6 animationOptions], v11, v12, v10, v14);
  id v15 = [(SiriSharedUISystemAssistantExperienceView *)self delegate];
  [v15 saeView:self didChangeEffectiveBottomContentInsetAnimatedWithContext:v6];
}

uint64_t __105__SiriSharedUISystemAssistantExperienceView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __105__SiriSharedUISystemAssistantExperienceView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearTransitionalContentViewFrameSnapshots];
}

- (void)_updateBottomPaddingAnimatedWithContext:(id)a3
{
}

- (void)_updateBottomPadding
{
  uint64_t v3 = objc_alloc_init(SiriSharedUIAnimationContext);
  [(SiriSharedUIAnimationContext *)v3 setAnimationDuration:0.0];
  [(SiriSharedUISystemAssistantExperienceView *)self _updateBottomPaddingAnimatedWithContext:v3];
}

- (double)effectiveBottomContentInset
{
  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer bottomPadding];
  return result;
}

- (id)_instrumentationManager
{
  return (id)[MEMORY[0x263F754A8] sharedManager];
}

- (id)_analytics
{
  return (id)[MEMORY[0x263F283F8] sharedAnalytics];
}

- (SiriSharedUIViewStackContainerHosting)viewStackContainer
{
  return self->_viewStackContainer;
}

- (SiriSharedUISystemAssistantExperienceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUISystemAssistantExperienceViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SiriSharedUIContentPlatterView)snippetView
{
  return self->_snippetView;
}

- (NSArray)serverUtterances
{
  return self->_serverUtterances;
}

- (SiriSharedUILatencyViewModel)latencyViewModel
{
  return self->_latencyViewModel;
}

- (NSArray)conversationSnippetViews
{
  return self->_conversationSnippetViews;
}

- (NSArray)additionalContentSnippetViews
{
  return self->_additionalContentSnippetViews;
}

- (NSArray)additionalContentViews
{
  return self->_additionalContentViews;
}

- (BOOL)hidesTextRequestView
{
  return self->_hidesTextRequestView;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (BOOL)deviceStateLocked
{
  return self->_deviceStateLocked;
}

- (void)setDeviceStateLocked:(BOOL)a3
{
  self->_BOOL deviceStateLocked = a3;
}

- (BOOL)isKeyboardShowing
{
  return self->_isKeyboardShowing;
}

- (void)setIsKeyboardShowing:(BOOL)a3
{
  self->_BOOL isKeyboardShowing = a3;
}

- (SiriSharedUIRectSet)_transitionalContentViewFrames
{
  return self->_transitionalContentViewFrames;
}

- (void)_setTransitionalContentViewFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionalContentViewFrames, 0);
  objc_storeStrong((id *)&self->_additionalContentSnippetViews, 0);
  objc_storeStrong((id *)&self->_conversationSnippetViews, 0);
  objc_storeStrong((id *)&self->_latencyViewModel, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_snippetView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewStackContainer, 0);
  objc_storeStrong((id *)&self->_fullScreenEffectContainerView, 0);
  objc_storeStrong((id *)&self->_conversationExpansionConstraint, 0);
  objc_storeStrong((id *)&self->_textRequestViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textRequestView, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_suggestionsViewProvider, 0);
  objc_storeStrong((id *)&self->_additionalContentViews, 0);
  objc_storeStrong((id *)&self->_smartDialogView, 0);
}

- (void)setAdditionalContentSnippetViews:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SiriSharedUISystemAssistantExperienceView setAdditionalContentSnippetViews:]";
  _os_log_error_impl(&dword_20C9D5000, log, OS_LOG_TYPE_ERROR, "%s #compact: attempting to set snippets incorrect number of platters; skipping and returning early.",
    (uint8_t *)&v1,
    0xCu);
}

@end