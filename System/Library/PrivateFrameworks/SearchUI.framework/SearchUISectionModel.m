@interface SearchUISectionModel
+ (SearchUISectionModel)sectionModelWithGridRowModels:(id)a3 numberOfColumns:(int64_t)a4 gridStyle:(int)a5 section:(id)a6 expandedCollectionSections:(id)a7;
+ (SearchUISectionModel)sectionModelWithRows:(id)a3 drawPlattersIfNecessary:(BOOL)a4 section:(id)a5 expandedCollectionSections:(id)a6;
+ (SearchUISectionModel)sectionModelWithScrollingRowModels:(id)a3 numberOfRows:(int64_t)a4 section:(id)a5;
+ (int64_t)sectionType;
- (BOOL)drawPlattersIfNecessary;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsHeader;
- (BOOL)needsHeaderSeparator;
- (BOOL)needsHorizontalNavigation;
- (BOOL)selfSizingInTwoAxes;
- (BOOL)shouldDisplayChevronForIndex:(unint64_t)a3 nextCardsEnabled:(BOOL)a4;
- (BOOL)shouldHeightMatchSection;
- (BOOL)shouldInsetGroupedCollectionStyle;
- (BOOL)shouldLeaveSpaceForChevronForIndex:(unint64_t)a3;
- (NSArray)rowModels;
- (NSDirectionalEdgeInsets)headerInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4;
- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4;
- (SearchUIAsyncSectionLoader)asyncLoader;
- (SearchUISection)section;
- (SearchUISectionModel)initWithRowModels:(id)a3 section:(id)a4;
- (double)horizontalInsetWithAttributes:(id)a3 forSupplementary:(BOOL)a4;
- (id)backgroundColor;
- (id)copyWithRowModels:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5;
- (id)overriddenAccessibilityIdentifier;
- (int)separatorStyleForIndex:(unint64_t)a3;
- (int)separatorStyleForIndex:(unint64_t)a3 shouldDrawTopAndBottomSeparators:(BOOL)a4;
- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3;
- (unint64_t)hash;
- (unint64_t)numberOfSections;
- (void)prepareForSnapshot;
- (void)reloadCornerMaskingOverrideWithAttributes:(id)a3;
- (void)setAsyncLoader:(id)a3;
- (void)setDrawPlattersIfNecessary:(BOOL)a3;
- (void)setNumberOfSections:(unint64_t)a3;
- (void)setRowModels:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation SearchUISectionModel

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SearchUISectionModel *)self section];
  v6 = [v5 sectionIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.spotlight.tophits"];

  v8 = [(SearchUISectionModel *)self section];
  v9 = [v8 sectionIdentifier];
  char v10 = [v9 isEqualToString:@"com.apple.other:show_more"];

  if (!TLKSnippetModernizationEnabled())
  {
LABEL_38:
    if (![(SearchUISectionModel *)self drawPlattersIfNecessary]
      && ([v4 shouldUseInsetRoundedSections] & 1) != 0)
    {
      int64_t v14 = 5;
      goto LABEL_44;
    }
    if (([v4 shouldUseInsetRoundedSections] & 1) == 0)
    {
      v44 = [(SearchUISectionModel *)self rowModels];
      v45 = [v44 firstObject];
      v46 = [v45 cardSection];
      objc_opt_class();
      int64_t v14 = objc_opt_isKindOfClass() & 1;

      goto LABEL_44;
    }
    goto LABEL_42;
  }
  v11 = [(SearchUISectionModel *)self rowModels];
  v12 = [v11 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v13 = +[SearchUIUtilities isIpad];

    if (v13)
    {
      int64_t v14 = 2;
      goto LABEL_44;
    }
  }
  else
  {
  }
  v15 = [(SearchUISectionModel *)self rowModels];
  v16 = [v15 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (v7) {
      int64_t v14 = 1;
    }
    else {
      int64_t v14 = 5;
    }
    goto LABEL_44;
  }
  if ((v10 & 1) != 0
    || [(SearchUISectionModel *)self shouldInsetGroupedCollectionStyle])
  {
LABEL_42:
    int64_t v14 = 1;
    goto LABEL_44;
  }
  v49 = v4;
  v18 = [(SearchUISectionModel *)self rowModels];
  v19 = [v18 firstObject];
  v52 = [v19 backgroundColor];

  v20 = [(SearchUISectionModel *)self rowModels];
  v21 = [v20 firstObject];
  v51 = [v21 identifyingResult];

  v22 = [(SearchUISectionModel *)self rowModels];
  v23 = [v22 firstObject];
  int v24 = [v23 fillsBackgroundWithContent];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = [(SearchUISectionModel *)self rowModels];
  uint64_t v25 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  v54 = self;
  if (!v25)
  {
    LOBYTE(v55) = 0;
    LOBYTE(v27) = 0;
    goto LABEL_33;
  }
  uint64_t v26 = v25;
  int v55 = 0;
  LOBYTE(v27) = 0;
  uint64_t v28 = *(void *)v57;
  do
  {
    for (uint64_t i = 0; i != v26; ++i)
    {
      if (*(void *)v57 != v28) {
        objc_enumerationMutation(obj);
      }
      v30 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      v31 = [(SearchUISectionModel *)self rowModels];
      v32 = [v31 firstObject];
      char v33 = [v30 isEqual:v32];

      if ((v33 & 1) == 0)
      {
        int v34 = [v30 fillsBackgroundWithContent];
        int v35 = v55;
        if (v55)
        {
          int v36 = 0;
          goto LABEL_26;
        }
        if (v52 || ([v30 backgroundColor], (v50 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v37 = [v30 backgroundColor];
          int v36 = [v52 isEqual:v37] ^ 1;

          int v35 = v55;
          if (!v52) {
LABEL_25:
          }

LABEL_26:
          v24 &= v34;
          int v55 = v36 | v35;
          if (v27)
          {
            LOBYTE(v27) = 1;
          }
          else
          {
            v38 = [v30 identifyingResult];
            int v27 = [v51 isEqual:v38] ^ 1;
          }
          goto LABEL_29;
        }
        v50 = 0;
        int v36 = 0;
        goto LABEL_25;
      }
LABEL_29:
      self = v54;
    }
    uint64_t v26 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  }
  while (v26);
LABEL_33:

  v39 = [(SearchUISectionModel *)self rowModels];
  v40 = [v39 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = [(SearchUISectionModel *)self rowModels];
    v42 = [v41 firstObject];
    char v43 = [v42 useCompactVersionOfUI];
  }
  else
  {
    char v43 = 0;
  }

  if (v43 & 1 | (((v7 | v24) & 1) == 0) | v27 & 1)
  {

    id v4 = v49;
    self = v54;
    goto LABEL_38;
  }
  v48 = [(SearchUISectionModel *)v54 rowModels];
  id v4 = v49;
  if (((unint64_t)[v48 count] < 2) | v55 & 1) {
    int64_t v14 = [v49 inPreviewPlatter] ^ 1;
  }
  else {
    int64_t v14 = 4;
  }

LABEL_44:
  return v14;
}

- (NSArray)rowModels
{
  return self->_rowModels;
}

- (unint64_t)hash
{
  v2 = [(SearchUISectionModel *)self section];
  v3 = [v2 sectionIdentifier];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (SearchUISection)section
{
  return self->_section;
}

- (int)separatorStyleForIndex:(unint64_t)a3 shouldDrawTopAndBottomSeparators:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = [(SearchUISectionModel *)self rowModels];
  v8 = objc_msgSend(v7, "searchui_safeObjectAtIndex:", a3);

  v9 = [(SearchUISectionModel *)self rowModels];
  char v10 = objc_msgSend(v9, "searchui_safeObjectAtIndex:", a3 + 1);

  int v11 = [v8 separatorStyle];
  if (!v10 && !v4
    || [v8 fillsBackgroundWithContent]
    && ![(SearchUISectionModel *)self shouldInsetGroupedCollectionStyle])
  {
    goto LABEL_3;
  }
  if (v11 == 3) {
    goto LABEL_15;
  }
  if (v11) {
    goto LABEL_12;
  }
  if (([v10 prefersNoSeparatorAbove] & 1) == 0)
  {
LABEL_15:
    if ([v10 hasLeadingImage]) {
      int v11 = 3;
    }
    else {
      int v11 = 2;
    }
  }
  else
  {
LABEL_3:
    int v11 = 1;
  }
LABEL_12:

  return v11;
}

- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v10 snapshot];
  -[SearchUISectionModel setNumberOfSections:](self, "setNumberOfSections:", [v11 numberOfSections]);

  int v12 = [v9 shouldUseInsetRoundedSections];
  BOOL v13 = [(SearchUISectionModel *)self rowModels];
  int64_t v14 = [v13 firstObject];

  int v35 = v14;
  v15 = [v14 cardSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v16 = TLKSnippetModernizationEnabled() ^ 1;
  }
  else {
    int v16 = 0;
  }
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  unsigned __int8 v18 = objc_opt_isKindOfClass();
  int v36 = v8;
  v19 = [v8 traitCollection];
  uint64_t v20 = [v19 userInterfaceIdiom];

  if (v12)
  {
    if (([(SearchUISectionModel *)self drawPlattersIfNecessary] | v16))
    {
LABEL_6:
      uint64_t v21 = 2;
      goto LABEL_11;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if ((isKindOfClass | v18)) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 1;
  }
LABEL_11:
  BOOL v22 = v20 == 3;
  v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:v21];
  +[SearchUIAutoLayout sectionCornerRadius];
  objc_msgSend(v23, "_setCornerRadius:");
  int v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1958]) initWithListAppearance:v21];
  uint64_t v25 = [v9 appearance];
  uint64_t v26 = +[SearchUISeparatorView separatorColorForAppearance:v25];
  [v24 setColor:v26];

  [v23 setSeparatorConfiguration:v24];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke;
  v46[3] = &unk_1E6E74468;
  id v27 = v10;
  id v47 = v27;
  id v28 = v9;
  id v48 = v28;
  [v23 setLeadingSwipeActionsConfigurationProvider:v46];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke_2;
  v43[3] = &unk_1E6E74468;
  id v29 = v27;
  id v44 = v29;
  id v30 = v28;
  id v45 = v30;
  [v23 setTrailingSwipeActionsConfigurationProvider:v43];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke_3;
  v37[3] = &unk_1E6E74490;
  BOOL v41 = v22;
  char v42 = v12;
  id v38 = v29;
  id v39 = v30;
  v40 = self;
  id v31 = v30;
  id v32 = v29;
  [v23 setItemSeparatorHandler:v37];
  char v33 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v23 layoutEnvironment:v36];
  [v33 setDecorationItems:MEMORY[0x1E4F1CBF0]];
  [(SearchUISectionModel *)self reloadCornerMaskingOverrideWithAttributes:v31];

  return v33;
}

- (void)reloadCornerMaskingOverrideWithAttributes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SearchUISectionModel *)self rowModels];
  v6 = [v5 firstObject];

  int v7 = [(SearchUISectionModel *)self rowModels];
  id v8 = [v7 lastObject];

  if (v6
    && ([v6 isEqual:v8] & 1) == 0
    && +[SearchUISectionBackgroundStyleUtilities backgroundStyleNeedsInset:[(SearchUISectionModel *)self sectionBackgroundStyleWithAttributes:v4]])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = [(SearchUISectionModel *)self rowModels];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          int64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v14 setCornerMask:0];
          [v14 setHasCustomCornerRounding:1];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    objc_msgSend(v6, "setCornerMask:", objc_msgSend(v6, "cornerMask") | 3);
    [v6 setHasCustomCornerRounding:1];
    objc_msgSend(v8, "setCornerMask:", objc_msgSend(v8, "cornerMask") | 0xC);
    [v8 setHasCustomCornerRounding:1];
  }
}

- (BOOL)drawPlattersIfNecessary
{
  return self->_drawPlattersIfNecessary;
}

id __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = objc_msgSend(*(id *)(a1 + 32), "sectionIdentifierForIndex:", objc_msgSend(v5, "section"));
  int v8 = objc_msgSend(v7, "separatorStyleForIndex:", objc_msgSend(v5, "item"));
  uint64_t v9 = [v5 row];
  uint64_t v10 = [v7 rowModels];
  uint64_t v11 = [v10 count];

  uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "sectionIdentifierForIndex:", objc_msgSend(v5, "section") + 1);
  if ([v5 row] && (objc_msgSend(MEMORY[0x1E4FAE198], "isWatchOS") & 1) == 0) {
    uint64_t v13 = 2 * *(unsigned __int8 *)(a1 + 56);
  }
  else {
    uint64_t v13 = 2;
  }
  uint64_t v14 = v11 - 1;
  [v6 setTopSeparatorVisibility:v13];
  if (v8 == 1
    || ([v7 drawPlattersIfNecessary] & 1) == 0
    && !*(unsigned char *)(a1 + 57)
    && v9 == v14
    && ([v12 drawPlattersIfNecessary] & 1) != 0)
  {
    uint64_t v15 = 2;
  }
  else
  {
    uint64_t v15 = 2 * *(unsigned __int8 *)(a1 + 56);
  }
  [v6 setBottomSeparatorVisibility:v15];
  if (v9 == v14)
  {
    if ([*(id *)(a1 + 40) hasFooter])
    {
      uint64_t v16 = [v5 section];
      if (v16 == [*(id *)(a1 + 48) numberOfSections] - 1
        && (unint64_t)[*(id *)(a1 + 48) numberOfSections] >= 2)
      {
        [v6 setBottomSeparatorVisibility:0];
      }
    }
  }

  return v6;
}

- (int)separatorStyleForIndex:(unint64_t)a3
{
  return [(SearchUISectionModel *)self separatorStyleForIndex:a3 shouldDrawTopAndBottomSeparators:0];
}

- (BOOL)shouldHeightMatchSection
{
  return 0;
}

+ (SearchUISectionModel)sectionModelWithRows:(id)a3 drawPlattersIfNecessary:(BOOL)a4 section:(id)a5 expandedCollectionSections:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = [v11 collectionSection];
  uint64_t v13 = [v12 collectionStyle];
  unint64_t v14 = [(id)v13 initiallyVisibleCardSectionCount];

  LOBYTE(v13) = [v10 containsObject:v12];
  if ((v13 & 1) == 0 && v14 && [v9 count] > v14)
  {
    uint64_t v15 = objc_msgSend(v9, "subarrayWithRange:", 0, v14);

    id v9 = (id)v15;
  }
  uint64_t v16 = [[SearchUISectionModel alloc] initWithRowModels:v9 section:v11];

  [(SearchUISectionModel *)v16 setDrawPlattersIfNecessary:v8];
  return v16;
}

- (void)setDrawPlattersIfNecessary:(BOOL)a3
{
  self->_drawPlattersIfNecessary = a3;
}

- (SearchUISectionModel)initWithRowModels:(id)a3 section:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SearchUISectionModel;
  id v9 = [(SearchUISectionModel *)&v24 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rowModels, a3);
    objc_storeStrong((id *)&v10->_section, a4);
    v10->_drawPlattersIfNecessary = 1;
    id v11 = [(SearchUISectionModel *)v10 backgroundColor];
    if (v11)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
            long long v18 = [(SearchUISectionModel *)v10 backgroundColor];
            [v17 setBackgroundColor:v18];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v14);
      }
    }
  }

  return v10;
}

- (id)backgroundColor
{
  v3 = [(SearchUISectionModel *)self asyncLoader];
  if (v3)
  {
    id v4 = [(SearchUISectionModel *)self asyncLoader];
    id v5 = [v4 backgroundColor];
  }
  else
  {
    id v4 = [(SearchUISectionModel *)self section];
    id v6 = [v4 collectionSection];
    id v5 = [v6 backgroundColor];
  }
  id v7 = [(SearchUISectionModel *)self rowModels];
  id v8 = [v7 firstObject];
  id v9 = [v8 identifyingResult];
  id v10 = [v9 sectionBundleIdentifier];

  if (backgroundColor_onceToken != -1) {
    dispatch_once(&backgroundColor_onceToken, &__block_literal_global_40);
  }
  if ([(id)backgroundColor_legacyAllowList containsObject:v10] && !v5)
  {
    if ((unint64_t)[v7 count] < 2) {
      goto LABEL_12;
    }
    id v11 = [v8 backgroundColor];

    if (!v11) {
      goto LABEL_12;
    }
    id v5 = [v8 backgroundColor];
  }
  if (v5) {
    goto LABEL_21;
  }
LABEL_12:
  id v12 = [(SearchUISectionModel *)self section];
  uint64_t v13 = [v12 resultSection];
  uint64_t v14 = [v13 results];

  uint64_t v15 = [v14 firstObject];
  uint64_t v16 = +[SearchUIUtilities cardForRenderingResult:v15];

  if ((unint64_t)[v7 count] >= 2
    && [v14 count] == 1
    && ([v8 isTopHit] & 1) != 0)
  {
    id v5 = [v16 backgroundColor];

    if (v5) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  if ([(SearchUISectionModel *)self shouldInsetGroupedCollectionStyle])
  {
    id v5 = +[SearchUIBackgroundColorUtilities disambiguationInnerPlatterColor];
  }
  else
  {
    id v5 = 0;
  }
LABEL_21:

  return v5;
}

- (void)prepareForSnapshot
{
  v3 = [(SearchUISectionModel *)self asyncLoader];

  if (!v3)
  {
    id v4 = [(SearchUISectionModel *)self rowModels];
    id v5 = [v4 firstObject];
    id v6 = [v5 results];
    id v7 = [v6 firstObject];
    id v8 = [(SearchUISectionModel *)self rowModels];
    id v9 = [v8 firstObject];
    +[SearchUIAsyncSectionLoader asyncLoaderSupportingSectionModel:result:queryId:](SearchUIAsyncSectionLoader, "asyncLoaderSupportingSectionModel:result:queryId:", self, v7, [v9 queryId]);
    id v10 = (SearchUIAsyncSectionLoader *)objc_claimAutoreleasedReturnValue();
    asyncLoader = self->_asyncLoader;
    self->_asyncLoader = v10;

    id v12 = [(SearchUISectionModel *)self asyncLoader];

    if (v12)
    {
      id v13 = [(SearchUISectionModel *)self asyncLoader];
      [v13 preloadIfNecessary];
    }
  }
}

- (SearchUIAsyncSectionLoader)asyncLoader
{
  return self->_asyncLoader;
}

- (BOOL)shouldLeaveSpaceForChevronForIndex:(unint64_t)a3
{
  id v5 = [(SearchUISectionModel *)self rowModels];
  id v6 = objc_msgSend(v5, "searchui_safeObjectAtIndex:", a3);
  id v7 = [v6 cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  return [(SearchUISectionModel *)self shouldDisplayChevronForIndex:a3 + 1 nextCardsEnabled:1];
}

- (BOOL)shouldDisplayChevronForIndex:(unint64_t)a3 nextCardsEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(SearchUISectionModel *)self rowModels];
  id v8 = objc_msgSend(v7, "searchui_safeObjectAtIndex:", a3);

  id v9 = [(SearchUISectionModel *)self rowModels];
  id v10 = objc_msgSend(v9, "searchui_safeObjectAtIndex:", a3 - 1);

  id v11 = [(SearchUISectionModel *)self rowModels];
  id v12 = objc_msgSend(v11, "searchui_safeObjectAtIndex:", a3 + 1);

  LOBYTE(v4) = +[SearchUITableModel shouldDisplayChevronForRowModel:v8 previousRowModel:v10 nextRowModel:v12 nextCardsEnabled:v4];
  return v4;
}

- (id)overriddenAccessibilityIdentifier
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SearchUISectionModel *)self section];
    id v7 = [v6 sectionIdentifier];
    id v8 = [v5 section];

    id v9 = [v8 sectionIdentifier];
    char v10 = [v7 isEqualToString:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (SearchUISectionModel)sectionModelWithGridRowModels:(id)a3 numberOfColumns:(int64_t)a4 gridStyle:(int)a5 section:(id)a6 expandedCollectionSections:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  uint64_t v14 = [v13 collectionSection];
  uint64_t v15 = [v14 collectionStyle];
  unint64_t v16 = [(id)v15 initiallyVisibleCardSectionCount];

  LOBYTE(v15) = [v12 containsObject:v14];
  if ((v15 & 1) == 0 && v16 && [v11 count] > v16)
  {
    uint64_t v17 = objc_msgSend(v11, "subarrayWithRange:", 0, v16);

    id v11 = (id)v17;
  }
  long long v18 = [[SearchUIGridSectionModel alloc] initWithRowModels:v11 numberOfColumns:a4 gridStyle:v9 section:v13];

  return (SearchUISectionModel *)v18;
}

+ (SearchUISectionModel)sectionModelWithScrollingRowModels:(id)a3 numberOfRows:(int64_t)a4 section:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 addObject:v15];
        }
        else
        {
          unint64_t v16 = objc_msgSend(v15, "horizontalRowModel", (void)v19);
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [[SearchUIHorizontallyScrollingSectionModel alloc] initWithRowModels:v9 section:v8 numberOfRows:a4];
  return (SearchUISectionModel *)v17;
}

+ (int64_t)sectionType
{
  return 0;
}

void __39__SearchUISectionModel_backgroundColor__block_invoke()
{
  v0 = (void *)backgroundColor_legacyAllowList;
  backgroundColor_legacyAllowList = (uint64_t)&unk_1F404B010;
}

id __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) itemIdentifierForIndexPath:a2];
  id v4 = [*(id *)(a1 + 40) commandEnvironment];
  id v5 = +[SearchUICommandHandler swipeActionsForRowModel:v3 isLeading:1 environment:v4];

  return v5;
}

id __74__SearchUISectionModel_layoutSectionForEnvironment_attributes_dataSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) itemIdentifierForIndexPath:a2];
  id v4 = [*(id *)(a1 + 40) commandEnvironment];
  id v5 = +[SearchUICommandHandler swipeActionsForRowModel:v3 isLeading:0 environment:v4];

  return v5;
}

- (BOOL)needsHeader
{
  v2 = [(SearchUISectionModel *)self section];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 collectionSection];
    id v5 = [v3 resultSection];
    id v6 = [v5 title];

    id v7 = [v3 resultSection];
    id v8 = [v7 subtitle];

    if (v4)
    {
      uint64_t v9 = [v4 title];
      id v10 = [v9 text];
    }
    else
    {
      id v10 = v6;
    }
    if ([v10 length]) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = [v8 length] != 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)needsHeaderSeparator
{
  v2 = [(SearchUISectionModel *)self rowModels];
  v3 = objc_msgSend(v2, "searchui_safeObjectAtIndex:", 0);

  if ([v3 isTopHit]) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [v3 fillsBackgroundWithContent] ^ 1;
  }

  return v4;
}

- (NSDirectionalEdgeInsets)headerInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  [(SearchUISectionModel *)self horizontalInsetWithAttributes:a3 forSupplementary:1];
  double v6 = v5;
  double v7 = 6.0;
  if (([MEMORY[0x1E4FAE198] isMacOS] & 1) == 0)
  {
    if ([(SearchUISectionModel *)self needsHeaderSeparator]) {
      double v7 = 8.0;
    }
    else {
      double v7 = 6.0;
    }
  }
  id v8 = [(SearchUISectionModel *)self section];
  uint64_t v9 = [v8 resultSection];

  id v10 = [v9 subtitle];
  if (v10)
  {
    BOOL v11 = [v9 title];
    if (v11) {
      double v12 = 0.0;
    }
    else {
      double v12 = 5.0;
    }
  }
  else
  {
    double v12 = 0.0;
  }

  double v13 = 12.0 - v12;
  double v14 = v6;
  double v15 = v7;
  double v16 = v6;
  result.trailing = v16;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (double)horizontalInsetWithAttributes:(id)a3 forSupplementary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SearchUISectionModel *)self numberOfSections];
  if ([(SearchUISectionModel *)self shouldInsetGroupedCollectionStyle]) {
    +[SearchUIUtilities disambiguationTableCellContentInset];
  }
  else {
    +[SearchUIUtilities standardTableCellContentInset];
  }
  double v8 = v7;
  if ([v6 shouldUseInsetRoundedSections])
  {
    uint64_t v9 = [v6 commandEnvironment];
    char v10 = [v9 shouldUseStandardSectionInsets];

    if ((v10 & 1) == 0)
    {
      BOOL v11 = [v6 commandEnvironment];
      double v12 = [v11 presentingViewController];
      double v13 = [v12 view];
      [v13 frame];
      double Width = CGRectGetWidth(v19);
      +[SearchUI idealPlatterWidth];
      double v8 = (Width - v15) * 0.5;

      if (v8 < 8.0) {
        double v8 = 8.0;
      }
    }
    double v16 = v8 + 8.0;
    BOOL v17 = !v4;
  }
  else
  {
    if (v4
      || +[SearchUISectionBackgroundStyleUtilities backgroundStyleNeedsInset:[(SearchUISectionModel *)self sectionBackgroundStyleWithAttributes:v6]])
    {
      goto LABEL_14;
    }
    BOOL v17 = [(SearchUISectionModel *)self isMemberOfClass:objc_opt_class()] == 0;
    double v16 = 0.0;
  }
  if (!v17) {
    double v8 = v16;
  }
LABEL_14:

  return v8;
}

- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(SearchUISectionModel *)self needsHeader]
    || [(SearchUISectionModel *)self needsHeaderSeparator]
    || [(SearchUISectionModel *)self shouldInsetGroupedCollectionStyle];
  [(SearchUISectionModel *)self horizontalInsetWithAttributes:v6 forSupplementary:0];
  double v9 = v8;
  char v10 = [(SearchUISectionModel *)self rowModels];
  BOOL v11 = [v10 firstObject];

  if ([v6 shouldUseInsetRoundedSections])
  {
    double v12 = 0.0;
    if (v7) {
      double v13 = 0.0;
    }
    else {
      double v13 = 4.0;
    }
  }
  else
  {
    int64_t v14 = [(SearchUISectionModel *)self sectionBackgroundStyleWithAttributes:v6];
    if (+[SearchUISectionBackgroundStyleUtilities backgroundStyleNeedsInset:v14])
    {
      double v15 = [(SearchUISectionModel *)self section];
      double v16 = [v15 sectionIdentifier];
      int v17 = [v16 isEqualToString:@"com.apple.spotlight.tophits"];

      if (![MEMORY[0x1E4FAE198] isMacOS]
        || (double v13 = 12.0,
            [(SearchUISectionModel *)self shouldInsetGroupedCollectionStyle]))
      {
        long long v18 = [v11 cardSection];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          double v13 = 12.0;
        }
        else {
          double v13 = 0.0;
        }
      }
      int v19 = [MEMORY[0x1E4FAE198] isMacOS];
      double v20 = 8.0;
      if (v17) {
        double v20 = 16.0;
      }
      if (v19) {
        double v12 = 2.0;
      }
      else {
        double v12 = v20;
      }
      if (v14 == 2)
      {
        objc_opt_class();
        double v12 = 0.0;
        if (objc_opt_isKindOfClass()) {
          double v9 = 0.0;
        }
      }
    }
    else
    {
      if ([MEMORY[0x1E4FAE198] isMacOS]) {
        double v21 = 2.0;
      }
      else {
        double v21 = 4.0;
      }
      if (v7) {
        double v22 = 0.0;
      }
      else {
        double v22 = 8.0;
      }
      int v23 = [v11 fillsBackgroundWithContent];
      double v24 = v22 + 8.0;
      if (!a4) {
        double v24 = 0.0;
      }
      if (((a4 == 0) & v23) != 0) {
        double v12 = 0.0;
      }
      else {
        double v12 = v21;
      }
      if (v23) {
        double v13 = v24;
      }
      else {
        double v13 = v22;
      }
    }
  }

  double v25 = v13;
  double v26 = v9;
  double v27 = v12;
  double v28 = v9;
  result.trailing = v28;
  result.bottom = v27;
  result.leading = v26;
  result.top = v25;
  return result;
}

- (BOOL)needsHorizontalNavigation
{
  return 0;
}

- (BOOL)selfSizingInTwoAxes
{
  return 0;
}

- (BOOL)shouldInsetGroupedCollectionStyle
{
  v2 = [(SearchUISectionModel *)self section];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 collectionSection];
    double v5 = [v4 collectionStyle];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v3 collectionSection];
      BOOL v7 = [v6 collectionStyle];
      char v8 = [v7 isInsetGrouped];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(SearchUISectionModel *)self section];
  id v6 = [v5 sectionIdentifier];
  BOOL v7 = [v3 stringWithFormat:@"<%@ | identifier: %@>", v4, v6];

  return v7;
}

- (id)copyWithRowModels:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (void *)[(SearchUISectionModel *)self copy];
  [v5 setRowModels:v4];
  id v6 = [(SearchUISectionModel *)self backgroundColor];
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
          double v13 = [(SearchUISectionModel *)self backgroundColor];
          [v12 setBackgroundColor:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDrawPlattersIfNecessary:", -[SearchUISectionModel drawPlattersIfNecessary](self, "drawPlattersIfNecessary"));
  double v5 = [(SearchUISectionModel *)self section];
  [v4 setSection:v5];

  id v6 = [(SearchUISectionModel *)self rowModels];
  id v7 = (void *)[v6 copy];
  [v4 setRowModels:v7];

  uint64_t v8 = [(SearchUISectionModel *)self asyncLoader];
  [v4 setAsyncLoader:v8];

  return v4;
}

- (void)setRowModels:(id)a3
{
}

- (void)setSection:(id)a3
{
}

- (void)setAsyncLoader:(id)a3
{
}

- (unint64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (void)setNumberOfSections:(unint64_t)a3
{
  self->_numberOfSections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncLoader, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_rowModels, 0);
}

@end