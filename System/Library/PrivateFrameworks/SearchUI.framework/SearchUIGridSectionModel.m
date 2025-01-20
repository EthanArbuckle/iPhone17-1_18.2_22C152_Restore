@interface SearchUIGridSectionModel
+ (int64_t)sectionType;
- (BOOL)needsHeaderSeparator;
- (BOOL)needsHorizontalNavigation;
- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4;
- (SearchUIGridSectionModel)initWithRowModels:(id)a3 numberOfColumns:(int64_t)a4 gridStyle:(int)a5 section:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5;
- (id)overriddenAccessibilityIdentifier;
- (id)rfHeroImageGridLayoutSectionForCardSection:(id)a3;
- (int)gridStyle;
- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3;
- (unint64_t)numberOfColumns;
- (void)setCornerMaskRulesOnRowModels:(id)a3 forColumnCount:(unint64_t)a4;
- (void)setGridStyle:(int)a3;
- (void)setNumberOfColumns:(unint64_t)a3;
@end

@implementation SearchUIGridSectionModel

+ (int64_t)sectionType
{
  return 1;
}

- (SearchUIGridSectionModel)initWithRowModels:(id)a3 numberOfColumns:(int64_t)a4 gridStyle:(int)a5 section:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  v11.receiver = self;
  v11.super_class = (Class)SearchUIGridSectionModel;
  v8 = [(SearchUISectionModel *)&v11 initWithRowModels:a3 section:a6];
  v9 = v8;
  if (v8)
  {
    [(SearchUIGridSectionModel *)v8 setNumberOfColumns:a4];
    [(SearchUIGridSectionModel *)v9 setGridStyle:v6];
  }
  return v9;
}

- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5
{
  id v7 = a3;
  v8 = [a5 snapshot];
  v9 = [v8 itemIdentifiersInSectionWithIdentifier:self];

  unint64_t v10 = [(SearchUIGridSectionModel *)self numberOfColumns];
  if (!v10)
  {
    objc_super v11 = [v7 container];
    [v11 effectiveContentSize];
    double v13 = v12;

    if ([MEMORY[0x1E4FAE198] isMacOS] && v13 > 500.0)
    {
      unint64_t v10 = 6;
    }
    else if (+[SearchUIUtilities isIpad] && v13 > 500.0)
    {
      unint64_t v10 = 5;
    }
    else if ([MEMORY[0x1E4FAE198] isWatchOS])
    {
      unint64_t v10 = 2;
    }
    else
    {
      unint64_t v10 = 4;
    }
  }
  v14 = [v9 firstObject];
  v15 = [v14 cardSection];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v9 count] == 1) {
      unint64_t v10 = 1;
    }
    v16 = [v9 firstObject];
    [v16 setShouldFillAvailableSpace:v10 == 1];
  }
  if ([(SearchUIGridSectionModel *)self gridStyle] != 1
    && [(SearchUIGridSectionModel *)self gridStyle] != 2)
  {
    objc_msgSend(MEMORY[0x1E4FB1308], "fractionalWidthDimension:", 1.0 / (double)v10, v7);
    goto LABEL_21;
  }
  if ([MEMORY[0x1E4FAE198] isWatchOS])
  {
    unint64_t v10 = 2;
    objc_msgSend(MEMORY[0x1E4FB1308], "fractionalWidthDimension:", 1.0 / (double)2uLL, v7);
    v18 = LABEL_21:;
    uint64_t v19 = objc_msgSend(v15, "searchUIGridSectionModel_heightDimensionWithColumnCount:", v10);
    v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = v18;
    }
    id v22 = v21;

    v33 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v18 heightDimension:v22];

    v23 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v33];
    v24 = (void *)MEMORY[0x1E4FB1338];
    v25 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v26 = [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
    v27 = [v24 sizeWithWidthDimension:v25 heightDimension:v26];

    v28 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v27 repeatingSubitem:v23 count:v10];
    v29 = (void *)MEMORY[0x1E4FB1340];
    objc_msgSend(v15, "searchUIGridSectionModel_interItemSpacing");
    v30 = objc_msgSend(v29, "fixedSpacing:");
    [v28 setInterItemSpacing:v30];

    id v7 = v32;
    objc_msgSend(v15, "searchUIGridSectionModel_groupInsetFor:", v32);
    objc_msgSend(v28, "setContentInsets:");
    v17 = [MEMORY[0x1E4FB1330] sectionWithGroup:v28];
    objc_msgSend(v15, "searchUIGridSectionModel_interItemSpacing");
    objc_msgSend(v17, "setInterGroupSpacing:");
    [(SearchUIGridSectionModel *)self setCornerMaskRulesOnRowModels:v9 forColumnCount:v10];

    goto LABEL_25;
  }
  [(SearchUIGridSectionModel *)self setCornerMaskRulesOnRowModels:v9 forColumnCount:v10];
  v17 = [(SearchUIGridSectionModel *)self rfHeroImageGridLayoutSectionForCardSection:v15];
LABEL_25:

  return v17;
}

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3
{
  v4 = [(SearchUISectionModel *)self rowModels];
  v5 = [v4 firstObject];
  uint64_t v6 = [v5 cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (+[SearchUIUtilities isIpad]) {
      return 2;
    }
    else {
      return 4;
    }
  }
  else
  {
    v9 = [(SearchUISectionModel *)self rowModels];
    unint64_t v10 = [v9 firstObject];
    objc_super v11 = [v10 cardSection];
    if (objc_msgSend(v11, "searchUIGridSectionModel_useBackground")) {
      int64_t v8 = 3;
    }
    else {
      int64_t v8 = 5;
    }
  }
  return v8;
}

- (id)overriddenAccessibilityIdentifier
{
  return @"GridCell";
}

- (BOOL)needsHeaderSeparator
{
  return 0;
}

- (void)setCornerMaskRulesOnRowModels:(id)a3 forColumnCount:(unint64_t)a4
{
  id v6 = a3;
  if ([(SearchUIGridSectionModel *)self gridStyle] == 1) {
    int v7 = [MEMORY[0x1E4FAE198] isWatchOS] ^ 1;
  }
  else {
    int v7 = 0;
  }
  if ([(SearchUIGridSectionModel *)self gridStyle] == 2) {
    int v8 = [MEMORY[0x1E4FAE198] isWatchOS] ^ 1;
  }
  else {
    int v8 = 0;
  }
  unint64_t v9 = [v6 count];
  unint64_t v10 = vcvtps_u32_f32((float)v9 / (float)a4);
  int v11 = v7 | v8;
  unint64_t v12 = a4 - 1;
  if (v8) {
    unint64_t v12 = 2;
  }
  if (v7) {
    unint64_t v12 = 1;
  }
  unint64_t v13 = v10 * a4;
  if (v11) {
    unint64_t v13 = v9;
  }
  unint64_t v14 = v13 - 1;
  unint64_t v15 = v9 - 1;
  if ((v7 & v8) != 0) {
    unint64_t v16 = v12;
  }
  else {
    unint64_t v16 = v9 - 1;
  }
  if ((v7 & v8) != 0) {
    unint64_t v15 = v14;
  }
  unint64_t v17 = v10 - 1;
  if (v17) {
    unint64_t v18 = v12;
  }
  else {
    unint64_t v18 = v16;
  }
  if (v17) {
    unint64_t v19 = v14;
  }
  else {
    unint64_t v19 = v15;
  }
  unint64_t v20 = v17 * a4;
  if (v11) {
    uint64_t v21 = 3;
  }
  else {
    uint64_t v21 = v20;
  }
  char v22 = [MEMORY[0x1E4FAE100] isLTR];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__SearchUIGridSectionModel_setCornerMaskRulesOnRowModels_forColumnCount___block_invoke;
  v23[3] = &__block_descriptor_65_e33_v32__0__SearchUIRowModel_8Q16_B24l;
  char v24 = v22 ^ 1;
  v23[4] = 0;
  v23[5] = v18;
  v23[6] = v19;
  v23[7] = v21;
  [v6 enumerateObjectsUsingBlock:v23];
}

void __73__SearchUIGridSectionModel_setCornerMaskRulesOnRowModels_forColumnCount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 32) == a3)
  {
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (*(void *)(a1 + 40) == a3)
  {
    uint64_t v4 = 1;
    if (!*(unsigned char *)(a1 + 64)) {
      uint64_t v4 = 2;
    }
    v3 |= v4;
  }
  if (*(void *)(a1 + 48) == a3)
  {
    uint64_t v5 = 4;
    if (!*(unsigned char *)(a1 + 64)) {
      uint64_t v5 = 8;
    }
    v3 |= v5;
  }
  if (*(void *)(a1 + 56) == a3)
  {
    uint64_t v6 = 8;
    if (!*(unsigned char *)(a1 + 64)) {
      uint64_t v6 = 4;
    }
    v3 |= v6;
  }
  id v7 = a2;
  [v7 setCornerMask:v3];
  [v7 setHasCustomCornerRounding:1];
}

- (BOOL)needsHorizontalNavigation
{
  v2 = [(SearchUISectionModel *)self rowModels];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SearchUISectionModel *)self rowModels];
  int v8 = [v7 firstObject];
  unint64_t v9 = [v8 cardSection];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int v11 = [(SearchUISectionModel *)self rowModels];
    unint64_t v12 = [v11 firstObject];
    unint64_t v13 = [v12 cardSection];
    objc_msgSend(v13, "searchUIGridSectionModel_customSectionInsets");
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)SearchUIGridSectionModel;
    [(SearchUISectionModel *)&v30 sectionInsetsWithAttributes:v6 sectionIndex:a4];
    double v15 = v22;
    double v17 = v23;
    double v19 = v24;
    double v21 = v25;
  }

  double v26 = v15;
  double v27 = v17;
  double v28 = v19;
  double v29 = v21;
  result.trailing = v29;
  result.bottom = v28;
  result.leading = v27;
  result.top = v26;
  return result;
}

- (id)rfHeroImageGridLayoutSectionForCardSection:(id)a3
{
  v79[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4FAE198];
  id v4 = a3;
  char v5 = [v3 isXROS];
  id v6 = (void *)MEMORY[0x1E4FB1338];
  id v7 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.666666667];
  if (v5) {
    [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else {
  int v8 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  }
  uint64_t v9 = [v6 sizeWithWidthDimension:v7 heightDimension:v8];

  v71 = (void *)v9;
  char v10 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v9];
  int v11 = (void *)MEMORY[0x1E4FB1338];
  unint64_t v12 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  if (v5) {
    [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else {
  unint64_t v13 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:0.5];
  }
  uint64_t v14 = [v11 sizeWithWidthDimension:v12 heightDimension:v13];

  v69 = (void *)v14;
  double v15 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v14];
  double v16 = (void *)MEMORY[0x1E4FB1338];
  double v17 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.5];
  if (v5) {
    [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else {
  double v18 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  }
  uint64_t v19 = [v16 sizeWithWidthDimension:v17 heightDimension:v18];

  v67 = (void *)v19;
  v74 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v19];
  double v20 = (void *)MEMORY[0x1E4FB1338];
  double v21 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.333333333];
  if (v5) {
    [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else {
  double v22 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  }
  uint64_t v23 = [v20 sizeWithWidthDimension:v21 heightDimension:v22];

  v66 = (void *)v23;
  double v24 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v23];
  objc_msgSend(v4, "searchUIGridSectionModel_interItemSpacing");
  double v26 = v25;

  double v27 = v26 * 0.5;
  objc_msgSend(v10, "setContentInsets:", v27, v27, v27, v27);
  objc_msgSend(v15, "setContentInsets:", v27, v27, v27, v27);
  objc_msgSend(v74, "setContentInsets:", v27, v27, v27, v27);
  v72 = v24;
  objc_msgSend(v24, "setContentInsets:", v27, v27, v27, v27);
  double v28 = (void *)MEMORY[0x1E4FB1338];
  double v29 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.333333333];
  if (v5) {
    [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else {
  objc_super v30 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  }
  uint64_t v31 = [v28 sizeWithWidthDimension:v29 heightDimension:v30];

  v65 = (void *)v31;
  uint64_t v32 = [MEMORY[0x1E4FB1318] verticalGroupWithLayoutSize:v31 repeatingSubitem:v15 count:2];
  v33 = (void *)MEMORY[0x1E4FB1338];
  v34 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  if (v5) {
    [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else {
  v35 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:0.666666667];
  }
  uint64_t v36 = [v33 sizeWithWidthDimension:v34 heightDimension:v35];

  if ([(SearchUIGridSectionModel *)self gridStyle] == 2)
  {
    v79[0] = v32;
    v37 = (void **)v79;
    uint64_t v38 = (uint64_t)v10;
  }
  else
  {
    v78 = v10;
    v37 = &v78;
    uint64_t v38 = v32;
  }
  v64 = (void *)v32;
  v37[1] = (void *)v38;
  v62 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  v63 = (void *)v36;
  v39 = objc_msgSend(MEMORY[0x1E4FB1318], "horizontalGroupWithLayoutSize:subitems:", v36);
  v40 = (void *)MEMORY[0x1E4FB1338];
  v41 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.666666667];
  v68 = v15;
  if (v5) {
    [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else {
  v42 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  }
  v43 = [v40 sizeWithWidthDimension:v41 heightDimension:v42];

  v44 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v43 repeatingSubitem:v74 count:2];
  v45 = (void *)MEMORY[0x1E4FB1338];
  v46 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v70 = v10;
  if (v5) {
    [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else {
  v47 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:0.333333333];
  }
  v48 = [v45 sizeWithWidthDimension:v46 heightDimension:v47];

  if ([(SearchUIGridSectionModel *)self gridStyle] == 2)
  {
    v77 = v72;
    v49 = &v77;
    v50 = v44;
  }
  else
  {
    v76 = v44;
    v49 = &v76;
    v50 = v72;
  }
  v49[1] = v50;
  v51 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  v52 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v48 subitems:v51];
  v53 = (void *)MEMORY[0x1E4FB1338];
  v54 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  if (v5) {
    [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  }
  else {
  v55 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  }
  v56 = [v53 sizeWithWidthDimension:v54 heightDimension:v55];

  v57 = (void *)MEMORY[0x1E4FB1318];
  v75[0] = v39;
  v75[1] = v52;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
  v59 = [v57 verticalGroupWithLayoutSize:v56 subitems:v58];

  v60 = [MEMORY[0x1E4FB1330] sectionWithGroup:v59];

  return v60;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIGridSectionModel;
  id v4 = [(SearchUISectionModel *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setNumberOfColumns:", -[SearchUIGridSectionModel numberOfColumns](self, "numberOfColumns"));
  return v4;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (int)gridStyle
{
  return self->_gridStyle;
}

- (void)setGridStyle:(int)a3
{
  self->_gridStyle = a3;
}

@end