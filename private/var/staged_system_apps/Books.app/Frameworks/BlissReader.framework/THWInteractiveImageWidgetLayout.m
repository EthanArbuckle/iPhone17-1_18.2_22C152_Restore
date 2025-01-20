@interface THWInteractiveImageWidgetLayout
- (BOOL)captionPanelVisible;
- (BOOL)hasContentForPanel:(int)a3;
- (BOOL)isCombinedPanelVisible;
- (BOOL)isCompactFlowPresentation;
- (BOOL)isCompactHeight;
- (BOOL)isExpanded;
- (BOOL)isReflowablePresentation;
- (BOOL)p_captionsInPanel;
- (BOOL)p_showTransportControls;
- (BOOL)p_useTitleOnlyForCallout;
- (BOOL)stageVisible;
- (CGAffineTransform)transformFromContentToContainerCoords;
- (CGPoint)contentOffset;
- (CGPoint)interactiveImageCallout:(id)a3 convertContentPointToUnscaledOverlayPoint:(CGPoint)a4;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)calloutFrameWithViewScale:(double)a3;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGRect)sidebarFrame;
- (CGRect)stageFrame;
- (CGRect)transportControlsFrame;
- (CGSize)interactiveImageSidebarSize:(id)a3;
- (CGSize)zoomableCanvasSize;
- (Class)repClassForTextLayout:(id)a3;
- (THWControlContainer)calloutContainer;
- (THWControlContainer)sidebarContainer;
- (THWInteractiveImageRadioPanelLayout)transportControlLayout;
- (THWInteractiveImageSidebarLayout)sidebarLayout;
- (THWInteractiveImageWidgetLayout)initWithInfo:(id)a3;
- (THWOverlayableZoomableCanvasController)stageCanvasController;
- (THWWidgetLayoutDelegate)delegate;
- (TSDRootLayout)scrollContainerRootLayout;
- (TSUColor)primaryColor;
- (TSURetainedPointerKeyDictionary)calloutLayoutsMap;
- (double)baseViewScale;
- (double)baseViewScaleForStageSize:(CGSize)a3;
- (double)interactiveImageCalloutFontScale:(id)a3;
- (double)stageCornerRadius;
- (double)viewScale;
- (id)additionalLayouts;
- (id)additionalLayoutsForPanel:(int)a3;
- (id)calloutLayouts;
- (id)childInfosForLayout;
- (id)computeLayoutGeometry;
- (id)controlContainerAdditionalChildLayouts:(id)a3;
- (id)dependentsOfTextLayout:(id)a3;
- (id)infosForContainer;
- (id)infosForPanel:(int)a3;
- (id)infosForStageContentViewport:(CGRect)a3;
- (id)layoutGeometryForLayout:(id)a3;
- (id)layoutGeometryFromProvider;
- (id)p_allScrollContainerLayouts;
- (unint64_t)selectedCalloutIndex;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)dealloc;
- (void)invalidateForSizeChange;
- (void)invalidateSize;
- (void)p_invalidateAllCalloutLayoutFrames;
- (void)p_invalidateExternal;
- (void)p_updateCalloutLayouts;
- (void)p_updateSidebarLayouts;
- (void)setCalloutContainer:(id)a3;
- (void)setCalloutLayoutsMap:(id)a3;
- (void)setCaptionPanelVisible:(BOOL)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setScrollContainerRootLayout:(id)a3;
- (void)setSelectedCalloutIndex:(unint64_t)a3;
- (void)setSidebarContainer:(id)a3;
- (void)setSidebarFrame:(CGRect)a3;
- (void)setStageCanvasController:(id)a3;
- (void)setStageCornerRadius:(double)a3;
- (void)setStageFrame:(CGRect)a3;
- (void)setTransportControlLayout:(id)a3;
- (void)setTransportControlsFrame:(CGRect)a3;
- (void)setViewScale:(double)a3;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5;
- (void)updateChildrenFromInfo;
- (void)updateSelectedCallout:(id)a3;
- (void)wasAddedToLayoutController:(id)a3;
@end

@implementation THWInteractiveImageWidgetLayout

- (THWInteractiveImageWidgetLayout)initWithInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageWidgetLayout;
  result = [(THWInteractiveImageWidgetLayout *)&v4 initWithInfo:a3];
  if (result) {
    result->_viewScale = 1.0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (double)baseViewScaleForStageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "stageGeometry"), "frame");

  return THScaleNeededToFitSizeInSize(v5, v6, width, height);
}

- (double)baseViewScale
{
  if (![(THWInteractiveImageWidgetLayout *)self isExpanded]) {
    return 1.0;
  }
  [(THWInteractiveImageWidgetLayout *)self stageFrame];

  -[THWInteractiveImageWidgetLayout baseViewScaleForStageSize:](self, "baseViewScaleForStageSize:", v3, v4);
  return result;
}

- (BOOL)stageVisible
{
  return 1;
}

- (CGSize)zoomableCanvasSize
{
  id v2 = [(THWInteractiveImageWidgetLayout *)self info];

  [v2 backgroundSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)infosForStageContentViewport:(CGRect)a3
{
  id v3 = [[self info:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height] backgroundImageInfo];

  return +[NSArray arrayWithObject:v3];
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5
{
  double y = a4.y;
  double x = a4.x;
  [(THWInteractiveImageWidgetLayout *)self contentOffset];
  if (x == v10 && y == v9)
  {
    [(THWInteractiveImageWidgetLayout *)self viewScale];
    if (v13 == a3) {
      return;
    }
  }
  else
  {
    -[THWInteractiveImageWidgetLayout setContentOffset:](self, "setContentOffset:", x, y);
    [(THWInteractiveImageWidgetLayout *)self viewScale];
    if (v12 == a3) {
      goto LABEL_9;
    }
  }
  [(THWInteractiveImageWidgetLayout *)self setViewScale:a3];
LABEL_9:

  [(THWInteractiveImageWidgetLayout *)self p_invalidateAllCalloutLayoutFrames];
}

- (CGAffineTransform)transformFromContentToContainerCoords
{
  memset(&v13, 0, sizeof(v13));
  [(THWInteractiveImageWidgetLayout *)self contentOffset];
  CGFloat v6 = -v5;
  [(THWInteractiveImageWidgetLayout *)self contentOffset];
  CGAffineTransformMakeTranslation(&v13, v6, -v7);
  [(THWInteractiveImageWidgetLayout *)self viewScale];
  CGFloat v9 = v8;
  [(THWInteractiveImageWidgetLayout *)self viewScale];
  CGAffineTransform v12 = v13;
  return CGAffineTransformScale(retstr, &v12, v9, v10);
}

- (TSUColor)primaryColor
{
  CGSize result = self->_primaryColor;
  if (!result)
  {
    id v4 = [[-[THWInteractiveImageWidgetLayout info](self, "info") adornmentInfo] titleStorage];
    if (v4)
    {
      double v5 = v4;
      [v4 paragraphStyleAtCharIndex:0 effectiveRange:0];
      [v5 characterStyleAtCharIndex:0 effectiveRange:0];
      [(THWInteractiveImageWidgetLayout *)self setPrimaryColor:TSWPResolveColorForStyles()];
    }
    CGSize result = self->_primaryColor;
    if (!result)
    {
      [(THWInteractiveImageWidgetLayout *)self setPrimaryColor:+[TSUColor blackColor]];
      return self->_primaryColor;
    }
  }
  return result;
}

- (BOOL)p_showTransportControls
{
  if (objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "showTransportControls")) {
    return 1;
  }

  return [(THWInteractiveImageWidgetLayout *)self p_captionsInPanel];
}

- (BOOL)hasContentForPanel:(int)a3
{
  if (a3 == 2 || a3 == 1) {
    return 1;
  }
  if (a3) {
    return 0;
  }
  return objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info", v3, v4), "adornmentInfo"), "titleStorage") != 0;
}

- (BOOL)isCompactHeight
{
  id v2 = [(THWInteractiveImageWidgetLayout *)self layoutController];

  return [v2 isCompactHeight];
}

- (id)infosForPanel:(int)a3
{
  id v5 = +[NSMutableArray array];
  if (a3 == 1)
  {
    if ([(THWInteractiveImageWidgetLayout *)self p_captionsInPanel]
      && [(THWInteractiveImageWidgetLayout *)self selectedCalloutIndex])
    {
      id v6 = [[-[THWInteractiveImageWidgetLayout info](self, "info") calloutAtIndex: -[THWInteractiveImageWidgetLayout selectedCalloutIndex](self, "selectedCalloutIndex")] descriptionStorage];
      if (!v6) {
        return v5;
      }
      goto LABEL_12;
    }
    if (self->_captionPanelVisible
      && objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "captionStorage"))
    {
      id v6 = objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "captionStorage");
      goto LABEL_12;
    }
  }
  else if (!a3 {
         && objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "titleStorage"))
  }
  {
    id v6 = [[-[THWInteractiveImageWidgetLayout info](self, "info") adornmentInfo] titleStorage];
LABEL_12:
    [v5 addObject:v6];
  }
  return v5;
}

- (id)additionalLayoutsForPanel:(int)a3
{
  if (a3 != 2
    || !self->_transportControlLayout
    || ![(THWInteractiveImageWidgetLayout *)self isExpanded]
    || ![(THWInteractiveImageWidgetLayout *)self p_showTransportControls])
  {
    return 0;
  }
  transportControlLayout = self->_transportControlLayout;
  return +[NSArray arrayWithObjects:&transportControlLayout count:1];
}

- (BOOL)isCombinedPanelVisible
{
  return [(THWInteractiveImageWidgetLayout *)self p_showTransportControls]
      || objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "captionStorage") != 0;
}

- (id)layoutGeometryFromProvider
{
  if ([(THWInteractiveImageWidgetLayout *)self isExpanded])
  {
    [(THWWidgetLayoutDelegate *)[(THWInteractiveImageWidgetLayout *)self delegate] widgetLayoutBounds];
    id v7 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v3, v4, v5, v6];
    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWInteractiveImageWidgetLayout;
    return [(THWInteractiveImageWidgetLayout *)&v9 layoutGeometryFromProvider];
  }
}

- (id)computeLayoutGeometry
{
  v23.receiver = self;
  v23.super_class = (Class)THWInteractiveImageWidgetLayout;
  id v3 = [(THWInteractiveImageWidgetLayout *)&v23 computeLayoutGeometry];
  if ([(THWInteractiveImageWidgetLayout *)self isExpanded])
  {
    [(THWWidgetLayoutDelegate *)[(THWInteractiveImageWidgetLayout *)self delegate] widgetLayoutBounds];
    -[THWInteractiveImageWidgetLayout setStageFrame:](self, "setStageFrame:");
    double v4 = 0.0;
  }
  else
  {
    id v5 = [[self info] stageGeometry];
    [v5 frame];
    -[THWInteractiveImageWidgetLayout setStageFrame:](self, "setStageFrame:");
    [v5 cornerRadius];
  }
  [(THWInteractiveImageWidgetLayout *)self setStageCornerRadius:v4];
  if ([(THWInteractiveImageWidgetLayout *)self isExpanded]
    && [(THWInteractiveImageWidgetLayout *)self p_showTransportControls])
  {
    [(THWInteractiveImageWidgetLayout *)self stageFrame];
    -[THWInteractiveImageWidgetLayout setStageFrame:](self, "setStageFrame:");
  }
  [(THWInteractiveImageWidgetLayout *)self stageFrame];
  self->_transportControlsFrame.origin.double x = v6;
  self->_transportControlsFrame.origin.double y = v7;
  self->_transportControlsFrame.size.double width = v8;
  self->_transportControlsFrame.size.double height = 44.0;
  if (![(THWInteractiveImageWidgetLayout *)self isExpanded])
  {
    [(THWInteractiveImageWidgetLayout *)self stageFrame];
    self->_transportControlsFrame.origin.double y = self->_transportControlsFrame.origin.y + v9;
  }
  if (objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "useSidebar"))
  {
    [self info].sidebarWidth
    if (v10 <= 0.0)
    {
      [(THWInteractiveImageWidgetLayout *)self stageFrame];
      double v15 = v16 * 0.25;
    }
    else
    {
      [self info].sidebarWidth
      double v12 = v11;
      [(THWInteractiveImageWidgetLayout *)self stageFrame];
      if (v12 <= v13)
      {
LABEL_15:
        unsigned int v17 = [(THWInteractiveImageWidgetLayout *)self isExpanded];
        [self info].sidebarWidth;
        CGFloat v19 = v18;
        [(THWInteractiveImageWidgetLayout *)self stageFrame];
        p_sidebarFrame = &self->_sidebarFrame;
        if (v17)
        {
          p_sidebarFrame->origin = (CGPoint)xmmword_344FC0;
        }
        else
        {
          p_sidebarFrame->origin.double x = 0.0;
          self->_sidebarFrame.origin.double y = 0.0;
        }
        self->_sidebarFrame.size.double width = v19;
        self->_sidebarFrame.size.double height = v20;
        return v3;
      }
      [(THWInteractiveImageWidgetLayout *)self stageFrame];
      double v15 = v14;
    }
    [self info].sidebarWidth = v15;
    goto LABEL_15;
  }
  return v3;
}

- (void)updateChildrenFromInfo
{
  if (!self->_transportControlLayout
    && [(THWInteractiveImageWidgetLayout *)self p_showTransportControls])
  {
    id v3 = [[THWInteractiveImageRadioPanelLayout alloc] initWithInfo:[self info].transportControlsInfo];
    self->_transportControlLayout = v3;
    [(THWInteractiveImageRadioPanelLayout *)v3 setWidgetLayout:self];
    [(THWInteractiveImageRadioPanelLayout *)self->_transportControlLayout setTag:3];
    [(THWContainerLayout *)self invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageWidgetLayout;
  [(THWContainerLayout *)&v4 updateChildrenFromInfo];
}

- (void)invalidateSize
{
  v12.receiver = self;
  v12.super_class = (Class)THWInteractiveImageWidgetLayout;
  [(THWInteractiveImageWidgetLayout *)&v12 invalidateSize];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(THWInteractiveImageWidgetLayout *)self dependentLayouts];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      CGFloat v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) invalidateFrame];
        CGFloat v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)childInfosForLayout
{
  if ([(THWInteractiveImageWidgetLayout *)self isExpanded]
    || !objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"))
  {
    return 0;
  }
  id v3 = [self info].adornmentInfo;

  return [v3 interleavedInfosWithInfos:0];
}

- (id)additionalLayouts
{
  id v3 = +[NSMutableArray array];
  if (self->_transportControlLayout && ![(THWInteractiveImageWidgetLayout *)self isExpanded]) {
    [v3 addObject:self->_transportControlLayout];
  }
  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc((Class)TSDLayoutGeometry);
    [(THWInteractiveImageWidgetLayout *)self transportControlsFrame];
    id v10 = v5;
LABEL_9:
    id v13 = [v10 initWithFrame:v6, v7, v8, v9];
    return v13;
  }
  if (![(THWInteractiveImageWidgetLayout *)self isExpanded]
    || (id v11 = [a3 info],
        v11 != objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "backgroundImageInfo")))
  {
    if ([a3 info] != self->_calloutContainer && objc_msgSend(a3, "info") != self->_sidebarContainer) {
      return 0;
    }
    id v10 = objc_alloc((Class)TSDLayoutGeometry);
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 1.0;
    double v9 = 1.0;
    goto LABEL_9;
  }

  return [a3 layoutGeometryFromInfo];
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 3;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return 0;
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (void)p_invalidateExternal
{
  [(THWInteractiveImageWidgetLayout *)self invalidateFrame];
  [(THWInteractiveImageWidgetLayout *)self invalidateChildren];
  [(THWInteractiveImageWidgetLayout *)self p_updateCalloutLayouts];

  [(THWInteractiveImageWidgetLayout *)self p_updateSidebarLayouts];
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (THWWidgetLayoutDelegate *)a3;
    [(THWInteractiveImageWidgetLayout *)self p_invalidateExternal];
  }
}

- (void)wasAddedToLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageWidgetLayout;
  [(THWInteractiveImageWidgetLayout *)&v4 wasAddedToLayoutController:a3];
  [(THWInteractiveImageWidgetLayout *)self p_invalidateExternal];
}

- (BOOL)isExpanded
{
  id v3 = [(THWInteractiveImageWidgetLayout *)self delegate];
  if (v3) {
    LOBYTE(v3) = [(THWWidgetLayoutDelegate *)[(THWInteractiveImageWidgetLayout *)self delegate] widgetLayoutMode:self] == 1;
  }
  return (char)v3;
}

- (BOOL)isCompactFlowPresentation
{
  id v3 = [(THWInteractiveImageWidgetLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  id v3 = [(THWInteractiveImageWidgetLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (id)p_allScrollContainerLayouts
{
  id v3 = +[NSMutableArray array];
  [(TSDRootLayout *)[(THWInteractiveImageWidgetLayout *)self scrollContainerRootLayout] addLayoutsToArray:v3];
  return v3;
}

- (void)p_invalidateAllCalloutLayoutFrames
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(THWInteractiveImageWidgetLayout *)self calloutLayouts];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) invalidateFrame];
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (CGRect)calloutFrameWithViewScale:(double)a3
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [(THWInteractiveImageWidgetLayout *)self calloutLayouts];
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) groupFrameWithViewScale:a3];
        v29.origin.CGFloat x = v13;
        v29.origin.CGFloat y = v14;
        v29.size.CGFloat width = v15;
        v29.size.CGFloat height = v16;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)p_captionsInPanel
{
  unsigned int v3 = [(THWInteractiveImageWidgetLayout *)self isExpanded];
  if (v3)
  {
    if (objc_msgSend(-[THWInteractiveImageWidgetLayout layoutController](self, "layoutController"), "isCompactWidth"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      id v4 = [(THWInteractiveImageWidgetLayout *)self layoutController];
      LOBYTE(v3) = [v4 isCompactHeight];
    }
  }
  return v3;
}

- (BOOL)p_useTitleOnlyForCallout
{
  if (objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "useSidebar")) {
    return 1;
  }

  return [(THWInteractiveImageWidgetLayout *)self p_captionsInPanel];
}

- (void)p_updateCalloutLayouts
{
  BOOL v3 = [(THWInteractiveImageWidgetLayout *)self p_useTitleOnlyForCallout];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [[self info:0] calloutEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    long long v7 = 0;
    uint64_t v8 = *(void *)v17;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 shouldDraw])
        {
          if (!v7) {
            long long v7 = objc_opt_new();
          }
          uint64_t v11 = (THWInteractiveImageCalloutLayout *)[(TSURetainedPointerKeyDictionary *)self->_calloutLayoutsMap objectForKeyedSubscript:v10];
          if (v11)
          {
            objc_super v12 = v11;
            [(THWInteractiveImageCalloutLayout *)v11 setTitleOnly:v3];
          }
          else
          {
            objc_super v12 = [[THWInteractiveImageCalloutLayout alloc] initWithInfo:0];
            [(THWInteractiveImageCalloutLayout *)v12 setCalloutInfo:v10];
            [(THWInteractiveImageCalloutLayout *)v12 setDelegate:self];
            [(THWInteractiveImageCalloutLayout *)v12 setTitleOnly:v3];
            if (!v12) {
              continue;
            }
          }
          [v7 setObject:v12 forUncopiedKey:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v6)
      {
        if (v7)
        {

          self->_calloutLayoutsMap = (TSURetainedPointerKeyDictionary *)v7;
        }
        break;
      }
    }
  }
  id v13 = [(TSURetainedPointerKeyDictionary *)self->_calloutLayoutsMap count];
  calloutContainer = self->_calloutContainer;
  if (v13)
  {
    if (calloutContainer) {
      return;
    }
    CGFloat v15 = [[THWControlContainer alloc] initWithDelegate:self];
  }
  else
  {
    if (!calloutContainer) {
      return;
    }

    CGFloat v15 = 0;
  }
  self->_calloutContainer = v15;
}

- (void)p_updateSidebarLayouts
{
  if (objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "useSidebar")
    && ![(THWInteractiveImageWidgetLayout *)self p_captionsInPanel])
  {
    if (!self->_sidebarContainer) {
      self->_sidebarContainer = [[THWControlContainer alloc] initWithDelegate:self];
    }
    if (!self->_sidebarLayout) {
      self->_sidebarLayout = [[THWInteractiveImageSidebarLayout alloc] initWithDelegate:self];
    }
  }
  else
  {
    sidebarContainer = self->_sidebarContainer;
    if (sidebarContainer)
    {

      self->_sidebarContainer = 0;
    }
    sidebarLayout = self->_sidebarLayout;
    if (sidebarLayout)
    {

      self->_sidebarLayout = 0;
    }
  }
}

- (id)calloutLayouts
{
  return [(TSURetainedPointerKeyDictionary *)self->_calloutLayoutsMap allValues];
}

- (id)infosForContainer
{
  sidebarContainer = self->_sidebarContainer;
  calloutContainer = self->_calloutContainer;
  if (sidebarContainer)
  {
    if (calloutContainer)
    {
      uint64_t v8 = self->_calloutContainer;
      id v9 = sidebarContainer;
      id v4 = &v8;
      uint64_t v5 = 2;
      return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, v5, v7, v8, v9);
    }
  }
  else if (calloutContainer)
  {
    long long v7 = self->_calloutContainer;
    id v4 = &v7;
    uint64_t v5 = 1;
    return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, v5, v7, v8, v9);
  }
  return 0;
}

- (void)updateSelectedCallout:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(THWInteractiveImageWidgetLayout *)self calloutLayouts];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setSelected:[*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) calloutInfo] == a3];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)invalidateForSizeChange
{
  [(THWInteractiveImageWidgetLayout *)self p_updateCalloutLayouts];
  [(THWInteractiveImageWidgetLayout *)self p_updateSidebarLayouts];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(THWInteractiveImageWidgetLayout *)self calloutLayouts];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) invalidateTitleStyle];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  if ([a3 info] == self->_calloutContainer)
  {
    return [(THWInteractiveImageWidgetLayout *)self calloutLayouts];
  }
  else if ([a3 info] == self->_sidebarContainer && self->_sidebarLayout)
  {
    sidebarLayout = self->_sidebarLayout;
    return +[NSArray arrayWithObjects:&sidebarLayout count:1];
  }
  else
  {
    return 0;
  }
}

- (CGPoint)interactiveImageCallout:(id)a3 convertContentPointToUnscaledOverlayPoint:(CGPoint)a4
{
  -[THWOverlayableZoomableCanvasController unscaledContainerPointFromUnscaledContentPoint:](self->_stageCanvasController, "unscaledContainerPointFromUnscaledContentPoint:", a3, a4.x, a4.y);
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (double)interactiveImageCalloutFontScale:(id)a3
{
  unsigned int v3 = [(THWInteractiveImageWidgetLayout *)self p_captionsInPanel];
  double result = 0.8;
  if (!v3) {
    return 1.0;
  }
  return result;
}

- (CGSize)interactiveImageSidebarSize:(id)a3
{
  double width = self->_sidebarFrame.size.width;
  double height = self->_sidebarFrame.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)stageCornerRadius
{
  return self->mStageCornerRadius;
}

- (void)setStageCornerRadius:(double)a3
{
  self->mStageCornerRadius = a3;
}

- (CGRect)stageFrame
{
  double x = self->mStageFrame.origin.x;
  double y = self->mStageFrame.origin.y;
  double width = self->mStageFrame.size.width;
  double height = self->mStageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStageFrame:(CGRect)a3
{
  self->mStageFrame = a3;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (THWInteractiveImageSidebarLayout)sidebarLayout
{
  return self->_sidebarLayout;
}

- (void)setPrimaryColor:(id)a3
{
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CGRect)sidebarFrame
{
  double x = self->_sidebarFrame.origin.x;
  double y = self->_sidebarFrame.origin.y;
  double width = self->_sidebarFrame.size.width;
  double height = self->_sidebarFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSidebarFrame:(CGRect)a3
{
  self->_sidebarFrame = a3;
}

- (unint64_t)selectedCalloutIndex
{
  return self->_selectedCalloutIndex;
}

- (void)setSelectedCalloutIndex:(unint64_t)a3
{
  self->_selectedCalloutIndedouble x = a3;
}

- (TSDRootLayout)scrollContainerRootLayout
{
  return self->_scrollContainerRootLayout;
}

- (void)setScrollContainerRootLayout:(id)a3
{
  self->_scrollContainerRootLayout = (TSDRootLayout *)a3;
}

- (BOOL)captionPanelVisible
{
  return self->_captionPanelVisible;
}

- (void)setCaptionPanelVisible:(BOOL)a3
{
  self->_captionPanelVisible = a3;
}

- (THWOverlayableZoomableCanvasController)stageCanvasController
{
  return self->_stageCanvasController;
}

- (void)setStageCanvasController:(id)a3
{
}

- (THWInteractiveImageRadioPanelLayout)transportControlLayout
{
  return self->_transportControlLayout;
}

- (void)setTransportControlLayout:(id)a3
{
}

- (CGRect)transportControlsFrame
{
  double x = self->_transportControlsFrame.origin.x;
  double y = self->_transportControlsFrame.origin.y;
  double width = self->_transportControlsFrame.size.width;
  double height = self->_transportControlsFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTransportControlsFrame:(CGRect)a3
{
  self->_transportControlsFrame = a3;
}

- (TSURetainedPointerKeyDictionary)calloutLayoutsMap
{
  return self->_calloutLayoutsMap;
}

- (void)setCalloutLayoutsMap:(id)a3
{
}

- (THWControlContainer)calloutContainer
{
  return self->_calloutContainer;
}

- (void)setCalloutContainer:(id)a3
{
}

- (THWControlContainer)sidebarContainer
{
  return self->_sidebarContainer;
}

- (void)setSidebarContainer:(id)a3
{
}

@end