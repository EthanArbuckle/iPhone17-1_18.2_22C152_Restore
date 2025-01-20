@interface SearchUIHorizontallyScrollingSectionModel
+ (int64_t)sectionType;
- (BOOL)drawsBackground;
- (BOOL)needsHeaderSeparator;
- (BOOL)needsHorizontalNavigation;
- (BOOL)selfSizingInTwoAxes;
- (BOOL)shouldHeightMatchSection;
- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4;
- (SearchUIHorizontallyScrollingSectionModel)initWithRowModels:(id)a3 section:(id)a4 numberOfRows:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5;
- (id)overriddenAccessibilityIdentifier;
- (int64_t)numberOfRows;
- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3;
- (void)setNumberOfRows:(int64_t)a3;
@end

@implementation SearchUIHorizontallyScrollingSectionModel

+ (int64_t)sectionType
{
  return 2;
}

- (SearchUIHorizontallyScrollingSectionModel)initWithRowModels:(id)a3 section:(id)a4 numberOfRows:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SearchUIHorizontallyScrollingSectionModel;
  v9 = [(SearchUISectionModel *)&v13 initWithRowModels:v8 section:a4];
  if (v9)
  {
    if (a5)
    {
      unint64_t v10 = [v8 count];
      if (v10 >= a5) {
        int64_t v11 = a5;
      }
      else {
        int64_t v11 = v10;
      }
    }
    else
    {
      int64_t v11 = 1;
    }
    [(SearchUIHorizontallyScrollingSectionModel *)v9 setNumberOfRows:v11];
  }

  return v9;
}

- (id)layoutSectionForEnvironment:(id)a3 attributes:(id)a4 dataSource:(id)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = [(SearchUISectionModel *)self rowModels];
  v55 = v6;
  if ([v7 count])
  {
    id v8 = [(SearchUISectionModel *)self rowModels];
  }
  else
  {
    v9 = [v6 snapshot];
    id v8 = [v9 itemIdentifiersInSectionWithIdentifier:self];
  }
  unint64_t v10 = [v8 firstObject];
  int64_t v11 = [v10 cardSection];

  v12 = (void *)MEMORY[0x1E4FB1338];
  objc_super v13 = objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_widthDimension");
  v14 = objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_heightDimension");
  v15 = [v12 sizeWithWidthDimension:v13 heightDimension:v14];

  v16 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v15];
  v54 = v8;
  unint64_t v17 = [v8 count];
  uint64_t v18 = (uint64_t)(double)(v17 / [(SearchUIHorizontallyScrollingSectionModel *)self numberOfRows]);
  uint64_t v19 = [(SearchUIHorizontallyScrollingSectionModel *)self numberOfRows];
  v20 = [v15 widthDimension];
  int v21 = [v20 isEstimated];

  objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_interItemSpacing");
  double v23 = v22;
  v24 = [v15 widthDimension];
  char v25 = [v24 isEstimated];
  uint64_t v52 = v18;
  if (v21)
  {
    if (v25)
    {
      double v26 = 10000.0;
      uint64_t v27 = 1;
LABEL_9:
      uint64_t v53 = v27;
      goto LABEL_13;
    }
    v28 = objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_widthDimension");
    [v28 dimension];
    double v26 = v23 * (double)(v18 - 1) + v29 * (double)v18;
    uint64_t v30 = 1;
  }
  else
  {
    if (v25)
    {
      double v26 = 10000.0;
      uint64_t v27 = 2;
      goto LABEL_9;
    }
    v28 = objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_widthDimension");
    [v28 dimension];
    double v26 = v31;
    uint64_t v30 = 2;
  }
  uint64_t v53 = v30;

LABEL_13:
  v32 = (void *)MEMORY[0x1E4FB1338];
  v33 = [MEMORY[0x1E4FB1308] absoluteDimension:v26];
  v34 = [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
  v35 = [v32 sizeWithWidthDimension:v33 heightDimension:v34];

  if (v19 < 2)
  {
    v42 = (void *)MEMORY[0x1E4FB1318];
    v56[0] = v16;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    v40 = [v42 horizontalGroupWithLayoutSize:v35 subitems:v43];
  }
  else
  {
    v36 = objc_opt_new();
    if ([(SearchUIHorizontallyScrollingSectionModel *)self numberOfRows])
    {
      unint64_t v37 = 0;
      if (v21) {
        uint64_t v38 = v52;
      }
      else {
        uint64_t v38 = 1;
      }
      do
      {
        v39 = objc_msgSend(MEMORY[0x1E4FB1318], "horizontalGroupWithLayoutSize:subitem:count:", v35, v16, v38, v52);
        [v36 addObject:v39];

        ++v37;
      }
      while (v37 < [(SearchUIHorizontallyScrollingSectionModel *)self numberOfRows]);
    }
    v40 = objc_msgSend(MEMORY[0x1E4FB1318], "verticalGroupWithLayoutSize:subitems:", v35, v36, v52);
    v41 = [MEMORY[0x1E4FB1310] spacingForLeading:0 top:0 trailing:0 bottom:0];
    [v40 setEdgeSpacing:v41];
  }
  v44 = (void *)MEMORY[0x1E4FB1340];
  objc_msgSend(v11, "_superGroupSpacing", v52);
  v45 = objc_msgSend(v44, "fixedSpacing:");
  [v40 setInterItemSpacing:v45];

  v46 = (void *)MEMORY[0x1E4FB1310];
  v47 = [MEMORY[0x1E4FB1340] fixedSpacing:16.0];
  v48 = [v46 spacingForLeading:0 top:0 trailing:0 bottom:v47];
  [v40 setEdgeSpacing:v48];

  v49 = [MEMORY[0x1E4FB1330] sectionWithGroup:v40];
  [v49 setOrthogonalScrollingBehavior:v53];
  double v50 = 8.0;
  if (v23 != 0.0) {
    double v50 = v23;
  }
  [v49 setInterGroupSpacing:v50];

  return v49;
}

- (BOOL)shouldHeightMatchSection
{
  BOOL v3 = [(SearchUIHorizontallyScrollingSectionModel *)self drawsBackground];
  if (v3) {
    LOBYTE(v3) = [(SearchUIHorizontallyScrollingSectionModel *)self numberOfRows] == 1;
  }
  return v3;
}

- (BOOL)needsHeaderSeparator
{
  v2 = [(SearchUISectionModel *)self rowModels];
  BOOL v3 = [v2 firstObject];
  v4 = [v3 cardSection];
  char v5 = objc_msgSend(v4, "searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator");

  return v5;
}

- (BOOL)drawsBackground
{
  v2 = [(SearchUISectionModel *)self rowModels];
  BOOL v3 = [v2 firstObject];
  v4 = [v3 cardSection];
  char v5 = objc_msgSend(v4, "searchUIHorizontallyScrollingSectionModel_useBackground");

  return v5;
}

- (BOOL)selfSizingInTwoAxes
{
  v2 = [(SearchUISectionModel *)self rowModels];
  BOOL v3 = [v2 firstObject];
  v4 = [v3 cardSection];
  char v5 = objc_msgSend(v4, "searchUIHorizontallyScrollingSectionModel_widthDimension");
  char v6 = [v5 isEstimated];

  return v6;
}

- (int64_t)sectionBackgroundStyleWithAttributes:(id)a3
{
  if ([(SearchUIHorizontallyScrollingSectionModel *)self drawsBackground]) {
    return 3;
  }
  else {
    return 5;
  }
}

- (NSDirectionalEdgeInsets)sectionInsetsWithAttributes:(id)a3 sectionIndex:(unint64_t)a4
{
  v43.receiver = self;
  v43.super_class = (Class)SearchUIHorizontallyScrollingSectionModel;
  id v6 = a3;
  [(SearchUISectionModel *)&v43 sectionInsetsWithAttributes:v6 sectionIndex:a4];
  double v41 = v7;
  double v42 = v8;
  v9 = [(SearchUISectionModel *)self rowModels];
  unint64_t v10 = [v9 firstObject];
  int64_t v11 = [v10 cardSection];
  objc_msgSend(v11, "searchUIHorizontallyScrollingSectionModel_additionalSectionInsets");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v20 = [(SearchUISectionModel *)self rowModels];
  int v21 = [v20 firstObject];
  double v22 = [v21 cardSection];
  objc_msgSend(v22, "searchUIHorizontallyScrollingSectionModel_customSectionInsets");
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  int v31 = [MEMORY[0x1E4FAE198] isMacOS];
  int v32 = [MEMORY[0x1E4FAE198] isMacOS];
  int v33 = [v6 shouldUseInsetRoundedSections];

  if (v26 == 0.0 && v24 == 0.0 && v30 == 0.0 && v28 == 0.0)
  {
    double v34 = 0.0;
    if (v33) {
      double v34 = 8.0;
    }
    double v35 = 16.0;
    if (v32) {
      double v35 = 12.0;
    }
    double v36 = 4.0;
    if (v31) {
      double v36 = 2.0;
    }
    double v24 = v13 + v36;
    double v26 = v41 + v15 + v34;
    double v28 = v17 + v35;
    double v30 = v42 + v19 + v34;
  }
  double v37 = v24;
  double v38 = v26;
  double v39 = v28;
  double v40 = v30;
  result.trailing = v40;
  result.bottom = v39;
  result.leading = v38;
  result.top = v37;
  return result;
}

- (id)overriddenAccessibilityIdentifier
{
  return @"HorizontallyScrollingCell";
}

- (BOOL)needsHorizontalNavigation
{
  BOOL v3 = [(SearchUISectionModel *)self rowModels];
  unint64_t v4 = [v3 count];
  uint64_t v5 = (uint64_t)(double)(v4 / [(SearchUIHorizontallyScrollingSectionModel *)self numberOfRows]);

  return v5 > 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIHorizontallyScrollingSectionModel;
  id v4 = [(SearchUISectionModel *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setNumberOfRows:", -[SearchUIHorizontallyScrollingSectionModel numberOfRows](self, "numberOfRows"));
  return v4;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(int64_t)a3
{
  self->_numberOfRows = a3;
}

@end