@interface VKCActionInfoView
+ (id)buildMoreButtonMenuFromQuickActions:(id)a3 moreButton:(id)a4 isStandAloneMoreButton:(BOOL)a5;
- (BOOL)_quickActionsHidden;
- (BOOL)alignQuickActionsWithVerticalCenter;
- (BOOL)automaticVisualRectLayoutDisabled;
- (BOOL)containsInteractableItemAtPoint:(CGPoint)a3;
- (BOOL)isInteractableView:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)isShowingSingleTapMoreButtonMenu;
- (BOOL)layoutUpdatesSuspended;
- (BOOL)liveTextButtonDisabled;
- (BOOL)quickActionsDisabled;
- (BOOL)shouldAnimateQuickActionVisibilityChanges;
- (BOOL)visualSearchCornerViewDisabled;
- (BOOL)wantsTranslucentActionInfoButtons;
- (CGRect)contentsRect;
- (CGRect)normalizedVisibleRect;
- (CGRect)visibleImageRect;
- (CGSize)sizeForView:(id)a3 scale:(double)a4;
- (NSArray)allViews;
- (NSArray)quickActions;
- (UIEdgeInsets)edgeInsets;
- (UIView)containerView;
- (UIView)moreButtonContainer;
- (UIView)textButtonContainer;
- (UIView)visualSearchContainer;
- (VKCActionInfoMoreButton)moreButton;
- (VKCActionInfoView)initWithLiveTextButton:(id)a3 cornerView:(id)a4;
- (VKCActionInfoViewLayoutContext)layoutContext;
- (VKCVisualSearchCornerView)visualSearchCornerView;
- (VKImageAnalysisButton)liveTextButton;
- (double)preferredQuickActionButtonHeight;
- (id)configureView:(id)a3 isLeading:(BOOL)a4 container:(id)a5 layoutContext:(id)a6;
- (id)createContainerForView:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)quickActionConfigurationUpdateHandler;
- (void)_applyConfigurationUpdateHandlerToQuickActions;
- (void)adjustContextToFitWidth:(id)a3;
- (void)layoutContainerView;
- (void)layoutSubviews;
- (void)processView:(id)a3 hasContent:(BOOL)a4 isLeading:(BOOL)a5 layoutContext:(id)a6;
- (void)setAlignQuickActionsWithVerticalCenter:(BOOL)a3;
- (void)setAllQuickActions:(id)a3;
- (void)setAutomaticVisualRectLayoutDisabled:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsShowingSingleTapMoreButtonMenu:(BOOL)a3;
- (void)setLayoutContext:(id)a3;
- (void)setLayoutUpdatesSuspended:(BOOL)a3;
- (void)setLiveTextButton:(id)a3;
- (void)setLiveTextButtonDisabled:(BOOL)a3;
- (void)setMoreButton:(id)a3;
- (void)setMoreButtonContainer:(id)a3;
- (void)setNormalizedVisibleRect:(CGRect)a3;
- (void)setPreferredQuickActionButtonHeight:(double)a3;
- (void)setQuickActionConfigurationUpdateHandler:(id)a3;
- (void)setQuickActions:(id)a3;
- (void)setQuickActionsDisabled:(BOOL)a3;
- (void)setShouldAnimateQuickActionVisibilityChanges:(BOOL)a3;
- (void)setTextButtonContainer:(id)a3;
- (void)setVisualSearchContainer:(id)a3;
- (void)setVisualSearchCornerView:(id)a3;
- (void)setVisualSearchCornerViewDisabled:(BOOL)a3;
- (void)setWantsTranslucentActionInfoButtons:(BOOL)a3;
- (void)set_quickActionsHidden:(BOOL)a3;
- (void)updateButtonClippingForContext:(id)a3;
- (void)updateFramesForContext:(id)a3;
- (void)updateLayoutIfNecessary;
@end

@implementation VKCActionInfoView

- (VKCActionInfoView)initWithLiveTextButton:(id)a3 cornerView:(id)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VKCActionInfoView;
  v9 = [(VKCActionInfoView *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_liveTextButton, a3);
    objc_storeStrong((id *)&v10->_visualSearchCornerView, a4);
    v11 = VKBundle();
    v12 = [v11 localizedStringForKey:@"VK_QUICK_ACTION_TITLE_MORE" value:@"VK_QUICK_ACTION_TITLE_MORE" table:@"Localizable"];

    v13 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_symbolImageWithName:", @"ellipsis.circle.fill");
    uint64_t v14 = +[VKCActionInfoButton buttonWithImage:v13 text:v12];
    moreButton = v10->_moreButton;
    v10->_moreButton = (VKCActionInfoMoreButton *)v14;

    [(VKCActionInfoMoreButton *)v10->_moreButton setAccessibilityIdentifier:@"QuickActionMore"];
    [(VKCActionInfoButton *)v10->_moreButton setIsMoreButton:1];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
    id v17 = (id)[(VKCActionInfoView *)v10 registerForTraitChanges:v16 withAction:sel_vk_setNeedsLayout];

    [(VKCActionInfoMoreButton *)v10->_moreButton addTarget:v10->_moreButton action:sel__moreButtonAction_ forControlEvents:64];
    __asm { FMOV            V0.2D, #12.0 }
    *(_OWORD *)&v10->_edgeInsets.top = _Q0;
    *(_OWORD *)&v10->_edgeInsets.bottom = _Q0;
    v23 = objc_alloc_init(VKCActionInfoViewLayoutContext);
    layoutContext = v10->_layoutContext;
    v10->_layoutContext = v23;

    id v25 = [(VKCActionInfoView *)v10 containerView];
  }

  return v10;
}

- (CGRect)visibleImageRect
{
  [(VKCActionInfoView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(VKCActionInfoView *)self contentsRect];
  VKMRectFromNormalizedSubrect(v4, v6, v8, v10, v11, v12, v13, v14);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [(VKCActionInfoView *)self normalizedVisibleRect];
  VKMRectFromNormalizedSubrect(v16, v18, v20, v22, v23, v24, v25, v26);
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  CGFloat v35 = v16;
  CGFloat v36 = v18;
  CGFloat v37 = v20;
  CGFloat v38 = v22;
  return CGRectIntersection(*(CGRect *)&v35, *(CGRect *)&v28);
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
  [(VKCActionInfoView *)self setShouldAnimateQuickActionVisibilityChanges:1];
  [(VKCActionInfoView *)self layoutContainerView];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCActionInfoView;
  [(VKCActionInfoView *)&v4 setHidden:a3];
  [(UIView *)self vk_setNeedsLayout];
}

- (void)updateLayoutIfNecessary
{
  if ([(VKCActionInfoView *)self layoutUpdatesSuspended])
  {
    [(VKCActionInfoView *)self setLayoutUpdatesSuspended:0];
    [(UIView *)self vk_setNeedsLayout];
    [(UIView *)self vk_layoutIfNeeded];
    [(VKCActionInfoView *)self setLayoutUpdatesSuspended:1];
  }
  else
  {
    [(UIView *)self vk_setNeedsLayout];
  }
}

- (UIView)containerView
{
  containerView = self->_containerView;
  if (!containerView)
  {
    objc_super v4 = objc_alloc_init(VKPlatformView);
    double v5 = self->_containerView;
    self->_containerView = &v4->super;

    CGFloat v6 = [(VKCActionInfoView *)self createContainerForView:self->_liveTextButton];
    [(VKCActionInfoView *)self setTextButtonContainer:v6];

    double v7 = [(VKCActionInfoView *)self createContainerForView:self->_visualSearchCornerView];
    [(VKCActionInfoView *)self setVisualSearchContainer:v7];

    CGFloat v8 = [(VKCActionInfoView *)self createContainerForView:self->_moreButton];
    [(VKCActionInfoView *)self setMoreButtonContainer:v8];

    double v9 = self->_containerView;
    CGFloat v10 = [(VKCActionInfoView *)self textButtonContainer];
    [(UIView *)v9 addSubview:v10];

    CGFloat v11 = self->_containerView;
    CGFloat v12 = [(VKCActionInfoView *)self visualSearchContainer];
    [(UIView *)v11 addSubview:v12];

    CGFloat v13 = self->_containerView;
    CGFloat v14 = [(VKCActionInfoView *)self moreButtonContainer];
    [(UIView *)v13 addSubview:v14];

    [(VKCActionInfoView *)self bounds];
    -[UIView setFrame:](self->_containerView, "setFrame:");
    [(UIView *)self->_containerView setAutoresizingMask:18];
    [(VKCActionInfoView *)self addSubview:self->_containerView];
    containerView = self->_containerView;
  }
  return containerView;
}

+ (id)buildMoreButtonMenuFromQuickActions:(id)a3 moreButton:(id)a4 isStandAloneMoreButton:(BOOL)a5
{
  id v7 = a4;
  CGFloat v8 = [a3 reverseObjectEnumerator];
  double v9 = [v8 allObjects];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  CGFloat v16 = __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke;
  double v17 = &unk_1E6BF22A8;
  id v18 = v7;
  BOOL v19 = a5;
  id v10 = v7;
  CGFloat v11 = objc_msgSend(v9, "vk_compactMap:", &v14);

  CGFloat v12 = objc_msgSend(MEMORY[0x1E4F42B80], "menuWithChildren:", v11, v14, v15, v16, v17);

  return v12;
}

id __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v5 defaultAction];
  CGFloat v8 = objc_msgSend(v7, "dd_action");
  [v8 setFallBackView:v6];

  if (a3 > 10)
  {
    id v10 = 0;
  }
  else
  {
    objc_initWeak(&location, v5);
    objc_initWeak(&from, *(id *)(a1 + 32));
    double v9 = (void *)MEMORY[0x1E4F42930];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke_2;
    v12[3] = &unk_1E6BF2280;
    char v15 = *(unsigned char *)(a1 + 40);
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    id v10 = [v9 elementWithUncachedProvider:v12];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke_2(uint64_t a1, void *a2)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 48);
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (!v4)
  {
    CGFloat v8 = [WeakRetained superview];
    char v9 = [v8 isHidden];

    if (v9) {
      goto LABEL_5;
    }
LABEL_8:
    v3[2](v3, MEMORY[0x1E4F1CBF0]);
    goto LABEL_15;
  }
  if (![WeakRetained isHidden])
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 32));
    char v15 = [v14 window];

    if (!v15) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }

LABEL_5:
  id v10 = objc_loadWeakRetained((id *)(a1 + 32));
  CGFloat v11 = [v10 menuImage];
  CGFloat v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v16 = objc_loadWeakRetained((id *)(a1 + 32));
    id v13 = [v16 image];
  }
  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  int v18 = [v17 isShowingSingleTapMenu];

  if (v18
    && (id v19 = objc_loadWeakRetained(v5), v20 = [v19 showsMenuAsPrimaryAction], v19, !v20))
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F426E8];
    id v30 = objc_loadWeakRetained(v5);
    uint64_t v31 = [v30 text];
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    CGFloat v36 = __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke_3;
    CGFloat v37 = &unk_1E6BF0C78;
    objc_copyWeak(&v38, v5);
    uint64_t v32 = [v29 actionWithTitle:v31 image:v13 identifier:0 handler:&v34];

    v39 = v32;
    uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v39, 1, v34, v35, v36, v37);
    ((void (**)(id, void *))v3)[2](v3, v33);

    objc_destroyWeak(&v38);
  }
  else
  {
    id v21 = objc_loadWeakRetained(v5);
    CGFloat v22 = [v21 menu];

    CGFloat v23 = [v22 children];
    CGFloat v24 = (void *)MEMORY[0x1E4F42B80];
    id v25 = objc_loadWeakRetained(v5);
    CGFloat v26 = [v25 text];
    uint64_t v27 = [v24 menuWithTitle:v26 image:v13 identifier:0 options:0 children:v23];

    v40[0] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    ((void (**)(id, void *))v3)[2](v3, v28);
  }
LABEL_15:
}

void __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performDefaultElementAction];
}

- (void)setQuickActionConfigurationUpdateHandler:(id)a3
{
  id v4 = a3;
  id quickActionConfigurationUpdateHandler = self->_quickActionConfigurationUpdateHandler;
  id v9 = v4;
  uint64_t v6 = (void *)MEMORY[0x1E018E600]();
  LOBYTE(quickActionConfigurationUpdateHandler) = [quickActionConfigurationUpdateHandler isEqual:v6];

  if ((quickActionConfigurationUpdateHandler & 1) == 0)
  {
    id v7 = (void *)[v9 copy];
    id v8 = self->_quickActionConfigurationUpdateHandler;
    self->_id quickActionConfigurationUpdateHandler = v7;

    [(VKCActionInfoView *)self _applyConfigurationUpdateHandlerToQuickActions];
    [(VKCActionInfoView *)self updateLayoutIfNecessary];
  }
}

- (void)_applyConfigurationUpdateHandlerToQuickActions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v3 = [(VKCActionInfoView *)self liveTextButton];
  id v4 = [v3 tintColor];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(VKCActionInfoView *)self quickActions];
  uint64_t v6 = [(VKCActionInfoView *)self moreButton];
  objc_msgSend(v5, "vk_arrayByAddingNonNilObject:", v6);
  id obj = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        objc_initWeak(&location, self);
        [v10 setTintColor:v4];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __67__VKCActionInfoView__applyConfigurationUpdateHandlerToQuickActions__block_invoke;
        v12[3] = &unk_1E6BF20A8;
        objc_copyWeak(&v13, &location);
        [v10 setConfigurationUpdateHandler:v12];
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

void __67__VKCActionInfoView__applyConfigurationUpdateHandlerToQuickActions__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = v9;
    if ([WeakRetained wantsTranslucentActionInfoButtons]
      && [WeakRetained tintAdjustmentMode] != 2)
    {
      if ([v4 isSelected]) {
        [v4 translucentSelectedButtonConfiguration];
      }
      else {
      id v5 = [v4 translucentButtonConfiguration];
      }
    }
    else
    {
      id v5 = [v4 filledButtonConfiguration];
      if (([v4 isSelected] & 1) == 0)
      {
        uint64_t v6 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.3];
        [v5 setBaseBackgroundColor:v6];
      }
    }
    [v4 setConfiguration:v5];
    uint64_t v7 = [WeakRetained quickActionConfigurationUpdateHandler];

    if (v7)
    {
      uint64_t v8 = [WeakRetained quickActionConfigurationUpdateHandler];
      ((void (**)(void, id))v8)[2](v8, v4);
    }
  }
}

- (void)setQuickActionsDisabled:(BOOL)a3
{
  self->_quickActionsDisabled = a3;
  if (![(VKCActionInfoView *)self layoutUpdatesSuspended])
  {
    [(UIView *)self vk_setNeedsLayout];
  }
}

- (void)setLiveTextButtonDisabled:(BOOL)a3
{
  if (self->_liveTextButtonDisabled != a3)
  {
    self->_BOOL liveTextButtonDisabled = a3;
    if ([(VKCActionInfoView *)self layoutUpdatesSuspended])
    {
      BOOL liveTextButtonDisabled = self->_liveTextButtonDisabled;
      id v6 = [(VKCActionInfoView *)self liveTextButton];
      id v5 = [v6 superview];
      [v5 setHidden:liveTextButtonDisabled];
    }
    else
    {
      [(UIView *)self vk_setNeedsLayout];
    }
  }
}

- (void)setVisualSearchCornerViewDisabled:(BOOL)a3
{
  if (self->_visualSearchCornerViewDisabled != a3)
  {
    BOOL v3 = a3;
    self->_visualSearchCornerViewDisabled = a3;
    if ([(VKCActionInfoView *)self layoutUpdatesSuspended])
    {
      id v6 = [(VKCActionInfoView *)self visualSearchCornerView];
      id v5 = [v6 superview];
      [v5 setHidden:v3];
    }
    else
    {
      [(UIView *)self vk_setNeedsLayout];
    }
  }
}

- (void)set_quickActionsHidden:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->__quickActionsHidden != a3)
  {
    self->__quickActionsHidden = a3;
    if (a3)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v4 = [(VKCActionInfoView *)self quickActions];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            [v9 setSelected:0];
            id v10 = [v9 contextMenuInteraction];
            [v10 dismissMenu];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
    }
    [(UIView *)self vk_setNeedsLayout];
  }
}

- (void)setLayoutUpdatesSuspended:(BOOL)a3
{
  self->_layoutUpdatesSuspended = a3;
  if (!a3) {
    [(UIView *)self vk_setNeedsLayout];
  }
}

- (void)setPreferredQuickActionButtonHeight:(double)a3
{
  if (self->_preferredQuickActionButtonHeight != a3)
  {
    self->_preferredQuickActionButtonHeight = a3;
    [(UIView *)self vk_setNeedsLayout];
  }
}

- (NSArray)allViews
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VKCActionInfoView *)self quickActions];
  id v4 = (void *)v3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    uint64_t v5 = (void *)v3;
  }
  id v6 = v5;

  uint64_t v7 = [(VKCActionInfoView *)self liveTextButton];
  uint64_t v8 = [(VKCActionInfoView *)self visualSearchCornerView];
  v13[1] = v8;
  id v9 = [(VKCActionInfoView *)self moreButton];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  long long v11 = [v6 arrayByAddingObjectsFromArray:v10];

  return (NSArray *)v11;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VKCActionInfoView;
  [(VKCActionInfoView *)&v3 layoutSubviews];
  if (![(VKCActionInfoView *)self layoutUpdatesSuspended]) {
    [(VKCActionInfoView *)self layoutContainerView];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VKCActionInfoView;
  -[VKCActionInfoView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (VKCActionInfoView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || ([(VKCActionInfoView *)self containerView],
        id v6 = (VKCActionInfoView *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {

    uint64_t v5 = 0;
  }
  return v5;
}

- (void)layoutContainerView
{
  objc_super v3 = [(VKCActionInfoView *)self superview];
  BOOL v4 = [(VKCActionInfoView *)self automaticVisualRectLayoutDisabled];
  if (v3
    && (BOOL v5 = v4, [(VKCActionInfoView *)self window], (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v7 = (void *)v6, v8 = [(VKCActionInfoView *)self isHidden], v7, (v8 & 1) == 0))
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:0];
    if (v5)
    {
      [(VKCActionInfoView *)self visibleImageRect];
      [(VKCActionInfoView *)self bounds];
      double x = v10;
      double y = v12;
      double width = v14;
      double height = v16;
      double v18 = 1.0;
      double v19 = 12.0;
    }
    else
    {
      [(UIView *)self vk_viewPointRatioFromWindow];
      double v18 = v20;
      double v19 = v20 * 12.0;
      [(VKCActionInfoView *)self visibleImageRect];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      [(VKCActionInfoView *)self bounds];
      v76.origin.double x = v22;
      v76.origin.double y = v24;
      v76.size.double width = v26;
      v76.size.double height = v28;
      CGRect v74 = CGRectIntersection(v73, v76);
      double x = v74.origin.x;
      double y = v74.origin.y;
      double width = v74.size.width;
      double height = v74.size.height;
    }
    if (VKMRectHasArea(x, y, width, height))
    {
      double v70 = v19;
      [(VKCActionInfoView *)self edgeInsets];
      double v30 = v18 * v29;
      double v68 = v32;
      double v69 = v18 * v29 + v18 * v31;
      [(VKCActionInfoView *)self edgeInsets];
      double v34 = v33;
      [(VKCActionInfoView *)self edgeInsets];
      double v36 = v34 + v35;
      [(VKCActionInfoView *)self preferredQuickActionButtonHeight];
      double v38 = v37;
      if ([(VKCActionInfoView *)self automaticVisualRectLayoutDisabled])
      {
        double v39 = fmax(v38 + v36, 44.0);
      }
      else
      {
        v40 = [(VKCActionInfoView *)self liveTextButton];
        [v40 backgroundDiameter];
        double v39 = v36 + v41;
      }
      double v42 = width - v69;
      double v43 = x + v30;
      double v44 = v18 * v39;
      if ([(VKCActionInfoView *)self alignQuickActionsWithVerticalCenter])
      {
        double v45 = y + (v44 - height) * -0.5;
      }
      else
      {
        v75.origin.double x = x;
        v75.origin.double y = y;
        v75.size.double width = width;
        v75.size.double height = height;
        double v45 = CGRectGetMaxY(v75) - v18 * v68 - v44;
      }
      -[UIView vk_convertFrameToViewScale:shouldRound:](self, "vk_convertFrameToViewScale:shouldRound:", 0, v43, v45, v42, v44);
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;
      v54 = [(VKCActionInfoView *)self containerView];
      objc_msgSend(v54, "setFrame:", v47, v49, v51, v53);

      v55 = [(VKCActionInfoView *)self layoutContext];
      [v55 reset];
      v56 = [(VKCActionInfoView *)self containerView];
      [v56 bounds];
      objc_msgSend(v55, "setContainerBounds:");

      [v55 setCurrentMaxX:v42];
      [v55 setCurrentMinX:0.0];
      [v55 setScale:v18];
      [v55 setPadding:v70];
      objc_msgSend(v55, "setAnimateItemVisibilityChanges:", -[VKCActionInfoView shouldAnimateQuickActionVisibilityChanges](self, "shouldAnimateQuickActionVisibilityChanges"));
      [v55 setShowingMoreButton:0];
      BOOL v57 = 0;
      if (![(VKCActionInfoView *)self liveTextButtonDisabled])
      {
        v58 = [(VKCActionInfoView *)self liveTextButton];
        objc_msgSend(v58, "vk_alpha");
        BOOL v57 = v59 > 0.0;
      }
      v60 = [(VKCActionInfoView *)self liveTextButton];
      [(VKCActionInfoView *)self processView:v60 hasContent:v57 isLeading:0 layoutContext:v55];

      v61 = [(VKCActionInfoView *)self visualSearchCornerView];
      BOOL v62 = 0;
      if (![(VKCActionInfoView *)self visualSearchCornerViewDisabled])
      {
        if ([v61 isHidden])
        {
          BOOL v62 = 0;
        }
        else
        {
          v63 = [v61 cornerButtons];
          BOOL v62 = [v63 count] != 0;
        }
      }
      v64 = [(VKCActionInfoView *)self visualSearchCornerView];
      [(VKCActionInfoView *)self processView:v64 hasContent:v62 isLeading:0 layoutContext:v55];

      v65 = [(VKCActionInfoView *)self quickActions];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __40__VKCActionInfoView_layoutContainerView__block_invoke;
      v71[3] = &unk_1E6BF22D0;
      v71[4] = self;
      id v66 = v55;
      id v72 = v66;
      [v65 enumerateObjectsUsingBlock:v71];

      [(VKCActionInfoView *)self adjustContextToFitWidth:v66];
      [(VKCActionInfoView *)self updateFramesForContext:v66];
      [(VKCActionInfoView *)self updateButtonClippingForContext:v66];
      if ([v66 showingMoreButton])
      {
        [(VKCActionInfoView *)self updateMoreButtonMenuForContext:v66];
      }
      else
      {
        v67 = [(VKCActionInfoView *)self moreButtonContainer];
        [v67 setHidden:1];
      }
    }
    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    id v9 = [(VKCActionInfoView *)self allViews];
    [v9 enumerateObjectsUsingBlock:&__block_literal_global_12];
  }
}

void __40__VKCActionInfoView_layoutContainerView__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_super v3 = *(void **)(a1 + 32);
  if ([v3 _quickActionsHidden]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) quickActionsDisabled] ^ 1;
  }
  [v3 processView:v5 hasContent:v4 isLeading:1 layoutContext:*(void *)(a1 + 40)];
}

void __40__VKCActionInfoView_layoutContainerView__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 superview];
  [v2 setHidden:1];
}

- (void)adjustContextToFitWidth:(id)a3
{
  id v4 = a3;
  id v5 = [v4 leadingLayout];
  uint64_t v6 = [v4 trailingLayout];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    [v7 frame];
    double v9 = v8;
  }
  else
  {
    [v4 containerBounds];
    double v9 = v10;
  }
  [v4 padding];
  double v12 = v11;
  long long v13 = [v4 leadingLayout];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __45__VKCActionInfoView_adjustContextToFitWidth___block_invoke;
  v60[3] = &unk_1E6BF2318;
  id v14 = v4;
  id v61 = v14;
  double v62 = v9;
  uint64_t v15 = [v13 indexOfObjectPassingTest:v60];

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v16 = [v5 objectAtIndexedSubscript:v15];
    long long v17 = [v5 lastObject];

    [v14 scale];
    double v19 = v18 * 64.0;
    double v20 = [(VKCActionInfoView *)self moreButton];
    [v14 scale];
    -[VKCActionInfoView sizeForView:scale:](self, "sizeForView:scale:", v20);
    double v22 = v21;
    double rect = v23;

    if (v19 < v22) {
      double v19 = v22;
    }
    [v16 frame];
    double MinX = CGRectGetMinX(v63);
    if (v16 != v17 || (double MinX = v9 - MinX, MinX - v12 <= v19))
    {
      objc_msgSend(v16, "setHidden:", 1, MinX);
      double v25 = objc_alloc_init(VKCQuickActionLayoutInfo);
      CGFloat v26 = [(VKCActionInfoView *)self moreButton];
      [(VKCQuickActionLayoutInfo *)v25 setView:v26];

      [v16 frame];
      double x = v64.origin.x;
      double y = v64.origin.y;
      v64.size.double width = v22;
      v64.size.double height = rect;
      double MaxX = CGRectGetMaxX(v64);
      double v29 = [v14 leadingLayout];
      [v29 insertObject:v25 atIndex:v15];

      if (v15)
      {
        double v58 = v19;
        double v30 = x - (v12 + MaxX - v9);
        if (v15 < 1)
        {
          BOOL v49 = 0;
          goto LABEL_32;
        }
        double v54 = v9;
        double v55 = v12;
        unint64_t v31 = v15 + 1;
        while (1)
        {
          double v32 = objc_msgSend(v14, "leadingLayout", *(void *)&v54);
          double v33 = objc_msgSend(v32, "vk_safeObjectAtIndex:", v31 - 2);

          if (!v33) {
            goto LABEL_30;
          }
          v65.origin.double x = v30;
          v65.origin.double y = y;
          v65.size.double width = v22;
          v65.size.double height = rect;
          double v34 = CGRectGetMaxX(v65);
          [v33 frame];
          double v36 = v35;
          double v38 = v37;
          double v40 = v39;
          double v42 = v41;
          double v56 = v30;
          v66.origin.double x = v30;
          v66.origin.double y = y;
          double v43 = v22;
          v66.size.double width = v22;
          v66.size.double height = rect;
          double v44 = v42;
          double v45 = CGRectGetMinX(v66);
          v67.origin.double x = v36;
          v67.origin.double y = v38;
          v67.size.double width = v40;
          v67.size.double height = v44;
          double v46 = CGRectGetMaxX(v67);
          if (v40 >= v58)
          {
            double v47 = v45 - v46;
            if (v47 >= v55)
            {
              if (v47 > v55)
              {
                v68.origin.double x = v36;
                v68.origin.double y = v38;
                v68.size.double width = v40;
                v68.size.double height = v44;
                BOOL v49 = 0;
                double v30 = v55 + CGRectGetMaxX(v68);
                double v22 = v43;
                goto LABEL_31;
              }
              if (v47 == v55)
              {
LABEL_27:
                BOOL v49 = 0;
                double v22 = v43;
                double v30 = v56;
                goto LABEL_31;
              }
              double v22 = v43;
              if (vabdd_f64(v47, v55) >= fabs(v55 * 0.000000999999997)) {
                objc_msgSend(v33, "setFrame:", v36, v38, v40 - (v55 + v34 - v54), v44);
              }
LABEL_30:
              BOOL v49 = 0;
              goto LABEL_31;
            }
            double v48 = v40 + v47 - v55;
            objc_msgSend(v33, "setFrame:", v36, v38, v48, v44);
            double v46 = v58;
            if (v48 >= v58) {
              goto LABEL_27;
            }
          }
          objc_msgSend(v33, "setHidden:", 1, v46);

          --v31;
          double v30 = v36;
          double v22 = v43;
          if (v31 <= 1)
          {
            BOOL v49 = 0;
            double v30 = v36;
LABEL_32:
            -[VKCQuickActionLayoutInfo setFrame:](v25, "setFrame:", v30, y, v22, rect);
            [(VKCQuickActionLayoutInfo *)v25 setHidden:v49];
            [v14 setShowingMoreButton:v49 ^ 1];
            goto LABEL_33;
          }
        }
      }
      double v50 = [v14 trailingLayout];
      double v33 = [v50 firstObject];

      if (v33)
      {
        [v33 frame];
        double v30 = 0.0;
        if (v51 >= v12 + v22) {
          goto LABEL_30;
        }
        BOOL v49 = 1;
      }
      else
      {
        double v30 = 0.0;
        BOOL v49 = v22 > v9;
      }
LABEL_31:

      goto LABEL_32;
    }
    [v16 frame];
    objc_msgSend(v16, "setFrame:");
    [v14 setShowingMoreButton:0];
    while (1)
    {
      ++v15;
      double v52 = [v14 leadingLayout];
      unint64_t v53 = [v52 count];

      if (v15 >= v53) {
        break;
      }
      double v25 = [v5 objectAtIndexedSubscript:v15];
      [(VKCQuickActionLayoutInfo *)v25 setHidden:1];
LABEL_33:
    }
  }
}

BOOL __45__VKCActionInfoView_adjustContextToFitWidth___block_invoke(uint64_t a1, void *a2)
{
  [a2 frame];
  double MaxX = CGRectGetMaxX(v6);
  [*(id *)(a1 + 32) padding];
  return MaxX + v4 > *(double *)(a1 + 40);
}

- (void)updateButtonClippingForContext:(id)a3
{
  id v3 = [a3 leadingLayout];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_201];
}

void __52__VKCActionInfoView_updateButtonClippingForContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 view];
  [v3 frame];
  double v5 = v4;

  [v2 desiredFrame];
  double v7 = fabs(v5 / v6 + -1.0);
  uint64_t v8 = objc_opt_class();
  double v9 = [v2 view];

  VKDynamicCast(v8, (uint64_t)v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 >= 0.01) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 2;
  }
  double v11 = [v12 configuration];
  if ([v11 titleLineBreakMode] != v10)
  {
    [v11 setTitleLineBreakMode:v10];
    [v12 setConfiguration:v11];
  }
}

- (void)updateFramesForContext:(id)a3
{
  id v3 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:0];
  double v4 = [v3 leadingLayout];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__VKCActionInfoView_updateFramesForContext___block_invoke;
  v21[3] = &unk_1E6BF2360;
  id v5 = v3;
  id v22 = v5;
  [v4 enumerateObjectsUsingBlock:v21];

  double v6 = [v5 trailingLayout];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__VKCActionInfoView_updateFramesForContext___block_invoke_2;
  v19[3] = &unk_1E6BF2360;
  id v7 = v5;
  id v20 = v7;
  [v6 enumerateObjectsUsingBlock:v19];

  [MEMORY[0x1E4F39CF8] setDisableActions:0];
  uint64_t v8 = [v7 leadingLayout];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__VKCActionInfoView_updateFramesForContext___block_invoke_3;
  v17[3] = &unk_1E6BF2360;
  id v9 = v7;
  id v18 = v9;
  [v8 enumerateObjectsUsingBlock:v17];

  uint64_t v10 = [v9 trailingLayout];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __44__VKCActionInfoView_updateFramesForContext___block_invoke_4;
  uint64_t v15 = &unk_1E6BF2360;
  id v16 = v9;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:&v12];

  objc_msgSend(MEMORY[0x1E4F39CF8], "commit", v12, v13, v14, v15);
}

void __44__VKCActionInfoView_updateFramesForContext___block_invoke(uint64_t a1, void *a2)
{
  memset(&v33, 0, sizeof(v33));
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 scale];
  CGFloat v6 = v5;
  [*(id *)(a1 + 32) scale];
  CATransform3DMakeScale(&v33, v6, v7, 1.0);
  CATransform3D v32 = v33;
  uint64_t v8 = [v4 view];
  id v9 = [v8 layer];
  CATransform3D v31 = v32;
  [v9 setTransform:&v31];

  [v4 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [v4 view];
  double v19 = [v18 superview];
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  id v20 = [v4 view];
  double v21 = [v20 superview];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v30 = [v4 view];

  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);
}

void __44__VKCActionInfoView_updateFramesForContext___block_invoke_2(uint64_t a1, void *a2)
{
  memset(&v33, 0, sizeof(v33));
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 scale];
  CGFloat v6 = v5;
  [*(id *)(a1 + 32) scale];
  CATransform3DMakeScale(&v33, v6, v7, 1.0);
  CATransform3D v32 = v33;
  uint64_t v8 = [v4 view];
  id v9 = [v8 layer];
  CATransform3D v31 = v32;
  [v9 setTransform:&v31];

  [v4 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [v4 view];
  double v19 = [v18 superview];
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  id v20 = [v4 view];
  double v21 = [v20 superview];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v30 = [v4 view];

  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);
}

void __44__VKCActionInfoView_updateFramesForContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 view];
  id v4 = [v6 superview];
  uint64_t v5 = [v3 hidden];

  objc_msgSend(v4, "vk_setHidden:animated:", v5, objc_msgSend(*(id *)(a1 + 32), "animateItemVisibilityChanges"));
}

void __44__VKCActionInfoView_updateFramesForContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 view];
  id v4 = [v6 superview];
  uint64_t v5 = [v3 hidden];

  objc_msgSend(v4, "vk_setHidden:animated:", v5, objc_msgSend(*(id *)(a1 + 32), "animateItemVisibilityChanges"));
}

- (void)processView:(id)a3 hasContent:(BOOL)a4 isLeading:(BOOL)a5 layoutContext:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v20 = a3;
  id v10 = a6;
  double v11 = [v20 superview];
  if (v8)
  {
    id v12 = [(VKCActionInfoView *)self configureView:v20 isLeading:v7 container:v11 layoutContext:v10];
    if (v7)
    {
      if ([v10 didAddLeadingItem])
      {
        [v10 padding];
        double v14 = v13;
        [v10 currentMinX];
        [v10 setCurrentMinX:v14 + v15];
      }
    }
    else if ([v10 didAddTrailingItem])
    {
      [v10 padding];
      double v18 = v17;
      [v10 currentMaxX];
      [v10 setCurrentMaxX:v19 - v18];
    }
  }
  else
  {
    double v16 = [v20 superview];
    [v16 setHidden:1];
  }
}

- (id)configureView:(id)a3 isLeading:(BOOL)a4 container:(id)a5 layoutContext:(id)a6
{
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = a6;
  [v10 scale];
  -[VKCActionInfoView sizeForView:scale:](self, "sizeForView:scale:", v9);
  double v12 = v11;
  double v14 = v13;
  double v15 = VKMRectWithSize();
  double v17 = v16;
  double v19 = v18;
  if (v7)
  {
    objc_msgSend(v10, "currentMinX", v15);
    double v21 = v20;
  }
  else
  {
    objc_msgSend(v10, "currentMaxX", v15);
    double v21 = v22 - v12;
  }
  BOOL v23 = [(VKCActionInfoView *)self alignQuickActionsWithVerticalCenter];
  [v10 containerBounds];
  if (v23)
  {
    double v26 = v24;
    [v10 containerBounds];
    double v28 = v26 + (v27 - v14) * 0.5;
  }
  else
  {
    double v28 = v25 - v14;
  }
  double v29 = objc_alloc_init(VKCQuickActionLayoutInfo);
  -[UIView vk_convertFrameToViewScale:shouldRound:](self, "vk_convertFrameToViewScale:shouldRound:", 0, v21, v28, v17, v19);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  [(VKCQuickActionLayoutInfo *)v29 setView:v9];
  -[VKCQuickActionLayoutInfo setFrame:](v29, "setFrame:", v31, v33, v35, v37);
  -[VKCQuickActionLayoutInfo setDesiredFrame:](v29, "setDesiredFrame:", v31, v33, v35, v37);
  if (v7)
  {
    v41.origin.double x = v21;
    v41.origin.double y = v28;
    v41.size.double width = v17;
    v41.size.double height = v19;
    [v10 setCurrentMinX:CGRectGetMaxX(v41)];
    [v10 setDidAddLeadingItem:1];
    [v10 leadingLayout];
  }
  else
  {
    [v10 setCurrentMaxX:v21];
    [v10 setDidAddTrailingItem:1];
    [v10 trailingLayout];
  double v38 = };
  [v38 addObject:v29];

  return v29;
}

- (CGSize)sizeForView:(id)a3 scale:(double)a4
{
  id v6 = a3;
  [v6 intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(VKCActionInfoView *)self liveTextButton];
  if ((id)v11 == v6)
  {
  }
  else
  {
    double v12 = (void *)v11;
    id v13 = [(VKCActionInfoView *)self visualSearchCornerView];

    if (v13 != v6)
    {
      if ([(VKCActionInfoView *)self automaticVisualRectLayoutDisabled])
      {
        [(VKCActionInfoView *)self preferredQuickActionButtonHeight];
        double v15 = v14;
      }
      else
      {
        double v16 = [(VKCActionInfoView *)self liveTextButton];
        [v16 backgroundDiameter];
        double v15 = v17;
      }
      if (v15 >= v10) {
        double v10 = v15;
      }
      if (v8 < v10) {
        double v8 = v10;
      }
    }
  }
  double v18 = VKMMultiplyPointScalar(v8, v10, a4);
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)setVisualSearchCornerView:(id)a3
{
  p_visualSearchCornerView = &self->_visualSearchCornerView;
  objc_storeStrong((id *)&self->_visualSearchCornerView, a3);
  id v6 = a3;
  [(VKCActionInfoView *)self normalizedVisibleRect];
  -[VKCVisualSearchCornerView setNormalizedVisibleRect:](*p_visualSearchCornerView, "setNormalizedVisibleRect:");
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.CGFloat x = x;
    p_contentsRect->origin.CGFloat y = y;
    p_contentsRect->size.CGFloat width = width;
    p_contentsRect->size.CGFloat height = height;
    [(UIView *)self vk_setNeedsLayout];
  }
}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_normalizedVisibleRect = &self->_normalizedVisibleRect;
  if ([(VKCActionInfoView *)self automaticVisualRectLayoutDisabled])
  {
    p_normalizedVisibleRect->origin = (CGPoint)VKMRectUnit;
    self->_normalizedVisibleRect.size = *(CGSize *)&qword_1DB33EB28;
    double v9 = p_normalizedVisibleRect->origin.x;
    double v10 = self->_normalizedVisibleRect.origin.y;
    double v11 = self->_normalizedVisibleRect.size.width;
    double v12 = self->_normalizedVisibleRect.size.height;
    id v14 = [(VKCActionInfoView *)self visualSearchCornerView];
    objc_msgSend(v14, "setNormalizedVisibleRect:", v9, v10, v11, v12);
  }
  else
  {
    v16.origin.double x = p_normalizedVisibleRect->origin.x;
    v16.origin.double y = self->_normalizedVisibleRect.origin.y;
    v16.size.double width = self->_normalizedVisibleRect.size.width;
    v16.size.double height = self->_normalizedVisibleRect.size.height;
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    if (!CGRectEqualToRect(v16, v17))
    {
      p_normalizedVisibleRect->origin.double x = x;
      self->_normalizedVisibleRect.origin.double y = y;
      self->_normalizedVisibleRect.size.double width = width;
      self->_normalizedVisibleRect.size.double height = height;
      id v13 = [(VKCActionInfoView *)self visualSearchCornerView];
      objc_msgSend(v13, "setNormalizedVisibleRect:", x, y, width, height);

      [(UIView *)self vk_setNeedsLayout];
    }
  }
}

- (id)createContainerForView:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(VKPlatformView);
  [(VKPlatformView *)v4 addSubview:v3];

  return v4;
}

- (void)setQuickActions:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  quickActions = self->_quickActions;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __37__VKCActionInfoView_setQuickActions___block_invoke;
  v25[3] = &unk_1E6BF2388;
  v25[4] = self;
  id v6 = v4;
  id v26 = v6;
  [(NSArray *)quickActions enumerateObjectsUsingBlock:v25];
  double v7 = (NSArray *)[v6 copy];
  double v8 = self->_quickActions;
  self->_quickActions = v7;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[VKCActionInfoView createContainerForView:](self, "createContainerForView:", *(void *)(*((void *)&v21 + 1) + 8 * v13), (void)v21);
        double v15 = [(VKCActionInfoView *)self containerView];
        [v15 addSubview:v14];

        [v14 setHidden:1];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v11);
  }

  [(VKCActionInfoView *)self _applyConfigurationUpdateHandlerToQuickActions];
  CGRect v16 = objc_opt_class();
  CGRect v17 = self->_quickActions;
  double v18 = [(VKCActionInfoView *)self moreButton];
  double v19 = [v16 buildMoreButtonMenuFromQuickActions:v17 moreButton:v18 isStandAloneMoreButton:0];

  double v20 = [(VKCActionInfoView *)self moreButton];
  [v20 setCustomMenu:v19];

  [(VKCActionInfoView *)self layoutContainerView];
}

void __37__VKCActionInfoView_setQuickActions___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 superview];
  id v4 = [v3 superview];
  uint64_t v5 = [*(id *)(a1 + 32) containerView];

  if (v4 == v5 && ([*(id *)(a1 + 40) containsObject:v7] & 1) == 0)
  {
    id v6 = [v7 superview];
    [v6 removeFromSuperview];
  }
}

- (BOOL)containsInteractableItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(VKCActionInfoView *)self liveTextButton];
  BOOL v7 = -[VKCActionInfoView isInteractableView:atPoint:](self, "isInteractableView:atPoint:", v6, x, y);

  if (v7) {
    return 1;
  }
  double v8 = [(VKCActionInfoView *)self visualSearchCornerView];
  BOOL v9 = -[VKCActionInfoView isInteractableView:atPoint:](self, "isInteractableView:atPoint:", v8, x, y);

  if (v9) {
    return 1;
  }
  uint64_t v11 = [(VKCActionInfoView *)self allViews];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__VKCActionInfoView_containsInteractableItemAtPoint___block_invoke;
  v13[3] = &unk_1E6BF23B0;
  void v13[4] = self;
  *(double *)&v13[5] = x;
  *(double *)&v13[6] = y;
  char v10 = objc_msgSend(v11, "vk_containsObjectPassingTest:", v13);

  return v10;
}

uint64_t __53__VKCActionInfoView_containsInteractableItemAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isHidden]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "isInteractableView:atPoint:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  }

  return v4;
}

- (BOOL)isInteractableView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if ([v7 isHidden])
  {
    BOOL v8 = 0;
  }
  else
  {
    -[VKCActionInfoView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v7 bounds];
    v14.double x = v10;
    v14.double y = v12;
    BOOL v8 = CGRectContainsPoint(v15, v14);
  }

  return v8;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)normalizedVisibleRect
{
  double x = self->_normalizedVisibleRect.origin.x;
  double y = self->_normalizedVisibleRect.origin.y;
  double width = self->_normalizedVisibleRect.size.width;
  double height = self->_normalizedVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (VKImageAnalysisButton)liveTextButton
{
  return self->_liveTextButton;
}

- (void)setLiveTextButton:(id)a3
{
}

- (VKCVisualSearchCornerView)visualSearchCornerView
{
  return self->_visualSearchCornerView;
}

- (NSArray)quickActions
{
  return self->_quickActions;
}

- (void)setAllQuickActions:(id)a3
{
}

- (BOOL)quickActionsDisabled
{
  return self->_quickActionsDisabled;
}

- (BOOL)liveTextButtonDisabled
{
  return self->_liveTextButtonDisabled;
}

- (BOOL)visualSearchCornerViewDisabled
{
  return self->_visualSearchCornerViewDisabled;
}

- (BOOL)layoutUpdatesSuspended
{
  return self->_layoutUpdatesSuspended;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)shouldAnimateQuickActionVisibilityChanges
{
  return self->_shouldAnimateQuickActionVisibilityChanges;
}

- (void)setShouldAnimateQuickActionVisibilityChanges:(BOOL)a3
{
  self->_shouldAnimateQuickActionVisibilityChanges = a3;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)textButtonContainer
{
  return self->_textButtonContainer;
}

- (void)setTextButtonContainer:(id)a3
{
}

- (UIView)visualSearchContainer
{
  return self->_visualSearchContainer;
}

- (void)setVisualSearchContainer:(id)a3
{
}

- (UIView)moreButtonContainer
{
  return self->_moreButtonContainer;
}

- (void)setMoreButtonContainer:(id)a3
{
}

- (VKCActionInfoMoreButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
}

- (VKCActionInfoViewLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (void)setLayoutContext:(id)a3
{
}

- (BOOL)_quickActionsHidden
{
  return self->__quickActionsHidden;
}

- (BOOL)automaticVisualRectLayoutDisabled
{
  return self->_automaticVisualRectLayoutDisabled;
}

- (void)setAutomaticVisualRectLayoutDisabled:(BOOL)a3
{
  self->_automaticVisualRectLayoutDisabled = a3;
}

- (BOOL)alignQuickActionsWithVerticalCenter
{
  return self->_alignQuickActionsWithVerticalCenter;
}

- (void)setAlignQuickActionsWithVerticalCenter:(BOOL)a3
{
  self->_alignQuickActionsWithVerticalCenter = a3;
}

- (double)preferredQuickActionButtonHeight
{
  return self->_preferredQuickActionButtonHeight;
}

- (BOOL)wantsTranslucentActionInfoButtons
{
  return self->_wantsTranslucentActionInfoButtons;
}

- (void)setWantsTranslucentActionInfoButtons:(BOOL)a3
{
  self->_wantsTranslucentActionInfoButtons = a3;
}

- (id)quickActionConfigurationUpdateHandler
{
  return self->_quickActionConfigurationUpdateHandler;
}

- (BOOL)isShowingSingleTapMoreButtonMenu
{
  return self->_isShowingSingleTapMoreButtonMenu;
}

- (void)setIsShowingSingleTapMoreButtonMenu:(BOOL)a3
{
  self->_isShowingSingleTapMoreButtonMenu = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_quickActionConfigurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_moreButtonContainer, 0);
  objc_storeStrong((id *)&self->_visualSearchContainer, 0);
  objc_storeStrong((id *)&self->_textButtonContainer, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_allQuickActions, 0);
  objc_storeStrong((id *)&self->_quickActions, 0);
  objc_storeStrong((id *)&self->_visualSearchCornerView, 0);
  objc_storeStrong((id *)&self->_liveTextButton, 0);
}

@end