@interface _UIActivityDragGestureRecognizer
- (UIAutoscroll)autoscroll;
- (UIEdgeInsets)draggingInsets;
- (UIScrollView)targetScrollView;
- (_UIActivityDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (int)autoscrollDirectionsForPoint:(CGPoint)a3 inView:(id)a4;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)beginAutoscrollAndUpdateDirectionIfNeeded;
- (void)cancelAutoscroll;
- (void)reset;
- (void)setAutoscroll:(id)a3;
- (void)setDraggingInsets:(UIEdgeInsets)a3;
- (void)setState:(int64_t)a3;
- (void)setTargetScrollView:(id)a3;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateAutoscroll:(id)a3;
@end

@implementation _UIActivityDragGestureRecognizer

- (_UIActivityDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIActivityDragGestureRecognizer;
  v4 = [(_UIActivityDragGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4) {
    -[_UIActivityDragGestureRecognizer setDraggingInsets:](v4, "setDraggingInsets:", 0.0, 22.0, 0.0, 22.0);
  }
  return v5;
}

- (void)setState:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIActivityDragGestureRecognizer;
  -[_UIActivityDragGestureRecognizer setState:](&v7, sel_setState_);
  if (a3 == 2)
  {
    [(_UIActivityDragGestureRecognizer *)self beginAutoscrollAndUpdateDirectionIfNeeded];
    v5 = [(_UIActivityDragGestureRecognizer *)self autoscroll];
    [(_UIActivityDragGestureRecognizer *)self updateAutoscroll:v5];
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    v5 = [(_UIActivityDragGestureRecognizer *)self view];
    v6 = [v5 _enclosingScrollableScrollerIncludingSelf];
    [(_UIActivityDragGestureRecognizer *)self setTargetScrollView:v6];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityDragGestureRecognizer;
  [(_UIActivityDragGestureRecognizer *)&v3 reset];
  [(_UIActivityDragGestureRecognizer *)self cancelAutoscroll];
  [(_UIActivityDragGestureRecognizer *)self setAutoscroll:0];
  [(_UIActivityDragGestureRecognizer *)self setTargetScrollView:0];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIActivityDragGestureRecognizer;
  [(_UIActivityDragGestureRecognizer *)&v5 touchesMoved:a3 withEvent:a4];
  if ([(_UIActivityDragGestureRecognizer *)self state] == 2) {
    [(_UIActivityDragGestureRecognizer *)self setState:2];
  }
}

- (void)updateAutoscroll:(id)a3
{
  id v31 = a3;
  v4 = [(_UIActivityDragGestureRecognizer *)self targetScrollView];
  objc_super v5 = v4;
  if (!v4) {
    goto LABEL_18;
  }
  [v4 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 contentOffset];
  double v15 = v14;
  double v17 = v16;
  v18 = [(_UIActivityDragGestureRecognizer *)self autoscroll];
  unsigned int v19 = [v18 directions];

  double Width = 0.0;
  unsigned int v21 = v19 & 0xFFFFFFFE;
  if (v15 > 0.0) {
    unsigned int v21 = v19;
  }
  else {
    double Width = v15;
  }
  if (v19) {
    double v22 = Width;
  }
  else {
    double v22 = v15;
  }
  if (v19) {
    unsigned int v23 = v21;
  }
  else {
    unsigned int v23 = v19;
  }
  if ((v23 & 2) == 0) {
    goto LABEL_14;
  }
  objc_msgSend(v5, "contentSize", Width);
  double v25 = v24;
  v33.origin.x = v7;
  v33.origin.y = v9;
  v33.size.width = v11;
  v33.size.height = v13;
  double Width = CGRectGetWidth(v33);
  double v26 = v25 - Width;
  if (v22 >= v25 - Width)
  {
    v23 &= ~2u;
LABEL_14:
    double v26 = v22;
    if (!v23)
    {
      [(_UIActivityDragGestureRecognizer *)self cancelAutoscroll];
      goto LABEL_18;
    }
  }
  if ((unint64_t)objc_msgSend(v31, "count", Width) <= 1)
  {
    UIDistanceBetweenPoints();
    double v28 = v27 / 333.333333;
    [v5 _contentOffsetAnimationDuration];
    double v30 = v29;
    [v5 _setContentOffsetAnimationDuration:v28];
    objc_msgSend(v5, "setContentOffset:animated:", 1, v26, v17);
    [v5 _setContentOffsetAnimationDuration:v30];
  }
LABEL_18:
}

- (void)_observeScrollViewDidScroll:(id)a3
{
}

- (void)beginAutoscrollAndUpdateDirectionIfNeeded
{
  id v6 = [(_UIActivityDragGestureRecognizer *)self autoscroll];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1490]);
    -[_UIActivityDragGestureRecognizer setAutoscroll:](self, "setAutoscroll:");
  }
  objc_super v3 = [(_UIActivityDragGestureRecognizer *)self targetScrollView];
  if (v3)
  {
    [(_UIActivityDragGestureRecognizer *)self locationInView:v3];
    objc_msgSend(v3, "_setAutoscrolling:", objc_msgSend(v6, "startAutoscroll:scrollContainer:point:directions:repeatInterval:", self, v3, -[_UIActivityDragGestureRecognizer autoscrollDirectionsForPoint:inView:](self, "autoscrollDirectionsForPoint:inView:", v3), v4, v5, 0.2));
    if ([v3 _isAutoscrolling]) {
      [v3 _addScrollViewScrollObserver:self];
    }
  }
}

- (void)cancelAutoscroll
{
  objc_super v3 = [(_UIActivityDragGestureRecognizer *)self targetScrollView];
  [v3 _removeScrollViewScrollObserver:self];

  double v4 = [(_UIActivityDragGestureRecognizer *)self targetScrollView];
  [v4 _setAutoscrolling:0];

  id v5 = [(_UIActivityDragGestureRecognizer *)self autoscroll];
  [v5 invalidate];
}

- (int)autoscrollDirectionsForPoint:(CGPoint)a3 inView:(id)a4
{
  if (!a4) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  [a4 bounds];
  CGFloat v7 = v21.origin.x;
  CGFloat v8 = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  double MinX = CGRectGetMinX(v21);
  [(_UIActivityDragGestureRecognizer *)self draggingInsets];
  int v13 = x <= MinX + v12;
  v22.origin.double x = v7;
  v22.origin.double y = v8;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v22);
  [(_UIActivityDragGestureRecognizer *)self draggingInsets];
  if (x >= MaxX - v15) {
    v13 |= 2u;
  }
  v23.origin.double x = v7;
  v23.origin.double y = v8;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v23);
  [(_UIActivityDragGestureRecognizer *)self draggingInsets];
  if (y <= MinY + v17) {
    v13 |= 4u;
  }
  v24.origin.double x = v7;
  v24.origin.double y = v8;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v24);
  [(_UIActivityDragGestureRecognizer *)self draggingInsets];
  if (y >= MaxY - v19) {
    return v13 | 8;
  }
  else {
    return v13;
  }
}

- (UIEdgeInsets)draggingInsets
{
  double top = self->_draggingInsets.top;
  double left = self->_draggingInsets.left;
  double bottom = self->_draggingInsets.bottom;
  double right = self->_draggingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDraggingInsets:(UIEdgeInsets)a3
{
  self->_draggingInsets = a3;
}

- (UIScrollView)targetScrollView
{
  return self->_targetScrollView;
}

- (void)setTargetScrollView:(id)a3
{
}

- (UIAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_targetScrollView, 0);
}

@end