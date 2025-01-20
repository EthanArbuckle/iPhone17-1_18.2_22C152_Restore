@interface THImageLayout
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isInRoot;
- (BOOL)isIntroMedia;
- (BOOL)isReflowablePresentation;
- (THWWidgetLayoutDelegate)delegate;
- (double)p_insetAmount;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4 scale:(double)a5;
- (id)layoutGeometryFromProvider;
- (id)p_expandedLayoutGeometryForFrame:(CGRect)a3;
- (void)setDelegate:(id)a3;
@end

@implementation THImageLayout

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  [(THImageLayout *)self invalidateFrame];
}

- (BOOL)isExpanded
{
  unsigned int v3 = [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self] - 1;
  if (self->_delegate) {
    BOOL v4 = v3 >= 2;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (BOOL)isCompactFlowPresentation
{
  unsigned int v3 = [(THImageLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  unsigned int v3 = [(THImageLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (BOOL)isIntroMedia
{
  unsigned int v3 = [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self];
  return self->_delegate && v3 == 2;
}

- (BOOL)isInRoot
{
  return TSUDynamicCast() != 0;
}

- (double)p_insetAmount
{
  unsigned __int8 v3 = [(THImageLayout *)self isIntroMedia];
  double result = 0.0;
  if ((v3 & 1) == 0)
  {
    unsigned __int8 v5 = [[self layoutController:0.0] isCompactHeight];
    double result = 10.0;
    if ((v5 & 1) == 0)
    {
      unsigned int v6 = [[self layoutController:10.0] isCompactWidth];
      double result = 32.0;
      if (v6) {
        return 10.0;
      }
    }
  }
  return result;
}

- (id)p_expandedLayoutGeometryForFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(THImageLayout *)self p_insetAmount];
  CGFloat v9 = v8;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGRect v13 = CGRectInset(v12, v9, v9);
  v11.receiver = self;
  v11.super_class = (Class)THImageLayout;
  return +[TSDLayout layoutGeometryFittingLayoutGeometry:inFrame:](TSDLayout, "layoutGeometryFittingLayoutGeometry:inFrame:", [(THImageLayout *)&v11 layoutGeometryFromProvider], v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
}

- (id)layoutGeometryFromProvider
{
  if ([(THImageLayout *)self isExpanded] && [(THImageLayout *)self isInRoot])
  {
    [(THWWidgetLayoutDelegate *)[(THImageLayout *)self delegate] widgetLayoutBounds];
    return [(THImageLayout *)self p_expandedLayoutGeometryForFrame:"p_expandedLayoutGeometryForFrame:"];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)THImageLayout;
    return [(THImageLayout *)&v4 layoutGeometryFromProvider];
  }
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = -[THImageLayout p_expandedLayoutGeometryForFrame:](self, "p_expandedLayoutGeometryForFrame:", 0.0, 0.0, a3.width, a3.height, a5);
  id v9 = -[THImageLayout p_expandedLayoutGeometryForFrame:](self, "p_expandedLayoutGeometryForFrame:", 0.0, 0.0, width, height);
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

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

@end