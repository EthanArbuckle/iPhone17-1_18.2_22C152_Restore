@interface SiriSharedUICompactView
- (BOOL)alwaysShowRecognizedSpeech;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)hidesTextRequestView;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (CGSize)conversationViewContentSize;
- (CGSize)resultViewContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)additionalContentSnippetViews;
- (NSArray)additionalContentViews;
- (NSArray)conversationSnippetViews;
- (NSArray)serverUtterances;
- (SiriSharedUICompactConversationViewHosting)conversationView;
- (SiriSharedUICompactResultViewHosting)resultView;
- (SiriSharedUICompactView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 resultView:(id)a6 conversationView:(id)a7 additionalContentViews:(id)a8 textRequestView:(id)a9 viewStackContainer:(id)a10;
- (SiriSharedUICompactView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 resultView:(id)a6 conversationView:(id)a7 textRequestView:(id)a8 viewStackContainer:(id)a9;
- (SiriSharedUICompactViewDelegate)delegate;
- (SiriSharedUIContentPlatterView)snippetView;
- (SiriSharedUIRectSet)_transitionalContentViewFrames;
- (SiriSharedUIViewStackContainerHosting)viewStackContainer;
- (UIEdgeInsets)contentInsetsForResultView:(id)a3;
- (double)bottomContentInset;
- (double)effectiveBottomContentInset;
- (double)expectedExpandedHeightForConversationView:(id)a3;
- (double)maximumHeightForConversationView:(id)a3;
- (double)maximumHeightForResultView:(id)a3;
- (id)_analytics;
- (id)_instrumentationManager;
- (id)parserSpeakableObjectProviderForConversationView:(id)a3;
- (int64_t)_animatedPresentationType;
- (int64_t)_conversationViewAttachmentType;
- (int64_t)_resultViewAttachmentType;
- (void)_addContentViewsToViewStackContainer;
- (void)_clearAppIconView;
- (void)_clearTransitionalContentViewFrameSnapshots;
- (void)_configureResultViewCustomConstraints;
- (void)_removeContentViewsFromViewStackContainer;
- (void)_setTransitionalContentViewFrames:(id)a3;
- (void)_snapshotContentViewFramesForTransition;
- (void)_textRequestViewVisibilityDidChange;
- (void)_updateBottomPadding;
- (void)_updateBottomPaddingAnimatedWithContext:(id)a3;
- (void)_updateBottomPaddingAnimatedWithContext:(id)a3 alongsideAnimations:(id)a4;
- (void)_updateExpansionConstraints:(BOOL)a3;
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
- (void)layoutSubviews;
- (void)prepareForUpdatesWithDiff:(unint64_t)a3 updateBlock:(id)a4;
- (void)resultViewContentDidLoad:(id)a3;
- (void)resultViewContentDidScroll:(id)a3;
- (void)resultViewContentScrolled:(id)a3 toContentOffset:(CGPoint)a4;
- (void)resultViewContentScrolling:(id)a3 didBegin:(BOOL)a4;
- (void)resultViewDarkenedContentWasTapped:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAdditionalContentSnippetViews:(id)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setBottomContentInset:(double)a3 animatedWithContext:(id)a4;
- (void)setConversationSnippetViews:(id)a3;
- (void)setConversationView:(id)a3;
- (void)setConversationViewHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHidesTextRequestView:(BOOL)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setResultView:(id)a3;
- (void)setResultViewAlpha:(double)a3;
- (void)setServerUtterances:(id)a3;
- (void)setShowSnippetView:(BOOL)a3 animated:(BOOL)a4;
- (void)setSnippetView:(id)a3 completion:(id)a4;
- (void)setSpeechRecognitionHypothesis:(id)a3;
- (void)showFullScreenEffect:(id)a3;
- (void)snippetLayoutDidUpdateForView:(id)a3;
- (void)tapToEditRequestedFromView:(id)a3;
@end

@implementation SiriSharedUICompactView

- (SiriSharedUICompactView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 resultView:(id)a6 conversationView:(id)a7 additionalContentViews:(id)a8 textRequestView:(id)a9 viewStackContainer:(id)a10
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v20 = a4;
  id v21 = a5;
  id v69 = a6;
  id v22 = a6;
  id obj = a7;
  id v23 = a7;
  id v68 = a8;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  v75.receiver = self;
  v75.super_class = (Class)SiriSharedUICompactView;
  v27 = -[SiriSharedUICompactView initWithFrame:](&v75, sel_initWithFrame_, x, y, width, height);
  if (v27)
  {
    v70 = v26;
    id v62 = v25;
    id v63 = v24;
    id v64 = v23;
    id v65 = v22;
    v28 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "-[SiriSharedUICompactView initWithFrame:backgroundBlurView:navigationView:resultView:conversationView:additi"
            "onalContentViews:textRequestView:viewStackContainer:]";
      _os_log_impl(&dword_20C9D5000, v28, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    v27->_hidesTextRequestView = 1;
    v27->_reducedOrbOpacitdouble y = 0;
    [(SiriSharedUICompactView *)v27 bounds];
    objc_msgSend(v20, "setFrame:");
    [v20 setAutoresizingMask:18];
    [(SiriSharedUICompactView *)v27 addSubview:v20];
    [(SiriSharedUICompactView *)v27 bounds];
    objc_msgSend(v21, "setFrame:");
    [v21 setAutoresizingMask:18];
    id v66 = v21;
    [(SiriSharedUICompactView *)v27 addSubview:v21];
    p_textRequestView = (id *)&v27->_textRequestView;
    objc_storeStrong((id *)&v27->_textRequestView, a9);
    [(UIView *)v27->_textRequestView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v27->_textRequestView)
    {
      -[SiriSharedUICompactView addSubview:](v27, "addSubview:");
      v30 = [(SiriSharedUICompactView *)v27 bottomAnchor];
      v31 = [*p_textRequestView bottomAnchor];
      uint64_t v32 = [v30 constraintEqualToAnchor:v31];
      textRequestViewBottomConstraint = v27->_textRequestViewBottomConstraint;
      v27->_textRequestViewBottomConstraint = (NSLayoutConstraint *)v32;

      v34 = (void *)MEMORY[0x263F08938];
      v35 = [*p_textRequestView leadingAnchor];
      v36 = [(SiriSharedUICompactView *)v27 leadingAnchor];
      v37 = [v35 constraintEqualToAnchor:v36];
      v77[0] = v37;
      v77[1] = v27->_textRequestViewBottomConstraint;
      v38 = [*p_textRequestView trailingAnchor];
      v39 = [(SiriSharedUICompactView *)v27 trailingAnchor];
      v40 = [v38 constraintEqualToAnchor:v39];
      v77[2] = v40;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:3];
      v42 = id v41 = v20;
      [v34 activateConstraints:v42];

      id v20 = v41;
    }
    objc_storeStrong((id *)&v27->_conversationView, obj);
    [(SiriSharedUICompactConversationViewHosting *)v27->_conversationView setDelegate:v27];
    [(SiriSharedUICompactConversationViewHosting *)v27->_conversationView setAttachmentType:[(SiriSharedUICompactView *)v27 _conversationViewAttachmentType]];
    v43 = [(SiriSharedUICompactConversationViewHosting *)v27->_conversationView hostingView];
    SiriSharedUISetContentHuggingPriority(v43, (const char *)1);

    v44 = [(SiriSharedUICompactConversationViewHosting *)v27->_conversationView hostingView];
    SiriSharedUISetContentCompressionResistancePriority(v44, (const char *)1);

    [(SiriSharedUICompactConversationViewHosting *)v27->_conversationView setUseLowerPriorityHeightConstraint:1];
    objc_storeStrong((id *)&v27->_additionalContentViews, v68);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v45 = v27->_additionalContentViews;
    uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v72 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          [v50 setDelegate:v27];
          objc_msgSend(v50, "setAttachmentType:", -[SiriSharedUICompactView _conversationViewAttachmentType](v27, "_conversationViewAttachmentType"));
          v51 = [v50 hostingView];
          SiriSharedUISetContentHuggingPriority(v51, (const char *)1);

          v52 = [v50 hostingView];
          SiriSharedUISetContentCompressionResistancePriority(v52, (const char *)1);

          [v50 setAttachmentYOffset:-8.0];
        }
        uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v71 objects:v76 count:16];
      }
      while (v47);
    }

    p_resultView = (id *)&v27->_resultView;
    objc_storeStrong((id *)&v27->_resultView, v69);
    v54 = [(SiriSharedUICompactResultViewHosting *)v27->_resultView hostingView];
    objc_msgSend(v54, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

    if (SiriSharedUIDeviceIsMac()) {
      [*p_resultView setAttachmentYOffset:8.0];
    }
    [*p_resultView setDelegate:v27];
    v55 = [*p_resultView hostingView];
    SiriSharedUISetContentHuggingPriority(v55, (const char *)1);

    v56 = [*p_resultView hostingView];
    SiriSharedUISetContentCompressionResistancePriority(v56, (const char *)1);

    objc_msgSend(*p_resultView, "setAttachmentType:", -[SiriSharedUICompactView _resultViewAttachmentType](v27, "_resultViewAttachmentType"));
    [(SiriSharedUICompactView *)v27 _configureResultViewCustomConstraints];
    id v21 = v66;
    id v24 = v63;
    id v23 = v64;
    id v25 = v62;
    id v26 = v70;
    if (v70)
    {
      v57 = v70;
      viewStackContainer = v27->_viewStackContainer;
      v27->_viewStackContainer = v57;
      id v26 = v70;
    }
    else
    {
      v59 = [SiriSharedUIViewStackContainer alloc];
      uint64_t v60 = -[SiriSharedUIViewStackContainer initWithFrame:contentViews:](v59, "initWithFrame:contentViews:", MEMORY[0x263EFFA68], x, y, width, height);
      viewStackContainer = v27->_viewStackContainer;
      v27->_viewStackContainer = (SiriSharedUIViewStackContainerHosting *)v60;
    }
    id v22 = v65;

    [(SiriSharedUICompactView *)v27 _addContentViewsToViewStackContainer];
    [(SiriSharedUICompactView *)v27 _updateBottomPadding];
    [(SiriSharedUICompactView *)v27 _textRequestViewVisibilityDidChange];
  }

  return v27;
}

- (SiriSharedUICompactView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 resultView:(id)a6 conversationView:(id)a7 textRequestView:(id)a8 viewStackContainer:(id)a9
{
  return -[SiriSharedUICompactView initWithFrame:backgroundBlurView:navigationView:resultView:conversationView:additionalContentViews:textRequestView:viewStackContainer:](self, "initWithFrame:backgroundBlurView:navigationView:resultView:conversationView:additionalContentViews:textRequestView:viewStackContainer:", a4, a5, a6, a7, MEMORY[0x263EFFA68], a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a9);
}

- (void)didMoveToWindow
{
  id v4 = [(SiriSharedUICompactView *)self delegate];
  v3 = [(SiriSharedUICompactView *)self window];
  [v4 compactView:self viewDidChangeWindow:v3];
}

- (void)layoutSubviews
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SiriSharedUICompactView layoutSubviews]";
    _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUICompactView;
  [(SiriSharedUICompactView *)&v7 layoutSubviews];
  id v4 = [(SiriSharedUICompactView *)self viewStackContainer];
  v5 = [v4 hostingView];
  [(SiriSharedUICompactView *)self bounds];
  objc_msgSend(v5, "setFrame:");

  fullScreenEffectContainerView = self->_fullScreenEffectContainerView;
  [(SiriSharedUICompactView *)self bounds];
  -[UIView setFrame:](fullScreenEffectContainerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v44 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v6 = self->_additionalContentViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    LOBYTE(v10) = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        int v10 = v10 & ([*(id *)(*((void *)&v38 + 1) + 8 * i) attachmentType] == 0);
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v8);
  }
  else
  {
    int v10 = 1;
  }

  if (SiriSharedUIDeviceIsMac()
    && ![(SiriSharedUICompactResultViewHosting *)self->_resultView attachmentType])
  {
    int v12 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView attachmentType]
        ? 0
        : v10;
    if (v12 == 1)
    {
      v13 = [(SiriSharedUICompactResultViewHosting *)self->_resultView hostingView];
      objc_msgSend(v13, "sizeThatFits:", width, height);
      double v15 = v14;

      v16 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView hostingView];
      objc_msgSend(v16, "sizeThatFits:", width, height);
      double v18 = v17;

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v19 = self->_additionalContentViews;
      uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v35;
        double v23 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            id v25 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "hostingView", (void)v34);
            objc_msgSend(v25, "sizeThatFits:", width, height);
            double v27 = v26;

            double v23 = v23 + v27 + 8.0;
          }
          uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v21);
      }
      else
      {
        double v23 = 0.0;
      }

      [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer topPadding];
      double v29 = v15 + v18 + 8.0 + v23 + v28;
      [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer bottomPadding];
      double v31 = v29 + v30;
      if (v31 < height) {
        double height = v31;
      }
    }
  }
  double v32 = width;
  double v33 = height;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (void)_addContentViewsToViewStackContainer
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  viewStackContainer = self->_viewStackContainer;
  id v4 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView hostingView];
  [(SiriSharedUIViewStackContainerHosting *)viewStackContainer addContentView:v4];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = self->_additionalContentViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = self->_viewStackContainer;
        v11 = [*(id *)(*((void *)&v27 + 1) + 8 * v9) hostingView];
        [(SiriSharedUIViewStackContainerHosting *)v10 addContentView:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  int v12 = self->_viewStackContainer;
  v13 = [(SiriSharedUICompactResultViewHosting *)self->_resultView hostingView];
  [(SiriSharedUIViewStackContainerHosting *)v12 addContentView:v13];

  double v14 = self->_viewStackContainer;
  double v15 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView hostingView];
  [(SiriSharedUIViewStackContainerHosting *)v14 bringSubviewToFront:v15];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_additionalContentViews;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = self->_viewStackContainer;
        uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "hostingView", (void)v23);
        [(SiriSharedUIViewStackContainerHosting *)v21 bringSubviewToFront:v22];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer relayout];
}

- (void)_removeContentViewsFromViewStackContainer
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  viewStackContainer = self->_viewStackContainer;
  id v4 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView hostingView];
  [(SiriSharedUIViewStackContainerHosting *)viewStackContainer removeContentView:v4];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = self->_additionalContentViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = self->_viewStackContainer;
        v11 = [*(id *)(*((void *)&v23 + 1) + 8 * v9) hostingView];
        [(SiriSharedUIViewStackContainerHosting *)v10 removeContentView:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  int v12 = self->_viewStackContainer;
  v13 = [(SiriSharedUICompactResultViewHosting *)self->_resultView hostingView];
  [(SiriSharedUIViewStackContainerHosting *)v12 removeContentView:v13];

  [(SiriSharedUICompactResultViewHosting *)self->_resultView relayout];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v14 = self->_additionalContentViews;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "relayout", (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }

  [(SiriSharedUICompactConversationViewHosting *)self->_conversationView relayout];
}

- (void)setIsInAmbient:(BOOL)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    if (a3)
    {
      id v4 = [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer scrollView];
      [v4 setDelegate:self];
    }
    [(SiriSharedUICompactView *)self _removeContentViewsFromViewStackContainer];
    [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer setIsInAmbient:self->_isInAmbient];
    if (self->_isInAmbient)
    {
      v5 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView stackConstraints];
      [v5 setHeightConstraint:0];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v6 = self->_additionalContentViews;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v46 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = [*(id *)(*((void *)&v45 + 1) + 8 * i) stackConstraints];
            [v11 setHeightConstraint:0];
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
        }
        while (v8);
      }

      int v12 = [(SiriSharedUICompactResultViewHosting *)self->_resultView stackConstraints];
      [v12 setHeightConstraint:0];

      [(SiriSharedUICompactResultViewHosting *)self->_resultView setCustomAttachmentConstraints:MEMORY[0x263EFFA68]];
      [(SiriSharedUICompactConversationViewHosting *)self->_conversationView setAttachmentType:3];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v13 = self->_additionalContentViews;
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v41 + 1) + 8 * j) setAttachmentType:3];
          }
          uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
        }
        while (v15);
      }

      resultView = self->_resultView;
      int64_t v19 = 3;
    }
    else
    {
      [(SiriSharedUICompactView *)self _clearAppIconView];
      [(SiriSharedUICompactView *)self _configureResultViewCustomConstraints];
      long long v20 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView stackConstraints];
      [v20 setHeightConstraint:0];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v21 = self->_additionalContentViews;
      uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v38;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = [*(id *)(*((void *)&v37 + 1) + 8 * k) stackConstraints];
            [v26 setHeightConstraint:0];
          }
          uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
        }
        while (v23);
      }

      [(SiriSharedUICompactConversationViewHosting *)self->_conversationView setAttachmentType:[(SiriSharedUICompactView *)self _conversationViewAttachmentType]];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v27 = self->_additionalContentViews;
      uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v33 objects:v49 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v34;
        do
        {
          for (uint64_t m = 0; m != v29; ++m)
          {
            if (*(void *)v34 != v30) {
              objc_enumerationMutation(v27);
            }
            objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * m), "setAttachmentType:", -[SiriSharedUICompactView _conversationViewAttachmentType](self, "_conversationViewAttachmentType", (void)v33));
          }
          uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v33 objects:v49 count:16];
        }
        while (v29);
      }

      double v32 = self->_resultView;
      int64_t v19 = [(SiriSharedUICompactView *)self _resultViewAttachmentType];
      resultView = v32;
    }
    -[SiriSharedUICompactResultViewHosting setAttachmentType:](resultView, "setAttachmentType:", v19, (void)v33);
    [(SiriSharedUICompactView *)self _addContentViewsToViewStackContainer];
    [(SiriSharedUICompactView *)self _updateBottomPadding];
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbient)
  {
    self->_isInAmbientInteractivitdouble y = a3;
    [(SiriSharedUICompactConversationViewHosting *)self->_conversationView relayout];
  }
}

- (void)configureAmbientAppIconForBundleIdentifier:(id)a3
{
  v22[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[SiriSharedUIUtilities applicationBundleIdentifierIsThirdParty:v4]&& self->_isInAmbient)
  {
    long long v21 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v4];
    long long v20 = [MEMORY[0x263F827E8] _iconForResourceProxy:v21 format:2];
    v5 = (UIView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v20];
    appIconView = self->_appIconView;
    self->_appIconView = v5;

    [(SiriSharedUICompactView *)self addSubview:self->_appIconView];
    [(UIView *)self->_appIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = [(UIView *)self->_appIconView layer];
    [v7 setOpacity:0.0];

    uint64_t v17 = (void *)MEMORY[0x263F08938];
    int64_t v19 = [(UIView *)self->_appIconView trailingAnchor];
    uint64_t v18 = [(SiriSharedUICompactView *)self trailingAnchor];
    uint64_t v8 = [v19 constraintEqualToAnchor:v18 constant:-49.0];
    v22[0] = v8;
    uint64_t v9 = [(UIView *)self->_appIconView bottomAnchor];
    int v10 = [(SiriSharedUICompactView *)self bottomAnchor];
    v11 = [v9 constraintEqualToAnchor:v10 constant:-49.0];
    v22[1] = v11;
    int v12 = [(UIView *)self->_appIconView heightAnchor];
    v13 = [v12 constraintEqualToConstant:40.0];
    v22[2] = v13;
    uint64_t v14 = [(UIView *)self->_appIconView widthAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:40.0];
    v22[3] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
    [v17 activateConstraints:v16];
  }
  else
  {
    [(SiriSharedUICompactView *)self _clearAppIconView];
  }
}

- (void)_clearAppIconView
{
  [(UIView *)self->_appIconView removeFromSuperview];
  appIconView = self->_appIconView;
  self->_appIconView = 0;
}

- (void)_configureResultViewCustomConstraints
{
  v19[1] = *MEMORY[0x263EF8340];
  v3 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView hostingView];
  uint64_t v4 = [(NSArray *)self->_additionalContentViews firstObject];
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v6 = [(NSArray *)self->_additionalContentViews firstObject];
    uint64_t v7 = [v6 snippetViews];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [(NSArray *)self->_additionalContentViews firstObject];
      uint64_t v10 = [v9 hostingView];

      v3 = (void *)v10;
    }
  }
  if (SiriSharedUIDeviceIsPad() || SiriSharedUIDeviceIsMac())
  {
    v11 = [(SiriSharedUICompactResultViewHosting *)self->_resultView hostingView];
    int v12 = [v11 bottomAnchor];
    v13 = [v3 topAnchor];
    uint64_t v14 = [v12 constraintEqualToAnchor:v13 constant:-8.0];
  }
  else
  {
    v11 = [(SiriSharedUICompactResultViewHosting *)self->_resultView hostingView];
    int v12 = [v11 bottomAnchor];
    v13 = [v3 topAnchor];
    uint64_t v14 = [v12 constraintLessThanOrEqualToAnchor:v13 constant:-8.0];
  }
  uint64_t v15 = (void *)v14;

  LODWORD(v16) = 1144750080;
  [v15 setPriority:v16];
  resultView = self->_resultView;
  v19[0] = v15;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  [(SiriSharedUICompactResultViewHosting *)resultView setCustomAttachmentConstraints:v18];
}

- (int64_t)_resultViewAttachmentType
{
  if (SiriSharedUIDeviceIsPad()) {
    return 2;
  }
  else {
    return 0;
  }
}

- (int64_t)_conversationViewAttachmentType
{
  return SiriSharedUIDeviceIsMac() ^ 1;
}

- (CGSize)resultViewContentSize
{
  [(SiriSharedUICompactResultViewHosting *)self->_resultView portraitContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setConversationView:(id)a3
{
}

- (SiriSharedUICompactConversationViewHosting)conversationView
{
  return self->_conversationView;
}

- (void)setResultView:(id)a3
{
}

- (SiriSharedUICompactResultViewHosting)resultView
{
  return self->_resultView;
}

- (CGSize)conversationViewContentSize
{
  [(SiriSharedUICompactConversationViewHosting *)self->_conversationView portraitContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setResultViewAlpha:(double)a3
{
  id v4 = [(SiriSharedUICompactResultViewHosting *)self->_resultView hostingView];
  [v4 setAlpha:a3];
}

- (SiriSharedUIContentPlatterView)snippetView
{
  return (SiriSharedUIContentPlatterView *)[(SiriSharedUICompactResultViewHosting *)self->_resultView snippetView];
}

- (void)setSnippetView:(id)a3 completion:(id)a4
{
}

- (void)setShowSnippetView:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setConversationViewHidden:(BOOL)a3
{
  v5 = objc_alloc_init(SiriSharedUIAnimationContext);
  [(SiriSharedUIAnimationContext *)v5 setAnimationDuration:0.3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SiriSharedUICompactView_setConversationViewHidden___block_invoke;
  v8[3] = &unk_2640E3758;
  v8[4] = self;
  BOOL v9 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SiriSharedUICompactView_setConversationViewHidden___block_invoke_2;
  v6[3] = &unk_2640E3780;
  v6[4] = self;
  BOOL v7 = a3;
  +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v8 context:v5 completion:v6];
}

void __53__SiriSharedUICompactView_setConversationViewHidden___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 408) hostingView];
  id v4 = v2;
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
}

void __53__SiriSharedUICompactView_setConversationViewHidden___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 408) hostingView];
  [v2 setUserInteractionEnabled:*(unsigned char *)(a1 + 40) == 0];
}

- (void)snippetLayoutDidUpdateForView:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SiriSharedUICompactResultViewHosting *)self->_resultView snippetView];
  uint64_t v6 = [v5 contentViews];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    [(SiriSharedUICompactResultViewHosting *)self->_resultView snippetContentDidUpdate];
    [v4 frame];
    if (v9 == 0.0 || v8 == 0.0) {
      [(SiriSharedUICompactView *)self resultViewContentDidLoad:self->_resultView];
    }
  }
  else
  {
    uint64_t v10 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView conversationSnippetViews];
    int v11 = [v10 containsObject:v4];

    if (v11)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isHint]) {
        [(SiriSharedUICompactConversationViewHosting *)self->_conversationView snippetContentDidUpdateForHint];
      }
      else {
        [(SiriSharedUICompactConversationViewHosting *)self->_conversationView snippetContentDidUpdate];
      }
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      int v12 = self->_additionalContentViews;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v18 = objc_msgSend(v17, "snippetViews", (void)v20);
            int v19 = [v18 containsObject:v4];

            if (v19) {
              [v17 snippetContentDidUpdate];
            }
          }
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
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

    [(SiriSharedUICompactConversationViewHosting *)self->_conversationView setServerUtterances:v6];
  }
}

- (void)setSpeechRecognitionHypothesis:(id)a3
{
}

- (void)setConversationSnippetViews:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_conversationSnippetViews, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v6 copy];
    conversationSnippetViews = self->_conversationSnippetViews;
    self->_conversationSnippetViews = v4;

    [(SiriSharedUICompactConversationViewHosting *)self->_conversationView setConversationSnippetViews:v6];
    [(SiriSharedUICompactView *)self setNeedsLayout];
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
      double v8 = (NSArray *)[v4 copy];
      additionalContentSnippetViews = self->_additionalContentSnippetViews;
      self->_additionalContentSnippetViews = v8;

      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __60__SiriSharedUICompactView_setAdditionalContentSnippetViews___block_invoke;
      v11[3] = &unk_2640E37A8;
      v11[4] = self;
      [v4 enumerateObjectsUsingBlock:v11];
      [(SiriSharedUICompactView *)self _removeContentViewsFromViewStackContainer];
      [(SiriSharedUICompactView *)self _configureResultViewCustomConstraints];
      [(SiriSharedUICompactView *)self _addContentViewsToViewStackContainer];
    }
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriSharedUICompactView setAdditionalContentSnippetViews:](v10);
    }
  }
}

void __60__SiriSharedUICompactView_setAdditionalContentSnippetViews___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  id v6 = [(SiriSharedUICompactView *)self _transitionalContentViewFrames];
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
  uint64_t v10 = [(SiriSharedUICompactView *)self viewStackContainer];
  int v11 = [v10 hostingView];

  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  double v13 = v12;
  double v15 = v14;
  double v16 = [(SiriSharedUICompactView *)self viewStackContainer];
  LOBYTE(v10) = objc_msgSend(v16, "hasContentAtPoint:", v13, v15);

  return (char)v10;
}

- (void)setBottomContentInset:(double)a3 animatedWithContext:(id)a4
{
  self->_bottomContentInset = a3;
  [(SiriSharedUICompactView *)self _updateBottomPaddingAnimatedWithContext:a4];
}

- (void)setBottomContentInset:(double)a3
{
  id v5 = objc_alloc_init(SiriSharedUIAnimationContext);
  [(SiriSharedUIAnimationContext *)v5 setAnimationDuration:0.0];
  [(SiriSharedUICompactView *)self setBottomContentInset:v5 animatedWithContext:a3];
}

- (BOOL)alwaysShowRecognizedSpeech
{
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
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
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v11++) prepareForUpdatesToSnippetViews:(a3 >> 5) & 1];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  conversationView = self->_conversationView;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__SiriSharedUICompactView_prepareForUpdatesWithDiff_updateBlock___block_invoke;
  v14[3] = &unk_2640E37D0;
  id v15 = v6;
  id v13 = v6;
  [(SiriSharedUICompactConversationViewHosting *)conversationView prepareForUpdatesToServerUtterance:(a3 >> 2) & 1 conversationSnippetViews:(a3 >> 1) & 1 speechRecognitionHypothesis:(a3 >> 3) & 1 latencyViewModel:0 updateBlock:v14];
}

uint64_t __65__SiriSharedUICompactView_prepareForUpdatesWithDiff_updateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contentDidUpdate:(BOOL)a3
{
  if (!a3)
  {
    [(SiriSharedUICompactConversationViewHosting *)self->_conversationView transitionToExpandablePlatterStyle:4];
    conversationView = self->_conversationView;
    [(SiriSharedUICompactConversationViewHosting *)conversationView animateAppearanceIfNeeded];
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
      uint64_t v5 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView hostingView];
      uint64_t v6 = [v5 heightAnchor];
      uint64_t v7 = [v6 constraintEqualToConstant:0.0];
      long long v8 = self->_conversationExpansionConstraint;
      self->_conversationExpansionConstraint = v7;

      conversationExpansionConstraint = self->_conversationExpansionConstraint;
    }
    long long v9 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView hostingView];
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
    [(SiriSharedUICompactView *)self bounds];
    uint64_t v7 = -[SiriSharedUIStandardView initWithFrame:](v6, "initWithFrame:");
    long long v8 = self->_fullScreenEffectContainerView;
    self->_fullScreenEffectContainerView = v7;

    [(SiriSharedUICompactView *)self insertSubview:self->_fullScreenEffectContainerView atIndex:0];
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
  id v4 = [(SiriSharedUICompactView *)self delegate];
  [v4 tapToEditRequestedFromView:self];
}

- (void)conversationViewContentScrolled:(id)a3 toContentOffset:(CGPoint)a4
{
  double y = a4.y;
  uint64_t v6 = [(SiriSharedUICompactView *)self _instrumentationManager];
  [v6 emitUserViewRegionInteractionEventWithViewRegion:1 userViewInteraction:3];

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  long long v8 = [v7 UUIDString];
  [v11 setValue:v8 forKey:@"identifier"];

  [v11 setValue:@"ConversationView" forKey:@"viewClass"];
  long long v9 = [NSNumber numberWithDouble:y];
  [v11 setValue:v9 forKey:@"contentOffset"];

  uint64_t v10 = [(SiriSharedUICompactView *)self _analytics];
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
    id v11 = "-[SiriSharedUICompactView conversationViewDidTransitionToCollapsedState:]";
    _os_log_impl(&dword_20C9D5000, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: conversationView now collapsed", (uint8_t *)&v10, 0xCu);
  }
  [(SiriSharedUICompactResultViewHosting *)self->_resultView setShowDimmingView:0 animated:1];
  [(SiriSharedUICompactView *)self _updateExpansionConstraints:0];
  uint64_t v5 = [(SiriSharedUICompactView *)self _instrumentationManager];
  [v5 emitUserViewRegionInteractionEventWithViewRegion:1 userViewInteraction:2];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  long long v8 = [v7 UUIDString];
  [v6 setValue:v8 forKey:@"identifier"];

  [v6 setValue:@"ConversationView" forKey:@"viewClass"];
  [v6 setValue:@"Collapsed" forKey:@"expansionState"];
  long long v9 = [(SiriSharedUICompactView *)self _analytics];
  [v9 logEventWithType:1455 context:v6];
}

- (void)conversationViewDidTransitionToExpandedState:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[SiriSharedUICompactView conversationViewDidTransitionToExpandedState:]";
    _os_log_impl(&dword_20C9D5000, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: conversationView now expanded", (uint8_t *)&v10, 0xCu);
  }
  [(SiriSharedUICompactResultViewHosting *)self->_resultView setShowDimmingView:1 animated:1];
  uint64_t v5 = [(SiriSharedUICompactView *)self _instrumentationManager];
  [v5 emitUserViewRegionInteractionEventWithViewRegion:1 userViewInteraction:1];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  long long v8 = [v7 UUIDString];
  [v6 setValue:v8 forKey:@"identifier"];

  [v6 setValue:@"ConversationView" forKey:@"viewClass"];
  [v6 setValue:@"Expanded" forKey:@"expansionState"];
  long long v9 = [(SiriSharedUICompactView *)self _analytics];
  [v9 logEventWithType:1455 context:v6];
}

- (void)conversationView:(id)a3 didUpdateHeightDuringExpansionTransition:(double)a4 didCompleteGesture:(BOOL)a5
{
  if (!a5)
  {
    [(SiriSharedUICompactView *)self expectedExpandedHeightForConversationView:a3];
    double v8 = a4 - (v7 - 100.0);
    if (v8 < 0.0) {
      double v8 = 0.0;
    }
    [(SiriSharedUICompactResultViewHosting *)self->_resultView setDarkenIntensity:0 animated:1.0 * (v8 / 100.0)];
  }
  conversationExpansionConstraint = self->_conversationExpansionConstraint;
  -[NSLayoutConstraint setConstant:](conversationExpansionConstraint, "setConstant:", a3, a4);
}

- (double)expectedExpandedHeightForConversationView:(id)a3
{
  id v4 = [(SiriSharedUICompactResultViewHosting *)self->_resultView hostingView];
  uint64_t v5 = [v4 superview];
  [v5 frame];
  double Height = CGRectGetHeight(v10);

  if (SiriSharedUIDeviceIsPad()) {
    return Height - 80.0;
  }
  double v8 = [(SiriSharedUICompactResultViewHosting *)self->_resultView hostingView];
  [v8 frame];
  double v7 = Height - CGRectGetMinY(v11) - 80.0;

  return v7;
}

- (void)conversationView:(id)a3 viewDidAppearForAceObject:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained compactView:self viewDidAppearForAceObject:v6];
}

- (void)conversationView:(id)a3 viewDidDisappearForAceObject:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained compactView:self viewDidDisappearForAceObject:v6];
}

- (void)conversationViewDidUpdatePresentedContentHeight:(id)a3
{
  [(SiriSharedUICompactResultViewHosting *)self->_resultView relayout];
  id v4 = [(SiriSharedUICompactView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained compactViewDidUpdatePresentedContentHeight:self];
  }
}

- (id)parserSpeakableObjectProviderForConversationView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained parserSpeakableObjectProviderForCompactView:self];

  return v5;
}

- (double)maximumHeightForConversationView:(id)a3
{
  id v4 = [(SiriSharedUICompactView *)self delegate];
  [v4 maximumHeightForCompactView:self];
  double v6 = v5;

  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer topPadding];
  double v8 = v7;
  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer bottomPadding];
  return v6 - (v8 + v9) + -8.0;
}

- (void)resultViewContentDidLoad:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = (os_log_t *)MEMORY[0x263F28348];
  double v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v27 = "-[SiriSharedUICompactView resultViewContentDidLoad:]";
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_20C9D5000, v6, OS_LOG_TYPE_DEFAULT, "%s #compact: resultViewContentDidLoad: %@", buf, 0x16u);
  }
  [(SiriSharedUICompactConversationViewHosting *)self->_conversationView animateAppearanceIfNeeded];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v7 = self->_additionalContentViews;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v11++), "animateAppearanceIfNeeded", (void)v21);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  appIconView = self->_appIconView;
  if (appIconView)
  {
    uint64_t v13 = [(UIView *)appIconView layer];
    [v13 opacity];
    float v15 = v14;

    if (v15 == 0.0)
    {
      [MEMORY[0x263F158F8] begin];
      long long v16 = [(UIView *)self->_appIconView layer];
      CGFloat v17 = +[SiriSharedUIAnimationUtilities animationForStyle:3 expectedWidthForStyle:&unk_26C1AE5A8 presentationType:[(SiriSharedUICompactView *)self _animatedPresentationType]];
      [v16 addAnimation:v17 forKey:@"conversationAppearance"];

      long long v18 = [(UIView *)self->_appIconView layer];
      LODWORD(v19) = 1.0;
      [v18 setOpacity:v19];

      [MEMORY[0x263F158F8] commit];
    }
  }
  long long v20 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v27 = "-[SiriSharedUICompactView resultViewContentDidLoad:]";
    _os_log_impl(&dword_20C9D5000, v20, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeIn of conversationView", buf, 0xCu);
  }
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
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

- (void)resultViewContentDidScroll:(id)a3
{
  if (([(SiriSharedUICompactConversationViewHosting *)self->_conversationView isCurrentlyTrackingGesture] & 1) == 0&& [(SiriSharedUICompactConversationViewHosting *)self->_conversationView willAutomaticallyCollapseWhenResultIsScrolled])
  {
    [(SiriSharedUICompactConversationViewHosting *)self->_conversationView transitionToExpandablePlatterStyle:2];
    [(SiriSharedUICompactView *)self _updateExpansionConstraints:0];
  }
}

- (void)resultViewDarkenedContentWasTapped:(id)a3
{
}

- (double)maximumHeightForResultView:(id)a3
{
  if (self->_isInAmbient) {
    return 1.79769313e308;
  }
  uint64_t v5 = [(SiriSharedUICompactView *)self delegate];
  [v5 maximumHeightForCompactView:self];
  double v7 = v6;

  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer topPadding];
  double v9 = v8;
  [(SiriSharedUIViewStackContainerHosting *)self->_viewStackContainer bottomPadding];
  return v7 - (v9 + v10);
}

- (UIEdgeInsets)contentInsetsForResultView:(id)a3
{
  uint64_t v4 = [(SiriSharedUICompactConversationViewHosting *)self->_conversationView hostingView];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v13 = [(SiriSharedUICompactResultViewHosting *)self->_resultView hostingView];
  [v13 frame];
  v25.origin.double x = v14;
  v25.origin.double y = v15;
  v25.size.double width = v16;
  v25.size.double height = v17;
  v23.origin.double x = v6;
  v23.origin.double y = v8;
  v23.size.double width = v10;
  v23.size.double height = v12;
  BOOL v18 = CGRectIntersectsRect(v23, v25);

  double v19 = 0.0;
  if (v18) {
    double v20 = 60.0 + 10.0;
  }
  else {
    double v20 = 0.0;
  }
  double v21 = 0.0;
  double v22 = 0.0;
  result.right = v22;
  result.bottouint64_t m = v20;
  result.left = v19;
  result.top = v21;
  return result;
}

- (void)resultViewContentScrolled:(id)a3 toContentOffset:(CGPoint)a4
{
  double y = a4.y;
  CGFloat v6 = [(SiriSharedUICompactView *)self _instrumentationManager];
  [v6 emitUserViewRegionInteractionEventWithViewRegion:2 userViewInteraction:3];

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v7 = [MEMORY[0x263F08C38] UUID];
  CGFloat v8 = [v7 UUIDString];
  [v11 setValue:v8 forKey:@"identifier"];

  [v11 setValue:@"ResultView" forKey:@"viewClass"];
  double v9 = [NSNumber numberWithDouble:y];
  [v11 setValue:v9 forKey:@"contentOffset"];

  CGFloat v10 = [(SiriSharedUICompactView *)self _analytics];
  [v10 logEventWithType:1456 context:v11];
}

- (void)resultViewContentScrolling:(id)a3 didBegin:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = WeakRetained;
  if (v4) {
    [WeakRetained scrollDidBeginFromView:self];
  }
  else {
    [WeakRetained scrollDidEndFromView:self];
  }
}

- (void)_textRequestViewVisibilityDidChange
{
  uint64_t v3 = objc_alloc_init(SiriSharedUIAnimationContext);
  [(SiriSharedUIAnimationContext *)v3 setAnimationOptions:0];
  [(SiriSharedUIAnimationContext *)v3 setAnimationDuration:0.25];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__SiriSharedUICompactView__textRequestViewVisibilityDidChange__block_invoke;
  v4[3] = &unk_2640E37F8;
  v4[4] = self;
  [(SiriSharedUICompactView *)self _updateBottomPaddingAnimatedWithContext:v3 alongsideAnimations:v4];
}

uint64_t __62__SiriSharedUICompactView__textRequestViewVisibilityDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) hidesTextRequestView];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 440) setHidden:v2];
  if (v2)
  {
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 440);
    return [v4 resignFirstResponder];
  }
  return result;
}

- (void)setHidesTextRequestView:(BOOL)a3
{
  if (self->_hidesTextRequestView != a3)
  {
    self->_hidesTextRequestView = a3;
    [(SiriSharedUICompactView *)self _textRequestViewVisibilityDidChange];
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
  BOOL v4 = [[SiriSharedUIRectSet alloc] initWithFramesForViews:v3 inCoordinateSpace:self];
  [(SiriSharedUICompactView *)self _setTransitionalContentViewFrames:v4];
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
    BOOL v8 = [(SiriSharedUICompactView *)self hidesTextRequestView];
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
  if ([(SiriSharedUICompactView *)self hidesTextRequestView])
  {
    id v11 = _Block_copy(v7);
    CGFloat v12 = 0;
  }
  else
  {
    [(UIView *)self->_textRequestView frame];
    double v10 = v10 + 16.0 + CGRectGetHeight(v19);
    [(SiriSharedUICompactView *)self _snapshotContentViewFramesForTransition];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__SiriSharedUICompactView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke;
    aBlock[3] = &unk_2640E3820;
    aBlock[4] = self;
    id v18 = v7;
    id v11 = _Block_copy(aBlock);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __87__SiriSharedUICompactView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke_2;
    v16[3] = &unk_2640E37F8;
    v16[4] = self;
    CGFloat v12 = _Block_copy(v16);
  }
  viewStackContainer = self->_viewStackContainer;
  [v6 animationDuration];
  -[SiriSharedUIViewStackContainerHosting setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:](viewStackContainer, "setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:", [v6 animationOptions], v11, v12, v10, v14);
  CGFloat v15 = [(SiriSharedUICompactView *)self delegate];
  [v15 compactView:self didChangeEffectiveBottomContentInsetAnimatedWithContext:v6];
}

uint64_t __87__SiriSharedUICompactView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke(uint64_t a1)
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

uint64_t __87__SiriSharedUICompactView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke_2(uint64_t a1)
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
  [(SiriSharedUICompactView *)self _updateBottomPaddingAnimatedWithContext:v3];
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

- (SiriSharedUICompactViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUICompactViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)serverUtterances
{
  return self->_serverUtterances;
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
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewStackContainer, 0);
  objc_storeStrong((id *)&self->_fullScreenEffectContainerView, 0);
  objc_storeStrong((id *)&self->_conversationExpansionConstraint, 0);
  objc_storeStrong((id *)&self->_textRequestViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textRequestView, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_resultView, 0);
  objc_storeStrong((id *)&self->_additionalContentViews, 0);
  objc_storeStrong((id *)&self->_conversationView, 0);
}

- (void)setAdditionalContentSnippetViews:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SiriSharedUICompactView setAdditionalContentSnippetViews:]";
  _os_log_error_impl(&dword_20C9D5000, log, OS_LOG_TYPE_ERROR, "%s #compact: attempting to set snippets incorrect number of platters; skipping and returning early.",
    (uint8_t *)&v1,
    0xCu);
}

@end