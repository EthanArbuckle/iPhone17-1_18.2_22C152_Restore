@interface PXPhotosSectionHeaderMetrics
+ (PXPhotosSectionHeaderMetrics)sharedMetrics;
- (PXPhotosSectionHeaderMetrics)init;
- (double)accessibilitySectionHeaderHeightForStyle:(int64_t)a3 width:(double)a4 actionButton:(BOOL)a5 disclosure:(BOOL)a6 title:(id)a7 startDate:(id)a8 endDate:(id)a9 locations:(id)a10 actionButtonSpec:(id)a11;
- (double)sectionHeaderHeightForStyle:(int64_t)a3 hasTitle:(BOOL)a4 hasDates:(BOOL)a5 hasLocation:(BOOL)a6;
- (void)_invalidateCache;
@end

@implementation PXPhotosSectionHeaderMetrics

- (double)accessibilitySectionHeaderHeightForStyle:(int64_t)a3 width:(double)a4 actionButton:(BOOL)a5 disclosure:(BOOL)a6 title:(id)a7 startDate:(id)a8 endDate:(id)a9 locations:(id)a10 actionButtonSpec:(id)a11
{
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  id v18 = a11;
  if (accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__onceToken != -1) {
    dispatch_once(&accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__onceToken, &__block_literal_global_430);
  }
  v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v19 scale];

  [(id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel setNumberOfLines:2];
  _PXConfigurePhotoCollectionHeaderTitleLabel((void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, a3);
  v20 = [(id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel font];
  double v21 = 26.0;
  if (a3 == 1) {
    double v21 = 30.0;
  }
  [v20 _scaledValueForValue:v21];
  PXFloatRoundToPixel();
}

uint64_t __154__PXPhotosSectionHeaderMetrics_accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [(id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel setText:a2];
  v2 = (void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel;
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  return objc_msgSend(v2, "sizeThatFits:", v3, v4);
}

void __154__PXPhotosSectionHeaderMetrics_accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v1 = (void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel;
  accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F8A798]);
  double v3 = (void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__dateRangeFormatter;
  accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__dateRangeFormatter = (uint64_t)v2;
}

- (double)sectionHeaderHeightForStyle:(int64_t)a3 hasTitle:(BOOL)a4 hasDates:(BOOL)a5 hasLocation:(BOOL)a6
{
  BOOL v7 = a4 && a5 || a6;
  uint64_t v8 = 2;
  if (v7) {
    uint64_t v8 = 3;
  }
  if (a3 == 1) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = (a4 && a5) | a6;
  }
  double v10 = self->_cachedHeights[v9];
  v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];

  if (v10 == 0.0)
  {
    v13 = _PXPhotoCollectionHeaderTitleLabelFontForStyle(a3);
    if (v7)
    {
      _PXPhotoCollectionHeaderSubtitleFontForStyle(a3);
      [(id)objc_claimAutoreleasedReturnValue() _scaledValueForValue:20.0];
      PXFloatRoundToPixel();
    }
    double v14 = 26.0;
    if (a3 == 1) {
      double v14 = 30.0;
    }
    [v13 _scaledValueForValue:v14];
    PXFloatRoundToPixel();
  }
  return v10;
}

- (void)_invalidateCache
{
  *(_OWORD *)&self->_cachedHeights[2] = 0u;
  *(_OWORD *)self->_cachedHeights = 0u;
}

- (PXPhotosSectionHeaderMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXPhotosSectionHeaderMetrics;
  id v2 = [(PXPhotosSectionHeaderMetrics *)&v6 init];
  double v3 = v2;
  if (v2)
  {
    [(PXPhotosSectionHeaderMetrics *)v2 _invalidateCache];
    double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v3;
}

+ (PXPhotosSectionHeaderMetrics)sharedMetrics
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PXPhotosSectionHeaderMetrics_sharedMetrics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMetrics_onceToken != -1) {
    dispatch_once(&sharedMetrics_onceToken, block);
  }
  id v2 = (void *)sharedMetrics_sharedMetrics;
  return (PXPhotosSectionHeaderMetrics *)v2;
}

void __45__PXPhotosSectionHeaderMetrics_sharedMetrics__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)sharedMetrics_sharedMetrics;
  sharedMetrics_sharedMetrics = (uint64_t)v1;
}

@end