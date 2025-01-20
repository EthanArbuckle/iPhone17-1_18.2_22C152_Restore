@interface SearchSuggestionTableViewCell
+ (id)_matchedTextAttributes;
+ (id)_suggestedTextAttributes;
- (BOOL)_isLabelPreviousSearchesInCompletionListEnabled;
- (BOOL)hidesCompletionArrowView;
- (BOOL)hidesHistoryLastAccessedLabel;
- (BOOL)hidesImage;
- (BOOL)usesDownBackwardCompletionArrow;
- (SearchSuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)accessoryActionHandler;
- (void)_accessoryButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
- (void)prepareForReuse;
- (void)setAccessoryActionHandler:(id)a3;
- (void)setHidesCompletionArrowView:(BOOL)a3;
- (void)setHidesHistoryLastAccessedLabel:(BOOL)a3;
- (void)setHidesImage:(BOOL)a3;
- (void)setHistoryLastAccessedLabel:(id)a3;
- (void)setSearchSuggestion:(id)a3 withQuery:(id)a4;
- (void)setUsesDownBackwardCompletionArrow:(BOOL)a3;
@end

@implementation SearchSuggestionTableViewCell

+ (id)_matchedTextAttributes
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if (_matchedTextAttributes_onceToken != -1) {
    dispatch_once(&_matchedTextAttributes_onceToken, &__block_literal_global_33);
  }
  uint64_t v2 = *MEMORY[0x1E4FB0700];
  v6[0] = *MEMORY[0x1E4FB0738];
  v6[1] = v2;
  v7[0] = _matchedTextAttributes_paragraphStyle;
  v7[1] = _matchedTextAttributes_color;
  v6[2] = *MEMORY[0x1E4FB06F8];
  v3 = [(id)_matchedTextAttributes_font _fontAdjustedForCurrentContentSizeCategory];
  v7[2] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

void __55__SearchSuggestionTableViewCell__matchedTextAttributes__block_invoke()
{
  v0 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v1 = [v0 mutableCopy];
  uint64_t v2 = (void *)_matchedTextAttributes_paragraphStyle;
  _matchedTextAttributes_paragraphStyle = v1;

  [(id)_matchedTextAttributes_paragraphStyle setLineBreakMode:4];
  v3 = (void *)MEMORY[0x1E4FB1618];
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  v5 = objc_msgSend(v4, "safari_numberForKey:", *MEMORY[0x1E4F78720]);
  uint64_t v6 = objc_msgSend(v3, "safari_labelColorFromNumber:", v5);
  v7 = (void *)_matchedTextAttributes_color;
  _matchedTextAttributes_color = v6;

  v8 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v9 = *MEMORY[0x1E4FB28C8];
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v14, "safari_numberForKey:", *MEMORY[0x1E4F78728]);
  [v10 floatValue];
  uint64_t v12 = [v8 _preferredFontForTextStyle:v9 weight:v11];
  v13 = (void *)_matchedTextAttributes_font;
  _matchedTextAttributes_font = v12;
}

+ (id)_suggestedTextAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (_suggestedTextAttributes_onceToken != -1) {
    dispatch_once(&_suggestedTextAttributes_onceToken, &__block_literal_global_44);
  }
  uint64_t v2 = *MEMORY[0x1E4FB06F8];
  v6[0] = *MEMORY[0x1E4FB0700];
  v6[1] = v2;
  v7[0] = _suggestedTextAttributes_color;
  v3 = [(id)_suggestedTextAttributes_font _fontAdjustedForCurrentContentSizeCategory];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void __57__SearchSuggestionTableViewCell__suggestedTextAttributes__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v2 = objc_msgSend(v1, "safari_numberForKey:", *MEMORY[0x1E4F787D0]);
  uint64_t v3 = objc_msgSend(v0, "safari_labelColorFromNumber:", v2);
  v4 = (void *)_suggestedTextAttributes_color;
  _suggestedTextAttributes_color = v3;

  v5 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v6 = *MEMORY[0x1E4FB28C8];
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "safari_numberForKey:", *MEMORY[0x1E4F787D8]);
  [v7 floatValue];
  uint64_t v9 = [v5 _preferredFontForTextStyle:v6 weight:v8];
  v10 = (void *)_suggestedTextAttributes_font;
  _suggestedTextAttributes_font = v9;
}

- (SearchSuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SearchSuggestionTableViewCell;
  v4 = [(SearchSuggestionTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
    uint64_t v6 = [(SearchSuggestionTableViewCell *)v4 imageView];
    [v6 setImage:v5];

    v7 = [MEMORY[0x1E4FB1618] labelColor];
    float v8 = [(SearchSuggestionTableViewCell *)v4 imageView];
    [v8 setTintColor:v7];

    uint64_t v9 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
    v10 = [(SearchSuggestionTableViewCell *)v4 imageView];
    [v10 setPreferredSymbolConfiguration:v9];

    id v11 = objc_alloc_init(CompletionArrowView);
    completionArrowView = v4->_completionArrowView;
    v4->_completionArrowView = v11;

    [(CompletionArrowView *)v4->_completionArrowView setParentCell:v4];
    [(CompletionArrowView *)v4->_completionArrowView addTarget:v4 action:sel__accessoryButtonTapped_ forControlEvents:0x2000];
    if ([MEMORY[0x1E4F97EA0] isLabelPreviousSearchesInCompletionListEnabled]) {
      [(SearchSuggestionTableViewCell *)v4 setHidesHistoryLastAccessedLabel:1];
    }
    [(SearchSuggestionTableViewCell *)v4 setHidesCompletionArrowView:1];
    v18[0] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v14 = (id)[(SearchSuggestionTableViewCell *)v4 registerForTraitChanges:v13 withTarget:v4 action:sel_preferredContentSizeCategoryDidChange];

    v15 = v4;
  }

  return v4;
}

- (BOOL)_isLabelPreviousSearchesInCompletionListEnabled
{
  return [MEMORY[0x1E4F97EA0] isLabelPreviousSearchesInCompletionListEnabled];
}

- (BOOL)hidesImage
{
  uint64_t v2 = [(SearchSuggestionTableViewCell *)self imageView];
  uint64_t v3 = [v2 image];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)setHidesImage:(BOOL)a3
{
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
  }
  uint64_t v6 = [(SearchSuggestionTableViewCell *)self imageView];
  [v6 setImage:v5];

  if (!a3) {
  [(SearchSuggestionTableViewCell *)self setNeedsDisplay];
  }
  [(SearchSuggestionTableViewCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SearchSuggestionTableViewCell;
  [(SearchSuggestionTableViewCell *)&v3 prepareForReuse];
  [(SearchSuggestionTableViewCell *)self setHidesCompletionArrowView:1];
  if ([(SearchSuggestionTableViewCell *)self _isLabelPreviousSearchesInCompletionListEnabled])
  {
    [(SearchSuggestionTableViewCell *)self setHidesHistoryLastAccessedLabel:1];
  }
}

- (void)setHidesCompletionArrowView:(BOOL)a3
{
  if (self->_hidesCompletionArrowView != a3)
  {
    self->_hidesCompletionArrowView = a3;
    if (a3)
    {
      completionArrowView = 0;
    }
    else
    {
      [(CompletionArrowView *)self->_completionArrowView sizeToFit];
      completionArrowView = self->_completionArrowView;
    }
    [(SearchSuggestionTableViewCell *)self setAccessoryView:completionArrowView];
  }
}

- (void)setHidesHistoryLastAccessedLabel:(BOOL)a3
{
  if (self->_hidesHistoryLastAccessedLabel != a3)
  {
    self->_hidesHistoryLastAccessedLabel = a3;
    BOOL v4 = [(SearchSuggestionTableViewCell *)self detailTextLabel];
    id v5 = v4;
    if (a3) {
      [v4 setText:0];
    }
    else {
      [v4 sizeToFit];
    }
  }
}

- (void)setHistoryLastAccessedLabel:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (objc_class *)MEMORY[0x1E4F28E48];
  id v5 = a3;
  id v6 = [v4 alloc];
  v13[0] = *MEMORY[0x1E4FB0700];
  v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v14[0] = v7;
  v13[1] = *MEMORY[0x1E4FB06F8];
  float v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  uint64_t v9 = [v8 _fontAdjustedForCurrentContentSizeCategory];
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v11 = (void *)[v6 initWithString:v5 attributes:v10];

  uint64_t v12 = [(SearchSuggestionTableViewCell *)self detailTextLabel];
  [v12 setAttributedText:v11];
}

- (BOOL)usesDownBackwardCompletionArrow
{
  return [(CompletionArrowView *)self->_completionArrowView usesDownBackwardCompletionArrow];
}

- (void)setUsesDownBackwardCompletionArrow:(BOOL)a3
{
}

- (void)setSearchSuggestion:(id)a3 withQuery:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v9 = +[SearchSuggestionTableViewCell _matchedTextAttributes];
  v10 = (void *)[v8 initWithString:v6 attributes:v9];

  if ([v10 length])
  {
    v27 = self;
    id v11 = +[SearchSuggestionTableViewCell _suggestedTextAttributes];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v12 = [v10 string];
    v13 = [v7 rangesToHighlightInSearchSuggestion:v12];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v28 + 1) + 8 * i) rangeValue];
          uint64_t v20 = v19;
          if (v19 + v18 > (unint64_t)[v10 length])
          {
            v21 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v24 = v21;
              uint64_t v25 = [v10 length];
              uint64_t v26 = [v6 length];
              *(_DWORD *)buf = 134219011;
              uint64_t v33 = v18;
              __int16 v34 = 2048;
              uint64_t v35 = v20;
              __int16 v36 = 2117;
              v37 = v10;
              __int16 v38 = 2048;
              uint64_t v39 = v25;
              __int16 v40 = 2048;
              uint64_t v41 = v26;
              _os_log_error_impl(&dword_1E102C000, v24, OS_LOG_TYPE_ERROR, "Invalid range(loc=%lu, len=%lu) for attributedString %{sensitive}@ with length=%lu generated from suggestion with length=%lu", buf, 0x34u);
            }
            goto LABEL_13;
          }
          objc_msgSend(v10, "addAttributes:range:", v11, v18, v20);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v42 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    v22 = [(SearchSuggestionTableViewCell *)v27 textLabel];
    [v22 setAttributedText:v10];
  }
  else
  {
    v23 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SearchSuggestionTableViewCell setSearchSuggestion:withQuery:](v23);
    }
  }
}

- (void)preferredContentSizeCategoryDidChange
{
  if (!self->_hidesCompletionArrowView)
  {
    [(SearchSuggestionTableViewCell *)self setHidesCompletionArrowView:1];
    [(SearchSuggestionTableViewCell *)self setHidesCompletionArrowView:0];
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SearchSuggestionTableViewCell;
  [(CompletionListTableViewCell *)&v15 layoutSubviews];
  if (([(SearchSuggestionTableViewCell *)self _sf_usesLeftToRightLayout] & 1) == 0)
  {
    objc_super v3 = [(SearchSuggestionTableViewCell *)self textLabel];
    [v3 frame];
    BOOL v4 = [(SearchSuggestionTableViewCell *)self layoutManager];
    [(SearchSuggestionTableViewCell *)self frame];
    [v4 textRectForCell:self rowWidth:0 forSizing:v5];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v16.origin.x = v7;
    v16.origin.y = v9;
    v16.size.width = v11;
    v16.size.height = v13;
    CGRectGetWidth(v16);
    _SFRoundRectToPixels();
    objc_msgSend(v3, "setFrame:");
    uint64_t v14 = [(SearchSuggestionTableViewCell *)self detailTextLabel];
    [v14 frame];
    v17.origin.x = v7;
    v17.origin.y = v9;
    v17.size.width = v11;
    v17.size.height = v13;
    CGRectGetWidth(v17);
    _SFRoundRectToPixels();
    objc_msgSend(v14, "setFrame:");
  }
}

- (void)_accessoryButtonTapped:(id)a3
{
  accessoryActionHandler = (void (**)(void))self->_accessoryActionHandler;
  if (accessoryActionHandler) {
    accessoryActionHandler[2]();
  }
}

- (BOOL)hidesCompletionArrowView
{
  return self->_hidesCompletionArrowView;
}

- (BOOL)hidesHistoryLastAccessedLabel
{
  return self->_hidesHistoryLastAccessedLabel;
}

- (id)accessoryActionHandler
{
  return self->_accessoryActionHandler;
}

- (void)setAccessoryActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessoryActionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryContainerStackView, 0);
  objc_storeStrong((id *)&self->_accessoryContainerView, 0);
  objc_storeStrong((id *)&self->_completionArrowView, 0);
}

- (void)setSearchSuggestion:(os_log_t)log withQuery:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Attributed string for search suggestion has 0 length", v1, 2u);
}

@end