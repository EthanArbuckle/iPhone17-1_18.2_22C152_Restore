@interface PXStoryMemoryFeedViewLayoutSpec
- (BOOL)allowsAutoplayContent;
- (BOOL)isFullScreen;
- (BOOL)wantsFirstItemFullscreen;
- (BOOL)wantsItemHoverEvents;
- (BOOL)wantsSafeAreaInsets;
- (BOOL)wantsScrollIndicators;
- (NSShadow)itemShadow;
- (PXMemoriesSpec)memoriesSpec;
- (PXScrollBehavior)scrollBehavior;
- (PXStoryMemoryFeedViewLayoutSpec)init;
- (PXStoryMemoryFeedViewLayoutSpec)initWithMemoriesSpec:(id)a3;
- (UIColor)subtitleColor;
- (UIEdgeInsets)horizontalScrollIndicatorInsets;
- (UIEdgeInsets)placeholderMargins;
- (UIEdgeInsets)subtitleInsets;
- (UIEdgeInsets)verticalScrollIndicatorInsets;
- (UIEdgeInsets)viewOutsets;
- (UIFont)subtitleFont;
- (double)itemCornerRadius;
- (double)overlayFeedPeekDistance;
- (id)_fullscreenLayoutGeneratorWithReferenceSize:(CGSize)a3;
- (id)layoutGeneratorWithReferenceSize:(CGSize)a3;
- (int64_t)numberOfColumns;
- (int64_t)rootLayoutOrientation;
- (void)setIsFullScreen:(BOOL)a3;
@end

@implementation PXStoryMemoryFeedViewLayoutSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoriesSpec, 0);
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_itemShadow, 0);
  objc_storeStrong((id *)&self->_scrollBehavior, 0);
}

- (PXMemoriesSpec)memoriesSpec
{
  return self->_memoriesSpec;
}

- (UIEdgeInsets)subtitleInsets
{
  double top = self->_subtitleInsets.top;
  double left = self->_subtitleInsets.left;
  double bottom = self->_subtitleInsets.bottom;
  double right = self->_subtitleInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setIsFullScreen:(BOOL)a3
{
  self->_isFullScreen = a3;
}

- (BOOL)isFullScreen
{
  return self->_isFullScreen;
}

- (UIEdgeInsets)viewOutsets
{
  double top = self->_viewOutsets.top;
  double left = self->_viewOutsets.left;
  double bottom = self->_viewOutsets.bottom;
  double right = self->_viewOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSShadow)itemShadow
{
  return self->_itemShadow;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (double)overlayFeedPeekDistance
{
  return self->_overlayFeedPeekDistance;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (PXScrollBehavior)scrollBehavior
{
  return self->_scrollBehavior;
}

- (id)_fullscreenLayoutGeneratorWithReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(PXStoryMemoryFeedViewLayoutSpec *)self memoriesSpec];
  v7 = +[PXStorySettings sharedInstance];
  self->_numberOfColumns = 4;
  [v6 feedEntryEdgeInsets];
  if (v8 >= 12.0) {
    double v10 = v8;
  }
  else {
    double v10 = 12.0;
  }
  if (v9 >= 12.0) {
    double v11 = v9;
  }
  else {
    double v11 = 12.0;
  }
  double v12 = (width + -24.0 + -24.0 - (double)(self->_numberOfColumns - 1) * 12.0) / (double)self->_numberOfColumns;
  [v7 feedCardLandscapeAspectRatio];
  double v14 = v12 / v13 * 0.5;
  self->_overlayFeedPeekDistance = v14;
  v15 = +[PXScrollBehavior normalBehaviorWithAxis:1 intrinsicContentOffset:height - v14];
  scrollBehavior = self->_scrollBehavior;
  self->_scrollBehavior = v15;

  v17 = objc_alloc_init(PXOverlayFeedLayoutMetrics);
  -[PXLayoutMetrics setReferenceSize:](v17, "setReferenceSize:", width, height);
  -[PXOverlayFeedLayoutMetrics setContentInsets:](v17, "setContentInsets:", v10, 24.0, v11, 24.0);
  -[PXOverlayFeedLayoutMetrics setInterItemSpacing:](v17, "setInterItemSpacing:", 12.0, 12.0);
  [(PXOverlayFeedLayoutMetrics *)v17 setFirstRowTopMargin:-self->_overlayFeedPeekDistance];
  [v7 feedCardLandscapeAspectRatio];
  -[PXOverlayFeedLayoutMetrics setRegularItemAspectRatio:](v17, "setRegularItemAspectRatio:");
  [v7 feedCardWideLandscapeAspectRatio];
  -[PXOverlayFeedLayoutMetrics setLargeItemAspectRatio:](v17, "setLargeItemAspectRatio:");
  -[PXOverlayFeedLayoutMetrics setUseSimpleLayout:](v17, "setUseSimpleLayout:", [v7 useSimpleOverlayFeedLayout]);
  v18 = [[PXOverlayFeedLayoutGenerator alloc] initWithMetrics:v17];

  return v18;
}

- (id)layoutGeneratorWithReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (![(PXStoryMemoryFeedViewLayoutSpec *)self wantsFirstItemFullscreen])
  {
    v7 = [(PXStoryMemoryFeedViewLayoutSpec *)self memoriesSpec];
    double v8 = +[PXStorySettings sharedInstance];
    uint64_t v9 = [v7 userInterfaceIdiom];
    BOOL v11 = [(PXStoryMemoryFeedViewLayoutSpec *)self rootLayoutOrientation] == 2 || v9 == 4;
    unint64_t v12 = [v7 sizeClass];
    if (v11) {
      unsigned int v13 = 2;
    }
    else {
      unsigned int v13 = 1;
    }
    if (v12 == 2) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = 0;
    }
    if (v12 >= 2) {
      int64_t v15 = v14;
    }
    else {
      int64_t v15 = v13;
    }
    self->_numberOfColumns = v15;
    if (v11) {
      [v8 feedCardLandscapeAspectRatio];
    }
    else {
      [v8 feedCardPortraitAspectRatio];
    }
    [v7 feedInteritemSpacing];
    [v7 feedEntryEdgeInsets];
    [v7 safeAreaInsets];
    PXEdgeInsetsMax();
  }
  v6 = -[PXStoryMemoryFeedViewLayoutSpec _fullscreenLayoutGeneratorWithReferenceSize:](self, "_fullscreenLayoutGeneratorWithReferenceSize:", width, height);
  return v6;
}

- (BOOL)allowsAutoplayContent
{
  return 1;
}

- (int64_t)rootLayoutOrientation
{
  int64_t result = self->_rootLayoutOrientation;
  if (!result)
  {
    v4 = [(PXStoryMemoryFeedViewLayoutSpec *)self memoriesSpec];
    v5 = [v4 rootExtendedTraitCollection];
    self->_rootLayoutOrientation = [v5 layoutOrientation];

    return self->_rootLayoutOrientation;
  }
  return result;
}

- (UIEdgeInsets)placeholderMargins
{
  double v2 = *(double *)off_1E5DAAF10;
  double v3 = *((double *)off_1E5DAAF10 + 1);
  double v4 = *((double *)off_1E5DAAF10 + 2);
  double v5 = *((double *)off_1E5DAAF10 + 3);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (BOOL)wantsItemHoverEvents
{
  double v2 = +[PXStorySettings sharedInstance];
  char v3 = [v2 showFeedChromeOnHover];

  return v3;
}

- (BOOL)wantsFirstItemFullscreen
{
  double v2 = +[PXStorySettings sharedInstance];
  char v3 = [v2 wantsFullscreenFeedExperience];

  return v3;
}

- (BOOL)wantsSafeAreaInsets
{
  return 1;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  double v2 = *(double *)off_1E5DAAF10;
  double v3 = *((double *)off_1E5DAAF10 + 1);
  double v4 = *((double *)off_1E5DAAF10 + 2);
  double v5 = *((double *)off_1E5DAAF10 + 3);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  double v2 = *(double *)off_1E5DAAF10;
  double v3 = *((double *)off_1E5DAAF10 + 1);
  double v4 = *((double *)off_1E5DAAF10 + 2);
  double v5 = *((double *)off_1E5DAAF10 + 3);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (BOOL)wantsScrollIndicators
{
  return 1;
}

- (PXStoryMemoryFeedViewLayoutSpec)initWithMemoriesSpec:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXStoryMemoryFeedViewLayoutSpecManager.m", 113, @"Invalid parameter not satisfying: %@", @"memoriesSpec != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PXStoryMemoryFeedViewLayoutSpec;
  v7 = [(PXStoryMemoryFeedViewLayoutSpec *)&v17 init];
  double v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_memoriesSpec, a3);
    uint64_t v9 = +[PXScrollBehavior normalBehaviorWithAxis:1];
    scrollBehavior = v8->_scrollBehavior;
    v8->_scrollBehavior = (PXScrollBehavior *)v9;

    BOOL v11 = +[PXStorySettings sharedInstance];
    [v11 feedItemCornerRadius];
    v8->_itemCornerRadius = v12;
    if ([v11 wantsFeedItemShadow])
    {
      uint64_t v13 = [v11 feedItemShadow];
      itemShadow = v8->_itemShadow;
      v8->_itemShadow = (NSShadow *)v13;
    }
    else
    {
      itemShadow = v8->_itemShadow;
      v8->_itemShadow = 0;
    }
  }
  return v8;
}

- (PXStoryMemoryFeedViewLayoutSpec)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMemoryFeedViewLayoutSpecManager.m", 109, @"%s is not available as initializer", "-[PXStoryMemoryFeedViewLayoutSpec init]");

  abort();
}

@end