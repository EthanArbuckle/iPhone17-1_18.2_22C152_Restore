@interface SearchUIThumbnailViewController
+ (BOOL)rowModelHasSuggestionThumbnail:(id)a3;
+ (BOOL)supportsRowModel:(id)a3;
+ (id)compactSymbolFont;
+ (int64_t)compactSymbolScale;
+ (void)applyImageConstraintsToImageView:(id)a3 isCompact:(BOOL)a4 preventThumbnailScaling:(BOOL)a5 usesCompactWidth:(BOOL)a6;
- (BOOL)shouldVerticallyCenter;
- (id)imageForRowModel:(id)a3 appearance:(id)a4;
- (id)setupView;
- (unint64_t)type;
- (void)setUsesCompactWidth:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIThumbnailViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3 = a3;
  v4 = [v3 leadingImage];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [v3 fallbackImage];
    if (v6) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = +[SearchUIThumbnailViewController rowModelHasSuggestionThumbnail:v3];
    }
  }
  return v5;
}

+ (BOOL)rowModelHasSuggestionThumbnail:(id)a3
{
  id v3 = [a3 cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (void)applyImageConstraintsToImageView:(id)a3 isCompact:(BOOL)a4 preventThumbnailScaling:(BOOL)a5 usesCompactWidth:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = v9;
  if (v8)
  {
    +[SearchUISuggestionImageUtilities maximumSize];
    objc_msgSend(v10, "setMaximumLayoutSize:");
    +[SearchUISuggestionImageUtilities maximumSize];
    objc_msgSend(v10, "setMinimumLayoutSize:");
  }
  else if (v7)
  {
    [MEMORY[0x1E4FAE100] maxThumbnailSizeIsCompactWidth:v6];
    objc_msgSend(v10, "setMinimumLayoutSize:");
    objc_msgSend(v10, "setMaximumLayoutSize:", *MEMORY[0x1E4F4BED0], *(double *)(MEMORY[0x1E4F4BED0] + 8));
  }
  else
  {
    [MEMORY[0x1E4FAE100] applyRowBoundedSizingToImageView:v9 isCompactWidth:v6];
  }
}

- (id)setupView
{
  v2 = objc_opt_new();
  [v2 setIgnoreImageAlignmentRectInsets:1];
  return v2;
}

- (BOOL)shouldVerticallyCenter
{
  +[SearchUIAppIconImage sizeForVariant:2];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(SearchUILeadingViewController *)self view];
  [v7 intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;

  if (v9 <= v4 && v11 <= v6) {
    return 1;
  }
  v13 = [(SearchUILeadingViewController *)self rowModel];
  char v14 = [v13 useCompactVersionOfUI];

  return v14;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SearchUIThumbnailViewController;
  [(SearchUILeadingViewController *)&v14 updateWithRowModel:v4];
  if (TLKSnippetModernizationEnabled())
  {
    if ([MEMORY[0x1E4FAE198] isMacOS]) {
      [MEMORY[0x1E4FAE090] cachedFontForMacTextStyle:*MEMORY[0x1E4FB2990]];
    }
    else {
    double v5 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB2928]];
    }
    int v6 = [v4 useCompactVersionOfUI];
    BOOL v7 = v5;
    if (v6)
    {
      BOOL v7 = [(id)objc_opt_class() compactSymbolFont];
    }
    double v8 = [(SearchUILeadingViewController *)self view];
    [v8 setSymbolFont:v7];

    if (v6) {
    if ([v4 useCompactVersionOfUI])
    }
      uint64_t v9 = [(id)objc_opt_class() compactSymbolScale];
    else {
      uint64_t v9 = 2;
    }
    double v10 = [(SearchUILeadingViewController *)self view];
    [v10 setSymbolScale:v9];
  }
  double v11 = (void *)MEMORY[0x1E4FAE060];
  v12 = [(SearchUILeadingViewController *)self view];
  v13 = [v11 bestAppearanceForView:v12];
  [(SearchUIThumbnailViewController *)self tlk_updateForAppearance:v13];
}

+ (id)compactSymbolFont
{
  if TLKSnippetModernizationEnabled() && ([MEMORY[0x1E4FAE198] isMacOS])
  {
    v2 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB2990] isShort:0 isBold:1 isMacStyle:1];
  }
  else
  {
    double v3 = (void *)MEMORY[0x1E4FAE090];
    int v4 = TLKBiggerSuggestionsLayoutEnabled();
    double v5 = (void *)MEMORY[0x1E4FB2988];
    if (!v4) {
      double v5 = (void *)MEMORY[0x1E4FB2998];
    }
    v2 = [v3 cachedFontForTextStyle:*v5];
  }
  return v2;
}

+ (int64_t)compactSymbolScale
{
  if (TLKSnippetModernizationEnabled()) {
    int v2 = [MEMORY[0x1E4FAE198] isMacOS];
  }
  else {
    int v2 = 0;
  }
  if (([MEMORY[0x1E4FAE100] isSuperLargeAccessibilitySize] & 1) != 0
    || (TLKBiggerSuggestionsLayoutEnabled() | v2) == 1)
  {
    return 1;
  }
  else
  {
    return 3;
  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIThumbnailViewController;
  [(SearchUILeadingViewController *)&v12 tlk_updateForAppearance:v4];
  double v5 = [(SearchUILeadingViewController *)self rowModel];
  int v6 = [(SearchUILeadingViewController *)self view];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke;
  v9[3] = &unk_1E6E72938;
  v9[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performBatchUpdates:v9];
}

void __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) imageForRowModel:*(void *)(a1 + 40) appearance:*(void *)(a1 + 48)];
  double v3 = (void *)MEMORY[0x1E4FAE060];
  id v4 = [*(id *)(a1 + 32) view];
  [v3 disableAppearanceOverrideForView:v4];

  double v5 = [*(id *)(a1 + 32) rowModel];
  int v6 = [v5 backgroundColor];

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 backgroundColor])
    {
      id v7 = (void *)[v2 copy];
      [v7 setBackgroundColor:0];
      [v7 setCornerRoundingStyle:0];
      [v7 setPrimaryColor:7];
      objc_msgSend(v7, "setSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

      int v2 = v7;
    }
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__3;
    v28 = __Block_byref_object_dispose__3;
    id v29 = (id)objc_opt_new();
    id v8 = [*(id *)(a1 + 32) rowModel];
    uint64_t v9 = [v8 backgroundColor];
    [(id)v25[5] setSfColor:v9];

    [(id)v25[5] setAppearance:*(void *)(a1 + 48)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v10 = v25[5];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke_17;
    v21[3] = &unk_1E6E73A40;
    v21[4] = &v24;
    objc_copyWeak(&v22, &location);
    +[SearchUIBackgroundColorUtilities resolvedColoringForColorRequest:v10 completionHandler:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v24, 8);
  }
  if ([*(id *)(a1 + 40) useCompactVersionOfUI])
  {
    +[SearchUISuggestionImageUtilities maximumSize];
    unint64_t v11 = +[SearchUIAppIconImage bestVariantForSize:](SearchUIAppIconImage, "bestVariantForSize:");
  }
  else
  {
    unint64_t v11 = 4;
  }
  objc_super v12 = +[SearchUIImage imageWithSFImage:v2 variantForAppIcon:v11];
  v13 = [*(id *)(a1 + 32) view];
  objc_super v14 = [*(id *)(a1 + 40) fallbackImage];
  v15 = [*(id *)(a1 + 40) action];
  objc_msgSend(v13, "updateWithImage:fallbackImage:needsOverlayButton:", v12, v14, objc_msgSend(v15, "isOverlay"));

  v16 = objc_opt_class();
  v17 = [*(id *)(a1 + 32) view];
  v18 = [*(id *)(a1 + 32) rowModel];
  uint64_t v19 = [v18 useCompactVersionOfUI];
  v20 = [*(id *)(a1 + 32) rowModel];
  objc_msgSend(v16, "applyImageConstraintsToImageView:isCompact:preventThumbnailScaling:usesCompactWidth:", v17, v19, objc_msgSend(v20, "preventThumbnailImageScaling"), objc_msgSend(*(id *)(a1 + 32), "usesCompactWidth"));
}

void __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 preferKeylineForShadowBasedViews])
  {
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) sfColor];
    double v5 = [v3 colorRequest];
    int v6 = [v5 sfColor];
    int v7 = [v4 isEqual:v6];

    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke_2;
      v8[3] = &unk_1E6E73A18;
      uint64_t v10 = *(void *)(a1 + 32);
      id v9 = v3;
      objc_copyWeak(&v11, (id *)(a1 + 40));
      +[SearchUIUtilities dispatchMainIfNecessary:v8];
      objc_destroyWeak(&v11);
    }
  }
}

void __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) sfColor];
  id v3 = [*(id *)(a1 + 32) colorRequest];
  id v4 = [v3 sfColor];
  int v5 = [v2 isEqual:v4];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v6 = [MEMORY[0x1E4FAE060] appearanceWithStyle:1];
    int v7 = [WeakRetained view];
    [v6 overrideAppearanceForView:v7];
  }
}

- (id)imageForRowModel:(id)a3 appearance:(id)a4
{
  id v4 = a3;
  int v5 = [v4 leadingImage];
  if (v5
    || !+[SearchUIThumbnailViewController rowModelHasSuggestionThumbnail:v4])
  {
    id v7 = v5;
  }
  else
  {
    int v6 = [v4 cardSection];
    id v7 = +[SearchUISuggestionImageUtilities imageForSuggestionCardSection:v6];
  }
  return v7;
}

- (void)setUsesCompactWidth:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SearchUILeadingViewController *)self usesCompactWidth] != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIThumbnailViewController;
    [(SearchUILeadingViewController *)&v10 setUsesCompactWidth:v3];
    int v5 = objc_opt_class();
    int v6 = [(SearchUILeadingViewController *)self view];
    id v7 = [(SearchUILeadingViewController *)self rowModel];
    uint64_t v8 = [v7 useCompactVersionOfUI];
    id v9 = [(SearchUILeadingViewController *)self rowModel];
    objc_msgSend(v5, "applyImageConstraintsToImageView:isCompact:preventThumbnailScaling:usesCompactWidth:", v6, v8, objc_msgSend(v9, "preventThumbnailImageScaling"), -[SearchUILeadingViewController usesCompactWidth](self, "usesCompactWidth"));
  }
}

- (unint64_t)type
{
  return 1;
}

@end