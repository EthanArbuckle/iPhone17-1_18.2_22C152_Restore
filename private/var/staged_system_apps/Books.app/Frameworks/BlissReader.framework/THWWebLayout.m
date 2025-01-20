@interface THWWebLayout
- (BOOL)dependentsRelyOnSize;
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isReflowablePresentation;
- (CGRect)idealWebFrame;
- (CGRect)idealWebFrameInRoot;
- (CGRect)stageFrame;
- (CGRect)stageFrameInRoot;
- (CGRect)webFrame;
- (CGRect)webFrameInRoot;
- (CGSize)p_idealForMaxSize:(CGSize)a3;
- (CGSize)webSizeInStageSize:(CGSize)a3;
- (THWButtonControlLayout)playButtonLayout;
- (THWWebLayout)initWithInfo:(id)a3;
- (THWWidgetLayoutDelegate)delegate;
- (double)widgetStack:(id)a3 idealHeightForMaxSize:(CGSize)a4;
- (id)childrenForLayout;
- (id)dependentLayouts;
- (id)layoutGeometryForLayout:(id)a3;
- (id)layoutGeometryFromProvider;
- (void)dealloc;
- (void)hidePlayButton;
- (void)setDelegate:(id)a3;
- (void)setPlayButtonLayout:(id)a3;
@end

@implementation THWWebLayout

- (THWWebLayout)initWithInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWWebLayout;
  v3 = [(THWWebLayout *)&v5 initWithInfo:a3];
  if (v3) {
    v3->_playButtonLayout = objc_alloc_init(THWButtonControlLayout);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWWebLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (THWButtonControlLayout)playButtonLayout
{
  return self->_playButtonLayout;
}

- (CGRect)stageFrame
{
  unsigned int v3 = [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self];
  if (v3 - 1 < 2)
  {
    [self geometry].size;
    TSDRectWithSize();
  }
  else if (v3)
  {
    if (v3 == 3)
    {
      [self geometry].size;
      -[THWWebLayout p_idealForMaxSize:](self, "p_idealForMaxSize:");
      TSDRectWithSize();
      TSDRectWithSize();
      TSDCenterRectOverRect();
    }
    else
    {
      double x = CGRectNull.origin.x;
      double y = CGRectNull.origin.y;
      double width = CGRectNull.size.width;
      double height = CGRectNull.size.height;
    }
  }
  else
  {
    objc_msgSend(objc_msgSend(-[THWWebLayout info](self, "info"), "stageGeometry"), "boundsBeforeRotation");
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)stageFrameInRoot
{
  [(THWWebLayout *)self stageFrame];

  -[THWWebLayout rectInRoot:](self, "rectInRoot:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)webFrame
{
  [(THWWebLayout *)self stageFrame];
  double v4 = v3;
  double v6 = v5;
  TSDCenterOfRect();
  -[THWWebLayout webSizeInStageSize:](self, "webSizeInStageSize:", v4, v6);

  TSDRectWithCenterAndSize();
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)webFrameInRoot
{
  [(THWWebLayout *)self webFrame];

  -[THWWebLayout rectInRoot:](self, "rectInRoot:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGSize)webSizeInStageSize:(CGSize)a3
{
  [self info].idealWebSize;

  TSDShrinkSizeToFitInSize();
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGRect)idealWebFrame
{
  [(THWWebLayout *)self stageFrame];
  TSDCenterOfRect();
  [self info].idealWebSize;

  TSDRectWithCenterAndSize();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)idealWebFrameInRoot
{
  [(THWWebLayout *)self idealWebFrame];

  -[THWWebLayout rectInRoot:](self, "rectInRoot:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)hidePlayButton
{
  self->_playButtonLayout = 0;

  [(THWWebLayout *)self invalidateChildren];
}

- (id)layoutGeometryFromProvider
{
  delegate = self->_delegate;
  if (delegate && [(THWWidgetLayoutDelegate *)delegate widgetLayoutMode:self] == 1)
  {
    [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutBounds];
    id v8 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v4, v5, v6, v7];
    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)THWWebLayout;
    return [(THWWebLayout *)&v10 layoutGeometryFromProvider];
  }
}

- (id)dependentLayouts
{
  v5.receiver = self;
  v5.super_class = (Class)THWWebLayout;
  id v3 = [[-[THWWebLayout dependentLayouts](&v5, "dependentLayouts") mutableCopy]];
  if (!v3) {
    id v3 = +[NSMutableArray array];
  }
  if (self->_playButtonLayout) {
    [v3 addObject:];
  }
  return v3;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
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
  id v3 = [(THWWebLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  id v3 = [(THWWebLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (id)childrenForLayout
{
  id v3 = [[self info] childInfos];
  if (![(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self]
    && objc_msgSend(-[THWWebLayout info](self, "info"), "adornmentInfo"))
  {
    id v3 = objc_msgSend(objc_msgSend(-[THWWebLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", v3);
  }
  if (!v3) {
    id v3 = &__NSArray0__struct;
  }
  if ([(THWWebLayout *)self isExpanded]
    || !self->_playButtonLayout
    || (objc_msgSend(objc_msgSend(-[THWWebLayout info](self, "info"), "autoplayConfig"), "enabled") & 1) != 0)
  {
    return v3;
  }
  playButtonLayout = self->_playButtonLayout;

  return [v3 arrayByAddingObject:playButtonLayout];
}

- (id)layoutGeometryForLayout:(id)a3
{
  if (self->_playButtonLayout != a3) {
    return 0;
  }
  [(THWWebLayout *)self stageFrame];
  id v8 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v4, v5, v6, v7];

  return v8;
}

- (CGSize)p_idealForMaxSize:(CGSize)a3
{
  objc_msgSend(objc_msgSend(-[THWWebLayout info](self, "info"), "stageGeometry"), "boundsBeforeRotation");
  TSDScaleSizeWithinSize();

  TSDRoundedSize();
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (double)widgetStack:(id)a3 idealHeightForMaxSize:(CGSize)a4
{
  -[THWWebLayout p_idealForMaxSize:](self, "p_idealForMaxSize:", a3, a4.width, a4.height);
  return v4;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
}

- (void)setPlayButtonLayout:(id)a3
{
}

@end