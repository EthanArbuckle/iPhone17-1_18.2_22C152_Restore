@interface SLHighlightDisambiguationPillView
- (BOOL)isRTL;
- (BOOL)remoteContentIsLoaded;
- (NSLayoutConstraint)transcriptButtonConstraint;
- (OS_dispatch_queue)remoteRenderingQueue;
- (SLAttribution)attribution;
- (SLDHighlightDisambiguationPillEmptySlotContent)placeholderSlotContent;
- (SLDServiceProxy)pillProxy;
- (SLHighlightDisambiguationPillView)initWithAttribution:(id)a3;
- (UIButton)transcriptButton;
- (UIPointerInteraction)pointerInteraction;
- (UISSlotStyle)lastRenderedSlotStyle;
- (UIVisualEffectView)blurView;
- (UIVisualEffectView)buttonEffectView;
- (_UISlotView)pillSlotView;
- (double)pillMaxWidth;
- (id)_contentProviderForCurrentConfiguration;
- (id)_layoutConstraintsForIndividualContact;
- (id)_loadButtonWithImageName:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)pillVariant;
- (void)_loadBlurView;
- (void)_loadDisambiguationPillSlotView;
- (void)_loadTranscriptButton;
- (void)_macroPillTapped;
- (void)_presentTranscript;
- (void)_transcriptButtonTapped:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)serviceProxyDidConnect:(id)a3;
- (void)serviceProxyDidDisconnect:(id)a3;
- (void)setAttribution:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setButtonEffectView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLastRenderedSlotStyle:(id)a3;
- (void)setPillMaxWidth:(double)a3;
- (void)setPillProxy:(id)a3;
- (void)setPillSlotView:(id)a3;
- (void)setPillVariant:(unint64_t)a3;
- (void)setPlaceholderSlotContent:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setRTL:(BOOL)a3;
- (void)setRemoteContentIsLoaded:(BOOL)a3;
- (void)setTranscriptButton:(id)a3;
- (void)setTranscriptButtonConstraint:(id)a3;
@end

@implementation SLHighlightDisambiguationPillView

- (SLHighlightDisambiguationPillView)initWithAttribution:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SLHighlightDisambiguationPillView;
  v6 = [(SLHighlightDisambiguationPillView *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attribution, a3);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v7 action:sel__macroPillTapped];
    [(SLHighlightDisambiguationPillView *)v7 addGestureRecognizer:v8];

    [(SLHighlightDisambiguationPillView *)v7 _loadDisambiguationPillSlotView];
    [(SLHighlightDisambiguationPillView *)v7 _loadTranscriptButton];
    v9 = [(UIButton *)v7->_transcriptButton trailingAnchor];
    v10 = [(SLHighlightDisambiguationPillView *)v7 trailingAnchor];
    uint64_t v11 = [v9 constraintEqualToAnchor:v10 constant:-15.0];
    transcriptButtonConstraint = v7->_transcriptButtonConstraint;
    v7->_transcriptButtonConstraint = (NSLayoutConstraint *)v11;

    v13 = (void *)MEMORY[0x1E4F28DC8];
    v14 = [(SLHighlightDisambiguationPillView *)v7 _layoutConstraintsForIndividualContact];
    [v13 activateConstraints:v14];

    [(SLHighlightDisambiguationPillView *)v7 _loadBlurView];
    v15 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    if (v16 == 1)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v7];
      [(SLHighlightDisambiguationPillView *)v7 setPointerInteraction:v17];

      v18 = [(SLHighlightDisambiguationPillView *)v7 pointerInteraction];
      [(SLHighlightDisambiguationPillView *)v7 addInteraction:v18];
    }
  }

  return v7;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SLHighlightDisambiguationPillView *)self frame];
  double v9 = v8;
  v21.receiver = self;
  v21.super_class = (Class)SLHighlightDisambiguationPillView;
  -[SLHighlightDisambiguationPillView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  if (width != v9)
  {
    [(SLHighlightDisambiguationPillView *)self frame];
    [(SLHighlightDisambiguationPillView *)self setPillMaxWidth:v10 + -34.0];
    if (self->_pillProxy)
    {
      [(_UISlotView *)self->_pillSlotView _updateContent];
    }
    else
    {
      uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);

      v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SocialLayer.SLHighlightDisambiguationPillView.RemoteRendering", v12);
      remoteRenderingQueue = self->_remoteRenderingQueue;
      self->_remoteRenderingQueue = v13;

      v15 = +[SLDServiceProxy proxyForServiceClass:objc_opt_class() targetSerialQueue:self->_remoteRenderingQueue delegate:self];
      pillProxdouble y = self->_pillProxy;
      self->_pillProxdouble y = v15;

      objc_initWeak(&location, self);
      v17 = self->_remoteRenderingQueue;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __46__SLHighlightDisambiguationPillView_setFrame___block_invoke;
      v18[3] = &unk_1E58A85E0;
      objc_copyWeak(&v19, &location);
      dispatch_async(v17, v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

void __46__SLHighlightDisambiguationPillView_setFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained pillProxy];
  [v1 connect];
}

- (id)_layoutConstraintsForIndividualContact
{
  v24[7] = *MEMORY[0x1E4F143B8];
  v23 = [(_UISlotView *)self->_pillSlotView leadingAnchor];
  v22 = [(SLHighlightDisambiguationPillView *)self leadingAnchor];
  objc_super v21 = [v23 constraintEqualToAnchor:v22];
  v24[0] = v21;
  objc_super v20 = [(_UISlotView *)self->_pillSlotView topAnchor];
  id v19 = [(SLHighlightDisambiguationPillView *)self topAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v24[1] = v18;
  v17 = [(_UISlotView *)self->_pillSlotView centerYAnchor];
  uint64_t v16 = [(SLHighlightDisambiguationPillView *)self centerYAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v24[2] = v15;
  v3 = [(UIButton *)self->_transcriptButton centerYAnchor];
  v4 = [(SLHighlightDisambiguationPillView *)self centerYAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4];
  v24[3] = v5;
  v6 = [(UIButton *)self->_transcriptButton heightAnchor];
  v7 = [(SLHighlightDisambiguationPillView *)self heightAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7 multiplier:0.53125];
  v24[4] = v8;
  double v9 = [(UIButton *)self->_transcriptButton widthAnchor];
  double v10 = [(UIButton *)self->_transcriptButton heightAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  transcriptButtonConstraint = self->_transcriptButtonConstraint;
  v24[5] = v11;
  v24[6] = transcriptButtonConstraint;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:7];

  return v13;
}

- (void)_loadDisambiguationPillSlotView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB22D0]);
  [(SLHighlightDisambiguationPillView *)self setPillSlotView:v3];

  v4 = [(SLHighlightDisambiguationPillView *)self pillSlotView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(SLHighlightDisambiguationPillView *)self pillSlotView];
  [v5 setContentMode:1];

  id v6 = [(SLHighlightDisambiguationPillView *)self pillSlotView];
  [(SLHighlightDisambiguationPillView *)self addSubview:v6];
}

- (id)_loadButtonWithImageName:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB14D0];
  id v5 = a3;
  id v6 = [v4 buttonWithType:0];
  v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v5];

  [v6 addTarget:self action:sel__transcriptButtonTapped_ forControlEvents:64];
  [v6 setImage:v7 forState:0];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v6 setTintColor:v8];

  double v9 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  [v6 setBackgroundColor:v9];

  [v6 setClipsToBounds:1];
  return v6;
}

- (void)_loadTranscriptButton
{
  id v3 = [(SLHighlightDisambiguationPillView *)self _loadButtonWithImageName:@"message.fill"];
  transcriptButton = self->_transcriptButton;
  self->_transcriptButton = v3;

  id v20 = [MEMORY[0x1E4FB14C8] effectWithStyle:18];
  id v5 = [MEMORY[0x1E4FB1EA0] _effectForBlurEffect:v20 vibrancyStyle:112];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v5];
  [(SLHighlightDisambiguationPillView *)self setButtonEffectView:v6];

  v7 = [(SLHighlightDisambiguationPillView *)self buttonEffectView];
  [v7 setClipsToBounds:1];

  double v8 = [(SLHighlightDisambiguationPillView *)self buttonEffectView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(UIButton *)self->_transcriptButton bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(SLHighlightDisambiguationPillView *)self buttonEffectView];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = self->_transcriptButton;
  id v19 = [(SLHighlightDisambiguationPillView *)self buttonEffectView];
  [(UIButton *)v18 addSubview:v19];

  [(SLHighlightDisambiguationPillView *)self addSubview:self->_transcriptButton];
}

- (void)_loadBlurView
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
  id v5 = (UIVisualEffectView *)[v3 initWithEffect:v4];
  blurView = self->_blurView;
  self->_blurView = v5;

  [(UIVisualEffectView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SLHighlightDisambiguationPillView *)self addSubview:self->_blurView];
  [(SLHighlightDisambiguationPillView *)self sendSubviewToBack:self->_blurView];
  v17 = (void *)MEMORY[0x1E4F28DC8];
  id v20 = [(UIVisualEffectView *)self->_blurView widthAnchor];
  id v19 = [(SLHighlightDisambiguationPillView *)self widthAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  v7 = [(UIVisualEffectView *)self->_blurView heightAnchor];
  double v8 = [(SLHighlightDisambiguationPillView *)self heightAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  v21[1] = v9;
  double v10 = [(UIVisualEffectView *)self->_blurView centerXAnchor];
  double v11 = [(SLHighlightDisambiguationPillView *)self centerXAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v21[2] = v12;
  double v13 = [(UIVisualEffectView *)self->_blurView centerYAnchor];
  double v14 = [(SLHighlightDisambiguationPillView *)self centerYAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  v21[3] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v17 activateConstraints:v16];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SLHighlightDisambiguationPillView;
  [(SLHighlightDisambiguationPillView *)&v8 layoutSubviews];
  [(SLHighlightDisambiguationPillView *)self frame];
  double v4 = v3 * 0.5;
  [(SLHighlightDisambiguationPillView *)self _setContinuousCornerRadius:v3 * 0.5];
  [(UIVisualEffectView *)self->_blurView _setContinuousCornerRadius:v4];
  [(UIButton *)self->_transcriptButton frame];
  double v6 = v5 * 0.5;
  v7 = [(UIButton *)self->_transcriptButton layer];
  [v7 setCornerRadius:v6];
}

- (void)_transcriptButtonTapped:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v4 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    double v6 = self;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_INFO, "[SLHighlightDisambiguationPillView %p] _transcriptButtonTapped", (uint8_t *)&v5, 0xCu);
  }

  [(SLHighlightDisambiguationPillView *)self _presentTranscript];
}

- (void)_macroPillTapped
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    int v5 = self;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[SLHighlightDisambiguationPillView %p] _macroPillTapped", (uint8_t *)&v4, 0xCu);
  }

  [(SLHighlightDisambiguationPillView *)self _presentTranscript];
}

- (void)_presentTranscript
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v3 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    double v9 = self;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[SLHighlightDisambiguationPillView %p] _presentTranscript", (uint8_t *)&v8, 0xCu);
  }

  int v4 = objc_alloc_init(SLTranscriptController);
  int v5 = [(SLAttribution *)self->_attribution uniqueIdentifier];
  uint64_t v6 = [(SLAttribution *)self->_attribution attachmentGUID];
  uint64_t v7 = [(SLHighlightDisambiguationPillView *)self _viewControllerForAncestor];
  [(SLTranscriptController *)v4 presentTranscriptForMessageGUID:v5 attachmentGUID:v6 presentingViewController:v7];
  SLSendPortraitFeedbackTypeAppButtonForAttribution(self->_attribution);
}

- (void)serviceProxyDidConnect:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SLHighlightDisambiguationPillView_serviceProxyDidConnect___block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__SLHighlightDisambiguationPillView_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _contentProviderForCurrentConfiguration];
  v2 = [*(id *)(a1 + 32) pillSlotView];
  [v2 _setSlotAnyContentProvider:v3];
}

- (id)_contentProviderForCurrentConfiguration
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke;
  aBlock[3] = &unk_1E58A9F60;
  objc_copyWeak(&v6, &location);
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  int v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__13;
  v32[4] = __Block_byref_object_dispose__13;
  uint64_t v10 = [WeakRetained attribution];
  id v33 = [v10 uniqueIdentifier];

  int v11 = [WeakRetained remoteContentIsLoaded];
  double v12 = [WeakRetained placeholderSlotContent];
  double v13 = -[SLDHighlightDisambiguationPillEmptySlotContent initWithStyle:variant:forRemote:]([SLDHighlightDisambiguationPillEmptySlotContent alloc], "initWithStyle:variant:forRemote:", v7, [WeakRetained pillVariant], 0);
  [WeakRetained setPlaceholderSlotContent:v13];

  if (!v11) {
    goto LABEL_4;
  }
  [v12 contentSize];
  double v15 = v14;
  double v17 = v16;
  v18 = [WeakRetained placeholderSlotContent];
  [v18 contentSize];
  double v20 = v19;
  double v22 = v21;

  if (v15 != v20 || v17 != v22)
  {
LABEL_4:
    v23 = [WeakRetained placeholderSlotContent];
    v8[2](v8, v23);
  }
  v24 = [WeakRetained pillProxy];
  int v25 = [v24 connectionActive];

  if (v25)
  {
    v26 = [*(id *)(a1 + 32) remoteRenderingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_29;
    block[3] = &unk_1E58A9F38;
    block[4] = WeakRetained;
    v30 = v32;
    id v28 = v7;
    uint64_t v31 = a2;
    v29 = v8;
    dispatch_async(v26, block);
  }
  _Block_object_dispose(v32, 8);
}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_29(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pillProxy];
  id v3 = [v2 synchronousRemoteService];

  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length]
    && [v3 conformsToProtocol:&unk_1EEC494A0])
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v6 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v3;
    [v6 pillMaxWidth];
    double v9 = v8;
    uint64_t v10 = [*(id *)(a1 + 32) pillVariant];
    uint64_t v11 = *(void *)(a1 + 64);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_2;
    v15[3] = &unk_1E58A9F10;
    double v12 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v12;
    long long v14 = *(_OWORD *)(a1 + 48);
    id v13 = (id)v14;
    long long v17 = v14;
    [v7 highlightDisambiguationPillForAttributionIdentifier:v4 style:v5 maxWidth:v10 variant:v11 layerContextID:v15 reply:v9];
  }
}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_3;
  block[3] = &unk_1E58A9EE8;
  uint64_t v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = v3;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v7;
  long long v11 = v7;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) lastRenderedSlotStyle];
  char v4 = [v3 isEqual:*(void *)(v2 + 8)];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) setLastRenderedSlotStyle:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) setRemoteContentIsLoaded:*(void *)(a1 + 48) != 0];
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) setNeedsLayout];
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
  else
  {
    id v6 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_3_cold_1((id *)v2, a1, v6);
    }
  }
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  [(SLHighlightDisambiguationPillView *)self setLastRenderedSlotStyle:0];
  [(SLHighlightDisambiguationPillView *)self setRemoteContentIsLoaded:0];
}

- (void)dealloc
{
  self->_remoteContentIsLoaded = 0;
  [(SLDServiceProxy *)self->_pillProxy disconnect];
  pillProxdouble y = self->_pillProxy;
  self->_pillProxdouble y = 0;

  v4.receiver = self;
  v4.super_class = (Class)SLHighlightDisambiguationPillView;
  [(SLHighlightDisambiguationPillView *)&v4 dealloc];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(SLHighlightDisambiguationPillView *)self pointerInteraction];

  if (v9 == v8) {
    id v10 = v7;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a3;
  id v6 = [(SLHighlightDisambiguationPillView *)self pointerInteraction];

  if (v6 == v5)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    [(SLHighlightDisambiguationPillView *)self _continuousCornerRadius];
    id v9 = (void *)MEMORY[0x1E4FB14C0];
    [(SLHighlightDisambiguationPillView *)self bounds];
    id v10 = objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:");
    [v8 setVisiblePath:v10];

    long long v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v8];
    double v12 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v11];
    id v7 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v12 shape:0];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (SLAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (unint64_t)pillVariant
{
  return self->_pillVariant;
}

- (void)setPillVariant:(unint64_t)a3
{
  self->_pillVariant = a3;
}

- (OS_dispatch_queue)remoteRenderingQueue
{
  return self->_remoteRenderingQueue;
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (_UISlotView)pillSlotView
{
  return self->_pillSlotView;
}

- (void)setPillSlotView:(id)a3
{
}

- (SLDServiceProxy)pillProxy
{
  return self->_pillProxy;
}

- (void)setPillProxy:(id)a3
{
}

- (BOOL)remoteContentIsLoaded
{
  return self->_remoteContentIsLoaded;
}

- (void)setRemoteContentIsLoaded:(BOOL)a3
{
  self->_remoteContentIsLoaded = a3;
}

- (SLDHighlightDisambiguationPillEmptySlotContent)placeholderSlotContent
{
  return self->_placeholderSlotContent;
}

- (void)setPlaceholderSlotContent:(id)a3
{
}

- (UISSlotStyle)lastRenderedSlotStyle
{
  return self->_lastRenderedSlotStyle;
}

- (void)setLastRenderedSlotStyle:(id)a3
{
}

- (double)pillMaxWidth
{
  return self->_pillMaxWidth;
}

- (void)setPillMaxWidth:(double)a3
{
  self->_pillMaxWidth = a3;
}

- (UIButton)transcriptButton
{
  return self->_transcriptButton;
}

- (void)setTranscriptButton:(id)a3
{
}

- (NSLayoutConstraint)transcriptButtonConstraint
{
  return self->_transcriptButtonConstraint;
}

- (void)setTranscriptButtonConstraint:(id)a3
{
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (UIVisualEffectView)buttonEffectView
{
  return self->_buttonEffectView;
}

- (void)setButtonEffectView:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_buttonEffectView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_transcriptButtonConstraint, 0);
  objc_storeStrong((id *)&self->_transcriptButton, 0);
  objc_storeStrong((id *)&self->_lastRenderedSlotStyle, 0);
  objc_storeStrong((id *)&self->_placeholderSlotContent, 0);
  objc_storeStrong((id *)&self->_pillProxy, 0);
  objc_storeStrong((id *)&self->_pillSlotView, 0);
  objc_storeStrong((id *)&self->_remoteRenderingQueue, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_3_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = *a1;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a2 + 64) + 8) + 40);
  [*a1 pillMaxWidth];
  int v7 = 134218498;
  id v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_19BE17000, a3, OS_LOG_TYPE_ERROR, "[SLHighlightPillView: %p] sociallayerd returned nil remote content for attribution ID: [%@], maxWidth: [%f]", (uint8_t *)&v7, 0x20u);
}

@end