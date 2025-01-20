@interface SLHighlightPillView
+ (void)openMessagesForMessageGUID:(id)a3;
- (BOOL)_shouldDisplayDebugPillLabel;
- (BOOL)shouldDrawBackgroundBlur;
- (BOOL)shouldInvalidatePreviousPlaceHolderSlotContent:(id)a3 forStyle:(id)a4;
- (BOOL)shouldShowContextMenu;
- (BOOL)shouldShowReplyContextMenu;
- (NSArray)attributionIdentifiers;
- (NSArray)chevronConstraints;
- (NSArray)contextMenuItems;
- (NSSet)excludedContextMenuIdentifiers;
- (NSString)blurEffectGroupName;
- (SLHighlight)highlight;
- (SLHighlightPillView)initWithHighlight:(id)a3 maxWidth:(double)a4 variant:(unint64_t)a5 shouldDrawBlur:(BOOL)a6;
- (SLHighlightPillViewDelegate)delegate;
- (UIAction)hideAction;
- (UIAction)replyAction;
- (UIColor)preferredBackgroundColor;
- (UIImageView)lastChevronImageView;
- (UILabel)noAttributionsDebugLabel;
- (UIPointerInteraction)pointerInteraction;
- (UIVisualEffect)chevronEffect;
- (UIVisualEffectView)blurView;
- (UIVisualEffectView)chevronImageView;
- (double)expectedHeightForMaxWidth:(double)a3;
- (id)_attributionIdentifiers;
- (id)_targetedPreviewForInteraction:(id)a3;
- (id)_uiActionItems;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)makePlaceholderSlotContentForStyle:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)variant;
- (void)_configureChevronForSlotStyle:(id)a3;
- (void)_hideMenuItemSelected;
- (void)_pillTapped:(id)a3 forEvent:(id)a4;
- (void)_replyMenuItemSelected;
- (void)_setupBlurView;
- (void)_setupDebugPillLabel;
- (void)_uiActionItems;
- (void)excludeContextMenuItemsWithIdentifiers:(id)a3;
- (void)layoutSubviews;
- (void)refreshContextMenuItems;
- (void)remoteContentIsLoadedValueChanged;
- (void)renderRemoteContentForLayerContextID:(unint64_t)a3 style:(id)a4 yield:(id)a5;
- (void)setAttributionIdentifiers:(id)a3;
- (void)setBlurEffectGroupName:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setChevronConstraints:(id)a3;
- (void)setChevronEffect:(id)a3;
- (void)setChevronImageView:(id)a3;
- (void)setContextMenuItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExcludedContextMenuIdentifiers:(id)a3;
- (void)setHideAction:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLastChevronImageView:(id)a3;
- (void)setNoAttributionsDebugLabel:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setPreferredBackgroundColor:(id)a3;
- (void)setReplyAction:(id)a3;
- (void)setShouldDrawBackgroundBlur:(BOOL)a3;
- (void)setVariant:(unint64_t)a3;
- (void)shouldShowContextMenu;
- (void)shouldShowReplyContextMenu;
@end

@implementation SLHighlightPillView

- (SLHighlightPillView)initWithHighlight:(id)a3 maxWidth:(double)a4 variant:(unint64_t)a5 shouldDrawBlur:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  v26.receiver = self;
  v26.super_class = (Class)SLHighlightPillView;
  v12 = [(SLRemoteView *)&v26 initWithServiceProxyClass:v11 maxWidth:a4];
  v13 = v12;
  if (v12)
  {
    [(SLHighlightPillView *)v12 setHighlight:v10];
    [(SLHighlightPillView *)v13 setShouldDrawBackgroundBlur:v6];
    [(SLHighlightPillView *)v13 setUserInteractionEnabled:1];
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(SLHighlightPillView *)v13 setBackgroundColor:v14];

    v13->_variant = a5;
    [(SLHighlightPillView *)v13 _setupBlurView];
    if (v6)
    {
      v15 = [(SLHighlightPillView *)v13 chevronEffect];
    }
    else
    {
      v15 = 0;
    }
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v15];
    [(SLHighlightPillView *)v13 setChevronImageView:v16];
    v17 = [(SLHighlightPillView *)v13 chevronImageView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(SLHighlightPillView *)v13 chevronImageView];
    v19 = [(SLRemoteView *)v13 slotView];
    [(SLHighlightPillView *)v13 insertSubview:v18 above:v19];

    if ([(SLHighlightPillView *)v13 _shouldDisplayDebugPillLabel])
    {
      v20 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SLHighlightPillView initWithHighlight:maxWidth:variant:shouldDrawBlur:]();
      }

      [(SLHighlightPillView *)v13 _setupDebugPillLabel];
    }
    [(SLHighlightPillView *)v13 addTarget:v13 action:sel__pillTapped_forEvent_ forControlEvents:64];
    if ([(SLHighlightPillView *)v13 shouldShowContextMenu]) {
      [(SLHighlightPillView *)v13 setContextMenuInteractionEnabled:1];
    }
    v21 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v22 = [v21 userInterfaceIdiom];

    if (v22 == 1)
    {
      v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v13];
      [(SLHighlightPillView *)v13 setPointerInteraction:v23];

      v24 = [(SLHighlightPillView *)v13 pointerInteraction];
      [(SLHighlightPillView *)v13 addInteraction:v24];
    }
    [(SLHighlightPillView *)v13 refreshContextMenuItems];
  }
  return v13;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SLHighlightPillView *)self isHighlighted];
  v9.receiver = self;
  v9.super_class = (Class)SLHighlightPillView;
  [(SLHighlightPillView *)&v9 setHighlighted:v3];
  if (v5 != v3)
  {
    BOOL v6 = [(SLHighlightPillView *)self isHighlighted] == 0;
    double v7 = 0.6;
    v8[1] = 3221225472;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[2] = __38__SLHighlightPillView_setHighlighted___block_invoke;
    v8[3] = &unk_1E58A86F8;
    if (v6) {
      double v7 = 1.0;
    }
    v8[4] = self;
    *(double *)&v8[5] = v7;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.25];
  }
}

uint64_t __38__SLHighlightPillView_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (BOOL)_shouldDisplayDebugPillLabel
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  BOOL v3 = [(SLHighlightPillView *)self highlight];
  v4 = [v3 attributions];
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (void)_setupBlurView
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
  BOOL v5 = (UIVisualEffectView *)[v3 initWithEffect:v4];
  blurView = self->_blurView;
  self->_blurView = v5;

  [(SLHighlightPillView *)self addSubview:self->_blurView];
  [(SLHighlightPillView *)self sendSubviewToBack:self->_blurView];
  [(UIVisualEffectView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = (void *)MEMORY[0x1E4F28DC8];
  v20 = [(UIVisualEffectView *)self->_blurView leadingAnchor];
  v19 = [(SLHighlightPillView *)self leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  v17 = [(UIVisualEffectView *)self->_blurView trailingAnchor];
  v16 = [(SLHighlightPillView *)self trailingAnchor];
  double v7 = [v17 constraintEqualToAnchor:v16];
  v21[1] = v7;
  v8 = [(UIVisualEffectView *)self->_blurView topAnchor];
  objc_super v9 = [(SLHighlightPillView *)self topAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  v21[2] = v10;
  uint64_t v11 = [(UIVisualEffectView *)self->_blurView bottomAnchor];
  v12 = [(SLHighlightPillView *)self bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v21[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v15 activateConstraints:v14];

  [(UIVisualEffectView *)self->_blurView setHidden:1];
  [(UIVisualEffectView *)self->_blurView setUserInteractionEnabled:0];
}

- (UIVisualEffect)chevronEffect
{
  chevronEffect = self->_chevronEffect;
  if (!chevronEffect)
  {
    v4 = (void *)MEMORY[0x1E4FB1EA0];
    BOOL v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:4];
    BOOL v6 = [v4 effectForBlurEffect:v5 style:1];
    double v7 = self->_chevronEffect;
    self->_chevronEffect = v6;

    chevronEffect = self->_chevronEffect;
  }
  return chevronEffect;
}

- (void)_setupDebugPillLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SLHighlightPillView *)self setNoAttributionsDebugLabel:v4];

  BOOL v5 = [(SLHighlightPillView *)self noAttributionsDebugLabel];
  [v5 setText:@"0 SLAttributions"];

  BOOL v6 = [MEMORY[0x1E4FB1618] redColor];
  double v7 = [(SLHighlightPillView *)self noAttributionsDebugLabel];
  [v7 setTextColor:v6];

  v8 = [(SLHighlightPillView *)self noAttributionsDebugLabel];
  [v8 setUserInteractionEnabled:0];

  id v9 = [(SLHighlightPillView *)self noAttributionsDebugLabel];
  [(SLHighlightPillView *)self addSubview:v9];
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)SLHighlightPillView;
  [(SLHighlightPillView *)&v21 layoutSubviews];
  if ([(SLRemoteView *)self remoteContentIsLoaded])
  {
    id v3 = [(SLRemoteView *)self lastRenderedSlotStyle];

    if (v3)
    {
      [(SLHighlightPillView *)self frame];
      double v5 = v4 * 0.5;
      BOOL v6 = [(SLRemoteView *)self lastRenderedSlotStyle];
      double v7 = SLRoundToScale(v5, (double)[v6 displayScale]);

      if (v7 != 0.0)
      {
        [(SLHighlightPillView *)self _continuousCornerRadius];
        if (!SL_CGFloatApproximatelyEqualToFloat(v8, v7))
        {
          [(SLHighlightPillView *)self _setContinuousCornerRadius:v7];
          id v9 = [(SLHighlightPillView *)self blurView];
          [v9 _setContinuousCornerRadius:v7];
        }
      }
    }
  }
  if ([(SLHighlightPillView *)self _shouldDisplayDebugPillLabel])
  {
    if (![(SLRemoteView *)self remoteContentIsLoaded])
    {
      [(SLRemoteView *)self maxWidth];
      double v11 = v10;
      [(SLRemoteView *)self maxWidth];
      -[SLHighlightPillView expectedHeightForMaxWidth:](self, "expectedHeightForMaxWidth:");
      double v13 = v12;
      v14 = [(SLHighlightPillView *)self noAttributionsDebugLabel];
      [v14 intrinsicContentSize];
      double v16 = v11 * 0.5 - v15 * 0.5;

      v17 = [(SLHighlightPillView *)self noAttributionsDebugLabel];
      [v17 intrinsicContentSize];
      double v19 = v13 * 0.5 - v18 * 0.5;

      v20 = [(SLHighlightPillView *)self noAttributionsDebugLabel];
      objc_msgSend(v20, "setFrame:", v16, v19, v11, v13);
    }
  }
}

- (double)expectedHeightForMaxWidth:(double)a3
{
  [(SLRemoteView *)self maxWidth];
  if (SL_CGFloatApproximatelyEqualToFloat(a3, v5)
    || ([(SLRemoteView *)self lastRenderedSlotStyle],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    id v9 = [(SLRemoteView *)self slotView];
    [(SLDHighlightPillEmptySlotContent *)v9 intrinsicContentSize];
  }
  else
  {
    double v7 = [SLDHighlightPillEmptySlotContent alloc];
    double v8 = [(SLRemoteView *)self lastRenderedSlotStyle];
    id v9 = [(SLDHighlightPillEmptySlotContent *)v7 initWithStyle:v8 variant:[(SLHighlightPillView *)self variant] maxWidth:0 forRemote:a3];

    [(SLDEmptySlotContent *)v9 contentSize];
  }
  double v11 = v10;

  return v11;
}

- (void)setShouldDrawBackgroundBlur:(BOOL)a3
{
  if (self->_shouldDrawBackgroundBlur != a3)
  {
    self->_shouldDrawBackgroundBlur = a3;
    if (a3)
    {
      if ([(SLRemoteView *)self remoteContentIsLoaded])
      {
        double v4 = [(SLHighlightPillView *)self blurView];
        [v4 setHidden:0];
      }
      id v7 = [(SLHighlightPillView *)self chevronImageView];
      double v5 = [(SLHighlightPillView *)self chevronEffect];
      [v7 setEffect:v5];
    }
    else
    {
      BOOL v6 = [(SLHighlightPillView *)self chevronImageView];
      [v6 setEffect:0];

      id v7 = [(SLHighlightPillView *)self blurView];
      [v7 setHidden:1];
    }
  }
}

- (void)setBlurEffectGroupName:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_blurEffectGroupName isEqualToString:v4])
  {
    double v5 = [(SLHighlightPillView *)self blurView];
    [v5 _setGroupName:v4];

    BOOL v6 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(SLHighlightPillView *)(uint64_t)self setBlurEffectGroupName:v6];
    }
  }
}

- (void)setPreferredBackgroundColor:(id)a3
{
  id v12 = a3;
  if (([v12 isEqual:self->_preferredBackgroundColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredBackgroundColor, a3);
    if ([(SLHighlightPillView *)self shouldDrawBackgroundBlur]
      && ([(SLHighlightPillView *)self blurView],
          double v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      BOOL v6 = [(SLHighlightPillView *)self blurView];
      id v7 = [v6 contentView];
      [v7 setBackgroundColor:v12];

      double v8 = [MEMORY[0x1E4FB1618] clearColor];
      [(SLHighlightPillView *)self setBackgroundColor:v8];
    }
    else
    {
      id v9 = [(SLHighlightPillView *)self blurView];
      double v10 = [v9 contentView];
      double v11 = [MEMORY[0x1E4FB1618] clearColor];
      [v10 setBackgroundColor:v11];

      [(SLHighlightPillView *)self setBackgroundColor:v12];
    }
  }
}

- (void)_configureChevronForSlotStyle:(id)a3
{
  v50[4] = *MEMORY[0x1E4F143B8];
  if (self->_chevronImageView)
  {
    id v4 = a3;
    double v5 = [(SLHighlightPillView *)self lastChevronImageView];

    if (v5)
    {
      BOOL v6 = [(SLHighlightPillView *)self lastChevronImageView];
      [v6 removeFromSuperview];

      [(SLHighlightPillView *)self setLastChevronImageView:0];
    }
    uint64_t v7 = +[SLHighlightPillMetrics chevronFontDescriptorWithStyle:v4 variant:[(SLHighlightPillView *)self variant]];

    v49 = (void *)v7;
    uint64_t v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:0.0];
    id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v10 = [v9 userInterfaceLayoutDirection];

    double v11 = @"chevron.right";
    if (v10 == 1) {
      double v11 = @"chevron.left";
    }
    id v12 = (void *)MEMORY[0x1E4FB1830];
    double v13 = v11;
    v48 = (void *)v8;
    uint64_t v14 = [v12 configurationWithFont:v8 scale:1];
    id v15 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v47 = (void *)v14;
    v17 = [MEMORY[0x1E4FB1818] systemImageNamed:v13 withConfiguration:v14];

    double v18 = [v17 imageWithRenderingMode:2];
    [v16 setImage:v18];

    if ([(SLHighlightPillView *)self variant] == 11
      || [(SLHighlightPillView *)self variant] == 12
      || [(SLHighlightPillView *)self variant] == 9)
    {
      uint64_t v19 = [MEMORY[0x1E4FB1618] labelColor];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    v20 = (void *)v19;
    [v16 setTintColor:v19];

    [v16 sizeToFit];
    objc_super v21 = [(UIVisualEffectView *)self->_chevronImageView contentView];
    [v21 addSubview:v16];

    uint64_t v22 = [(SLRemoteView *)self lastRenderedSlotStyle];

    if (v22)
    {
      v23 = [(SLRemoteView *)self lastRenderedSlotStyle];
      unint64_t v24 = [(SLHighlightPillView *)self variant];
      [(SLRemoteView *)self maxWidth];
      +[SLHighlightPillMetrics pillMarginsWithStyle:variant:maxWidth:](SLHighlightPillMetrics, "pillMarginsWithStyle:variant:maxWidth:", v23, v24);
      double v26 = v25;

      v27 = [(UIVisualEffectView *)self->_chevronImageView trailingAnchor];
      v28 = [(SLHighlightPillView *)self trailingAnchor];
      uint64_t v29 = [v27 constraintEqualToAnchor:v28 constant:-v26];
    }
    else
    {
      v27 = [(UIVisualEffectView *)self->_chevronImageView trailingAnchor];
      v28 = [(SLHighlightPillView *)self layoutMarginsGuide];
      v30 = [v28 trailingAnchor];
      uint64_t v29 = [v27 constraintEqualToAnchor:v30];
    }
    v31 = [(SLHighlightPillView *)self chevronConstraints];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      v33 = (void *)MEMORY[0x1E4F28DC8];
      v34 = [(SLHighlightPillView *)self chevronConstraints];
      [v33 deactivateConstraints:v34];
    }
    v50[0] = v29;
    v35 = [(UIVisualEffectView *)self->_chevronImageView centerYAnchor];
    v36 = [(SLHighlightPillView *)self centerYAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v50[1] = v37;
    v38 = [(UIVisualEffectView *)self->_chevronImageView widthAnchor];
    [v16 size];
    objc_msgSend(v38, "constraintEqualToConstant:");
    v39 = v46 = (void *)v29;
    v50[2] = v39;
    v40 = [(UIVisualEffectView *)self->_chevronImageView heightAnchor];
    [v16 size];
    v42 = [v40 constraintEqualToConstant:v41];
    v50[3] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    [(SLHighlightPillView *)self setChevronConstraints:v43];

    v44 = (void *)MEMORY[0x1E4F28DC8];
    v45 = [(SLHighlightPillView *)self chevronConstraints];
    [v44 activateConstraints:v45];

    [(SLHighlightPillView *)self setNeedsLayout];
    [(SLHighlightPillView *)self setLastChevronImageView:v16];
  }
}

+ (void)openMessagesForMessageGUID:(id)a3
{
  if (a3)
  {
    [NSString stringWithFormat:@"sms://open?message-guid=%@&overlay=1", a3];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v4 openURL:v3 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
}

- (void)_pillTapped:(id)a3 forEvent:(id)a4
{
  id v5 = [(SLHighlightPillView *)self _attributionIdentifiers];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [(SLHighlightPillView *)self highlight];
  uint64_t v8 = [v7 attributions];
  id v9 = [v8 firstObject];

  if (v9)
  {
    uint64_t v10 = [v9 attachmentGUID];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([v5 count])
  {
    double v11 = [(SLHighlightPillView *)self _viewControllerForAncestor];
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    double v11 = 0;
    if (v6)
    {
LABEL_6:
      if (v6 == 1)
      {
        id v12 = objc_alloc_init(SLTranscriptController);
        double v13 = [v5 firstObject];
        if (v11)
        {
          [(SLTranscriptController *)v12 presentTranscriptForMessageGUID:v13 attachmentGUID:v10 presentingViewController:v11];
        }
        else
        {
          double v25 = SLFrameworkLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[SLHighlightPillView _pillTapped:forEvent:](v25);
          }
        }
        double v26 = [(SLHighlightPillView *)self highlight];
        v27 = [v26 attributions];
        v28 = [v27 firstObject];
        SLSendPortraitFeedbackTypeAppButtonForAttribution(v28);
      }
      else
      {
        uint64_t v14 = [(SLHighlightPillView *)self superview];
        [(SLHighlightPillView *)self frame];
        objc_msgSend(v14, "convertRect:toView:", 0);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;

        v23 = [SLDisambiguationCollectionViewController alloc];
        unint64_t v24 = [(SLHighlightPillView *)self highlight];
        id v12 = [(SLDisambiguationCollectionViewController *)v23 initWithHighlight:v24];

        [(SLTranscriptController *)v12 setModalPresentationStyle:5];
        [(SLTranscriptController *)v12 setModalTransitionStyle:2];
        -[SLTranscriptController setAttributionViewFrame:](v12, "setAttributionViewFrame:", v16, v18, v20, v22);
        [v11 presentViewController:v12 animated:0 completion:0];
      }
      goto LABEL_17;
    }
  }
  SLFrameworkLogHandle();
  id v12 = (SLTranscriptController *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v12->super.super.super, OS_LOG_TYPE_ERROR)) {
    -[SLHighlightPillView _pillTapped:forEvent:]((uint64_t)self, &v12->super.super.super);
  }
LABEL_17:
}

- (id)_attributionIdentifiers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  attributionIdentifiers = self->_attributionIdentifiers;
  if (!attributionIdentifiers || ![(NSArray *)attributionIdentifiers count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [(SLHighlightPillView *)self highlight];
    uint64_t v6 = [v5 attributions];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v8 = [(SLHighlightPillView *)self highlight];
      id v9 = [v8 attributions];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            double v15 = [v14 uniqueIdentifier];

            if (v15)
            {
              double v16 = [v14 uniqueIdentifier];
              [v4 addObject:v16];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
      }
    }
    else
    {
      id v9 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SLHighlightPillView initWithHighlight:maxWidth:variant:shouldDrawBlur:]();
      }
    }

    double v17 = (NSArray *)[v4 copy];
    double v18 = self->_attributionIdentifiers;
    self->_attributionIdentifiers = v17;
  }
  double v19 = self->_attributionIdentifiers;
  return v19;
}

- (void)remoteContentIsLoadedValueChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SLHighlightPillView_remoteContentIsLoadedValueChanged__block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__SLHighlightPillView_remoteContentIsLoadedValueChanged__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) remoteContentIsLoaded];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 shouldDrawBackgroundBlur] ^ 1;
    id v5 = [*(id *)(a1 + 32) blurView];
    uint64_t v6 = v5;
    uint64_t v7 = v4;
  }
  else
  {
    id v5 = [v3 blurView];
    uint64_t v6 = v5;
    uint64_t v7 = 1;
  }
  [v5 setHidden:v7];

  id v8 = [*(id *)(a1 + 32) chevronImageView];
  [v8 setHidden:0];
}

- (void)renderRemoteContentForLayerContextID:(unint64_t)a3 style:(id)a4 yield:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(SLHighlightPillView *)self _attributionIdentifiers];
  uint64_t v11 = [(SLRemoteView *)self serviceProxy];
  uint64_t v12 = [v11 synchronousRemoteService];

  if ([v10 count] && objc_msgSend(v12, "conformsToProtocol:", &unk_1EEC494A0))
  {
    id v13 = v12;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    os_signpost_id_t v31 = 0;
    uint64_t v14 = SLGeneralTelemetryLogHandle();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);

    os_signpost_id_t v31 = v15;
    double v16 = SLGeneralTelemetryLogHandle();
    double v17 = v16;
    os_signpost_id_t v18 = v29[3];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19BE17000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "HighlightPillTotalRender", "", buf, 2u);
    }

    [(SLRemoteView *)self maxWidth];
    double v20 = v19;
    unint64_t v21 = [(SLHighlightPillView *)self variant];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke;
    v22[3] = &unk_1E58A9B58;
    v22[4] = self;
    id v23 = v8;
    id v24 = v10;
    uint64_t v26 = &v28;
    id v25 = v9;
    [v13 highlightPillForAttributionIdentifiers:v24 style:v23 maxWidth:v21 variant:a3 layerContextID:v22 reply:v20];

    _Block_object_dispose(&v28, 8);
  }
}

void __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2;
  block[3] = &unk_1E58A9B30;
  uint64_t v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 56);
  id v5 = (id)v7;
  long long v12 = v7;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) lastRenderedSlotStyle];
  char v4 = [v3 isEqual:*(void *)(v2 + 8)];

  if ((v4 & 1) == 0)
  {
    [*(id *)(a1 + 32) setLastRenderedSlotStyle:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _configureChevronForSlotStyle:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) setRemoteContentIsLoaded:*(void *)(a1 + 48) != 0];
  if (*(void *)(a1 + 48))
  {
    id v5 = SLGeneralTelemetryLogHandle();
    id v6 = v5;
    os_signpost_id_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)id v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_19BE17000, v6, OS_SIGNPOST_INTERVAL_END, v7, "HighlightPillTotalRender", "", v9, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 32) setNeedsLayout];
    [*(id *)(a1 + 32) layoutIfNeeded];
    id v8 = [*(id *)(a1 + 32) delegate];
    [v8 highlightPillViewDidLoadNewRemoteContent:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2_cold_1((id *)v2);
    }
  }
}

- (BOOL)shouldInvalidatePreviousPlaceHolderSlotContent:(id)a3 forStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v9 = v8;
    if (v8
      && (uint64_t v10 = [v8 variant], v10 == -[SLHighlightPillView variant](self, "variant"))
      && ([v9 maxWidth], double v12 = v11, -[SLRemoteView maxWidth](self, "maxWidth"), v12 == v13))
    {
      double v16 = [v9 style];
      int v14 = [v16 isEqual:v7] ^ 1;
    }
    else
    {
      LOBYTE(v14) = 1;
    }
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (id)makePlaceholderSlotContentForStyle:(id)a3
{
  id v4 = a3;
  id v5 = [SLDHighlightPillEmptySlotContent alloc];
  unint64_t v6 = [(SLHighlightPillView *)self variant];
  [(SLRemoteView *)self maxWidth];
  id v7 = -[SLDHighlightPillEmptySlotContent initWithStyle:variant:maxWidth:forRemote:](v5, "initWithStyle:variant:maxWidth:forRemote:", v4, v6, 0);

  return v7;
}

- (BOOL)shouldShowContextMenu
{
  uint64_t v2 = [(SLHighlightPillView *)self highlight];
  id v3 = [v2 attributions];

  uint64_t v4 = [v3 count];
  if (!v4)
  {
    id v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SLHighlightPillView shouldShowContextMenu]();
    }
  }
  return v4 != 0;
}

- (BOOL)shouldShowReplyContextMenu
{
  id v3 = [(SLHighlightPillView *)self highlight];
  uint64_t v4 = [v3 attributions];

  if (![(SLHighlightPillView *)self shouldShowContextMenu])
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SLHighlightPillView shouldShowReplyContextMenu]();
    }

    goto LABEL_6;
  }
  BOOL v6 = 1;
LABEL_8:
  id v7 = [(SLHighlightPillView *)self excludedContextMenuIdentifiers];
  int v8 = [v7 containsObject:@"slReplyMenuItem"];

  if (v8)
  {
    id v9 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SLHighlightPillView shouldShowReplyContextMenu]();
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)refreshContextMenuItems
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(SLHighlightPillView *)self shouldShowContextMenu])
  {
    uint64_t v4 = [(SLHighlightPillView *)self _uiActionItems];
    [v3 addObjectsFromArray:v4];

    id v5 = [MEMORY[0x1E4F1C978] array];
    BOOL v6 = [(SLHighlightPillView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      int v8 = [(SLHighlightPillView *)self delegate];
      uint64_t v9 = [v8 additionalContextMenuItemsForHighlightPillView:self];

      id v5 = (void *)v9;
    }
    if ([v5 count])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v24 = v5;
      id v10 = v5;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (!v11) {
        goto LABEL_27;
      }
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      while (1)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          os_signpost_id_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v16 = (void *)MEMORY[0x1E4F28F60];
            double v17 = [v15 identifier];
            os_signpost_id_t v18 = [v16 predicateWithFormat:@"identifier MATCHES %@", v17];

            double v19 = [v3 filteredArrayUsingPredicate:v18];
            if ([v19 count])
            {
              double v20 = SLFrameworkLogHandle();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                unint64_t v21 = [v15 identifier];
                *(_DWORD *)buf = 134218242;
                uint64_t v30 = self;
                __int16 v31 = 2112;
                uint64_t v32 = v21;
                _os_log_error_impl(&dword_19BE17000, v20, OS_LOG_TYPE_ERROR, "[SLHighlightPillView: %p] Skipping adding context menu item with identifier %@ provided by delegate as its already present", buf, 0x16u);
                goto LABEL_25;
              }
            }
            else
            {
              [v3 addObject:v15];
              double v20 = SLFrameworkLogHandle();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                unint64_t v21 = [v15 identifier];
                *(_DWORD *)buf = 134218242;
                uint64_t v30 = self;
                __int16 v31 = 2112;
                uint64_t v32 = v21;
                _os_log_debug_impl(&dword_19BE17000, v20, OS_LOG_TYPE_DEBUG, "[SLHighlightPillView: %p] Adding context menu item with identifier %@ provided by delegate ", buf, 0x16u);
LABEL_25:
              }
            }

LABEL_21:
            goto LABEL_22;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v3 addObject:v15];
            os_signpost_id_t v18 = SLFrameworkLogHandle();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_22;
            }
            double v19 = [v15 identifier];
            *(_DWORD *)buf = 134218242;
            uint64_t v30 = self;
            __int16 v31 = 2112;
            uint64_t v32 = v19;
            _os_log_debug_impl(&dword_19BE17000, v18, OS_LOG_TYPE_DEBUG, "[SLHighlightPillView: %p] Adding context menu item with identifier %@ provided by delegate ", buf, 0x16u);
            goto LABEL_21;
          }
          os_signpost_id_t v18 = SLFrameworkLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v30 = self;
            __int16 v31 = 2112;
            uint64_t v32 = v15;
            _os_log_error_impl(&dword_19BE17000, v18, OS_LOG_TYPE_ERROR, "[SLHighlightPillView: %p] Not adding invalid context menu item %@ provided by delegate.", buf, 0x16u);
          }
LABEL_22:

          ++v14;
        }
        while (v12 != v14);
        uint64_t v22 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
        uint64_t v12 = v22;
        if (!v22)
        {
LABEL_27:

          id v5 = v24;
          break;
        }
      }
    }
  }
  id v23 = (void *)[v3 copy];
  [(SLHighlightPillView *)self setContextMenuItems:v23];
}

- (void)excludeContextMenuItemsWithIdentifiers:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    [(SLHighlightPillView *)self setExcludedContextMenuIdentifiers:v4];

    [(SLHighlightPillView *)self refreshContextMenuItems];
  }
}

- (id)_uiActionItems
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(SLHighlightPillView *)self shouldShowReplyContextMenu])
  {
    uint64_t v4 = [(SLHighlightPillView *)self replyAction];
    if (v4) {
      [v3 addObject:v4];
    }
  }
  id v5 = [(SLHighlightPillView *)self excludedContextMenuIdentifiers];
  char v6 = [v5 containsObject:@"slHideMenuItem"];

  if (v6)
  {
    char v7 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SLHighlightPillView _uiActionItems]();
    }
  }
  else
  {
    int v8 = [(SLHighlightPillView *)self hideAction];
    if (v8) {
      [v3 addObject:v8];
    }
  }
  uint64_t v9 = (void *)[v3 copy];

  return v9;
}

- (UIAction)replyAction
{
  replyAction = self->_replyAction;
  if (!replyAction)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = (void *)MEMORY[0x1E4FB13F0];
    id v5 = SLFrameworkBundle();
    char v6 = [v5 localizedStringForKey:@"REPLY_CONTEXTMENU" value:&stru_1EEC19158 table:@"SocialLayer"];
    char v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrowshape.turn.up.left"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __34__SLHighlightPillView_replyAction__block_invoke;
    v11[3] = &unk_1E58A9B80;
    objc_copyWeak(&v12, &location);
    int v8 = [v4 actionWithTitle:v6 image:v7 identifier:@"slReplyMenuItem" handler:v11];
    uint64_t v9 = self->_replyAction;
    self->_replyAction = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    replyAction = self->_replyAction;
  }
  return replyAction;
}

void __34__SLHighlightPillView_replyAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _replyMenuItemSelected];
}

- (UIAction)hideAction
{
  hideAction = self->_hideAction;
  if (!hideAction)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = (void *)MEMORY[0x1E4FB13F0];
    id v5 = SLFrameworkBundle();
    char v6 = [v5 localizedStringForKey:@"HIDE_CONTEXTMENU" value:&stru_1EEC19158 table:@"SocialLayer"];
    char v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__SLHighlightPillView_hideAction__block_invoke;
    v11[3] = &unk_1E58A9B80;
    objc_copyWeak(&v12, &location);
    int v8 = [v4 actionWithTitle:v6 image:v7 identifier:@"slHideMenuItem" handler:v11];
    uint64_t v9 = self->_hideAction;
    self->_hideAction = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    hideAction = self->_hideAction;
  }
  return hideAction;
}

void __33__SLHighlightPillView_hideAction__block_invoke(uint64_t a1)
{
  uint64_t v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_INFO, "SLHighlightPillView: Performing hide context menu action.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideMenuItemSelected];
}

- (void)_replyMenuItemSelected
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    id v5 = self;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[SLHighlightPillView %p] Performing reply context menu action.", (uint8_t *)&v4, 0xCu);
  }

  [(SLHighlightPillView *)self _pillTapped:0 forEvent:0];
}

- (void)_hideMenuItemSelected
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLHighlightPillView %p] _hideMenuItemSelected: Unable to perform hide context menu action without an application identifier.", (uint8_t *)&v2, 0xCu);
}

void __44__SLHighlightPillView__hideMenuItemSelected__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SLFrameworkLogHandle();
  char v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = [*(id *)(a1 + 40) identifier];
      int v10 = 134218242;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_INFO, "[SLHighlightPillView %p] _hideMenuItemSelected: Sent hide feedback for highlight: %@. Posting highlights deleted notification.", (uint8_t *)&v10, 0x16u);
    }
    notify_post("com.apple.spotlight.SyndicatedContentDeleted");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__SLHighlightPillView__hideMenuItemSelected__block_invoke_cold_1(a1);
    }
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__SLHighlightPillView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_1E58A9BA8;
  v6[4] = self;
  uint64_t v4 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:@"slContextMenu" previewProvider:0 actionProvider:v6];
  return v4;
}

id __77__SLHighlightPillView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshContextMenuItems];
  int v2 = (void *)MEMORY[0x1E4FB1970];
  uint64_t v3 = [*(id *)(a1 + 32) contextMenuItems];
  uint64_t v4 = [v2 menuWithTitle:&stru_1EEC19158 image:0 identifier:@"slContextMenu" options:1 children:v3];

  return v4;
}

- (id)_targetedPreviewForInteraction:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  [(SLHighlightPillView *)self frame];
  double v6 = v5 * 0.5;
  char v7 = [(SLRemoteView *)self lastRenderedSlotStyle];
  SLRoundToScale(v6, (double)[v7 displayScale]);

  if ([(SLHighlightPillView *)self shouldDrawBackgroundBlur])
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];
    [v4 setBackgroundColor:v8];
  }
  uint64_t v9 = (void *)MEMORY[0x1E4FB14C0];
  [(SLHighlightPillView *)self bounds];
  int v10 = objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:");
  [v4 setVisiblePath:v10];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v4];
  return v11;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  double v6 = [(SLHighlightPillView *)self interactions];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    uint64_t v8 = [(SLHighlightPillView *)self _targetedPreviewForInteraction:v5];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(SLHighlightPillView *)self pointerInteraction];

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
  id v6 = [(SLHighlightPillView *)self pointerInteraction];

  if (v6 == v5)
  {
    id v8 = [(SLHighlightPillView *)self _targetedPreviewForInteraction:v5];
    id v9 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v8];
    id v7 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (SLHighlightPillViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SLHighlightPillViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (BOOL)shouldDrawBackgroundBlur
{
  return self->_shouldDrawBackgroundBlur;
}

- (NSArray)contextMenuItems
{
  return self->_contextMenuItems;
}

- (void)setContextMenuItems:(id)a3
{
}

- (NSString)blurEffectGroupName
{
  return self->_blurEffectGroupName;
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (UIVisualEffectView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
}

- (void)setChevronEffect:(id)a3
{
}

- (UIImageView)lastChevronImageView
{
  return self->_lastChevronImageView;
}

- (void)setLastChevronImageView:(id)a3
{
}

- (UILabel)noAttributionsDebugLabel
{
  return self->_noAttributionsDebugLabel;
}

- (void)setNoAttributionsDebugLabel:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (NSArray)attributionIdentifiers
{
  return self->_attributionIdentifiers;
}

- (void)setAttributionIdentifiers:(id)a3
{
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (NSSet)excludedContextMenuIdentifiers
{
  return self->_excludedContextMenuIdentifiers;
}

- (void)setExcludedContextMenuIdentifiers:(id)a3
{
}

- (void)setReplyAction:(id)a3
{
}

- (void)setHideAction:(id)a3
{
}

- (NSArray)chevronConstraints
{
  return self->_chevronConstraints;
}

- (void)setChevronConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronConstraints, 0);
  objc_storeStrong((id *)&self->_hideAction, 0);
  objc_storeStrong((id *)&self->_replyAction, 0);
  objc_storeStrong((id *)&self->_excludedContextMenuIdentifiers, 0);
  objc_storeStrong((id *)&self->_attributionIdentifiers, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_noAttributionsDebugLabel, 0);
  objc_storeStrong((id *)&self->_lastChevronImageView, 0);
  objc_storeStrong((id *)&self->_chevronEffect, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_blurEffectGroupName, 0);
  objc_storeStrong((id *)&self->_contextMenuItems, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithHighlight:maxWidth:variant:shouldDrawBlur:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  v1 = [v0 highlight];
  int v2 = [v1 identifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "[SLHighlightPillView: %p] Highlight does not have any attributions! We won't be able to display a pill for this highlight: %@", v5, v6, v7, v8, v9);
}

- (void)setBlurEffectGroupName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19BE17000, log, OS_LOG_TYPE_DEBUG, "[SLHighlightPillView: %p] blurEffectGroupName set to: '%@'", (uint8_t *)&v3, 0x16u);
}

- (void)_pillTapped:(os_log_t)log forEvent:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "Presenting view controller is nil.", v1, 2u);
}

- (void)_pillTapped:(uint64_t)a1 forEvent:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLHighlightPillView: %p] User tapped the pill, but we don't have any attribution identifiers?", (uint8_t *)&v2, 0xCu);
}

void __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2_cold_1(id *a1)
{
  [*a1 maxWidth];
  OUTLINED_FUNCTION_7(&dword_19BE17000, v1, v2, "[SLHighlightPillView: %p] sociallayerd returned nil remote content for attribution ID: [%@], maxWidth: [%f]", v3, v4, v5, v6, 2u);
}

- (void)shouldShowContextMenu
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v1 = [v0 highlight];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "[SLHighlightPillView: %p] No context menu since no attributions found on highlight %@", v5, v6, v7, v8, v9);
}

- (void)shouldShowReplyContextMenu
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v1 = [v0 highlight];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v3, v4, "[SLHighlightPillView: %p] No reply context menu item for Highlight:%@ with multiple attributions", v5, v6, v7, v8, v9);
}

- (void)_uiActionItems
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v1 = [v0 highlight];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v3, v4, "[SLHighlightPillView: %p] No Hide context menu item for Highlight:%@ since it was asked to be excluded", v5, v6, v7, v8, v9);
}

void __44__SLHighlightPillView__hideMenuItemSelected__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v7 = [*(id *)(a1 + 40) identifier];
  OUTLINED_FUNCTION_7(&dword_19BE17000, v1, v2, "[SLHighlightPillView %p] _hideMenuItemSelected error sending hide feedback for highlight: [%@] error: [%@].", v3, v4, v5, v6, 2u);
}

@end