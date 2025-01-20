@interface STUIStatusBarRegion
- (BOOL)disableItemFrameBasedOverflow;
- (BOOL)disableWithToken:(unint64_t)a3;
- (BOOL)enableWithToken:(unint64_t)a3;
- (BOOL)hoverHighlightsAsRegion;
- (BOOL)isEnabled;
- (BOOL)isFrozen;
- (BOOL)needsReLayout;
- (BOOL)offsetable;
- (CGRect)absoluteHoverFrame;
- (NSArray)currentEnabledDisplayItems;
- (NSArray)enabledDisplayItems;
- (NSDictionary)displayItemAbsoluteFrames;
- (NSDictionary)displayItemAbsolutePresentationFrames;
- (NSDirectionalEdgeInsets)extendedHoverInsets;
- (NSLayoutConstraint)centerXConstraint;
- (NSLayoutConstraint)centerYConstraint;
- (NSMutableIndexSet)disablingTokens;
- (NSOrderedSet)displayItems;
- (NSSet)dependentRegionIdentifiers;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (STUIStatusBar)statusBar;
- (STUIStatusBarAction)action;
- (STUIStatusBarAction)hoverAction;
- (STUIStatusBarDisplayItem)overflowedDisplayItem;
- (STUIStatusBarRegion)enabilityRegion;
- (STUIStatusBarRegion)initWithIdentifier:(id)a3;
- (STUIStatusBarRegionLayout)layout;
- (STUIStatusBarStyleAttributes)overriddenStyleAttributes;
- (UIEdgeInsets)actionInsets;
- (UILayoutGuide)layoutGuide;
- (UILayoutItem)containerItem;
- (UILayoutItem)layoutItem;
- (UIOffset)offset;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)contentView;
- (UIView)frozenView;
- (UIView)highlightView;
- (UIView)hoverView;
- (double)alpha;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayItemForHUDAtLocation:(CGPoint)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)automaticStyle;
- (int64_t)effectiveStyle;
- (int64_t)overriddenStyle;
- (int64_t)style;
- (void)_addSubview:(id)a3 atBack:(BOOL)a4;
- (void)_overriddenStyleAttributesChanged;
- (void)setAction:(id)a3;
- (void)setActionInsets:(UIEdgeInsets)a3;
- (void)setAlpha:(double)a3;
- (void)setAutomaticStyle:(int64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCenterXConstraint:(id)a3;
- (void)setCenterYConstraint:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDependentRegionIdentifiers:(id)a3;
- (void)setDisableItemFrameBasedOverflow:(BOOL)a3;
- (void)setDisablingTokens:(id)a3;
- (void)setDisplayItems:(id)a3;
- (void)setEnabilityRegion:(id)a3;
- (void)setExtendedHoverInsets:(NSDirectionalEdgeInsets)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setFrozenView:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHoverAction:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setNeedsReLayout:(BOOL)a3;
- (void)setOffset:(UIOffset)a3;
- (void)setOffsetable:(BOOL)a3;
- (void)setOverriddenStyle:(int64_t)a3;
- (void)setOverriddenStyleAttributes:(id)a3;
- (void)setStatusBar:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation STUIStatusBarRegion

- (BOOL)isEnabled
{
  p_enabilityRegion = &self->_enabilityRegion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enabilityRegion);
  BOOL result = (!WeakRetained
         || (v5 = WeakRetained,
             id v6 = objc_loadWeakRetained((id *)p_enabilityRegion),
             int v7 = [v6 isEnabled],
             v6,
             v5,
             v7))
        && [(NSMutableIndexSet *)self->_disablingTokens count] == 0;
  return result;
}

- (NSOrderedSet)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v4 = (NSOrderedSet *)a3;
  displayItems = self->_displayItems;
  if (displayItems != v4 && ([(NSOrderedSet *)displayItems isEqual:v4] & 1) == 0)
  {
    self->_BOOL needsReLayout = 0;
    goto LABEL_16;
  }
  BOOL needsReLayout = self->_needsReLayout;
  self->_BOOL needsReLayout = 0;
  if (needsReLayout) {
    goto LABEL_16;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int v7 = v4;
  uint64_t v8 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v8)
  {
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      if ([v13 needsAddingToLayout])
      {
        [v13 setNeedsAddingToLayout:0];
        char v10 = 1;
      }
    }
    uint64_t v9 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v9);

  if (v10)
  {
LABEL_16:
    v14 = self->_displayItems;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __39__STUIStatusBarRegion_setDisplayItems___block_invoke;
    v38[3] = &unk_1E6AA42E8;
    v15 = v4;
    v39 = v15;
    v40 = self;
    [(NSOrderedSet *)v14 enumerateObjectsUsingBlock:v38];
    v16 = (NSOrderedSet *)[(NSOrderedSet *)v15 copy];
    v17 = self->_displayItems;
    self->_displayItems = v16;

    v18 = [(STUIStatusBarRegion *)self enabledDisplayItems];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v19 = self->_layout,
          [(STUIStatusBarRegion *)self containerItem],
          v20 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v19) = [(STUIStatusBarRegionLayout *)v19 mayFitDisplayItems:v18 inContainerItem:v20], v20, (v19 & 1) == 0))
    {
      v22 = (NSOrderedSet *)[(NSOrderedSet *)self->_displayItems mutableCopy];
      v21 = (void *)[v18 mutableCopy];
      do
      {
        uint64_t v23 = STUIStatusBarGetLowestPrioritizedItem(v21);
        if (!v23) {
          break;
        }
        v24 = (void *)v23;
        [v21 removeObject:v23];
        [(NSOrderedSet *)v22 removeObject:v24];
        [v24 setContainerView:0];
        [v24 setRegion:0];

        layout = self->_layout;
        v26 = [(STUIStatusBarRegion *)self containerItem];
        LODWORD(layout) = [(STUIStatusBarRegionLayout *)layout mayFitDisplayItems:v21 inContainerItem:v26];
      }
      while (!layout);
      v27 = self->_displayItems;
      self->_displayItems = v22;
    }
    else
    {
      v21 = v18;
    }
    contentView = self->_contentView;
    if (contentView)
    {
      v29 = contentView;
    }
    else
    {
      v29 = [(UILayoutGuide *)self->_layoutGuide owningView];
    }
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __39__STUIStatusBarRegion_setDisplayItems___block_invoke_2;
    v35 = &unk_1E6AA42E8;
    v36 = v29;
    v37 = self;
    v30 = v29;
    [v21 enumerateObjectsUsingBlock:&v32];
    v31 = [(STUIStatusBarRegion *)self enabledDisplayItems];
    [(STUIStatusBarRegionLayout *)self->_layout setDisplayItems:v31];

    int v7 = v39;
    goto LABEL_27;
  }
LABEL_28:
}

- (UILayoutItem)containerItem
{
  if (self->_offsetable || (layoutGuide = self->_contentView) == 0) {
    layoutGuide = self->_layoutGuide;
  }
  id v3 = layoutGuide;
  return (UILayoutItem *)v3;
}

- (STUIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (int64_t)effectiveStyle
{
  int64_t result = self->_overriddenStyle;
  if (result == 4)
  {
    int64_t result = self->_style;
    if (result == 4)
    {
      v4 = [(STUIStatusBarRegion *)self statusBar];
      int v5 = [v4 _useAutomaticStyle];

      uint64_t v6 = 80;
      if (v5) {
        uint64_t v6 = 88;
      }
      return *(int64_t *)((char *)&self->super.isa + v6);
    }
  }
  return result;
}

- (STUIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (STUIStatusBar *)WeakRetained;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)disableItemFrameBasedOverflow
{
  return self->_disableItemFrameBasedOverflow;
}

- (STUIStatusBarDisplayItem)overflowedDisplayItem
{
  if ([(STUIStatusBarRegionLayout *)self->_layout fitsAllItems])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = STUIStatusBarGetLowestPrioritizedItem(self->_displayItems);
  }
  return (STUIStatusBarDisplayItem *)v3;
}

uint64_t __42__STUIStatusBarRegion_enabledDisplayItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled]) {
    uint64_t v3 = [v2 floating] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (UILayoutItem)layoutItem
{
  contentView = self->_contentView;
  if (!contentView) {
    contentView = self->_layoutGuide;
  }
  id v3 = contentView;
  return (UILayoutItem *)v3;
}

- (STUIStatusBarRegion)initWithIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)STUIStatusBarRegion;
  int v5 = [(STUIStatusBarRegion *)&v15 init];
  identifier = v5->_identifier;
  v5->_identifier = v4;
  int v7 = v4;

  uint64_t v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  layoutGuide = v5->_layoutGuide;
  v5->_layoutGuide = v8;

  char v10 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  displayItems = v5->_displayItems;
  v5->_displayItems = v10;

  uint64_t v12 = [MEMORY[0x1E4F28E60] indexSet];
  disablingTokens = v5->_disablingTokens;
  v5->_disablingTokens = (NSMutableIndexSet *)v12;

  v5->_style = 4;
  v5->_overriddenStyle = 4;
  return v5;
}

- (void)setLayout:(id)a3
{
  int v5 = (STUIStatusBarRegionLayout *)a3;
  p_layout = &self->_layout;
  layout = self->_layout;
  uint64_t v9 = v5;
  if (layout != v5)
  {
    if (layout)
    {
      [(STUIStatusBarRegionLayout *)layout setRegion:0];
      [(STUIStatusBarRegionLayout *)*p_layout setDisplayItems:MEMORY[0x1E4F1CBF0]];
    }
    objc_storeStrong((id *)&self->_layout, a3);
    if (*p_layout)
    {
      [(STUIStatusBarRegionLayout *)*p_layout setRegion:self];
      uint64_t v8 = [(STUIStatusBarRegion *)self currentEnabledDisplayItems];
      [(STUIStatusBarRegionLayout *)self->_layout setDisplayItems:v8];
    }
  }
}

- (NSArray)enabledDisplayItems
{
  displayItems = self->_displayItems;
  id v3 = [(NSOrderedSet *)displayItems indexesOfObjectsPassingTest:&__block_literal_global_5];
  v4 = [(NSOrderedSet *)displayItems objectsAtIndexes:v3];

  return (NSArray *)v4;
}

- (NSArray)currentEnabledDisplayItems
{
  displayItems = self->_displayItems;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__STUIStatusBarRegion_currentEnabledDisplayItems__block_invoke;
  v6[3] = &unk_1E6AA3B30;
  v6[4] = self;
  id v3 = [(NSOrderedSet *)displayItems indexesOfObjectsPassingTest:v6];
  v4 = [(NSOrderedSet *)displayItems objectsAtIndexes:v3];

  return (NSArray *)v4;
}

- (void)setOffsetable:(BOOL)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  if (self->_offsetable != a3)
  {
    self->_offsetable = a3;
    if (a3)
    {
      if (!self->_contentView)
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        [(STUIStatusBarRegion *)self setContentView:v4];
      }
      int v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
      layoutGuide = self->_layoutGuide;
      self->_layoutGuide = v5;

      [(UIView *)self->_contentView addLayoutGuide:self->_layoutGuide];
      int v7 = [(UILayoutGuide *)self->_layoutGuide centerXAnchor];
      uint64_t v8 = [(UIView *)self->_contentView centerXAnchor];
      uint64_t v9 = [v7 constraintEqualToAnchor:v8];
      centerXConstraint = self->_centerXConstraint;
      self->_centerXConstraint = v9;

      uint64_t v11 = [(UILayoutGuide *)self->_layoutGuide centerYAnchor];
      uint64_t v12 = [(UIView *)self->_contentView centerYAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      centerYConstraint = self->_centerYConstraint;
      self->_centerYConstraint = v13;

      objc_super v15 = (void *)MEMORY[0x1E4F28DC8];
      v16 = self->_centerYConstraint;
      v17 = self->_layoutGuide;
      v25[0] = self->_centerXConstraint;
      v25[1] = v16;
      v18 = [(UILayoutGuide *)v17 widthAnchor];
      v19 = [(UIView *)self->_contentView widthAnchor];
      v20 = [v18 constraintEqualToAnchor:v19];
      v25[2] = v20;
      v21 = [(UILayoutGuide *)self->_layoutGuide heightAnchor];
      v22 = [(UIView *)self->_contentView heightAnchor];
      uint64_t v23 = [v21 constraintEqualToAnchor:v22];
      v25[3] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
      [v15 activateConstraints:v24];
    }
  }
}

- (void)setActionInsets:(UIEdgeInsets)a3
{
  self->_actionInsets = a3;
}

- (void)setOverriddenStyleAttributes:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overriddenStyleAttributes, a3);
    [(STUIStatusBarRegion *)self _overriddenStyleAttributesChanged];
  }
}

- (void)_overriddenStyleAttributesChanged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(STUIStatusBarRegion *)self currentEnabledDisplayItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) item];
        [v7 setNeedsUpdate];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setDisableItemFrameBasedOverflow:(BOOL)a3
{
  self->_disableItemFrameBasedOverflow = a3;
}

- (STUIStatusBarAction)action
{
  return self->_action;
}

- (BOOL)disableWithToken:(unint64_t)a3
{
  char v5 = -[NSMutableIndexSet containsIndex:](self->_disablingTokens, "containsIndex:");
  if ((v5 & 1) == 0) {
    [(NSMutableIndexSet *)self->_disablingTokens addIndex:a3];
  }
  return v5 ^ 1;
}

- (void)setContentView:(id)a3
{
  char v5 = (UIView *)a3;
  p_contentView = (void **)&self->_contentView;
  if (self->_contentView != v5)
  {
    long long v11 = v5;
    int v7 = [(STUIStatusBarRegion *)self layoutItem];
    objc_msgSend(v7, "_ui_removeFromParentLayoutItem");

    if (v11)
    {
      objc_storeStrong((id *)&self->_contentView, a3);
      [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
      p_contentView = (void **)&self->_layoutGuide;
    }
    else
    {
      long long v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
      layoutGuide = self->_layoutGuide;
      self->_layoutGuide = v8;
    }
    long long v10 = *p_contentView;
    *p_contentView = 0;

    char v5 = v11;
  }
}

- (BOOL)enableWithToken:(unint64_t)a3
{
  int v5 = -[NSMutableIndexSet containsIndex:](self->_disablingTokens, "containsIndex:");
  if (v5) {
    [(NSMutableIndexSet *)self->_disablingTokens removeIndex:a3];
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setStatusBar:(id)a3
{
}

uint64_t __39__STUIStatusBarRegion_setDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([*(id *)(a1 + 32) containsObject:v7] & 1) == 0)
  {
    uint64_t v3 = [v7 region];
    uint64_t v4 = v3;
    if (v3 == *(void **)(a1 + 40))
    {
      char v5 = [v7 floating];

      if ((v5 & 1) == 0)
      {
        [v7 setContainerView:0];
        [v7 setRegion:0];
      }
    }
    else
    {
    }
  }
  return MEMORY[0x1F41817F8]();
}

void __39__STUIStatusBarRegion_setDisplayItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setContainerView:v3];
  [v4 setRegion:*(void *)(a1 + 40)];
}

- (int64_t)style
{
  return self->_style;
}

- (NSDictionary)displayItemAbsolutePresentationFrames
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(STUIStatusBarRegion *)self layout];
  char v5 = [v4 displayItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__STUIStatusBarRegion_displayItemAbsolutePresentationFrames__block_invoke;
  v8[3] = &unk_1E6AA3738;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return (NSDictionary *)v6;
}

- (STUIStatusBarRegionLayout)layout
{
  return self->_layout;
}

void __60__STUIStatusBarRegion_displayItemAbsolutePresentationFrames__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 view];
  id v4 = [v3 window];

  if (v4)
  {
    char v5 = (void *)MEMORY[0x1E4F29238];
    [v9 absolutePresentationFrame];
    id v6 = objc_msgSend(v5, "valueWithCGRect:");
    id v7 = *(void **)(a1 + 32);
    long long v8 = [v9 identifier];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (void)setAutomaticStyle:(int64_t)a3
{
  if (self->_automaticStyle != a3)
  {
    self->_automaticStyle = a3;
    if (self->_overriddenStyle == 4)
    {
      id v5 = [(STUIStatusBarRegion *)self statusBar];
      if ([v5 style])
      {
      }
      else
      {
        int64_t style = self->_style;

        if (style == 4)
        {
          [(STUIStatusBarRegion *)self _overriddenStyleAttributesChanged];
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_centerYConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_disablingTokens, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, 0);
  objc_destroyWeak((id *)&self->_enabilityRegion);
  objc_storeStrong((id *)&self->_dependentRegionIdentifiers, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hoverAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

BOOL __49__STUIStatusBarRegion_currentEnabledDisplayItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled] && (objc_msgSend(v3, "floating") & 1) == 0)
  {
    id v5 = [v3 region];
    BOOL v4 = v5 == *(void **)(a1 + 32);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarRegion *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STUIStatusBarRegion *)self debugDescriptionWithMultilinePrefix:0];
}

- (UIView)hoverView
{
  contentView = self->_contentView;
  if (!contentView) {
    contentView = self->_backgroundView;
  }
  id v3 = contentView;
  return v3;
}

- (BOOL)hoverHighlightsAsRegion
{
  return 1;
}

- (CGRect)absoluteHoverFrame
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [(STUIStatusBarRegion *)self layout];
  id v3 = [v2 displayItems];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    double v8 = 1.79769313e308;
    double v9 = 2.22507386e-308;
    double v10 = 2.22507386e-308;
    double v11 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "absoluteFrame", (void)v27);
        CGFloat x = v33.origin.x;
        CGFloat y = v33.origin.y;
        CGFloat width = v33.size.width;
        CGFloat height = v33.size.height;
        double MinX = CGRectGetMinX(v33);
        if (v11 >= MinX) {
          double v11 = MinX;
        }
        v34.origin.CGFloat x = x;
        v34.origin.CGFloat y = y;
        v34.size.CGFloat width = width;
        v34.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v34);
        if (v8 >= MinY) {
          double v8 = MinY;
        }
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v35);
        if (v10 < MaxX) {
          double v10 = MaxX;
        }
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v36);
        if (v9 < MaxY) {
          double v9 = MaxY;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 1.79769313e308;
    double v9 = 2.22507386e-308;
    double v10 = 2.22507386e-308;
    double v11 = 1.79769313e308;
  }

  if ([v4 count])
  {
    double v21 = v10 - v11;
    double v22 = v9 - v8;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v23 = v11;
  double v24 = v8;
  double v25 = v21;
  double v26 = v22;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  if (self->_identifier != v6)
  {
    objc_storeStrong((id *)&self->_identifier, a3);
    uint64_t v5 = [(STUIStatusBarRegion *)self layoutGuide];
    [v5 setIdentifier:v6];
  }
}

- (void)setOffset:(UIOffset)a3
{
  if (self->_offsetable)
  {
    double vertical = a3.vertical;
    if (a3.horizontal != self->_offset.horizontal || a3.vertical != self->_offset.vertical)
    {
      self->_offset = a3;
      -[NSLayoutConstraint setConstant:](self->_centerXConstraint, "setConstant:");
      centerYConstraint = self->_centerYConstraint;
      [(NSLayoutConstraint *)centerYConstraint setConstant:vertical];
    }
  }
}

- (void)_addSubview:(id)a3 atBack:(BOOL)a4
{
  BOOL v4 = a4;
  v23[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = [(STUIStatusBarRegion *)self layoutItem];
  double v8 = objc_msgSend(v7, "_ui_superview");
  double v22 = v8;
  if (v4)
  {
    [v8 insertSubview:v6 atIndex:0];
  }
  else if (self->_contentView)
  {
    objc_msgSend(v8, "insertSubview:aboveSubview:", v6);
  }
  else
  {
    [v8 addSubview:v6];
  }
  double v21 = [v6 topAnchor];
  v20 = [v7 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v23[0] = v19;
  v18 = [v6 leftAnchor];
  v17 = [v7 leftAnchor];
  double v9 = [v18 constraintEqualToAnchor:v17];
  v23[1] = v9;
  double v10 = [v6 bottomAnchor];
  double v11 = [v7 bottomAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  v23[2] = v12;
  uint64_t v13 = [v6 rightAnchor];
  v14 = [v7 rightAnchor];
  objc_super v15 = [v13 constraintEqualToAnchor:v14];
  v23[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v16];
}

- (void)setBackgroundView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    uint64_t v7 = v5;
    if (v5)
    {
      [(STUIStatusBarRegion *)self _addSubview:v5 atBack:1];
      backgroundView = self->_backgroundView;
    }
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](backgroundView, v5);
}

- (void)setHighlightView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  highlightView = self->_highlightView;
  if (highlightView != v5)
  {
    uint64_t v7 = v5;
    if (v5)
    {
      [(STUIStatusBarRegion *)self _addSubview:v5 atBack:0];
      highlightView = self->_highlightView;
    }
    [(UIView *)highlightView removeFromSuperview];
    objc_storeStrong((id *)&self->_highlightView, a3);
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](highlightView, v5);
}

- (void)setFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  v24[2] = *MEMORY[0x1E4F143B8];
  if ([(STUIStatusBarRegion *)self isFrozen] != a3)
  {
    if (v3)
    {
      [(UIView *)self->_contentView bounds];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      [(UIView *)self->_contentView alpha];
      double v14 = v13;
      [(UIView *)self->_contentView setAlpha:1.0];
      objc_super v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C40]), "initWithFrame:", v6, v8, v10, v12);
      objc_msgSend(v15, "captureSnapshotRect:fromView:withSnapshotType:", self->_contentView, 0, v6, v8, v10, v12);
      [(STUIStatusBarRegion *)self setFrozenView:v15];
      [(UIView *)self->_frozenView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_frozenView setAlpha:v14];
      [(STUIStatusBarRegion *)self _addSubview:self->_frozenView atBack:1];
      v16 = [(UIView *)self->_frozenView widthAnchor];
      v26.origin.CGFloat x = v6;
      v26.origin.CGFloat y = v8;
      v26.size.CGFloat width = v10;
      v26.size.CGFloat height = v12;
      v17 = [v16 constraintEqualToConstant:CGRectGetWidth(v26)];
      v24[0] = v17;
      v18 = [(UIView *)self->_frozenView heightAnchor];
      v27.origin.CGFloat x = v6;
      v27.origin.CGFloat y = v8;
      v27.size.CGFloat width = v10;
      v27.size.CGFloat height = v12;
      v19 = [v18 constraintEqualToConstant:CGRectGetHeight(v27)];
      v24[1] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

      [MEMORY[0x1E4F28DC8] activateConstraints:v20];
      [(UIView *)self->_contentView setAlpha:0.0];
    }
    else
    {
      [(UIView *)self->_frozenView alpha];
      double v22 = v21;
      double v23 = [(STUIStatusBarRegion *)self containerView];
      [v23 setAlpha:v22];

      [(UIView *)self->_frozenView removeFromSuperview];
      [(STUIStatusBarRegion *)self setFrozenView:0];
    }
  }
}

- (BOOL)isFrozen
{
  return self->_frozenView != 0;
}

- (void)setAlpha:(double)a3
{
  BOOL v5 = [(STUIStatusBarRegion *)self isFrozen];
  uint64_t v6 = 112;
  if (v5) {
    uint64_t v6 = 184;
  }
  double v7 = *(Class *)((char *)&self->super.isa + v6);
  [v7 setAlpha:a3];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_int64_t style = a3;
    if (self->_overriddenStyle == 4) {
      [(STUIStatusBarRegion *)self _overriddenStyleAttributesChanged];
    }
  }
}

- (void)setOverriddenStyle:(int64_t)a3
{
  if (self->_overriddenStyle != a3)
  {
    self->_overriddenStyle = a3;
    [(STUIStatusBarRegion *)self _overriddenStyleAttributesChanged];
  }
}

- (NSDictionary)displayItemAbsoluteFrames
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = [(STUIStatusBarRegion *)self layout];
  BOOL v5 = [v4 displayItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__STUIStatusBarRegion_displayItemAbsoluteFrames__block_invoke;
  v8[3] = &unk_1E6AA3738;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return (NSDictionary *)v6;
}

void __48__STUIStatusBarRegion_displayItemAbsoluteFrames__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  BOOL v3 = [v9 view];
  BOOL v4 = [v3 window];

  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x1E4F29238];
    [v9 absoluteFrame];
    id v6 = objc_msgSend(v5, "valueWithCGRect:");
    double v7 = *(void **)(a1 + 32);
    double v8 = [v9 identifier];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (id)displayItemForHUDAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [(STUIStatusBarRegion *)self layout];
  double v7 = [v6 displayItems];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v30;
    double v12 = 1.79769313e308;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v7);
      }
      double v14 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
      objc_super v15 = [v14 view];
      [v15 frame];
      if (CGRectIsEmpty(v36)) {
        goto LABEL_18;
      }
      v16 = [(STUIStatusBarRegion *)self statusBar];
      objc_msgSend(v16, "convertPoint:toView:", v15, x, y);
      double v18 = v17;

      [v15 bounds];
      if (objc_msgSend(v15, "pointInside:withEvent:", 0, v18, CGRectGetMidY(v37)))
      {
        id v27 = v14;

        goto LABEL_24;
      }
      [v15 bounds];
      double MinX = CGRectGetMinX(v38);
      [v15 bounds];
      if (v18 <= MinX) {
        break;
      }
      if (v18 >= CGRectGetMaxX(*(CGRect *)&v20))
      {
        [v15 bounds];
        double v24 = v18 - CGRectGetMaxX(v39);
        goto LABEL_12;
      }
LABEL_18:

      if (v9 == ++v13)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_23;
      }
    }
    double v24 = CGRectGetMinX(*(CGRect *)&v20) - v18;
LABEL_12:
    if (v24 < 6.0 && v24 < v12)
    {
      id v26 = v14;

      id v10 = v26;
      double v12 = v24;
    }
    goto LABEL_18;
  }
  id v10 = 0;
LABEL_23:

  id v10 = v10;
  id v27 = v10;
LABEL_24:

  return v27;
}

- (id)succinctDescription
{
  id v2 = [(STUIStatusBarRegion *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  BOOL v4 = [(STUIStatusBarRegion *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"identifier"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarRegion isEnabled](self, "isEnabled"), @"enabled");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(STUIStatusBarRegion *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(STUIStatusBarRegion *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarRegion *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(STUIStatusBarRegion *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  uint64_t v8 = [(STUIStatusBarRegion *)self displayItems];
  uint64_t v9 = [v8 array];
  [v7 appendArraySection:v9 withName:@"displayItems" skipIfEmpty:1];

  return v7;
}

- (void)setAction:(id)a3
{
}

- (UIEdgeInsets)actionInsets
{
  double top = self->_actionInsets.top;
  double left = self->_actionInsets.left;
  double bottom = self->_actionInsets.bottom;
  double right = self->_actionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (STUIStatusBarAction)hoverAction
{
  return self->_hoverAction;
}

- (void)setHoverAction:(id)a3
{
}

- (NSDirectionalEdgeInsets)extendedHoverInsets
{
  double top = self->_extendedHoverInsets.top;
  double leading = self->_extendedHoverInsets.leading;
  double bottom = self->_extendedHoverInsets.bottom;
  double trailing = self->_extendedHoverInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setExtendedHoverInsets:(NSDirectionalEdgeInsets)a3
{
  self->_extendedHoverInsets = a3;
}

- (NSSet)dependentRegionIdentifiers
{
  return self->_dependentRegionIdentifiers;
}

- (void)setDependentRegionIdentifiers:(id)a3
{
}

- (STUIStatusBarRegion)enabilityRegion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enabilityRegion);
  return (STUIStatusBarRegion *)WeakRetained;
}

- (void)setEnabilityRegion:(id)a3
{
}

- (BOOL)offsetable
{
  return self->_offsetable;
}

- (UIOffset)offset
{
  double horizontal = self->_offset.horizontal;
  double vertical = self->_offset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (double)alpha
{
  return self->_alpha;
}

- (int64_t)automaticStyle
{
  return self->_automaticStyle;
}

- (int64_t)overriddenStyle
{
  return self->_overriddenStyle;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (BOOL)needsReLayout
{
  return self->_needsReLayout;
}

- (void)setNeedsReLayout:(BOOL)a3
{
  self->_BOOL needsReLayout = a3;
}

- (NSMutableIndexSet)disablingTokens
{
  return self->_disablingTokens;
}

- (void)setDisablingTokens:(id)a3
{
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)centerXConstraint
{
  return self->_centerXConstraint;
}

- (void)setCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)centerYConstraint
{
  return self->_centerYConstraint;
}

- (void)setCenterYConstraint:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)frozenView
{
  return self->_frozenView;
}

- (void)setFrozenView:(id)a3
{
}

@end