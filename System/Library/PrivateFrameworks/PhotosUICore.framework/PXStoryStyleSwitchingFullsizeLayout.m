@interface PXStoryStyleSwitchingFullsizeLayout
- (BOOL)_handleSwitchStyle:(id)a3 inGroup:(id)a4;
- (BOOL)_isFakeAXSpriteIndex:(unint64_t)a3;
- (BOOL)allowsSublayoutUpdateCycleAssertions;
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)layout:(id)a3 shouldPreventFaultOutOfSublayout:(id)a4;
- (CGRect)axFrame;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSArray)displayedStyleInfos;
- (NSAttributedString)styleSwitcherTitleString;
- (PXCArrayStore)fullsizeFrameRectsStore;
- (PXGAXResponder)axNextResponder;
- (PXGPageControlConfiguration)pageControlConfiguration;
- (PXStoryChromeButtonConfiguration)restartButtonConfiguration;
- (PXStoryFullsizeLayout)dominantFullsizePlayerLayout;
- (PXStoryModel)model;
- (PXStoryStyleSelectionDataSource)dataSource;
- (PXStoryStyleSwitchingFullsizeLayout)init;
- (PXStoryStyleSwitchingFullsizeLayout)initWithModel:(id)a3;
- (_NSRange)displayedStyleRange;
- (double)relativeZPositionAboveLegibilityGradients;
- (id)_axAssetsVisible;
- (id)_axSongArtistName;
- (id)_axSongTitle;
- (id)_axStyleTitle;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (id)axContentInfoAtSpriteIndex:(unsigned int)a3;
- (id)axSpriteIndexes;
- (id)axVisibleSpriteIndexes;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)pageControlVersion;
- (int64_t)restartButtonVersion;
- (int64_t)styleSwitcherTitleVersion;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)_axSwitcherFractionDenominator;
- (unint64_t)_axSwitcherFractionNumerator;
- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4;
- (void)_configureTimelineLayout:(id)a3 maskLayout:(id)a4 forIndex:(int64_t)a5;
- (void)_handlePageControl:(id)a3;
- (void)_handleRestartButton:(id)a3;
- (void)_invalidateAXSpriteIndexes;
- (void)_invalidateContent;
- (void)_invalidateDisplayedStyleRange;
- (void)_invalidateDisplayedStyles;
- (void)_invalidatePageControl;
- (void)_invalidateRestartButton;
- (void)_invalidateTitleString;
- (void)_updateAXSpriteIndexes;
- (void)_updateContent;
- (void)_updateDisplayedStyleRange;
- (void)_updateDisplayedStyles;
- (void)_updatePageControl;
- (void)_updateRestartButton;
- (void)_updateTitleString;
- (void)alphaDidChange;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)didUpdate;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setAxNextResponder:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDisplayedStyleInfos:(id)a3;
- (void)setDisplayedStyleRange:(_NSRange)a3;
- (void)setPageControlConfiguration:(id)a3;
- (void)setPageControlVersion:(int64_t)a3;
- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3;
- (void)setRestartButtonConfiguration:(id)a3;
- (void)setRestartButtonVersion:(int64_t)a3;
- (void)setStyleSwitcherTitleString:(id)a3;
- (void)setStyleSwitcherTitleVersion:(int64_t)a3;
- (void)update;
- (void)willUpdate;
@end

@implementation PXStoryStyleSwitchingFullsizeLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControlConfiguration, 0);
  objc_storeStrong((id *)&self->_restartButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_styleSwitcherTitleString, 0);
  objc_storeStrong((id *)&self->_fullsizeFrameRectsStore, 0);
  objc_storeStrong((id *)&self->_displayedStyleInfos, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

- (void)setPageControlVersion:(int64_t)a3
{
  self->_pageControlVersion = a3;
}

- (int64_t)pageControlVersion
{
  return self->_pageControlVersion;
}

- (PXGPageControlConfiguration)pageControlConfiguration
{
  return self->_pageControlConfiguration;
}

- (void)setRestartButtonVersion:(int64_t)a3
{
  self->_restartButtonVersion = a3;
}

- (int64_t)restartButtonVersion
{
  return self->_restartButtonVersion;
}

- (PXStoryChromeButtonConfiguration)restartButtonConfiguration
{
  return self->_restartButtonConfiguration;
}

- (void)setStyleSwitcherTitleVersion:(int64_t)a3
{
  self->_styleSwitcherTitleVersion = a3;
}

- (int64_t)styleSwitcherTitleVersion
{
  return self->_styleSwitcherTitleVersion;
}

- (NSAttributedString)styleSwitcherTitleString
{
  return self->_styleSwitcherTitleString;
}

- (PXCArrayStore)fullsizeFrameRectsStore
{
  return self->_fullsizeFrameRectsStore;
}

- (NSArray)displayedStyleInfos
{
  return self->_displayedStyleInfos;
}

- (_NSRange)displayedStyleRange
{
  p_displayedStyleRange = &self->_displayedStyleRange;
  NSUInteger location = self->_displayedStyleRange.location;
  NSUInteger length = p_displayedStyleRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (PXStoryStyleSelectionDataSource)dataSource
{
  return self->_dataSource;
}

- (double)relativeZPositionAboveLegibilityGradients
{
  return self->_relativeZPositionAboveLegibilityGradients;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (void)setAxNextResponder:(id)a3
{
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

- (id)_axAssetsVisible
{
  v4 = [(PXStoryStyleSwitchingFullsizeLayout *)self dominantFullsizePlayerLayout];
  v5 = [v4 displayedTimeline];
  v6 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  uint64_t v7 = [v6 currentSegmentIdentifier];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  if (v5) {
    [v5 timeRangeForSegmentWithIdentifier:v7];
  }
  [v4 displayedTimelineRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __55__PXStoryStyleSwitchingFullsizeLayout__axAssetsVisible__block_invoke;
  v27 = &unk_1E5DC7760;
  id v28 = v5;
  v29 = self;
  id v30 = v16;
  SEL v31 = a2;
  long long v21 = v32;
  long long v22 = v33;
  long long v23 = v34;
  id v17 = v16;
  id v18 = v5;
  objc_msgSend(v18, "enumerateClipsInTimeRange:rect:usingBlock:", &v21, &v24, v9, v11, v13, v15);
  v19 = objc_msgSend(v17, "copy", v21, v22, v23, v24, v25, v26, v27);

  return v19;
}

void __55__PXStoryStyleSwitchingFullsizeLayout__axAssetsVisible__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2 >= 1)
  {
    uint64_t v21 = v10;
    uint64_t v22 = v9;
    uint64_t v23 = v8;
    uint64_t v24 = v7;
    uint64_t v25 = v6;
    uint64_t v26 = v5;
    uint64_t v27 = v11;
    uint64_t v28 = v12;
    uint64_t v14 = a2;
    do
    {
      v16 = objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *a5, v21, v22, v23, v24, v25, v26, v27, v28);
      id v17 = [v16 resource];
      uint64_t v18 = objc_msgSend(v17, "px_storyResourceKind");

      if (v18 == 1)
      {
        v19 = [v16 resource];
        v20 = objc_msgSend(v19, "px_storyResourceDisplayAsset");

        [*(id *)(a1 + 48) addObject:v20];
      }
      a5 += 96;

      --v14;
    }
    while (v14);
  }
}

- (id)_axSongTitle
{
  v3 = [(PXStoryStyleSwitchingFullsizeLayout *)self dataSource];
  v4 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  uint64_t v5 = [v4 styleManager];
  uint64_t v6 = objc_msgSend(v3, "styleInfoAtIndex:", objc_msgSend(v5, "focusedStyleIndex"));

  uint64_t v7 = [v6 songResource];
  uint64_t v8 = objc_msgSend(v7, "px_storyResourceSongAsset");
  uint64_t v9 = [v8 title];

  return v9;
}

- (id)_axSongArtistName
{
  v3 = [(PXStoryStyleSwitchingFullsizeLayout *)self dataSource];
  v4 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  uint64_t v5 = [v4 styleManager];
  uint64_t v6 = objc_msgSend(v3, "styleInfoAtIndex:", objc_msgSend(v5, "focusedStyleIndex"));

  uint64_t v7 = [v6 songResource];
  uint64_t v8 = objc_msgSend(v7, "px_storyResourceSongAsset");
  uint64_t v9 = [v8 artistName];

  return v9;
}

- (id)_axStyleTitle
{
  v3 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  v4 = [v3 colorGradingRepository];

  uint64_t v5 = [(PXStoryStyleSwitchingFullsizeLayout *)self dataSource];
  uint64_t v6 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  uint64_t v7 = [v6 styleManager];
  uint64_t v8 = objc_msgSend(v5, "styleInfoAtIndex:", objc_msgSend(v7, "focusedStyleIndex"));

  uint64_t v9 = objc_msgSend(v4, "localizedTitleForColorGradeKind:", objc_msgSend(v8, "customColorGradeKind"));

  return v9;
}

- (unint64_t)_axSwitcherFractionDenominator
{
  v2 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  v3 = [v2 styleManager];

  v4 = [v3 selectionDataSource];
  unint64_t v5 = [v4 numberOfStyles];

  return v5;
}

- (unint64_t)_axSwitcherFractionNumerator
{
  v2 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  v3 = [v2 styleManager];

  unint64_t v4 = [v3 focusedStyleIndex] + 1;
  return v4;
}

- (BOOL)_handleSwitchStyle:(id)a3 inGroup:(id)a4
{
  [a3 axFrame];
  double v6 = v5;
  uint64_t v7 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  uint64_t v8 = [v7 styleManager];

  uint64_t v9 = [v8 focusedStyleIndex];
  if (v6 <= 0.0) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v9 + 1;
  }
  if (v6 < 0.0) {
    uint64_t v11 = v9 - 1;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11 < 0
    || ([v8 selectionDataSource],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 numberOfStyles],
        v12,
        v11 >= v13))
  {
    PXAssertGetLog();
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__PXStoryStyleSwitchingFullsizeLayout__handleSwitchStyle_inGroup___block_invoke;
  v15[3] = &__block_descriptor_40_e38_v16__0___PXStoryMutableStyleManager__8l;
  v15[4] = v11;
  [v8 performChanges:v15 origin:6];

  return 1;
}

uint64_t __66__PXStoryStyleSwitchingFullsizeLayout__handleSwitchStyle_inGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectionFocus:(double)*(uint64_t *)(a1 + 32)];
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = PXGAXGetElementForUserInfo(v10);
  id v12 = v9;
  if (!v12)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, self, @"PXStoryStyleSwitchingFullsizeLayout.m", 744, @"%@ should be an instance inheriting from %@, but it is nil", @"axGroup", v20 object file lineNumber description];
LABEL_10:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    uint64_t v22 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v18 handleFailureInMethod:a2, self, @"PXStoryStyleSwitchingFullsizeLayout.m", 744, @"%@ should be an instance inheriting from %@, but it is %@", @"axGroup", v20, v22 object file lineNumber description];

    goto LABEL_10;
  }
LABEL_3:
  uint64_t v13 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  uint64_t v14 = [v13 viewMode];

  if (a4 == 4 && v14 == 4)
  {
    char v15 = [(PXStoryStyleSwitchingFullsizeLayout *)self _handleSwitchStyle:v11 inGroup:v12];
  }
  else
  {
    v16 = [(PXStoryStyleSwitchingFullsizeLayout *)self axNextResponder];
    char v15 = [v16 axGroup:v12 didRequestToPerformAction:a4 userInfo:v10];
  }
  return v15;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXStoryStyleSwitchingFullsizeLayout *)self axNextResponder];
  [v10 axGroup:v9 didChange:a4 userInfo:v8];
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v4 = a3;
  double v5 = [(PXStoryStyleSwitchingFullsizeLayout *)self axNextResponder];
  double v6 = [v5 axContainingScrollViewForAXGroup:v4];

  return v6;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(PXStoryStyleSwitchingFullsizeLayout *)self _isFakeAXSpriteIndex:a3])
  {
    [(PXGLayout *)self referenceSize];
    PXRectWithOriginAndSize();
  }
  v7.receiver = self;
  v7.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  double v5 = [(PXGLayout *)&v7 axContentInfoAtSpriteIndex:v3];
  return v5;
}

- (BOOL)_isFakeAXSpriteIndex:(unint64_t)a3
{
  return a3 == 1002 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 1000;
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  if (a4 - 4 < 2)
  {
    double v5 = [(PXStoryStyleSwitchingFullsizeLayout *)self axSpriteIndexes];
    unsigned int v6 = [v5 indexGreaterThanIndex:a3];
  }
  else
  {
    if (a4 != 6 && a4 != 3) {
      return -1;
    }
    double v5 = [(PXStoryStyleSwitchingFullsizeLayout *)self axSpriteIndexes];
    unsigned int v6 = [v5 indexLessThanIndex:a3];
  }
  unsigned int v7 = v6;

  return v7;
}

- (id)axVisibleSpriteIndexes
{
  uint64_t v3 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  [v3 styleSwitcherVisibilityFraction];
  double v5 = v4;

  if (v5 <= 0.5)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  else
  {
    unsigned int v6 = [(PXStoryStyleSwitchingFullsizeLayout *)self axSpriteIndexes];
    unsigned int v7 = (void *)[v6 mutableCopy];

    [v7 removeIndex:1000];
    [v7 removeIndex:1002];
    [v7 removeIndex:1001];
    id v8 = (id)[v7 copy];
  }
  return v8;
}

- (id)axSpriteIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_axSpriteIndexes copy];
  return v2;
}

- (CGRect)axFrame
{
}

- (void)setRestartButtonConfiguration:(id)a3
{
  unsigned int v7 = (PXStoryChromeButtonConfiguration *)a3;
  double v5 = self->_restartButtonConfiguration;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryChromeButtonConfiguration *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_restartButtonConfiguration, a3);
      [(PXStoryStyleSwitchingFullsizeLayout *)self setRestartButtonVersion:[(PXStoryStyleSwitchingFullsizeLayout *)self restartButtonVersion] + 1];
      [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
    }
  }
}

- (void)setPageControlConfiguration:(id)a3
{
  id v8 = (PXGPageControlConfiguration *)a3;
  double v4 = self->_pageControlConfiguration;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXGPageControlConfiguration *)v8 isEqual:v4];

    if (!v5)
    {
      BOOL v6 = (PXGPageControlConfiguration *)[(PXGPageControlConfiguration *)v8 copy];
      pageControlConfiguration = self->_pageControlConfiguration;
      self->_pageControlConfiguration = v6;

      [(PXStoryStyleSwitchingFullsizeLayout *)self setPageControlVersion:[(PXStoryStyleSwitchingFullsizeLayout *)self pageControlVersion] + 1];
      [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
    }
  }
}

- (void)setStyleSwitcherTitleString:(id)a3
{
  id v8 = (NSAttributedString *)a3;
  double v4 = self->_styleSwitcherTitleString;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSAttributedString *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      BOOL v6 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
      styleSwitcherTitleString = self->_styleSwitcherTitleString;
      self->_styleSwitcherTitleString = v6;

      [(PXStoryStyleSwitchingFullsizeLayout *)self setStyleSwitcherTitleVersion:[(PXStoryStyleSwitchingFullsizeLayout *)self styleSwitcherTitleVersion] + 1];
      [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
    }
  }
}

- (void)_configureTimelineLayout:(id)a3 maskLayout:(id)a4 forIndex:(int64_t)a5
{
  id v31 = a3;
  id v8 = a4;
  [(PXGLayout *)self alpha];
  double v10 = v9;
  uint64_t v11 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  id v12 = [v11 layoutSpec];
  uint64_t v13 = [v12 styleSwitcherLayoutDirection];
  [v11 styleSwitcherVisibilityFraction];
  double v15 = v14;
  if (v14 > 0.0)
  {
    [(PXGLayout *)self referenceSize];
    [v12 styleSwitcherViewportSpacing];
    v16 = [v11 styleManager];
    [v16 selectionFocus];

    [(PXStoryStyleSwitchingFullsizeLayout *)self displayedStyleRange];
    PXRectWithOriginAndSize();
  }
  double v17 = *((double *)off_1E5DAAF10 + 1);
  double v18 = *((double *)off_1E5DAAF10 + 3);
  double v19 = *(double *)off_1E5DAAF10;
  double v20 = *((double *)off_1E5DAAF10 + 2);
  double v21 = v10;
  [v31 setAlpha:v10];
  [v31 setTextAlpha:1.0 - v15];
  if (v13 == 2) {
    PXEdgeInsetsByFlippingHorizontally();
  }
  objc_msgSend(v31, "setClippingInsets:", v19, v17, v20, v18);
  [(PXGLayout *)self referenceDepth];
  objc_msgSend(v31, "setReferenceDepth:");
  [v31 referenceDepth];
  double v23 = v22;
  [(PXGLayout *)self referenceDepth];
  double v25 = v23 / v24;
  [(PXStoryStyleSwitchingFullsizeLayout *)self relativeZPositionAboveLegibilityGradients];
  [v31 setRelativeZPositionAboveLegibilityGradients:v26 / v25];
  if (v8)
  {
    objc_msgSend(v8, "setInsets:", v19, v17, v20, v18);
    [v8 setAlpha:v21];
    [v8 setMaskScale:v15];
    [v8 setLeftMaskWidth:0.0];
    [v8 setRightMaskWidth:0.0];
    uint64_t v27 = [v12 backgroundColor];
    uint64_t v28 = +[PXStorySettings sharedInstance];
    int v29 = [v28 wantsHighContrastColors];

    if (v29)
    {
      uint64_t v30 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithHue:saturation:brightness:alpha:", (double)fmod((double)(-[PXStoryStyleSwitchingFullsizeLayout displayedStyleRange](self, "displayedStyleRange") + a5)* 0.2, 1.0), 1.0, 1.0, 1.0);

      uint64_t v27 = (void *)v30;
    }
    [v8 setMaskColor:v27];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v13 = a3;
  if ((void *)ModelObservationContext_144024 == a5)
  {
    if ((a4 & 0x2000) != 0)
    {
      [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateTitleString];
      [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidatePageControl];
      [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
      [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateRestartButton];
      if ((a4 & 0x2000000000000) == 0)
      {
LABEL_9:
        if ((a4 & 0x10000) == 0) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
    else if ((a4 & 0x2000000000000) == 0)
    {
      goto LABEL_9;
    }
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateDisplayedStyleRange];
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
    if ((a4 & 0x10000) == 0) {
      goto LABEL_11;
    }
LABEL_10:
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateAXSpriteIndexes];
    goto LABEL_11;
  }
  if ((void *)StyleManagerObservationContext_144025 != a5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXStoryStyleSwitchingFullsizeLayout.m" lineNumber:564 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((a4 & 0x100) != 0)
  {
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateDisplayedStyleRange];
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidatePageControl];
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateAXSpriteIndexes];
  }
  if ((a4 & 0x20) != 0)
  {
    double v9 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
    double v10 = [v9 styleManager];
    uint64_t v11 = [v10 selectionDataSource];
    [(PXStoryStyleSwitchingFullsizeLayout *)self setDataSource:v11];
  }
LABEL_11:
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  BOOL v6 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  unsigned int v7 = [v6 layoutSpec];
  uint64_t v8 = [(PXStoryStyleSwitchingFullsizeLayout *)self displayedStyleRange] + a4;
  double v9 = [(PXStoryStyleSwitchingFullsizeLayout *)self dataSource];
  uint64_t v10 = [v9 indexOfCurrentStyle];

  if (v8 == v10)
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v12 = [(PXStoryStyleSwitchingFullsizeLayout *)self displayedStyleInfos];
    uint64_t v11 = [v12 objectAtIndexedSubscript:a4];
  }
  id v13 = [[PXStoryFullsizeLayout alloc] initWithModel:v6 overrideStyleInfo:v11];
  double v14 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  double v15 = [v14 extendedTraitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 == 5)
  {
    [(PXStoryStyleSwitchingFullsizeLayout *)self _configureTimelineLayout:v13 maskLayout:0 forIndex:a4];
    double v17 = v13;
  }
  else
  {
    double v18 = [PXGRoundedCornerMaskLayout alloc];
    double v19 = [v7 backgroundColor];
    double v20 = [(PXGRoundedCornerMaskLayout *)v18 initWithCornerRadius:1 continuousCorners:v19 maskColor:16.0];

    [(PXStoryStyleSwitchingFullsizeLayout *)self _configureTimelineLayout:v13 maskLayout:v20 forIndex:a4];
    double v17 = objc_alloc_init(PXGSplitLayout);
    [(PXGSplitLayout *)v17 setFirstSublayout:v20];
    [(PXGSplitLayout *)v17 setSecondSublayout:v13];
    [(PXGSplitLayout *)v17 setMode:4];
  }
  return v17;
}

- (BOOL)layout:(id)a3 shouldPreventFaultOutOfSublayout:(id)a4
{
  return 1;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_pageControlSpriteIndex == a3)
  {
    uint64_t v8 = [(PXStoryStyleSwitchingFullsizeLayout *)self pageControlConfiguration];
  }
  else
  {
    if (self->_restartButtonSpriteIndex != a3)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXStoryStyleSwitchingFullsizeLayout.m" lineNumber:493 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v8 = [(PXStoryStyleSwitchingFullsizeLayout *)self restartButtonConfiguration];
  }
  double v9 = (void *)v8;

  return v9;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_pageControlSpriteIndex != a3 && self->_restartButtonSpriteIndex != a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryStyleSwitchingFullsizeLayout.m" lineNumber:484 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v8 = objc_opt_class();

  return (Class)v8;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_styleSwitcherTitleSpriteIndex != a3)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryStyleSwitchingFullsizeLayout.m" lineNumber:473 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v8 = v7;
  double v9 = [(PXStoryStyleSwitchingFullsizeLayout *)self styleSwitcherTitleString];

  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return &stru_1F00B0030;
}

- (void)_handleRestartButton:(id)a3
{
  id v3 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  [v3 performChanges:&__block_literal_global_144037];
}

uint64_t __60__PXStoryStyleSwitchingFullsizeLayout__handleRestartButton___block_invoke(uint64_t a1, void *a2)
{
  return [a2 restartPlaybackFromBeginning];
}

- (void)_handlePageControl:(id)a3
{
  id v4 = a3;
  char v5 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  BOOL v6 = [v5 styleManager];
  uint64_t v7 = [v4 currentPage];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PXStoryStyleSwitchingFullsizeLayout__handlePageControl___block_invoke;
  v8[3] = &__block_descriptor_40_e38_v16__0___PXStoryMutableStyleManager__8l;
  v8[4] = v7;
  [v6 performChanges:v8 origin:6];
}

uint64_t __58__PXStoryStyleSwitchingFullsizeLayout__handlePageControl___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectionFocus:(double)*(uint64_t *)(a1 + 32)];
}

- (void)_updateAXSpriteIndexes
{
  id v3 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  BOOL v4 = [v3 viewMode] == 4;

  char v5 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  BOOL v6 = [v5 styleManager];

  uint64_t v7 = [v6 focusedStyleIndex];
  uint64_t v8 = [v6 selectionDataSource];
  uint64_t v9 = [v8 numberOfStyles] - 1;

  BOOL v10 = v7 != v9 && v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PXStoryStyleSwitchingFullsizeLayout__updateAXSpriteIndexes__block_invoke;
  aBlock[3] = &unk_1E5DCEAD8;
  aBlock[4] = self;
  uint64_t v11 = (void (**)(void *, BOOL, uint64_t))_Block_copy(aBlock);
  v11[2](v11, v4, 1001);
  v11[2](v11, v10, 1002);
  if (v7) {
    BOOL v12 = v4;
  }
  else {
    BOOL v12 = 0;
  }
  v11[2](v11, v12, 1000);
}

uint64_t __61__PXStoryStyleSwitchingFullsizeLayout__updateAXSpriteIndexes__block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1040);
  if (a2) {
    return objc_msgSend(v2, "addIndex:");
  }
  else {
    return objc_msgSend(v2, "removeIndex:");
  }
}

- (void)_invalidateAXSpriteIndexes
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      char v5 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v6 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout _invalidateAXSpriteIndexes]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleSwitchingFullsizeLayout.m", 406, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 64;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContent
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXGLayout *)self sublayoutDataStore];
  [v3 count];

  [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  [(id)objc_claimAutoreleasedReturnValue() styleSwitcherVisibilityFraction];
  [(PXGLayout *)self referenceSize];
  PXRectWithOriginAndSize();
}

uint64_t __53__PXStoryStyleSwitchingFullsizeLayout__updateContent__block_invoke(uint64_t a1, _OWORD *a2)
{
  if (*(uint64_t *)(a1 + 40) >= 1)
  {
    uint64_t v2 = 0;
    id v3 = a2;
    do
    {
      long long v4 = *(_OWORD *)(a1 + 64);
      _OWORD *v3 = *(_OWORD *)(a1 + 48);
      v3[1] = v4;
      v3 += 2;
      ++v2;
    }
    while (*(void *)(a1 + 40) > v2);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setFrames:forSublayoutsInRange:", a2, *(void *)(a1 + 80), *(void *)(a1 + 88));
}

void __53__PXStoryStyleSwitchingFullsizeLayout__updateContent__block_invoke_259(uint64_t a1, uint64_t a2, void *a3)
{
  id v29 = a3;
  char v5 = [*(id *)(a1 + 32) model];
  BOOL v6 = [v5 extendedTraitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 5)
  {
    [*(id *)(a1 + 32) _configureTimelineLayout:v29 maskLayout:0 forIndex:a2];
    goto LABEL_8;
  }
  id v8 = v29;
  uint64_t v9 = [v8 secondSublayout];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    double v18 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v18);
    double v19 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:v16, v17, @"PXStoryStyleSwitchingFullsizeLayout.m", 359, @"%@ should be an instance inheriting from %@, but it is %@", @"splitLayout.secondSublayout", v15, v19 object file lineNumber description];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    double v14 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v14);
    [v11 handleFailureInMethod:v12, v13, @"PXStoryStyleSwitchingFullsizeLayout.m", 359, @"%@ should be an instance inheriting from %@, but it is nil", @"splitLayout.secondSublayout", v15 object file lineNumber description];
  }

LABEL_5:
  BOOL v10 = [v8 firstSublayout];
  if (!v10)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 40);
    double v23 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v23);
    [v20 handleFailureInMethod:v21, v22, @"PXStoryStyleSwitchingFullsizeLayout.m", 360, @"%@ should be an instance inheriting from %@, but it is nil", @"splitLayout.firstSublayout", v24 object file lineNumber description];
LABEL_16:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v27 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v27);
    uint64_t v28 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:v25, v26, @"PXStoryStyleSwitchingFullsizeLayout.m", 360, @"%@ should be an instance inheriting from %@, but it is %@", @"splitLayout.firstSublayout", v24, v28 object file lineNumber description];

    goto LABEL_16;
  }
LABEL_7:
  [*(id *)(a1 + 32) _configureTimelineLayout:v9 maskLayout:v10 forIndex:a2];

LABEL_8:
}

void __53__PXStoryStyleSwitchingFullsizeLayout__updateContent__block_invoke_2(uint64_t a1)
{
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
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      char v5 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v6 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleSwitchingFullsizeLayout.m", 325, @"invalidating %lu after it already has been updated", 1);

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

- (void)_updateDisplayedStyles
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  long long v4 = [v3 styleManager];
  char v5 = [v4 selectionDataSource];

  if ([v5 numberOfStyles] < 1)
  {
    uint64_t v9 = +[_PXStoryFallbackStyleDescriptor defaultFallbackStyleDescriptor];
    v10[0] = v9;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v6 = [(PXStoryStyleSwitchingFullsizeLayout *)self displayedStyleRange];
    id v8 = objc_msgSend(v5, "infosForStylesInRange:", v6, v7);
  }
  [(PXStoryStyleSwitchingFullsizeLayout *)self setDisplayedStyleInfos:v8];
}

- (void)_invalidateDisplayedStyles
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
      char v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyles]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleSwitchingFullsizeLayout.m", 308, @"invalidating %lu after it already has been updated", 4);

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

- (void)_updateDisplayedStyleRange
{
  id v7 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  id v3 = [v7 styleManager];
  long long v4 = [v3 selectionDataSource];

  [v7 styleSwitcherVisibilityFraction];
  if (v5 <= 0.0)
  {
    if ([v4 indexOfCurrentStyle] != 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v4, "numberOfStyles") <= 0) {
      [v4 indexOfCurrentStyle];
    }
  }
  else
  {
    [v4 numberOfStyles];
    uint64_t v6 = [v7 styleManager];
    [v6 focusedStyleIndex];
  }
  -[PXStoryStyleSwitchingFullsizeLayout setDisplayedStyleRange:](self, "setDisplayedStyleRange:");
}

- (void)_invalidateDisplayedStyleRange
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
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyleRange]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleSwitchingFullsizeLayout.m", 283, @"invalidating %lu after it already has been updated", 2);

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

- (void)_updateRestartButton
{
  id v7 = objc_alloc_init(PXStoryChromeButtonConfiguration);
  [(PXStoryChromeButtonConfiguration *)v7 setBackgroundStyle:0];
  [(PXStoryChromeButtonConfiguration *)v7 setTarget:self];
  [(PXStoryChromeButtonConfiguration *)v7 setAction:sel__handleRestartButton_];
  id v3 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  long long v4 = [v3 layoutSpec];
  double v5 = [v4 styleSwitcherChromeButtonSpec];
  [(PXStoryChromeButtonConfiguration *)v7 setSpec:v5];

  [(PXStoryChromeButtonConfiguration *)v7 setSystemImageName:@"arrow.counterclockwise"];
  uint64_t v6 = PXLocalizedStringFromTable(@"InteractiveMemoryButtonAccessibilityLabelRestart", @"PhotosUICore");
  [(PXStoryChromeButtonConfiguration *)v7 setAxLabel:v6];

  [(PXStoryStyleSwitchingFullsizeLayout *)self setRestartButtonConfiguration:v7];
}

- (void)_invalidateRestartButton
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout _invalidateRestartButton]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleSwitchingFullsizeLayout.m", 268, @"invalidating %lu after it already has been updated", 32);

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

- (void)_updatePageControl
{
  id v6 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  id v3 = [v6 styleManager];
  long long v4 = objc_alloc_init(PXGPageControlConfiguration);
  -[PXGPageControlConfiguration setCurrentPage:](v4, "setCurrentPage:", [v3 focusedStyleIndex]);
  double v5 = [v3 selectionDataSource];
  -[PXGPageControlConfiguration setNumberOfPages:](v4, "setNumberOfPages:", [v5 numberOfStyles]);

  [(PXGPageControlConfiguration *)v4 setHidesForSinglePage:1];
  [(PXGPageControlConfiguration *)v4 setTarget:self];
  [(PXGPageControlConfiguration *)v4 setAction:sel__handlePageControl_];
  [(PXStoryStyleSwitchingFullsizeLayout *)self setPageControlConfiguration:v4];
}

- (void)_invalidatePageControl
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout _invalidatePageControl]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleSwitchingFullsizeLayout.m", 252, @"invalidating %lu after it already has been updated", 16);

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

- (void)_updateTitleString
{
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  PXLocalizedStringFromTable(@"InteractiveMemoryStyleSwitcherTitle", @"PhotosUICore");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  long long v4 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  double v5 = [v4 layoutSpec];
  id v6 = [v5 styleSwitcherTitleAttributes];
  id v7 = (void *)[v3 initWithString:v8 attributes:v6];
  [(PXStoryStyleSwitchingFullsizeLayout *)self setStyleSwitcherTitleString:v7];
}

- (void)_invalidateTitleString
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
      id v6 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout _invalidateTitleString]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleSwitchingFullsizeLayout.m", 243, @"invalidating %lu after it already has been updated", 8);

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

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  [(PXGCompositeLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v4 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryStyleSwitchingFullsizeLayout.m", 239, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
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
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout update]"];
      [v11 handleFailureInFunction:v12, @"PXStoryStyleSwitchingFullsizeLayout.m", 211, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 2;
    if ((needsUpdate & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryStyleSwitchingFullsizeLayout *)self _updateDisplayedStyleRange];
      if (!p_updateFlags->isPerformingUpdate)
      {
        uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v26 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout update]"];
        [v25 handleFailureInFunction:v26, @"PXStoryStyleSwitchingFullsizeLayout.m", 215, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v5 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryStyleSwitchingFullsizeLayout *)self _updateDisplayedStyles];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      double v14 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXStoryStyleSwitchingFullsizeLayout.m", 218, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v6 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryStyleSwitchingFullsizeLayout *)self _updateTitleString];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXStoryStyleSwitchingFullsizeLayout.m", 221, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v7 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXStoryStyleSwitchingFullsizeLayout *)self _updatePageControl];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      double v18 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout update]"];
      [v17 handleFailureInFunction:v18, @"PXStoryStyleSwitchingFullsizeLayout.m", 224, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v8 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXStoryStyleSwitchingFullsizeLayout *)self _updateRestartButton];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v19 = [MEMORY[0x1E4F28B00] currentHandler];
      double v20 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout update]"];
      [v19 handleFailureInFunction:v20, @"PXStoryStyleSwitchingFullsizeLayout.m", 227, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if (v9)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryStyleSwitchingFullsizeLayout *)self _updateContent];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout update]"];
      [v21 handleFailureInFunction:v22, @"PXStoryStyleSwitchingFullsizeLayout.m", 230, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v10 & 0x40) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFFBFLL;
      [(PXStoryStyleSwitchingFullsizeLayout *)self _updateAXSpriteIndexes];
      unint64_t v10 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v10)
    {
      double v23 = [MEMORY[0x1E4F28B00] currentHandler];
      double v24 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout update]"];
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"PXStoryStyleSwitchingFullsizeLayout.m", 233, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  [(PXGCompositeLayout *)&v27 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  [(PXGCompositeLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v4 = [NSString stringWithUTF8String:"-[PXStoryStyleSwitchingFullsizeLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryStyleSwitchingFullsizeLayout.m", 207, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  return 0;
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  [(PXGCompositeLayout *)&v3 referenceDepthDidChange];
  [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
  [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateAXSpriteIndexes];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  [(PXGCompositeLayout *)&v3 referenceSizeDidChange];
  [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
  [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateAXSpriteIndexes];
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
}

- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3
{
  if (self->_relativeZPositionAboveLegibilityGradients != a3)
  {
    self->_relativeZPositionAboveLegibilityGradients = a3;
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
  }
}

- (void)setDisplayedStyleInfos:(id)a3
{
  unint64_t v10 = (NSArray *)a3;
  long long v4 = self->_displayedStyleInfos;
  objc_super v5 = v10;
  if (v4 != v10)
  {
    char v6 = [(NSArray *)v10 isEqual:v4];

    if (v6) {
      goto LABEL_9;
    }
    if ([(NSArray *)self->_displayedStyleInfos count] == 1 && [(NSArray *)v10 count] == 1)
    {
      uint64_t v7 = [off_1E5DA5568 changeDetailsWithNoChanges];
    }
    else
    {
      uint64_t v7 = [off_1E5DA5568 changeDetailsFromArray:self->_displayedStyleInfos toArray:v10 changedObjects:MEMORY[0x1E4F1CBF0]];
    }
    objc_super v5 = (void *)v7;
    unint64_t v8 = (NSArray *)[(NSArray *)v10 copy];
    displayedStyleInfos = self->_displayedStyleInfos;
    self->_displayedStyleInfos = v8;

    [(PXGLayout *)self applySublayoutChangeDetails:v5 countAfterChanges:[(NSArray *)v10 count] sublayoutProvider:self];
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidatePageControl];
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateContent];
  }

LABEL_9:
}

- (void)setDisplayedStyleRange:(_NSRange)a3
{
  if (a3.location != self->_displayedStyleRange.location || a3.length != self->_displayedStyleRange.length)
  {
    self->_displayedStyleRange = a3;
    [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateDisplayedStyles];
  }
}

- (void)setDataSource:(id)a3
{
  uint64_t v7 = (PXStoryStyleSelectionDataSource *)a3;
  objc_super v5 = self->_dataSource;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryStyleSelectionDataSource *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateDisplayedStyleRange];
      [(PXStoryStyleSwitchingFullsizeLayout *)self _invalidateDisplayedStyles];
    }
  }
}

- (PXStoryFullsizeLayout)dominantFullsizePlayerLayout
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = [(PXStoryStyleSwitchingFullsizeLayout *)self model];
  objc_super v5 = [(PXGLayout *)self sublayoutDataStore];
  [v4 styleSwitcherVisibilityFraction];
  if (v6 <= 0.0)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v7 = [v4 styleManager];
    uint64_t v8 = [v7 focusedStyleIndex];
    uint64_t v9 = v8 - [(PXStoryStyleSwitchingFullsizeLayout *)self displayedStyleRange];
  }
  if (v9 < [v5 count])
  {
    unint64_t v10 = [v5 sublayoutAtIndex:v9];
    uint64_t v11 = [v10 secondSublayout];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_7:

        goto LABEL_11;
      }
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v17 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v17);
      double v18 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v14 handleFailureInMethod:a2, self, @"PXStoryStyleSwitchingFullsizeLayout.m", 127, @"%@ should be an instance inheriting from %@, but it is %@", @"splitLayout.secondSublayout", v16, v18 object file lineNumber description];
    }
    else
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      double v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      [v14 handleFailureInMethod:a2, self, @"PXStoryStyleSwitchingFullsizeLayout.m", 127, @"%@ should be an instance inheriting from %@, but it is nil", @"splitLayout.secondSublayout", v16 object file lineNumber description];
    }

    goto LABEL_7;
  }
  uint64_t v12 = PLStoryGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = v9;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Unable to return the dominant fullsize player layout, because there is no sublayout at index %ld", buf, 0xCu);
  }

  uint64_t v11 = 0;
LABEL_11:

  return (PXStoryFullsizeLayout *)v11;
}

- (PXStoryStyleSwitchingFullsizeLayout)initWithModel:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  double v6 = [(PXGAbsoluteCompositeLayout *)&v17 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:32];
    fullsizeFrameRectsStore = v6->_fullsizeFrameRectsStore;
    v6->_fullsizeFrameRectsStore = (PXCArrayStore *)v7;

    objc_storeStrong((id *)&v6->_model, a3);
    [(PXStoryModel *)v6->_model registerChangeObserver:v6 context:ModelObservationContext_144024];
    uint64_t v9 = [(PXStoryModel *)v6->_model styleManager];
    [v9 registerChangeObserver:v6 context:StyleManagerObservationContext_144025];
    unint64_t v10 = [v9 selectionDataSource];
    [(PXStoryStyleSwitchingFullsizeLayout *)v6 setDataSource:v10];

    [(PXGCompositeLayout *)v6 setSublayoutFaultingDelegate:v6];
    [(PXStoryStyleSwitchingFullsizeLayout *)v6 _invalidateDisplayedStyles];
    [(PXGLayout *)v6 setContentSource:v6];
    unsigned int spriteCount = v6->_spriteCount;
    v6->_unsigned int spriteCount = spriteCount + 1;
    v6->_styleSwitcherTitleSpriteIndex = spriteCount;
    unsigned int v12 = v6->_spriteCount;
    v6->_unsigned int spriteCount = v12 + 1;
    v6->_pageControlSpriteIndex = v12;
    unsigned int v13 = v6->_spriteCount;
    v6->_unsigned int spriteCount = v13 + 1;
    v6->_restartButtonSpriteIndex = v13;
    [(PXGLayout *)v6 applySpriteChangeDetails:0 countAfterChanges:v6->_spriteCount initialState:0 modifyState:0];
    [(PXStoryStyleSwitchingFullsizeLayout *)v6 _invalidateTitleString];
    [(PXStoryStyleSwitchingFullsizeLayout *)v6 _invalidatePageControl];
    [(PXStoryStyleSwitchingFullsizeLayout *)v6 _invalidateRestartButton];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, v6->_spriteCount);
    axSpriteIndexes = v6->_axSpriteIndexes;
    v6->_axSpriteIndexes = (NSMutableIndexSet *)v14;
  }
  return v6;
}

- (PXStoryStyleSwitchingFullsizeLayout)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryStyleSwitchingFullsizeLayout.m", 85, @"%s is not available as initializer", "-[PXStoryStyleSwitchingFullsizeLayout init]");

  abort();
}

@end