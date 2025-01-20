@interface PKNumberPadSuggestionsView
+ (CGSize)defaultSize;
- (NSArray)suggestions;
- (PKNumberPadSuggestionsView)initWithDefaultFrame;
- (PKNumberPadSuggestionsView)initWithFrame:(CGRect)a3;
- (PKNumberPadSuggestionsViewDelegate)delegate;
- (UIColor)buttonBackgroundColor;
- (UIColor)buttonTextColor;
- (id)_createBorderedButtonForSuggestion:(id)a3 withBorder:(unint64_t)a4 primaryAction:(id)a5;
- (void)_reloadSubviews;
- (void)_selectedSuggestion:(id)a3;
- (void)_updateButtons;
- (void)performBatchUpdates:(id)a3;
- (void)setButtonBackgroundColor:(id)a3;
- (void)setButtonTextColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSuggestions:(id)a3;
@end

@implementation PKNumberPadSuggestionsView

+ (CGSize)defaultSize
{
  [MEMORY[0x1E4FB18E0] defaultSizeForInterfaceOrientation:1];
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKNumberPadSuggestionsView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKNumberPadSuggestionsView;
  double v3 = -[PKNumberPadSuggestionsView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKNumberPadSuggestionsView *)v3 setAxis:0];
    [(PKNumberPadSuggestionsView *)v4 setDistribution:1];
    [(PKNumberPadSuggestionsView *)v4 setAlignment:0];
    [(PKNumberPadSuggestionsView *)v4 setSpacing:0.0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__PKNumberPadSuggestionsView_initWithFrame___block_invoke;
    v7[3] = &unk_1E59CE078;
    v5 = v4;
    v8 = v5;
    [(PKNumberPadSuggestionsView *)v5 performBatchUpdates:v7];
    [(PKNumberPadSuggestionsView *)v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85A70]];
  }
  return v4;
}

void __44__PKNumberPadSuggestionsView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 449) = 1;
  double v2 = (void *)MEMORY[0x1E4FB1618];
  id v3 = a2;
  v4 = [v2 labelColor];
  [v3 setButtonTextColor:v4];

  PKProvisioningBackgroundColor();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setButtonBackgroundColor:v5];
}

- (PKNumberPadSuggestionsView)initWithDefaultFrame
{
  [(id)objc_opt_class() defaultSize];

  return -[PKNumberPadSuggestionsView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v3, 44.0);
}

- (void)performBatchUpdates:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    ++self->_batchedUpdateCount;
    id v6 = v4;
    (*((void (**)(id, PKNumberPadSuggestionsView *))v4 + 2))(v4, self);
    unsigned __int8 v5 = self->_batchedUpdateCount - 1;
    self->_batchedUpdateCount = v5;
    if (!v5)
    {
      if (self->_needsReload) {
        [(PKNumberPadSuggestionsView *)self _reloadSubviews];
      }
      if (self->_needsUpdate) {
        [(PKNumberPadSuggestionsView *)self _updateButtons];
      }
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)setSuggestions:(id)a3
{
  if (self->_suggestions != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    suggestions = self->_suggestions;
    self->_suggestions = v4;

    [(PKNumberPadSuggestionsView *)self _reloadSubviews];
  }
}

- (void)setButtonTextColor:(id)a3
{
  unsigned __int8 v5 = (UIColor *)a3;
  if (self->_buttonTextColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_buttonTextColor, a3);
    [(PKNumberPadSuggestionsView *)self _updateButtons];
    unsigned __int8 v5 = v6;
  }
}

- (void)setButtonBackgroundColor:(id)a3
{
  unsigned __int8 v5 = (UIColor *)a3;
  if (self->_buttonBackgroundColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_buttonBackgroundColor, a3);
    [(PKNumberPadSuggestionsView *)self _updateButtons];
    unsigned __int8 v5 = v6;
  }
}

- (void)_reloadSubviews
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_batchedUpdateCount)
  {
    self->_needsReload = 1;
  }
  else
  {
    double v3 = (void *)MEMORY[0x1A6224460]();
    self->_needsReload = 0;
    self->_needsUpdate = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = self->_suggestionButtons;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v5);
    }

    suggestionButtons = self->_suggestionButtons;
    self->_suggestionButtons = 0;

    char v9 = [(PKNumberPadSuggestionsView *)self _shouldReverseLayoutDirection];
    v10 = [(NSArray *)self->_suggestions count];
    objc_initWeak(&location, self);
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
    suggestions = self->_suggestions;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke;
    v19 = &unk_1E59D3A68;
    char v23 = v9;
    v22[1] = v10;
    v20 = self;
    objc_copyWeak(v22, &location);
    id v13 = v11;
    id v21 = v13;
    [(NSArray *)suggestions enumerateObjectsUsingBlock:&v16];
    v14 = (NSArray *)objc_msgSend(v13, "copy", v16, v17, v18, v19, v20);
    v15 = self->_suggestionButtons;
    self->_suggestionButtons = v14;

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

void __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 56) - 1 == a3)
  {
    uint64_t v6 = 1;
  }
  else if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v6 = 9;
  }
  else
  {
    uint64_t v6 = 5;
  }
  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke_2;
  v12[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  char v9 = [v8 actionWithHandler:v12];
  v10 = (void *)[v7 _createBorderedButtonForSuggestion:v5 withBorder:v6 primaryAction:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke_3;
  v11[3] = &unk_1E59D3A40;
  v11[4] = *(void *)(a1 + 32);
  [v10 setConfigurationUpdateHandler:v11];
  [*(id *)(a1 + 32) addArrangedSubview:v10];
  [*(id *)(a1 + 40) addObject:v10];

  objc_destroyWeak(&v13);
}

void __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v5 sender];
    [WeakRetained _selectedSuggestion:v4];
  }
}

void __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v3 = [v6 configuration];
  [v3 setBaseForegroundColor:*(void *)(*(void *)(a1 + 32) + 472)];
  id v4 = [v3 background];
  if ([v6 isHighlighted])
  {
    id v5 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    [v4 setBackgroundColor:*(void *)(*(void *)(a1 + 32) + 480)];
  }

  [v6 setConfiguration:v3];
}

- (void)_updateButtons
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_batchedUpdateCount)
  {
    self->_needsUpdate = 1;
  }
  else
  {
    double v3 = (void *)MEMORY[0x1A6224460]();
    self->_needsUpdate = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_suggestionButtons;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "setNeedsUpdateConfiguration", (void)v9);
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)_createBorderedButtonForSuggestion:(id)a3 withBorder:(unint64_t)a4 primaryAction:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a5;
  v8 = +[PKBorderedButtonConfiguration plainButtonConfiguration];
  [v8 setBorder:a4];
  char v23 = [v8 background];
  [v23 setCornerRadius:0.0];
  long long v9 = [v7 displayValue];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v10 setAlignment:1];
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v12 = [v9 componentsSeparatedByString:@"\n"];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    uint64_t v16 = *MEMORY[0x1E4FB0738];
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = [v9 rangeOfString:*(void *)(*((void *)&v27 + 1) + 8 * v17)];
        objc_msgSend(v11, "addAttribute:value:range:", v16, v10, v18, v19);
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  [v8 setAttributedTitle:v11];
  [v8 setTitleAlignment:2];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__PKNumberPadSuggestionsView__createBorderedButtonForSuggestion_withBorder_primaryAction___block_invoke;
  v25[3] = &unk_1E59D3A90;
  id v26 = v7;
  id v20 = v7;
  [v8 setTitleTextAttributesTransformer:v25];
  id v21 = +[PKBorderedButton borderedButtonWithConfiguration:v8 primaryAction:v24];

  return v21;
}

id __90__PKNumberPadSuggestionsView__createBorderedButtonForSuggestion_withBorder_primaryAction___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)[a2 mutableCopy];
  id v4 = [*(id *)(a1 + 32) title];
  uint64_t v5 = [v4 length];

  double v6 = 14.0;
  if (!v5) {
    double v6 = 17.0;
  }
  id v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v6];
  [v3 setObject:v7 forKey:*MEMORY[0x1E4FB06F8]];

  return v3;
}

- (void)_selectedSuggestion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSArray *)self->_suggestions objectAtIndex:[(NSArray *)self->_suggestionButtons indexOfObject:a3]];
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v4 displayValue];
    int v8 = 138412290;
    long long v9 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Suggestion %@ selected", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained numberPadSuggestionsView:self didSelectSuggestion:v4];
}

- (PKNumberPadSuggestionsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKNumberPadSuggestionsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_suggestionButtons, 0);
}

@end