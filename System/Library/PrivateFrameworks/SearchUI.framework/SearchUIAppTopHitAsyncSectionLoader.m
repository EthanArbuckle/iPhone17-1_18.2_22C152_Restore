@interface SearchUIAppTopHitAsyncSectionLoader
+ (BOOL)supportsSectionModel:(id)a3;
+ (int64_t)maxNumOfTopHitEntities;
- (SFAppIconCardSection)appIconCardSection;
- (SFColor)sectionBackgroundColor;
- (SearchUIAppTopHitAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5;
- (id)backgroundColor;
- (id)buildVerticalLayoutCardSectionFromResult:(id)a3 title:(id)a4 subtitle:(id)a5 command:(id)a6;
- (id)bundleIdentifier;
- (id)cardSections;
- (id)responseForCardSections:(id)a3 animated:(BOOL)a4;
- (void)setAppIconCardSection:(id)a3;
- (void)setSectionBackgroundColor:(id)a3;
@end

@implementation SearchUIAppTopHitAsyncSectionLoader

+ (BOOL)supportsSectionModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 rowModels];
    if ([v4 count] == 1)
    {
      v5 = [v3 rowModels];
      v6 = [v5 firstObject];
      v7 = [v6 cardSection];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (SearchUIAppTopHitAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SearchUIAppTopHitAsyncSectionLoader;
  v9 = [(SearchUIAsyncSectionLoader *)&v17 initWithSectionModel:v8 result:a4 queryId:a5];
  if (v9)
  {
    v10 = [v8 rowModels];
    v11 = [v10 firstObject];

    v12 = [v11 cardSection];
    [(SearchUIAppTopHitAsyncSectionLoader *)v9 setAppIconCardSection:v12];

    v13 = [v8 section];
    v14 = [v13 collectionSection];
    v15 = [v14 backgroundColor];
    [(SearchUIAppTopHitAsyncSectionLoader *)v9 setSectionBackgroundColor:v15];
  }
  return v9;
}

+ (int64_t)maxNumOfTopHitEntities
{
  if (+[SearchUIUtilities isIpad]) {
    return 5;
  }
  if ([MEMORY[0x1E4FAE198] isMacOS]) {
    return 5;
  }
  return 3;
}

- (id)backgroundColor
{
  id v3 = [(SearchUIAppTopHitAsyncSectionLoader *)self cardSections];
  if ((unint64_t)[v3 count] < 2)
  {
    v6 = 0;
  }
  else
  {
    v4 = [(SearchUIAppTopHitAsyncSectionLoader *)self cardSections];
    v5 = [v4 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(SearchUIAppTopHitAsyncSectionLoader *)self sectionBackgroundColor];
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)bundleIdentifier
{
  v2 = [(SearchUIAppTopHitAsyncSectionLoader *)self appIconCardSection];
  id v3 = [v2 applicationBundleIdentifier];

  return v3;
}

- (id)cardSections
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SearchUIAppTopHitAsyncSectionLoader;
  id v3 = [(SearchUIAsyncSectionLoader *)&v8 cardSections];
  v4 = [(SearchUIAppTopHitAsyncSectionLoader *)self appIconCardSection];
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6 = [v5 arrayByAddingObjectsFromArray:v3];

  return v6;
}

- (id)responseForCardSections:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setCardSection:v5];

  [v6 setAnimated:v4];
  [v6 setReconfigureExisting:1];
  return v6;
}

- (id)buildVerticalLayoutCardSectionFromResult:(id)a3 title:(id)a4 subtitle:(id)a5 command:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setUseAppIconMetrics:1];
  v14 = [MEMORY[0x1E4F9A378] textWithString:v11];

  [v13 setTitle:v14];
  v15 = [v13 title];
  [v15 setMaxLines:2];

  [v13 setThumbnail:v12];
  v16 = [MEMORY[0x1E4F9A378] textWithString:v10];

  [v13 setFootnote:v16];
  objc_super v17 = [v13 footnote];
  [v17 setMaxLines:1];

  [v13 setCommand:v9];
  return v13;
}

- (SFAppIconCardSection)appIconCardSection
{
  return self->_appIconCardSection;
}

- (void)setAppIconCardSection:(id)a3
{
}

- (SFColor)sectionBackgroundColor
{
  return self->_sectionBackgroundColor;
}

- (void)setSectionBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_appIconCardSection, 0);
}

@end