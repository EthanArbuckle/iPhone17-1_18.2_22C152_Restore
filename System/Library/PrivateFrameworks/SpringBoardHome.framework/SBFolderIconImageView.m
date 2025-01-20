@interface SBFolderIconImageView
+ (BOOL)allowsLayersForMiniIcons;
+ (BOOL)usesCachedImagesForMiniIconLayers;
- (BOOL)canUpdateImage;
- (BOOL)hasCustomBackgroundView;
- (BOOL)isAnimating;
- (BOOL)isAnimatingIconImageInfoChange;
- (BOOL)isPageGridHidden;
- (BOOL)pageGridClipsToBounds;
- (BOOL)usesLayersForMiniIcons;
- (CGRect)frameForMiniIconAtIndex:(unint64_t)a3;
- (CGRect)frameForMiniIconAtIndexPath:(id)a3;
- (CGRect)visibleImageRelativeFrameForMiniIconAtIndex:(unint64_t)a3;
- (CGSize)_interiorGridSize;
- (Class)_iconGridImageClass;
- (NSArray)currentPageIconLayers;
- (SBFolderIconImageView)initWithFrame:(CGRect)a3;
- (SBHIconImageAppearance)displayedImageAppearance;
- (UIView)backgroundView;
- (UIView)currentPageView;
- (double)iconGridImageAlpha;
- (id)_currentPageElement;
- (id)_folderIconImageCache;
- (id)_generateSquareContentsImage;
- (id)contentsImage;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)pageElements;
- (id)representedListLayout;
- (id)snapshot;
- (unint64_t)backgroundStyle;
- (unint64_t)centerVisibleMiniIconIndex;
- (unint64_t)concreteBackgroundStyle;
- (unint64_t)currentBackgroundStyle;
- (unint64_t)currentPageIndex;
- (unint64_t)firstVisibleMiniIconIndex;
- (unint64_t)lastVisibleMiniIconIndex;
- (unint64_t)visibleMiniIconCount;
- (unint64_t)visibleMiniIconListIndex;
- (void)_performScrollingDirection:(int64_t)a3 targetPageIndex:(unint64_t)a4 targetPageScrollRow:(unint64_t)a5 newLeftElement:(id)a6 newRightElement:(id)a7 animated:(BOOL)a8;
- (void)_setAnimating:(BOOL)a3;
- (void)_setPageElements:(id)a3;
- (void)_setupGridViewsInDefaultConfiguration;
- (void)_showLeftMinigrid;
- (void)_showRightMinigrid;
- (void)_updateCurrentBackgroundStyle;
- (void)cleanupAfterFloatyFolderCrossfade;
- (void)configureGridMiniLayer:(id)a3;
- (void)dealloc;
- (void)didAnimateIconImageInfoChange;
- (void)folderIcon:(id)a3 containedIconAccessoriesDidUpdate:(id)a4;
- (void)folderIcon:(id)a3 containedIconImageDidUpdate:(id)a4;
- (void)folderIcon:(id)a3 containedIconLaunchEnabledDidChange:(id)a4;
- (void)folderIconImageCache:(id)a3 didUpdateImagesForFolderIcon:(id)a4 imageAppearance:(id)a5;
- (void)fulfillGridImageForPageElement:(id)a3;
- (void)fulfillGridLayerForPageElement:(id)a3;
- (void)iconImageInfoDidChange;
- (void)iconViewFolderIconImageCacheDidChange;
- (void)iconViewLegibilitySettingsDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)prepareToCrossfadeWithFloatyFolderView:(id)a3 allowFolderInteraction:(BOOL)a4;
- (void)scrollToFirstGapAnimated:(BOOL)a3;
- (void)scrollToGapOrTopIfFullOfPage:(unint64_t)a3 animated:(BOOL)a4;
- (void)scrollToTopOfFirstPageAnimated:(BOOL)a3;
- (void)scrollToTopOfPage:(unint64_t)a3 animated:(BOOL)a4;
- (void)setAnimatingIconImageInfoChange:(BOOL)a3;
- (void)setBackgroundAndIconGridImageAlpha:(double)a3;
- (void)setBackgroundScale:(double)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCurrentBackgroundStyle:(unint64_t)a3;
- (void)setDisplayedImageAppearance:(id)a3;
- (void)setFloatyFolderCrossfadeFraction:(double)a3;
- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5;
- (void)setIconGridImageAlpha:(double)a3;
- (void)setIconView:(id)a3;
- (void)setPageGridClipsToBounds:(BOOL)a3;
- (void)setPageGridCornerRadius:(double)a3;
- (void)setPageGridHidden:(BOOL)a3;
- (void)updateBackgroundViewOverrideUserInterfaceStyle;
- (void)updateImageAnimated:(BOOL)a3;
- (void)willAnimateIconImageInfoChange;
@end

@implementation SBFolderIconImageView

- (SBHIconImageAppearance)displayedImageAppearance
{
  return self->_displayedImageAppearance;
}

- (void)setBackgroundView:(id)a3
{
  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  v13 = v5;
  if (backgroundView != v5)
  {
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    self->_hasCustomBackgroundView = 1;
    if (v13)
    {
      v7 = [(SBIconImageView *)self iconView];
      [v7 iconImageInfo];
      [(UIView *)v13 _setContinuousCornerRadius:v8];
      v9 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v11 = [(SBIconImageView *)self location];
        int v12 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupDock", v11);

        [(UIView *)v13 setBlurEnabled:v12 ^ 1u];
      }
      [(UIView *)v13 setUserInteractionEnabled:0];
      [(SBFolderIconImageView *)self insertSubview:v13 atIndex:0];
      [(SBFolderIconImageView *)self updateBackgroundViewOverrideUserInterfaceStyle];
    }
  }
}

- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(SBFolderIconImageView *)self _folderIcon];
  v11 = [(SBFolderIconImageView *)self _folderIconImageCache];
  int v12 = v11;
  if (v10) {
    [v11 removeObserver:self forFolderIcon:v10];
  }
  [v10 removeObserver:self];
  v17.receiver = self;
  v17.super_class = (Class)SBFolderIconImageView;
  [(SBIconImageView *)&v17 setIcon:v8 location:v9 animated:v5];
  if (v8) {
    [v12 addObserver:self forFolderIcon:v8];
  }
  if ([(SBFolderIconImageView *)self usesLayersForMiniIcons]) {
    [v8 addObserver:self];
  }
  dispatch_time_t v13 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SBFolderIconImageView_setIcon_location_animated___block_invoke;
  block[3] = &unk_1E6AAC810;
  block[4] = self;
  dispatch_after(v13, MEMORY[0x1E4F14428], block);
  v14 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(UIView *)self->_backgroundView setBlurEnabled:SBIconLocationGroupContainsLocation(@"SBIconLocationGroupDock", v9) ^ 1];
  }
}

- (BOOL)usesLayersForMiniIcons
{
  v2 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)visibleMiniIconListIndex
{
  return self->_currentPageIndex;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)fulfillGridLayerForPageElement:(id)a3
{
  id v11 = a3;
  v4 = [(SBFolderIconImageView *)self _folderIcon];
  BOOL v5 = [v4 folder];
  v6 = [(SBFolderIconImageView *)self representedListLayout];
  v7 = [(SBIconImageView *)self effectiveIconImageAppearance];
  uint64_t v8 = [v11 pageIndex];
  if ([(id)objc_opt_class() usesCachedImagesForMiniIconLayers])
  {
    id v9 = [(SBFolderIconImageView *)self _folderIconImageCache];
    v10 = [v9 layerForPageAtIndex:v8 inFolderIcon:v4 imageAppearance:v7];
  }
  else
  {
    v10 = [v5 layerForListIndex:v8 listLayout:v6 imageAppearance:v7];
  }
  [(SBFolderIconImageView *)self configureGridMiniLayer:v10];
  [v11 setGridLayer:v10];
}

- (CGSize)_interiorGridSize
{
  v3 = [(SBFolderIconImageView *)self _iconGridImageClass];
  v4 = [(SBFolderIconImageView *)self representedListLayout];
  [(objc_class *)v3 sizeForLayout:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)representedListLayout
{
  v2 = [(SBIconImageView *)self iconView];
  v3 = [v2 representedFolderIconLocation];
  v4 = [v2 listLayoutProvider];
  double v5 = [v4 layoutForIconLocation:v3];

  return v5;
}

- (Class)_iconGridImageClass
{
  return (Class)self;
}

- (void)fulfillGridImageForPageElement:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SBFolderIconImageView *)self _folderIconImageCache];
  double v6 = [(SBFolderIconImageView *)self _folderIcon];
  double v7 = [(SBIconImageView *)self effectiveIconImageAppearance];
  uint64_t v8 = [v4 pageIndex];
  if (v5)
  {
    double v9 = [v5 imageForPageAtIndex:v8 inFolderIcon:v6 imageAppearance:v7];
    if (v9) {
      goto LABEL_11;
    }
    double v10 = SBLogIcon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412802;
      v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = (uint64_t)v6;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_error_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_ERROR, "Did not get a folder icon image from image cache: %@, folder icon: %@, page index: %lu", (uint8_t *)&v13, 0x20u);
    }
  }
  id v11 = [(SBFolderIconImageView *)self representedListLayout];
  double v9 = +[SBFolderIconImageCache imageForPageAtIndex:v8 inFolderIcon:v6 imageAppearance:v7 listLayout:v11 gridCellImageProvider:0 pool:0];
  if (!v9)
  {
    int v12 = SBLogIcon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412802;
      v14 = v6;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = (uint64_t)v11;
      _os_log_error_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_ERROR, "Did not get a folder icon image from cache-less constructor for folder icon: %@, page index: %lu, layout: %@", (uint8_t *)&v13, 0x20u);
    }
  }
LABEL_11:
  [v4 setGridImage:v9];
}

- (id)_folderIconImageCache
{
  v2 = [(SBIconImageView *)self iconView];
  v3 = [v2 folderIconImageCache];

  return v3;
}

- (id)pageElements
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SBFolderIconImageView *)self _folderIcon];
  id v4 = [v3 folder];
  double v5 = [(SBIconImageView *)self iconView];
  double v6 = [v5 overrideImage];
  if (v6)
  {
    double v7 = objc_alloc_init(_SBFolderPageElement);
    [(_SBFolderPageElement *)v7 setFolderIcon:v3];
    [(_SBFolderPageElement *)v7 setImage:v6];
    v18[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    __int16 v17 = v4;
    uint64_t v9 = [v4 listCount];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
    if (v9)
    {
      for (unint64_t i = 0; i != v9; ++i)
      {
        id v11 = objc_alloc_init(_SBFolderPageElement);
        [(_SBFolderPageElement *)v11 setGridImagePossible:1];
        [(_SBFolderPageElement *)v11 setPageIndex:i];
        [(_SBFolderPageElement *)v11 setFolderIcon:v3];
        pageElements = self->_pageElements;
        if (pageElements && [(NSMutableArray *)pageElements count] > i)
        {
          int v13 = [(NSMutableArray *)self->_pageElements objectAtIndex:i];
          uint64_t v14 = [v13 visibleRow];
        }
        else
        {
          uint64_t v14 = 0;
        }
        [(_SBFolderPageElement *)v11 setVisibleRow:v14];
        [v8 addObject:v11];
      }
    }
    __int16 v15 = objc_alloc_init(_SBFolderPageElement);
    [(_SBFolderPageElement *)v15 setPageIndex:v9];
    [(_SBFolderPageElement *)v15 setFolderIcon:v3];
    [v8 addObject:v15];

    id v4 = v17;
    double v6 = 0;
  }

  return v8;
}

- (void)updateImageAnimated:(BOOL)a3
{
  if ([(SBFolderIconImageView *)self canUpdateImage])
  {
    id v7 = [(SBFolderIconImageView *)self _folderIcon];
    id v4 = [v7 folder];
    if (v7 && v4)
    {
      double v5 = [(SBIconImageView *)self effectiveIconImageAppearance];
      [(SBFolderIconImageView *)self setDisplayedImageAppearance:v5];
      double v6 = [(SBFolderIconImageView *)self pageElements];
      [(SBFolderIconImageView *)self _setPageElements:v6];
    }
  }
}

- (BOOL)canUpdateImage
{
  v5.receiver = self;
  v5.super_class = (Class)SBFolderIconImageView;
  BOOL v3 = [(SBIconImageView *)&v5 canUpdateImage];
  if (v3) {
    LOBYTE(v3) = ![(SBFolderIconImageView *)self isAnimatingIconImageInfoChange];
  }
  return v3;
}

- (BOOL)isAnimatingIconImageInfoChange
{
  return self->_animatingIconImageInfoChange;
}

- (void)_setPageElements:(id)a3
{
  if (self->_pageElements != a3)
  {
    id v4 = (NSMutableArray *)[a3 copy];
    pageElements = self->_pageElements;
    self->_pageElements = v4;

    [(SBFolderIconImageView *)self _setupGridViewsInDefaultConfiguration];
    [(SBFolderIconImageView *)self setNeedsLayout];
  }
}

- (void)setDisplayedImageAppearance:(id)a3
{
}

- (void)_setupGridViewsInDefaultConfiguration
{
  unint64_t currentPageIndex = self->_currentPageIndex;
  unint64_t v4 = [(NSMutableArray *)self->_pageElements count] - 1;
  if (currentPageIndex < v4) {
    unint64_t v4 = currentPageIndex;
  }
  self->_unint64_t currentPageIndex = v4;
  if ([(NSMutableArray *)self->_pageElements count])
  {
    uint64_t v5 = [(NSMutableArray *)self->_pageElements objectAtIndex:self->_currentPageIndex];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  [(SBFolderIconGridViewing *)self->_leftWrapperView setElement:v5];
  [(SBFolderIconGridViewing *)self->_rightWrapperView setElement:0];
  [(SBFolderIconImageView *)self _showLeftMinigrid];
}

- (void)_showLeftMinigrid
{
  [(SBFolderIconImageView *)self bounds];
  pageGridContainer = self->_pageGridContainer;
  -[UIView setBounds:](pageGridContainer, "setBounds:", 0.0, 0.0);
}

- (void)configureGridMiniLayer:(id)a3
{
}

+ (BOOL)usesCachedImagesForMiniIconLayers
{
  return 1;
}

- (void)folderIcon:(id)a3 containedIconLaunchEnabledDidChange:(id)a4
{
}

- (void)folderIcon:(id)a3 containedIconImageDidUpdate:(id)a4
{
}

- (void)folderIcon:(id)a3 containedIconAccessoriesDidUpdate:(id)a4
{
}

uint64_t __51__SBFolderIconImageView_setIcon_location_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccessibilityBackgroundContrast];
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:0];
}

- (void)setIconView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFolderIconImageView;
  id v4 = a3;
  [(SBIconImageView *)&v7 setIconView:v4];
  objc_msgSend(v4, "iconImageInfo", v7.receiver, v7.super_class);
  double v6 = v5;

  [(SBFolderIconImageView *)self setPageGridCornerRadius:v6];
}

- (void)setPageGridCornerRadius:(double)a3
{
}

- (SBFolderIconImageView)initWithFrame:(CGRect)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)SBFolderIconImageView;
  BOOL v3 = -[SBIconImageView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    [(UIView *)v3->_backgroundView setUserInteractionEnabled:0];
    [(SBFolderIconImageView *)v3 insertSubview:v3->_backgroundView atIndex:0];
    double v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    pageGridContainer = v3->_pageGridContainer;
    v3->_pageGridContainer = v6;

    [(SBFolderIconImageView *)v3 insertSubview:v3->_pageGridContainer aboveSubview:v3->_backgroundView];
    [(UIView *)v3->_pageGridContainer setClipsToBounds:1];
    [(UIView *)v3->_pageGridContainer setUserInteractionEnabled:0];
    [(id)objc_opt_class() allowsLayersForMiniIcons];
    uint64_t v8 = self;

    uint64_t v9 = (SBFolderIconGridViewing *)objc_alloc_init((Class)v8);
    leftWrapperView = v3->_leftWrapperView;
    v3->_leftWrapperView = v9;

    [(SBFolderIconGridViewing *)v3->_leftWrapperView setFolderIconImageView:v3];
    [(UIView *)v3->_pageGridContainer addSubview:v3->_leftWrapperView];
    id v11 = (SBFolderIconGridViewing *)objc_alloc_init((Class)v8);
    rightWrapperView = v3->_rightWrapperView;
    v3->_rightWrapperView = v11;

    [(SBFolderIconGridViewing *)v3->_rightWrapperView setFolderIconImageView:v3];
    [(UIView *)v3->_pageGridContainer insertSubview:v3->_rightWrapperView aboveSubview:v3->_leftWrapperView];
    [(SBFolderIconImageView *)v3 _updateRasterization];
    [(SBFolderIconImageView *)v3 _updateAccessibilityBackgroundContrast];
    int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v3 selector:sel__updateAccessibilityBackgroundContrast name:*MEMORY[0x1E4FB24A8] object:0];

    uint64_t v14 = self;
    v20[0] = v14;
    __int16 v15 = self;
    v20[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v17 = (id)[(SBFolderIconImageView *)v3 registerForTraitChanges:v16 withTarget:v3 action:sel_updateBackgroundViewOverrideUserInterfaceStyle];
  }
  return v3;
}

- (void)_updateCurrentBackgroundStyle
{
  unint64_t v3 = [(SBFolderIconImageView *)self concreteBackgroundStyle];
  [(SBFolderIconImageView *)self setCurrentBackgroundStyle:v3];
  unint64_t transitionToken = self->_transitionToken;
  self->_unint64_t transitionToken = transitionToken + 1;
  double v5 = self->_backgroundView;
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v3 == 2)
    {
      double v6 = [(SBIconImageView *)self iconView];
      uint64_t v7 = [v6 accessibilityTintColor];
      if (!v7) {
        goto LABEL_5;
      }
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v6 location];
      unint64_t v10 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupDock", v9);

      id v11 = SBHomeAccessibilityTintColor(v10, v8);

      if (!v11)
      {
LABEL_5:
        id v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
      }
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    uint64_t v16 = [(SBIconImageView *)self iconView];
    [(UIView *)v16 iconImageInfo];
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    double v25 = v24;
    solidColorBackgroundView = self->_solidColorBackgroundView;
    if (solidColorBackgroundView)
    {
      v27 = solidColorBackgroundView;
      [(UIView *)v27 _continuousCornerRadius];
      if (v28 == v25)
      {
        int v13 = 0;
      }
      else
      {
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_4;
        v55[3] = &unk_1E6AACA38;
        v56 = v27;
        uint64_t v57 = v19;
        uint64_t v58 = v21;
        uint64_t v59 = v23;
        double v60 = v25;
        int v13 = _Block_copy(v55);
      }
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_5;
      v52[3] = &unk_1E6AACA90;
      v53 = v27;
      id v54 = v11;
      id v32 = v11;
      v31 = v27;
      __int16 v15 = (void (**)(void))_Block_copy(v52);

      id v17 = 0;
    }
    else
    {
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke;
      v64[3] = &unk_1E6AAE788;
      v29 = v5;
      uint64_t v68 = v19;
      uint64_t v69 = v21;
      uint64_t v70 = v23;
      double v71 = v25;
      v65 = v29;
      v66 = self;
      id v67 = v11;
      id v30 = v11;
      int v13 = _Block_copy(v64);
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_2;
      v63[3] = &unk_1E6AAC810;
      v63[4] = self;
      __int16 v15 = (void (**)(void))_Block_copy(v63);
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_3;
      v61[3] = &unk_1E6AAC810;
      v62 = v29;
      id v17 = _Block_copy(v61);

      v31 = v65;
    }
  }
  else
  {
    int v12 = self->_solidColorBackgroundView;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_6;
    aBlock[3] = &unk_1E6AAC810;
    v51 = v5;
    int v13 = _Block_copy(aBlock);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_7;
    v48[3] = &unk_1E6AAC810;
    uint64_t v14 = v12;
    v49 = v14;
    __int16 v15 = (void (**)(void))_Block_copy(v48);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_8;
    v45[3] = &unk_1E6AACA90;
    v46 = v14;
    v47 = self;
    uint64_t v16 = v14;
    id v17 = _Block_copy(v45);

    id v11 = v51;
  }

  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  v40 = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_9;
  v41 = &unk_1E6AAF6B0;
  unint64_t v44 = transitionToken;
  v42 = self;
  id v33 = v17;
  id v43 = v33;
  v34 = (void (**)(void *, uint64_t))_Block_copy(&v38);
  if (v13) {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "performWithoutAnimation:", v13, v38, v39, v40, v41, v42);
  }
  if (objc_msgSend(MEMORY[0x1E4FB1EB0], "_isInAnimationBlock", v38, v39, v40, v41, v42))
  {
    v35 = (void *)MEMORY[0x1E4F4F898];
    v36 = [MEMORY[0x1E4FB1EB0] _currentAnimationSettings];
    v37 = [v35 factoryWithSettings:v36];
    [v35 animateWithFactory:v37 actions:v15 completion:v34];
  }
  else
  {
    v15[2](v15);
    v34[2](v34, 1);
  }
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_9(uint64_t result)
{
  if (*(void *)(result + 48) == *(void *)(*(void *)(result + 32) + 664))
  {
    CGSize result = *(void *)(result + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)setCurrentBackgroundStyle:(unint64_t)a3
{
  self->_currentBackgroundStyle = a3;
}

- (unint64_t)concreteBackgroundStyle
{
  unint64_t result = [(SBFolderIconImageView *)self backgroundStyle];
  if (!result)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

+ (BOOL)allowsLayersForMiniIcons
{
  return 0;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SBFolderIconImageView;
  [(SBIconImageView *)&v15 layoutSubviews];
  [(SBFolderIconImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIView setBounds:](self->_backgroundView, "setBounds:", 0.0, 0.0);
  -[UIView setBounds:](self->_solidColorBackgroundView, "setBounds:", 0.0, 0.0, v4, v6);
  UIRectGetCenter();
  double v8 = v7;
  double v10 = v9;
  -[UIView setCenter:](self->_backgroundView, "setCenter:");
  -[UIView setCenter:](self->_solidColorBackgroundView, "setCenter:", v8, v10);
  -[UIView setCenter:](self->_crossfadeScalingView, "setCenter:", v8, v10);
  -[UIView setCenter:](self->_pageGridContainer, "setCenter:", v8, v10);
  [(UIView *)self->_pageGridContainer bounds];
  -[UIView setBounds:](self->_pageGridContainer, "setBounds:");
  [(SBFolderIconImageView *)self _interiorGridSize];
  UIRectCenteredIntegralRectScale();
  UIRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  [(SBFolderIconGridViewing *)self->_leftWrapperView setCenter:0];
  -[SBFolderIconGridViewing setCenter:](self->_rightWrapperView, "setCenter:", v4 + v12, v14);
}

- (BOOL)hasCustomBackgroundView
{
  return self->_hasCustomBackgroundView;
}

- (void)updateBackgroundViewOverrideUserInterfaceStyle
{
  id v4 = [(SBFolderIconImageView *)self traitCollection];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_materialUserInterfaceStyleFromTraitCollection:", v4);
  [(UIView *)self->_backgroundView setOverrideUserInterfaceStyle:v3];
  [(UIView *)self->_solidColorBackgroundView setOverrideUserInterfaceStyle:v3];
}

- (void)prepareForReuse
{
  uint64_t v3 = [(SBFolderIconImageView *)self layer];
  [v3 setShouldRasterize:0];

  [(SBFolderIconImageView *)self scrollToTopOfFirstPageAnimated:0];
  [(SBFolderIconImageView *)self setBackgroundAndIconGridImageAlpha:1.0];
  [(SBFolderIconImageView *)self setBackgroundScale:1.0];
  [(SBFolderIconImageView *)self _setPageElements:0];
  v4.receiver = self;
  v4.super_class = (Class)SBFolderIconImageView;
  [(SBIconImageView *)&v4 prepareForReuse];
}

- (void)scrollToTopOfPage:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(NSMutableArray *)self->_pageElements count];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  if (v7 <= a3) {
    return;
  }
  if (self->_currentPageIndex == a3)
  {
    double v8 = [(NSMutableArray *)self->_pageElements objectAtIndex:a3];
    uint64_t v9 = [v8 visibleRow];

    if (!v9) {
      return;
    }
  }
  uint64_t v10 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  uint64_t v11 = v10;
  unint64_t currentPageIndex = self->_currentPageIndex;
  if (currentPageIndex <= a3)
  {
    if (currentPageIndex >= a3)
    {
      uint64_t v17 = -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:");
      uint64_t v14 = 0;
      if (v11 == 1) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = (void *)v17;
      }
      id v19 = v18;
      if (v11 == 1) {
        uint64_t v16 = (void *)v17;
      }
      else {
        uint64_t v16 = 0;
      }
      goto LABEL_33;
    }
    if (v10 == 1) {
      unint64_t v13 = a3;
    }
    else {
      unint64_t v13 = self->_currentPageIndex;
    }
    if (v10 == 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
    if (v10 == 1) {
      unint64_t v15 = self->_currentPageIndex;
    }
    else {
      unint64_t v15 = a3;
    }
  }
  else
  {
    if (v10 == 1) {
      unint64_t v13 = self->_currentPageIndex;
    }
    else {
      unint64_t v13 = a3;
    }
    if (v10 == 1) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    if (v10 == 1) {
      unint64_t v15 = a3;
    }
    else {
      unint64_t v15 = self->_currentPageIndex;
    }
  }
  id v19 = [(NSMutableArray *)self->_pageElements objectAtIndex:v13];
  uint64_t v16 = [(NSMutableArray *)self->_pageElements objectAtIndex:v15];
LABEL_33:
  [(SBFolderIconImageView *)self _performScrollingDirection:v14 targetPageIndex:a3 targetPageScrollRow:0 newLeftElement:v19 newRightElement:v16 animated:v4];
}

- (void)scrollToTopOfFirstPageAnimated:(BOOL)a3
{
}

- (void)setBackgroundScale:(double)a3
{
  double v5 = [(SBFolderIconImageView *)self layer];
  [v5 setNeedsLayoutOnGeometryChange:0];

  backgroundView = self->_backgroundView;
  CGAffineTransformMakeScale(&v10, a3, a3);
  [(UIView *)backgroundView setTransform:&v10];
  solidColorBackgroundView = self->_solidColorBackgroundView;
  CGAffineTransformMakeScale(&v9, a3, a3);
  [(UIView *)solidColorBackgroundView setTransform:&v9];
  double v8 = [(SBFolderIconImageView *)self layer];
  [v8 setNeedsLayoutOnGeometryChange:1];
}

- (void)setBackgroundAndIconGridImageAlpha:(double)a3
{
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:");
  [(UIView *)self->_solidColorBackgroundView setAlpha:a3];
  [(SBFolderIconGridViewing *)self->_leftWrapperView setAlpha:a3];
  rightWrapperView = self->_rightWrapperView;
  [(SBFolderIconGridViewing *)rightWrapperView setAlpha:a3];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBFolderIconImageView;
  [(SBIconImageView *)&v4 dealloc];
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if ([(SBFolderIconImageView *)self backgroundStyle] != a3)
  {
    self->_backgroundStyle = a3;
    [(SBFolderIconImageView *)self _updateCurrentBackgroundStyle];
  }
}

- (BOOL)isPageGridHidden
{
  return [(UIView *)self->_pageGridContainer isHidden];
}

- (void)setPageGridHidden:(BOOL)a3
{
}

- (id)contentsImage
{
  return 0;
}

- (id)_generateSquareContentsImage
{
  return 0;
}

- (void)willAnimateIconImageInfoChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIconImageView;
  [(SBIconImageView *)&v3 willAnimateIconImageInfoChange];
  [(SBFolderIconImageView *)self setAnimatingIconImageInfoChange:1];
}

- (void)didAnimateIconImageInfoChange
{
  v6.receiver = self;
  v6.super_class = (Class)SBFolderIconImageView;
  [(SBIconImageView *)&v6 didAnimateIconImageInfoChange];
  [(SBFolderIconImageView *)self setAnimatingIconImageInfoChange:0];
  pageGridContainer = self->_pageGridContainer;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)pageGridContainer setTransform:v5];
  [(SBFolderIconImageView *)self updateImageAnimated:0];
}

- (void)iconImageInfoDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)SBFolderIconImageView;
  [(SBIconImageView *)&v8 iconImageInfoDidChange];
  if ([(SBFolderIconImageView *)self isAnimatingIconImageInfoChange])
  {
    [(SBIconImageView *)self iconImageInfo];
    double v4 = v3;
    [(UIView *)self->_pageGridContainer bounds];
    pageGridContainer = self->_pageGridContainer;
    CGAffineTransformMakeScale(&v7, v4 / v6, v4 / v6);
    [(UIView *)pageGridContainer setTransform:&v7];
  }
}

- (void)iconViewFolderIconImageCacheDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)SBFolderIconImageView;
  [(SBIconImageView *)&v8 iconViewFolderIconImageCacheDidChange];
  [(SBFolderIconImageView *)self updateImageAnimated:0];
  double v3 = [(SBFolderIconImageView *)self _folderIconImageCache];
  double v4 = [(SBIconImageView *)self icon];
  if (v4) {
    [v3 addObserver:self forFolderIcon:v4];
  }
  if ([(SBFolderIconImageView *)self isAnimatingIconImageInfoChange]
    && ([(id)objc_opt_class() allowsLayersForMiniIcons] & 1) == 0)
  {
    double v5 = [(SBFolderIconImageView *)self pageElements];
    double v6 = [v5 firstObject];
    CGAffineTransform v7 = [v6 image];
    if (!v7) {
      [(SBFolderIconImageView *)self fulfillGridImageForPageElement:v6];
    }
  }
}

- (id)snapshot
{
  [(SBFolderIconImageView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v11 = -[SBFolderIconImageView _imageFromRect:](self, "_imageFromRect:");
  [v11 size];
  double v13 = v12;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  if (v13 > CGRectGetHeight(v21))
  {
    uint64_t v14 = (void *)MEMORY[0x1E4FB1818];
    objc_msgSend(v11, "sbf_CGImageBackedImage");
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 CGImage];
    uint64_t v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    uint64_t v18 = objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v16, 0);

    uint64_t v11 = (void *)v18;
  }
  return v11;
}

- (void)scrollToFirstGapAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NSMutableArray *)self->_pageElements count]) {
    return;
  }
  id v24 = [(SBFolderIconImageView *)self _folderIcon];
  double v5 = [v24 folder];
  CGFloat v6 = [v5 _indexPathToRevealForJiggleMode];

  unint64_t v7 = SBFolderRelativeListIndex(v6);
  if (v6)
  {
    unint64_t v8 = v7;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 < [(NSMutableArray *)self->_pageElements count])
    {
      double v9 = [(NSMutableArray *)self->_pageElements objectAtIndex:v8];
      uint64_t v23 = [v9 firstVisibleRowForGap];
      CGFloat v10 = (id *)MEMORY[0x1E4FB2608];
      uint64_t v11 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
      unint64_t currentPageIndex = self->_currentPageIndex;
      if (v8 >= currentPageIndex)
      {
        if (v8 <= currentPageIndex)
        {
          uint64_t v18 = [*v10 userInterfaceLayoutDirection];
          uint64_t v19 = [(NSMutableArray *)self->_pageElements objectAtIndex:self->_currentPageIndex];
          uint64_t v14 = 0;
          BOOL v20 = v18 == 0;
          if (v18) {
            uint64_t v16 = 0;
          }
          else {
            uint64_t v16 = (void *)v19;
          }
          if (v20) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = (void *)v19;
          }
          goto LABEL_34;
        }
        if (v11 == 1) {
          unint64_t v13 = v8;
        }
        else {
          unint64_t v13 = self->_currentPageIndex;
        }
        if (v11 == 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = 2;
        }
        if (v11 == 1) {
          unint64_t v15 = self->_currentPageIndex;
        }
        else {
          unint64_t v15 = v8;
        }
      }
      else
      {
        if (v11 == 1) {
          unint64_t v13 = self->_currentPageIndex;
        }
        else {
          unint64_t v13 = v8;
        }
        if (v11 == 1) {
          uint64_t v14 = 2;
        }
        else {
          uint64_t v14 = 1;
        }
        if (v11 == 1) {
          unint64_t v15 = v8;
        }
        else {
          unint64_t v15 = self->_currentPageIndex;
        }
      }
      uint64_t v16 = [(NSMutableArray *)self->_pageElements objectAtIndex:v13];
      uint64_t v17 = [(NSMutableArray *)self->_pageElements objectAtIndex:v15];
LABEL_34:
      CGRect v21 = [(NSMutableArray *)self->_pageElements objectAtIndex:self->_currentPageIndex];
      uint64_t v22 = v21;
      if (self->_currentPageIndex != v8 || [v21 visibleRow] != v23) {
        [(SBFolderIconImageView *)self _performScrollingDirection:v14 targetPageIndex:v8 targetPageScrollRow:v23 newLeftElement:v16 newRightElement:v17 animated:v3];
      }
    }
  }
}

- (void)scrollToGapOrTopIfFullOfPage:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSMutableArray *)self->_pageElements count] > a3)
  {
    unint64_t v7 = [(SBFolderIconImageView *)self _folderIcon];
    unint64_t v8 = [v7 folder];
    double v9 = [v8 indexPathForFirstFreeSlotAvoidingFirstList:0];

    if (SBFolderRelativeListIndex(v9) == a3)
    {
      CGFloat v10 = [(NSMutableArray *)self->_pageElements objectAtIndex:a3];
      uint64_t v11 = [v10 firstVisibleRowForGap];
    }
    else
    {
      uint64_t v11 = 0;
    }
    unint64_t currentPageIndex = self->_currentPageIndex;
    if (currentPageIndex <= a3)
    {
      id v17 = [(NSMutableArray *)self->_pageElements objectAtIndex:self->_currentPageIndex];
      if (currentPageIndex >= a3)
      {
        unint64_t v13 = 0;
        uint64_t v14 = 0;
      }
      else
      {
        unint64_t v13 = [(NSMutableArray *)self->_pageElements objectAtIndex:a3];
        uint64_t v14 = 2;
      }
    }
    else
    {
      id v17 = [(NSMutableArray *)self->_pageElements objectAtIndex:a3];
      unint64_t v13 = [(NSMutableArray *)self->_pageElements objectAtIndex:self->_currentPageIndex];
      uint64_t v14 = 1;
    }
    unint64_t v15 = [(NSMutableArray *)self->_pageElements objectAtIndex:self->_currentPageIndex];
    uint64_t v16 = v15;
    if (self->_currentPageIndex != a3 || [v15 visibleRow] != v11) {
      [(SBFolderIconImageView *)self _performScrollingDirection:v14 targetPageIndex:a3 targetPageScrollRow:v11 newLeftElement:v17 newRightElement:v13 animated:v4];
    }
  }
}

- (unint64_t)visibleMiniIconCount
{
  v2 = [(SBFolderIconImageView *)self representedListLayout];
  uint64_t v3 = [v2 numberOfRowsForOrientation:1];
  unint64_t v4 = [v2 numberOfColumnsForOrientation:1] * v3;

  return v4;
}

- (unint64_t)firstVisibleMiniIconIndex
{
  v2 = [(SBFolderIconImageView *)self _currentPageElement];
  unint64_t v3 = [v2 firstVisibleMiniIconIndex];

  return v3;
}

- (unint64_t)centerVisibleMiniIconIndex
{
  return [(SBFolderIconImageView *)self firstVisibleMiniIconIndex] + 4;
}

- (unint64_t)lastVisibleMiniIconIndex
{
  unint64_t v3 = [(SBFolderIconImageView *)self firstVisibleMiniIconIndex];
  return v3 + [(SBFolderIconImageView *)self visibleMiniIconCount] - 1;
}

- (CGRect)frameForMiniIconAtIndex:(unint64_t)a3
{
  unint64_t v4 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:a3 listIndex:self->_currentPageIndex];
  [(SBFolderIconImageView *)self frameForMiniIconAtIndexPath:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)visibleImageRelativeFrameForMiniIconAtIndex:(unint64_t)a3
{
  [(SBFolderIconImageView *)self frameForMiniIconAtIndex:a3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(SBIconImageView *)self visibleBounds];
  double v13 = v5 - v12;
  double v15 = v7 - v14;
  double v16 = v9;
  double v17 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

- (CGRect)frameForMiniIconAtIndexPath:(id)a3
{
  id v4 = a3;
  [(SBFolderIconImageView *)self layoutIfNeeded];
  unint64_t v5 = [(NSMutableArray *)self->_pageElements count];
  if (v5 <= [v4 sbListIndex])
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    uint64_t v6 = [v4 sbIconIndex];
    double v7 = -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", [v4 sbListIndex]);
    double v8 = [v7 gridImage];
    double v13 = objc_opt_class();
    double v14 = [(SBFolderIconImageView *)self representedListLayout];
    unint64_t v15 = [(SBFolderIconImageView *)self firstVisibleMiniIconIndex];
    double v16 = [(SBFolderIconImageView *)self _folderIcon];
    uint64_t v17 = [v16 gridCellIndexForIconIndex:v6];

    objc_msgSend(v13, "rectAtIndex:inLayout:maxCount:", v15, v14, objc_msgSend(v8, "numberOfCells"));
    double v19 = v18;
    objc_msgSend(v13, "rectAtIndex:inLayout:maxCount:", v17, v14, objc_msgSend(v8, "numberOfCells"));
    double v21 = v20;
    double v11 = v22;
    double v12 = v23;
    double v25 = v24 - v19;
    [(SBFolderIconGridViewing *)self->_leftWrapperView bounds];
    if (v27 == *MEMORY[0x1E4F1DB30] && v26 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [(SBFolderIconImageView *)self _interiorGridSize];
      [(SBFolderIconImageView *)self bounds];
      UIRectCenteredIntegralRectScale();
      double v9 = v21 + v33;
      double v10 = v25 + v34;
    }
    else
    {
      -[SBFolderIconImageView convertRect:fromView:](self, "convertRect:fromView:", self->_leftWrapperView, v21, v25, v11, v12);
      double v9 = v29;
      double v10 = v30;
      double v11 = v31;
      double v12 = v32;
    }
  }
  double v35 = v9;
  double v36 = v10;
  double v37 = v11;
  double v38 = v12;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (double)iconGridImageAlpha
{
  [(SBFolderIconGridViewing *)self->_leftWrapperView alpha];
  double v4 = v3;
  [(SBFolderIconGridViewing *)self->_rightWrapperView alpha];
  if (v4 >= result) {
    return v4;
  }
  return result;
}

- (void)setIconGridImageAlpha:(double)a3
{
  -[SBFolderIconGridViewing setAlpha:](self->_leftWrapperView, "setAlpha:");
  rightWrapperView = self->_rightWrapperView;
  [(SBFolderIconGridViewing *)rightWrapperView setAlpha:a3];
}

- (void)prepareToCrossfadeWithFloatyFolderView:(id)a3 allowFolderInteraction:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(SBFolderIconImageView *)self _setAnimating:1];
  [(SBFolderIconImageView *)self setUserInteractionEnabled:v4];
  objc_storeStrong((id *)&self->_crossfadeFolderView, a3);
  double v8 = [v7 borrowScalingView];
  crossfadeScalingView = self->_crossfadeScalingView;
  self->_crossfadeScalingView = v8;

  double v10 = self->_backgroundView;
  solidColorBackgroundView = self->_solidColorBackgroundView;
  if (solidColorBackgroundView)
  {
    double v12 = solidColorBackgroundView;

    double v10 = v12;
  }
  [(SBFolderIconImageView *)self insertSubview:self->_crossfadeScalingView aboveSubview:v10];
  [(SBIconImageView *)self visibleBounds];
  double v14 = v13;
  double v16 = v15;
  [(UIView *)self->_crossfadeScalingView bounds];
  double v18 = self->_crossfadeScalingView;
  CGAffineTransformMakeScale(&v20, v14 / v17, v16 / v19);
  [(UIView *)v18 setTransform:&v20];
  [(SBFolderIconImageView *)self setFloatyFolderCrossfadeFraction:0.0];
  [(SBFolderIconImageView *)self layoutIfNeeded];
}

- (void)setFloatyFolderCrossfadeFraction:(double)a3
{
  double v5 = 1.0 - a3;
  [(UIView *)self->_backgroundView setAlpha:1.0 - a3];
  [(UIView *)self->_solidColorBackgroundView setAlpha:v5];
  [(SBIconImageView *)self setOverlayAlpha:v5];
  [(SBFloatyFolderView *)self->_crossfadeFolderView setBackgroundAlpha:a3];
  [(SBIconImageView *)self visibleBounds];
  double v7 = v6;
  [(UIView *)self->_crossfadeScalingView bounds];
  double v9 = v7 / v8;
  id v15 = [(SBIconImageView *)self iconView];
  [v15 iconImageInfo];
  double v11 = v10;
  [(SBFloatyFolderView *)self->_crossfadeFolderView cornerRadius];
  double v13 = v12;
  double v14 = v9 * v12 * a3 + v5 * v11;
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:v14];
  [(SBFolderIconImageView *)self setPageGridCornerRadius:v14];
  [(UIView *)self->_solidColorBackgroundView _setContinuousCornerRadius:v14];
  [(SBFloatyFolderView *)self->_crossfadeFolderView setCornerRadius:v13 * a3 + v5 * (v11 / v9)];
}

- (void)cleanupAfterFloatyFolderCrossfade
{
  [(SBFolderIconImageView *)self _setAnimating:0];
  [(SBFolderIconImageView *)self setUserInteractionEnabled:0];
  [(UIView *)self->_backgroundView setAlpha:1.0];
  [(UIView *)self->_solidColorBackgroundView setAlpha:1.0];
  [(SBIconImageView *)self setOverlayAlpha:1.0];
  crossfadeScalingView = self->_crossfadeScalingView;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v11[0] = *MEMORY[0x1E4F1DAB8];
  v11[1] = v4;
  v11[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)crossfadeScalingView setTransform:v11];
  [(SBFloatyFolderView *)self->_crossfadeFolderView setBackgroundAlpha:1.0];
  [(SBFolderView *)self->_crossfadeFolderView returnScalingView];
  double v5 = [(SBIconImageView *)self iconView];
  [v5 iconImageInfo];
  double v7 = v6;
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:v6];
  [(SBFolderIconImageView *)self setPageGridCornerRadius:v7];
  [(UIView *)self->_solidColorBackgroundView _setContinuousCornerRadius:v7];
  crossfadeFolderView = self->_crossfadeFolderView;
  [(SBFloatyFolderView *)crossfadeFolderView cornerRadius];
  -[SBFloatyFolderView setCornerRadius:](crossfadeFolderView, "setCornerRadius:");
  double v9 = self->_crossfadeScalingView;
  self->_crossfadeScalingView = 0;

  double v10 = self->_crossfadeFolderView;
  self->_crossfadeFolderView = 0;
}

- (void)iconViewLegibilitySettingsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIconImageView;
  [(SBIconImageView *)&v3 iconViewLegibilitySettingsDidChange];
  [(SBFolderIconImageView *)self _updateAccessibilityBackgroundContrast];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFolderIconImageView;
  long long v4 = [(SBIconImageView *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendBool:self->_animating withName:@"animating"];
  return v4;
}

- (void)folderIconImageCache:(id)a3 didUpdateImagesForFolderIcon:(id)a4 imageAppearance:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9) {
    goto LABEL_5;
  }
  double v10 = [(SBFolderIconImageView *)self displayedImageAppearance];
  if (!v10 || [v9 isEqual:v10])
  {

LABEL_5:
    [(SBFolderIconImageView *)self updateImageAnimated:0];
    goto LABEL_7;
  }

LABEL_7:
}

void __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [*(id *)(a1 + 32) frame];
  objc_super v3 = objc_msgSend(v2, "initWithFrame:");
  [v3 _setContinuousCornerRadius:*(double *)(a1 + 80)];
  [v3 setClipsToBounds:1];
  [*(id *)(a1 + 40) insertSubview:v3 aboveSubview:*(void *)(a1 + 32)];
  [v3 setAlpha:0.0];
  [v3 setBackgroundColor:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 592);
  *(void *)(v4 + 592) = v3;
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 592) setAlpha:1.0];
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:1];
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setContinuousCornerRadius:*(double *)(a1 + 64)];
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

void __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == *(void **)(v3 + 592))
  {
    *(void *)(v3 + 592) = 0;
  }
}

- (void)_setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    [(SBFolderIconImageView *)self _updateRasterization];
  }
}

- (void)_performScrollingDirection:(int64_t)a3 targetPageIndex:(unint64_t)a4 targetPageScrollRow:(unint64_t)a5 newLeftElement:(id)a6 newRightElement:(id)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  p_leftWrapperView = &self->_leftWrapperView;
  leftWrapperView = self->_leftWrapperView;
  id v16 = a7;
  [(SBFolderIconGridViewing *)leftWrapperView setElement:a6];
  p_rightWrapperView = &self->_rightWrapperView;
  [(SBFolderIconGridViewing *)self->_rightWrapperView setElement:v16];

  if (a3 == 1)
  {
    [(SBFolderIconImageView *)self _showRightMinigrid];
    p_rightWrapperView = p_leftWrapperView;
LABEL_5:
    [(SBFolderIconGridViewing *)*p_rightWrapperView positionAtRow:a5];
    if (v8) {
      double v18 = 0.4;
    }
    else {
      double v18 = 0.0;
    }
    goto LABEL_12;
  }
  if (a3 == 2)
  {
    [(SBFolderIconImageView *)self _showLeftMinigrid];
    goto LABEL_5;
  }
  if (v8) {
    double v18 = 0.4;
  }
  else {
    double v18 = 0.0;
  }
  if (!a3)
  {
    int v19 = 1;
    goto LABEL_15;
  }
LABEL_12:
  if (v8) {
    [(SBFolderIconImageView *)self _setAnimating:1];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke;
  v27[3] = &unk_1E6AAC838;
  v27[4] = self;
  v27[5] = a3;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_2;
  v25[3] = &unk_1E6AAF6D8;
  BOOL v26 = v8;
  v25[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v27 options:v25 animations:v18 completion:0.0];
  int v19 = 0;
LABEL_15:
  CGAffineTransform v20 = [(NSMutableArray *)self->_pageElements objectAtIndex:self->_currentPageIndex];
  uint64_t v21 = [v20 visibleRow];
  if (v19 && v21 != a5)
  {
    if (v8) {
      [(SBFolderIconImageView *)self _setAnimating:1];
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_3;
    v24[3] = &unk_1E6AAC838;
    v24[4] = self;
    v24[5] = a5;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_4;
    v22[3] = &unk_1E6AAF6D8;
    BOOL v23 = v8;
    v22[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v24 options:v22 animations:v18 completion:0.0];
  }
  self->_unint64_t currentPageIndex = a4;
  if (!v8) {
    [(SBFolderIconImageView *)self updateImageAnimated:0];
  }
}

uint64_t __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1 == 1) {
    return [*(id *)(result + 32) _showLeftMinigrid];
  }
  if (v1 == 2) {
    return [*(id *)(result + 32) _showRightMinigrid];
  }
  return result;
}

uint64_t __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 40))
    {
      [*(id *)(result + 32) updateImageAnimated:0];
      uint64_t v3 = *(void **)(v2 + 32);
      return [v3 _setAnimating:0];
    }
  }
  return result;
}

uint64_t __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 608) positionAtRow:*(void *)(a1 + 40)];
}

uint64_t __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 40))
    {
      [*(id *)(result + 32) updateImageAnimated:0];
      uint64_t v3 = *(void **)(v2 + 32);
      return [v3 _setAnimating:0];
    }
  }
  return result;
}

- (id)_currentPageElement
{
  return (id)[(NSMutableArray *)self->_pageElements objectAtIndex:self->_currentPageIndex];
}

- (UIView)currentPageView
{
  return (UIView *)self->_leftWrapperView;
}

- (NSArray)currentPageIconLayers
{
  uint64_t v2 = [(SBFolderIconImageView *)self _currentPageElement];
  uint64_t v3 = [v2 gridLayer];
  uint64_t v4 = [v3 sublayers];

  return (NSArray *)v4;
}

- (void)_showRightMinigrid
{
  [(SBFolderIconImageView *)self bounds];
  pageGridContainer = self->_pageGridContainer;
  -[UIView setBounds:](pageGridContainer, "setBounds:", v3, 0.0);
}

- (BOOL)pageGridClipsToBounds
{
  return [(UIView *)self->_pageGridContainer clipsToBounds];
}

- (void)setPageGridClipsToBounds:(BOOL)a3
{
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (unint64_t)currentBackgroundStyle
{
  return self->_currentBackgroundStyle;
}

- (void)setAnimatingIconImageInfoChange:(BOOL)a3
{
  self->_animatingIconImageInfoChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedImageAppearance, 0);
  objc_storeStrong((id *)&self->_crossfadeScalingView, 0);
  objc_storeStrong((id *)&self->_crossfadeFolderView, 0);
  objc_storeStrong((id *)&self->_pageElements, 0);
  objc_storeStrong((id *)&self->_rightWrapperView, 0);
  objc_storeStrong((id *)&self->_leftWrapperView, 0);
  objc_storeStrong((id *)&self->_pageGridContainer, 0);
  objc_storeStrong((id *)&self->_solidColorBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end