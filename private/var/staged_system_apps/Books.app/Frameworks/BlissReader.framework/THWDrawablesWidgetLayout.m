@interface THWDrawablesWidgetLayout
- (BOOL)dependentsRelyOnSize;
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isReflowablePresentation;
- (CGRect)stageFrame;
- (CGSize)p_idealForMaxSize:(CGSize)a3;
- (THWWidgetLayoutDelegate)delegate;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4 scale:(double)a5;
- (double)widgetStack:(id)a3 idealHeightForMaxSize:(CGSize)a4;
- (id)actualStageDrawable;
- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5;
- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4;
- (id)childrenForLayout;
- (id)dependentLayouts;
- (id)descendentWrappables;
- (id)layoutGeometryForLayout:(id)a3;
- (id)layoutGeometryFromProvider;
- (id)p_layoutGeometryForStageDrawable;
- (int)wrapContainerMode;
- (unsigned)widgetStack:(id)a3 maxLinesForWPLayout:(id)a4 withDefault:(unsigned int)a5;
- (void)p_invalidateExternal;
- (void)setDelegate:(id)a3;
- (void)setStageFrame:(CGRect)a3;
- (void)wasAddedToLayoutController:(id)a3;
@end

@implementation THWDrawablesWidgetLayout

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
  v3 = [(THWDrawablesWidgetLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  v3 = [(THWDrawablesWidgetLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (CGSize)p_idealForMaxSize:(CGSize)a3
{
  objc_msgSend(objc_msgSend(-[THWDrawablesWidgetLayout actualStageDrawable](self, "actualStageDrawable"), "geometry"), "size");
  TSDScaleSizeWithinSize();
  TSDRoundedSize();
  double v4 = v3 + 0.0;
  double v6 = v5 + 0.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (double)widgetStack:(id)a3 idealHeightForMaxSize:(CGSize)a4
{
  -[THWDrawablesWidgetLayout p_idealForMaxSize:](self, "p_idealForMaxSize:", a3, a4.width, a4.height);
  return v4;
}

- (unsigned)widgetStack:(id)a3 maxLinesForWPLayout:(id)a4 withDefault:(unsigned int)a5
{
  if ([(id)TSUDynamicCast() isAudioOnly]) {
    return 3;
  }
  else {
    return a5;
  }
}

- (id)actualStageDrawable
{
  if ([(THWDrawablesWidgetLayout *)self isExpanded]
    && objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "expandedStageDrawable"))
  {
    id v3 = [(THWDrawablesWidgetLayout *)self info];
    return [v3 expandedStageDrawable];
  }
  else
  {
    id v5 = [(THWDrawablesWidgetLayout *)self info];
    return [v5 stageDrawable];
  }
}

- (id)layoutGeometryFromProvider
{
  if ([(THWDrawablesWidgetLayout *)self isExpanded])
  {
    [(THWWidgetLayoutDelegate *)[(THWDrawablesWidgetLayout *)self delegate] widgetLayoutBounds];
    id v7 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v3, v4, v5, v6];
    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWDrawablesWidgetLayout;
    return [(THWDrawablesWidgetLayout *)&v9 layoutGeometryFromProvider];
  }
}

- (id)childrenForLayout
{
  id v3 = [(THWDrawablesWidgetLayout *)self actualStageDrawable];
  if (v3)
  {
    id v6 = v3;
    double v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    double v4 = (NSArray *)&__NSArray0__struct;
  }
  if (![(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self]
    && objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "adornmentInfo"))
  {
    return objc_msgSend(objc_msgSend(-[THWDrawablesWidgetLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", v4);
  }
  return v4;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (id)dependentLayouts
{
  v5.receiver = self;
  v5.super_class = (Class)THWDrawablesWidgetLayout;
  id v3 = [[-[THWDrawablesWidgetLayout dependentLayouts](&v5, "dependentLayouts") mutableCopy];
  if (!v3) {
    id v3 = +[NSMutableArray array];
  }
  [v3 addObjectsFromArray:[self children]];
  return v3;
}

- (CGRect)stageFrame
{
  p_stageFrame = &self->_stageFrame;
  v8.origin.double x = CGRectZero.origin.x;
  v8.origin.double y = CGRectZero.origin.y;
  v8.size.double width = CGRectZero.size.width;
  v8.size.double height = CGRectZero.size.height;
  if (CGRectEqualToRect(v8, self->_stageFrame))
  {
    [self p_layoutGeometryForStageDrawable].frame
    p_stageFrame->origin.double x = x;
    p_stageFrame->origin.double y = y;
    p_stageFrame->size.double width = width;
    p_stageFrame->size.double height = height;
  }
  else
  {
    double x = p_stageFrame->origin.x;
    double y = p_stageFrame->origin.y;
    double width = p_stageFrame->size.width;
    double height = p_stageFrame->size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)p_layoutGeometryForStageDrawable
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(THWDrawablesWidgetLayout *)self children];
  id result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        CGRect v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        id v9 = [v8 info];
        if (v9 == [(THWDrawablesWidgetLayout *)self actualStageDrawable]) {
          return objc_msgSend(objc_msgSend(v8, "geometry"), "copy");
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4 scale:(double)a5
{
  CGFloat v6 = a4.width + -128.0;
  CGFloat v7 = a4.height + -128.0;
  id v8 = +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:", [(THWDrawablesWidgetLayout *)self p_layoutGeometryForStageDrawable], 0.0, 0.0, a3.width + -128.0, a3.height + -128.0);
  id v9 = +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:", [(THWDrawablesWidgetLayout *)self p_layoutGeometryForStageDrawable], 0.0, 0.0, v6, v7);
  [v8 frame];
  double v11 = v10;
  double v13 = v12;
  [v9 frame];
  double result = 1.0;
  if (v11 > 0.0 && v13 > 0.0)
  {
    float v17 = v14 / v11;
    float v18 = v15 / v13;
    return fminf(v17, v18);
  }
  return result;
}

- (void)p_invalidateExternal
{
  [(THWDrawablesWidgetLayout *)self invalidateFrame];

  [(THWDrawablesWidgetLayout *)self invalidateChildren];
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  [(THWDrawablesWidgetLayout *)self p_invalidateExternal];
}

- (void)wasAddedToLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWDrawablesWidgetLayout;
  [(THWDrawablesWidgetLayout *)&v4 wasAddedToLayoutController:a3];
  [(THWDrawablesWidgetLayout *)self p_invalidateExternal];
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v4 = [a3 info];
  if (v4 != [(THWDrawablesWidgetLayout *)self actualStageDrawable]
    || [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self] != 3)
  {
    return 0;
  }
  [self geometry].size
  -[THWDrawablesWidgetLayout p_idealForMaxSize:](self, "p_idealForMaxSize:");
  TSDRectWithSize();
  [self geometry].size
  TSDRectWithSize();
  TSDCenterRectOverRect();
  id v9 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v5, v6, v7, v8];

  return v9;
}

- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4
{
  if (![(THWDrawablesWidgetLayout *)self isExpanded]) {
    return a3;
  }
  id v7 = [a4 info];
  if (v7 != [(THWDrawablesWidgetLayout *)self actualStageDrawable]) {
    return a3;
  }
  [(THWWidgetLayoutDelegate *)[(THWDrawablesWidgetLayout *)self delegate] widgetLayoutBounds];
  CGRect v11 = CGRectInset(v10, 64.0, 64.0);

  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:", a3, v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
}

- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5
{
  if (![(THWDrawablesWidgetLayout *)self isExpanded]) {
    return a3;
  }
  id v9 = [a5 info];
  if (v9 != [(THWDrawablesWidgetLayout *)self actualStageDrawable]) {
    return a3;
  }
  [(THWWidgetLayoutDelegate *)[(THWDrawablesWidgetLayout *)self delegate] widgetLayoutBounds];
  CGRect v20 = CGRectInset(v19, 64.0, 64.0);
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  [a4 frame];
  double v17 = THScaleNeededToFitSizeInSize(v15, v16, width, height);

  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:scale:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:scale:", a3, x, y, width, height, v17);
}

- (id)descendentWrappables
{
  return +[TSDLayout descendentWrappablesOfLayout:self];
}

- (int)wrapContainerMode
{
  return [self info].containerWrap;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setStageFrame:(CGRect)a3
{
  self->_stageFrame = a3;
}

@end