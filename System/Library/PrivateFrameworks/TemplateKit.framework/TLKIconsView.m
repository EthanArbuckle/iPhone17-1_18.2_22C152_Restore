@interface TLKIconsView
- (NSMutableArray)imageViews;
- (TLKIconsView)init;
- (UIFont)symbolFont;
- (unint64_t)prominence;
- (void)setImageViews:(id)a3;
- (void)setProminence:(unint64_t)a3;
- (void)setSymbolFont:(id)a3;
- (void)updateIcons:(id)a3;
@end

@implementation TLKIconsView

- (TLKIconsView)init
{
  v5.receiver = self;
  v5.super_class = (Class)TLKIconsView;
  v2 = [(TLKIconsView *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(TLKIconsView *)v2 setImageViews:v3];

    [(TLKStackView *)v2 setAlignment:5];
    +[TLKLayoutUtilities deviceScaledRoundedValue:v2 forView:2.5];
    -[NUIContainerStackView setSpacing:](v2, "setSpacing:");
    [(TLKIconsView *)v2 setProminence:1];
  }
  return v2;
}

- (void)setProminence:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_prominence = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(TLKIconsView *)self imageViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setProminence:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setSymbolFont:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_symbolFont, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(TLKIconsView *)self imageViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setSymbolFont:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)updateIcons:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__TLKIconsView_updateIcons___block_invoke;
  v6[3] = &unk_1E5FD3020;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(TLKIconsView *)self performBatchUpdates:v6];
}

void __28__TLKIconsView_updateIcons___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) count];
  v3 = [*(id *)(a1 + 40) imageViews];
  unint64_t v4 = [v3 count];

  if (v2 > v4)
  {
    do
    {
      id v5 = objc_opt_new();
      objc_msgSend(v5, "setProminence:", objc_msgSend(*(id *)(a1 + 40), "prominence"));
      uint64_t v6 = [*(id *)(a1 + 40) symbolFont];
      [v5 setSymbolFont:v6];

      [v5 setSymbolScale:TLKSnippetModernizationEnabled()];
      +[TLKLayoutUtilities requireIntrinsicSizeForView:v5];
      id v7 = [*(id *)(a1 + 40) imageViews];
      [v7 addObject:v5];

      [*(id *)(a1 + 40) addArrangedSubview:v5];
      unint64_t v8 = [*(id *)(a1 + 32) count];
      uint64_t v9 = [*(id *)(a1 + 40) imageViews];
      unint64_t v10 = [v9 count];
    }
    while (v8 > v10);
  }
  long long v11 = [*(id *)(a1 + 40) imageViews];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      unint64_t v14 = [*(id *)(a1 + 32) count];
      v15 = [*(id *)(a1 + 40) imageViews];
      uint64_t v16 = [v15 objectAtIndexedSubscript:v13];
      v17 = v16;
      if (v13 >= v14)
      {
        [v16 setHidden:1];
      }
      else
      {
        [v16 setHidden:0];

        v15 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v13];
        v17 = [v15 image];
        v18 = [*(id *)(a1 + 40) imageViews];
        v19 = [v18 objectAtIndexedSubscript:v13];
        [v19 setTlkImage:v17];
      }
      ++v13;
      v20 = [*(id *)(a1 + 40) imageViews];
      unint64_t v21 = [v20 count];
    }
    while (v13 < v21);
  }
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (UIFont)symbolFont
{
  return self->_symbolFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolFont, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
}

@end