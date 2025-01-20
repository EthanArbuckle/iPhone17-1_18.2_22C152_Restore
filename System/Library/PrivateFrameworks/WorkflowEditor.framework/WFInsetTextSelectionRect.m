@interface WFInsetTextSelectionRect
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isVertical;
- (CGRect)rect;
- (UIEdgeInsets)insets;
- (UITextSelectionRect)selectionRect;
- (WFInsetTextSelectionRect)initWithSelectionRect:(id)a3 insets:(UIEdgeInsets)a4;
- (int64_t)writingDirection;
@end

@implementation WFInsetTextSelectionRect

- (void).cxx_destruct
{
}

- (UITextSelectionRect)selectionRect
{
  return self->_selectionRect;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isVertical
{
  v2 = [(WFInsetTextSelectionRect *)self selectionRect];
  char v3 = [v2 isVertical];

  return v3;
}

- (BOOL)containsEnd
{
  v2 = [(WFInsetTextSelectionRect *)self selectionRect];
  char v3 = [v2 containsEnd];

  return v3;
}

- (BOOL)containsStart
{
  v2 = [(WFInsetTextSelectionRect *)self selectionRect];
  char v3 = [v2 containsStart];

  return v3;
}

- (int64_t)writingDirection
{
  v2 = [(WFInsetTextSelectionRect *)self selectionRect];
  int64_t v3 = [v2 writingDirection];

  return v3;
}

- (CGRect)rect
{
  int64_t v3 = [(WFInsetTextSelectionRect *)self selectionRect];
  [v3 rect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(WFInsetTextSelectionRect *)self insets];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 - (v12 + v16);
  double v19 = v11 - (v14 + v18);

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (WFInsetTextSelectionRect)initWithSelectionRect:(id)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFInsetTextSelectionRect;
  double v11 = [(WFInsetTextSelectionRect *)&v15 init];
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_selectionRect, a3);
    v12->_insets.CGFloat top = top;
    v12->_insets.CGFloat left = left;
    v12->_insets.CGFloat bottom = bottom;
    v12->_insets.CGFloat right = right;
    double v13 = v12;
  }

  return v12;
}

@end