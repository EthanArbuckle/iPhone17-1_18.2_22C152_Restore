@interface UICellAccessoryManager
- (BOOL)needsLayout;
- (CGRect)_updateAccessories:(id)a3 previousAccessories:(id)a4 withLayout:(id)a5 edge:(unint64_t)a6;
- (CGRect)containerBounds;
- (CGRect)contentFrame;
- (CGSize)containerSize;
- (CGSize)previousContainerSize;
- (NSDictionary)configurations;
- (NSMutableDictionary)accessoryViews;
- (NSString)currentConfigurationIdentifier;
- (UICellAccessoryConfiguration)currentConfiguration;
- (UICellAccessoryConfiguration)previousConfiguration;
- (UICellAccessoryLayout)leadingLayout;
- (UICellAccessoryLayout)trailingLayout;
- (UICellAccessoryManager)initWithContainerView:(id)a3;
- (UIEdgeInsets)contentInset;
- (UIEdgeInsets)safeAreaInsets;
- (UIView)containerView;
- (id)_configurationWithIdentifier:(id)a3;
- (id)description;
- (id)disclosureLayoutWidthProvider;
- (id)standardLayoutWidthProvider;
- (int64_t)animatedLayoutUpdatesCount;
- (void)_updateFromPreviousConfiguration:(id)a3;
- (void)layoutIfNeeded;
- (void)performWithEnforcedContainerSize:(CGSize)a3 block:(id)a4;
- (void)setAccessoryViews:(id)a3;
- (void)setAnimatedLayoutUpdatesCount:(int64_t)a3;
- (void)setConfigurations:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentConfigurationIdentifier:(id)a3;
- (void)setDisclosureLayoutWidthProvider:(id)a3;
- (void)setLeadingLayout:(id)a3;
- (void)setNeedsLayout;
- (void)setNeedsLayout:(BOOL)a3;
- (void)setPreviousConfiguration:(id)a3;
- (void)setPreviousContainerSize:(CGSize)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setStandardLayoutWidthProvider:(id)a3;
- (void)setTrailingLayout:(id)a3;
- (void)updateContainerView:(id)a3;
@end

@implementation UICellAccessoryManager

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_2;
  v5[3] = &unk_1E5308940;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = WeakRetained;
  id v7 = *(id *)(a1 + 48);
  id v4 = WeakRetained;
  [v3 enumerateObjectsUsingBlock:v5];
}

- (UICellAccessoryConfiguration)currentConfiguration
{
  return (UICellAccessoryConfiguration *)[(NSDictionary *)self->_configurations objectForKeyedSubscript:self->_currentConfigurationIdentifier];
}

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  v3 = [v14 identifier];
  id v4 = [v14 view];
  v5 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:v3];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = v5;
  if (v5 != v4)
  {
    [v5 frame];
    objc_msgSend(v4, "setFrame:");
    [v4 layoutIfNeeded];
    [v6 removeFromSuperview];

LABEL_4:
    id v7 = 0;
LABEL_5:
    [*(id *)(a1 + 40) addSubview:v4];
    [*(id *)(*(void *)(a1 + 32) + 96) setObject:v4 forKeyedSubscript:v3];
    goto LABEL_6;
  }
  v12 = [v4 superview];
  v13 = *(void **)(a1 + 40);

  id v7 = v4;
  if (v12 != v13) {
    goto LABEL_5;
  }
LABEL_6:
  [*(id *)(a1 + 48) initialFrameForAccessory:v14];
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  if (!CGRectIsNull(v16))
  {
    objc_msgSend(v4, "setFrame:", x, y, width, height);
    [v4 layoutIfNeeded];
  }
  [*(id *)(a1 + 48) initialAlphaForAccessory:v14];
  objc_msgSend(v4, "setAlpha:");
}

- (void)setStandardLayoutWidthProvider:(id)a3
{
}

- (void)setDisclosureLayoutWidthProvider:(id)a3
{
}

- (void)setNeedsLayout
{
  self->_needsLayout = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  [WeakRetained setNeedsLayout];
}

- (UICellAccessoryLayout)trailingLayout
{
  return self->_trailingLayout;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_safeAreaInsets.left || a3.right != self->_safeAreaInsets.right)
  {
    self->_safeAreaInsets = a3;
    [(UICellAccessoryManager *)self setNeedsLayout];
  }
}

- (UICellAccessoryLayout)leadingLayout
{
  return self->_leadingLayout;
}

- (void)_updateFromPreviousConfiguration:(id)a3
{
  id v67 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  if (WeakRetained)
  {
    v5 = [(UICellAccessoryManager *)self _configurationWithIdentifier:self->_currentConfigurationIdentifier];
    int v6 = [WeakRetained _shouldReverseLayoutDirection];
    id v7 = [v5 leadingAccessories];
    v8 = [v7 reverseObjectEnumerator];
    v9 = [v8 allObjects];

    v66 = v5;
    v10 = [v5 trailingAccessories];
    v11 = [v67 leadingAccessories];
    v12 = [v11 reverseObjectEnumerator];
    uint64_t v13 = [v12 allObjects];
    id v14 = (void *)v13;
    v15 = (void *)MEMORY[0x1E4F1CBF0];
    if (v13) {
      CGRect v16 = (void *)v13;
    }
    else {
      CGRect v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v17 = v16;

    uint64_t v18 = [v67 trailingAccessories];
    v19 = (void *)v18;
    if (v18) {
      v20 = (void *)v18;
    }
    else {
      v20 = v15;
    }
    id v21 = v20;

    if (v6) {
      uint64_t v22 = 8;
    }
    else {
      uint64_t v22 = 2;
    }
    if (v6) {
      uint64_t v23 = 2;
    }
    else {
      uint64_t v23 = 8;
    }
    [(UICellAccessoryManager *)self _updateAccessories:v9 previousAccessories:v17 withLayout:self->_leadingLayout edge:v22];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v62 = v28;
    double v31 = v30;
    [(UICellAccessoryManager *)self _updateAccessories:v10 previousAccessories:v21 withLayout:self->_trailingLayout edge:v23];
    double v36 = v32;
    double v37 = v33;
    CGFloat v38 = v34;
    double v39 = v35;
    if (v6) {
      double v40 = v32;
    }
    else {
      double v40 = v25;
    }
    if (v6) {
      double v41 = v33;
    }
    else {
      double v41 = v27;
    }
    CGFloat v60 = v41;
    CGFloat v61 = v40;
    if (v6) {
      double v42 = v34;
    }
    else {
      double v42 = v29;
    }
    CGFloat v59 = v42;
    if (v6) {
      CGFloat v43 = v35;
    }
    else {
      CGFloat v43 = v31;
    }

    if (v6) {
      double v44 = v25;
    }
    else {
      double v44 = v36;
    }
    if (v6) {
      double v45 = v27;
    }
    else {
      double v45 = v37;
    }
    CGFloat v64 = v45;
    CGFloat v65 = v44;
    if (v6)
    {
      CGFloat v38 = v62;
      double v46 = v31;
    }
    else
    {
      double v46 = v39;
    }
    CGFloat v63 = v46;
    [(UICellAccessoryManager *)self containerBounds];
    CGFloat v55 = v47;
    CGFloat v56 = v48;
    CGFloat v57 = v50;
    CGFloat v58 = v49;
    v69.origin.double x = v61;
    v69.origin.double y = v60;
    v69.size.double width = v59;
    CGFloat v51 = v43;
    v69.size.double height = v43;
    double v52 = 0.0;
    CGFloat MaxX = 0.0;
    if (!CGRectIsNull(v69))
    {
      v70.origin.double x = v61;
      v70.origin.double y = v60;
      v70.size.double width = v59;
      v70.size.double height = v51;
      CGFloat MaxX = CGRectGetMaxX(v70);
    }
    v71.origin.double x = v65;
    v71.origin.double y = v64;
    v71.size.double width = v38;
    v71.size.double height = v63;
    if (!CGRectIsNull(v71))
    {
      v72.origin.double x = v55;
      v72.size.double height = v56;
      v72.size.double width = v57;
      v72.origin.double y = v58;
      double v54 = CGRectGetMaxX(v72);
      v73.origin.double x = v65;
      v73.origin.double y = v64;
      v73.size.double width = v38;
      v73.size.double height = v63;
      double v52 = v54 - CGRectGetMinX(v73);
    }
    self->_contentInset.top = 0.0;
    self->_contentInset.left = MaxX;
    self->_contentInset.bottom = 0.0;
    self->_contentInset.right = v52;
  }
}

- (CGRect)contentFrame
{
  [(UICellAccessoryManager *)self containerBounds];
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double v6 = v5 + left;
  double v8 = top + v7;
  double v10 = v9 - (left + self->_contentInset.right);
  double v12 = v11 - (top + self->_contentInset.bottom);
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v6;
  return result;
}

- (CGRect)_updateAccessories:(id)a3 previousAccessories:(id)a4 withLayout:(id)a5 edge:(unint64_t)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  [v13 setManager:self];
  [v13 setEdge:a6];
  uint64_t v14 = 136;
  if (a6 == 8) {
    uint64_t v14 = 152;
  }
  [v13 setSafeAreaInset:*(double *)((char *)&self->super.isa + v14)];
  v15 = [(UICellAccessoryManager *)self standardLayoutWidthProvider];
  [v13 setStandardLayoutWidthProvider:v15];

  CGRect v16 = [(UICellAccessoryManager *)self disclosureLayoutWidthProvider];
  [v13 setDisclosureLayoutWidthProvider:v16];

  double v62 = self;
  CGFloat v59 = v13;
  BOOL v60 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
  objc_msgSend(v13, "prepareLayoutForAccessories:previousAccessories:configurationIdentifier:animated:", v11, v12, self->_currentConfigurationIdentifier);
  id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v11, "count"));
  uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v19 = v11;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v78 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        double v25 = [v24 view];
        [v17 addObject:v25];

        double v26 = [v24 identifier];
        [v18 addObject:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v77 objects:v82 count:16];
    }
    while (v21);
  }

  uint64_t v27 = [v17 count];
  if (v27 != [v19 count])
  {
    CGFloat v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2 object:v62 file:@"UICellAccessoryManager.m" lineNumber:334 description:@"Having the same view in multiple accessories is unsupported."];
  }
  SEL v58 = a2;
  id v61 = v19;
  double v28 = (void *)[v19 mutableCopy];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v29 = v12;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v74 != v32) {
          objc_enumerationMutation(v29);
        }
        double v34 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        double v35 = [v34 identifier];
        char v36 = [v18 containsObject:v35];

        if ((v36 & 1) == 0) {
          [v28 addObject:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v73 objects:v81 count:16];
    }
    while (v31);
  }

  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke;
  v70[3] = &unk_1E52DCB30;
  v70[4] = v62;
  id v37 = v28;
  id v71 = v37;
  id v38 = v59;
  id v72 = v38;
  +[UIView performWithoutAnimation:v70];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_3;
  v68[3] = &unk_1E5308968;
  v68[4] = v62;
  id v39 = v38;
  id v69 = v39;
  [v37 enumerateObjectsUsingBlock:v68];
  double v40 = [(UICellAccessoryManager *)v62 _configurationWithIdentifier:v62->_currentConfigurationIdentifier];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_4;
  aBlock[3] = &unk_1E52D9F98;
  aBlock[4] = v62;
  id v41 = v40;
  id v67 = v41;
  double v42 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v43 = [(UICellAccessoryManager *)v62 animatedLayoutUpdatesCount];
  if (v60)
  {
    [(UICellAccessoryManager *)v62 setAnimatedLayoutUpdatesCount:v43 + 1];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_5;
    v63[3] = &unk_1E52EAFB8;
    v63[4] = v62;
    SEL v65 = v58;
    CGFloat v64 = v42;
    +[UIView _addCompletion:v63];

    double v44 = v61;
  }
  else
  {
    double v44 = v61;
    if (!v43) {
      v42[2](v42);
    }
  }
  [v39 endLayout];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;

  double v53 = v46;
  double v54 = v48;
  double v55 = v50;
  double v56 = v52;
  result.size.double height = v56;
  result.size.double width = v55;
  result.origin.double y = v54;
  result.origin.double x = v53;
  return result;
}

- (int64_t)animatedLayoutUpdatesCount
{
  return self->_animatedLayoutUpdatesCount;
}

- (CGRect)containerBounds
{
  [(UICellAccessoryManager *)self containerSize];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.double height = v5;
  result.size.double width = v3;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)layoutIfNeeded
{
  obuint64_t j = [(UICellAccessoryManager *)self _configurationWithIdentifier:self->_currentConfigurationIdentifier];
  [(UICellAccessoryManager *)self containerSize];
  CGFloat v5 = v3;
  CGFloat v6 = v4;
  if (self->_needsLayout
    || obj != self->_previousConfiguration
    || (v3 == self->_previousContainerSize.width ? (BOOL v7 = v4 == self->_previousContainerSize.height) : (BOOL v7 = 0),
        !v7 || [(UICellAccessoryConfiguration *)obj alwaysNeedsLayout]))
  {
    [(UICellAccessoryManager *)self _updateFromPreviousConfiguration:self->_previousConfiguration];
    objc_storeStrong((id *)&self->_previousConfiguration, obj);
    self->_previousContainerSize.double width = v5;
    self->_previousContainerSize.double height = v6;
    self->_needsLayout = 0;
  }
}

- (CGSize)containerSize
{
  double width = self->_enforcedContainerSize.width;
  double height = self->_enforcedContainerSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    [WeakRetained bounds];
    double width = v6;
    double height = v7;
  }
  double v8 = width;
  double v9 = height;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (id)_configurationWithIdentifier:(id)a3
{
  if (a3)
  {
    double v4 = -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:");
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (id)standardLayoutWidthProvider
{
  return self->_standardLayoutWidthProvider;
}

- (id)disclosureLayoutWidthProvider
{
  return self->_disclosureLayoutWidthProvider;
}

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_4(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) _configurationWithIdentifier:*(void *)(*(void *)(a1 + 32) + 72)];
  if (v2 == *(void **)(a1 + 40))
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
    double v4 = [*(id *)(*(void *)(a1 + 32) + 96) allKeys];
    CGFloat v5 = (void *)[v3 initWithArray:v4];

    id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
    double v7 = [*(id *)(*(void *)(a1 + 32) + 96) allValues];
    double v8 = (void *)[v6 initWithArray:v7];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    double v9 = [v2 leadingAccessories];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v15 = [v14 identifier];
          [v5 removeObject:v15];

          CGRect v16 = [v14 view];
          [v8 removeObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v11);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v17 = [v2 trailingAccessories];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          uint64_t v23 = [v22 identifier];
          [v5 removeObject:v23];

          double v24 = [v22 view];
          [v8 removeObject:v24];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v19);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v5;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v31 != v28) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "removeObjectForKey:", *(void *)(*((void *)&v30 + 1) + 8 * k), (void)v30);
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v27);
    }

    [v8 makeObjectsPerformSelector:sel_removeFromSuperview];
  }
}

- (NSDictionary)configurations
{
  return self->_configurations;
}

- (void)setTrailingLayout:(id)a3
{
}

- (void)setLeadingLayout:(id)a3
{
}

- (void)setCurrentConfigurationIdentifier:(id)a3
{
  CGFloat v5 = (NSString *)a3;
  if (self->_currentConfigurationIdentifier != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_currentConfigurationIdentifier, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    [WeakRetained setNeedsLayout];

    CGFloat v5 = v7;
  }
}

- (UICellAccessoryManager)initWithContainerView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UICellAccessoryManager;
  id v3 = a3;
  double v4 = [(UICellAccessoryManager *)&v8 init];
  objc_storeWeak((id *)&v4->_containerView, v3);

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v8.receiver, v8.super_class);
  accessoryViews = v4->_accessoryViews;
  v4->_accessoryViews = (NSMutableDictionary *)v5;

  return v4;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setConfigurations:(id)a3
{
  uint64_t v5 = (NSDictionary *)a3;
  if (self->_configurations != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_configurations, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    [WeakRetained setNeedsLayout];

    uint64_t v5 = v7;
  }
}

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 identifier];
  double v4 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:v3];
  [*(id *)(a1 + 40) finalFrameForAccessory:v9];
  double x = v11.origin.x;
  double y = v11.origin.y;
  double width = v11.size.width;
  double height = v11.size.height;
  if (!CGRectIsNull(v11)) {
    objc_msgSend(v4, "setFrame:", x, y, width, height);
  }
  [*(id *)(a1 + 40) finalAlphaForAccessory:v9];
  objc_msgSend(v4, "setAlpha:");
}

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_5(uint64_t a1, int a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimatedLayoutUpdatesCount:", objc_msgSend(*(id *)(a1 + 32), "animatedLayoutUpdatesCount") - 1);
  if ([*(id *)(a1 + 32) animatedLayoutUpdatesCount] < 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"UICellAccessoryManager.m" lineNumber:431 description:@"UICollectionView internal inconsistency: unexpected cell accessory layout animation"];

    if (!a2) {
      return;
    }
  }
  else if (!a2)
  {
    return;
  }
  if (![*(id *)(a1 + 32) animatedLayoutUpdatesCount])
  {
    double v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (void)setAnimatedLayoutUpdatesCount:(int64_t)a3
{
  self->_animatedLayoutUpdatesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_previousConfiguration, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_currentConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_trailingLayout, 0);
  objc_storeStrong((id *)&self->_leadingLayout, 0);
  objc_storeStrong(&self->_disclosureLayoutWidthProvider, 0);
  objc_storeStrong(&self->_standardLayoutWidthProvider, 0);
}

- (void)updateContainerView:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containerView, obj);
    [(UICellAccessoryManager *)self setNeedsLayout];
    uint64_t v5 = obj;
  }
}

- (void)performWithEnforcedContainerSize:(CGSize)a3 block:(id)a4
{
  CGSize enforcedContainerSize = self->_enforcedContainerSize;
  self->_CGSize enforcedContainerSize = a3;
  (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  self->_CGSize enforcedContainerSize = enforcedContainerSize;
}

- (id)description
{
  return +[UIDescriptionBuilder descriptionForObject:self keys:&unk_1ED3F12E8];
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSString)currentConfigurationIdentifier
{
  return self->_currentConfigurationIdentifier;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (void)setNeedsLayout:(BOOL)a3
{
  self->_needsLayout = a3;
}

- (CGSize)previousContainerSize
{
  double width = self->_previousContainerSize.width;
  double height = self->_previousContainerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousContainerSize:(CGSize)a3
{
  self->_previousContainerSize = a3;
}

- (UICellAccessoryConfiguration)previousConfiguration
{
  return self->_previousConfiguration;
}

- (void)setPreviousConfiguration:(id)a3
{
}

- (NSMutableDictionary)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
}

@end