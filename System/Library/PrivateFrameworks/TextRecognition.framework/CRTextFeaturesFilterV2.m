@interface CRTextFeaturesFilterV2
- (CGPoint)_pointInImageSpace:(CGPoint)a3 imageSize:(CGSize)a4;
- (CRSingleTextFeatureFiltering)chineseLowConfidenceFilter;
- (CRSingleTextFeatureFiltering)japaneseLowConfidenceFilter;
- (CRSingleTextFeatureFiltering)koreanLowConfidenceFilter;
- (CRSingleTextFeatureFiltering)latinLowConfidenceFilter;
- (CRTextFeaturesFilterV2)initWithLocale:(id)a3;
- (NSString)preferredLocale;
- (double)_distanceFromPoint1:(CGPoint)a3 toPoint2:(CGPoint)a4;
- (id)_filterForLocale:(id)a3;
- (id)_groupGeometriesForRegions:(id)a3;
- (id)filterBlocks:(id)a3;
- (id)filterLineRegions:(id)a3;
- (void)setChineseLowConfidenceFilter:(id)a3;
- (void)setJapaneseLowConfidenceFilter:(id)a3;
- (void)setKoreanLowConfidenceFilter:(id)a3;
- (void)setLatinLowConfidenceFilter:(id)a3;
- (void)setPreferredLocale:(id)a3;
@end

@implementation CRTextFeaturesFilterV2

- (CRTextFeaturesFilterV2)initWithLocale:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRTextFeaturesFilterV2;
  v6 = [(CRTextFeaturesFilterV2 *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preferredLocale, a3);
    uint64_t v8 = objc_opt_new();
    latinLowConfidenceFilter = v7->_latinLowConfidenceFilter;
    v7->_latinLowConfidenceFilter = (CRSingleTextFeatureFiltering *)v8;

    v10 = [[CRCJKLowConfidenceTextFeatureFilterV2 alloc] initWithLowConfidenceThresholdFor1CharLines:0.5 for2PlusCharLines:0.3 forIsolated1CharLines:0.4];
    chineseLowConfidenceFilter = v7->_chineseLowConfidenceFilter;
    v7->_chineseLowConfidenceFilter = (CRSingleTextFeatureFiltering *)v10;

    v12 = [[CRCJKLowConfidenceTextFeatureFilterV2 alloc] initWithLowConfidenceThresholdFor1CharLines:0.5 for2PlusCharLines:0.3 forIsolated1CharLines:0.4];
    japaneseLowConfidenceFilter = v7->_japaneseLowConfidenceFilter;
    v7->_japaneseLowConfidenceFilter = (CRSingleTextFeatureFiltering *)v12;

    v14 = [[CRCJKLowConfidenceTextFeatureFilterV2 alloc] initWithLowConfidenceThresholdFor1CharLines:0.5 for2PlusCharLines:0.3 forIsolated1CharLines:0.4];
    koreanLowConfidenceFilter = v7->_koreanLowConfidenceFilter;
    v7->_koreanLowConfidenceFilter = (CRSingleTextFeatureFiltering *)v14;
  }
  return v7;
}

- (id)filterLineRegions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isCurved", (void)v16) & 1) == 0)
        {
          v12 = [v11 locale];
          v13 = [(CRTextFeaturesFilterV2 *)self _filterForLocale:v12];

          if (!v13 || (char v14 = [v13 shouldFilterRegion:v11], v13, (v14 & 1) == 0)) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)filterBlocks:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(CRTextFeaturesFilterV2 *)self _groupGeometriesForRegions:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v11 shouldBeConsiderForFiltering])
        {
          [v11 calculateMinimumDistanceFromOtherGeometries:v6];
          double v13 = v12;
          char v14 = [(CRTextFeaturesFilterV2 *)self preferredLocale];
          v15 = [(CRTextFeaturesFilterV2 *)self _filterForLocale:v14];

          if (!v15 || ([v15 shouldFilterRegionBasedOnGeometry:v11 closestDistance:v13] & 1) == 0)
          {
            long long v16 = [v11 groupRegion];
            [v5 addObject:v16];
          }
        }
        else
        {
          v15 = [v11 groupRegion];
          [v5 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_groupGeometriesForRegions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [CRGroupRegionGeometry alloc];
        double v12 = -[CRGroupRegionGeometry initWithGroupRegion:](v11, "initWithGroupRegion:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (CGPoint)_pointInImageSpace:(CGPoint)a3 imageSize:(CGSize)a4
{
  double v4 = a3.x * a4.width;
  double v5 = a3.y * a4.height;
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)_distanceFromPoint1:(CGPoint)a3 toPoint2:(CGPoint)a4
{
  return sqrt((a3.y - a4.y) * (a3.y - a4.y) + (a3.x - a4.x) * (a3.x - a4.x));
}

- (id)_filterForLocale:(id)a3
{
  id v4 = a3;
  double v5 = [(CRTextFeaturesFilterV2 *)self latinLowConfidenceFilter];
  if (+[CRImageReader languageIsChinese:v4])
  {
    uint64_t v6 = [(CRTextFeaturesFilterV2 *)self chineseLowConfidenceFilter];
  }
  else if (+[CRImageReader languageIsKorean:v4])
  {
    uint64_t v6 = [(CRTextFeaturesFilterV2 *)self koreanLowConfidenceFilter];
  }
  else
  {
    if (!+[CRImageReader languageIsJapanese:v4]) {
      goto LABEL_8;
    }
    uint64_t v6 = [(CRTextFeaturesFilterV2 *)self japaneseLowConfidenceFilter];
  }
  uint64_t v7 = (void *)v6;

  double v5 = v7;
LABEL_8:

  return v5;
}

- (NSString)preferredLocale
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreferredLocale:(id)a3
{
}

- (CRSingleTextFeatureFiltering)latinLowConfidenceFilter
{
  return (CRSingleTextFeatureFiltering *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLatinLowConfidenceFilter:(id)a3
{
}

- (CRSingleTextFeatureFiltering)chineseLowConfidenceFilter
{
  return (CRSingleTextFeatureFiltering *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChineseLowConfidenceFilter:(id)a3
{
}

- (CRSingleTextFeatureFiltering)japaneseLowConfidenceFilter
{
  return (CRSingleTextFeatureFiltering *)objc_getProperty(self, a2, 32, 1);
}

- (void)setJapaneseLowConfidenceFilter:(id)a3
{
}

- (CRSingleTextFeatureFiltering)koreanLowConfidenceFilter
{
  return (CRSingleTextFeatureFiltering *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKoreanLowConfidenceFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_koreanLowConfidenceFilter, 0);
  objc_storeStrong((id *)&self->_japaneseLowConfidenceFilter, 0);
  objc_storeStrong((id *)&self->_chineseLowConfidenceFilter, 0);
  objc_storeStrong((id *)&self->_latinLowConfidenceFilter, 0);
  objc_storeStrong((id *)&self->_preferredLocale, 0);
}

@end