@interface SearchUIInfoValueFlowView
- (BOOL)isExpanded;
- (NSMutableArray)infoValueViewControllers;
- (SFInfoTuple)tuple;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (SearchUIInfoSizingDelegate)sizingDelegate;
- (SearchUIInfoValueFlowView)init;
- (SearchUIRowModel)rowModel;
- (void)buttonItemPressed:(id)a3;
- (void)configureInfoValueButtonController:(id)a3 withButtonItem:(id)a4;
- (void)reloadViews;
- (void)setFeedbackDelegate:(id)a3;
- (void)setInfoValueViewControllers:(id)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setRowModel:(id)a3;
- (void)setSizingDelegate:(id)a3;
- (void)setTuple:(id)a3;
@end

@implementation SearchUIInfoValueFlowView

- (SearchUIInfoValueFlowView)init
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIInfoValueFlowView;
  v2 = [(SearchUIInfoValueFlowView *)&v9 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SearchUIInfoValueFlowView *)v2 setInfoValueViewControllers:v3];

    char v4 = [MEMORY[0x1E4FAE198] isMacOS];
    double v5 = 7.0;
    double v6 = 7.0;
    if ((v4 & 1) == 0)
    {
      int v7 = TLKSnippetModernizationEnabled();
      double v6 = 7.0;
      if (v7) {
        [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:v2 forView:6.5];
      }
    }
    [(NUIContainerFlowView *)v2 setRowSpacing:v6];
    if (([MEMORY[0x1E4FAE198] isMacOS] & 1) == 0)
    {
      if (TLKSnippetModernizationEnabled()) {
        double v5 = 0.0;
      }
      else {
        double v5 = 7.0;
      }
    }
    [(NUIContainerFlowView *)v2 setItemSpacing:v5];
    [(NUIContainerFlowView *)v2 setVerticalAlignment:2];
  }
  return v2;
}

- (void)setTuple:(id)a3
{
  double v5 = (SFInfoTuple *)a3;
  p_tuple = &self->_tuple;
  if (self->_tuple != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)p_tuple, a3);
    [(SearchUIInfoValueFlowView *)self setIsExpanded:0];
    p_tuple = (SFInfoTuple **)[(SearchUIInfoValueFlowView *)self reloadViews];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_tuple, v5);
}

- (void)reloadViews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__SearchUIInfoValueFlowView_reloadViews__block_invoke;
  v2[3] = &unk_1E6E72730;
  v2[4] = self;
  [(SearchUIInfoValueFlowView *)self performBatchUpdates:v2];
}

uint64_t __40__SearchUIInfoValueFlowView_reloadViews__block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v2 = [*(id *)(a1 + 32) infoValueViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v52 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = [*(id *)(*((void *)&v51 + 1) + 8 * i) view];
        [v7 setHidden:1];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v4);
  }

  v8 = [*(id *)(a1 + 32) tuple];
  uint64_t v9 = [v8 initiallyVisibleValues];

  v10 = [*(id *)(a1 + 32) tuple];
  v11 = [v10 values];
  unint64_t v12 = [v11 count] - v9;

  if (v12 >= 2) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = 0;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v14 = [*(id *)(a1 + 32) tuple];
  v15 = [v14 values];

  obuint64_t j = v15;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v48;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8 * j);
        v22 = [*(id *)(a1 + 32) infoValueViewControllers];
        unint64_t v23 = [v22 count];

        if (v18 + j >= v23)
        {
          v25 = objc_opt_new();
          [v25 setButtonDelegate:*(void *)(a1 + 32)];
          v27 = (void *)MEMORY[0x1E4FAE090];
          char v28 = [MEMORY[0x1E4FAE198] isMacOS];
          v29 = (void *)MEMORY[0x1E4FB2950];
          if ((v28 & 1) == 0)
          {
            int v30 = TLKSnippetModernizationEnabled();
            v29 = (void *)MEMORY[0x1E4FB2950];
            if (v30) {
              v29 = (void *)MEMORY[0x1E4FB28C8];
            }
          }
          v31 = [v27 cachedFontForTextStyle:*v29];
          [v25 setButtonFont:v31];

          if (TLKSnippetModernizationEnabled())
          {
            if (v18 + j) {
              double v32 = -10.0;
            }
            else {
              double v32 = 0.0;
            }
            v33 = [v25 view];
            objc_msgSend(v33, "setCustomAlignmentRectInsets:", 0.0, v32, 0.0, 0.0);
          }
          v34 = [v25 buttonItemView];
          [v34 setNeverCacheEffectiveLayoutSize:1];

          v35 = [v25 view];
          [v35 setNeverCacheEffectiveLayoutSize:1];

          v36 = [*(id *)(a1 + 32) infoValueViewControllers];
          [v36 addObject:v25];

          v37 = *(void **)(a1 + 32);
          v26 = [v25 view];
          [v37 addArrangedSubview:v26];
        }
        else
        {
          v24 = [*(id *)(a1 + 32) infoValueViewControllers];
          v25 = [v24 objectAtIndexedSubscript:v18 + j];

          v26 = [v25 view];
          [v26 setHidden:0];
        }

        v38 = [*(id *)(a1 + 32) rowModel];
        [v25 setRowModel:v38];

        v39 = [*(id *)(a1 + 32) feedbackDelegate];
        [v25 setFeedbackDelegate:v39];

        if (![*(id *)(a1 + 32) isExpanded]
          && v13 >= 1
          && v18 + j + 1 > (unint64_t)v13)
        {
          v40 = [[SearchUIButtonItem alloc] initWithSFButtonItem:0];
          v41 = [*(id *)(a1 + 32) tuple];
          v42 = [v41 showMoreString];
          [(SearchUIButtonItem *)v40 setTitle:v42];

          if (TLKSnippetModernizationEnabled())
          {
            [(SearchUIButtonItem *)v40 setImage:0];
          }
          else
          {
            v43 = +[SearchUISymbolImage chevronImage];
            [(SearchUIButtonItem *)v40 setImage:v43];
          }
          [v25 updateWithButtonItem:v40 buttonItemViewType:0];
          v44 = [v25 buttonItemView];
          [v44 setEnabled:1];

          goto LABEL_37;
        }
        [*(id *)(a1 + 32) configureInfoValueButtonController:v25 withButtonItem:v21];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      v18 += j;
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_37:

  return [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
}

- (void)configureInfoValueButtonController:(id)a3 withButtonItem:(id)a4
{
  id v19 = a4;
  id v5 = a3;
  double v6 = [v19 image];

  if (v6)
  {
    uint64_t v7 = [v19 image];
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_4;
  }
  if ((TLKSnippetModernizationEnabled() & 1) == 0)
  {
    v10 = [v19 command];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = +[SearchUISymbolImage chevronImage];
      goto LABEL_3;
    }
  }
  unint64_t v12 = [v19 command];
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();

  if (v13)
  {
    v14 = [v19 command];
    v15 = [v14 punchout];
    uint64_t v16 = [v15 urls];
    uint64_t v17 = [v16 firstObject];
    uint64_t v18 = [v17 scheme];

    if (([v18 isEqualToString:@"http"] & 1) != 0
      || [v18 isEqualToString:@"https"])
    {
      v8 = objc_opt_new();
      [v8 setSymbolName:@"arrow.up.forward.app.fill"];
      [v8 setIsTemplate:1];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_4:
  uint64_t v9 = [[SearchUIButtonItem alloc] initWithSFButtonItem:v19];
  [(SearchUIButtonItem *)v9 setImage:v8];
  objc_msgSend(v5, "updateWithButtonItem:buttonItemViewType:", v9, objc_msgSend(v5, "buttonItemViewStyle"));
}

- (void)buttonItemPressed:(id)a3
{
  uint64_t v4 = [a3 sfButtonItem];

  if (!v4)
  {
    [(SearchUIInfoValueFlowView *)self setIsExpanded:1];
    [(SearchUIInfoValueFlowView *)self reloadViews];
    id v5 = [(SearchUIInfoValueFlowView *)self sizingDelegate];
    [v5 didInvalidateSizeAnimate:1];
  }
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (SearchUIInfoSizingDelegate)sizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizingDelegate);
  return (SearchUIInfoSizingDelegate *)WeakRetained;
}

- (void)setSizingDelegate:(id)a3
{
}

- (SearchUIRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
}

- (SFInfoTuple)tuple
{
  return self->_tuple;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (NSMutableArray)infoValueViewControllers
{
  return self->_infoValueViewControllers;
}

- (void)setInfoValueViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoValueViewControllers, 0);
  objc_storeStrong((id *)&self->_tuple, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
}

@end