@interface THWViewportLayout
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isReflowablePresentation;
- (THWScrollableCanvasControlLayout)scrollableCanvasControlLayout;
- (THWViewportLayout)initWithInfo:(id)a3;
- (THWWidgetLayoutDelegate)delegate;
- (id)layoutGeometryForLayout:(id)a3;
- (id)layoutGeometryFromProvider;
- (void)dealloc;
- (void)p_invalidateExternal;
- (void)setDelegate:(id)a3;
- (void)setScrollableCanvasControlLayout:(id)a3;
- (void)updateChildrenFromInfo;
- (void)wasAddedToLayoutController:(id)a3;
@end

@implementation THWViewportLayout

- (THWViewportLayout)initWithInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWViewportLayout;
  return [(THWViewportLayout *)&v4 initWithInfo:a3];
}

- (void)dealloc
{
  [(THWViewportLayout *)self setScrollableCanvasControlLayout:0];
  v3.receiver = self;
  v3.super_class = (Class)THWViewportLayout;
  [(THWViewportLayout *)&v3 dealloc];
}

- (void)p_invalidateExternal
{
  [(THWViewportLayout *)self invalidateFrame];

  [(THWViewportLayout *)self invalidateChildren];
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  [(THWViewportLayout *)self p_invalidateExternal];
}

- (void)wasAddedToLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWViewportLayout;
  [(THWViewportLayout *)&v4 wasAddedToLayoutController:a3];
  [(THWViewportLayout *)self p_invalidateExternal];
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
  objc_super v3 = [(THWViewportLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  objc_super v3 = [(THWViewportLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (id)layoutGeometryFromProvider
{
  if ([(THWViewportLayout *)self isExpanded])
  {
    [(THWWidgetLayoutDelegate *)[(THWViewportLayout *)self delegate] widgetLayoutBounds];
    id v7 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v3, v4, v5, v6];
    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWViewportLayout;
    return [(THWViewportLayout *)&v9 layoutGeometryFromProvider];
  }
}

- (void)updateChildrenFromInfo
{
  v6.receiver = self;
  v6.super_class = (Class)THWViewportLayout;
  [(THWViewportLayout *)&v6 updateChildrenFromInfo];
  id v3 = +[NSMutableArray array];
  if (![(THWViewportLayout *)self scrollableCanvasControlLayout]) {
    [(THWViewportLayout *)self setScrollableCanvasControlLayout:objc_alloc_init(THWScrollableCanvasControlLayout)];
  }
  [v3 addObject:[self scrollableCanvasControlLayout]];
  if (![(THWViewportLayout *)self isExpanded])
  {
    id v4 = [[self info] backgroundShape];
    id v5 = [[self layoutController] layoutForInfo:v4];
    if (v5
      || (id v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(objc_msgSend(-[THWViewportLayout info](self, "info"), "backgroundShape"), "layoutClass")), "initWithInfo:", v4)) != 0)
    {
      [v3 addObject:v5];
    }
  }
  [(THWViewportLayout *)self setChildren:v3];
}

- (id)layoutGeometryForLayout:(id)a3
{
  [self geometry].frame
  TSDRectWithSize();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(THWViewportLayout *)self scrollableCanvasControlLayout] != a3
    && objc_msgSend(-[THWViewportLayout layoutController](self, "layoutController"), "layoutForInfo:", objc_msgSend(-[THWViewportLayout info](self, "info"), "backgroundShape")) != a3)
  {
    return 0;
  }
  id v14 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v6, v8, v10, v12];

  return v14;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (THWScrollableCanvasControlLayout)scrollableCanvasControlLayout
{
  return self->_scrollableCanvasControlLayout;
}

- (void)setScrollableCanvasControlLayout:(id)a3
{
}

@end