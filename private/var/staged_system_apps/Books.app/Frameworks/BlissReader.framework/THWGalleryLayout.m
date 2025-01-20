@interface THWGalleryLayout
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)individualCaptions;
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isReflowablePresentation;
- (BOOL)p_hasIndividualCaptions;
- (BOOL)p_thumbnailsVisible;
- (BOOL)p_thumbnailsVisibleInPanel;
- (BOOL)p_thumbnailsVisibleOnMainCanvas;
- (BOOL)stageVisible;
- (CGPoint)galleryCaptionPosition;
- (CGRect)pageControlFrame;
- (CGRect)stageFrame;
- (CGRect)thumbnailTrackFrame;
- (CGSize)p_idealForMaxSize:(CGSize)a3;
- (CGSize)p_thumbnailSize;
- (CGSize)thumbnailTrackSizeWithPanelWidth:(double)a3;
- (CGSize)zoomableCanvasSizeForItem:(id)a3;
- (NSArray)imageInfos;
- (NSArray)stageInfos;
- (NSArray)thumbnailButtons;
- (NSArray)thumbnailControlPages;
- (NSArray)zoomableCanvasControls;
- (NSArray)zoomableCanvasPages;
- (THWGalleryCaptionLayout)captionLayout;
- (THWPageControlLayout)pageControl;
- (THWPageControlLayout)thumbnailPageControl;
- (THWPagedCanvasControlLayout)stageCanvasLayout;
- (THWPagedCanvasControlLayout)thumbnailTrackCanvasLayout;
- (THWWidgetLayoutDelegate)delegate;
- (__CTFont)createFontFromCaption;
- (double)expandedLeftRightInsetForCaption;
- (double)galleryCaptionWidth;
- (double)p_internalMargin;
- (double)p_margin;
- (double)p_widgetWidth;
- (double)stageCornerRadius;
- (double)thumbnailTrackVerticalPadding;
- (double)widgetStack:(id)a3 idealHeightForMaxSize:(CGSize)a4;
- (double)widgetStack:(id)a3 stackedControlContainer:(id)a4 minHeightForLayout:(id)a5;
- (double)zoomableItemMinimumViewScaleForItem:(id)a3;
- (id)captionStorageForItemIndex:(unint64_t)a3;
- (id)childrenForLayout;
- (id)colorFromCaption;
- (id)colorFromTitle;
- (id)computeLayoutGeometry;
- (id)controlContainerAdditionalChildLayouts:(id)a3;
- (id)currentCaptionStorage;
- (id)dependentLayouts;
- (id)infosForStagePages:(_NSRange)a3;
- (id)infosForThumbnailTrackPages:(_NSRange)a3;
- (id)layoutGeometryForLayout:(id)a3;
- (id)layoutGeometryFromProvider;
- (id)p_captionStorageForItemIndex:(unint64_t)a3;
- (id)p_itemAtIndex:(unint64_t)a3;
- (id)p_itemFromChildLayout:(id)a3;
- (id)p_nonEmptyCaptionStorage;
- (id)p_sharedCaptionStorage;
- (id)pageIndexesFromStageReps:(id)a3;
- (id)sharedCaptionStorage;
- (id)thumbnailBorderColor;
- (id)thumbnailTrackAdditionalLayoutsInExpandedPanel:(int)a3;
- (id)widgetStack:(id)a3 layoutGeometryForLayout:(id)a4;
- (id)widgetStackCaptionChildren:(id)a3;
- (id)widgetStackTitleChildren:(id)a3;
- (id)zoomableCanvasControlLayoutForItemIndex:(unint64_t)a3;
- (unint64_t)numberOfStagePages;
- (unint64_t)numberOfThumbnailTrackPages;
- (unint64_t)p_indexForItem:(id)a3;
- (unint64_t)p_maxNumberOfThumbnailsPerPage;
- (unint64_t)p_numberOfThumbnailPagesAndThumbnailsPerPage:(unint64_t *)a3;
- (unint64_t)p_thumbnailCountForThumbnailPageIndex:(unint64_t)a3;
- (unint64_t)p_thumbnailPageIndexForItemIndex:(unint64_t)a3;
- (unint64_t)thumbnailPageIndexForItemIndex:(unint64_t)a3;
- (void)dealloc;
- (void)p_invalidateExternal;
- (void)p_updateCaption;
- (void)p_updatePagesAndThumbnailLayouts;
- (void)pagedCanvasControlLayoutDidValidate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStageInfos:(id)a3;
- (void)updateChildrenFromInfo;
- (void)updateCurrentItemIndex:(unint64_t)a3;
- (void)wasAddedToLayoutController:(id)a3;
@end

@implementation THWGalleryLayout

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWGalleryLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (void)p_invalidateExternal
{
  [(THWGalleryLayout *)self invalidateFrame];

  [(THWGalleryLayout *)self invalidateChildren];
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (THWWidgetLayoutDelegate *)a3;
    [(THWGalleryLayout *)self p_invalidateExternal];
  }
}

- (void)wasAddedToLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWGalleryLayout;
  [(THWGalleryLayout *)&v4 wasAddedToLayoutController:a3];
  [(THWGalleryLayout *)self p_invalidateExternal];
}

- (BOOL)isExpanded
{
  delegate = self->_delegate;
  if (delegate) {
    LOBYTE(delegate) = [(THWWidgetLayoutDelegate *)delegate widgetLayoutMode:self] == 1;
  }
  return (char)delegate;
}

- (BOOL)isCompactFlowPresentation
{
  objc_super v3 = [(THWGalleryLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  objc_super v3 = [(THWGalleryLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (CGSize)p_idealForMaxSize:(CGSize)a3
{
  objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "stageGeometry"), "frame");
  [(THWGalleryLayout *)self p_margin];
  double v5 = v4 + v4;
  TSDScaleSizeWithinSize();
  TSDRoundedSize();
  double v7 = v5 + v6;
  double v9 = v5 + v8;
  result.height = v9;
  result.width = v7;
  return result;
}

- (double)widgetStack:(id)a3 idealHeightForMaxSize:(CGSize)a4
{
  -[THWGalleryLayout p_idealForMaxSize:](self, "p_idealForMaxSize:", a3, a4.width, a4.height);
  return v4;
}

- (double)widgetStack:(id)a3 stackedControlContainer:(id)a4 minHeightForLayout:(id)a5
{
  [a5 frame:a3];
  double v8 = v7;
  double v10 = v9;
  objc_opt_class();
  uint64_t v11 = TSUDynamicCast();
  if (v11)
  {
    v12 = (void *)v11;
    if ([(THWGalleryLayout *)self individualCaptions])
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v13 = [[self info] items];
      id v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v34;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v34 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = [*(id *)(*((void *)&v33 + 1) + 8 * i) captionStorage];
            if (v18 == [v12 info])
            {
              if (objc_opt_respondsToSelector())
              {
                long long v31 = 0u;
                long long v32 = 0u;
                long long v29 = 0u;
                long long v30 = 0u;
                id v19 = [[self info:0] items];
                id v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
                if (v20)
                {
                  id v21 = v20;
                  uint64_t v22 = *(void *)v30;
                  do
                  {
                    for (j = 0; j != v21; j = (char *)j + 1)
                    {
                      if (*(void *)v30 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      id v24 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)j) captionStorage];
                      id v25 = [objc_alloc((Class)TSWPStorageMeasurer) initWithStorage:v24];
                      [v25 measuredSizeWithFlags:3 layoutParent:a4 styleProvider:[a4 styleProviderForStorage:v24] maxSize:v8 styleProvider:4294967300.0];
                      double v27 = v26;

                      if (v10 < v27) {
                        double v10 = v27;
                      }
                    }
                    id v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
                  }
                  while (v21);
                }
              }
              return v10;
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
  }
  return v10;
}

- (id)widgetStackTitleChildren:(id)a3
{
  id v4 = +[NSMutableArray array];
  id v5 = [[self info] adornmentInfo];
  unsigned int v6 = [v5 layoutMode];
  if (v6 <= 1)
  {
    unsigned int v7 = v6;
    if ([v5 titleStorage]) {
      [v4 addObject:[v5 titleStorage]];
    }
    if (v7 == 1 && [(THWGalleryLayout *)self currentCaptionStorage]) {
      [v4 addObject:[self currentCaptionStorage]];
    }
  }
  return v4;
}

- (id)widgetStackCaptionChildren:(id)a3
{
  id v4 = +[NSMutableArray array];
  id v5 = [[self info] adornmentInfo];
  unsigned int v6 = [v5 layoutMode];
  if (v6)
  {
    if (v6 != 2) {
      goto LABEL_7;
    }
    if ([v5 titleStorage]) {
      [v4 addObject:[v5 titleStorage]];
    }
  }
  if ([(THWGalleryLayout *)self currentCaptionStorage]) {
    [v4 addObject:[self currentCaptionStorage]];
  }
LABEL_7:
  if (![(THWGalleryLayout *)self p_thumbnailsVisible]
    || (objc_msgSend(-[THWGalleryLayout layoutController](self, "layoutController"), "isCompactWidth") & 1) != 0
    || (objc_msgSend(-[THWGalleryLayout layoutController](self, "layoutController"), "isCompactHeight") & 1) != 0)
  {
    p_pageControl = &self->_pageControl;
    if (self->_pageControl
      && (unint64_t)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count") >= 2)
    {
LABEL_12:
      [v4 addObject:*p_pageControl];
    }
  }
  else
  {
    if (self->_thumbnailTrackCanvasLayout) {
      [v4 addObject:];
    }
    p_pageControl = &self->_thumbnailPageControl;
    if (self->_thumbnailPageControl
      && [(THWGalleryLayout *)self numberOfThumbnailTrackPages] > 1)
    {
      goto LABEL_12;
    }
  }
  return v4;
}

- (id)widgetStack:(id)a3 layoutGeometryForLayout:(id)a4
{
  if (self->_thumbnailPageControl == a4 || self->_pageControl == a4)
  {
    id v7 = objc_alloc((Class)TSDLayoutGeometry);
    [a3 widgetStackWidth];
  }
  else
  {
    if (self->_thumbnailTrackCanvasLayout != a4) {
      return 0;
    }
    id v7 = objc_alloc((Class)TSDLayoutGeometry);
    [a3 widgetStackWidth];
    [(THWGalleryLayout *)self p_thumbnailSize];
  }
  TSDRectWithSize();
  id v8 = [v7 initWithFrame:];

  return v8;
}

- (CGSize)p_thumbnailSize
{
  unsigned int v2 = [(THWGalleryLayout *)self isExpanded];
  double v3 = 50.0;
  if (v2) {
    double v3 = 60.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)p_margin
{
  [self info].contentPadding
  double v4 = v3;
  unsigned __int8 v5 = [(THWGalleryLayout *)self isExpanded];
  double result = 10.0;
  if ((v5 & 1) == 0)
  {
    unsigned int v7 = [(THWGalleryLayout *)self isCompactFlowPresentation];
    double result = 0.0;
    if (!v7) {
      return v4;
    }
  }
  return result;
}

- (double)p_internalMargin
{
  return 10.0;
}

- (id)p_itemFromChildLayout:(id)a3
{
  id v4 = [a3 info];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [[self info:0] items];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v7) {
    return 0;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
    if ([v11 imageInfo] == v5 || objc_msgSend(objc_msgSend(v11, "imageInfo"), "maskInfo") == v5) {
      return v11;
    }
    if (v8 == (id)++v10)
    {
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v11 = 0;
      if (v8) {
        goto LABEL_4;
      }
      return v11;
    }
  }
}

- (unint64_t)p_indexForItem:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = [[self info] items];

  return (unint64_t)[v4 indexOfObjectIdenticalTo:a3];
}

- (BOOL)p_thumbnailsVisible
{
  id v2 = [(THWGalleryLayout *)self info];

  return [v2 thumbnailsVisible];
}

- (BOOL)p_thumbnailsVisibleInPanel
{
  unsigned int v3 = [self info].thumbnailsVisible;
  if (v3)
  {
    LOBYTE(v3) = [(THWGalleryLayout *)self isExpanded];
  }
  return v3;
}

- (BOOL)p_thumbnailsVisibleOnMainCanvas
{
  BOOL v3 = [(THWGalleryLayout *)self p_thumbnailsVisible];
  if (self->_delegate) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = !v3;
  }
  if (!v4) {
    LOBYTE(v3) = [0 widgetLayoutMode:self] != 1;
  }
  return v3;
}

- (double)p_widgetWidth
{
  delegate = self->_delegate;
  if (!delegate) {
    goto LABEL_5;
  }
  unsigned int v4 = [(THWWidgetLayoutDelegate *)delegate widgetLayoutMode:self];
  if (v4 - 1 < 2)
  {
    [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutBounds];
    return v6;
  }
  else if (v4 == 3)
  {
    id v7 = [[-[THWGalleryLayout layoutController](self, "layoutController")] ancestorLayoutOfLayout:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWWidgetStackOwner];
    [v7 widgetStackWidth];
  }
  else
  {
    double result = 0.0;
    if (!v4) {
LABEL_5:
    }
      objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "geometry"), "size");
  }
  return result;
}

- (unint64_t)p_numberOfThumbnailPagesAndThumbnailsPerPage:(unint64_t *)a3
{
  if ([(THWGalleryLayout *)self p_thumbnailsVisible])
  {
    id v5 = objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
    unint64_t v6 = [(THWGalleryLayout *)self p_maxNumberOfThumbnailsPerPage];
    unint64_t v7 = (unint64_t)fmaxf(ceilf((float)(uint64_t)v5 / (float)v6), 1.0);
    if (!a3) {
      return v7;
    }
    goto LABEL_5;
  }
  unint64_t v6 = 0;
  unint64_t v7 = 0;
  if (a3) {
LABEL_5:
  }
    *a3 = v6;
  return v7;
}

- (unint64_t)p_maxNumberOfThumbnailsPerPage
{
  [(THWGalleryLayout *)self p_widgetWidth];
  double v4 = v3;
  [(THWGalleryLayout *)self p_margin];
  double v6 = v4 + v5 * -2.0;
  [(THWGalleryLayout *)self p_thumbnailSize];
  if (v6 <= v7 * 2.0 + 10.0) {
    return 1;
  }
  else {
    return (unint64_t)(floor((v6 - v7) / (v7 + 10.0)) + 1.0);
  }
}

- (unint64_t)p_thumbnailPageIndexForItemIndex:(unint64_t)a3
{
  unint64_t v5 = 0;
  [(THWGalleryLayout *)self p_numberOfThumbnailPagesAndThumbnailsPerPage:&v5];
  if (v5) {
    return a3 / v5;
  }
  else {
    return 0;
  }
}

- (unint64_t)p_thumbnailCountForThumbnailPageIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  [(THWGalleryLayout *)self p_numberOfThumbnailPagesAndThumbnailsPerPage:&v9];
  unint64_t v5 = v9 * a3;
  id v6 = objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
  id v7 = (id)(v9 + v5);
  if ((unint64_t)v6 < v9 + v5) {
    id v7 = v6;
  }
  return (unint64_t)v7 - v5;
}

- (id)p_itemAtIndex:(unint64_t)a3
{
  id v4 = [[self info] items];
  if ((unint64_t)[v4 count] <= a3) {
    return 0;
  }

  return [v4 objectAtIndex:a3];
}

- (id)p_captionStorageForItemIndex:(unint64_t)a3
{
  id v4 = [(THWGalleryLayout *)self p_itemAtIndex:a3];
  if (!v4 || (id v5 = [v4 captionStorage]) == 0) {
    id v5 = [(THWGalleryLayout *)self p_sharedCaptionStorage];
  }
  if ([v5 length]) {
    return v5;
  }
  else {
    return 0;
  }
}

- (id)p_sharedCaptionStorage
{
  id v2 = [[[THWGalleryLayout info] adornmentInfo] caption].containedStorage;
  if ([v2 length]) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)thumbnailBorderColor
{
  if ([(THWGalleryLayout *)self isExpanded])
  {
    return +[TSUColor colorWithWhite:1.0 alpha:0.8];
  }
  else
  {
    id v4 = objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"), "titleColor");
    return [v4 colorWithAlphaComponent:0.5];
  }
}

- (void)updateCurrentItemIndex:(unint64_t)a3
{
  [(THWGalleryCaptionLayout *)self->_captionLayout captionStorageUpdated];
  [(THWPageControlLayout *)self->_pageControl setCurrentPage:a3];
  if ([(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self] == 3)
  {
    id v5 = [[-[THWGalleryLayout layoutController](self, "layoutController")] ancestorLayoutOfLayout:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWWidgetStackOwner];
    [v5 widgetStackInvalidateChildren];
  }
}

- (CGSize)zoomableCanvasSizeForItem:(id)a3
{
  if (a3)
  {
    objc_msgSend(objc_msgSend(a3, "imageInfo"), "naturalSize");
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)zoomableItemMinimumViewScaleForItem:(id)a3
{
  if (!a3) {
    return 1.0;
  }
  objc_msgSend(objc_msgSend(a3, "imageInfo"), "naturalSize");
  if (v4 <= 0.0) {
    double v4 = 1.0;
  }
  if (v5 <= 0.0) {
    double v5 = 1.0;
  }
  double result = self->_stageFrame.size.width / v4;
  CGFloat v7 = self->_stageFrame.size.height / v5;
  if (result >= v7) {
    double result = v7;
  }
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (id)currentCaptionStorage
{
  unint64_t v3 = [(THWPageControlLayout *)self->_pageControl currentPage];

  return [(THWGalleryLayout *)self p_captionStorageForItemIndex:v3];
}

- (id)captionStorageForItemIndex:(unint64_t)a3
{
  return [(THWGalleryLayout *)self p_captionStorageForItemIndex:a3];
}

- (id)sharedCaptionStorage
{
  if (self->_captionLayout) {
    return 0;
  }
  else {
    return [(THWGalleryLayout *)self p_sharedCaptionStorage];
  }
}

- (double)expandedLeftRightInsetForCaption
{
  unint64_t v3 = [(THWGalleryLayout *)self p_maxNumberOfThumbnailsPerPage];
  [(THWGalleryLayout *)self p_thumbnailSize];
  double v5 = v4;
  [(THWGalleryLayout *)self p_widgetWidth];
  return (v6 - v5 * (double)v3 - (double)(10 * v3 - 10)) * 0.5 + -8.0;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  if (a3 == 2)
  {
    return [(THWGalleryLayout *)self thumbnailsVisibleInPanel];
  }
  else
  {
    if (a3 == 1)
    {
      if ([(THWGalleryLayout *)self individualCaptions]) {
        return 1;
      }
      id v4 = [(THWGalleryLayout *)self sharedCaptionStorage];
    }
    else
    {
      if (a3) {
        return 0;
      }
      id v4 = [[[self info] adornmentInfo] title];
    }
    return v4 != 0;
  }
}

- (unint64_t)thumbnailPageIndexForItemIndex:(unint64_t)a3
{
  unint64_t v5 = 0;
  [(THWGalleryLayout *)self p_numberOfThumbnailPagesAndThumbnailsPerPage:&v5];
  if (v5) {
    return a3 / v5;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (CGSize)thumbnailTrackSizeWithPanelWidth:(double)a3
{
  [(THWGalleryLayout *)self p_thumbnailSize];
  double v5 = a3;
  result.double height = v4;
  result.double width = v5;
  return result;
}

- (double)thumbnailTrackVerticalPadding
{
  return 12.0;
}

- (id)thumbnailTrackAdditionalLayoutsInExpandedPanel:(int)a3
{
  [(THWGalleryLayout *)self p_updatePagesAndThumbnailLayouts];
  [(THWGalleryLayout *)self p_updateCaption];
  if (a3 == 2)
  {
    if (self->_thumbnailTrackCanvasLayout)
    {
      thumbnailTrackCanvasLayout = self->_thumbnailTrackCanvasLayout;
      double v6 = +[NSArray arrayWithObjects:&thumbnailTrackCanvasLayout count:1];
    }
    else
    {
      double v6 = 0;
    }
    thumbnailPageControl = self->_thumbnailPageControl;
    if (thumbnailPageControl && [(THWPageControlLayout *)thumbnailPageControl numberOfPages] >= 2) {
      return [(NSArray *)v6 arrayByAddingObject:self->_thumbnailPageControl];
    }
  }
  else
  {
    if (a3 == 1 && self->_captionLayout)
    {
      captionLayout = self->_captionLayout;
      return +[NSArray arrayWithObjects:&captionLayout count:1];
    }
    return 0;
  }
  return v6;
}

- (id)zoomableCanvasControlLayoutForItemIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_zoomableCanvasControls count] <= a3) {
    return 0;
  }
  zoomableCanvasControls = self->_zoomableCanvasControls;

  return [(NSArray *)zoomableCanvasControls objectAtIndex:a3];
}

- (BOOL)individualCaptions
{
  return self->_captionLayout != 0;
}

- (id)layoutGeometryFromProvider
{
  if ([(THWGalleryLayout *)self isExpanded])
  {
    [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutBounds];
    id v7 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v3, v4, v5, v6];
    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWGalleryLayout;
    return [(THWGalleryLayout *)&v9 layoutGeometryFromProvider];
  }
}

- (id)computeLayoutGeometry
{
  v30.receiver = self;
  v30.super_class = (Class)THWGalleryLayout;
  id v3 = [(THWGalleryLayout *)&v30 computeLayoutGeometry];
  [(THWGalleryLayout *)self p_margin];
  CGFloat v5 = v4;
  unsigned int v6 = [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self];
  if (v6 == 3)
  {
    [v3 size];
    -[THWGalleryLayout p_idealForMaxSize:](self, "p_idealForMaxSize:");
    TSDRectWithSize();
    [v3 size];
    TSDRectWithSize();
    TSDCenterRectOverRect();
    self->_stageFrame.origin.x = v12;
    self->_stageFrame.origin.CGFloat y = v13;
    self->_stageFrame.size.double width = v14;
    self->_stageFrame.size.double height = v15;
    id v16 = [[self info] stageGeometry];
LABEL_6:
    [v16 cornerRadius];
    goto LABEL_7;
  }
  if (v6 != 1)
  {
    id v17 = [[self info] stageGeometry];
    [v17 frame];
    self->_stageFrame.origin.x = v18;
    self->_stageFrame.origin.CGFloat y = v19;
    self->_stageFrame.size.double width = v20;
    self->_stageFrame.size.double height = v21;
    id v16 = v17;
    goto LABEL_6;
  }
  [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutBounds];
  self->_stageFrame.origin.x = v7;
  self->_stageFrame.origin.CGFloat y = v8;
  self->_stageFrame.size.double width = v9;
  self->_stageFrame.size.double height = v10;
  double v11 = 0.0;
LABEL_7:
  self->_stageCornerRadius = v11;
  [(THWGalleryLayout *)self p_thumbnailSize];
  double v23 = v22;
  CGFloat y = CGPointZero.y;
  [v3 size];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  if ([(THWGalleryLayout *)self p_thumbnailsVisibleOnMainCanvas])
  {
    v31.origin.x = CGPointZero.x;
    v31.origin.CGFloat y = y;
    v31.size.double width = v26;
    v31.size.double height = v28;
    CGRect v32 = CGRectInset(v31, 0.0, v5);
    self->_thumbnailTrackFrame.origin.x = v32.origin.x;
    self->_thumbnailTrackFrame.origin.CGFloat y = v32.origin.y + v32.size.height - v23;
    self->_thumbnailTrackFrame.size.double width = v32.size.width;
    self->_thumbnailTrackFrame.size.double height = v23;
    if ([(THWGalleryLayout *)self p_numberOfThumbnailPagesAndThumbnailsPerPage:0] >= 2)self->_thumbnailTrackFrame.origin.CGFloat y = self->_thumbnailTrackFrame.origin.y + -15.0; {
  }
    }
  v33.origin.x = CGPointZero.x;
  v33.origin.CGFloat y = y;
  v33.size.double width = v26;
  v33.size.double height = v28;
  CGRect v34 = CGRectInset(v33, v5, v5);
  self->_pageControlFrame.size.double width = v34.size.width;
  self->_pageControlFrame.origin.x = v34.origin.x;
  self->_pageControlFrame.origin.CGFloat y = v34.origin.y + v34.size.height + -15.0;
  self->_pageControlFrame.size.double height = 25.0;
  [(THWGalleryLayout *)self p_updatePagesAndThumbnailLayouts];
  return v3;
}

- (void)updateChildrenFromInfo
{
  if (!self->_pageControl)
  {
    id v3 = [(THWControlLayout *)[THWPageControlLayout alloc] initWithTag:3];
    self->_pageControl = v3;
    [(THWPageControlLayout *)v3 setCurrentPage:0];
  }
  if (!self->_thumbnailPageControl)
  {
    double v4 = [(THWControlLayout *)[THWPageControlLayout alloc] initWithTag:4];
    self->_thumbnailPageControl = v4;
    [(THWPageControlLayout *)v4 setCurrentPage:0];
  }
  if (!self->_stageCanvasLayout) {
    self->_stageCanvasLayout = [(THWControlLayout *)[THWPagedCanvasControlLayout alloc] initWithTag:0];
  }
  if (!self->_thumbnailTrackCanvasLayout && [(THWGalleryLayout *)self p_thumbnailsVisible])
  {
    CGFloat v5 = [(THWControlLayout *)[THWPagedCanvasControlLayout alloc] initWithTag:1];
    self->_thumbnailTrackCanvasLayout = v5;
    [(THWPagedCanvasControlLayout *)v5 setDelegate:self];
  }
  [(THWGalleryLayout *)self p_updatePagesAndThumbnailLayouts];
  [(THWGalleryLayout *)self p_updateCaption];
  v6.receiver = self;
  v6.super_class = (Class)THWGalleryLayout;
  [(THWContainerLayout *)&v6 updateChildrenFromInfo];
}

- (BOOL)p_hasIndividualCaptions
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [self info:0].items;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      objc_super v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v6), "captionStorage"), "length"))
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        objc_super v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (void)p_updateCaption
{
  unsigned int v3 = [(THWGalleryLayout *)self p_hasIndividualCaptions];
  captionLayout = self->_captionLayout;
  if (v3)
  {
    if (captionLayout) {
      return;
    }
    uint64_t v5 = [[THWGalleryCaptionLayout alloc] initWithDelegate:self];
  }
  else
  {
    if (!captionLayout) {
      return;
    }

    uint64_t v5 = 0;
  }
  self->_captionLayout = v5;
}

- (void)p_updatePagesAndThumbnailLayouts
{
  -[THWPageControlLayout setNumberOfPages:](self->_pageControl, "setNumberOfPages:", objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count"));
  [(THWPageControlLayout *)self->_thumbnailPageControl setNumberOfPages:[(THWGalleryLayout *)self numberOfThumbnailTrackPages]];
  if ([(THWGalleryLayout *)self useZoom])
  {
    zoomableCanvasPages = self->_zoomableCanvasPages;
    if (!zoomableCanvasPages)
    {
      if (self->_zoomableCanvasControls)
      {
        zoomableCanvasPages = 0;
      }
      else
      {
        id v11 = objc_alloc_init((Class)NSMutableArray);
        id v12 = objc_alloc_init((Class)NSMutableArray);
        CGFloat v13 = (char *)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
        if (v13)
        {
          CGFloat v14 = v13;
          for (i = 0; i != v14; ++i)
          {
            id v16 = [[THWControlContainer alloc] initWithDelegate:self];
            [(THWControlContainer *)v16 setTag:6];
            [(THWControlContainer *)v16 setIndex:i];
            [v11 addObject:v16];

            id v17 = [(THWControlLayout *)[THWZoomableCanvasControlLayout alloc] initWithTag:7 index:i];
            [v12 addObject:v17];
          }
        }
        self->_zoomableCanvasPages = (NSArray *)[v11 copy];

        self->_zoomableCanvasControls = (NSArray *)[v12 copy];
        zoomableCanvasPages = self->_zoomableCanvasPages;
      }
    }
  }
  else
  {
    zoomableCanvasPages = self->_imageInfos;
    if (!zoomableCanvasPages)
    {
      id v4 = [self info].items;
      id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v6 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v28;
        do
        {
          for (j = 0; j != v7; j = (char *)j + 1)
          {
            if (*(void *)v28 != v8) {
              objc_enumerationMutation(v4);
            }
            long long v10 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
            if ([v10 imageInfo]) {
              [v5 addObject:[v10 imageInfo]];
            }
          }
          id v7 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v7);
      }
      self->_imageInfos = (NSArray *)[v5 copy];

      zoomableCanvasPages = self->_imageInfos;
    }
  }
  [(THWGalleryLayout *)self setStageInfos:zoomableCanvasPages];
  if ([(THWGalleryLayout *)self p_thumbnailsVisible])
  {
    unint64_t v18 = [(THWPageControlLayout *)self->_thumbnailPageControl numberOfPages];
    NSUInteger v19 = [(NSArray *)self->_thumbnailControlPages count];
    if (v19 != v18)
    {

      self->_thumbnailControlPages = 0;
      if (v18)
      {
        id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v18];
        for (uint64_t k = 0; k != v18; ++k)
        {
          double v22 = [[THWControlContainer alloc] initWithDelegate:self];
          [(THWControlContainer *)v22 setTag:2];
          [(THWControlContainer *)v22 setIndex:k];
          [v20 addObject:v22];
        }
        self->_thumbnailControlPages = (NSArray *)[v20 copy];
      }
    }
    double v23 = (char *)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
    if (v19 != v18 || v23 != (char *)[(NSArray *)self->_thumbnailButtons count])
    {

      self->_thumbnailButtons = 0;
      if (v23)
      {
        id v24 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v23];
        for (m = 0; m != v23; ++m)
        {
          CGFloat v26 = objc_alloc_init(THWButtonControlLayout);
          [(THWControlLayout *)v26 setTag:5];
          [(THWControlLayout *)v26 setIndex:m];
          [v24 addObject:v26];
        }
        self->_thumbnailButtons = (NSArray *)[v24 copy];
      }
    }
  }
  else
  {

    self->_thumbnailControlPages = 0;
    self->_thumbnailButtons = 0;
  }
}

- (id)dependentLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)THWGalleryLayout;
  id v3 = [[-[THWGalleryLayout dependentLayouts](&v6, "dependentLayouts") mutableCopy] mutableCopy];
  if (!v3) {
    id v3 = +[NSMutableArray array];
  }
  [v3 addObjectsFromArray:[self children]];
  if ([(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self] != 3)
  {
    captionLayout = self->_captionLayout;
    if (captionLayout) {
      [(THWGalleryCaptionLayout *)captionLayout addDescendentLayoutsToArray:v3];
    }
  }
  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v5 = [(THWGalleryLayout *)self p_itemFromChildLayout:"p_itemFromChildLayout:"];
  unint64_t v6 = [(THWGalleryLayout *)self p_indexForItem:v5];
  id result = (id)TSUProtocolCast();
  if (!result)
  {
    if (!v5 || v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
    id v11 = [v5 imageInfo];
    if (v11 == [a3 info]
      || (id v12 = objc_msgSend(objc_msgSend(v5, "imageInfo"), "maskInfo"), v12 == objc_msgSend(a3, "info")))
    {
      if ([(THWGalleryLayout *)self isExpanded] && ![(THWGalleryLayout *)self useZoom])
      {
        objc_msgSend(objc_msgSend(v5, "imageInfo"), "naturalSize");
        double width = self->_stageFrame.size.width;
        double height = self->_stageFrame.size.height;
        TSDShrinkSizeToFitInSize();
        double v14 = v68;
        double v16 = v69;
        id v70 = [v5 imageInfo];
        if (v70 == [a3 info])
        {
          double v73 = (width - v14) * 0.5;
          double v74 = width * (double)v6;
          double v75 = (height - v16) * 0.5 + 0.0;
          double v76 = v74 + v73;
          id v9 = objc_alloc((Class)TSDLayoutGeometry);
          double x = v76;
          double v21 = v75;
          goto LABEL_45;
        }
        id v71 = objc_msgSend(objc_msgSend(v5, "imageInfo"), "maskInfo");
        if (v71 == [a3 info])
        {
          id v9 = objc_alloc((Class)TSDLayoutGeometry);
          double x = 0.0;
          double v21 = 0.0;
          goto LABEL_45;
        }
      }
      else if ([(THWGalleryLayout *)self isExpanded] && [(THWGalleryLayout *)self useZoom])
      {
        objc_msgSend(objc_msgSend(v5, "imageInfo"), "naturalSize");
        double v14 = v13;
        double v16 = v15;
        id v17 = [v5 imageInfo];
        if (v17 == [a3 info]
          || (id v18 = objc_msgSend(objc_msgSend(v5, "imageInfo"), "maskInfo"), v18 == objc_msgSend(a3, "info")))
        {
          CGFloat y = CGPointZero.y;
          id v9 = objc_alloc((Class)TSDLayoutGeometry);
          double x = CGPointZero.x;
          double v21 = y;
LABEL_45:
          double v23 = v14;
          double v24 = v16;
          goto LABEL_46;
        }
      }
      else
      {
        [v5 cropRect];
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        objc_msgSend(objc_msgSend(v5, "imageInfo"), "naturalSize");
        double v80 = v47;
        double v81 = v46;
        if (v43 <= 0.0) {
          double v48 = 1.0;
        }
        else {
          double v48 = v43;
        }
        if (v45 <= 0.0) {
          double v49 = 1.0;
        }
        else {
          double v49 = v45;
        }
        p_stageFrame = &self->_stageFrame;
        double v79 = CGRectGetWidth(self->_stageFrame);
        v84.origin.double x = v39;
        v84.origin.CGFloat y = v41;
        v84.size.double width = v48;
        v84.size.double height = v49;
        double v78 = CGRectGetWidth(v84);
        double v51 = CGRectGetHeight(self->_stageFrame);
        v85.origin.double x = v39;
        v85.origin.CGFloat y = v41;
        v85.size.double width = v48;
        v85.size.double height = v49;
        double v52 = CGRectGetHeight(v85);
        double v53 = CGRectGetWidth(self->_stageFrame);
        v86.origin.double x = v39;
        v86.origin.CGFloat y = v41;
        v86.size.double width = v48;
        v86.size.double height = v49;
        double v54 = v39 * (v53 / CGRectGetWidth(v86));
        double v55 = CGRectGetHeight(self->_stageFrame);
        v87.origin.double x = v39;
        v87.origin.CGFloat y = v41;
        v87.size.double width = v48;
        v87.size.double height = v49;
        double v56 = v41 * (v55 / CGRectGetHeight(v87));
        id v57 = [v5 imageInfo];
        if (v57 == [a3 info])
        {
          double v37 = v80 * (v51 / v52);
          double v72 = -(v54 - (double)v6 * p_stageFrame->size.width);
          id v9 = objc_alloc((Class)TSDLayoutGeometry);
          double x = v72;
          double v21 = -v56;
          double v23 = v81 * (v79 / v78);
LABEL_42:
          double v24 = v37;
          goto LABEL_46;
        }
        id v58 = objc_msgSend(objc_msgSend(v5, "imageInfo"), "maskInfo");
        if (v58 == [a3 info])
        {
          CGFloat v59 = p_stageFrame->size.width;
          CGFloat v60 = p_stageFrame->size.height;
          id v9 = objc_alloc((Class)TSDLayoutGeometry);
          double x = v54;
          double v21 = v56;
          double v23 = v59;
          double v24 = v60;
LABEL_46:
          id v77 = [v9 initWithFrame:x, v21, v23, v24];
          return v77;
        }
      }
    }
    return 0;
  }
  id v8 = result;
  switch((unint64_t)[result tag])
  {
    case 0uLL:
      id v9 = objc_alloc((Class)TSDLayoutGeometry);
      uint64_t v10 = 384;
      goto LABEL_18;
    case 1uLL:
      if (![(THWGalleryLayout *)self p_thumbnailsVisibleOnMainCanvas]) {
        return 0;
      }
      id v9 = objc_alloc((Class)TSDLayoutGeometry);
      uint64_t v10 = 416;
      goto LABEL_18;
    case 2uLL:
      id v25 = objc_alloc((Class)TSDLayoutGeometry);
      double v26 = self->_thumbnailTrackFrame.size.width;
      double x = v26 * (double)(unint64_t)[v8 index];
      double v23 = self->_thumbnailTrackFrame.size.width;
      double v24 = self->_thumbnailTrackFrame.size.height;
      double v21 = 0.0;
      id v9 = v25;
      goto LABEL_46;
    case 3uLL:
    case 4uLL:
      id v9 = objc_alloc((Class)TSDLayoutGeometry);
      uint64_t v10 = 448;
LABEL_18:
      double v22 = (double *)&self->super.TSDContainerLayout_opaque[v10];
      double x = *v22;
      double v21 = v22[1];
      double v23 = v22[2];
      double v24 = v22[3];
      goto LABEL_46;
    case 5uLL:
      [(THWGalleryLayout *)self p_thumbnailSize];
      double v28 = v27;
      double v30 = v29;
      unint64_t v82 = 1;
      if ((char *)[(THWGalleryLayout *)self p_numberOfThumbnailPagesAndThumbnailsPerPage:&v82] == (char *)&dword_0 + 1)
      {
        unint64_t v31 = (unint64_t)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
        unint64_t v82 = v31;
        if (v31) {
          goto LABEL_36;
        }
      }
      else
      {
        unint64_t v31 = v82;
        if (v82) {
          goto LABEL_36;
        }
      }
      unint64_t v31 = 1;
      unint64_t v82 = 1;
LABEL_36:
      CGFloat v61 = (self->_thumbnailTrackFrame.size.width - v28 * (double)v31 - (double)(10 * v31 - 10)) * 0.5 + 0.0;
      unint64_t v62 = (unint64_t)[v8 index];
      float v63 = v61 + (double)(v62 % v82) * (v28 + 10.0);
      double v64 = floorf(v63);
      [(THWGalleryLayout *)self thumbnailTrackVerticalPadding];
      id result = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v64, v65, v28, v30];
      break;
    case 6uLL:
      double v32 = self->_stageFrame.size.width;
      double v33 = v32 * (double)(unint64_t)[v8 index];
      CGFloat v34 = self->_stageFrame.size.width;
      CGFloat v35 = self->_stageFrame.size.height;
      id v9 = objc_alloc((Class)TSDLayoutGeometry);
      double v21 = 0.0;
      double x = v33;
      double v23 = v34;
      double v24 = v35;
      goto LABEL_46;
    case 7uLL:
      CGFloat v36 = self->_stageFrame.size.width;
      double v37 = self->_stageFrame.size.height;
      id v9 = objc_alloc((Class)TSDLayoutGeometry);
      double x = 0.0;
      double v21 = 0.0;
      double v23 = v36;
      goto LABEL_42;
    default:
      return 0;
  }
  return result;
}

- (id)childrenForLayout
{
  id v3 = +[NSMutableArray array];
  unsigned int v4 = [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self];
  if (!v4)
  {
    id v5 = [[self info] childInfos];
    if (objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo")) {
      id v5 = objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", v5);
    }
    if ([(THWGalleryLayout *)self individualCaptions])
    {
      id v6 = [[[THWGalleryLayout info] adornmentInfo] caption];
      if (v6)
      {
        id v9 = v6;
        id v5 = [v5 tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:[NSArray arrayWithObjects:count:1]];
      }
    }
    [v3 addObjectsFromArray:v5];
  }
  if (self->_stageCanvasLayout) {
    [v3 addObject:];
  }
  if (!v4)
  {
    if ([(THWGalleryLayout *)self p_thumbnailsVisibleOnMainCanvas])
    {
      if (self->_thumbnailTrackCanvasLayout) {
        [v3 addObject:];
      }
      if ([(THWGalleryLayout *)self numberOfThumbnailTrackPages] < 2) {
        goto LABEL_19;
      }
      thumbnailPageControl = self->_thumbnailPageControl;
    }
    else if ((unint64_t)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count") < 2 {
           || (thumbnailPageControl = self->_pageControl) == 0)
    }
    {
LABEL_19:
      if (self->_captionLayout) {
        [v3 addObject:];
      }
      return v3;
    }
    [v3 addObject:thumbnailPageControl];
    goto LABEL_19;
  }
  return v3;
}

- (unint64_t)numberOfStagePages
{
  id v2 = [[self info] items];

  return (unint64_t)[v2 count];
}

- (unint64_t)numberOfThumbnailTrackPages
{
  return [(THWGalleryLayout *)self p_numberOfThumbnailPagesAndThumbnailsPerPage:0];
}

- (id)infosForThumbnailTrackPages:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (![(THWGalleryLayout *)self p_thumbnailsVisible]
    || location + length > [(NSArray *)self->_thumbnailControlPages count])
  {
    return 0;
  }
  thumbnailControlPages = self->_thumbnailControlPages;

  return -[NSArray subarrayWithRange:](thumbnailControlPages, "subarrayWithRange:", location, length);
}

- (id)infosForStagePages:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > [(NSArray *)self->_stageInfos count]) {
    return 0;
  }
  stageInfos = self->_stageInfos;

  return -[NSArray subarrayWithRange:](stageInfos, "subarrayWithRange:", location, length);
}

- (id)pageIndexesFromStageReps:(id)a3
{
  id v5 = +[NSMutableIndexSet indexSet];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) info];
        stageInfos = self->_stageInfos;
        if (stageInfos) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          id v13 = -[NSArray indexOfObjectIdenticalTo:](stageInfos, "indexOfObjectIdenticalTo:");
          if (v13 != (id)0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v13];
          }
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)p_nonEmptyCaptionStorage
{
  id v3 = [[[THWGalleryLayout info] adornmentInfo] caption].containedStorage;
  if (![v3 length])
  {
    id v4 = [[self info] items];
    id v5 = [v4 count];
    if (v5) {
      id v5 = [v4 objectAtIndex:0];
    }
    id v6 = [v5 captionStorage];
    if ([v6 length]) {
      return v6;
    }
    else {
      return 0;
    }
  }
  return v3;
}

- (__CTFont)createFontFromCaption
{
  id result = [(THWGalleryLayout *)self p_nonEmptyCaptionStorage];
  if (result)
  {
    id v3 = result;
    [(__CTFont *)result paragraphStyleAtCharIndex:0 effectiveRange:0];
    [(__CTFont *)v3 characterStyleAtCharIndex:0 effectiveRange:0];
    return (__CTFont *)TSWPFastCreateFontForStyle();
  }
  return result;
}

- (id)colorFromCaption
{
  id result = [(THWGalleryLayout *)self p_nonEmptyCaptionStorage];
  if (result)
  {
    id v3 = result;
    [result paragraphStyleAtCharIndex:0 effectiveRange:0];
    [v3 characterStyleAtCharIndex:0 effectiveRange:0];
    return (id)TSWPResolveColorForStyles();
  }
  return result;
}

- (id)colorFromTitle
{
  id v2 = [self info].adornmentInfo;

  return [v2 titleColor];
}

- (BOOL)stageVisible
{
  return 1;
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  if ([a3 tag] == (char *)&dword_0 + 2)
  {
    id v5 = [a3 index];
    uint64_t v14 = 0;
    [(THWGalleryLayout *)self p_numberOfThumbnailPagesAndThumbnailsPerPage:&v14];
    id v6 = (char *)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
    unint64_t v7 = (unint64_t)v6;
    uint64_t v8 = v14;
    if ((unint64_t)v6 >= v8 + v8 * (uint64_t)v5) {
      id v9 = (char *)(v14 + v14 * (void)v5);
    }
    else {
      id v9 = v6;
    }
    NSUInteger v10 = [(NSArray *)self->_thumbnailButtons count];
    id result = 0;
    if ((unint64_t)v9 <= v10)
    {
      if (v7 >= v8 * (uint64_t)v5) {
        unint64_t v12 = v8 * (void)v5;
      }
      else {
        unint64_t v12 = v7;
      }
      return -[NSArray subarrayWithRange:](self->_thumbnailButtons, "subarrayWithRange:", v12, &v9[-v12]);
    }
  }
  else if ([a3 tag] == (char *)&dword_4 + 2 {
         && (id v13 = [a3 index], v13 < (id)-[NSArray count](self->_zoomableCanvasControls, "count")))
  }
  {
    id result = [(NSArray *)self->_zoomableCanvasControls objectAtIndex:v13];
    if (result)
    {
      return +[NSArray arrayWithObject:result];
    }
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)pagedCanvasControlLayoutDidValidate:(id)a3
{
  if (self->_thumbnailTrackCanvasLayout == a3
    && [(THWGalleryLayout *)self p_thumbnailsVisibleInPanel])
  {
    objc_msgSend(objc_msgSend(a3, "geometry"), "size");
    self->_thumbnailTrackFrame.origin = CGPointZero;
    self->_thumbnailTrackFrame.size.double width = v5;
    self->_thumbnailTrackFrame.size.double height = v6;
    [(THWGalleryLayout *)self p_updatePagesAndThumbnailLayouts];
  }
}

- (CGPoint)galleryCaptionPosition
{
  id v2 = [(THWGalleryLayout *)self info];

  [v2 captionPosition];
  result.CGFloat y = v4;
  result.double x = v3;
  return result;
}

- (double)galleryCaptionWidth
{
  if ([(THWGalleryLayout *)self isExpanded])
  {
    [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutBounds];
    return v3;
  }
  else
  {
    id v5 = [(THWGalleryLayout *)self geometry];
    [v5 size];
  }
  return result;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (CGRect)stageFrame
{
  double x = self->_stageFrame.origin.x;
  double y = self->_stageFrame.origin.y;
  double width = self->_stageFrame.size.width;
  double height = self->_stageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)thumbnailTrackFrame
{
  double x = self->_thumbnailTrackFrame.origin.x;
  double y = self->_thumbnailTrackFrame.origin.y;
  double width = self->_thumbnailTrackFrame.size.width;
  double height = self->_thumbnailTrackFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)pageControlFrame
{
  double x = self->_pageControlFrame.origin.x;
  double y = self->_pageControlFrame.origin.y;
  double width = self->_pageControlFrame.size.width;
  double height = self->_pageControlFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)stageCornerRadius
{
  return self->_stageCornerRadius;
}

- (THWPageControlLayout)pageControl
{
  return self->_pageControl;
}

- (THWPageControlLayout)thumbnailPageControl
{
  return self->_thumbnailPageControl;
}

- (THWPagedCanvasControlLayout)thumbnailTrackCanvasLayout
{
  return self->_thumbnailTrackCanvasLayout;
}

- (NSArray)stageInfos
{
  return self->_stageInfos;
}

- (void)setStageInfos:(id)a3
{
}

- (NSArray)imageInfos
{
  return self->_imageInfos;
}

- (NSArray)thumbnailControlPages
{
  return self->_thumbnailControlPages;
}

- (NSArray)thumbnailButtons
{
  return self->_thumbnailButtons;
}

- (THWPagedCanvasControlLayout)stageCanvasLayout
{
  return self->_stageCanvasLayout;
}

- (NSArray)zoomableCanvasPages
{
  return self->_zoomableCanvasPages;
}

- (NSArray)zoomableCanvasControls
{
  return self->_zoomableCanvasControls;
}

- (THWGalleryCaptionLayout)captionLayout
{
  return self->_captionLayout;
}

@end