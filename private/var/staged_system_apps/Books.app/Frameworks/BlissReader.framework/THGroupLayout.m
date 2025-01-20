@interface THGroupLayout
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isReflowablePresentation;
- (THWWidgetLayoutDelegate)delegate;
- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5;
- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4;
- (id)layoutGeometryForLayout:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation THGroupLayout

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
  v3 = [(THGroupLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  v3 = [(THGroupLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (id)layoutGeometryForLayout:(id)a3
{
  return 0;
}

- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4
{
  id v4 = a3;
  if ([(THGroupLayout *)self isCompactFlowPresentation])
  {
    objc_opt_class();
    [(THGroupLayout *)self parent];
    v6 = (void *)TSUDynamicCast();
    if (v6)
    {
      [v6 maximumFrameSizeForChild:self];
      double v8 = v7;
      [self layoutGeometryFromInfo].frame
      memset(&v15, 0, sizeof(v15));
      CGAffineTransformMakeScale(&v15, v8 / v9, v8 / v9);
      if (v4) {
        [v4 transform];
      }
      else {
        memset(&t1, 0, sizeof(t1));
      }
      CGAffineTransform v12 = v15;
      CGAffineTransformConcat(&v14, &t1, &v12);
      CGAffineTransform v15 = v14;
      id v10 = objc_alloc((Class)TSDLayoutGeometry);
      [v4 size];
      CGAffineTransform v14 = v15;
      return [v10 initWithSize:&v14 transform:];
    }
  }
  return v4;
}

- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5
{
  return [(THGroupLayout *)self adjustLayoutGeometry:a3 forLayout:a5];
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
}

@end