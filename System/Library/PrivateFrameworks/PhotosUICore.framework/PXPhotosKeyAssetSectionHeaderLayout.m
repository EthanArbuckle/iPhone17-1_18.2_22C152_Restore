@interface PXPhotosKeyAssetSectionHeaderLayout
- (BOOL)isInSelectMode;
- (BOOL)shouldHideBanner;
- (CGRect)_bestCropRectForAspectRatio:(double)a3;
- (CGRect)titleBaseFrame;
- (CGSize)_keyAssetSize;
- (CGSize)bannerViewSize;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSDictionary)titleAttributes;
- (NSString)title;
- (PXAssetsDataSource)dataSource;
- (PXPhotosBannerProvider)bannerProvider;
- (PXPhotosBannerView)bannerView;
- (PXPhotosKeyAssetSectionHeaderLayout)initWithViewModel:(id)a3;
- (PXPhotosLayoutSpec)spec;
- (PXPhotosViewModel)viewModel;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXSimpleIndexPath)sectionIndexPath;
- (double)_floatOffset;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (void)_bumpAssetVersion;
- (void)_bumpBannerVersion;
- (void)_bumpTitleVersion;
- (void)_invalidateAnimations;
- (void)_invalidateBannerRequest;
- (void)_invalidateBannerView;
- (void)_invalidateContent;
- (void)_invalidateContentSize;
- (void)_invalidateFloatParameters;
- (void)_invalidateKeyAssetFetch;
- (void)_invalidateTitle;
- (void)_invalidateTitleMetrics;
- (void)_loadBannerIfNecessary;
- (void)_transitionToBannerView:(id)a3 version:(int64_t)a4;
- (void)_updateAnimations;
- (void)_updateBannerView;
- (void)_updateContent;
- (void)_updateContentSize;
- (void)_updateFloatParameters;
- (void)_updateKeyAssetFetch;
- (void)_updateTitle;
- (void)_updateTitleMetrics;
- (void)appearStateDidChange;
- (void)didUpdate;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosBannerProviderInvalidateLoadedBanner:(id)a3;
- (void)referenceSizeDidChange;
- (void)setBannerProvider:(id)a3;
- (void)setBannerView:(id)a3;
- (void)setBannerViewSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setIsInSelectMode:(BOOL)a3;
- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setShouldHideBanner:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAttributes:(id)a3;
- (void)setTitleBaseFrame:(CGRect)a3;
- (void)update;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXPhotosKeyAssetSectionHeaderLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_bannerAppearanceAnimator, 0);
  objc_storeStrong((id *)&self->_keyAssetFetch, 0);
}

- (BOOL)shouldHideBanner
{
  return self->_shouldHideBanner;
}

- (CGSize)bannerViewSize
{
  double width = self->_bannerViewSize.width;
  double height = self->_bannerViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXPhotosBannerView)bannerView
{
  return self->_bannerView;
}

- (NSDictionary)titleAttributes
{
  return self->_titleAttributes;
}

- (CGRect)titleBaseFrame
{
  double x = self->_titleBaseFrame.origin.x;
  double y = self->_titleBaseFrame.origin.y;
  double width = self->_titleBaseFrame.size.width;
  double height = self->_titleBaseFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (PXPhotosBannerProvider)bannerProvider
{
  return self->_bannerProvider;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  long long v3 = *(_OWORD *)&self[32].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[32].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosLayoutSpec)spec
{
  return self->_spec;
}

- (void)setSelectionSnapshot:(id)a3
{
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->selectionSnapshot;
}

- (void)setIsInSelectMode:(BOOL)a3
{
  self->isInSelectMode = a3;
}

- (BOOL)isInSelectMode
{
  return self->isInSelectMode;
}

- (id)axSpriteIndexes
{
  if ([(PXGLayout *)self localNumberOfSprites]) {
    [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
  }
  else {
  v2 = [MEMORY[0x1E4F28D60] indexSet];
  }
  return v2;
}

- (void)photosBannerProviderInvalidateLoadedBanner:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosKeyAssetSectionHeaderLayout *)self bannerProvider];

  if (v5 == v4)
  {
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateBannerRequest];
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _loadBannerIfNecessary];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)BannerAppearanceAnimatorObservationContext != a5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXPhotosKeyAssetSectionHeaderLayout.m" lineNumber:538 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateAnimations];
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v5 = [(PXPhotosKeyAssetSectionHeaderLayout *)self bannerView];
  if (v5)
  {
    v6 = [PXGSingleViewUserData alloc];
    v7 = [(PXPhotosKeyAssetSectionHeaderLayout *)self bannerView];
    v8 = [(PXGSingleViewUserData *)v6 initWithContentView:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (Class)objc_opt_class();
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  if ([(PXDisplayAssetFetchResult *)self->_keyAssetFetch count] < 1) {
    keyAssetFetch = 0;
  }
  else {
    keyAssetFetch = self->_keyAssetFetch;
  }
  return keyAssetFetch;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 1;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (void)_bumpBannerVersion
{
  self->_bannerVersion = self->_bannerVersion
                       + 1
                       - 1000 * ((4294968 * (unint64_t)(self->_bannerVersion + 1)) >> 32);
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateContent];
}

- (void)_bumpAssetVersion
{
  self->_keyAssetVersion = self->_keyAssetVersion
                         + 1
                         - 1000 * ((4294968 * (unint64_t)(self->_keyAssetVersion + 1)) >> 32);
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateContent];
}

- (void)_bumpTitleVersion
{
  self->_titleVersion = self->_titleVersion
                      + 1
                      - 1000 * ((4294968 * (unint64_t)(self->_titleVersion + 1)) >> 32);
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateContent];
}

- (CGRect)_bestCropRectForAspectRatio:(double)a3
{
  id v4 = [(PXDisplayAssetFetchResult *)self->_keyAssetFetch firstObject];
  [v4 bestCropRectForAspectRatioV2:2 verticalContentMode:1 cropMode:a3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGSize)_keyAssetSize
{
  [(PXGLayout *)self contentSize];
  double v4 = v3;
  [(PXGLayout *)self contentSize];
  double v6 = v5 + -2.0;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (double)_floatOffset
{
  [(PXGLayout *)self visibleRect];
  return fmax(v2, 0.0);
}

- (void)_transitionToBannerView:(id)a3 version:(int64_t)a4
{
  id v13 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosKeyAssetSectionHeaderLayout.m", 434, @"%s must be called on the main thread", "-[PXPhotosKeyAssetSectionHeaderLayout _transitionToBannerView:version:]");
  }
  if (self->_desiredBannerRequestVersion == a4)
  {
    self->_currentBannerRequestVersion = a4;
    BOOL v7 = [(PXPhotosKeyAssetSectionHeaderLayout *)self shouldHideBanner];
    if (v13) {
      int v8 = v7;
    }
    else {
      int v8 = 1;
    }
    if (!self->_isDisplayingBanner && v8 == 0)
    {
      double v11 = &__block_literal_global_53;
      BOOL v10 = 1;
    }
    else
    {
      if (!self->_isDisplayingBanner) {
        int v8 = 0;
      }
      if (v8 != 1) {
        goto LABEL_17;
      }
      BOOL v10 = 0;
      double v11 = &__block_literal_global_55;
    }
    self->_isDisplayingBanner = v10;
    [(PXNumberAnimator *)self->_bannerAppearanceAnimator performChangesWithDuration:1 curve:v11 changes:0.2];
LABEL_17:
    [(PXPhotosKeyAssetSectionHeaderLayout *)self setBannerView:v13];
  }
}

uint64_t __71__PXPhotosKeyAssetSectionHeaderLayout__transitionToBannerView_version___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:0.0];
}

uint64_t __71__PXPhotosKeyAssetSectionHeaderLayout__transitionToBannerView_version___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:1.0];
}

- (void)_loadBannerIfNecessary
{
  if (self->_currentBannerRequestVersion != self->_desiredBannerRequestVersion
    && [(PXGLayout *)self appearState] == 1)
  {
    double v3 = [(PXPhotosKeyAssetSectionHeaderLayout *)self bannerProvider];
    if (v3)
    {
      objc_initWeak(&location, self);
      desiredBannerRequestVersion = (void *)self->_desiredBannerRequestVersion;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __61__PXPhotosKeyAssetSectionHeaderLayout__loadBannerIfNecessary__block_invoke;
      v5[3] = &unk_1E5DCD640;
      objc_copyWeak(v6, &location);
      v6[1] = desiredBannerRequestVersion;
      [v3 loadBannerView:v5];
      objc_destroyWeak(v6);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _transitionToBannerView:0 version:self->_desiredBannerRequestVersion];
    }
  }
}

void __61__PXPhotosKeyAssetSectionHeaderLayout__loadBannerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  double v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _transitionToBannerView:v4 version:*(void *)(a1 + 40)];
}

- (void)_invalidateBannerRequest
{
  self->_desiredBannerRequestVersion = (self->_desiredBannerRequestVersion + 1) % 1000;
}

- (void)_updateFloatParameters
{
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _floatOffset];
  double v4 = v3;
  double v5 = -v3;
  [(PXGLayout *)self contentSize];
  CGFloat v7 = v6;
  [(PXGLayout *)self contentSize];
  double v9 = v8 + -2.0;
  [(PXPhotosKeyAssetSectionHeaderLayout *)self titleBaseFrame];
  uint64_t v11 = v10;
  uint64_t v25 = v12;
  double v14 = v13;
  [(PXGLayout *)self contentSize];
  double v16 = v15 - v14 + -10.0 - v4;
  [(PXGLayout *)self safeAreaInsets];
  double v18 = v17 + 10.0;
  if (v16 >= v18) {
    double v19 = v16;
  }
  else {
    double v19 = v18;
  }
  [(PXPhotosKeyAssetSectionHeaderLayout *)self setShouldHideBanner:v16 != v19];
  [(PXPhotosKeyAssetSectionHeaderLayout *)self bannerViewSize];
  uint64_t v21 = v20;
  double v23 = v22;
  v27.origin.double x = 0.0;
  v27.origin.double y = v5;
  v27.size.double width = v7;
  v27.size.double height = v9;
  CGFloat MaxY = CGRectGetMaxY(v27);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__PXPhotosKeyAssetSectionHeaderLayout__updateFloatParameters__block_invoke;
  v26[3] = &__block_descriptor_128_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
  v26[4] = 0;
  *(double *)&v26[5] = v5;
  *(CGFloat *)&v26[6] = v7;
  *(double *)&v26[7] = v9;
  v26[8] = v11;
  *(double *)&v26[9] = v19;
  v26[10] = v25;
  *(double *)&v26[11] = v14;
  v26[12] = 0;
  *(double *)&v26[13] = MaxY - v23;
  v26[14] = v21;
  *(double *)&v26[15] = v23;
  [(PXGLayout *)self modifySpritesInRange:0x300000000 state:v26];
}

float32x2_t __61__PXPhotosKeyAssetSectionHeaderLayout__updateFloatParameters__block_invoke(double *a1, uint64_t a2, float32x2_t *a3)
{
  CGFloat v5 = a1[4];
  CGFloat v6 = a1[5];
  CGFloat v7 = a1[6];
  CGFloat v8 = a1[7];
  v39.origin.double x = v5;
  v39.origin.double y = v6;
  v39.size.double width = v7;
  v39.size.double height = v8;
  CGFloat MidX = CGRectGetMidX(v39);
  v40.origin.double x = v5;
  v40.origin.double y = v6;
  v40.size.double width = v7;
  v40.size.double height = v8;
  CGFloat MidY = CGRectGetMidY(v40);
  v41.origin.double x = v5;
  v41.origin.double y = v6;
  v41.size.double width = v7;
  v41.size.double height = v8;
  CGFloat Width = CGRectGetWidth(v41);
  v42.origin.double x = v5;
  v42.origin.double y = v6;
  v42.size.double width = v7;
  v42.size.double height = v8;
  CGFloat Height = CGRectGetHeight(v42);
  v12.f64[0] = Width;
  v12.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFF0000000000000;
  a3[3] = vcvt_f32_f64(v12);
  CGFloat v13 = a1[8];
  CGFloat v14 = a1[9];
  CGFloat v15 = a1[10];
  CGFloat v16 = a1[11];
  CGFloat v17 = v13;
  v12.f64[0] = v14;
  CGFloat v18 = v15;
  CGFloat v19 = v16;
  CGFloat v20 = CGRectGetMidX(*(CGRect *)((char *)&v12 - 8));
  v43.origin.double x = v13;
  v43.origin.double y = v14;
  v43.size.double width = v15;
  v43.size.double height = v16;
  CGFloat v21 = CGRectGetMidY(v43);
  v44.origin.double x = v13;
  v44.origin.double y = v14;
  v44.size.double width = v15;
  v44.size.double height = v16;
  CGFloat v37 = CGRectGetWidth(v44);
  v45.origin.double x = v13;
  v45.origin.double y = v14;
  v45.size.double width = v15;
  v45.size.double height = v16;
  CGFloat v22 = CGRectGetHeight(v45);
  v23.f64[0] = v37;
  v23.f64[1] = v22;
  *(CGFloat *)&a3[4] = v20;
  *(CGFloat *)&a3[5] = v21;
  a3[6] = (float32x2_t)0xBFF19999A0000000;
  a3[7] = vcvt_f32_f64(v23);
  CGFloat v24 = a1[12];
  CGFloat v25 = a1[13];
  CGFloat v26 = a1[14];
  CGFloat v27 = a1[15];
  CGFloat v28 = v24;
  v23.f64[0] = v25;
  CGFloat v29 = v26;
  CGFloat v30 = v27;
  CGFloat v31 = CGRectGetMidX(*(CGRect *)((char *)&v23 - 8));
  v46.origin.double x = v24;
  v46.origin.double y = v25;
  v46.size.double width = v26;
  v46.size.double height = v27;
  CGFloat v32 = CGRectGetMidY(v46);
  v47.origin.double x = v24;
  v47.origin.double y = v25;
  v47.size.double width = v26;
  v47.size.double height = v27;
  CGFloat v38 = CGRectGetWidth(v47);
  v48.origin.double x = v24;
  v48.origin.double y = v25;
  v48.size.double width = v26;
  v48.size.double height = v27;
  CGFloat v33 = CGRectGetHeight(v48);
  v34.f64[0] = v38;
  v34.f64[1] = v33;
  float32x2_t result = vcvt_f32_f64(v34);
  *(CGFloat *)&a3[8] = v31;
  *(CGFloat *)&a3[9] = v32;
  a3[10] = 0;
  a3[11] = result;
  return result;
}

- (void)_invalidateFloatParameters
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x400) != 0)
    {
      CGFloat v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout _invalidateFloatParameters]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 383, @"invalidating %lu after it already has been updated", 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 1024;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateAnimations
{
  [(PXNumberAnimator *)self->_bannerAppearanceAnimator presentationValue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PXPhotosKeyAssetSectionHeaderLayout__updateAnimations__block_invoke;
  v4[3] = &__block_descriptor_48_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
  *(double *)&v4[4] = 1.0 - v3;
  *(double *)&v4[5] = v3;
  [(PXGLayout *)self modifySpritesInRange:0x300000000 state:v4];
}

float __56__PXPhotosKeyAssetSectionHeaderLayout__updateAnimations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v4 = *(double *)(a1 + 40);
  float v5 = *(double *)(a1 + 32);
  *(float *)(a4 + 160) = v5;
  float result = v4;
  *(float *)(a4 + 320) = result;
  return result;
}

- (void)_invalidateAnimations
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      float v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout _invalidateAnimations]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 369, @"invalidating %lu after it already has been updated", 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 2048;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContent
{
  if ([(PXGLayout *)self localNumberOfSprites] != 3) {
    [(PXGLayout *)self applySpriteChangeDetails:0 countAfterChanges:3 initialState:&__block_literal_global_160579 modifyState:0];
  }
  [(PXGLayout *)self displayScale];
  uint64_t v22 = v3;
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _keyAssetSize];
  double v5 = v4;
  double v7 = v6;
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _bestCropRectForAspectRatio:v4 / v6];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  [(PXPhotosKeyAssetSectionHeaderLayout *)self titleBaseFrame];
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  [(PXPhotosKeyAssetSectionHeaderLayout *)self bannerViewSize];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__PXPhotosKeyAssetSectionHeaderLayout__updateContent__block_invoke_2;
  v23[3] = &unk_1E5DC0560;
  v23[5] = v9;
  v23[6] = v11;
  v23[7] = v13;
  v23[8] = v15;
  *(double *)&v23[9] = v5;
  *(double *)&v23[10] = v7;
  v23[4] = self;
  v23[11] = v22;
  v23[12] = v17;
  v23[13] = v19;
  v23[14] = v20;
  v23[15] = v21;
  [(PXGLayout *)self modifySpritesInRange:0x300000000 state:v23];
}

float32x2_t __53__PXPhotosKeyAssetSectionHeaderLayout__updateContent__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float32x2_t *a5)
{
  *(float32x4_t *)(a4 + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 40)), *(float64x2_t *)(a1 + 56));
  a5->i16[0] = 512;
  float v5 = *(double *)(a1 + 88);
  a5[1] = vmul_n_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 72)), v5);
  a5[4].i16[0] = *(_WORD *)(*(void *)(a1 + 32) + 904);
  a5[5].i16[0] = 768;
  float v6 = *(double *)(a1 + 88);
  a5[6] = vmul_n_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 96)), v6);
  a5[9].i16[0] = *(_WORD *)(*(void *)(a1 + 32) + 906);
  a5[10].i16[0] = 2561;
  float v7 = *(double *)(a1 + 88);
  float32x2_t result = vmul_n_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 112)), v7);
  a5[11] = result;
  a5[14].i16[0] = *(_WORD *)(*(void *)(a1 + 32) + 908);
  return result;
}

void __53__PXPhotosKeyAssetSectionHeaderLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (HIDWORD(a2) + a2);
  if (v3 > a2)
  {
    uint64_t v4 = v3 - a2;
    long long v5 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v6 = *((_OWORD *)off_1E5DAAF90 + 7);
    uint64_t v7 = 160 * a2;
    long long v8 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v9 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v10 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v11 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v12 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v13 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v14 = *(_OWORD *)off_1E5DAAF90;
    long long v15 = *((_OWORD *)off_1E5DAAF90 + 1);
    do
    {
      uint64_t v16 = (_OWORD *)(*(void *)(a3 + 24) + v7);
      v16[6] = v5;
      v16[7] = v6;
      v16[8] = v8;
      v16[9] = v9;
      v16[2] = v10;
      v16[3] = v11;
      v16[4] = v12;
      v16[5] = v13;
      *uint64_t v16 = v14;
      v16[1] = v15;
      v7 += 160;
      --v4;
    }
    while (v4);
  }
}

- (void)_invalidateContent
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 329, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setBannerViewSize:(CGSize)a3
{
  if (self->_bannerViewSize.width != a3.width || self->_bannerViewSize.height != a3.height)
  {
    self->_bannerViewSize = a3;
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateContent];
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateFloatParameters];
  }
}

- (void)_updateBannerView
{
  id v4 = [(PXPhotosKeyAssetSectionHeaderLayout *)self bannerView];
  uint64_t v3 = [(PXPhotosKeyAssetSectionHeaderLayout *)self spec];
  [v4 setSpec:v3];

  [(PXGLayout *)self referenceSize];
  objc_msgSend(v4, "sizeThatFits:");
  -[PXPhotosKeyAssetSectionHeaderLayout setBannerViewSize:](self, "setBannerViewSize:");
}

- (void)_invalidateBannerView
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout _invalidateBannerView]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 309, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 16;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateTitleMetrics
{
  v25[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXPhotosKeyAssetSectionHeaderLayout *)self spec];
  id v4 = [v3 headerTitleFont];
  [v4 lineHeight];
  double v6 = v5;
  [v4 leading];
  double v8 = v6 + v7;
  [v3 headerTitleLeadingSpacing];
  double v10 = v9;
  [v3 headerTitleButtonAlignmentSpacing];
  double v12 = v10 + v11;
  [(PXGLayout *)self referenceSize];
  double v14 = v13 + v12 * -2.0;
  uint64_t v15 = *MEMORY[0x1E4FB06F8];
  v25[0] = v4;
  uint64_t v16 = *MEMORY[0x1E4FB0700];
  v24[0] = v15;
  v24[1] = v16;
  uint64_t v17 = [v3 headerTitleOverContentColor];
  v25[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

  [(PXPhotosKeyAssetSectionHeaderLayout *)self setTitleAttributes:v18];
  uint64_t v19 = [(PXPhotosKeyAssetSectionHeaderLayout *)self title];
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 35, v18, 0, v14, v8 * 1.1);
  double v21 = v20;
  double v23 = v22;

  -[PXPhotosKeyAssetSectionHeaderLayout setTitleBaseFrame:](self, "setTitleBaseFrame:", v12, 0.0, v21, v23);
}

- (void)_invalidateTitleMetrics
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout _invalidateTitleMetrics]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 282, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateTitle
{
  uint64_t v3 = [(PXPhotosKeyAssetSectionHeaderLayout *)self viewModel];
  id v8 = [v3 title];

  id v4 = [(PXPhotosKeyAssetSectionHeaderLayout *)self dataSource];
  double v5 = [v4 containerCollection];

  double v6 = [v5 localizedTitle];
  if (v8) {
    id v7 = v8;
  }
  else {
    id v7 = v6;
  }
  [(PXPhotosKeyAssetSectionHeaderLayout *)self setTitle:v7];
}

- (void)_invalidateTitle
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout _invalidateTitle]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 270, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContentSize
{
  [(PXGLayout *)self referenceSize];
  [(PXGLayout *)self referenceSize];
  [(PXGLayout *)self referenceSize];
  -[PXGLayout setContentSize:](self, "setContentSize:");
}

- (void)_invalidateContentSize
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout _invalidateContentSize]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 259, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateKeyAssetFetch
{
  uint64_t v3 = [(PXDisplayAssetFetchResult *)self->_keyAssetFetch firstObject];
  id v4 = [(PXPhotosKeyAssetSectionHeaderLayout *)self dataSource];
  [(PXPhotosKeyAssetSectionHeaderLayout *)self sectionIndexPath];
  double v5 = [v4 keyAssetsInSectionIndexPath:&v13];
  keyAssetFetch = self->_keyAssetFetch;
  self->_keyAssetFetch = v5;

  id v7 = [(PXDisplayAssetFetchResult *)self->_keyAssetFetch firstObject];
  id v8 = v3;
  double v9 = v8;
  if (v7 == v8)
  {
  }
  else
  {
    if (v8) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {

LABEL_12:
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _bumpAssetVersion];
      goto LABEL_13;
    }
    uint64_t v11 = [v7 isContentEqualTo:v8];
    uint64_t v12 = v11;
    if (!v11) {
      uint64_t v12 = [v9 isContentEqualTo:v7];
    }

    if (v12 != 2) {
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)_invalidateKeyAssetFetch
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout _invalidateKeyAssetFetch]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 246, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)appearStateDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  [(PXGLayout *)&v3 appearStateDidChange];
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _loadBannerIfNecessary];
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateFloatParameters];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateContentSize];
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateTitleMetrics];
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateBannerView];
  [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateFloatParameters];
}

- (void)didUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  [(PXGLayout *)&v7 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_super v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXPhotosKeyAssetSectionHeaderLayout.m", 221, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 222, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)willUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  [(PXGLayout *)&v7 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_super v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXPhotosKeyAssetSectionHeaderLayout.m", 215, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_postUpdateFlags.BOOL willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXPhotosKeyAssetSectionHeaderLayout.m", 216, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      double v14 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXPhotosKeyAssetSectionHeaderLayout.m", 182, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateKeyAssetFetch];
      if (!p_updateFlags->isPerformingUpdate)
      {
        CGFloat v33 = [MEMORY[0x1E4F28B00] currentHandler];
        float64x2_t v34 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
        [v33 handleFailureInFunction:v34, @"PXPhotosKeyAssetSectionHeaderLayout.m", 186, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateContentSize];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXPhotosKeyAssetSectionHeaderLayout.m", 189, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateTitle];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      [v17 handleFailureInFunction:v18, @"PXPhotosKeyAssetSectionHeaderLayout.m", 192, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateTitleMetrics];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      double v20 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      [v19 handleFailureInFunction:v20, @"PXPhotosKeyAssetSectionHeaderLayout.m", 195, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateBannerView];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v21 = [MEMORY[0x1E4F28B00] currentHandler];
      double v22 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      [v21 handleFailureInFunction:v22, @"PXPhotosKeyAssetSectionHeaderLayout.m", 198, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v9 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateContent];
      unint64_t v9 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v9)
    {
      double v23 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v24 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"PXPhotosKeyAssetSectionHeaderLayout.m", 201, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  [(PXGLayout *)&v35 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  if (self->_postUpdateFlags.needsUpdate)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      CGFloat v25 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v26 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      [v25 handleFailureInFunction:v26, @"PXPhotosKeyAssetSectionHeaderLayout.m", 203, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0;
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = -1;
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      CGFloat v27 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v28 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      [v27 handleFailureInFunction:v28, @"PXPhotosKeyAssetSectionHeaderLayout.m", 204, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v11 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x400uLL;
    if ((v11 & 0x400) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFBFFLL;
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateFloatParameters];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      CGFloat v29 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v30 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      [v29 handleFailureInFunction:v30, @"PXPhotosKeyAssetSectionHeaderLayout.m", 207, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v12 & 0x800) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFF7FFLL;
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateAnimations];
      unint64_t v12 = p_postUpdateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    p_updateFlags->updated = 0;
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v12)
    {
      CGFloat v31 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v32 = [NSString stringWithUTF8String:"-[PXPhotosKeyAssetSectionHeaderLayout update]"];
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"PXPhotosKeyAssetSectionHeaderLayout.m", 210, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
}

- (void)setShouldHideBanner:(BOOL)a3
{
  if (self->_shouldHideBanner != a3)
  {
    self->_shouldHideBanner = a3;
    id v4 = [(PXPhotosKeyAssetSectionHeaderLayout *)self bannerView];
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _transitionToBannerView:v4 version:self->_currentBannerRequestVersion];
  }
}

- (void)setBannerView:(id)a3
{
  unint64_t v5 = (PXPhotosBannerView *)a3;
  if (self->_bannerView != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->_bannerView, a3);
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateBannerView];
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _bumpBannerVersion];
    unint64_t v5 = v6;
  }
}

- (void)setBannerProvider:(id)a3
{
  unint64_t v5 = (PXPhotosBannerProvider *)a3;
  if (self->_bannerProvider != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->_bannerProvider, a3);
    [(PXPhotosBannerProvider *)self->_bannerProvider setInvalidationDelegate:self];
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateBannerRequest];
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _loadBannerIfNecessary];
    unint64_t v5 = v6;
  }
}

- (void)setSpec:(id)a3
{
  unint64_t v5 = (PXPhotosLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateTitleMetrics];
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateBannerView];
    unint64_t v5 = v6;
  }
}

- (void)setTitleAttributes:(id)a3
{
  unint64_t v8 = (NSDictionary *)a3;
  id v4 = self->_titleAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      unint64_t v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      titleAttributes = self->_titleAttributes;
      self->_titleAttributes = v6;

      [(PXPhotosKeyAssetSectionHeaderLayout *)self _bumpTitleVersion];
    }
  }
}

- (void)setTitleBaseFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_titleBaseFrame = &self->_titleBaseFrame;
  if (!CGRectEqualToRect(a3, self->_titleBaseFrame))
  {
    p_titleBaseFrame->origin.CGFloat x = x;
    p_titleBaseFrame->origin.CGFloat y = y;
    p_titleBaseFrame->size.CGFloat width = width;
    p_titleBaseFrame->size.CGFloat height = height;
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateContent];
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _updateFloatParameters];
  }
}

- (void)setTitle:(id)a3
{
  unint64_t v8 = (NSString *)a3;
  id v4 = self->_title;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      unint64_t v6 = (NSString *)[(NSString *)v8 copy];
      title = self->_title;
      self->_title = v6;

      [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateTitleMetrics];
      [(PXPhotosKeyAssetSectionHeaderLayout *)self _bumpTitleVersion];
    }
  }
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->_sectionIndexPath.dataSourceIdentifier, *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->_sectionIndexPath.item, *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    long long v3 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_sectionIndexPath.item = v3;
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateKeyAssetFetch];
  }
}

- (void)setDataSource:(id)a3
{
  char v5 = (PXAssetsDataSource *)a3;
  if (self->_dataSource != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->_dataSource, a3);
    [(PXPhotosKeyAssetSectionHeaderLayout *)self _invalidateKeyAssetFetch];
    char v5 = v6;
  }
}

- (PXPhotosKeyAssetSectionHeaderLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  unint64_t v6 = [(PXGLayout *)&v12 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)&v7->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&v7->_sectionIndexPath.item = v8;
    uint64_t v9 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    bannerAppearanceAnimator = v7->_bannerAppearanceAnimator;
    v7->_bannerAppearanceAnimator = (PXNumberAnimator *)v9;

    [(PXNumberAnimator *)v7->_bannerAppearanceAnimator registerChangeObserver:v7 context:BannerAppearanceAnimatorObservationContext];
    [(PXPhotosKeyAssetSectionHeaderLayout *)v7 _invalidateKeyAssetFetch];
    [(PXPhotosKeyAssetSectionHeaderLayout *)v7 _invalidateContentSize];
    [(PXPhotosKeyAssetSectionHeaderLayout *)v7 _invalidateTitle];
    [(PXPhotosKeyAssetSectionHeaderLayout *)v7 _invalidateTitleMetrics];
    [(PXPhotosKeyAssetSectionHeaderLayout *)v7 _invalidateBannerView];
    [(PXPhotosKeyAssetSectionHeaderLayout *)v7 _invalidateContent];
    [(PXPhotosKeyAssetSectionHeaderLayout *)v7 _invalidateFloatParameters];
    [(PXPhotosKeyAssetSectionHeaderLayout *)v7 _invalidateAnimations];
    [(PXGLayout *)v7 setContentSource:v7];
  }

  return v7;
}

@end