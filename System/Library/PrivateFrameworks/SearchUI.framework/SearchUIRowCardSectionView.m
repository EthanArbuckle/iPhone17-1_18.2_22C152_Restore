@interface SearchUIRowCardSectionView
+ (BOOL)hasLeadingImageForCardSection:(id)a3;
+ (BOOL)prefersNoSeparatorAboveRowModel:(id)a3;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (id)dragSubtitleForCardSection:(id)a3;
+ (id)dragTitleForCardSection:(id)a3;
- (id)leadingTextView;
- (id)setupContentView;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIRowCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)hasLeadingImageForCardSection:(id)a3
{
  id v3 = a3;
  v4 = [v3 image];
  if (v4) {
    int v5 = [v3 imageIsRightAligned] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)prefersNoSeparatorAboveRowModel:(id)a3
{
  v4 = [a3 cardSection];
  int v5 = [v4 leadingText];
  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = [v4 leadingSubtitle];
    if (v7) {
      LOBYTE(v6) = 0;
    }
    else {
      int v6 = [a1 hasLeadingImageForCardSection:v4] ^ 1;
    }
  }
  return v6;
}

- (id)setupContentView
{
  v2 = objc_opt_new();
  return v2;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  int v5 = [v4 cardSection];
  v23.receiver = self;
  v23.super_class = (Class)SearchUIRowCardSectionView;
  [(SearchUICardSectionView *)&v23 updateWithRowModel:v4];

  int v6 = [v5 punchoutOptions];
  v7 = [v6 firstObject];
  v8 = [v7 bundleIdentifier];

  if ([v5 imageIsRightAligned]
    && v8
    && +[SearchUIUtilities appIsValidForBundleIdentifier:v8])
  {
    v9 = +[SearchUIUtilities bundleIdentifierForApp:14];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      v11 = [[SearchUIDefaultBrowserAppIconImage alloc] initWithVariant:2];
      if (!v11) {
        goto LABEL_8;
      }
    }
    else
    {
      v11 = +[SearchUIAppIconImage appIconForBundleIdentifier:v8 variant:2];
      if (!v11) {
        goto LABEL_8;
      }
    }
LABEL_11:
    v12 = v11;
    v13 = v12;
    goto LABEL_12;
  }
LABEL_8:
  if (([v5 imageIsRightAligned] & 1) == 0)
  {
    v11 = 0;
    goto LABEL_11;
  }
  v12 = [v5 image];
  v13 = 0;
LABEL_12:
  v14 = [(SearchUICardSectionView *)self contentView];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__SearchUIRowCardSectionView_updateWithRowModel___block_invoke;
  v18[3] = &unk_1E6E72560;
  id v19 = v14;
  id v20 = v5;
  v21 = v12;
  uint64_t v22 = 2;
  v15 = v12;
  id v16 = v5;
  id v17 = v14;
  [v17 performBatchUpdates:v18];
}

void __49__SearchUIRowCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 40) imageIsRightAligned])
  {
    [*(id *)(a1 + 32) setLeadingImage:0];
  }
  else
  {
    v2 = [*(id *)(a1 + 40) image];
    id v3 = +[SearchUIImage imageWithSFImage:v2 variantForAppIcon:*(void *)(a1 + 56)];
    id v4 = +[SearchUITLKImageConverter imageForSFImage:v3];
    [*(id *)(a1 + 32) setLeadingImage:v4];
  }
  int v5 = [*(id *)(a1 + 40) leadingText];
  int v6 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v5];
  [*(id *)(a1 + 32) setLeadingTitle:v6];

  v7 = [*(id *)(a1 + 40) trailingText];
  v8 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v7];
  [*(id *)(a1 + 32) setTrailingTitle:v8];

  v9 = [*(id *)(a1 + 40) leadingSubtitle];
  int v10 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v9];
  [*(id *)(a1 + 32) setLeadingSubtitle:v10];

  v11 = [*(id *)(a1 + 40) trailingSubtitle];
  v12 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v11];
  [*(id *)(a1 + 32) setTrailingSubtitle:v12];

  id v14 = +[SearchUIImage imageWithSFImage:*(void *)(a1 + 48) variantForAppIcon:*(void *)(a1 + 56)];
  v13 = +[SearchUITLKImageConverter imageForSFImage:v14];
  [*(id *)(a1 + 32) setTrailingImage:v13];
}

- (id)leadingTextView
{
  v2 = [(SearchUICardSectionView *)self contentView];
  id v3 = [v2 leadingTextView];

  return v3;
}

+ (id)dragTitleForCardSection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 leadingText];
  int v5 = +[SearchUIUtilities stringForSFRichText:v4];

  int v6 = [v3 leadingSubtitle];

  if (v6)
  {
    v7 = [v3 leadingSubtitle];
    v8 = +[SearchUIUtilities stringForSFRichText:v7];
    uint64_t v9 = [v5 stringByAppendingFormat:@", %@", v8];

    int v5 = (void *)v9;
  }

  return v5;
}

+ (id)dragSubtitleForCardSection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 trailingText];
  int v5 = +[SearchUIUtilities stringForSFRichText:v4];

  int v6 = [v3 trailingSubtitle];

  if (v6)
  {
    v7 = [v3 trailingSubtitle];
    v8 = +[SearchUIUtilities stringForSFRichText:v7];
    uint64_t v9 = [v5 stringByAppendingFormat:@", %@", v8];

    int v5 = (void *)v9;
  }

  return v5;
}

@end