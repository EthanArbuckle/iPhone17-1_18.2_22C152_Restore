@interface SBNoticePresentableElement
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
- (BNPresentable)presentable;
- (BNPresentable)templatePresentable;
- (BOOL)_canShowWhileLocked;
- (BOOL)handleElementViewEvent:(int64_t)a3;
- (BOOL)hasAlertBehavior;
- (BOOL)shouldSuppressElementWhileOnCoversheet;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (NSString)clientIdentifier;
- (NSString)elementIdentifier;
- (SAUILayoutHosting)layoutHost;
- (SBNoticePresentableElement)initWithTemplatePresentable:(id)a3;
- (UIColor)keyColor;
- (UIView)leadingView;
- (UIView)trailingView;
- (id)_primaryView;
- (id)_secondaryView;
- (id)_templateItemViewFromProvider:(id)a3 isPrimary:(BOOL)a4;
- (id)elementDescription;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)preferredLayoutMode;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_updateVisualStlyingOfView:(id)a3 fromProvider:(id)a4;
- (void)addElementLayoutSpecifierObserver:(id)a3;
- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5;
- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3;
- (void)removeElementLayoutSpecifierObserver:(id)a3;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
@end

@implementation SBNoticePresentableElement

- (SBNoticePresentableElement)initWithTemplatePresentable:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBNoticePresentableElement.m", 37, @"Invalid parameter not satisfying: %@", @"templatePresentable" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBNoticePresentableElement;
  v7 = [(SBNoticePresentableElement *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_presentable, a3);
    v8->_preferredLayoutMode = 2;
  }

  return v8;
}

- (BNPresentable)templatePresentable
{
  return self->_presentable;
}

- (NSString)elementIdentifier
{
  return (NSString *)[(BNPresentable *)self->_presentable requestIdentifier];
}

- (NSString)clientIdentifier
{
  v2 = [(BNPresentable *)self->_presentable requesterIdentifier];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringByAppendingFormat:@".%@", v4];

  return (NSString *)v5;
}

- (id)elementDescription
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"presentable";
  v2 = BNEffectivePresentableDescription();
  v7[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = SAElementIdentityDescription();

  return v4;
}

- (UIColor)keyColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithRed:0.425 green:0.414 blue:1.0 alpha:1.0];
}

- (BOOL)hasAlertBehavior
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  v4 = [(SBNoticePresentableElement *)self templatePresentable];
  if ((objc_opt_respondsToSelector() & 1) != 0 && (unint64_t)a3 <= 2) {
    [v4 handleTemplateContentEvent:a3];
  }

  return 0;
}

- (UIView)leadingView
{
  v3 = [(SBNoticePresentableElement *)self templatePresentable];
  if (!self->_leadingView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = [v3 leadingTemplateViewProvider];
    v5 = v4;
    if (v4)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __41__SBNoticePresentableElement_leadingView__block_invoke;
      v10[3] = &unk_1E6AFD330;
      v10[4] = self;
      SBTemplateItemViewFromProvider(v4, v10);
      id v6 = (UIView *)objc_claimAutoreleasedReturnValue();
      leadingView = self->_leadingView;
      self->_leadingView = v6;

      [(SBNoticePresentableElement *)self _updateVisualStlyingOfView:self->_leadingView fromProvider:v5];
    }
  }
  v8 = self->_leadingView;

  return v8;
}

id __41__SBNoticePresentableElement_leadingView__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__SBNoticePresentableElement_leadingView__block_invoke_2;
  v3[3] = &unk_1E6AFD308;
  v3[4] = *(void *)(a1 + 32);
  v1 = [MEMORY[0x1E4F426E8] actionWithHandler:v3];
  return v1;
}

uint64_t __41__SBNoticePresentableElement_leadingView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleElementViewEvent:1];
}

- (UIView)trailingView
{
  v3 = [(SBNoticePresentableElement *)self templatePresentable];
  if (!self->_trailingView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = [v3 trailingTemplateViewProvider];
    v5 = v4;
    if (v4)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __42__SBNoticePresentableElement_trailingView__block_invoke;
      v10[3] = &unk_1E6AFD330;
      v10[4] = self;
      SBTemplateItemViewFromProvider(v4, v10);
      id v6 = (UIView *)objc_claimAutoreleasedReturnValue();
      trailingView = self->_trailingView;
      self->_trailingView = v6;

      [(SBNoticePresentableElement *)self _updateVisualStlyingOfView:self->_trailingView fromProvider:v5];
    }
  }
  v8 = self->_trailingView;

  return v8;
}

id __42__SBNoticePresentableElement_trailingView__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__SBNoticePresentableElement_trailingView__block_invoke_2;
  v3[3] = &unk_1E6AFD308;
  v3[4] = *(void *)(a1 + 32);
  v1 = [MEMORY[0x1E4F426E8] actionWithHandler:v3];
  return v1;
}

uint64_t __42__SBNoticePresentableElement_trailingView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleElementViewEvent:2];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  int64_t layoutMode = self->_layoutMode;
  if (layoutMode != a3)
  {
    self->_int64_t layoutMode = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__SBNoticePresentableElement_setLayoutMode_reason___block_invoke;
    v5[3] = &unk_1E6AF8AB0;
    v5[4] = self;
    v5[5] = layoutMode;
    v5[6] = a4;
    [(SBNoticePresentableElement *)self _enumerateObserversRespondingToSelector:sel_elementLayoutSpecifier_layoutModeDidChange_reason_ usingBlock:v5];
  }
}

uint64_t __51__SBNoticePresentableElement_setLayoutMode_reason___block_invoke(void *a1, void *a2)
{
  return [a2 elementLayoutSpecifier:a1[4] layoutModeDidChange:a1[5] reason:a1[6]];
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double bottom = result.bottom;
  double leading = result.leading;
  CGFloat top = result.top;
  if (a3 == 3)
  {
    v9 = [(SBNoticePresentableElement *)self _primaryView];
    objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v11 = v10;

    v12 = [(SBNoticePresentableElement *)self _secondaryView];
    objc_msgSend(v12, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v14 = v13;

    double bottom = bottom - (v11 + 8.0);
    if (leading + leading <= leading - (v14 + 8.0)) {
      result.trailing = leading + leading;
    }
    else {
      result.trailing = leading - (v14 + 8.0);
    }
    double leading = result.trailing;
  }
  double v15 = top;
  double v16 = leading;
  double v17 = bottom;
  result.double bottom = v17;
  result.double leading = v16;
  result.CGFloat top = v15;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  [a3 bounds];
  if (self->_layoutMode == 3)
  {
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    uint64_t v11 = v7;
    [(UIView *)self->_leadingView frame];
    UIRectCenteredYInRectScale();
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    [(UIView *)self->_leadingView setFrame:0];
    [(UIView *)self->_trailingView frame];
    UIRectCenteredYInRectScale();
    [(UIView *)self->_trailingView setFrame:0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __71__SBNoticePresentableElement_layoutHostContainerViewDidLayoutSubviews___block_invoke;
    v29[3] = &unk_1E6AFA478;
    v29[4] = self;
    v29[5] = v8;
    v29[6] = v9;
    v29[7] = v10;
    v29[8] = v11;
    v29[9] = v13;
    v29[10] = v15;
    v29[11] = v17;
    v29[12] = v19;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v29];
  }
  v20 = [(SBNoticePresentableElement *)self trailingView];
  v21 = v20;
  if (self->_layoutMode >= 3) {
    double v22 = 1.0;
  }
  else {
    double v22 = 0.0;
  }
  [v20 setAlpha:v22];

  v23 = [(SBNoticePresentableElement *)self _primaryView];
  v24 = v23;
  if (self->_layoutMode >= 3) {
    double v25 = 1.0;
  }
  else {
    double v25 = 0.0;
  }
  [v23 setAlpha:v25];

  v26 = [(SBNoticePresentableElement *)self _secondaryView];
  v27 = v26;
  if (self->_layoutMode >= 3) {
    double v28 = 1.0;
  }
  else {
    double v28 = 0.0;
  }
  [v26 setAlpha:v28];
}

uint64_t __71__SBNoticePresentableElement_layoutHostContainerViewDidLayoutSubviews___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v3 = v2;
  BSRectWithSize();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v8 = CGRectGetMaxX(*(CGRect *)(a1 + 72)) + 8.0;
  CGFloat v9 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) + -8.0 - v3;
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 8);
  UIRectIntegralWithScale();
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  BSRectWithSize();
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v5;
  v14.size.height = v7;
  CGRectGetMinX(v14);
  v15.origin.x = v8;
  v15.origin.y = v9;
  v15.size.width = v5;
  v15.size.height = v7;
  CGRectGetMinY(v15);
  uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 16);
  UIRectIntegralWithScale();
  return objc_msgSend(v11, "setFrame:");
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (self->_layoutMode == 3)
  {
    CGFloat v9 = (void *)MEMORY[0x1E4F42FF0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __104__SBNoticePresentableElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
    v13[3] = &unk_1E6AF5290;
    id v14 = v7;
    CGRect v15 = self;
    [v9 performWithoutAnimation:v13];
  }
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__SBNoticePresentableElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2;
  v10[3] = &unk_1E6AFD358;
  objc_copyWeak(&v11, &location);
  [v8 animateAlongsideTransition:0 completion:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __104__SBNoticePresentableElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) _primaryView];
  [v2 addSubview:v3];

  double v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) _secondaryView];
  [v4 addSubview:v5];
}

void __104__SBNoticePresentableElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    BOOL v2 = [WeakRetained layoutMode] <= 2;
    WeakRetained = v3;
    if (v2)
    {
      [v3[1] removeFromSuperview];
      [v3[2] removeFromSuperview];
      WeakRetained = v3;
    }
  }
}

- (void)addElementLayoutSpecifierObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      double v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeElementLayoutSpecifierObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  id v7 = [MEMORY[0x1E4F42A38] defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  uint64_t v16 = *MEMORY[0x1E4F43848];
  uint64_t v14 = *MEMORY[0x1E4F43940];
  id v8 = [NSNumber numberWithDouble:a5];
  CGRect v15 = v8;
  CGFloat v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v11 = [v7 fontDescriptorByAddingAttributes:v10];

  uint64_t v12 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (id)_templateItemViewFromProvider:(id)a3 isPrimary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v6 templateItemText];
    }
    else
    {
      uint64_t v7 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [v6 templateItemAttributedText];
    }
    else
    {
      uint64_t v9 = 0;
    }
    if (!(v7 | v9)) {
      goto LABEL_18;
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    id v8 = v10;
    if (v7) {
      [v10 setText:v7];
    }
    else {
      [v10 setAttributedText:v9];
    }
    id v11 = objc_opt_class();
    uint64_t v12 = (void *)MEMORY[0x1E4F438C0];
    if (!v4) {
      uint64_t v12 = (void *)MEMORY[0x1E4F43888];
    }
    uint64_t v13 = [v11 _preferredFont:1 textStyle:*v12 weight:0 additionalTraits:*MEMORY[0x1E4F43920]];
    [v8 setFont:v13];

    if (!v4)
    {
      uint64_t v14 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
      [v8 setColor:v14];
    }
    if (!v8)
    {
LABEL_18:
      if (objc_opt_respondsToSelector())
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __70__SBNoticePresentableElement__templateItemViewFromProvider_isPrimary___block_invoke;
        v16[3] = &unk_1E6AFD330;
        v16[4] = self;
        id v8 = SBTemplateItemViewFromProvider(v6, v16);
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __70__SBNoticePresentableElement__templateItemViewFromProvider_isPrimary___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__SBNoticePresentableElement__templateItemViewFromProvider_isPrimary___block_invoke_2;
  v3[3] = &unk_1E6AFD308;
  v3[4] = *(void *)(a1 + 32);
  v1 = [MEMORY[0x1E4F426E8] actionWithHandler:v3];
  return v1;
}

uint64_t __70__SBNoticePresentableElement__templateItemViewFromProvider_isPrimary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleElementViewEvent:0];
}

- (void)_updateVisualStlyingOfView:(id)a3 fromProvider:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if ([v5 visualStyleCategory])
  {
    if ([v5 visualStyle] != -1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v10;
        uint64_t v7 = [v6 configuration];
        id v8 = [v7 background];
        uint64_t v9 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
        [v8 setBackgroundColor:v9];

        [v7 setBackground:v8];
        [v6 setConfiguration:v7];
      }
    }
  }
}

- (id)_primaryView
{
  double v3 = [(SBNoticePresentableElement *)self templatePresentable];
  if (!self->_primaryView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v4 = [v3 primaryTemplateItemProvider];
    id v5 = [(SBNoticePresentableElement *)self _templateItemViewFromProvider:v4 isPrimary:1];
    primaryView = self->_primaryView;
    self->_primaryView = v5;

    [(SBNoticePresentableElement *)self _updateVisualStlyingOfView:self->_primaryView fromProvider:v4];
  }
  uint64_t v7 = self->_primaryView;

  return v7;
}

- (id)_secondaryView
{
  double v3 = [(SBNoticePresentableElement *)self templatePresentable];
  if (!self->_secondaryView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v4 = [v3 secondaryTemplateItemProvider];
    id v5 = [(SBNoticePresentableElement *)self _templateItemViewFromProvider:v4 isPrimary:0];
    secondaryView = self->_secondaryView;
    self->_secondaryView = v5;

    [(SBNoticePresentableElement *)self _updateVisualStlyingOfView:self->_secondaryView fromProvider:v4];
  }
  uint64_t v7 = self->_secondaryView;

  return v7;
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a4;
  if (v5 && [(NSHashTable *)self->_observers count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (void)setLayoutHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
}

@end