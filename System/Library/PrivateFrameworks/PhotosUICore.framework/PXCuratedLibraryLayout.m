@interface PXCuratedLibraryLayout
- (BOOL)allowsDanglingUpdatesAssertions;
- (BOOL)allowsSublayoutUpdateCycleAssertions;
- (BOOL)canHandleVisibleRectRejection;
- (BOOL)curatedLibrarySummaryHelperShouldUpdateImmediately:(id)a3;
- (CGPoint)_adjustInitialVisibleRect:(CGRect)a3 inLayout:(id)a4 forRecentSection:(int64_t)a5;
- (CGPoint)anchor:(id)a3 visibleRectOriginForProposedVisibleRect:(CGRect)a4 forLayout:(id)a5;
- (CGRect)fullyVisibleRect;
- (CGRect)presentedVisibleRect;
- (CGRect)sectionBoundariesForAssetCollectionReference:(id)a3;
- (PXAssetCollectionReference)lastPresentedDayAssetCollectionReference;
- (PXBrowserVisibleContentSnapshot)visibleContentSnapshot;
- (PXCuratedLibraryLayout)initWithViewModel:(id)a3;
- (PXCuratedLibraryLayoutSpec)spec;
- (PXCuratedLibrarySectionHeaderLayout)floatingHeaderLayout;
- (PXCuratedLibrarySectionedLayout)libraryBodyLayout;
- (PXCuratedLibraryViewModel)viewModel;
- (PXGSpriteReference)lastHitSpriteReference;
- (PXLibraryFilterState)libraryFilterState;
- (PXSectionedObjectReference)dominantObjectReference;
- (PXZoomablePhotosLayout)allPhotosLayout;
- (double)_adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop:(double)a3;
- (double)_adjustedTargetVisibleTopToAccomodateFromBottomPaddedAreaVisibility:(BOOL)a3 proposedVisibleRect:(CGRect)a4;
- (double)adjustedTargetVisibleTopForProposedTargetVisibleTop:(double)a3 scrollingVelocity:(double)a4 decelerationRate:(int64_t *)a5;
- (double)bottomMargin;
- (double)estimatedHeaderHeight;
- (double)lateralMargin;
- (id)_createAnchorForTransitionToZoomLevel:(int64_t)a3;
- (id)_currentFloatingHeaderSpec;
- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3;
- (id)assetsIteratorForContentInRect:(CGRect)a3;
- (id)axLocalizedLabel;
- (id)axSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)createAnchorForScrollingToInitialPosition;
- (id)createCuratedLibraryLayoutAnimationIfNeededWithContext:(int64_t)a3 userData:(id)a4;
- (id)createCuratedLibraryLayoutTransitionIfNeededWithContext:(int64_t)a3;
- (id)createDefaultAnimationForCurrentContext;
- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4;
- (id)dominantHeroPreferencesBeforeTransition;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)lastVisibleAreaAnchor;
- (id)lastVisibleDominantObjectReference;
- (id)locationNamesFutureForContentInRect:(CGRect)a3;
- (id)offscreenEffectForCapturedSnapshotAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)presentedItemsGeometryForDataSource:(id)a3;
- (id)topMostAssetCollectionInRect:(CGRect)a3 ignoreChapterHeaders:(BOOL)a4;
- (id)topMostAssetCollectionReference;
- (id)viewModel:(id)a3 dominantAssetCollectionReferenceForZoomLevel:(int64_t)a4;
- (int64_t)_statusBarVisibility;
- (int64_t)curatedLibraryLayoutAnimationContextForTransitionToZoomLevel:(int64_t)a3;
- (int64_t)presentedZoomLevel;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (int64_t)viewModel:(id)a3 transitionTypeFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5;
- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)_invalidateBlurredBackground;
- (void)_invalidateBlurredBackgroundOpacity;
- (void)_invalidateBlurredBackgroundSnapshot;
- (void)_invalidateContentBackground;
- (void)_invalidateContentBackgroundMediaVersion;
- (void)_invalidateSummaryHelper;
- (void)_noteAnimation:(id)a3 isRunning:(BOOL)a4;
- (void)_updateAllPhotosOverlayInsets;
- (void)_updateBlurredBackground;
- (void)_updateBlurredBackgroundOpacity;
- (void)_updateContentBackground;
- (void)_updateFloatingHeaderAppearance;
- (void)_updateFloatingHeaderButtons;
- (void)_updateFloatingHeaderLayoutSpec;
- (void)_updateFloatingHeaderSelectionTitle;
- (void)_updateFloatingHeaderVisibility;
- (void)_updateLateralMargin;
- (void)_updateLibraryBodyLayoutLastVisibleDominantObjectReference;
- (void)_updateLibraryBodyLayoutLateralMargin;
- (void)_updateLocalSprites;
- (void)_updateSpecValue;
- (void)_updateStatusBarGradientAlphaValue;
- (void)_updateStatusBarGradientVisibility;
- (void)_updateStatusBarStyle;
- (void)_updateZoomLevel;
- (void)animationDidComplete:(id)a3;
- (void)clearLastVisibleAreaAnchoringInformation;
- (void)contentSizeDidChange;
- (void)dealloc;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)entityManagerDidChange;
- (void)enumerateScrollablePagesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateSectionBoundariesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateVisibleAssetReferencesUsingBlock:(id)a3;
- (void)enumerateVisibleAssetsSectionSublayoutsUsingBlock:(id)a3;
- (void)invalidateFloatingHeaderButtons;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)safeAreaInsetsDidChange;
- (void)setCanHandleVisibleRectRejection:(BOOL)a3;
- (void)setDominantHeroPreferencesBeforeTransition:(id)a3;
- (void)setLastHitSpriteReference:(id)a3;
- (void)setLastPresentedDayAssetCollectionReference:(id)a3;
- (void)setLastVisibleDominantObjectReference:(id)a3;
- (void)setLateralMargin:(double)a3;
- (void)setLibraryFilterState:(id)a3;
- (void)setSpec:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)sublayoutDidChangeLastBaseline:(id)a3;
- (void)update;
- (void)viewEnvironmentWillChange:(id)a3;
- (void)viewModel:(id)a3 didTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5;
- (void)viewModel:(id)a3 willTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXCuratedLibraryLayout

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_statusBarGradientSpriteIndex != a3)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryLayout.m" lineNumber:1869 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  v9 = [(PXCuratedLibraryLayout *)self spec];
  v10 = [v9 statusBarGradientImageConfiguration];

  return v10;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_contentBackgroundSpriteIndex == a3)
  {
    v8 = [(PXCuratedLibraryLayout *)self viewModel];
    v9 = [v8 specManager];
    v10 = [v9 spec];
    v11 = [v10 contentBackgroundColor];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [MEMORY[0x1E4FB1618] clearColor];
    }
    v14 = v13;
  }
  else
  {
    if (self->_blurredBackgroundSpriteIndex != a3)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryLayout.m" lineNumber:1891 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v14 = [MEMORY[0x1E4FB1618] blueColor];
  }

  return v14;
}

void __32__PXCuratedLibraryLayout_update__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsResetting:0];
  [v2 setIsNavigating:0];
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (BOOL)curatedLibrarySummaryHelperShouldUpdateImmediately:(id)a3
{
  return 0;
}

- (PXBrowserVisibleContentSnapshot)visibleContentSnapshot
{
  id v2 = [[PXCuratedLibraryVisibleContentSnapshot alloc] initWithLibraryLayout:self dateType:0];
  return (PXBrowserVisibleContentSnapshot *)v2;
}

- (void)_updateFloatingHeaderLayoutSpec
{
  v3 = [(PXCuratedLibraryLayout *)self _currentFloatingHeaderSpec];
  [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setSpec:v3];

  [(PXCuratedLibraryLayout *)self lateralMargin];
  floatingHeaderLayout = self->_floatingHeaderLayout;
  -[PXCuratedLibrarySectionHeaderLayout setLateralMargin:](floatingHeaderLayout, "setLateralMargin:");
}

- (double)lateralMargin
{
  return self->_lateralMargin;
}

void __79__PXCuratedLibraryLayout_PXCuratedLibraryEventTracker__dominantObjectReference__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) objectReferenceForSpriteIndex:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (void)_updateAllPhotosOverlayInsets
{
  double v3 = *((double *)off_1E5DAAF10 + 1);
  double v4 = *((double *)off_1E5DAAF10 + 2);
  double v5 = *((double *)off_1E5DAAF10 + 3);
  uint64_t v6 = [(PXGSplitLayout *)self firstSublayout];
  [v6 lastBaseline];
  double v8 = v7;
  v9 = [(PXCuratedLibraryLayout *)self spec];
  [v9 spacingBetweenHeaderLastBaselineAndAllPhotosTop];
  double v11 = v8 + v10;

  v12 = [(PXCuratedLibraryLayout *)self allPhotosLayout];
  objc_msgSend(v12, "setOverlayInsets:", v11, v3, v4, v5);

  id v26 = [(PXCuratedLibraryLayout *)self floatingHeaderLayout];
  id v13 = [v26 leadingButtonsLayoutGuide];
  [v13 rectInLayout:v26];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v22 = [(PXCuratedLibraryLayout *)self spec];
  v23 = [v22 inlineHeaderOverlayTopInsetOverride];
  if (v23)
  {
    v24 = [(PXCuratedLibraryLayout *)self spec];
    v25 = [v24 inlineHeaderOverlayTopInsetOverride];
    [v25 doubleValue];
  }
  else
  {
    v27.origin.x = v15;
    v27.origin.y = v17;
    v27.size.width = v19;
    v27.size.height = v21;
    CGRectGetMaxY(v27);
  }

  PXEdgeInsetsMake();
}

- (PXCuratedLibrarySectionHeaderLayout)floatingHeaderLayout
{
  return self->_floatingHeaderLayout;
}

- (void)clearLastVisibleAreaAnchoringInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGLayout *)&v5 clearLastVisibleAreaAnchoringInformation];
  [(NSMutableDictionary *)self->_lastVisibleAreaAnchorsByZoomLevels removeAllObjects];
  [(NSMutableDictionary *)self->_preferredVisibleAreaAnchorsByZoomLevels removeAllObjects];
  [(PXCuratedLibraryLayout *)self setLastVisibleDominantObjectReference:0];
  double v3 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  [v3 clearLastVisibleAreaAnchoringInformation];

  double v4 = [(PXCuratedLibraryLayout *)self allPhotosLayout];
  [v4 clearLastVisibleAreaAnchoringInformation];
}

- (PXCuratedLibrarySectionedLayout)libraryBodyLayout
{
  return self->_libraryBodyLayout;
}

- (PXZoomablePhotosLayout)allPhotosLayout
{
  return self->_allPhotosBodyLayout;
}

- (void)setLastVisibleDominantObjectReference:(id)a3
{
  objc_storeStrong(&self->_lastVisibleDominantObjectReference, a3);
  [(PXCuratedLibraryLayout *)self _updateLibraryBodyLayoutLastVisibleDominantObjectReference];
}

- (void)_updateLibraryBodyLayoutLastVisibleDominantObjectReference
{
  id v4 = [(PXCuratedLibraryLayout *)self lastVisibleDominantObjectReference];
  double v3 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  [v3 setLastVisibleDominantObjectReference:v4];
}

- (id)lastVisibleDominantObjectReference
{
  return self->_lastVisibleDominantObjectReference;
}

- (void)willUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGSplitLayout *)&v7 willUpdate];
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXCuratedLibraryLayout.m", 219, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXCuratedLibraryLayout.m", 220, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)viewEnvironmentWillChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryLayout;
  id v4 = a3;
  [(PXGLayout *)&v8 viewEnvironmentWillChange:v4];
  objc_super v5 = [(PXGLayout *)self viewEnvironment];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PXCuratedLibraryLayout *)self _invalidateContentBackgroundMediaVersion];
  }
}

- (void)_invalidateContentBackgroundMediaVersion
{
}

- (int64_t)_statusBarVisibility
{
  double v3 = [(PXCuratedLibraryLayout *)self viewModel];
  id v4 = [v3 zoomablePhotosViewModel];
  objc_super v5 = [v3 specManager];
  uint64_t v6 = [v5 spec];

  uint64_t v7 = [v6 layoutOrientation];
  uint64_t v8 = [v6 sizeClass];
  [(PXGLayout *)self safeAreaInsets];
  double v10 = v9;
  [(PXGLayout *)self visibleRect];
  double v12 = v11;
  int64_t v13 = [(PXCuratedLibraryLayout *)self presentedZoomLevel];
  BOOL v16 = (v7 != 2 || v8 != 1) && (unint64_t)(v13 - 1) < 2;
  if (v16 && v12 > -v10) {
    int64_t v17 = 5;
  }
  else {
    int64_t v17 = 6;
  }
  if (v16 && v12 > -v10 || !v16)
  {
    if (v13 == 4)
    {
      if ([v4 wantsOverBackgroundFloatingHeaderAppearance])
      {
        if (v4)
        {
          [v4 zoomState];
          if (v19 >= 1.0) {
            v17 |= 8uLL;
          }
        }
      }
    }
  }
  else if (v12 <= -v10)
  {
    int64_t v17 = 10;
  }
  else
  {
    int64_t v17 = 6;
  }

  return v17;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (id)lastVisibleAreaAnchor
{
  preferredVisibleAreaAnchorsByZoomLevels = self->_preferredVisibleAreaAnchorsByZoomLevels;
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXCuratedLibraryLayout presentedZoomLevel](self, "presentedZoomLevel"));
  objc_super v5 = [(NSMutableDictionary *)preferredVisibleAreaAnchorsByZoomLevels objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXCuratedLibraryLayout;
    id v7 = [(PXGLayout *)&v10 lastVisibleAreaAnchor];
  }
  uint64_t v8 = v7;

  return v8;
}

- (int64_t)presentedZoomLevel
{
  return self->_presentedZoomLevel;
}

uint64_t __47__PXCuratedLibraryLayout__updateStatusBarStyle__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsDarkStatusBar:*(unsigned char *)(a1 + 32) == 0];
}

void __50__PXCuratedLibraryLayout__updateContentBackground__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v5 = *(float32x2_t **)(a3 + 16);
  CGFloat v6 = *(double *)(a1 + 40);
  CGFloat v7 = *(double *)(a1 + 48);
  CGFloat v8 = *(double *)(a1 + 56);
  CGFloat v9 = *(double *)(a1 + 64);
  v21.origin.x = v6;
  v21.origin.y = v7;
  v21.size.width = v8;
  v21.size.height = v9;
  CGFloat MidX = CGRectGetMidX(v21);
  v22.origin.x = v6;
  v22.origin.y = v7;
  v22.size.width = v8;
  v22.size.height = v9;
  CGFloat MidY = CGRectGetMidY(v22);
  v23.origin.x = v6;
  v23.origin.y = v7;
  v23.size.width = v8;
  v23.size.height = v9;
  CGFloat Width = CGRectGetWidth(v23);
  v24.origin.x = v6;
  v24.origin.y = v7;
  v24.size.width = v8;
  v24.size.height = v9;
  CGFloat Height = CGRectGetHeight(v24);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)objc_super v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = (float32x2_t)0x406A400000000000;
  v5[3] = vcvt_f32_f64(v13);
  *(float *)&CGFloat Height = *(double *)(a1 + 72);
  **(_DWORD **)(a3 + 24) = LODWORD(Height);
  uint64_t v14 = *(void *)(a3 + 32);
  *(unsigned char *)(v14 + 1) = 5;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)(v14 + 8) = _D0;
  *(_WORD *)(*(void *)(a3 + 32) + 32) = *(_WORD *)(*(void *)(a1 + 32) + 1180);
  PXGSectionedSpriteTagMake();
}

void __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 blurredBackgroundInitialOpacityForZoomLevel:v3];
  objc_msgSend(v4, "setValue:");
}

void __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke(uint64_t a1, uint64_t a2, float32x2_t *a3, uint64_t a4, float32x2_t *a5)
{
  CGFloat v9 = *(double *)(a1 + 40);
  CGFloat v10 = *(double *)(a1 + 48);
  CGFloat v11 = *(double *)(a1 + 56);
  CGFloat v12 = *(double *)(a1 + 64);
  v18.origin.x = v9;
  v18.origin.y = v10;
  v18.size.width = v11;
  v18.size.height = v12;
  CGFloat MidX = CGRectGetMidX(v18);
  v19.origin.x = v9;
  v19.origin.y = v10;
  v19.size.width = v11;
  v19.size.height = v12;
  CGFloat MidY = CGRectGetMidY(v19);
  v20.origin.x = v9;
  v20.origin.y = v10;
  v20.size.width = v11;
  v20.size.height = v12;
  CGFloat Width = CGRectGetWidth(v20);
  v21.origin.x = v9;
  v21.origin.y = v10;
  v21.size.width = v11;
  v21.size.height = v12;
  CGFloat Height = CGRectGetHeight(v21);
  v16.f64[0] = Width;
  v16.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFF8000000000000;
  a3[3] = vcvt_f32_f64(v16);
  *(_WORD *)(a4 + 68) = *(_WORD *)(*(void *)(a1 + 32) + 1120);
  a5->i8[1] = 1;
  a5[1] = vmul_n_f32(a3[3], *(float *)(a1 + 72));
  PXGSectionedSpriteTagMake();
}

float __60__PXCuratedLibraryLayout__updateStatusBarGradientAlphaValue__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  [*(id *)(*(void *)(a1 + 32) + 1104) presentationValue];
  float result = v5;
  *a4 = result;
  return result;
}

void __45__PXCuratedLibraryLayout__updateLocalSprites__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (HIDWORD(a2))
  {
    uint64_t v3 = 0;
    long long v4 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v5 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v6 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v7 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v8 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v9 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v10 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v11 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v12 = *(_OWORD *)off_1E5DAAF90;
    long long v13 = *((_OWORD *)off_1E5DAAF90 + 1);
    do
    {
      uint64_t v14 = (_OWORD *)(*(void *)(a3 + 24) + v3);
      v14[6] = v4;
      v14[7] = v5;
      v14[8] = v6;
      v14[9] = v7;
      v14[2] = v8;
      v14[3] = v9;
      v14[4] = v10;
      v14[5] = v11;
      _OWORD *v14 = v12;
      v14[1] = v13;
      v3 += 160;
    }
    while (160 * HIDWORD(a2) != v3);
  }
}

- (void)entityManagerDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGLayout *)&v3 entityManagerDidChange];
  [(PXCuratedLibraryLayout *)self _invalidateBlurredBackground];
}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  return 0;
}

- (void)didUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGSplitLayout *)&v7 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_super v3 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v4 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXCuratedLibraryLayout.m", 323, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v6 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXCuratedLibraryLayout.m", 324, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v9 = [(PXCuratedLibraryLayout *)self _currentBodyLayout];
  if (v9)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v9, x, y, width, height);
    if (!CGRectIsNull(v13)) {
      PXPointIsNull();
    }
  }
  long long v10 = (void *)[&__block_literal_global_335 copy];

  return v10;
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v8 = [(PXCuratedLibraryLayout *)self _currentBodyLayout];
  if (v8)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v8, x, y, width, height);
    if (!CGRectIsNull(v12)) {
      PXPointIsNull();
    }
  }
  long long v9 = (void *)[&__block_literal_global_338 copy];

  return v9;
}

uint64_t __44__PXCuratedLibraryLayout_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addPresenter:*(void *)(a1 + 32)];
}

- (void)sublayoutDidChangeLastBaseline:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGSplitLayout *)&v12 sublayoutDidChangeLastBaseline:v4];
  id v5 = [(PXGSplitLayout *)self firstSublayout];
  if (v5 != v4)
  {

    goto LABEL_12;
  }
  int64_t v6 = [(PXCuratedLibraryLayout *)self presentedZoomLevel];

  if (v6 != 4) {
    goto LABEL_12;
  }
  if (self->_isPerformingUpdate)
  {
    [(PXCuratedLibraryLayout *)self _updateAllPhotosOverlayInsets];
    goto LABEL_12;
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_11:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40;
      goto LABEL_12;
    }
LABEL_10:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v11 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout sublayoutDidChangeLastBaseline:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXCuratedLibraryLayout.m", 424, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    goto LABEL_11;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_10;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 64;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_12:
}

- (void)_updateFloatingHeaderVisibility
{
  id v32 = [(PXCuratedLibraryLayout *)self viewModel];
  uint64_t v4 = [v32 zoomLevel];
  uint64_t v5 = v4;
  if ((unint64_t)(v4 - 1) < 2)
  {
    objc_super v7 = [v32 sharedLibraryStatusProvider];
    if ([v7 hasSharedLibraryOrPreview])
    {
      BOOL v6 = 1;
    }
    else
    {
      long long v9 = [v32 specManager];
      long long v10 = [v9 spec];
      BOOL v6 = [v10 userInterfaceIdiom] == 2;
    }
    goto LABEL_10;
  }
  if ((unint64_t)(v4 - 3) < 2)
  {
    BOOL v6 = 1;
LABEL_10:
    long long v8 = v32;
    goto LABEL_11;
  }
  long long v8 = v32;
  if (!v5)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryLayout.m" lineNumber:435 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  BOOL v6 = 0;
LABEL_11:
  long long v11 = [v8 specManager];
  objc_super v12 = [v11 spec];
  uint64_t v13 = [v12 userInterfaceIdiom];

  BOOL v14 = v5 == 4;
  if (v13 != 5) {
    BOOL v14 = v6;
  }
  if (v14)
  {
    CGFloat v15 = [v32 configuration];
    int v16 = [v15 enableNavigationHeader];
  }
  else
  {
    int v16 = 0;
  }
  uint64_t v17 = [v32 librarySummaryPresenter];
  CGRect v18 = (PXCuratedLibrarySectionHeaderLayout *)v17;
  if (((v16 & 1) != 0 || v17) && !self->_summaryHelper)
  {
    CGRect v19 = objc_alloc_init(PXCuratedLibrarySummaryHelper);
    summaryHelper = self->_summaryHelper;
    self->_summaryHelper = v19;

    [(PXCuratedLibrarySummaryHelper *)self->_summaryHelper setShouldUseAbbreviatedDates:1];
    [(PXCuratedLibrarySummaryHelper *)self->_summaryHelper setDataSource:self];
  }
  floatingHeaderLayout = self->_floatingHeaderLayout;
  if (v16)
  {
    if (!floatingHeaderLayout)
    {
      CGRect v22 = objc_alloc_init(PXCuratedLibrarySectionHeaderLayout);
      CGRect v23 = self->_floatingHeaderLayout;
      self->_floatingHeaderLayout = v22;

      [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setSafeAreaBehavior:2];
      CGRect v24 = [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout leadingButtonsLayoutGuide];
      [v24 registerChangeObserver:self context:PXCuratedLibraryFloatingHeaderLeadingButtonsGuideObserverContext];

      [(PXCuratedLibraryLayout *)self _updateFloatingHeaderButtons];
      [(PXGSplitLayout *)self setFirstSublayout:self->_floatingHeaderLayout];
      floatingHeaderLayout = self->_floatingHeaderLayout;
    }
    v25 = [(PXGLayout *)floatingHeaderLayout axGroup];
    [v25 setAxRole:4 * (v5 == 4)];

    [(PXCuratedLibraryLayout *)self _updateFloatingHeaderAppearance];
  }
  else if (floatingHeaderLayout)
  {
    [(PXGSplitLayout *)self setFirstSublayout:0];
    id v26 = [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout leadingButtonsLayoutGuide];
    [v26 unregisterChangeObserver:self context:PXCuratedLibraryFloatingHeaderLeadingButtonsGuideObserverContext];

    CGRect v27 = self->_floatingHeaderLayout;
    self->_floatingHeaderLayout = 0;
  }
  v28 = [(PXCuratedLibraryLayout *)self _currentFloatingHeaderSpec];
  v29 = v28;
  if (self->_floatingHeaderLayout
    && (([v28 wantsTitle] & 1) != 0 || (objc_msgSend(v29, "wantsSubtitle") & 1) != 0))
  {
    v30 = v18;
    if (!v18) {
      v30 = self->_floatingHeaderLayout;
    }
    goto LABEL_32;
  }
  v30 = v18;
  if (v18)
  {
LABEL_32:
    [(PXCuratedLibrarySummaryHelper *)self->_summaryHelper setOutputPresenter:v30];
    [(PXCuratedLibrarySummaryHelper *)self->_summaryHelper setDataSource:self];
    [(PXCuratedLibrarySummaryHelper *)self->_summaryHelper visibleContentDidChange];
    goto LABEL_33;
  }
  -[PXCuratedLibrarySummaryHelper setOutputPresenter:](self->_summaryHelper, "setOutputPresenter:");
  [(PXCuratedLibrarySummaryHelper *)self->_summaryHelper setDataSource:0];
LABEL_33:
  [(PXCuratedLibraryLayout *)self _updateFloatingHeaderLayoutSpec];
}

- (id)createCuratedLibraryLayoutAnimationIfNeededWithContext:(int64_t)a3 userData:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(PXCuratedLibraryLayout *)self viewModel];
  if ([v7 isResetting] & 1) != 0 || (objc_msgSend(v7, "isAppearing")) {
    goto LABEL_5;
  }
  long long v8 = [v7 zoomablePhotosViewModel];
  if (v8)
  {
    long long v9 = v8;
    [v8 zoomState];

    if (BYTE8(v15))
    {
LABEL_5:
      long long v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  long long v10 = +[PXCuratedLibraryLayoutAnimationHelper createAnimationIfNeededForLayout:context:userData:](PXCuratedLibraryLayoutAnimationHelper, "createAnimationIfNeededForLayout:context:userData:", self, a3, v6, v12, v13, v14, v15, v16, v17, v18);
  [(PXCuratedLibraryLayout *)self _noteAnimation:v10 isRunning:1];
LABEL_6:

  return v10;
}

- (void)update
{
  self->_isPerformingUpdate = 1;
  objc_super v3 = [(PXCuratedLibraryLayout *)self viewModel];
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  if (self->_updateFlags.needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v28 handleFailureInFunction:v29, @"PXCuratedLibraryLayout.m", 228, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 0;
    if ([v3 isExpanded] & 1) != 0 || (objc_msgSend(v3, "isExpandedAnimating"))
    {
      uint64_t v5 = [(PXGLayout *)self createAnchorForVisibleArea];
    }
    else
    {
      uint64_t v5 = -[PXGLayout createAnchorForScrollingToContentEdges:padding:](self, "createAnchorForScrollingToContentEdges:padding:", 4, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
    }
    id v6 = v5;
    id v7 = (id)[v5 autoInvalidate];

    uint64_t v8 = [v3 zoomLevel];
    if ((p_updateFlags->needsUpdate & 0x11) != 0) {
      id v9 = [(PXGLayout *)self createCuratedLibraryLayoutZoomLevelChangeAnimationFromZoomLevel:self->_presentedZoomLevel toZoomLevel:v8 withContext:[(PXCuratedLibraryLayout *)self curatedLibraryLayoutAnimationContextForTransitionToZoomLevel:v8]];
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v30 handleFailureInFunction:v31, @"PXCuratedLibraryLayout.m", 244, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t needsUpdate = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 2uLL;
    if ((needsUpdate & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      [(PXCuratedLibraryLayout *)self _updateSpecValue];
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      id v32 = [MEMORY[0x1E4F28B00] currentHandler];
      v33 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v32 handleFailureInFunction:v33, @"PXCuratedLibraryLayout.m", 248, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v11 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 8uLL;
    if ((v11 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFFF7;
      [(PXCuratedLibraryLayout *)self _updateLocalSprites];
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v34 handleFailureInFunction:v35, @"PXCuratedLibraryLayout.m", 252, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v12 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 1uLL;
    if (v12)
    {
      p_updateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFFFFELL;
      [(PXCuratedLibraryLayout *)self _updateZoomLevel];
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      v37 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v36 handleFailureInFunction:v37, @"PXCuratedLibraryLayout.m", 256, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v13 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 0x40uLL;
    if ((v13 & 0x40) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v13 & 0xFFFFFFFFFFFFFFBFLL;
      [(PXCuratedLibraryLayout *)self _updateAllPhotosOverlayInsets];
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      v39 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v38 handleFailureInFunction:v39, @"PXCuratedLibraryLayout.m", 260, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v14 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 4uLL;
    if ((v14 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v14 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXCuratedLibraryLayout *)self _updateLateralMargin];
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      v41 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v40 handleFailureInFunction:v41, @"PXCuratedLibraryLayout.m", 264, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v15 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 0x10uLL;
    if ((v15 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v15 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXCuratedLibraryLayout *)self _updateFloatingHeaderVisibility];
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      v43 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v42 handleFailureInFunction:v43, @"PXCuratedLibraryLayout.m", 268, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v16 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 0x20uLL;
    if ((v16 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v16 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXCuratedLibraryLayout *)self _updateFloatingHeaderButtons];
      unint64_t v16 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v16)
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"PXCuratedLibraryLayout.m", 272, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v62.receiver = self;
  v62.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGSplitLayout *)&v62 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  if (self->_postUpdateFlags.needsUpdate)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      v47 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v46 handleFailureInFunction:v47, @"PXCuratedLibraryLayout.m", 276, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0;
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = -1;
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      v49 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v48 handleFailureInFunction:v49, @"PXCuratedLibraryLayout.m", 277, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v18 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x400uLL;
    if ((v18 & 0x400) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v18 & 0xFFFFFFFFFFFFFBFFLL;
      [(PXCuratedLibraryLayout *)self _updateBlurredBackground];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      v51 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v50 handleFailureInFunction:v51, @"PXCuratedLibraryLayout.m", 280, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v19 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v19 & 0x800) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v19 & 0xFFFFFFFFFFFFF7FFLL;
      [(PXCuratedLibraryLayout *)self _updateBlurredBackgroundOpacity];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v52 handleFailureInFunction:v53, @"PXCuratedLibraryLayout.m", 283, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v20 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000uLL;
    if ((v20 & 0x1000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v20 & 0xFFFFFFFFFFFFEFFFLL;
      [(PXCuratedLibraryLayout *)self _updateContentBackground];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      v54 = [MEMORY[0x1E4F28B00] currentHandler];
      v55 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v54 handleFailureInFunction:v55, @"PXCuratedLibraryLayout.m", 286, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v21 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x2000uLL;
    if ((v21 & 0x2000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v21 & 0xFFFFFFFFFFFFDFFFLL;
      [(PXCuratedLibraryLayout *)self _updateStatusBarGradientVisibility];
      [(PXCuratedLibraryLayout *)self _updateStatusBarStyle];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      v56 = [MEMORY[0x1E4F28B00] currentHandler];
      v57 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v56 handleFailureInFunction:v57, @"PXCuratedLibraryLayout.m", 290, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v22 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x4000uLL;
    if ((v22 & 0x4000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v22 & 0xFFFFFFFFFFFFBFFFLL;
      [(PXCuratedLibraryLayout *)self _updateStatusBarGradientAlphaValue];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      v58 = [MEMORY[0x1E4F28B00] currentHandler];
      v59 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      [v58 handleFailureInFunction:v59, @"PXCuratedLibraryLayout.m", 293, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v23 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x8000uLL;
    if ((v23 & 0x8000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v23 & 0xFFFFFFFFFFFF7FFFLL;
      [(PXCuratedLibraryLayout *)self _invalidateSummaryHelper];
      unint64_t v23 = p_postUpdateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    self->_updateFlags.updated = 0;
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v23)
    {
      v60 = [MEMORY[0x1E4F28B00] currentHandler];
      v61 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout update]"];
      objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, @"PXCuratedLibraryLayout.m", 296, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
  [(PXGLayout *)self visibleRect];
  self->_presentedVisibleRect.origin.double x = v24;
  self->_presentedVisibleRect.origin.double y = v25;
  self->_presentedVisibleRect.size.double width = v26;
  self->_presentedVisibleRect.size.double height = v27;
  self->_isPerformingUpdate = 0;
  self->_isPerformingInitialUpdate = 0;
  if (([v3 isResetting] & 1) != 0 || objc_msgSend(v3, "isNavigating")) {
    [v3 performChanges:&__block_literal_global_40065];
  }
}

- (void)visibleRectDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGSplitLayout *)&v10 visibleRectDidChange];
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x2000;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x2000) != 0)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout visibleRectDidChange]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXCuratedLibraryLayout.m", 964, @"invalidating %lu after it already has been updated", 0x2000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x2000;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_7:
  [(PXCuratedLibrarySummaryHelper *)self->_summaryHelper visibleContentDidChange];
  [(PXCuratedLibraryLayout *)self _invalidateBlurredBackground];
  uint64_t v5 = [(PXCuratedLibraryLayout *)self spec];
  uint64_t v6 = [v5 variant];

  if (v6) {
    [(PXCuratedLibraryLayout *)self _updateFloatingHeaderAppearance];
  }
}

- (void)_invalidateBlurredBackground
{
  if (self->_isPerformingUpdate)
  {
    [(PXCuratedLibraryLayout *)self _updateBlurredBackground];
    return;
  }
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_10:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_9:
    if ((self->_postUpdateFlags.updated & 0x400) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout _invalidateBlurredBackground]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXCuratedLibraryLayout.m", 665, @"invalidating %lu after it already has been updated", 1024);

      abort();
    }
    goto LABEL_10;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_9;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 1024;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateBlurredBackground
{
  if (self->_blurredBackgroundSpriteIndex != -1)
  {
    objc_super v3 = [(PXCuratedLibraryLayout *)self viewModel];
    uint64_t v4 = [(PXCuratedLibraryLayout *)self spec];
    uint64_t v5 = +[PXCuratedLibrarySettings sharedInstance];
    [(PXGLayout *)self visibleRect];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    [(PXGLayout *)self displayScale];
    uint64_t v15 = v14;
    uint64_t v16 = [v3 zoomLevel];
    [v4 blurredBackgroundOpacityForZoomLevel:v16];
    double v18 = v17;
    [v4 blurredBackgroundEdgeInsets];
    if (v18 != 0.0) {
      PXEdgeInsetsInsetRect();
    }
    uint64_t v20 = *(void *)off_1E5DAB010;
    uint64_t v19 = *((void *)off_1E5DAB010 + 1);
    uint64_t v34 = *((void *)off_1E5DAB010 + 3);
    uint64_t v35 = *((void *)off_1E5DAB010 + 2);
    int blurredBackgroundMediaVersion = self->_blurredBackgroundMediaVersion;
    BOOL v22 = self->_blurredBackgroundMediaVersion != 0;
    [(PXNumberAnimator *)self->_blurredBackgroundOpacityAnimator value];
    if (v18 <= 0.0)
    {
      if (v23 != v18)
      {
        blurredBackgroundOpacityAnimator = self->_blurredBackgroundOpacityAnimator;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke_3;
        v38[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
        *(double *)&v38[4] = v18;
        [(PXNumberAnimator *)blurredBackgroundOpacityAnimator performChangesWithoutAnimation:v38];
      }
    }
    else if (v23 == 0.0)
    {
      CGFloat v24 = self->_blurredBackgroundOpacityAnimator;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke;
      v40[3] = &unk_1E5DB2C68;
      id v41 = v4;
      uint64_t v42 = v16;
      [(PXNumberAnimator *)v24 performChangesWithoutAnimation:v40];
      CGFloat v25 = self->_blurredBackgroundOpacityAnimator;
      [v5 blurredBackgroundFadeDuration];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke_2;
      v39[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
      *(double *)&v39[4] = v18;
      -[PXNumberAnimator performChangesWithDuration:curve:changes:](v25, "performChangesWithDuration:curve:changes:", 3, v39);
    }
    CGFloat v27 = [(PXGLayout *)self entityManager];
    v28 = [(PXGExposureBlurEffect *)self->_blurredBackgroundEffect entityManager];

    if (v28 != v27)
    {
      if (blurredBackgroundMediaVersion)
      {
        id v29 = objc_alloc((Class)off_1E5DA6820);
        v30 = [(PXGLayout *)self entityManager];
        v31 = (PXGExposureBlurEffect *)[v29 initWithEntityManager:v30];
        blurredBackgroundEffect = self->_blurredBackgroundEffect;
        self->_blurredBackgroundEffect = v31;

        [(PXGExposureBlurEffect *)self->_blurredBackgroundEffect setExposure:0.0];
        [v5 blurredBackgroundRadius];
        -[PXGExposureBlurEffect setRadius:](self->_blurredBackgroundEffect, "setRadius:");
      }
    }
    blurredBackgroundSpriteIndedouble x = self->_blurredBackgroundSpriteIndex;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke_4;
    v36[3] = &unk_1E5DB2C90;
    v36[5] = v7;
    v36[6] = v9;
    v36[7] = v11;
    v36[8] = v13;
    v36[9] = v20;
    v36[10] = v19;
    v36[11] = v35;
    v36[12] = v34;
    BOOL v37 = v22;
    v36[13] = v15;
    v36[4] = self;
    [(PXGLayout *)self modifySpritesInRange:blurredBackgroundSpriteIndex | 0x100000000 fullState:v36];
    [(PXCuratedLibraryLayout *)self _invalidateBlurredBackgroundOpacity];
  }
}

- (id)_currentFloatingHeaderSpec
{
  objc_super v3 = [(PXCuratedLibraryLayout *)self viewModel];
  uint64_t v4 = [v3 specManager];
  uint64_t v5 = [v4 spec];
  uint64_t v6 = [v5 userInterfaceIdiom];

  uint64_t v7 = [v3 sharedLibraryStatusProvider];
  int v8 = [v7 hasSharedLibraryOrPreview];
  if (v6 == 2) {
    int v9 = 1;
  }
  else {
    int v9 = v8;
  }

  uint64_t v10 = [(PXCuratedLibraryLayout *)self spec];
  switch([v3 zoomLevel])
  {
    case 1:
      if (!v9) {
        goto LABEL_12;
      }
      uint64_t v11 = [v10 yearsTopHeaderSpec];
      goto LABEL_11;
    case 2:
      if (!v9) {
        goto LABEL_12;
      }
      uint64_t v11 = [v10 monthsTopHeaderSpec];
LABEL_11:
      uint64_t v12 = (void *)v11;
      break;
    case 3:
      uint64_t v11 = [v10 daysTopHeaderSpec];
      goto LABEL_11;
    case 4:
      uint64_t v11 = [v10 allPhotosFloatingHeaderSpec];
      goto LABEL_11;
    default:
LABEL_12:
      uint64_t v12 = 0;
      break;
  }

  return v12;
}

- (PXCuratedLibraryLayoutSpec)spec
{
  return self->_spec;
}

- (void)contentSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGLayout *)&v3 contentSizeDidChange];
  [(PXCuratedLibraryLayout *)self _invalidateContentBackground];
}

- (void)_updateContentBackground
{
  if (self->_contentBackgroundSpriteIndex != -1)
  {
    [(PXGLayout *)self contentSize];
    PXEdgeInsetsMake();
  }
}

- (void)_invalidateContentBackground
{
  if (self->_isPerformingUpdate)
  {
    [(PXCuratedLibraryLayout *)self _updateContentBackground];
    return;
  }
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_10:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x1000;
      return;
    }
LABEL_9:
    if ((self->_postUpdateFlags.updated & 0x1000) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout _invalidateContentBackground]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXCuratedLibraryLayout.m", 742, @"invalidating %lu after it already has been updated", 4096);

      abort();
    }
    goto LABEL_10;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_9;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 4096;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateStatusBarStyle
{
  BOOL v3 = ([(PXCuratedLibraryLayout *)self _statusBarVisibility] & 8) == 0;
  uint64_t v4 = [(PXCuratedLibraryLayout *)self viewModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PXCuratedLibraryLayout__updateStatusBarStyle__block_invoke;
  v5[3] = &__block_descriptor_33_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
  BOOL v6 = v3;
  [v4 performChanges:v5];
}

- (void)_updateStatusBarGradientVisibility
{
  if (self->_wantsStatusBarGradient)
  {
    [(PXGLayout *)self displayScale];
    float v4 = v3;
    [(PXGLayout *)self visibleRect];
    statusBarGradientCGFloat Height = self->_statusBarGradientHeight;
    uint64_t v6 = self->_statusBarGradientSpriteIndex | 0x100000000;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke;
    v13[3] = &unk_1E5DC9A10;
    v13[6] = v7;
    v13[7] = v8;
    *(double *)&v13[8] = statusBarGradientHeight;
    v13[4] = self;
    v13[5] = 0;
    float v14 = v4;
    [(PXGLayout *)self modifySpritesInRange:v6 state:v13];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke_2;
    aBlock[3] = &unk_1E5DC9E68;
    aBlock[4] = self;
    int v9 = (void (**)(void, __n128))_Block_copy(aBlock);
    char v10 = [(PXCuratedLibraryLayout *)self _statusBarVisibility];
    v11.n128_u64[0] = 0;
    if ((v10 & 2) == 0)
    {
      if ((v10 & 1) == 0)
      {
LABEL_6:

        return;
      }
      v11.n128_u64[0] = *(void *)&self->_statusBarGradientAlpha;
    }
    v9[2](v9, v11);
    goto LABEL_6;
  }
}

uint64_t __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke_2(uint64_t a1, double a2)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1104) value];
  if (v5 != a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 1104);
    double v8 = *(double *)(v6 + 1144);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke_3;
    v9[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v9[4] = a2;
    return [v7 performChangesWithDuration:4 curve:v9 changes:v8];
  }
  return result;
}

- (void)_invalidateSummaryHelper
{
}

- (void)_updateStatusBarGradientAlphaValue
{
  if (self->_wantsStatusBarGradient)
  {
    statusBarGradientSpriteIndedouble x = self->_statusBarGradientSpriteIndex;
    if (statusBarGradientSpriteIndex != -1)
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __60__PXCuratedLibraryLayout__updateStatusBarGradientAlphaValue__block_invoke;
      v3[3] = &unk_1E5DBA978;
      v3[4] = self;
      [(PXGLayout *)self modifySpritesInRange:statusBarGradientSpriteIndex | 0x100000000 state:v3];
    }
  }
}

- (void)_updateFloatingHeaderButtons
{
  v72[1] = *MEMORY[0x1E4F143B8];
  if (self->_floatingHeaderLayout)
  {
    float v4 = [(PXCuratedLibraryLayout *)self viewModel];
    double v5 = [v4 actionManager];
    v66 = v4;
    uint64_t v6 = [v4 zoomLevel];
    uint64_t v7 = v6;
    if (v6 == 4)
    {
      uint64_t v9 = 0;
      uint64_t v8 = 1;
    }
    else if (v6 == 3 && ([v4 isSelecting] & 1) == 0)
    {
      char v10 = [(PXCuratedLibraryLayout *)self spec];
      __n128 v11 = [v10 allPhotosFloatingHeaderSpec];
      uint64_t v12 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:1 spec:v11];

      v72[0] = v12;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];

      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
    [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setExternalTrailingButtonConfigurations:v9];
    [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setShowsBackgroundGradient:v8];
    LODWORD(v13) = -1081291571;
    [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setButtonsZIndex:v13];
    float v14 = [v5 actionPerformerForActionType:@"PXCuratedLibraryActionCancelSelectMode"];
    [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setCancelButtonActionPerformer:v14];

    uint64_t v15 = [v5 actionPerformerForActionType:@"PXCuratedLibraryActionEnterSelectMode"];
    [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setSelectButtonActionPerformer:v15];

    uint64_t v16 = PXLocalizedStringFromTable(@"PXCuratedLibrarySelectButtonTitle", @"PhotosUICore");
    [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setSelectButtonTitle:v16];

    double v17 = [v5 actionPerformerForActionType:@"PXCuratedLibraryActionShowSidebar"];
    [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setShowSidebarButtonActionPerformer:v17];

    double v18 = +[PXPhotosGridSettings sharedInstance];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__PXCuratedLibraryLayout__updateFloatingHeaderButtons__block_invoke;
    aBlock[3] = &unk_1E5DB2CB8;
    id v19 = v18;
    id v68 = v19;
    id v64 = v5;
    id v69 = v64;
    v70 = self;
    uint64_t v20 = _Block_copy(aBlock);
    unint64_t v21 = [v66 sharedLibraryStatusProvider];
    char v22 = [v21 hasSharedLibraryOrPreview];

    objc_super v62 = (void *)v9;
    v63 = v19;
    v61 = v20;
    if (v22)
    {
      uint64_t v23 = (*((void (**)(void *))v20 + 2))(v20);
      CGFloat v24 = [(PXCuratedLibraryLayout *)self libraryFilterState];
      unsigned int v59 = [v24 isFiltering];

      if (v7 != 4)
      {
        v60 = (void *)v23;
LABEL_18:
        id v29 = 0;
        uint64_t v57 = 0;
        v58 = 0;
        v56 = 0;
        v30 = 0;
        uint64_t v31 = 0;
        id v32 = 0;
        v33 = &stru_1F00B0030;
        uint64_t v34 = &stru_1F00B0030;
        uint64_t v35 = &stru_1F00B0030;
LABEL_30:
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setEllipsisButtonActionPerformer:v60];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setEllipsisButtonHighlighted:v59];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setShowFiltersActionPerformer:v32];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setFilterButtonCaption:v35];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setFilterButtonTitle:v34];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setFilterButtonHighlighted:v31];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setToggleAspectFitButtonActionPerformer:v30];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setToggleAspectFitButtonTitle:v33];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setToggleAspectFitButtonPossibleTitles:v29];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setToggleAspectFitCompactButtonSymbol:v57];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setZoomInButtonActionPerformer:v58];
        [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setZoomOutButtonActionPerformer:v56];
        [(PXCuratedLibraryLayout *)self _updateFloatingHeaderSelectionTitle];

        return;
      }
    }
    else
    {
      if (v7 != 4)
      {
        v60 = 0;
        unsigned int v59 = 0;
        goto LABEL_18;
      }
      uint64_t v23 = (*((void (**)(void *))v20 + 2))(v20);
      unsigned int v59 = 0;
    }
    v60 = (void *)v23;
    if (![v19 enableFilterDropDownButton])
    {
      unsigned int v54 = 0;
      CGFloat v25 = 0;
      CGFloat v27 = &stru_1F00B0030;
      v55 = &stru_1F00B0030;
      goto LABEL_20;
    }
    CGFloat v25 = [v64 actionPerformerForActionType:@"PXCuratedLibraryActionShowFilters"];
    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_16:
        CGFloat v26 = [v66 currentContentFilterState];
        PXLocalizedCaptionForFilterState(v26);
        CGFloat v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedTitleForFilterState(v26);
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = [v66 currentContentFilterState];
        unsigned int v54 = [v28 isFiltering];

LABEL_20:
        v53 = v27;
        v65 = v25;
        if ([v19 enableAspectFitButton])
        {
          v36 = [v66 zoomablePhotosViewModel];
          int v37 = [v36 aspectFit];
          v38 = PXLocalizedStringFromTable(@"PXLibraryAllPhotosToggleSquares", @"PhotosUICore");
          uint64_t v39 = PXLocalizedStringFromTable(@"PXLibraryAllPhotosToggleFullFrames", @"PhotosUICore");
          v40 = (void *)v39;
          if (v37) {
            id v41 = v38;
          }
          else {
            id v41 = (void *)v39;
          }
          v33 = v41;
          uint64_t v42 = (void *)MEMORY[0x1E4F1CAD0];
          v71[0] = v40;
          v71[1] = v38;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
          uint64_t v44 = [v42 setWithArray:v43];

          uint64_t v45 = v37 ^ 1u;
          uint64_t v46 = [v64 actionPerformerForActionType:@"PXCuratedLibraryActionAllPhotosToggleAspectFit"];

          id v19 = v63;
        }
        else
        {
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          uint64_t v46 = 0;
          v33 = &stru_1F00B0030;
        }
        uint64_t v57 = v45;
        v47 = (void *)v46;
        if ([v19 enableZoomInOutButton])
        {
          v58 = [v64 actionPerformerForActionType:@"PXCuratedLibraryActionAllPhotosZoomIn"];
          v56 = [v64 actionPerformerForActionType:@"PXCuratedLibraryActionAllPhotosZoomOut"];
        }
        else
        {
          v58 = 0;
          v56 = 0;
        }
        id v32 = v65;
        uint64_t v35 = v53;
        uint64_t v34 = v55;
        uint64_t v31 = v54;
        id v29 = (void *)v44;
        v30 = v47;
        goto LABEL_30;
      }
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      v51 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v51);
      v52 = objc_msgSend(v25, "px_descriptionForAssertionMessage");
      [v48 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayout.m", 874, @"%@ should be an instance inheriting from %@, but it is %@", @"[actionManager actionPerformerForActionType:PXCuratedLibraryActionShowFilters]", v50, v52 object file lineNumber description];
    }
    else
    {
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      [v48 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayout.m", 874, @"%@ should be an instance inheriting from %@, but it is nil", @"[actionManager actionPerformerForActionType:PXCuratedLibraryActionShowFilters]", v50 object file lineNumber description];
    }

    goto LABEL_16;
  }
}

- (int64_t)curatedLibraryLayoutAnimationContextForTransitionToZoomLevel:(int64_t)a3
{
  int64_t presentedZoomLevel = self->_presentedZoomLevel;
  BOOL v4 = presentedZoomLevel == 4 || a3 == 4;
  int64_t v5 = 4;
  if (v4) {
    int64_t v5 = 5;
  }
  if (presentedZoomLevel) {
    BOOL v6 = presentedZoomLevel == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 1;
  }
  else {
    return v5;
  }
}

- (void)_updateSpecValue
{
  id v5 = [(PXCuratedLibraryLayout *)self viewModel];
  double v3 = [v5 specManager];
  BOOL v4 = [v3 spec];
  [(PXCuratedLibraryLayout *)self setSpec:v4];
}

- (void)setSpec:(id)a3
{
  BOOL v6 = (PXCuratedLibraryLayoutSpec *)a3;
  if (self->_spec != v6)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    id v5 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
    [v5 setSpec:v6];

    [(PXCuratedLibraryLayout *)self _updateFloatingHeaderLayoutSpec];
    [(PXCuratedLibraryLayout *)self _updateFloatingHeaderButtons];
  }
}

- (void)_updateLocalSprites
{
  uint64_t v23 = 0;
  CGFloat v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__39980;
  unint64_t v21 = __Block_byref_object_dispose__39981;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  float v14 = __Block_byref_object_copy__39980;
  uint64_t v15 = __Block_byref_object_dispose__39981;
  id v16 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PXCuratedLibraryLayout__updateLocalSprites__block_invoke;
  aBlock[3] = &unk_1E5DB2C40;
  void aBlock[4] = &v23;
  void aBlock[5] = &v17;
  aBlock[6] = &v11;
  double v3 = (void (**)(void *, unsigned int *, BOOL))_Block_copy(aBlock);
  BOOL v4 = [(PXCuratedLibraryLayout *)self viewModel];
  id v5 = [v4 specManager];
  BOOL v6 = [v5 spec];
  uint64_t v7 = [v6 contentBackgroundColor];

  v3[2](v3, &self->_statusBarGradientSpriteIndex, self->_wantsStatusBarGradient);
  v3[2](v3, &self->_blurredBackgroundSpriteIndex, self->_wantsBlurredBackground);
  v3[2](v3, &self->_contentBackgroundSpriteIndex, v7 != 0);
  if ([(id)v18[5] count] || objc_msgSend((id)v12[5], "count"))
  {
    id v8 = objc_alloc((Class)off_1E5DA5568);
    uint64_t v9 = (void *)[v8 initWithIncrementalChangeDetailsRemovedIndexes:v12[5] insertedIndexes:v18[5] movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
    [(PXGLayout *)self applySpriteChangeDetails:v9 countAfterChanges:*((unsigned int *)v24 + 6) initialState:&__block_literal_global_264 modifyState:0];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void *__45__PXCuratedLibraryLayout__updateLocalSprites__block_invoke(void *result, unsigned int *a2, int a3)
{
  BOOL v4 = result;
  unsigned int v5 = *a2;
  if (a3)
  {
    *a2 = (*(_DWORD *)(*(void *)(result[4] + 8) + 24))++;
    unsigned int v6 = *a2;
  }
  else
  {
    unsigned int v6 = -1;
    *a2 = -1;
  }
  if (v5 == -1)
  {
    if (v6 == -1) {
      return result;
    }
    uint64_t v7 = *(void **)(*(void *)(result[5] + 8) + 40);
    if (!v7)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      uint64_t v12 = *(void *)(v4[5] + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      uint64_t v7 = *(void **)(*(void *)(v4[5] + 8) + 40);
      unsigned int v6 = *a2;
    }
  }
  else
  {
    if (v6 != -1) {
      return result;
    }
    uint64_t v7 = *(void **)(*(void *)(result[6] + 8) + 40);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      uint64_t v9 = *(void *)(v4[6] + 8);
      char v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v7 = *(void **)(*(void *)(v4[6] + 8) + 40);
    }
    unsigned int v6 = v5;
  }
  return (void *)[v7 addIndex:v6];
}

- (void)_updateLateralMargin
{
  id v4 = [(PXCuratedLibraryLayout *)self spec];
  double v3 = [(PXCuratedLibraryLayout *)self viewModel];
  if ([v3 zoomLevel] == 3 && objc_msgSend(v4, "userInterfaceIdiom") == 4)
  {
    [v4 contentGuideInsetsForScrollAxis:1];
    [v3 daysMarginScale];
    PXFloatByLinearlyInterpolatingFloats();
  }
  [(PXCuratedLibraryLayout *)self setLateralMargin:0.0];
}

- (void)setLateralMargin:(double)a3
{
  if (self->_lateralMargin != a3)
  {
    self->_lateralMargin = a3;
    [(PXCuratedLibraryLayout *)self _updateLibraryBodyLayoutLateralMargin];
    [(PXCuratedLibraryLayout *)self _updateFloatingHeaderLayoutSpec];
  }
}

- (PXSectionedObjectReference)dominantObjectReference
{
  uint64_t v5 = 0;
  unsigned int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__119675;
  uint64_t v9 = __Block_byref_object_dispose__119676;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__PXCuratedLibraryLayout_PXCuratedLibraryEventTracker__dominantObjectReference__block_invoke;
  v4[3] = &unk_1E5DBBE68;
  v4[4] = self;
  v4[5] = &v5;
  [(PXGLayout *)self enumerateVisibleAnchoringSpriteIndexesUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (PXSectionedObjectReference *)v2;
}

- (void)safeAreaInsetsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGSplitLayout *)&v8 safeAreaInsetsDidChange];
  if (!self->_isPerformingUpdate)
  {
    p_postUpdateFlags = &self->_postUpdateFlags;
    unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x2000;
        return;
      }
LABEL_6:
      if ((self->_postUpdateFlags.updated & 0x2000) != 0)
      {
        unsigned int v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout safeAreaInsetsDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibraryLayout.m", 957, @"invalidating %lu after it already has been updated", 0x2000);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_postUpdateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
    p_postUpdateFlags->unint64_t needsUpdate = 0x2000;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (id)createAnchorForScrollingToInitialPosition
{
  double v3 = [(PXCuratedLibraryLayout *)self viewModel];
  if ([v3 zoomLevel] == 3)
  {
    id v4 = [v3 assetsDataSourceManager];
    uint64_t v5 = [v4 dataSourceForZoomLevel:3];

    uint64_t v6 = [v5 numberOfSections];
    if (v6 > 0)
    {
      uint64_t v7 = (void *)(v6 - 1);
      v18[0] = [v5 identifier];
      v18[1] = v7;
      int64x2_t v19 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      objc_super v8 = [v5 assetCollectionAtSectionIndexPath:v18];
      if ([v8 isRecent] && objc_msgSend(v5, "numberOfItemsInSection:", v7) >= 1)
      {
        v16[0] = [v5 identifier];
        v16[1] = v7;
        long long v17 = xmmword_1AB359AA0;
        uint64_t v9 = [v5 assetReferenceAtItemIndexPath:v16];
        objc_initWeak(&location, self);
        id v10 = [(PXGLayout *)self spriteReferenceForObjectReference:v9];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __67__PXCuratedLibraryLayout_createAnchorForScrollingToInitialPosition__block_invoke;
        v13[3] = &unk_1E5DB2D58;
        objc_copyWeak(v14, &location);
        v14[1] = v7;
        id v11 = -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", v10, 4, v13, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));

        objc_destroyWeak(v14);
        objc_destroyWeak(&location);

        if (v11) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }
LABEL_9:
  id v11 = -[PXGLayout createAnchorForScrollingToContentEdges:padding:](self, "createAnchorForScrollingToContentEdges:padding:", 4, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
LABEL_10:

  return v11;
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGSplitLayout *)&v8 displayScaleDidChange];
  if (!self->_isPerformingUpdate)
  {
    p_postUpdateFlags = &self->_postUpdateFlags;
    unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x2000;
        return;
      }
LABEL_6:
      if ((self->_postUpdateFlags.updated & 0x2000) != 0)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout displayScaleDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibraryLayout.m", 949, @"invalidating %lu after it already has been updated", 0x2000);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_postUpdateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
    p_postUpdateFlags->unint64_t needsUpdate = 0x2000;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_updateZoomLevel
{
  id v16 = [(PXCuratedLibraryLayout *)self viewModel];
  int64_t v3 = [v16 zoomLevel];
  if (([v16 isResetting] & 1) == 0)
  {
    id v4 = [(PXCuratedLibraryLayout *)self _createAnchorForTransitionToZoomLevel:v3];
    id v5 = (id)[v4 autoInvalidate];
  }
  if (v3 == 4)
  {
    p_id allPhotosBodyLayout = (id *)&self->_allPhotosBodyLayout;
    id allPhotosBodyLayout = self->_allPhotosBodyLayout;
    if (allPhotosBodyLayout) {
      goto LABEL_9;
    }
    objc_super v8 = [PXZoomablePhotosLayout alloc];
    uint64_t v9 = [v16 zoomablePhotosViewModel];
    uint64_t v10 = [(PXZoomablePhotosLayout *)v8 initWithViewModel:v9];
    id v11 = *p_allPhotosBodyLayout;
    id *p_allPhotosBodyLayout = (id)v10;

    [*p_allPhotosBodyLayout setBodyLayoutAXGroupRole:1];
    libraryBodyLayout = self->_libraryBodyLayout;
    self->_libraryBodyLayout = 0;
  }
  else
  {
    p_id allPhotosBodyLayout = (id *)&self->_libraryBodyLayout;
    id allPhotosBodyLayout = self->_libraryBodyLayout;
    if (allPhotosBodyLayout) {
      goto LABEL_9;
    }
    uint64_t v13 = [[PXCuratedLibrarySectionedLayout alloc] initWithViewModel:v16 spec:self->_spec];
    id v14 = *p_allPhotosBodyLayout;
    id *p_allPhotosBodyLayout = v13;

    [(PXCuratedLibraryLayout *)self _updateLibraryBodyLayoutLateralMargin];
    [(PXCuratedLibraryLayout *)self _updateLibraryBodyLayoutLastVisibleDominantObjectReference];
  }
  id allPhotosBodyLayout = *p_allPhotosBodyLayout;
LABEL_9:
  [(PXGSplitLayout *)self setSecondSublayout:allPhotosBodyLayout];
  if (self->_presentedZoomLevel != v3)
  {
    uint64_t v15 = [(PXGLayout *)self createFenceWithType:2];
    [v15 setTimeout:0.1];
    [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
    if (self->_presentedZoomLevel == 4 && [v16 zoomLevelTransitionPhase]) {
      [(PXCuratedLibraryLayout *)self _invalidateBlurredBackgroundSnapshot];
    }
  }
  self->_int64_t presentedZoomLevel = v3;
}

- (id)_createAnchorForTransitionToZoomLevel:(int64_t)a3
{
  int64_t v6 = [(PXCuratedLibraryLayout *)self presentedZoomLevel];
  uint64_t v7 = 0;
  if (v6)
  {
    int64_t v8 = v6;
    if (v6 != a3)
    {
      if (v6 == 3)
      {
        uint64_t v9 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
        uint64_t v10 = [v9 dominantSectionLayout];
        id v11 = [v10 assetCollectionReference];
      }
      else
      {
        id v11 = 0;
      }
      lastVisibleAreaAnchorsByZoomLevels = self->_lastVisibleAreaAnchorsByZoomLevels;
      uint64_t v13 = [NSNumber numberWithInteger:a3];
      id v14 = [(NSMutableDictionary *)lastVisibleAreaAnchorsByZoomLevels objectForKeyedSubscript:v13];

      if ([v14 canBeReused])
      {
        uint64_t v7 = [(PXGLayout *)self createAnchorWithAnchor:v14];
LABEL_26:
        [(PXCuratedLibraryLayout *)self setLastPresentedDayAssetCollectionReference:v11];

        goto LABEL_27;
      }
      SEL v56 = a2;
      uint64_t v15 = [(PXGLayout *)self createAnchorForVisibleArea];
      id v16 = [v15 autoInvalidate];
      long long v17 = self->_lastVisibleAreaAnchorsByZoomLevels;
      double v18 = [NSNumber numberWithInteger:v8];
      [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];

      int64x2_t v19 = [(PXCuratedLibraryLayout *)self lastVisibleDominantObjectReference];
      uint64_t v20 = "TTRWorkflowBuilder";
      uint64_t v57 = v14;
      v58 = v11;
      if (!v19)
      {
        if (v8 == 4)
        {
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke;
          v66[3] = &unk_1E5DB2DA8;
          v66[4] = self;
          [(PXGLayout *)self enumerateVisibleAnchoringSpriteIndexesUsingBlock:v66];
          id v21 = [(PXCuratedLibraryLayout *)self lastVisibleDominantObjectReference];
          id v22 = v21;
          goto LABEL_17;
        }
        uint64_t v23 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
        CGFloat v24 = [v23 dominantSectionLayout];

        int64x2_t v19 = [v24 assetCollectionReference];
        if ([v24 presentedSkimming])
        {
          uint64_t v25 = [(PXCuratedLibraryLayout *)self viewModel];
          int v26 = [v25 assetsDataSourceManager];
          unsigned int v54 = [v26 dataSourceForZoomLevel:v8];

          CGFloat v27 = [(PXCuratedLibraryLayout *)self viewModel];
          v28 = [v27 assetsDataSourceManager];
          id v29 = [v28 dataSourceForZoomLevel:a3];

          v30 = [v54 assetCollectionReferenceNearestToObjectReference:v19];

          [(PXCuratedLibraryLayout *)self setLastVisibleDominantObjectReference:v30];
          int64x2_t v19 = [v29 assetCollectionReferenceNearestToObjectReference:v30];

          uint64_t v20 = "TTRWorkflowBuilder";
        }
        else
        {
          [(PXCuratedLibraryLayout *)self setLastVisibleDominantObjectReference:v19];
        }
      }
      id v31 = v19;
      id v22 = v31;
      if (v8 != 4)
      {
        v43 = [(PXCuratedLibraryLayout *)self viewModel];
        uint64_t v44 = [v43 assetsDataSourceManager];
        uint64_t v45 = [v44 dataSourceForZoomLevel:v8];

        id v41 = [v45 assetCollectionReferenceNearestToObjectReference:v22];

        unint64_t v40 = 0x1E4F28000uLL;
        if (v41)
        {
LABEL_20:
          uint64_t v65 = 0;
          unsigned int v42 = [(PXGLayout *)self spriteIndexForObjectReference:v41 options:1 updatedObjectReference:&v65];
LABEL_23:
          id v14 = v57;
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = *((void *)v20 + 415);
          v59[2] = __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke_2;
          v59[3] = &unk_1E5DB2DF8;
          v59[4] = self;
          unsigned int v64 = v42;
          id v46 = v22;
          id v60 = v46;
          int64_t v61 = a3;
          SEL v62 = v56;
          int64_t v63 = v8;
          uint64_t v7 = [(PXGLayout *)self createAnchorWithConstraints:v59];
          id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v48 = [*(id *)(v40 + 3792) numberWithInteger:v8];
          [v47 setObject:v48 forKeyedSubscript:@"fromZoomLevel"];

          v49 = [*(id *)(v40 + 3792) numberWithInteger:a3];
          [v47 setObject:v49 forKeyedSubscript:@"toZoomLevel"];

          [(PXGSplitLayout *)self padding];
          if (v50 > 0.0)
          {
            [(PXGLayout *)self visibleRect];
            [(PXGLayout *)self safeAreaInsets];
            PXEdgeInsetsInsetRect();
          }
          [v7 setDelegate:self];
          [v7 setContext:v47];
          preferredVisibleAreaAnchorsByZoomLevels = self->_preferredVisibleAreaAnchorsByZoomLevels;
          v52 = [*(id *)(v40 + 3792) numberWithInteger:a3];
          [(NSMutableDictionary *)preferredVisibleAreaAnchorsByZoomLevels setObject:v7 forKeyedSubscript:v52];

          id v11 = v58;
          goto LABEL_26;
        }
LABEL_22:
        unsigned int v42 = -1;
        goto LABEL_23;
      }
      id v21 = v31;
LABEL_17:
      id v32 = [(PXCuratedLibraryLayout *)self viewModel];
      v33 = [v32 assetsDataSourceManager];
      uint64_t v34 = [v33 dataSourceForZoomLevel:a3];

      v55 = v21;
      uint64_t v35 = [v34 assetCollectionReferenceNearestToObjectReference:v21];
      v36 = [v35 assetCollection];
      int v37 = [(PXCuratedLibraryLayout *)self lastPresentedDayAssetCollectionReference];
      v38 = [v37 assetCollection];
      char v39 = [v36 isEqual:v38];

      if ((v39 & 1) == 0)
      {
        id v22 = v35;
      }
      unint64_t v40 = 0x1E4F28000;
      uint64_t v20 = "TTRWorkflowBuilder";
      id v41 = v55;
      if (v55) {
        goto LABEL_20;
      }
      goto LABEL_22;
    }
  }
LABEL_27:
  return v7;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v53 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext_218348 == a5)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_33;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_32:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x55;
        goto LABEL_33;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 85;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
LABEL_33:
      if ((v6 & 0x2004) != 0) {
        [(PXCuratedLibraryLayout *)self _invalidateBlurredBackground];
      }
      if ((v6 & 4) == 0)
      {
LABEL_43:
        if ((v6 & 0x80) == 0)
        {
LABEL_50:
          if ((v6 & 0x2010001) != 0) {
            [(PXCuratedLibraryLayout *)self invalidateFloatingHeaderButtons];
          }
          if ((v6 & 0x8000000) != 0) {
            [(PXCuratedLibraryLayout *)self _updateFloatingHeaderSelectionTitle];
          }
          if ((v6 & 0x4000010) == 0) {
            goto LABEL_115;
          }
          p_postUpdateFlags = &self->_postUpdateFlags;
          unint64_t v10 = self->_postUpdateFlags.needsUpdate;
          if (v10)
          {
            if (!self->_postUpdateFlags.isPerformingUpdate) {
              goto LABEL_60;
            }
          }
          else if (!self->_postUpdateFlags.isPerformingUpdate)
          {
LABEL_101:
            BOOL v36 = p_postUpdateFlags->willPerformUpdate;
            uint64_t v37 = 0x8000;
            goto LABEL_102;
          }
          if ((self->_postUpdateFlags.updated & 0x8000) == 0) {
            goto LABEL_60;
          }
          uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
          objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1014, @"invalidating %lu after it already has been updated", 0x8000);
          goto LABEL_142;
        }
        uint64_t v20 = &self->_updateFlags;
        unint64_t v21 = self->_updateFlags.needsUpdate;
        if (v21)
        {
          if (!self->_updateFlags.isPerformingUpdate)
          {
LABEL_49:
            v20->unint64_t needsUpdate = v21 | 4;
            goto LABEL_50;
          }
        }
        else if (!self->_updateFlags.isPerformingUpdate)
        {
          BOOL v31 = self->_updateFlags.willPerformUpdate;
          v20->unint64_t needsUpdate = 4;
          if (!v31) {
            [(PXGLayout *)self setNeedsUpdate];
          }
          goto LABEL_50;
        }
        if ((self->_updateFlags.updated & 4) != 0)
        {
          uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
          objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1004, @"invalidating %lu after it already has been updated", 4);
          goto LABEL_142;
        }
        goto LABEL_49;
      }
      double v18 = &self->_postUpdateFlags;
      unint64_t v19 = self->_postUpdateFlags.needsUpdate;
      if (v19)
      {
        if (!self->_postUpdateFlags.isPerformingUpdate)
        {
LABEL_41:
          v18->unint64_t needsUpdate = v19 | 0x6000;
LABEL_42:
          [(PXCuratedLibraryLayout *)self _invalidateContentBackground];
          goto LABEL_43;
        }
      }
      else if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        BOOL v30 = self->_postUpdateFlags.willPerformUpdate;
        v18->unint64_t needsUpdate = 24576;
        if (!v30) {
          [(PXGLayout *)self setNeedsUpdate];
        }
        goto LABEL_42;
      }
      if ((self->_postUpdateFlags.updated & 0x6000) != 0)
      {
        uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1000, @"invalidating %lu after it already has been updated", 24576);
        goto LABEL_142;
      }
      goto LABEL_41;
    }
    if ((self->_updateFlags.updated & 0x55) != 0)
    {
      uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 994, @"invalidating %lu after it already has been updated", 85);
      goto LABEL_142;
    }
    goto LABEL_32;
  }
  if ((void *)PXZoomablePhotosViewModelObserverContext == a5)
  {
    if ((v6 & 0x1001) == 0) {
      goto LABEL_73;
    }
    uint64_t v13 = &self->_postUpdateFlags;
    unint64_t v14 = self->_postUpdateFlags.needsUpdate;
    if (v14)
    {
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
LABEL_71:
        v13->unint64_t needsUpdate = v14 | 0x6000;
LABEL_72:
        [(PXCuratedLibraryLayout *)self _updateFloatingHeaderAppearance];
LABEL_73:
        if ((v6 & 0x40000002) == 0)
        {
LABEL_80:
          if ((v6 & 2) == 0) {
            goto LABEL_115;
          }
          id v15 = [(PXGLayout *)self createCuratedLibraryLayoutAnimationIfNeededWithContext:1];
          [v15 setDuration:0.3];
          int v26 = [(PXGLayout *)self createAnchorForVisibleArea];
          id v27 = (id)[v26 autoInvalidate];

          goto LABEL_114;
        }
        CGFloat v24 = &self->_updateFlags;
        unint64_t v25 = self->_updateFlags.needsUpdate;
        if (v25)
        {
          if (!self->_updateFlags.isPerformingUpdate)
          {
LABEL_79:
            v24->unint64_t needsUpdate = v25 | 0x20;
            goto LABEL_80;
          }
        }
        else if (!self->_updateFlags.isPerformingUpdate)
        {
          BOOL v33 = self->_updateFlags.willPerformUpdate;
          v24->unint64_t needsUpdate = 32;
          if (!v33) {
            [(PXGLayout *)self setNeedsUpdate];
          }
          goto LABEL_80;
        }
        if ((self->_updateFlags.updated & 0x20) != 0)
        {
          uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
          objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1022, @"invalidating %lu after it already has been updated", 32);
          goto LABEL_142;
        }
        goto LABEL_79;
      }
    }
    else if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      BOOL v32 = self->_postUpdateFlags.willPerformUpdate;
      v13->unint64_t needsUpdate = 24576;
      if (!v32) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_72;
    }
    if ((self->_postUpdateFlags.updated & 0x6000) != 0)
    {
      uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1018, @"invalidating %lu after it already has been updated", 24576);
      goto LABEL_142;
    }
    goto LABEL_71;
  }
  if ((void *)PXCuratedLibrarySpecManagerObserverContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_115;
    }
    if (self->_isPerformingUpdate)
    {
      [(PXCuratedLibraryLayout *)self _updateSpecValue];
      [(PXCuratedLibraryLayout *)self _updateLateralMargin];
      goto LABEL_115;
    }
    p_postUpdateFlags = &self->_updateFlags;
    unint64_t v28 = self->_updateFlags.needsUpdate;
    if (v28)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_109;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL v36 = self->_updateFlags.willPerformUpdate;
      uint64_t v37 = 6;
      goto LABEL_102;
    }
    if ((self->_updateFlags.updated & 6) != 0)
    {
      uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1036, @"invalidating %lu after it already has been updated", 6);
      goto LABEL_142;
    }
LABEL_109:
    uint64_t v22 = v28 | 6;
    goto LABEL_61;
  }
  if ((void *)PXCuratedLibraryLayoutStatusBarNumberAnimatorObserverContext == a5)
  {
    if ((v6 & 6) == 0) {
      goto LABEL_115;
    }
    id v15 = v53;
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_26;
      }
      unsigned int v42 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v45 = (objc_class *)objc_opt_class();
      uint64_t v44 = NSStringFromClass(v45);
      id v46 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
      [v42 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayout.m", 1042, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v44, v46 object file lineNumber description];
    }
    else
    {
      unsigned int v42 = [MEMORY[0x1E4F28B00] currentHandler];
      v43 = (objc_class *)objc_opt_class();
      uint64_t v44 = NSStringFromClass(v43);
      [v42 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayout.m", 1042, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v44 object file lineNumber description];
    }

LABEL_26:
    if ([v15 isBeingMutated]) {
      goto LABEL_114;
    }
    id v16 = &self->_postUpdateFlags;
    unint64_t v17 = self->_postUpdateFlags.needsUpdate;
    if (v17)
    {
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
LABEL_106:
        uint64_t v38 = v17 | 0x4000;
LABEL_113:
        v16->unint64_t needsUpdate = v38;
        goto LABEL_114;
      }
    }
    else if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      BOOL v40 = self->_postUpdateFlags.willPerformUpdate;
      uint64_t v41 = 0x4000;
      goto LABEL_124;
    }
    if ((self->_postUpdateFlags.updated & 0x4000) != 0)
    {
      uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1044, @"invalidating %lu after it already has been updated", 0x4000);
      goto LABEL_142;
    }
    goto LABEL_106;
  }
  if ((void *)PXCuratedLibraryLayoutBlurredBackgroundNumberAnimatorObserverContext == a5)
  {
    if ((v6 & 6) == 0) {
      goto LABEL_115;
    }
    id v15 = v53;
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_65;
      }
      id v47 = [MEMORY[0x1E4F28B00] currentHandler];
      double v50 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v50);
      v51 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
      [v47 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayout.m", 1050, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v49, v51 object file lineNumber description];
    }
    else
    {
      id v47 = [MEMORY[0x1E4F28B00] currentHandler];
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      [v47 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayout.m", 1050, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v49 object file lineNumber description];
    }

LABEL_65:
    if (([v15 isBeingMutated] & 1) == 0)
    {
      id v16 = &self->_postUpdateFlags;
      unint64_t v23 = self->_postUpdateFlags.needsUpdate;
      if (v23)
      {
        if (!self->_postUpdateFlags.isPerformingUpdate)
        {
LABEL_112:
          uint64_t v38 = v23 | 0x800;
          goto LABEL_113;
        }
LABEL_111:
        if ((self->_postUpdateFlags.updated & 0x800) != 0)
        {
          uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
          objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1052, @"invalidating %lu after it already has been updated", 2048);
          goto LABEL_142;
        }
        goto LABEL_112;
      }
      if (self->_postUpdateFlags.isPerformingUpdate) {
        goto LABEL_111;
      }
      BOOL v40 = self->_postUpdateFlags.willPerformUpdate;
      uint64_t v41 = 2048;
LABEL_124:
      v16->unint64_t needsUpdate = v41;
      if (!v40) {
        [(PXGLayout *)self setNeedsUpdate];
      }
    }
LABEL_114:

    goto LABEL_115;
  }
  if ((void *)PXCuratedLibraryFloatingHeaderLeadingButtonsGuideObserverContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_115;
    }
    if (self->_isPerformingUpdate)
    {
      [(PXCuratedLibraryLayout *)self _updateAllPhotosOverlayInsets];
      goto LABEL_115;
    }
    p_postUpdateFlags = &self->_updateFlags;
    unint64_t v39 = self->_updateFlags.needsUpdate;
    if (v39)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_128;
      }
      goto LABEL_127;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
LABEL_127:
      if ((self->_updateFlags.updated & 0x40) == 0)
      {
LABEL_128:
        uint64_t v22 = v39 | 0x40;
        goto LABEL_61;
      }
      uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1061, @"invalidating %lu after it already has been updated", 64);
LABEL_142:

      abort();
    }
    BOOL v36 = self->_updateFlags.willPerformUpdate;
    uint64_t v37 = 64;
LABEL_102:
    p_postUpdateFlags->unint64_t needsUpdate = v37;
    if (!v36) {
      [(PXGLayout *)self setNeedsUpdate];
    }
    goto LABEL_115;
  }
  if ((void *)PXLibraryFilterStateObservationContext_40006 != a5)
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryLayout.m" lineNumber:1072 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    [(PXCuratedLibraryLayout *)self invalidateFloatingHeaderButtons];
    p_postUpdateFlags = &self->_postUpdateFlags;
    unint64_t v10 = self->_postUpdateFlags.needsUpdate;
    if (v10)
    {
      if (!self->_postUpdateFlags.isPerformingUpdate) {
        goto LABEL_60;
      }
LABEL_99:
      if ((self->_postUpdateFlags.updated & 0x8000) != 0)
      {
        uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v35 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout observable:didChange:context:]"];
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"PXCuratedLibraryLayout.m", 1068, @"invalidating %lu after it already has been updated", 0x8000);
        goto LABEL_142;
      }
LABEL_60:
      uint64_t v22 = v10 | 0x8000;
LABEL_61:
      p_postUpdateFlags->unint64_t needsUpdate = v22;
      goto LABEL_115;
    }
    if (self->_postUpdateFlags.isPerformingUpdate) {
      goto LABEL_99;
    }
    goto LABEL_101;
  }
LABEL_115:
}

- (void)_updateFloatingHeaderAppearance
{
  int64_t v3 = [(PXCuratedLibraryLayout *)self viewModel];
  uint64_t v4 = [v3 zoomLevel];
  uint64_t v5 = [v3 zoomLevel];
  uint64_t v6 = [v3 zoomLevel];
  if (v5 != 2 && v6 != 1)
  {
    if (v4 != 4)
    {
LABEL_4:
      [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setTitleAlpha:1.0];
      floatingHeaderLayout = self->_floatingHeaderLayout;
LABEL_13:
      BOOL v15 = 0;
      goto LABEL_14;
    }
LABEL_6:
    uint64_t v12 = [v3 zoomablePhotosViewModel];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 zoomState];
      double v14 = v31;
    }
    else
    {
      double v31 = 0.0;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      double v14 = 0.0;
      long long v25 = 0u;
      long long v26 = 0u;
    }
    -[PXCuratedLibrarySectionHeaderLayout setTitleAlpha:](self->_floatingHeaderLayout, "setTitleAlpha:", v14, v25, v26, v27, v28, v29, v30, *(void *)&v31);

    [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout titleAlpha];
    if (v16 >= 1.0)
    {
      unint64_t v17 = [v3 zoomablePhotosViewModel];
      -[PXCuratedLibrarySectionHeaderLayout setWantsOverBackgroundAppearance:](self->_floatingHeaderLayout, "setWantsOverBackgroundAppearance:", [v17 wantsOverBackgroundFloatingHeaderAppearance]);

      goto LABEL_16;
    }
    floatingHeaderLayout = self->_floatingHeaderLayout;
    goto LABEL_13;
  }
  int64_t v8 = [(PXCuratedLibraryLayout *)self viewModel];
  uint64_t v9 = [v8 specManager];
  unint64_t v10 = [v9 spec];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v4 == 4) {
    goto LABEL_6;
  }
  if (v11 != 2)
  {
    if (v5 == 2)
    {
      [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setTitleAlpha:0.0];
      [(PXGLayout *)self visibleRect];
      double v19 = v18;
      uint64_t v20 = [(PXCuratedLibraryLayout *)self viewModel];
      unint64_t v21 = [v20 specManager];
      uint64_t v22 = [v21 spec];
      uint64_t v23 = [v22 layoutOrientation];

      BOOL v15 = v19 < 1.0 || v23 == 2;
      floatingHeaderLayout = self->_floatingHeaderLayout;
      goto LABEL_14;
    }
    goto LABEL_4;
  }
  [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setTitleAlpha:0.0];
  floatingHeaderLayout = self->_floatingHeaderLayout;
  BOOL v15 = 1;
LABEL_14:
  [(PXCuratedLibrarySectionHeaderLayout *)floatingHeaderLayout setWantsOverBackgroundAppearance:v15];
LABEL_16:
}

- (void)invalidateFloatingHeaderButtons
{
  if (self->_isPerformingUpdate)
  {
    [(PXCuratedLibraryLayout *)self _updateFloatingHeaderButtons];
    return;
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_10:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_9:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout invalidateFloatingHeaderButtons]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXCuratedLibraryLayout.m", 786, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_10;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_9;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (PXCuratedLibraryLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PXCuratedLibraryLayout;
  uint64_t v6 = [(PXGLayout *)&v40 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_isPerformingInitialUpdate = 1;
    int64_t v8 = [v5 specManager];
    uint64_t v9 = [v8 spec];
    spec = v7->_spec;
    v7->_spec = (PXCuratedLibraryLayoutSpec *)v9;

    uint64_t v11 = [v5 specManager];
    [v11 registerChangeObserver:v7 context:PXCuratedLibrarySpecManagerObserverContext];

    [(PXGLayout *)v7 setContentSource:v7];
    [(PXGSplitLayout *)v7 setMode:2];
    [(PXGSplitLayout *)v7 setShouldExcludeTopAndBottomPaddingFromReferenceSize:1];
    uint64_t v12 = [(PXGLayout *)v7 axGroup];
    [v12 setAxRole:3];

    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastVisibleAreaAnchorsByZoomLevels = v7->_lastVisibleAreaAnchorsByZoomLevels;
    v7->_lastVisibleAreaAnchorsByZoomLevels = v13;

    BOOL v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    preferredVisibleAreaAnchorsByZoomLevels = v7->_preferredVisibleAreaAnchorsByZoomLevels;
    v7->_preferredVisibleAreaAnchorsByZoomLevels = v15;

    objc_storeStrong((id *)&v7->_viewModel, a3);
    viewModel = v7->_viewModel;
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    uint64_t v37 = __44__PXCuratedLibraryLayout_initWithViewModel___block_invoke;
    uint64_t v38 = &unk_1E5DCF3F0;
    double v18 = v7;
    unint64_t v39 = v18;
    [(PXCuratedLibraryViewModel *)viewModel performChanges:&v35];
    [(PXCuratedLibraryViewModel *)v7->_viewModel registerChangeObserver:v18 context:PXCuratedLibraryViewModelObserverContext_218348];
    double v19 = [(PXCuratedLibraryViewModel *)v7->_viewModel zoomablePhotosViewModel];
    [v19 registerChangeObserver:v18 context:PXZoomablePhotosViewModelObserverContext];

    uint64_t v20 = +[PXCuratedLibrarySettings sharedInstance];
    v18->_wantsBlurredBackground = [(PXCuratedLibraryLayoutSpec *)v7->_spec wantsBlurredBackground];
    v18->_blurredBackgroundSpriteIndedouble x = -1;
    v18->_contentBackgroundSpriteIndedouble x = -1;
    v18->_wantsStatusBarGradient = [(PXCuratedLibraryLayoutSpec *)v7->_spec wantsStatusBarGradient];
    v18->_statusBarGradientSpriteIndedouble x = -1;
    uint64_t v21 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    statusBarGradientAnimator = v18->_statusBarGradientAnimator;
    v18->_statusBarGradientAnimator = (PXNumberAnimator *)v21;

    [(PXNumberAnimator *)v18->_statusBarGradientAnimator registerChangeObserver:v18 context:PXCuratedLibraryLayoutStatusBarNumberAnimatorObserverContext];
    [(PXNumberAnimator *)v18->_statusBarGradientAnimator setLabel:@"statusBarGradientAnimator"];
    uint64_t v23 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    blurredBackgroundOpacityAnimator = v18->_blurredBackgroundOpacityAnimator;
    v18->_blurredBackgroundOpacityAnimator = (PXNumberAnimator *)v23;

    [(PXNumberAnimator *)v18->_blurredBackgroundOpacityAnimator registerChangeObserver:v18 context:PXCuratedLibraryLayoutBlurredBackgroundNumberAnimatorObserverContext];
    [(PXNumberAnimator *)v18->_blurredBackgroundOpacityAnimator setLabel:@"blurredBackgroundAnimator"];
    LODWORD(v25) = 1.0;
    v18->_statusBarGradientResizableCapInsetsIndedouble x = -[PXGLayout addResizableCapInsets:](v18, "addResizableCapInsets:", 0.0, 0.0, v25, 0.0);
    [v20 statusBarGradientHeight];
    v18->_statusBarGradientCGFloat Height = v26;
    [v20 statusBarGradientAlpha];
    v18->_statusBarGradientAlpha = v27;
    [v20 statusBarGradientAndStyleFadeDuration];
    v18->_statusBarGradientAndStyleFadeDuration = v28;
    if (v18->_updateFlags.isPerformingUpdate && (v18->_updateFlags.updated & 0x5F) != 0)
    {
      BOOL v33 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v34 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout initWithViewModel:]"];
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"PXCuratedLibraryLayout.m", 190, @"invalidating %lu after it already has been updated", 95, v35, v36, v37, v38);
    }
    else
    {
      v18->_updateFlags.needsUpdate |= 0x5FuLL;
      if (!v18->_postUpdateFlags.isPerformingUpdate || (v18->_postUpdateFlags.updated & 0xE000) == 0)
      {
        v18->_postUpdateFlags.needsUpdate |= 0xE000uLL;
        long long v29 = +[PXPhotosGridSettings sharedInstance];
        [v29 addDeferredKeyObserver:v18];

        uint64_t v30 = [v5 libraryFilterState];
        libraryFilterState = v18->_libraryFilterState;
        v18->_libraryFilterState = (PXLibraryFilterState *)v30;

        [(PXLibraryFilterState *)v18->_libraryFilterState registerChangeObserver:v18 context:PXLibraryFilterStateObservationContext_40006];
        goto LABEL_7;
      }
      BOOL v33 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v34 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout initWithViewModel:]"];
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"PXCuratedLibraryLayout.m", 191, @"invalidating %lu after it already has been updated", 57344, v35, v36, v37, v38);
    }

    abort();
  }
LABEL_7:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong(&self->_dominantHeroPreferencesBeforeTransition, 0);
  objc_storeStrong((id *)&self->_lastPresentedDayAssetCollectionReference, 0);
  objc_storeStrong(&self->_lastVisibleDominantObjectReference, 0);
  objc_storeStrong((id *)&self->_lastHitSpriteReference, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_floatingHeaderLayout, 0);
  objc_storeStrong((id *)&self->_allPhotosBodyLayout, 0);
  objc_storeStrong((id *)&self->_libraryBodyLayout, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundOpacityAnimator, 0);
  objc_storeStrong((id *)&self->_statusBarGradientAnimator, 0);
  objc_storeStrong((id *)&self->_spriteProbe, 0);
  objc_storeStrong((id *)&self->_preferredVisibleAreaAnchorsByZoomLevels, 0);
  objc_storeStrong((id *)&self->_lastVisibleAreaAnchorsByZoomLevels, 0);
  objc_storeStrong((id *)&self->_summaryHelper, 0);
}

- (void)setLibraryFilterState:(id)a3
{
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setDominantHeroPreferencesBeforeTransition:(id)a3
{
}

- (id)dominantHeroPreferencesBeforeTransition
{
  return self->_dominantHeroPreferencesBeforeTransition;
}

- (void)setLastPresentedDayAssetCollectionReference:(id)a3
{
}

- (PXAssetCollectionReference)lastPresentedDayAssetCollectionReference
{
  return self->_lastPresentedDayAssetCollectionReference;
}

- (PXGSpriteReference)lastHitSpriteReference
{
  return self->_lastHitSpriteReference;
}

- (void)setCanHandleVisibleRectRejection:(BOOL)a3
{
  self->_canHandleVisibleRectRejection = a3;
}

- (BOOL)canHandleVisibleRectRejection
{
  return self->_canHandleVisibleRectRejection;
}

- (CGRect)presentedVisibleRect
{
  double x = self->_presentedVisibleRect.origin.x;
  double y = self->_presentedVisibleRect.origin.y;
  double width = self->_presentedVisibleRect.size.width;
  double height = self->_presentedVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = NSStringFromSelector(sel_enableNewActionMenu);
  if ([v6 isEqualToString:v7])
  {
  }
  else
  {
    int64_t v8 = NSStringFromSelector(sel_enableContentFiltering);
    int v9 = [v6 isEqualToString:v8];

    if (!v9) {
      goto LABEL_10;
    }
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x30;
      goto LABEL_10;
    }
LABEL_8:
    if ((self->_updateFlags.updated & 0x30) != 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      double v14 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout settings:changedValueForKey:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXCuratedLibraryLayout.m", 2014, @"invalidating %lu after it already has been updated", 48);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 48;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_10:
}

- (id)axLocalizedLabel
{
  uint64_t v4 = [(PXCuratedLibraryLayout *)self viewModel];
  uint64_t v5 = [v4 zoomLevel];

  id v6 = 0;
  uint64_t v7 = @"PXCuratedLibraryYearsZoomLevelButtonTitle";
  switch(v5)
  {
    case 0:
      goto LABEL_6;
    case 1:
      goto LABEL_5;
    case 2:
      uint64_t v7 = @"PXCuratedLibraryMonthsZoomLevelButtonTitle";
      goto LABEL_5;
    case 3:
      uint64_t v7 = @"PXCuratedLibraryDaysZoomLevelButtonTitle";
      goto LABEL_5;
    case 4:
      uint64_t v7 = @"PXCuratedLibraryAllPhotosZoomLevelButtonTitle";
LABEL_5:
      id v6 = PXLocalizedStringFromTable(v7, @"PhotosUICore");
LABEL_6:
      return v6;
    default:
      int v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryLayout.m" lineNumber:2007 description:@"Code which should be unreachable has been reached"];

      abort();
  }
}

- (int64_t)viewModel:(id)a3 transitionTypeFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  int64_t v8 = +[PXCuratedLibrarySettings sharedInstance];
  int v9 = [(PXCuratedLibraryLayout *)self spec];
  if (objc_msgSend(v8, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", a4, objc_msgSend(v9, "sizeClass"), objc_msgSend(v9, "layoutOrientation"), objc_msgSend(v9, "layoutStyle")))
  {
    int64_t v10 = 2;
  }
  else if (objc_msgSend(v8, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", a5, objc_msgSend(v9, "sizeClass"), objc_msgSend(v9, "layoutOrientation"), objc_msgSend(v9, "layoutStyle")))
  {
    int64_t v10 = 2;
  }
  else
  {
    int64_t v10 = 1;
  }

  return v10;
}

- (id)viewModel:(id)a3 dominantAssetCollectionReferenceForZoomLevel:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  int64_t v8 = [v7 viewModel:v6 dominantAssetCollectionReferenceForZoomLevel:a4];

  return v8;
}

- (void)viewModel:(id)a3 didTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  id v6 = [(PXCuratedLibraryLayout *)self dominantHeroPreferencesBeforeTransition];
  uint64_t v7 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  [v7 setDominantHeroPreferences:v6];

  [(PXCuratedLibraryLayout *)self setDominantHeroPreferencesBeforeTransition:0];
}

- (void)viewModel:(id)a3 willTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  id v14 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  int64_t v8 = [v14 dominantHeroPreferences];
  [(PXCuratedLibraryLayout *)self setDominantHeroPreferencesBeforeTransition:v8];

  if (a4 >= a5) {
    int64_t v9 = a5;
  }
  else {
    int64_t v9 = a4;
  }
  if (a4 <= a5) {
    int64_t v10 = a5;
  }
  else {
    int64_t v10 = a4;
  }
  if (v9 == 1 && v10 == 2)
  {
    uint64_t v11 = [(PXCuratedLibraryLayout *)self spec];
    uint64_t v12 = +[PXCuratedLibrarySettings sharedInstance];
    int v13 = objc_msgSend(v12, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", 2, objc_msgSend(v11, "sizeClass"), objc_msgSend(v11, "layoutOrientation"), objc_msgSend(v11, "layoutStyle"));

    if (v13) {
      [v14 setPrefersDominantHero:1 forZoomLevel:2];
    }
  }
}

- (CGPoint)anchor:(id)a3 visibleRectOriginForProposedVisibleRect:(CGRect)a4 forLayout:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v11 = (PXCuratedLibraryLayout *)a5;
  if (v11 != self) {
    goto LABEL_11;
  }
  uint64_t v12 = [a3 context];
  int v13 = [v12 objectForKeyedSubscript:@"fromZoomLevel"];
  uint64_t v14 = [v13 integerValue];

  id v15 = [v12 objectForKeyedSubscript:@"toZoomLevel"];
  uint64_t v16 = [v15 integerValue];

  if ((unint64_t)(v16 - 1) >= 2)
  {
    if (v16 != 3 || v14 != 4) {
      goto LABEL_8;
    }
    [(PXCuratedLibraryLayout *)v11 _adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop:y];
  }
  else
  {
    uint64_t v24 = 0;
    [(PXCuratedLibraryLayout *)v11 adjustedTargetVisibleTopForProposedTargetVisibleTop:&v24 scrollingVelocity:y decelerationRate:NAN];
  }
  double y = v17;
LABEL_8:
  double v18 = [v12 objectForKeyedSubscript:@"fromBottomPaddingAreaIsFullyVisible"];

  if (v18)
  {
    double v19 = [v12 objectForKeyedSubscript:@"fromBottomPaddingAreaIsFullyVisible"];
    uint64_t v20 = [v19 BOOLValue];

    -[PXCuratedLibraryLayout _adjustedTargetVisibleTopToAccomodateFromBottomPaddedAreaVisibility:proposedVisibleRect:](v11, "_adjustedTargetVisibleTopToAccomodateFromBottomPaddedAreaVisibility:proposedVisibleRect:", v20, x, y, width, height);
    double y = v21;
  }

LABEL_11:
  double v22 = x;
  double v23 = y;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (id)offscreenEffectForCapturedSnapshotAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_blurredBackgroundEffect;
}

- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (void)_updateLibraryBodyLayoutLateralMargin
{
  [(PXCuratedLibraryLayout *)self lateralMargin];
  double v4 = v3;
  id v5 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  [v5 setLateralMargin:v4];
}

- (void)setLastHitSpriteReference:(id)a3
{
  objc_storeStrong((id *)&self->_lastHitSpriteReference, a3);
  id v5 = a3;
  [(PXCuratedLibrarySectionedLayout *)self->_libraryBodyLayout setLastHitSpriteReference:v5];
}

- (CGRect)sectionBoundariesForAssetCollectionReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  [v5 sectionBoundariesForAssetCollectionReference:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", v5, v7, v9, v11, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)enumerateVisibleAssetReferencesUsingBlock:(id)a3
{
  id v4 = a3;
  [(PXGLayout *)self visibleRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  id v14[2] = __68__PXCuratedLibraryLayout_enumerateVisibleAssetReferencesUsingBlock___block_invoke;
  v14[3] = &unk_1E5DB6920;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  -[PXGLayout enumerateSpritesInRect:usingBlock:](self, "enumerateSpritesInRect:usingBlock:", v14, v6, v8, v10, v12);
}

void __68__PXCuratedLibraryLayout_enumerateVisibleAssetReferencesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v10 = a7;
  if (*(unsigned char *)(a6 + 1) == 2)
  {
    id v12 = v10;
    double v11 = [*(id *)(a1 + 32) objectReferenceForSpriteIndex:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      PXRectWithCenterAndSize();
    }

    id v10 = v12;
  }
}

- (void)enumerateVisibleAssetsSectionSublayoutsUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  [v5 visibleRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PXCuratedLibraryLayout_enumerateVisibleAssetsSectionSublayoutsUsingBlock___block_invoke;
  v15[3] = &unk_1E5DC9488;
  id v16 = v4;
  id v14 = v4;
  objc_msgSend(v5, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v15, v7, v9, v11, v13);
}

uint64_t __76__PXCuratedLibraryLayout_enumerateVisibleAssetsSectionSublayoutsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)topMostAssetCollectionReference
{
}

- (id)topMostAssetCollectionInRect:(CGRect)a3 ignoreChapterHeaders:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__39980;
  double v31 = __Block_byref_object_dispose__39981;
  id v32 = 0;
  double v10 = [(PXCuratedLibraryLayout *)self viewModel];
  if ([v10 zoomLevel] == 4)
  {
    double v11 = [v10 currentDataSource];
    id v12 = [v11 firstAssetCollection];
  }
  else
  {
    double v13 = +[PXCuratedLibrarySettings sharedInstance];
    [v13 minimumVisibleHeightForTopMostSection];
    uint64_t v15 = v14;

    libraryBodyLayout = self->_libraryBodyLayout;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __76__PXCuratedLibraryLayout_topMostAssetCollectionInRect_ignoreChapterHeaders___block_invoke;
    v18[3] = &unk_1E5DB2E20;
    double v21 = x;
    double v22 = y;
    double v23 = width;
    double v24 = height;
    uint64_t v25 = v15;
    v18[4] = self;
    double v20 = &v27;
    BOOL v26 = a4;
    id v19 = v10;
    -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](libraryBodyLayout, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v18, x, y, width, height);

    id v12 = (id)v28[5];
  }

  _Block_object_dispose(&v27, 8);
  return v12;
}

void __76__PXCuratedLibraryLayout_topMostAssetCollectionInRect_ignoreChapterHeaders___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, BOOL *a8)
{
  CGRect v22 = CGRectIntersection(*(CGRect *)&a3, *(CGRect *)(a1 + 56));
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  if (!CGRectIsEmpty(v22))
  {
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    if (CGRectGetHeight(v23) >= *(double *)(a1 + 88))
    {
      uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 1192) presentedDataSource];
      v20[0] = [v15 identifier];
      v20[1] = a2;
      int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      uint64_t v16 = [v15 assetCollectionAtSectionIndexPath:v20];
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      double v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      if (*(unsigned char *)(a1 + 96)) {
        BOOL v19 = !PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), [*(id *)(a1 + 40) zoomLevel]);
      }
      else {
        BOOL v19 = 1;
      }
      *a8 = v19;
    }
  }
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(PXCuratedLibraryLayout *)self _currentBodyLayout];
  if (v8)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v8, x, y, width, height);
    if (!CGRectIsNull(v12)) {
      PXPointIsNull();
    }
  }
  double v9 = _Block_copy(0);

  return v9;
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(PXCuratedLibraryLayout *)self _currentBodyLayout];
  if (v8)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v8, x, y, width, height);
    if (!CGRectIsNull(v12)) {
      PXPointIsNull();
    }
  }
  double v9 = _Block_copy(0);

  return v9;
}

uint64_t __62__PXCuratedLibraryLayout_locationNamesFutureForContentInRect___block_invoke()
{
  return 0;
}

uint64_t __66__PXCuratedLibraryLayout_dateIntervalFutureForContentInRect_type___block_invoke()
{
  return 0;
}

void __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  double v6 = [*(id *)(a1 + 32) objectReferenceForSpriteIndex:a2];
  if (v6)
  {
    double v7 = v6;
    [*(id *)(a1 + 32) setLastVisibleDominantObjectReference:v6];
    double v6 = v7;
    *a4 = 1;
  }
}

void __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke_3;
  v8[3] = &unk_1E5DB2DD0;
  int v14 = *(_DWORD *)(a1 + 72);
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  long long v12 = *(_OWORD *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 64);
  id v11 = v3;
  id v7 = v3;
  [v4 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v8];
}

void __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 80) == a2)
  {
    id v4 = *(id *)(a1 + 32);
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) objectReferenceForSpriteIndex:a2];
  }
  id v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 40) spriteReferenceForSpriteIndex:a2 objectReference:v4];
  double v7 = *(double *)off_1E5DAAF10;
  double v8 = *((double *)off_1E5DAAF10 + 2);
  uint64_t v9 = *(void *)(a1 + 56);
  if ((unint64_t)(v9 - 1) < 2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v12 = [*(id *)(a1 + 40) viewModel];
      uint64_t v13 = [v12 assetsDataSourceManager];
      int v14 = [v13 dataSourceForZoomLevel:*(void *)(a1 + 56)];

      uint64_t v15 = [v14 objectReferenceNearestToObjectReference:v5];
      if (v14) {
        [v14 indexPathForObjectReference:v15];
      }
      if (*(void *)off_1E5DAAED8)
      {
        int v21 = 1;
        BOOL v20 = [v14 numberOfSections] == 1;
      }
      else
      {
        BOOL v20 = 0;
        int v21 = 0;
      }
      if (*(void *)(a1 + 72) == 3
        && *(void *)(a1 + 56) == 2
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v23 = v5;
        double v50 = [v15 assetCollection];
        v48 = v23;
        double v24 = [v23 keyAssetReference];
        uint64_t v25 = [v24 asset];
        v49 = [v25 creationDate];

        BOOL v26 = [v50 startDate];
        uint64_t v27 = [v50 endDate];
        char v47 = objc_msgSend(v49, "px_isBetweenDate:andDate:", v26, v27);

        if (v47)
        {
          uint64_t v10 = 0;
        }
        else
        {
          v43 = [v50 startDate];
          [v49 timeIntervalSinceDate:v43];
          double v45 = v44;

          if (v45 < 0.0) {
            uint64_t v10 = 1;
          }
          else {
            uint64_t v10 = -1;
          }
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
      int v21 = 0;
      uint64_t v10 = 0;
    }
    double v28 = [*(id *)(a1 + 40) libraryBodyLayout];
    uint64_t v29 = [v28 spec];
    [v29 defaultInterlayoutSpacingForZoomLevel:*(void *)(a1 + 56)];
    double v31 = v30 + v30;

    double v32 = -0.0;
    if (v21) {
      double v33 = -0.0;
    }
    else {
      double v33 = v31;
    }
    double v19 = v7 + v33;
    if (!v20) {
      double v32 = v31;
    }
    double v18 = v8 + v32;
    if (*(void *)(a1 + 72) == 1 && *(void *)(a1 + 56) == 2)
    {
      uint64_t v34 = [*(id *)(a1 + 40) spec];
      if ([v34 allowsPaginatedScrollingInYearsAndMonths])
      {
        uint64_t v35 = +[PXCuratedLibrarySettings sharedInstance];
        int v36 = objc_msgSend(v35, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", *(void *)(a1 + 56), objc_msgSend(v34, "sizeClass"), objc_msgSend(v34, "layoutOrientation"), objc_msgSend(v34, "layoutStyle"));

        if (v36)
        {
          [*(id *)(a1 + 40) visibleRect];
          double v18 = CGRectGetHeight(v51) / 3.0;
          double v19 = v18;
        }
      }
    }
    uint64_t v11 = 1;
  }
  else
  {
    if (v9 != 3)
    {
      if (!v9)
      {
        id v46 = [MEMORY[0x1E4F28B00] currentHandler];
        [v46 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"PXCuratedLibraryLayout.m" lineNumber:1543 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      uint64_t v10 = 0;
      uint64_t v11 = 1;
      goto LABEL_13;
    }
    uint64_t v16 = [*(id *)(a1 + 40) spec];
    char v17 = [v16 isTopSafeAreaFullyCovered];

    if (v17)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 3;
LABEL_13:
      double v18 = v8;
      double v19 = v7;
      goto LABEL_39;
    }
    [*(id *)(a1 + 40) safeAreaInsets];
    uint64_t v10 = 0;
    double v19 = -v22;
    uint64_t v11 = 3;
    double v18 = v8;
  }
LABEL_39:
  objc_msgSend(*(id *)(a1 + 48), "keepVisiblePortionOfSpriteWithReference:referencingOptions:padding:visuallyStableForAttribute:", v6, v11, 1, v7, *((double *)off_1E5DAAF10 + 1), v8, *((double *)off_1E5DAAF10 + 3));
  if (v10)
  {
    [*(id *)(a1 + 40) safeAreaInsets];
    double v38 = v37;
    [*(id *)(a1 + 40) visibleRect];
    double v39 = CGRectGetHeight(v52) * 0.5 - v38;
    objc_super v40 = *(void **)(a1 + 48);
    if (v10 < 0)
    {
      [v40 keepEdge:3 ofSpriteWithReference:v6 referencingOptions:v11 lessThanOrEqualToVisibleEdge:1 offset:v39];
      goto LABEL_45;
    }
    uint64_t v41 = v6;
    uint64_t v42 = v11;
  }
  else
  {
    [*(id *)(a1 + 48) keepEdge:3 ofSpriteWithReference:v6 referencingOptions:v11 lessThanOrEqualToVisibleEdge:3 offset:-v18];
    objc_super v40 = *(void **)(a1 + 48);
    uint64_t v41 = v6;
    uint64_t v42 = v11;
    double v39 = v19;
  }
  [v40 keepEdge:1 ofSpriteWithReference:v41 referencingOptions:v42 greaterThanOrEqualToVisibleEdge:1 offset:v39];
LABEL_45:
}

- (id)createCuratedLibraryLayoutTransitionIfNeededWithContext:(int64_t)a3
{
  return +[PXCuratedLibraryLayoutAnimationHelper createTransitionIfNeededForLayout:self context:a3];
}

- (id)createDefaultAnimationForCurrentContext
{
  return [(PXGLayout *)self createCuratedLibraryLayoutAnimationIfNeededWithContext:1];
}

- (void)animationDidComplete:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PXCuratedLibraryLayout_animationDidComplete___block_invoke;
  v6[3] = &unk_1E5DD32A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __47__PXCuratedLibraryLayout_animationDidComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteAnimation:*(void *)(a1 + 40) isRunning:0];
}

- (void)_noteAnimation:(id)a3 isRunning:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((PXCuratedLibraryAnimationGetContext(v6) & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    id v7 = [(PXCuratedLibraryLayout *)self viewModel];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__PXCuratedLibraryLayout__noteAnimation_isRunning___block_invoke;
    v13[3] = &__block_descriptor_33_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
    BOOL v14 = v4;
    [v7 performChanges:v13];

    double v8 = +[PXCuratedLibraryAnimationTracker sharedTracker];
    uint64_t v9 = v8;
    if (v4)
    {
      [v8 zoomLevelTransitionPreparationDidBegin:v6];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PXCuratedLibraryLayout__noteAnimation_isRunning___block_invoke_2;
      block[3] = &unk_1E5DD32A8;
      id v11 = v9;
      id v12 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      [v8 zoomLevelTransitionDidEnd:v6];
    }
  }
}

uint64_t __51__PXCuratedLibraryLayout__noteAnimation_isRunning___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomLevelTransitionPhase:2 * *(unsigned __int8 *)(a1 + 32)];
}

uint64_t __51__PXCuratedLibraryLayout__noteAnimation_isRunning___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) zoomLevelTransitionDidBegin:*(void *)(a1 + 40)];
}

- (void)enumerateScrollablePagesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PXCuratedLibraryLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke;
  v11[3] = &unk_1E5DC4C40;
  id v12 = v6;
  uint64_t v13 = v8;
  uint64_t v14 = v9;
  id v10 = v6;
  [v7 enumerateScrollablePagesWithOptions:a3 usingBlock:v11];
}

uint64_t __73__PXCuratedLibraryLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  uint64_t v11 = *(void *)(a1 + 32);
  CGRect v15 = CGRectOffset(*(CGRect *)&a5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  id v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128))(v11 + 16);
  return v12(v11, a2, a3, a4, (__n128)v15.origin, *(__n128 *)&v15.origin.y, (__n128)v15.size, *(__n128 *)&v15.size.height);
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryLayout;
  id v3 = [(PXGLayout *)&v12 hitTestResultForSpriteIndex:*(void *)&a3];
  BOOL v4 = [v3 identifier];
  if ([v4 isEqualToString:@"PXGHitTestUserDataIdentifierItem"])
  {
    id v5 = [v3 userData];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_5;
    }
    id v7 = [PXCuratedLibraryHitTestResult alloc];
    BOOL v4 = [v3 spriteReference];
    uint64_t v8 = [v3 layout];
    uint64_t v9 = [v3 userData];
    uint64_t v10 = [(PXCuratedLibraryHitTestResult *)v7 initWithControl:1 spriteReference:v4 layout:v8 assetReference:v9];

    id v3 = (void *)v10;
  }

LABEL_5:
  return v3;
}

- (id)presentedItemsGeometryForDataSource:(id)a3
{
  id v4 = a3;
  if ([(PXCuratedLibraryLayout *)self presentedZoomLevel] == 4)
  {
    id v5 = [(PXCuratedLibraryLayout *)self allPhotosLayout];
    id v6 = [v5 presentedItemsGeometryForDataSource:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (CGPoint)_adjustInitialVisibleRect:(CGRect)a3 inLayout:(id)a4 forRecentSection:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  objc_super v12 = (double *)MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v14 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  CGRect v15 = [v14 sublayoutAtIndex:a5 loadIfNeeded:0];
  objc_msgSend(v15, "convertRect:fromLayout:", v11, x, y, width, height);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29.origin.double x = v17;
    v29.origin.double y = v19;
    v29.size.double width = v21;
    v29.size.double height = v23;
    if (!CGRectIsNull(v29))
    {
      id v24 = v15;
      [(PXGLayout *)self safeAreaInsets];
      PXEdgeInsetsForEdges();
    }
  }
  double v25 = *v12;

  double v26 = v25;
  double v27 = v13;
  result.double y = v27;
  result.double x = v26;
  return result;
}

void __78__PXCuratedLibraryLayout__adjustInitialVisibleRect_inLayout_forRecentSection___block_invoke(uint64_t a1, unsigned char *a2, double a3, double a4, double a5, double a6)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  *a2 = 1;
}

double __67__PXCuratedLibraryLayout_createAnchorForScrollingToInitialPosition__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = (id *)(a1 + 32);
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v11);
  objc_msgSend(WeakRetained, "_adjustInitialVisibleRect:inLayout:forRecentSection:", v12, *(void *)(a1 + 40), a3, a4, a5, a6);
  double v15 = v14;

  return v15;
}

- (CGRect)fullyVisibleRect
{
  [(PXGLayout *)self visibleRect];
  [(PXGLayout *)self safeAreaInsets];
  id v3 = [(PXCuratedLibraryLayout *)self viewModel];
  id v4 = [v3 styleGuide];

  if ([v4 secondaryToolbarPlacement] == 2)
  {
    [v4 secondaryToolbarPadding];
    [v4 secondaryToolbarSize];
  }
  PXEdgeInsetsInsetRect();
}

- (double)bottomMargin
{
  id v3 = [(PXCuratedLibraryLayout *)self viewModel];
  uint64_t v4 = [v3 zoomLevel];

  if (v4 == 2)
  {
    id v6 = [(PXCuratedLibraryLayout *)self spec];
    id v7 = [v6 monthsLayoutMetrics];
    goto LABEL_5;
  }
  double v5 = 0.0;
  if (v4 == 1)
  {
    id v6 = [(PXCuratedLibraryLayout *)self spec];
    id v7 = [v6 yearsLayoutMetrics];
LABEL_5:
    uint64_t v8 = v7;
    [v7 padding];
    double v5 = v9;
  }
  return v5;
}

- (double)estimatedHeaderHeight
{
  id v2 = [(PXCuratedLibraryLayout *)self _currentFloatingHeaderSpec];
  [v2 maximumTitleSubtitleHeight];
  double v4 = v3;

  return v4;
}

- (void)enumerateSectionBoundariesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PXCuratedLibraryLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke;
  v11[3] = &unk_1E5DC4C40;
  id v12 = v6;
  uint64_t v13 = v8;
  uint64_t v14 = v9;
  id v10 = v6;
  [v7 enumerateSectionBoundariesWithOptions:a3 usingBlock:v11];
}

uint64_t __75__PXCuratedLibraryLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  uint64_t v11 = *(void *)(a1 + 32);
  CGRect v15 = CGRectOffset(*(CGRect *)&a5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  id v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128))(v11 + 16);
  return v12(v11, a2, a3, a4, (__n128)v15.origin, *(__n128 *)&v15.origin.y, (__n128)v15.size, *(__n128 *)&v15.size.height);
}

- (void)_enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = [(PXCuratedLibraryLayout *)self libraryBodyLayout];
  -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PXCuratedLibraryLayout__enumerateHeroSpritesInRect_usingBlock___block_invoke;
  v21[3] = &unk_1E5DB2D30;
  id v22 = v10;
  id v23 = v9;
  v21[4] = self;
  id v19 = v10;
  id v20 = v9;
  objc_msgSend(v19, "enumerateHeroSpritesInRect:usingBlock:", v21, v12, v14, v16, v18);
}

uint64_t __65__PXCuratedLibraryLayout__enumerateHeroSpritesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = [*(id *)(a1 + 32) convertSpriteIndex:a2 fromDescendantLayout:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", *(void *)(a1 + 40), a4, a5, a6, a7);
  double v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  return v15(v13, v14, a3);
}

- (double)adjustedTargetVisibleTopForProposedTargetVisibleTop:(double)a3 scrollingVelocity:(double)a4 decelerationRate:(int64_t *)a5
{
  id v7 = +[PXCuratedLibrarySettings sharedInstance];
  [(PXGLayout *)self visibleRect];
  [(PXCuratedLibraryLayout *)self fullyVisibleRect];
  [v7 scrollSnapMinimumSpeed];
  if (fabs(a4) < v8)
  {
    double v10 = a3;
  }
  else
  {
    id v9 = [(PXCuratedLibraryLayout *)self spec];
    if ([v9 userInterfaceIdiom] == 4)
    {
    }
    else
    {

      int64_t v11 = [(PXCuratedLibraryLayout *)self presentedZoomLevel];
      if ((unint64_t)(v11 - 1) < 2)
      {
        [(PXGLayout *)self safeAreaInsets];
        double v12 = [(PXCuratedLibraryLayout *)self viewModel];
        uint64_t v13 = [v12 styleGuide];

        if ([v13 secondaryToolbarPlacement] == 3)
        {
          [v13 secondaryToolbarContentInsets];
          [v13 secondaryToolbarSize];
        }
        uint64_t v14 = [(PXCuratedLibraryLayout *)self spec];
        if ([v14 sizeClass] == 1) {
          [v14 layoutOrientation];
        }
        PXEdgeInsetsInsetRect();
      }
      if (v11 == 3)
      {
        double v15 = [PXScrollSnapController alloc];
        PXEdgeInsetsBetweenRects();
      }
    }
    double v10 = a3;
  }
  [(PXGSplitLayout *)self padding];
  if (v16 > 0.0)
  {
    if (a4 >= 0.0) {
      [(PXGLayout *)self lastScrollDirection];
    }
    if (a4 <= 0.0) {
      [(PXGLayout *)self lastScrollDirection];
    }
    [(PXGLayout *)self visibleRect];
    [(PXGLayout *)self safeAreaInsets];
    PXEdgeInsetsInsetRect();
  }

  return v10;
}

- (double)_adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop:(double)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  int v6 = -1;
  [(PXGLayout *)self safeAreaInsets];
  [(PXGLayout *)self visibleRect];
  PXEdgeInsetsInsetRect();
}

void __100__PXCuratedLibraryLayout__adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop___block_invoke()
{
}

uint64_t __100__PXCuratedLibraryLayout__adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop___block_invoke_2(uint64_t result, int a2, uint64_t a3, unsigned char *a4)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (double)_adjustedTargetVisibleTopToAccomodateFromBottomPaddedAreaVisibility:(BOOL)a3 proposedVisibleRect:(CGRect)a4
{
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  *a5 = a3;
  int v6 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v7 = [(PXCuratedLibraryLayout *)self _currentBodyLayout];
  int64_t v8 = [v6 indexOfSublayout:v7];

  return v8;
}

- (void)_updateFloatingHeaderSelectionTitle
{
  double v3 = [(PXCuratedLibraryLayout *)self viewModel];
  unint64_t v4 = [v3 selectedAssetsTypedCount];
  uint64_t v6 = v5;

  uint64_t v7 = [(PXCuratedLibraryLayout *)self spec];
  uint64_t v8 = [v7 userInterfaceIdiom];

  id v16 = 0;
  if (v8 == 4 && v4 >= 2)
  {
    PXLocalizedAssetCountForUsage(v4, v6, 0, 1);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setSelectionTitle:v16];
  if (v16)
  {
    id v9 = [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout longestPossibleSelectionTitle];

    if (!v9)
    {
      uint64_t v10 = 0;
      double v11 = 0.0;
      do
      {
        double v12 = PXLocalizedAssetCountForUsage(999000, v10, 0, 1);
        [v12 sizeWithAttributes:0];
        if (v13 > v11)
        {
          double v14 = v13;
          id v15 = v12;

          id v9 = v15;
          double v11 = v14;
        }

        ++v10;
      }
      while (v10 != 3);
      [(PXCuratedLibrarySectionHeaderLayout *)self->_floatingHeaderLayout setLongestPossibleSelectionTitle:v9];
    }
  }
}

id __54__PXCuratedLibraryLayout__updateFloatingHeaderButtons__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) enableNewActionMenu])
  {
    id v2 = [*(id *)(a1 + 40) ellipsisButtonActionPerformerWithAssetCollectionReferenceProvider:*(void *)(a1 + 48)];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)_updateBlurredBackgroundOpacity
{
  blurredBackgroundSpriteIndedouble x = self->_blurredBackgroundSpriteIndex;
  if (blurredBackgroundSpriteIndex != -1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __57__PXCuratedLibraryLayout__updateBlurredBackgroundOpacity__block_invoke;
    v3[3] = &unk_1E5DB81C0;
    v3[4] = self;
    [(PXGLayout *)self modifySpritesInRange:blurredBackgroundSpriteIndex | 0x100000000 fullState:v3];
  }
}

float __57__PXCuratedLibraryLayout__updateBlurredBackgroundOpacity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(*(void *)(a1 + 32) + 1112) presentationValue];
  float result = v4;
  **(float **)(a3 + 24) = result;
  return result;
}

- (void)_invalidateBlurredBackgroundOpacity
{
  if (self->_isPerformingUpdate)
  {
    [(PXCuratedLibraryLayout *)self _updateBlurredBackgroundOpacity];
    return;
  }
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_10:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_9:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXCuratedLibraryLayout _invalidateBlurredBackgroundOpacity]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXCuratedLibraryLayout.m", 724, @"invalidating %lu after it already has been updated", 2048);

      abort();
    }
    goto LABEL_10;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_9;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 2048;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

uint64_t __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

uint64_t __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

void __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (float32x2_t *)a3[2];
  CGFloat v6 = *(double *)(a1 + 40);
  CGFloat v7 = *(double *)(a1 + 48);
  CGFloat v8 = *(double *)(a1 + 56);
  CGFloat v9 = *(double *)(a1 + 64);
  v18.origin.double x = v6;
  v18.origin.double y = v7;
  v18.size.double width = v8;
  v18.size.double height = v9;
  CGFloat MidX = CGRectGetMidX(v18);
  v19.origin.double x = v6;
  v19.origin.double y = v7;
  v19.size.double width = v8;
  v19.size.double height = v9;
  CGFloat MidY = CGRectGetMidY(v19);
  v20.origin.double x = v6;
  v20.origin.double y = v7;
  v20.size.double width = v8;
  v20.size.double height = v9;
  CGFloat Width = CGRectGetWidth(v20);
  v21.origin.double x = v6;
  v21.origin.double y = v7;
  v21.size.double width = v8;
  v21.size.double height = v9;
  CGFloat Height = CGRectGetHeight(v21);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)uint64_t v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = (float32x2_t)0x402A000000000000;
  void v5[3] = vcvt_f32_f64(v13);
  *(float32x4_t *)(a3[3] + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 72)), *(float64x2_t *)(a1 + 88));
  if (*(unsigned char *)(a1 + 112)) {
    char v14 = 9;
  }
  else {
    char v14 = 0;
  }
  id v15 = (float32x2_t *)a3[4];
  v15->i8[1] = v14;
  float v16 = *(double *)(a1 + 104);
  v15[1] = vmul_n_f32(v5[3], v16);
  *(_WORD *)(a3[4] + 32) = *(_WORD *)(*(void *)(a1 + 32) + 1160);
  PXGSectionedSpriteTagMake();
}

- (void)_invalidateBlurredBackgroundSnapshot
{
}

uint64_t __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (void)dealloc
{
  [(PXGDiagnosticsSpriteProbe *)self->_spriteProbe setActive:0];
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryLayout;
  [(PXGLayout *)&v3 dealloc];
}

@end