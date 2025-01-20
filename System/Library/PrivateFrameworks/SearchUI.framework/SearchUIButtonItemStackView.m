@interface SearchUIButtonItemStackView
- (BOOL)countMoreButtonTowardsMaxCount;
- (BOOL)deviceIsAuthenticated;
- (BOOL)hasLeftMainThread;
- (BOOL)isCompact;
- (BOOL)isDoneUpdating;
- (BOOL)shouldReverseButtonOrder;
- (NSArray)buttonItems;
- (NSMutableArray)currentButtonItemViewControllers;
- (NSMutableDictionary)buttonItemViewControllersForClassNames;
- (SearchUIButtonItemFactory)buttonItemFactory;
- (SearchUIButtonItemStackView)init;
- (SearchUIButtonItemStackViewDelegate)buttonItemStackViewDelegate;
- (UIColor)overridenButtonColor;
- (id)buttonTypes;
- (id)viewForButtonItem:(id)a3;
- (void)enumerateCachedViewControllersUsingBlock:(id)a3;
- (void)setButtonItemFactory:(id)a3;
- (void)setButtonItemStackViewDelegate:(id)a3;
- (void)setButtonItemViewControllersForClassNames:(id)a3;
- (void)setButtonItems:(id)a3;
- (void)setCountMoreButtonTowardsMaxCount:(BOOL)a3;
- (void)setCurrentButtonItemViewControllers:(id)a3;
- (void)setHasLeftMainThread:(BOOL)a3;
- (void)setIsCompact:(BOOL)a3;
- (void)setIsDoneUpdating:(BOOL)a3;
- (void)setOverridenButtonColor:(id)a3;
- (void)setShouldReverseButtonOrder:(BOOL)a3;
- (void)updateWithButtonItems:(id)a3 maxButtonItems:(unint64_t)a4 buttonItemViewType:(unint64_t)a5 rowModel:(id)a6 feedbackDelegate:(id)a7;
@end

@implementation SearchUIButtonItemStackView

- (SearchUIButtonItemStackView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIButtonItemStackView;
  v2 = [(SearchUIButtonItemStackView *)&v5 init];
  if (v2)
  {
    +[SearchUIAutoLayout requireIntrinsicSizeForView:v2];
    [(SearchUIButtonItemStackView *)v2 setIsCompact:0];
    v3 = [(SearchUIButtonItemStackView *)v2 layer];
    [v3 setAllowsGroupOpacity:0];

    [(SearchUIButtonItemStackView *)v2 setCountMoreButtonTowardsMaxCount:1];
  }
  return v2;
}

- (void)setIsCompact:(BOOL)a3
{
  self->_isCompact = a3;
  double v5 = 8.0;
  if (!a3)
  {
    int v6 = objc_msgSend(MEMORY[0x1E4FAE198], "isMacOS", 8.0);
    double v5 = 10.0;
    if (v6)
    {
      int v7 = TLKSnippetModernizationEnabled();
      double v5 = 10.0;
      if (v7) {
        double v5 = 8.0;
      }
    }
  }
  [(NUIContainerStackView *)self setSpacing:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SearchUIButtonItemStackView_setIsCompact___block_invoke;
  v8[3] = &__block_descriptor_33_e42_v16__0__SearchUIButtonItemViewController_8l;
  BOOL v9 = a3;
  [(SearchUIButtonItemStackView *)self enumerateCachedViewControllersUsingBlock:v8];
}

uint64_t __44__SearchUIButtonItemStackView_setIsCompact___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsCompact:*(unsigned __int8 *)(a1 + 32)];
}

- (void)enumerateCachedViewControllersUsingBlock:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v5 = [(SearchUIButtonItemStackView *)self buttonItemViewControllersForClassNames];
  int v6 = [v5 objectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
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
              v4[2](v4, *(void *)(*((void *)&v17 + 1) + 8 * v16++));
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
}

- (void)updateWithButtonItems:(id)a3 maxButtonItems:(unint64_t)a4 buttonItemViewType:(unint64_t)a5 rowModel:(id)a6 feedbackDelegate:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [(SearchUIButtonItemStackView *)self buttonItems];
  char v16 = [v12 isEqualToArray:v15];

  if ((v16 & 1) == 0)
  {
    [(SearchUIButtonItemStackView *)self setButtonItems:v12];
    -[SearchUIButtonItemStackView setHidden:](self, "setHidden:", [v12 count] == 0);
    [(SearchUIButtonItemStackView *)self setButtonItemFactory:0];
    if ([v12 count])
    {
      [(SearchUIButtonItemStackView *)self enumerateCachedViewControllersUsingBlock:&__block_literal_global_27];
      [(SearchUIButtonItemStackView *)self setHasLeftMainThread:0];
      [(SearchUIButtonItemStackView *)self setAlpha:0.0];
      objc_initWeak(&location, self);
      long long v17 = objc_opt_new();
      [v17 setDelegate:self];
      [v17 setFeedbackDelegate:v14];
      objc_msgSend(v17, "setCountMoreButtonTowardsMaxCount:", -[SearchUIButtonItemStackView countMoreButtonTowardsMaxCount](self, "countMoreButtonTowardsMaxCount"));
      [(SearchUIButtonItemStackView *)self setIsDoneUpdating:0];
      BOOL v18 = [(SearchUIButtonItemStackView *)self shouldReverseButtonOrder];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      long long v21 = __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_2;
      long long v22 = &unk_1E6E73AF8;
      objc_copyWeak(v26, &location);
      id v23 = v12;
      id v24 = v13;
      id v25 = v14;
      v26[1] = (id)a5;
      [v17 fetchSearchUIButtonitemsWithSFButtonItems:v23 maxButtonItems:a4 shouldReverseButtonOrder:v18 completion:&v19];
      -[SearchUIButtonItemStackView setHasLeftMainThread:](self, "setHasLeftMainThread:", 1, v19, v20, v21, v22);
      [(SearchUIButtonItemStackView *)self setButtonItemFactory:v17];

      objc_destroyWeak(v26);
      objc_destroyWeak(&location);
    }
  }
}

void __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 view];
  [v2 setHidden:1];
}

void __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_3;
  v9[3] = &unk_1E6E73AD0;
  objc_copyWeak(v14, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 32);
  id v6 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void **)(a1 + 64);
  id v13 = v7;
  v14[1] = v8;
  char v15 = a3;
  +[SearchUIUtilities dispatchMainIfNecessary:v9];

  objc_destroyWeak(v14);
}

void __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_3(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = *(void **)(a1 + 32);
  v4 = [WeakRetained buttonItems];
  LODWORD(v3) = [v3 isEqualToArray:v4];

  if (v3)
  {
    id v5 = [*(id *)(a1 + 40) firstObject];
    id v6 = NSStringFromClass((Class)objc_msgSend(v5, "searchUI_viewControllerClass"));

    id v7 = [WeakRetained buttonItemViewControllersForClassNames];

    if (!v7)
    {
      uint64_t v8 = objc_opt_new();
      [WeakRetained setButtonItemViewControllersForClassNames:v8];
    }
    uint64_t v9 = [WeakRetained buttonItemViewControllersForClassNames];
    id v10 = [v9 objectForKeyedSubscript:v6];
    id v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = (id)objc_opt_new();
    }
    id v13 = v12;

    id v14 = *(void **)(a1 + 40);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_4;
    v33[3] = &unk_1E6E73AA8;
    id v15 = v13;
    id v34 = v15;
    id v35 = WeakRetained;
    id v36 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 72);
    id v37 = v16;
    uint64_t v38 = v17;
    [v14 enumerateObjectsUsingBlock:v33];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = [*(id *)(*((void *)&v29 + 1) + 8 * i) _searchUIButtonItemGeneratorClass];
          if (v22 == objc_opt_class())
          {
            LODWORD(v19) = 1;
            goto LABEL_17;
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    id v23 = [WeakRetained buttonItemStackViewDelegate];

    if (v23)
    {
      id v24 = [WeakRetained buttonItemStackViewDelegate];
      [v24 didUpdateWithButtonItems:*(void *)(a1 + 40) isFinalUpdate:*(unsigned __int8 *)(a1 + 80)];
    }
    if (((*(unsigned char *)(a1 + 80) == 0) & ~v19) != 0)
    {
      BOOL v26 = 0;
    }
    else
    {
      int v25 = [WeakRetained hasLeftMainThread];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_5;
      v28[3] = &unk_1E6E72730;
      v28[4] = WeakRetained;
      [MEMORY[0x1E4FAE198] performAnimatableChanges:v28 animated:v25 & (v19 ^ 1)];
      BOOL v26 = *(unsigned char *)(a1 + 80) != 0;
    }
    [WeakRetained setIsDoneUpdating:v26];
    if (v6)
    {
      uint64_t v27 = [WeakRetained buttonItemViewControllersForClassNames];
      [v27 setObject:v15 forKeyedSubscript:v6];

      [WeakRetained setCurrentButtonItemViewControllers:v15];
    }
  }
}

void __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id v14 = a2;
  if ([*(id *)(a1 + 32) count] <= a3
    || ([*(id *)(a1 + 32) objectAtIndexedSubscript:a3],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = +[SearchUIButtonItemViewController buttonItemViewControllerForButtonItem:v14];
    [*(id *)(a1 + 32) addObject:v5];
    id v6 = *(void **)(a1 + 40);
    id v7 = [v5 view];
    [v6 addArrangedSubview:v7];
  }
  [v5 setRowModel:*(void *)(a1 + 48)];
  [v5 setFeedbackDelegate:*(void *)(a1 + 56)];
  objc_msgSend(v5, "setIsCompact:", objc_msgSend(*(id *)(a1 + 40), "isCompact"));
  [v5 updateWithButtonItem:v14 buttonItemViewType:*(void *)(a1 + 64)];
  if ([v14 isOverflowButton]) {
    float v8 = 1000.0;
  }
  else {
    float v8 = 250.0;
  }
  uint64_t v9 = [v5 view];
  *(float *)&double v10 = v8;
  [v9 setContentHuggingPriority:0 forAxis:v10];

  id v11 = [v5 view];
  *(float *)&double v12 = v8;
  [v11 setContentCompressionResistancePriority:0 forAxis:v12];

  id v13 = [v5 view];
  [v13 setHidden:0];
}

uint64_t __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (id)viewForButtonItem:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__4;
  id v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SearchUIButtonItemStackView_viewForButtonItem___block_invoke;
  v8[3] = &unk_1E6E73B20;
  id v5 = v4;
  id v9 = v5;
  double v10 = &v11;
  [(SearchUIButtonItemStackView *)self enumerateCachedViewControllersUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __49__SearchUIButtonItemStackView_viewForButtonItem___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 buttonItem];
  int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = [v8 view];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)buttonTypes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v4 = [(SearchUIButtonItemStackView *)self currentButtonItemViewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v10 = [v9 view];
        char v11 = [v10 isHidden];

        if ((v11 & 1) == 0)
        {
          double v12 = [v9 buttonItem];
          [v3 addObject:objc_opt_class()];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)deviceIsAuthenticated
{
  return +[SearchUIUtilities deviceIsAuthenticatedForView:self];
}

- (BOOL)shouldReverseButtonOrder
{
  return self->_shouldReverseButtonOrder;
}

- (void)setShouldReverseButtonOrder:(BOOL)a3
{
  self->_shouldReverseButtonOrder = a3;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (UIColor)overridenButtonColor
{
  return self->_overridenButtonColor;
}

- (void)setOverridenButtonColor:(id)a3
{
}

- (SearchUIButtonItemStackViewDelegate)buttonItemStackViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonItemStackViewDelegate);
  return (SearchUIButtonItemStackViewDelegate *)WeakRetained;
}

- (void)setButtonItemStackViewDelegate:(id)a3
{
}

- (BOOL)isDoneUpdating
{
  return self->_isDoneUpdating;
}

- (void)setIsDoneUpdating:(BOOL)a3
{
  self->_isDoneUpdating = a3;
}

- (BOOL)countMoreButtonTowardsMaxCount
{
  return self->_countMoreButtonTowardsMaxCount;
}

- (void)setCountMoreButtonTowardsMaxCount:(BOOL)a3
{
  self->_countMoreButtonTowardsMaxCount = a3;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setButtonItems:(id)a3
{
}

- (SearchUIButtonItemFactory)buttonItemFactory
{
  return self->_buttonItemFactory;
}

- (void)setButtonItemFactory:(id)a3
{
}

- (NSMutableDictionary)buttonItemViewControllersForClassNames
{
  return self->_buttonItemViewControllersForClassNames;
}

- (void)setButtonItemViewControllersForClassNames:(id)a3
{
}

- (NSMutableArray)currentButtonItemViewControllers
{
  return self->_currentButtonItemViewControllers;
}

- (void)setCurrentButtonItemViewControllers:(id)a3
{
}

- (BOOL)hasLeftMainThread
{
  return self->_hasLeftMainThread;
}

- (void)setHasLeftMainThread:(BOOL)a3
{
  self->_hasLeftMainThread = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentButtonItemViewControllers, 0);
  objc_storeStrong((id *)&self->_buttonItemViewControllersForClassNames, 0);
  objc_storeStrong((id *)&self->_buttonItemFactory, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_destroyWeak((id *)&self->_buttonItemStackViewDelegate);
  objc_storeStrong((id *)&self->_overridenButtonColor, 0);
}

@end