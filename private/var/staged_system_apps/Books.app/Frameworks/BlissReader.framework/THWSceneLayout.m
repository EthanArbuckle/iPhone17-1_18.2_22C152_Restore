@interface THWSceneLayout
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isReflowablePresentation;
- (THWWidgetLayoutDelegate)delegate;
- (id)layoutGeometryFromProvider;
- (void)setDelegate:(id)a3;
- (void)updateChildrenFromInfo;
@end

@implementation THWSceneLayout

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  [(THWSceneLayout *)self invalidateFrame];
}

- (BOOL)isExpanded
{
  unsigned int v3 = [(THWWidgetLayoutDelegate *)[(THWSceneLayout *)self delegate] widgetLayoutMode:self];
  return [(THWSceneLayout *)self delegate] && v3 == 1;
}

- (BOOL)isCompactFlowPresentation
{
  unsigned int v3 = [(THWSceneLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  unsigned int v3 = [(THWSceneLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (void)updateChildrenFromInfo
{
  v6.receiver = self;
  v6.super_class = (Class)THWSceneLayout;
  [(THWSceneLayout *)&v6 updateChildrenFromInfo];
  id v3 = +[NSMutableArray array];
  if (![(THWSceneLayout *)self isExpanded])
  {
    id v4 = [[self info] placeholderImage];
    id v5 = [[self layoutController] layoutForInfo:v4];
    if (v5
      || (id v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "layoutClass")), "initWithInfo:", v4)) != 0)
    {
      [v3 addObject:v5];
    }
  }
  [(THWSceneLayout *)self setChildren:v3];
  [self.children makeObjectsPerformSelector:@selector(updateChildrenFromInfo)];
}

- (id)layoutGeometryFromProvider
{
  if ([(THWSceneLayout *)self isExpanded])
  {
    [(THWWidgetLayoutDelegate *)[(THWSceneLayout *)self delegate] widgetLayoutBounds];
    id v7 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v3, v4, v5, v6];
    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWSceneLayout;
    return [(THWSceneLayout *)&v9 layoutGeometryFromProvider];
  }
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

@end