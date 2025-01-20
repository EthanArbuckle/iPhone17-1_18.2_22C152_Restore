@interface THWKeynoteLayout
- (BOOL)dependentsRelyOnSize;
- (BOOL)isCompact;
- (BOOL)isCompactFlowPresentation;
- (BOOL)isReflowablePresentation;
- (BOOL)p_autoplayEnabled;
- (BOOL)p_isExpanded;
- (BOOL)p_shouldShowPlayButton;
- (BOOL)playButtonHidden;
- (THWButtonControlLayout)playButtonLayout;
- (THWKeynoteLayout)initWithInfo:(id)a3;
- (THWKeynoteShowLayout)showLayout;
- (THWTransportControlLayout)transportControlLayout;
- (THWWidgetLayoutDelegate)delegate;
- (id)additionalLayouts;
- (id)childInfosForLayout;
- (id)dependentLayouts;
- (id)layoutGeometryForLayout:(id)a3;
- (id)layoutGeometryFromProvider;
- (void)dealloc;
- (void)hidePlayButton;
- (void)setDelegate:(id)a3;
- (void)setPlayButtonHidden:(BOOL)a3;
- (void)setPlayButtonLayout:(id)a3;
- (void)setTransportControlLayout:(id)a3;
- (void)showPlayButton;
@end

@implementation THWKeynoteLayout

- (THWKeynoteLayout)initWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWKeynoteLayout;
  v3 = [(THWKeynoteLayout *)&v6 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(objc_msgSend(-[THWKeynoteLayout info](v3, "info"), "showInfo"), "sourceURL"))
    {
      v4->_playButtonLayout = objc_alloc_init(THWButtonControlLayout);
      if (objc_msgSend(-[THWKeynoteLayout info](v4, "info"), "showTransportControls")) {
        v4->_transportControlLayout = objc_alloc_init(THWTransportControlLayout);
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (BOOL)p_autoplayEnabled
{
  id v2 = [[self info] autoplayConfig];

  return [v2 enabled];
}

- (BOOL)isCompact
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWKeynoteLayout layoutController](self, "layoutController"), "canvas"), "canvasController");
  objc_super v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    v4 = v3;
    if ([v3 isCompactWidth])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [v4 isCompactHeight];
    }
  }
  return (char)v3;
}

- (BOOL)p_shouldShowPlayButton
{
  BOOL playButtonHidden = self->_playButtonHidden;
  BOOL v4 = !self->_playButtonHidden;
  if ([(THWKeynoteLayout *)self p_autoplayEnabled])
  {
    BOOL v5 = [(THWKeynoteLayout *)self isCompact];
    return !playButtonHidden && v5;
  }
  return v4;
}

- (THWKeynoteShowLayout)showLayout
{
  result = [-[THWKeynoteLayout info](self, "info") showInfo];
  if (result)
  {
    id v4 = [(THWKeynoteLayout *)self layoutController];
    [self info].showInfo;
    return (THWKeynoteShowLayout *)[v4 layoutForInfo:v5];
  }
  return result;
}

- (THWButtonControlLayout)playButtonLayout
{
  return self->_playButtonLayout;
}

- (THWTransportControlLayout)transportControlLayout
{
  return self->_transportControlLayout;
}

- (void)hidePlayButton
{
  self->_BOOL playButtonHidden = 1;
  [(THWKeynoteLayout *)self invalidateChildren];
}

- (void)showPlayButton
{
  self->_BOOL playButtonHidden = 0;
  [(THWKeynoteLayout *)self invalidateChildren];
}

- (id)layoutGeometryFromProvider
{
  if ([(THWKeynoteLayout *)self isExpanded])
  {
    [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutBounds];
    id v7 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v3, v4, v5, v6];
    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWKeynoteLayout;
    return [(THWKeynoteLayout *)&v9 layoutGeometryFromProvider];
  }
}

- (id)dependentLayouts
{
  id v3 = +[NSMutableArray array];
  double v4 = [(THWKeynoteLayout *)self showLayout];
  if (v4) {
    [v3 addObject:v4];
  }
  if ([(THWKeynoteLayout *)self p_shouldShowPlayButton] && self->_playButtonLayout) {
    [v3 addObject:];
  }
  if (self->_transportControlLayout) {
    [v3 addObject:];
  }
  return v3;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (id)childInfosForLayout
{
  if (objc_msgSend(-[THWKeynoteLayout info](self, "info"), "showInfo")) {
    id v3 = [NSArray arrayWithObject:[self info].showInfo];
  }
  else {
    id v3 = +[NSArray array];
  }
  double v4 = v3;
  if ([(THWKeynoteLayout *)self p_isExpanded]
    || !objc_msgSend(-[THWKeynoteLayout info](self, "info"), "adornmentInfo"))
  {
    return v4;
  }
  id v5 = [self info].adornmentInfo;

  return [v5 interleavedInfosWithInfos:v4];
}

- (id)additionalLayouts
{
  id v3 = +[NSMutableArray array];
  if (![(THWKeynoteLayout *)self p_isExpanded])
  {
    if ([(THWKeynoteLayout *)self p_shouldShowPlayButton] && self->_playButtonLayout) {
      [v3 addObject:];
    }
    if (self->_transportControlLayout) {
      [v3 addObject:];
    }
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  [(THWKeynoteLayout *)self invalidateFrame];
}

- (BOOL)isCompactFlowPresentation
{
  id v3 = [(THWKeynoteLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  id v3 = [(THWKeynoteLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (id)layoutGeometryForLayout:(id)a3
{
  if (!objc_msgSend(-[THWKeynoteLayout info](self, "info"), "showInfo")) {
    return 0;
  }
  id v5 = objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithInfoGeometry:", objc_msgSend(objc_msgSend(-[THWKeynoteLayout info](self, "info"), "showInfo"), "geometry"));
  if ([(THWKeynoteLayout *)self p_isExpanded])
  {
    [(THWKeynoteShowLayout *)[(THWKeynoteLayout *)self showLayout] showSize];
    [self geometry].frame
    TSDScaleSizeWithinSize();
    [self geometry].frame
    TSDCenterOfRect();
    TSDRectWithCenterAndSize();
    id v5 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v6, v7, v8, v9];
  }
  if ([(THWKeynoteLayout *)self showLayout] == a3 || self->_playButtonLayout == a3) {
    return v5;
  }
  if (self->_transportControlLayout != a3) {
    return 0;
  }
  [v5 frame];
  id v11 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:CGRectMake(v13.origin.x, CGRectGetMaxY(v13), v13.size.width, 30.0)];

  return v11;
}

- (BOOL)p_isExpanded
{
  delegate = self->_delegate;
  if (delegate) {
    LOBYTE(delegate) = [(THWWidgetLayoutDelegate *)delegate widgetLayoutMode:self] == 1;
  }
  return (char)delegate;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setPlayButtonLayout:(id)a3
{
}

- (void)setTransportControlLayout:(id)a3
{
}

- (BOOL)playButtonHidden
{
  return self->_playButtonHidden;
}

- (void)setPlayButtonHidden:(BOOL)a3
{
  self->_BOOL playButtonHidden = a3;
}

@end