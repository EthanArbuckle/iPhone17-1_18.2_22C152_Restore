@interface SearchUILeadingTrailingSectionModel
+ (int64_t)sectionType;
- (BOOL)customSectionInsets;
- (BOOL)prefersSeparatorsInLeadingGroup;
- (BOOL)prefersSeparatorsInTrailingGroup;
- (BOOL)primaryCardSectionIsLeading;
- (NSArray)leadingRowModels;
- (NSArray)trailingRowModels;
- (NSDirectionalEdgeInsets)leadingGroupContentInsets;
- (NSDirectionalEdgeInsets)sectionInsets;
- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4;
- (NSDirectionalEdgeInsets)trailingGroupContentInsets;
- (SFLeadingTrailingCardSection)cardSection;
- (SearchUILeadingTrailingSectionModel)initWithCardSection:(id)a3 rowModels:(id)a4 result:(id)a5 queryId:(unint64_t)a6 section:(id)a7;
- (double)horizontalSpacing;
- (double)leadingFractionalWidth;
- (double)preferredHeight;
- (double)verticalSpacing;
- (id)buildGroupForFractionalWidth:(double)a3 numberOfCards:(int64_t)a4 isTopAligned:(BOOL)a5 prefersSeparator:(BOOL)a6 forView:(id)a7;
- (id)copyWithRowModels:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5;
- (id)primaryCardSection;
- (id)rowModels;
- (id)rowModelsForCardSections:(id)a3 result:(id)a4 queryId:(unint64_t)a5;
- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3;
- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3 forRowModel:(id)a4;
- (void)setCardSection:(id)a3;
- (void)setCustomSectionInsets:(BOOL)a3;
- (void)setHorizontalSpacing:(double)a3;
- (void)setLeadingFractionalWidth:(double)a3;
- (void)setLeadingGroupContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setLeadingRowModels:(id)a3;
- (void)setPreferredHeight:(double)a3;
- (void)setPrefersSeparatorsInLeadingGroup:(BOOL)a3;
- (void)setPrefersSeparatorsInTrailingGroup:(BOOL)a3;
- (void)setSectionInsets:(NSDirectionalEdgeInsets)a3;
- (void)setTrailingGroupContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setTrailingRowModels:(id)a3;
- (void)setVerticalSpacing:(double)a3;
@end

@implementation SearchUILeadingTrailingSectionModel

+ (int64_t)sectionType
{
  return 3;
}

- (SearchUILeadingTrailingSectionModel)initWithCardSection:(id)a3 rowModels:(id)a4 result:(id)a5 queryId:(unint64_t)a6 section:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  v15 = [v12 leadingCardSections];
  v16 = [(SearchUILeadingTrailingSectionModel *)self rowModelsForCardSections:v15 result:v14 queryId:a6];

  v17 = [v12 trailingCardSections];
  v18 = [(SearchUILeadingTrailingSectionModel *)self rowModelsForCardSections:v17 result:v14 queryId:a6];

  v29.receiver = self;
  v29.super_class = (Class)SearchUILeadingTrailingSectionModel;
  v19 = [(SearchUISectionModel *)&v29 initWithRowModels:MEMORY[0x1E4F1CBF0] section:v13];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_cardSection, a3);
    objc_storeStrong((id *)&v19->_leadingRowModels, v16);
    objc_storeStrong((id *)&v19->_trailingRowModels, v18);
    [v12 leadingToTrailingRatio];
    double v20 = 0.5;
    if (v21 > 0.0)
    {
      [v12 leadingToTrailingRatio];
      double v23 = v22;
      [v12 leadingToTrailingRatio];
      double v20 = v23 / (v24 + 1.0);
    }
    v19->_leadingFractionalWidth = v20;
    v19->_preferredHeight = 0.0;
    v19->_horizontalSpacing = 8.0;
    v19->_verticalSpacing = 8.0;
    long long v25 = *MEMORY[0x1E4FB12A8];
    long long v26 = *(_OWORD *)(MEMORY[0x1E4FB12A8] + 16);
    *(_OWORD *)&v19->_sectionInsets.top = *MEMORY[0x1E4FB12A8];
    *(_OWORD *)&v19->_sectionInsets.bottom = v26;
    *(_OWORD *)&v19->_leadingGroupContentInsets.top = v25;
    *(_OWORD *)&v19->_leadingGroupContentInsets.bottom = v26;
    *(_OWORD *)&v19->_trailingGroupContentInsets.top = v25;
    *(_OWORD *)&v19->_trailingGroupContentInsets.bottom = v26;
  }
  v27 = [(SearchUILeadingTrailingSectionModel *)v19 primaryCardSection];
  objc_msgSend(v27, "customizeSection:isLeading:", v19, -[SearchUILeadingTrailingSectionModel primaryCardSectionIsLeading](v19, "primaryCardSectionIsLeading"));

  return v19;
}

- (id)rowModelsForCardSections:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  v5 = +[SearchUITableModel tableModelWithCardSections:a3 result:a4 isInline:0 queryId:a5 shouldCombine:0];
  v6 = [v5 tableRowModel];
  v7 = [v6 firstObject];

  v8 = (void *)[v7 copy];
  return v8;
}

- (BOOL)primaryCardSectionIsLeading
{
  v3 = [(SearchUILeadingTrailingSectionModel *)self leadingRowModels];
  if ([v3 count] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SearchUILeadingTrailingSectionModel *)self leadingRowModels];
    if ((unint64_t)[v5 count] < 2)
    {
      BOOL v4 = 0;
    }
    else
    {
      v6 = [(SearchUILeadingTrailingSectionModel *)self trailingRowModels];
      BOOL v4 = [v6 count] != 1;
    }
  }

  return v4;
}

- (id)primaryCardSection
{
  if ([(SearchUILeadingTrailingSectionModel *)self primaryCardSectionIsLeading]) {
    [(SearchUILeadingTrailingSectionModel *)self leadingRowModels];
  }
  else {
  v3 = [(SearchUILeadingTrailingSectionModel *)self trailingRowModels];
  }
  BOOL v4 = [v3 objectAtIndexedSubscript:0];
  v5 = [v4 cardSection];

  return v5;
}

- (id)rowModels
{
  v3 = [(SearchUILeadingTrailingSectionModel *)self leadingRowModels];
  BOOL v4 = [(SearchUILeadingTrailingSectionModel *)self trailingRowModels];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5
{
  v71[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SearchUILeadingTrailingSectionModel *)self leadingRowModels];
  if ([v11 count])
  {
    id v12 = [(SearchUILeadingTrailingSectionModel *)self trailingRowModels];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      [(SearchUILeadingTrailingSectionModel *)self preferredHeight];
      double v15 = v14;
      BOOL v16 = v14 <= 0.0;
      v17 = [v10 controller];
      uint64_t v18 = [v17 view];

      [(SearchUILeadingTrailingSectionModel *)self leadingFractionalWidth];
      double v20 = v19;
      double v21 = [(SearchUILeadingTrailingSectionModel *)self leadingRowModels];
      v69 = -[SearchUILeadingTrailingSectionModel buildGroupForFractionalWidth:numberOfCards:isTopAligned:prefersSeparator:forView:](self, "buildGroupForFractionalWidth:numberOfCards:isTopAligned:prefersSeparator:forView:", [v21 count], v16, -[SearchUILeadingTrailingSectionModel prefersSeparatorsInLeadingGroup](self, "prefersSeparatorsInLeadingGroup"), v18, v20);

      [(SearchUILeadingTrailingSectionModel *)self leadingGroupContentInsets];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      [(SearchUILeadingTrailingSectionModel *)self leadingFractionalWidth];
      double v31 = 1.0 - v30;
      v32 = [(SearchUILeadingTrailingSectionModel *)self trailingRowModels];
      v67 = (void *)v18;
      v68 = -[SearchUILeadingTrailingSectionModel buildGroupForFractionalWidth:numberOfCards:isTopAligned:prefersSeparator:forView:](self, "buildGroupForFractionalWidth:numberOfCards:isTopAligned:prefersSeparator:forView:", [v32 count], v16, -[SearchUILeadingTrailingSectionModel prefersSeparatorsInTrailingGroup](self, "prefersSeparatorsInTrailingGroup"), v18, v31);

      [(SearchUILeadingTrailingSectionModel *)self trailingGroupContentInsets];
      double v34 = v33;
      double v36 = v35;
      double v66 = v37;
      double v39 = v38;
      if (v15 > 0.0)
      {
        [(SearchUILeadingTrailingSectionModel *)self horizontalSpacing];
        objc_msgSend(v69, "setContentInsets:", v23, v25, v27, v29 + v57 * 0.5);
        [(SearchUILeadingTrailingSectionModel *)self horizontalSpacing];
        objc_msgSend(v68, "setContentInsets:", v34, v36 + v58 * 0.5, v66, v39);
        v59 = (void *)MEMORY[0x1E4FB1338];
        v53 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
        v60 = (void *)MEMORY[0x1E4FB1308];
        [(SearchUILeadingTrailingSectionModel *)self preferredHeight];
        v54 = objc_msgSend(v60, "absoluteDimension:");
        v55 = v59;
      }
      else
      {
        v40 = (void *)MEMORY[0x1E4FB1310];
        v41 = [MEMORY[0x1E4FB1340] fixedSpacing:v25];
        v42 = [MEMORY[0x1E4FB1340] fixedSpacing:v23];
        v43 = [MEMORY[0x1E4FB1340] fixedSpacing:v29];
        v44 = [MEMORY[0x1E4FB1340] fixedSpacing:v27];
        v45 = [v40 spacingForLeading:v41 top:v42 trailing:v43 bottom:v44];
        [v69 setEdgeSpacing:v45];

        v46 = (void *)MEMORY[0x1E4FB1310];
        v47 = [MEMORY[0x1E4FB1340] fixedSpacing:v36];
        v48 = [MEMORY[0x1E4FB1340] fixedSpacing:v34];
        v49 = [MEMORY[0x1E4FB1340] fixedSpacing:v39];
        v50 = [MEMORY[0x1E4FB1340] fixedSpacing:v66];
        v51 = [v46 spacingForLeading:v47 top:v48 trailing:v49 bottom:v50];
        [v68 setEdgeSpacing:v51];

        v52 = (void *)MEMORY[0x1E4FB1338];
        v53 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
        v54 = [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
        v55 = v52;
      }
      v61 = [v55 sizeWithWidthDimension:v53 heightDimension:v54];

      v62 = (void *)MEMORY[0x1E4FB1318];
      v71[0] = v69;
      v71[1] = v68;
      v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
      v64 = [v62 horizontalGroupWithLayoutSize:v61 subitems:v63];

      v56 = [MEMORY[0x1E4FB1330] sectionWithGroup:v64];
      [(SearchUILeadingTrailingSectionModel *)self sectionInsets];
      objc_msgSend(v56, "setContentInsets:");

      goto LABEL_9;
    }
  }
  else
  {
  }
  v70.receiver = self;
  v70.super_class = (Class)SearchUILeadingTrailingSectionModel;
  v56 = [(SearchUISectionModel *)&v70 layoutSectionForEnvironment:v8 attributes:v9 dataSource:v10];
  [(SearchUILeadingTrailingSectionModel *)self sectionInsets];
  objc_msgSend(v56, "setContentInsets:");
  [(SearchUILeadingTrailingSectionModel *)self verticalSpacing];
  objc_msgSend(v56, "setInterGroupSpacing:");
LABEL_9:

  return v56;
}

- (id)buildGroupForFractionalWidth:(double)a3 numberOfCards:(int64_t)a4 isTopAligned:(BOOL)a5 prefersSeparator:(BOOL)a6 forView:(id)a7
{
  BOOL v53 = a6;
  v54[1] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  id v12 = [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  v51 = v12;
  v46 = self;
  if (a5)
  {
    id v13 = v12;
    double v14 = *MEMORY[0x1E4FB12A8];
    double v15 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v16 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v17 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
    uint64_t v18 = v13;
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
    id v13 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0 / (double)a4];
    [(SearchUILeadingTrailingSectionModel *)self verticalSpacing];
    double v14 = v19 * 0.5;
    [(SearchUILeadingTrailingSectionModel *)self verticalSpacing];
    double v16 = v20 * 0.5;
    double v17 = 0.0;
    double v15 = 0.0;
  }
  double v21 = (void *)MEMORY[0x1E4FB1338];
  double v22 = objc_msgSend(MEMORY[0x1E4FB1308], "fractionalWidthDimension:", 1.0, v46);
  v50 = v13;
  double v23 = [v21 sizeWithWidthDimension:v22 heightDimension:v13];

  double v24 = (void *)MEMORY[0x1E4FB1338];
  double v25 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:a3];
  v49 = [v24 sizeWithWidthDimension:v25 heightDimension:v18];

  double v26 = (void *)MEMORY[0x1E4FB1338];
  double v27 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  double v28 = (void *)MEMORY[0x1E4FB1308];
  v52 = v11;
  [MEMORY[0x1E4FAE198] pixelWidthForView:v11];
  double v29 = objc_msgSend(v28, "estimatedDimension:");
  uint64_t v30 = [v26 sizeWithWidthDimension:v27 heightDimension:v29];

  double v31 = [MEMORY[0x1E4FB12F0] layoutAnchorWithEdges:4];
  v32 = (void *)MEMORY[0x1E4FB1348];
  double v33 = +[SearchUISupplementaryIdentifiers itemSeparatorKind];
  v48 = (void *)v30;
  double v34 = [v32 supplementaryItemWithLayoutSize:v30 elementKind:v33 containerAnchor:v31];

  +[SearchUIUtilities standardCompactHorizontalMargin];
  objc_msgSend(v34, "setContentInsets:", 0.0, v35, 0.0, 0.0);
  double v36 = objc_opt_new();
  if (a4 >= 1)
  {
    double v37 = (void *)MEMORY[0x1E4F1CBF0];
    double v38 = v18;
    do
    {
      if (v53)
      {
        double v39 = v37;
        if (a4 != 1)
        {
          v54[0] = v34;
          double v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
        }
      }
      else
      {
        double v39 = v37;
      }
      v40 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v23 supplementaryItems:v39];
      v41 = v40;
      if (!a5) {
        objc_msgSend(v40, "setContentInsets:", v14, v15, v16, v17);
      }
      [v36 addObject:v41];

      --a4;
      uint64_t v18 = v38;
    }
    while (a4);
  }
  v42 = [MEMORY[0x1E4FB1318] verticalGroupWithLayoutSize:v49 subitems:v36];
  if (a5)
  {
    v43 = (void *)MEMORY[0x1E4FB1340];
    [v47 verticalSpacing];
    v44 = objc_msgSend(v43, "fixedSpacing:");
    [v42 setInterItemSpacing:v44];
  }
  return v42;
}

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3 forRowModel:(id)a4
{
  id v5 = a4;
  v6 = [(SearchUILeadingTrailingSectionModel *)self primaryCardSection];
  if ([(SearchUILeadingTrailingSectionModel *)self primaryCardSectionIsLeading]) {
    goto LABEL_7;
  }
  uint64_t v7 = [v5 backgroundColor];
  if (!v7) {
    goto LABEL_7;
  }
  id v8 = (void *)v7;
  id v9 = [v5 cardSection];
  if (v9 != v6)
  {

LABEL_7:
    id v12 = [(SearchUILeadingTrailingSectionModel *)self primaryCardSection];
    int64_t v11 = objc_msgSend(v12, "preferredBackgroundStyleForIsLeadingPrimaryCard:", -[SearchUILeadingTrailingSectionModel primaryCardSectionIsLeading](self, "primaryCardSectionIsLeading"));

    goto LABEL_8;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  int64_t v11 = 3;
LABEL_8:

  return v11;
}

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3
{
  BOOL v4 = [(SearchUILeadingTrailingSectionModel *)self primaryCardSection];
  int64_t v5 = objc_msgSend(v4, "preferredBackgroundStyleForIsLeadingPrimaryCard:", -[SearchUILeadingTrailingSectionModel primaryCardSectionIsLeading](self, "primaryCardSectionIsLeading"));

  return v5;
}

- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(SearchUILeadingTrailingSectionModel *)self customSectionInsets])
  {
    [(SearchUILeadingTrailingSectionModel *)self sectionInsets];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SearchUILeadingTrailingSectionModel;
    [(SearchUISectionModel *)&v19 sectionInsetsWithAttributes:v6 sectionIndex:a4];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.trailing = v18;
  result.bottom = v17;
  result.leading = v16;
  result.top = v15;
  return result;
}

- (id)copyWithRowModels:(id)a3
{
  BOOL v4 = SearchUIDataSourceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[SearchUILeadingTrailingSectionModel copyWithRowModels:](v4);
  }

  return (id)[(SearchUILeadingTrailingSectionModel *)self copy];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUILeadingTrailingSectionModel;
  id v4 = [(SearchUISectionModel *)&v10 copyWithZone:a3];
  int64_t v5 = [(SearchUILeadingTrailingSectionModel *)self leadingRowModels];
  id v6 = (void *)[v5 copy];
  [v4 setLeadingRowModels:v6];

  double v7 = [(SearchUILeadingTrailingSectionModel *)self trailingRowModels];
  double v8 = (void *)[v7 copy];
  [v4 setTrailingRowModels:v8];

  [(SearchUILeadingTrailingSectionModel *)self horizontalSpacing];
  objc_msgSend(v4, "setHorizontalSpacing:");
  [(SearchUILeadingTrailingSectionModel *)self verticalSpacing];
  objc_msgSend(v4, "setVerticalSpacing:");
  [(SearchUILeadingTrailingSectionModel *)self leadingFractionalWidth];
  objc_msgSend(v4, "setLeadingFractionalWidth:");
  [(SearchUILeadingTrailingSectionModel *)self preferredHeight];
  objc_msgSend(v4, "setPreferredHeight:");
  objc_msgSend(v4, "setPrefersSeparatorsInLeadingGroup:", -[SearchUILeadingTrailingSectionModel prefersSeparatorsInLeadingGroup](self, "prefersSeparatorsInLeadingGroup"));
  objc_msgSend(v4, "setPrefersSeparatorsInTrailingGroup:", -[SearchUILeadingTrailingSectionModel prefersSeparatorsInTrailingGroup](self, "prefersSeparatorsInTrailingGroup"));
  [(SearchUILeadingTrailingSectionModel *)self leadingGroupContentInsets];
  objc_msgSend(v4, "setLeadingGroupContentInsets:");
  [(SearchUILeadingTrailingSectionModel *)self trailingGroupContentInsets];
  objc_msgSend(v4, "setTrailingGroupContentInsets:");
  [(SearchUILeadingTrailingSectionModel *)self sectionInsets];
  objc_msgSend(v4, "setSectionInsets:");
  return v4;
}

- (SFLeadingTrailingCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
}

- (NSArray)leadingRowModels
{
  return self->_leadingRowModels;
}

- (void)setLeadingRowModels:(id)a3
{
}

- (NSArray)trailingRowModels
{
  return self->_trailingRowModels;
}

- (void)setTrailingRowModels:(id)a3
{
}

- (double)horizontalSpacing
{
  return self->_horizontalSpacing;
}

- (void)setHorizontalSpacing:(double)a3
{
  self->_horizontalSpacing = a3;
}

- (double)verticalSpacing
{
  return self->_verticalSpacing;
}

- (void)setVerticalSpacing:(double)a3
{
  self->_verticalSpacing = a3;
}

- (double)leadingFractionalWidth
{
  return self->_leadingFractionalWidth;
}

- (void)setLeadingFractionalWidth:(double)a3
{
  self->_leadingFractionalWidth = a3;
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (void)setPreferredHeight:(double)a3
{
  self->_preferredHeight = a3;
}

- (BOOL)prefersSeparatorsInLeadingGroup
{
  return self->_prefersSeparatorsInLeadingGroup;
}

- (void)setPrefersSeparatorsInLeadingGroup:(BOOL)a3
{
  self->_prefersSeparatorsInLeadingGroup = a3;
}

- (BOOL)prefersSeparatorsInTrailingGroup
{
  return self->_prefersSeparatorsInTrailingGroup;
}

- (void)setPrefersSeparatorsInTrailingGroup:(BOOL)a3
{
  self->_prefersSeparatorsInTrailingGroup = a3;
}

- (NSDirectionalEdgeInsets)leadingGroupContentInsets
{
  double top = self->_leadingGroupContentInsets.top;
  double leading = self->_leadingGroupContentInsets.leading;
  double bottom = self->_leadingGroupContentInsets.bottom;
  double trailing = self->_leadingGroupContentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setLeadingGroupContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_leadingGroupContentInsets = a3;
}

- (NSDirectionalEdgeInsets)trailingGroupContentInsets
{
  double top = self->_trailingGroupContentInsets.top;
  double leading = self->_trailingGroupContentInsets.leading;
  double bottom = self->_trailingGroupContentInsets.bottom;
  double trailing = self->_trailingGroupContentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setTrailingGroupContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_trailingGroupContentInsets = a3;
}

- (NSDirectionalEdgeInsets)sectionInsets
{
  double top = self->_sectionInsets.top;
  double leading = self->_sectionInsets.leading;
  double bottom = self->_sectionInsets.bottom;
  double trailing = self->_sectionInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setSectionInsets:(NSDirectionalEdgeInsets)a3
{
  self->_sectionInsets = a3;
}

- (BOOL)customSectionInsets
{
  return self->_customSectionInsets;
}

- (void)setCustomSectionInsets:(BOOL)a3
{
  self->_customSectionInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingRowModels, 0);
  objc_storeStrong((id *)&self->_leadingRowModels, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
}

- (void)copyWithRowModels:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Copying SearchUILeadingTrailingSectionModel with new rowModels is unsupported. Returning original as copy!", v1, 2u);
}

@end