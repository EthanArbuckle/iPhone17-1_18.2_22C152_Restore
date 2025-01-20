@interface SHSheetContentLayoutProvider
+ (id)_createFooterSupplementaryItemWithHeightDimension:(id)a3;
+ (id)_createHeaderSupplementaryItemWithHeightDimension:(id)a3;
- (NSDirectionalEdgeInsets)_resolvedDirectionalLayoutMargins:(double)a3 trailingMargin:(double)a4;
- (SHSheetContentLayoutDelegate)delegate;
- (SHSheetContentLayoutProvider)initWithLayoutSpec:(id)a3;
- (SHSheetContentLayoutSpec)layoutSpec;
- (id)_createHorizontalLayoutSectionWithContext:(id)a3 iconWidth:(double)a4;
- (id)_layoutForActionsSectionWithContext:(id)a3;
- (id)_layoutForAppsSectionWithContext:(id)a3;
- (id)_layoutForCustomViewSectionWithContext:(id)a3;
- (id)_layoutForHeroActionsSectionWithContext:(id)a3;
- (id)_layoutForPeopleSectionWithContext:(id)a3;
- (id)layoutSectionForContext:(id)a3;
- (int64_t)_sectionForContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutSpec:(id)a3;
@end

@implementation SHSheetContentLayoutProvider

- (SHSheetContentLayoutProvider)initWithLayoutSpec:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetContentLayoutProvider;
  v6 = [(SHSheetContentLayoutProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_layoutSpec, a3);
  }

  return v7;
}

- (int64_t)_sectionForContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 sectionIdentifier];
  if ([v4 isEqualToString:@"SHSheetContentCustomViewSectionIdentifier"])
  {
    int64_t v5 = 0;
  }
  else if ([v4 isEqualToString:@"SHSheetContentPeopleSectionIdentifier"])
  {
    int64_t v5 = 1;
  }
  else if (([v4 isEqualToString:@"SHSheetContentAppsSectionIdentifier"] & 1) != 0 {
         || ([v4 isEqualToString:@"SHSheetContentEmbeddedActionsSectionIdentifier"] & 1) != 0)
  }
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"SHSheetContentHeroActionsSectionIdentifier"] {
         && ([v3 enableHeroActions] & 1) != 0)
  }
  {
    int64_t v5 = 4;
  }
  else
  {
    int64_t v5 = 5;
  }

  return v5;
}

- (id)layoutSectionForContext:(id)a3
{
  id v4 = a3;
  switch([(SHSheetContentLayoutProvider *)self _sectionForContext:v4])
  {
    case 0:
      uint64_t v5 = [(SHSheetContentLayoutProvider *)self _layoutForCustomViewSectionWithContext:v4];
      goto LABEL_8;
    case 1:
      uint64_t v5 = [(SHSheetContentLayoutProvider *)self _layoutForPeopleSectionWithContext:v4];
      goto LABEL_8;
    case 2:
    case 3:
      uint64_t v5 = [(SHSheetContentLayoutProvider *)self _layoutForAppsSectionWithContext:v4];
      goto LABEL_8;
    case 4:
      uint64_t v5 = [(SHSheetContentLayoutProvider *)self _layoutForHeroActionsSectionWithContext:v4];
      goto LABEL_8;
    case 5:
      uint64_t v5 = [(SHSheetContentLayoutProvider *)self _layoutForActionsSectionWithContext:v4];
LABEL_8:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)_layoutForCustomViewSectionWithContext:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SHSheetContentLayoutProvider *)self layoutSpec];
  v6 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v7 = (void *)MEMORY[0x1E4FB1308];
  [v5 customViewSectionHeight];
  v8 = objc_msgSend(v7, "absoluteDimension:");
  v27 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v6 heightDimension:v8];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1328], "itemWithLayoutSize:");
  v10 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v6 heightDimension:v8];
  v11 = (void *)MEMORY[0x1E4FB1318];
  v26 = (void *)v9;
  v29[0] = v9;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v13 = [v11 horizontalGroupWithLayoutSize:v10 subitems:v12];

  v14 = [MEMORY[0x1E4FB1330] sectionWithGroup:v13];
  [v5 customViewVerticalInset];
  double v16 = v15;
  [v5 customViewVerticalInset];
  objc_msgSend(v14, "setContentInsets:", v16, 0.0, v17, 0.0);
  v18 = [v4 environment];
  v19 = [v18 traitCollection];
  uint64_t v20 = [v19 verticalSizeClass];

  LODWORD(v18) = [v4 enableSectionFooter];
  if (v18 && v20 != 1)
  {
    v21 = (void *)MEMORY[0x1E4FB1308];
    [v5 estimatedFooterHeight];
    v22 = objc_msgSend(v21, "absoluteDimension:");
    v23 = +[SHSheetContentLayoutProvider _createFooterSupplementaryItemWithHeightDimension:v22];

    v28 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    [v14 setBoundarySupplementaryItems:v24];

    [v14 setSupplementariesFollowContentInsets:0];
  }

  return v14;
}

- (id)_layoutForPeopleSectionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SHSheetContentLayoutProvider *)self layoutSpec];
  [v5 peopleIconWidth];
  v6 = -[SHSheetContentLayoutProvider _createHorizontalLayoutSectionWithContext:iconWidth:](self, "_createHorizontalLayoutSectionWithContext:iconWidth:", v4);
  [v6 setSupplementariesFollowContentInsets:0];
  v7 = objc_opt_new();
  if ([v4 enableTopContentSectionText])
  {
    v8 = (void *)MEMORY[0x1E4FB1308];
    [v5 estimatedHeaderHeight];
    uint64_t v9 = objc_msgSend(v8, "estimatedDimension:");
    v10 = +[SHSheetContentLayoutProvider _createHeaderSupplementaryItemWithHeightDimension:v9];

    [v7 addObject:v10];
  }
  if ([v4 enableSectionFooter])
  {
    v11 = (void *)MEMORY[0x1E4FB1308];
    [v5 estimatedFooterHeight];
    v12 = objc_msgSend(v11, "absoluteDimension:");
    v13 = +[SHSheetContentLayoutProvider _createFooterSupplementaryItemWithHeightDimension:v12];

    [v7 addObject:v13];
  }
  [v6 setBoundarySupplementaryItems:v7];

  return v6;
}

- (id)_layoutForAppsSectionWithContext:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SHSheetContentLayoutProvider *)self layoutSpec];
  [v5 sharingAppIconWidth];
  v6 = -[SHSheetContentLayoutProvider _createHorizontalLayoutSectionWithContext:iconWidth:](self, "_createHorizontalLayoutSectionWithContext:iconWidth:", v4);
  v7 = [v4 dataSourceSnapshot];
  v8 = [v7 sectionIdentifiers];
  char v9 = [v8 containsObject:@"SHSheetContentPeopleSectionIdentifier"];

  LODWORD(v7) = [v4 enableTopContentSectionText];
  if (v7 && (v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E4FB1308];
    [v5 estimatedHeaderHeight];
    v11 = objc_msgSend(v10, "estimatedDimension:");
    v12 = +[SHSheetContentLayoutProvider _createHeaderSupplementaryItemWithHeightDimension:v11];

    v15[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v6 setBoundarySupplementaryItems:v13];

    [v6 setSupplementariesFollowContentInsets:0];
  }

  return v6;
}

- (id)_layoutForHeroActionsSectionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SHSheetContentLayoutProvider *)self layoutSpec];
  v6 = [v4 environment];
  v7 = [v6 container];
  [v7 effectiveContentSize];
  double v9 = v8;

  [v4 viewDirectionalLayoutMargins];
  double v11 = v10;
  v12 = [v6 container];
  [v12 contentInsets];
  double v14 = v11 - v13;

  [v4 viewDirectionalLayoutMargins];
  double v16 = v15;
  double v17 = [v6 container];
  [v17 contentInsets];
  double v19 = v16 - v18;

  [v5 heroActionItemSpacing];
  double v21 = v20;
  uint64_t v47 = MEMORY[0x1E4F143A8];
  uint64_t v48 = 3221225472;
  v49 = __72__SHSheetContentLayoutProvider__layoutForHeroActionsSectionWithContext___block_invoke;
  v50 = &unk_1E5A21B90;
  double v53 = v9;
  double v54 = v14;
  double v55 = v19;
  double v56 = v20;
  id v22 = v4;
  id v51 = v22;
  v52 = self;
  v23 = (uint64_t (**)(void, void))MEMORY[0x1A6229A90](&v47);
  v24 = objc_msgSend(v22, "dataSourceSnapshot", v47, v48, v49, v50);
  v25 = [v22 sectionIdentifier];
  uint64_t v26 = [v24 numberOfItemsInSection:v25];

  int v27 = [v5 shouldUseNarrowLayoutForHeroActionsWithContainerWidth:v9];
  uint64_t v28 = 2;
  if (v26 < 2) {
    uint64_t v28 = v26;
  }
  if (v27) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = v26;
  }
  uint64_t v30 = v23[2](v23, v29);
  if (v29 >= 3 && v30 >= 3)
  {
    uint64_t v29 = 2;
    uint64_t v30 = v23[2](v23, 2);
  }
  +[UIActivityHeroActionCell heightForNumberOfLines:(double)v30];
  double v32 = v31;
  v33 = (void *)MEMORY[0x1E4FB1338];
  v34 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v35 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  v36 = [v33 sizeWithWidthDimension:v34 heightDimension:v35];

  v37 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v36];
  v38 = (void *)MEMORY[0x1E4FB1338];
  v39 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v40 = [MEMORY[0x1E4FB1308] absoluteDimension:v32];
  v41 = [v38 sizeWithWidthDimension:v39 heightDimension:v40];

  v42 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v41 subitem:v37 count:v29];
  v43 = [MEMORY[0x1E4FB1340] fixedSpacing:v21];
  [v42 setInterItemSpacing:v43];

  v44 = [MEMORY[0x1E4FB1330] sectionWithGroup:v42];
  [v44 setInterGroupSpacing:v21];
  [v5 actionInterGroupInset];
  objc_msgSend(v44, "setContentInsets:", v14, v14, v45, v19);

  return v44;
}

uint64_t __72__SHSheetContentLayoutProvider__layoutForHeroActionsSectionWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  double v8 = [*(id *)(a1 + 32) dataSourceSnapshot];
  double v9 = [*(id *)(a1 + 32) sectionIdentifier];
  double v10 = [v8 itemIdentifiersInSectionWithIdentifier:v9];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    double v14 = (v4 - v5 - v7 - v6 * (double)(a2 - 1)) / (double)a2;
    uint64_t v15 = *(void *)v24;
    uint64_t v16 = 1;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        double v19 = objc_msgSend(*(id *)(a1 + 40), "delegate", (void)v23);
        double v20 = [v19 titleForItemIdentifier:v18];

        int64_t v21 = +[UIActivityHeroActionCell numberOfLinesForTitle:v20 itemWidth:v14];
        if (v16 <= v21) {
          uint64_t v16 = v21;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v16 = 1;
  }

  return v16;
}

- (NSDirectionalEdgeInsets)_resolvedDirectionalLayoutMargins:(double)a3 trailingMargin:(double)a4
{
  double v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 6) {
    double v8 = 24.0;
  }
  else {
    double v8 = a4;
  }
  if (v7 == 6) {
    double v9 = 24.0;
  }
  else {
    double v9 = a3;
  }
  double v10 = 0.0;
  double v11 = 0.0;
  result.trailing = v8;
  result.bottom = v11;
  result.leading = v9;
  result.top = v10;
  return result;
}

- (id)_layoutForActionsSectionWithContext:(id)a3
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SHSheetContentLayoutProvider *)self layoutSpec];
  double v6 = [v4 environment];
  uint64_t v7 = [v5 actionsLayoutSectionConfigurationWithEnvironment:v6];

  id v8 = objc_alloc(MEMORY[0x1E4FB2048]);
  double v9 = [v4 environment];
  double v10 = (void *)[v8 initWithConfiguration:v7 layoutEnvironment:v9];

  [v10 setContentInsetsReference:2];
  double v11 = [v4 sectionIdentifier];
  uint64_t v12 = [v4 dataSourceSnapshot];
  uint64_t v13 = [v12 sectionIdentifiers];

  double v14 = [v13 lastObject];
  if ([v11 isEqualToString:v14])
  {
  }
  else
  {
    char v15 = [v11 hasPrefix:@"SHSheetContentInformationalActionsSectionIdentifier_"];

    if ((v15 & 1) == 0) {
      goto LABEL_5;
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1E4FB1308];
  [v5 estimatedActionFooterHeight];
  double v17 = objc_msgSend(v16, "estimatedDimension:");
  uint64_t v18 = +[SHSheetContentLayoutProvider _createFooterSupplementaryItemWithHeightDimension:v17];

  v50[0] = v18;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  [v10 setBoundarySupplementaryItems:v19];

  [v10 setSupplementariesFollowContentInsets:1];
LABEL_5:
  uint64_t v20 = [v13 indexOfObject:v11];
  if (v20)
  {
    int64_t v21 = [v13 objectAtIndexedSubscript:v20 - 1];
    if (([v21 isEqualToString:@"SHSheetContentCustomViewSectionIdentifier"] & 1) != 0
      || (double v22 = 0.0, [v21 isEqualToString:@"SHSheetContentPeopleSectionIdentifier"]))
    {
      [v5 actionInterGroupInset];
      double v22 = v23;
    }
  }
  else
  {
    double v22 = 0.0;
  }
  [v4 viewDirectionalLayoutMargins];
  double v25 = v24;
  long long v26 = [v4 environment];
  int v27 = [v26 container];
  [v27 contentInsets];
  double v29 = v25 - v28;

  [v4 viewDirectionalLayoutMargins];
  double v31 = v30;
  double v32 = [v4 environment];
  v33 = [v32 container];
  [v33 contentInsets];
  double v35 = v31 - v34;

  [(SHSheetContentLayoutProvider *)self _resolvedDirectionalLayoutMargins:v29 trailingMargin:v35];
  double v37 = v36;
  double v39 = v38;
  v40 = [v13 firstObject];
  if ([v11 isEqualToString:v40])
  {
    v41 = [v13 lastObject];
    char v42 = [v11 isEqualToString:v41];

    double v43 = 0.0;
    if (v42) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  v44 = [v13 lastObject];
  char v45 = [v11 isEqualToString:v44];

  double v43 = 0.0;
  if (v45)
  {
    double v29 = v22;
  }
  else
  {
    v46 = [v13 firstObject];
    int v47 = [v11 isEqualToString:v46];

    [v5 actionInterGroupInset];
    double v43 = v48;
    if (!v47) {
      double v29 = v22;
    }
  }
LABEL_19:
  objc_msgSend(v10, "setContentInsets:", v29, v37, v43, v39);

  return v10;
}

- (id)_createHorizontalLayoutSectionWithContext:(id)a3 iconWidth:(double)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SHSheetContentLayoutProvider *)self layoutSpec];
  char v8 = [v7 isAccessibilityContentSize];
  double v9 = [v6 environment];
  double v10 = [v9 container];
  [v10 effectiveContentSize];
  double v12 = v11;

  [v6 viewDirectionalLayoutMargins];
  double v14 = v13;
  char v15 = [v6 environment];

  uint64_t v16 = [v15 container];
  [v16 contentInsets];
  double v18 = v14 - v17;

  [v7 horizontalCellWidthForContentWidth:v12 sizeOffset:v18];
  double v20 = v19;
  [v7 peopleSectionHeight];
  double v22 = v21;
  double v23 = objc_msgSend(MEMORY[0x1E4FB1308], "estimatedDimension:");
  double v24 = (void *)MEMORY[0x1E4FB1338];
  double v25 = [MEMORY[0x1E4FB1308] absoluteDimension:v20];
  long long v26 = [v24 sizeWithWidthDimension:v25 heightDimension:v23];

  int v27 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v26];
  if (v8)
  {
    uint64_t v28 = 2;
    double v29 = v18;
  }
  else
  {
    uint64_t v30 = [v7 numberOfHorizontalItemsPerGroupForContentWidth:v12];
    if (v30 == 3) {
      double v31 = v20 * 0.5;
    }
    else {
      double v31 = v18 + 1.0 + (v20 - a4) * 0.5;
    }
    double v32 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v33 = [v32 userInterfaceIdiom];

    if (v33 == 6)
    {
      double v18 = 16.0;
      if ([v7 deviceClass] == 10) {
        double v29 = 24.0;
      }
      else {
        double v29 = 16.0;
      }
      double v34 = (double)v30;
    }
    else
    {
      double v29 = v18 + -1.0 + (v20 - a4) * -0.5;
      double v34 = (double)v30;
      double v18 = (v12 - v29 - v31 - v20 * (double)v30) / (double)v30;
    }
    double v20 = v18 * (double)(v30 - 1) + v20 * v34;
    uint64_t v28 = 1;
  }
  double v35 = (void *)MEMORY[0x1E4FB1338];
  double v36 = [MEMORY[0x1E4FB1308] absoluteDimension:v20];
  double v37 = [MEMORY[0x1E4FB1308] estimatedDimension:v22];
  double v38 = [v35 sizeWithWidthDimension:v36 heightDimension:v37];

  double v39 = (void *)MEMORY[0x1E4FB1318];
  v46[0] = v27;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  v41 = [v39 horizontalGroupWithLayoutSize:v38 subitems:v40];

  char v42 = [MEMORY[0x1E4FB1340] fixedSpacing:v18];
  [v41 setInterItemSpacing:v42];

  double v43 = [MEMORY[0x1E4FB1330] sectionWithGroup:v41];
  [v43 setInterGroupSpacing:v18];
  [v7 horizontalSectionBottomInset];
  objc_msgSend(v43, "setContentInsets:", 0.0, v29, v44, v29);
  [v43 setOrthogonalScrollingBehavior:v28];

  return v43;
}

+ (id)_createHeaderSupplementaryItemWithHeightDimension:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB1338];
  id v4 = (void *)MEMORY[0x1E4FB1308];
  id v5 = a3;
  id v6 = [v4 fractionalWidthDimension:1.0];
  uint64_t v7 = [v3 sizeWithWidthDimension:v6 heightDimension:v5];

  char v8 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v7 elementKind:@"UIActivityContentHeaderSectionKind" alignment:1];

  return v8;
}

+ (id)_createFooterSupplementaryItemWithHeightDimension:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB1338];
  id v4 = (void *)MEMORY[0x1E4FB1308];
  id v5 = a3;
  id v6 = [v4 fractionalWidthDimension:1.0];
  uint64_t v7 = [v3 sizeWithWidthDimension:v6 heightDimension:v5];

  char v8 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v7 elementKind:@"UIActivityContentFooterSectionKind" alignment:5];

  return v8;
}

- (SHSheetContentLayoutSpec)layoutSpec
{
  return self->_layoutSpec;
}

- (void)setLayoutSpec:(id)a3
{
}

- (SHSheetContentLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetContentLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutSpec, 0);
}

@end