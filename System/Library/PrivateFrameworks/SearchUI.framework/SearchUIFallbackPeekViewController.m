@interface SearchUIFallbackPeekViewController
- (SearchUIFallbackPeekViewController)initWithDetailedRowModel:(id)a3;
@end

@implementation SearchUIFallbackPeekViewController

- (SearchUIFallbackPeekViewController)initWithDetailedRowModel:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SearchUIFallbackPeekViewController;
  v5 = [(SearchUIFallbackPeekViewController *)&v71 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v7 = [(SearchUIFallbackPeekViewController *)v5 view];
    [v7 setBackgroundColor:v6];

    v8 = [(SearchUIFallbackPeekViewController *)v5 view];
    v9 = objc_msgSend(v8, "tlks_screen");
    [v9 _referenceBounds];
    double Width = CGRectGetWidth(v75);

    double v11 = Width / (Width + -32.0);
    v61 = objc_opt_new();
    v12 = [v4 identifyingResult];
    v59 = v5;
    if (v12)
    {
      v13 = [v4 identifyingResult];
      +[SearchUIAppIconImage appIconForResult:v13 variant:3];
    }
    else
    {
      v13 = [v4 applicationBundleIdentifier];
      +[SearchUIAppIconImage appIconForBundleIdentifier:v13 variant:3];
    v14 = };

    [v14 size];
    double v16 = ceil(v11 * v15);
    [v14 size];
    objc_msgSend(v14, "setSize:", v16, ceil(v11 * v17));
    v58 = v14;
    v57 = +[SearchUIImageView imageViewWithImage:v14];
    objc_msgSend(v61, "addObject:");
    v18 = objc_opt_new();
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __63__SearchUIFallbackPeekViewController_initWithDetailedRowModel___block_invoke;
    v67[3] = &unk_1E6E73598;
    id v19 = v18;
    id v68 = v19;
    uint64_t v70 = 0x4031000000000000;
    id v60 = v4;
    id v20 = v4;
    id v69 = v20;
    [v19 performBatchUpdates:v67];
    [v61 addObject:v19];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = [v20 details];
    uint64_t v21 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v64 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          id v26 = objc_alloc(MEMORY[0x1E4FAE0F8]);
          v27 = [v20 details];
          v28 = [v27 firstObject];
          v29 = (void *)[v26 initWithProminence:v25 != v28];

          v30 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
          [v29 setFont:v30];

          v31 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v25];
          if ([v31 hasContent])
          {
            [v31 setMaxLines:0];
            [v29 setRichText:v31];
            [v61 addObject:v29];
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v22);
    }

    v32 = [v61 lastObject];
    LODWORD(v33) = 1132068864;
    [v32 setContentCompressionResistancePriority:1 forAxis:v33];
    v34 = [v20 leadingImage];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v35 = [v34 bundleIdentifier];
    }
    else
    {
      v35 = 0;
    }
    v5 = v59;
    if ([v34 isEqual:v58]) {
      goto LABEL_28;
    }
    v36 = [v58 bundleIdentifier];
    char v37 = [v35 isEqual:v36];

    if (!v34 || (v37 & 1) != 0) {
      goto LABEL_28;
    }
    uint64_t v38 = [v20 fallbackImage];
    v39 = v34;
    if (v34 != (void *)v38)
    {
      v40 = (void *)v38;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
LABEL_28:
        v46 = (void *)[objc_alloc(MEMORY[0x1E4F4BF00]) initWithArrangedSubviews:v61];
        float v47 = v11 * 21.0;
        [v46 setSpacing:ceilf(v47)];
        [v46 setBaselineRelativeArrangement:1];
        float v48 = v11 * 32.0;
        [v46 setCustomSpacing:v57 afterView:ceilf(v48)];
        float v49 = v11 * 16.0;
        [v46 setCustomSpacing:v32 afterView:ceilf(v49)];
        [v46 setAxis:1];
        [v46 setAlignment:1];
        float v50 = v11 * 23.0;
        double v51 = ceilf(v50);
        id v52 = objc_alloc(MEMORY[0x1E4F4BEE8]);
        v72 = v46;
        v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
        v54 = (void *)[v52 initWithArrangedSubviews:v53];

        [v54 setVerticalAlignment:1];
        [v54 setLayoutMarginsRelativeArrangement:1];
        objc_msgSend(v54, "setLayoutMargins:", v51, v51, v51, v51);
        v55 = [(SearchUIFallbackPeekViewController *)v59 view];
        [v55 addSubview:v54];

        +[SearchUIAutoLayout fillContainerWithView:v54];
        id v4 = v60;
        goto LABEL_29;
      }
      v39 = +[SearchUIImageView imageViewWithImage:v34];
      [v34 size];
      if (v43 == *MEMORY[0x1E4F1DB30] && v42 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        [MEMORY[0x1E4FAE100] maxThumbnailSize];
        double v45 = v11 * v44;
        objc_msgSend(v39, "setMinimumLayoutSize:", v45, v45);
        objc_msgSend(v39, "setMaximumLayoutSize:", v45, v45);
      }
      objc_msgSend(v39, "setMaximumLayoutSize:", 1.79769313e308, v11 * 120.0);
      [v61 addObject:v39];
    }

    goto LABEL_28;
  }
LABEL_29:

  return v5;
}

void __63__SearchUIFallbackPeekViewController_initWithDetailedRowModel___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB08E0] systemFontOfSize:*(double *)(a1 + 48) weight:*MEMORY[0x1E4FB09E0]];
  [*(id *)(a1 + 32) setFont:v2];

  v3 = [*(id *)(a1 + 40) title];
  id v4 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v3];

  [v4 setMaxLines:0];
  [*(id *)(a1 + 32) setRichText:v4];
}

@end