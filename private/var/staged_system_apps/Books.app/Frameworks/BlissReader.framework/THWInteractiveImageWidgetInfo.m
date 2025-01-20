@interface THWInteractiveImageWidgetInfo
- (BOOL)showTransportControls;
- (BOOL)useSidebar;
- (CGSize)backgroundSize;
- (Class)layoutClass;
- (Class)repClass;
- (NSEnumerator)calloutEnumerator;
- (NSString)progressKitID;
- (NSString)progressKitSectionID;
- (THWInteractiveImageRadioPanelInfo)transportControlsInfo;
- (THWInteractiveImageSidebarInfo)sidebar;
- (THWInteractiveImageWidgetInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 stageGeometry:(id)a6;
- (THWStageGeometry)stageGeometry;
- (THWWidgetAdornmentInfo)adornmentInfo;
- (TSDContainerInfo)zoomedInfo;
- (TSDImageInfo)backgroundImageInfo;
- (TSSStyle)viewportStyle;
- (TSWWidgetStyle)style;
- (double)maxViewScale;
- (double)maxZoomScale;
- (double)minViewScale;
- (double)minZoomScale;
- (double)sidebarWidth;
- (double)stageCornerRadius;
- (id)backgroundFill;
- (id)calloutAtIndex:(unint64_t)a3;
- (id)childEnumerator;
- (unint64_t)calloutCount;
- (unint64_t)indexOfCallout:(id)a3;
- (void)dealloc;
- (void)p_initZoomLimits;
- (void)setAdornmentInfo:(id)a3;
- (void)setBackgroundFill:(id)a3;
- (void)setBackgroundImageInfo:(id)a3;
- (void)setBackgroundSize:(CGSize)a3;
- (void)setMaxViewScale:(double)a3;
- (void)setMinViewScale:(double)a3;
- (void)setProgressKitID:(id)a3;
- (void)setProgressKitSectionID:(id)a3;
- (void)setShowTransportControls:(BOOL)a3;
- (void)setSidebar:(id)a3;
- (void)setSidebarWidth:(double)a3;
- (void)setStageGeometry:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTransportControlsInfo:(id)a3;
- (void)setUseSidebar:(BOOL)a3;
- (void)setViewportStyle:(id)a3;
- (void)setZoomedInfo:(id)a3;
- (void)setupWithCallouts:(id)a3 backgroundSize:(CGSize)a4 backgroundImageInfo:(id)a5 useSidebar:(BOOL)a6 showTransportControls:(BOOL)a7;
@end

@implementation THWInteractiveImageWidgetInfo

- (NSEnumerator)calloutEnumerator
{
  return [(NSArray *)self->_callouts objectEnumerator];
}

- (unint64_t)calloutCount
{
  return [(NSArray *)self->_callouts count];
}

- (id)calloutAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_callouts objectAtIndex:a3];
}

- (unint64_t)indexOfCallout:(id)a3
{
  if (a3) {
    return -[NSArray indexOfObjectIdenticalTo:](self->_callouts, "indexOfObjectIdenticalTo:");
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (double)stageCornerRadius
{
  return 3.0;
}

- (THWInteractiveImageWidgetInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 stageGeometry:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)THWInteractiveImageWidgetInfo;
  v8 = [(THWInteractiveImageWidgetInfo *)&v10 initWithContext:a3 geometry:a4];
  if (v8)
  {
    v8->_style = (TSWWidgetStyle *)a5;
    v8->_stageGeometry = (THWStageGeometry *)a6;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetInfo;
  [(THWInteractiveImageWidgetInfo *)&v3 dealloc];
}

- (void)setupWithCallouts:(id)a3 backgroundSize:(CGSize)a4 backgroundImageInfo:(id)a5 useSidebar:(BOOL)a6 showTransportControls:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  -[THWInteractiveImageWidgetInfo setBackgroundSize:](self, "setBackgroundSize:", a4.width, a4.height);
  [(THWInteractiveImageWidgetInfo *)self setBackgroundImageInfo:a5];
  id v12 = objc_alloc((Class)TSDInfoGeometry);
  [(THWStageGeometry *)[(THWInteractiveImageWidgetInfo *)self stageGeometry] frame];
  double y = CGPointZero.y;
  id v14 = [v12 initWithPosition:CGPointZero.x, y];

  self->_callouts = (NSArray *)[a3 copy];
  [(THWInteractiveImageWidgetInfo *)self setUseSidebar:v8];
  [(THWInteractiveImageWidgetInfo *)self setShowTransportControls:v7];
  [(THWStageGeometry *)[(THWInteractiveImageWidgetInfo *)self stageGeometry] frame];
  id v16 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:CGPointZero.x, y, v15, 44.0, 0.0];
  [(THWInteractiveImageWidgetInfo *)self setTransportControlsInfo:[[THWInteractiveImageRadioPanelInfo alloc] initWithGeometry:v16 widgetInfo:self]];

  [(THWInteractiveImageWidgetInfo *)self p_initZoomLimits];
}

- (void)p_initZoomLimits
{
  if (self->_callouts
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWInteractiveImageWidgetInfo p_initZoomLimits]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/InteractiveImage/THWInteractiveImageWidgetInfo.m"), 150, @"invalid nil value for '%s'", "_callouts"), self->_callouts))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v3 = [(THWInteractiveImageWidgetInfo *)self calloutEnumerator];
    id v4 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v23;
      double v7 = 1.0;
      double v8 = 1.0;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_super v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v10 viewScale];
          if (v8 >= v11) {
            double v8 = v11;
          }
          [v10 viewScale];
          if (v7 < v12) {
            double v7 = v12;
          }
        }
        id v5 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v5);
      double v13 = v8 * 0.5;
      double v14 = v7 + v7;
    }
    else
    {
      double v13 = 0.5;
      double v14 = 2.0;
    }
    [(THWStageGeometry *)[(THWInteractiveImageWidgetInfo *)self stageGeometry] frame];
    double v16 = v15;
    [(THWStageGeometry *)[(THWInteractiveImageWidgetInfo *)self stageGeometry] frame];
    if (v16 >= v17) {
      double v18 = v17;
    }
    else {
      double v18 = v16;
    }
    double v19 = v14 * (1024.0 / v18);
    double v20 = fmin(v13, 0.25);
    if (v19 >= 4.0) {
      double v21 = v19;
    }
    else {
      double v21 = 4.0;
    }
    [(THWInteractiveImageWidgetInfo *)self setMinViewScale:v20];
    [(THWInteractiveImageWidgetInfo *)self setMaxViewScale:v21];
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)childEnumerator
{
  id v3 = +[NSMutableArray array];
  id v4 = v3;
  if (self->_adornmentInfo) {
    [v3 addObject:];
  }

  return [v4 objectEnumerator];
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (void)setAdornmentInfo:(id)a3
{
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
}

- (CGSize)backgroundSize
{
  double width = self->_backgroundSize.width;
  double height = self->_backgroundSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBackgroundSize:(CGSize)a3
{
  self->_backgroundSize = a3;
}

- (id)backgroundFill
{
  return self->_backgroundFill;
}

- (void)setBackgroundFill:(id)a3
{
}

- (TSDImageInfo)backgroundImageInfo
{
  return self->_backgroundImageInfo;
}

- (void)setBackgroundImageInfo:(id)a3
{
}

- (TSDContainerInfo)zoomedInfo
{
  return self->_zoomedInfo;
}

- (void)setZoomedInfo:(id)a3
{
}

- (THWInteractiveImageRadioPanelInfo)transportControlsInfo
{
  return self->_transportControlsInfo;
}

- (void)setTransportControlsInfo:(id)a3
{
}

- (double)minZoomScale
{
  return self->_minZoomScale;
}

- (double)maxZoomScale
{
  return self->_maxZoomScale;
}

- (BOOL)showTransportControls
{
  return self->_showTransportControls;
}

- (void)setShowTransportControls:(BOOL)a3
{
  self->_showTransportControls = a3;
}

- (double)sidebarWidth
{
  return self->_sidebarWidth;
}

- (void)setSidebarWidth:(double)a3
{
  self->_sidebarWidth = a3;
}

- (TSWWidgetStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (THWStageGeometry)stageGeometry
{
  return self->_stageGeometry;
}

- (void)setStageGeometry:(id)a3
{
}

- (BOOL)useSidebar
{
  return self->_useSidebar;
}

- (void)setUseSidebar:(BOOL)a3
{
  self->_useSidebar = a3;
}

- (TSSStyle)viewportStyle
{
  return self->_viewportStyle;
}

- (void)setViewportStyle:(id)a3
{
}

- (double)minViewScale
{
  return self->_minViewScale;
}

- (void)setMinViewScale:(double)a3
{
  self->_minViewScale = a3;
}

- (double)maxViewScale
{
  return self->_maxViewScale;
}

- (void)setMaxViewScale:(double)a3
{
  self->_maxViewScale = a3;
}

- (THWInteractiveImageSidebarInfo)sidebar
{
  return self->_sidebar;
}

- (void)setSidebar:(id)a3
{
}

@end