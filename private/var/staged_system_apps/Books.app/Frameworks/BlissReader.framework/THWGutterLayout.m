@interface THWGutterLayout
- (BOOL)dependentsRelyOnSize;
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isReflowablePresentation;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGRect)p_leftThirdBounds;
- (CGRect)p_rightTwoThirdBounds;
- (Class)repClassForTextLayout:(id)a3;
- (THWWidgetLayoutDelegate)delegate;
- (TSWPStorage)compactStorage;
- (double)p_scaleToFitStage;
- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5;
- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4;
- (id)childInfosForLayout;
- (id)dependentsOfTextLayout:(id)a3;
- (id)descendentWrappables;
- (id)layoutGeometryForLayout:(id)a3;
- (id)layoutGeometryFromProvider;
- (int)wrapContainerMode;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)dealloc;
- (void)p_invalidateExternal;
- (void)setCompactStorage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)wasAddedToLayoutController:(id)a3;
@end

@implementation THWGutterLayout

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWGutterLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (id)layoutGeometryFromProvider
{
  v9.receiver = self;
  v9.super_class = (Class)THWGutterLayout;
  id v3 = [(THWGutterLayout *)&v9 layoutGeometryFromProvider];
  if ([(THWGutterLayout *)self isCompactFlowPresentation])
  {
    [(THWWidgetLayoutDelegate *)[(THWGutterLayout *)self delegate] widgetLayoutBounds];
    double v5 = v4;
    if (v4 <= 414.0) {
      double v6 = v4 + -40.0;
    }
    else {
      double v6 = 374.0;
    }
    [self info].stageFrame;
    return [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:(v5 - v6) * 0.5, 0.0, v6, fmax(v7 + 20.0, 120.0)];
  }
  return v3;
}

- (id)childInfosForLayout
{
  v5.receiver = self;
  v5.super_class = (Class)THWGutterLayout;
  id v3 = [(THWGutterLayout *)&v5 childInfosForLayout];
  if ([(THWGutterLayout *)self isCompactFlowPresentation]
    && objc_msgSend(-[THWGutterLayout info](self, "info"), "titleShape")
    && objc_msgSend(objc_msgSend(-[THWGutterLayout info](self, "info"), "titleShape"), "containedStorage"))
  {
    id v3 = [v3 mutableCopy];
    [v3 removeObjectIdenticalTo:[-[THWGutterLayout info](self, "info") titleShape]];
    objc_msgSend(v3, "addObject:", objc_msgSend(objc_msgSend(-[THWGutterLayout info](self, "info"), "titleShape"), "containedStorage"));
  }
  return v3;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (CGRect)p_leftThirdBounds
{
  [self geometry].frame
  double v4 = v3 / 3.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.height = v2;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)p_rightTwoThirdBounds
{
  [self geometry].frame
  double v4 = v3 / 3.0;
  double v5 = (v3 + v3) / 3.0;
  double v6 = 0.0;
  result.size.height = v2;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (double)p_scaleToFitStage
{
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWGutterLayout info](self, "info"), "backgroundShape"), "geometry"), "size");
  double v4 = v3;
  double v6 = v5;
  [(THWGutterLayout *)self p_leftThirdBounds];

  return THScaleNeededToFitSizeInSize(v4, v6, v7, v8);
}

- (id)layoutGeometryForLayout:(id)a3
{
  if (![(THWGutterLayout *)self isCompactFlowPresentation]) {
    return 0;
  }
  objc_opt_class();
  double v4 = (void *)TSUDynamicCast();
  objc_opt_class();
  double v5 = (void *)TSUDynamicCast();
  id v6 = [v4 info];
  if (v6 != objc_msgSend(-[THWGutterLayout info](self, "info"), "stageInfo")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [v4 info];
    if (v7 == objc_msgSend(-[THWGutterLayout info](self, "info"), "backgroundShape"))
    {
      objc_msgSend(objc_msgSend(objc_msgSend(v4, "info"), "geometry"), "size");
      [(THWGutterLayout *)self p_leftThirdBounds];
      TSDFitOrFillSizeInRect();
      goto LABEL_9;
    }
    if (v5)
    {
      [v5 invalidateTextLayout];
      [(THWGutterLayout *)self p_rightTwoThirdBounds];
      CGRect v23 = CGRectInset(v22, 10.0, 10.0);
LABEL_9:
      id v9 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v23.origin.x, v23.origin.y, v23.size.width, v23.size.height];
      return v9;
    }
    return 0;
  }
  id v10 = objc_alloc((Class)TSDLayoutGeometry);
  [self info].stageFrame
  id v11 = [v10 initWithFrame:];
  [(THWGutterLayout *)self p_leftThirdBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(THWGutterLayout *)self p_scaleToFitStage];

  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:scale:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:scale:", v11, v13, v15, v17, v19, v20);
}

- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4
{
  return a3;
}

- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5
{
  if (![(THWGutterLayout *)self isCompactFlowPresentation]) {
    return a3;
  }
  objc_opt_class();
  id v7 = [(id)TSUDynamicCast() info];
  if (v7 != objc_msgSend(-[THWGutterLayout info](self, "info"), "stageInfo")) {
    return a3;
  }
  [(THWGutterLayout *)self p_leftThirdBounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(THWGutterLayout *)self p_scaleToFitStage];

  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:scale:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:scale:", a3, v10, v12, v14, v16, v17);
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
  double v3 = [(THWGutterLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  double v3 = [(THWGutterLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (void)p_invalidateExternal
{
  [(THWGutterLayout *)self invalidateFrame];

  [(THWGutterLayout *)self invalidateChildren];
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  [(THWGutterLayout *)self p_invalidateExternal];
}

- (void)wasAddedToLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWGutterLayout;
  [(THWGutterLayout *)&v4 wasAddedToLayoutController:a3];
  [(THWGutterLayout *)self p_invalidateExternal];
}

- (id)descendentWrappables
{
  return +[TSDLayout descendentWrappablesOfLayout:self];
}

- (int)wrapContainerMode
{
  return 0;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 0;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 1;
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

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (TSWPStorage)compactStorage
{
  return self->_compactStorage;
}

- (void)setCompactStorage:(id)a3
{
}

@end