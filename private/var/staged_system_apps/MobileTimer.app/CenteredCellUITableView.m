@interface CenteredCellUITableView
- (CGRect)keyboardFrame;
- (void)layoutSubviews;
- (void)setKeyboardFrame:(CGRect)a3;
@end

@implementation CenteredCellUITableView

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)CenteredCellUITableView;
  [(CenteredCellUITableView *)&v34 layoutSubviews];
  [(CenteredCellUITableView *)self rowHeight];
  double v4 = v3;
  [(CenteredCellUITableView *)self sectionHeaderHeight];
  double v6 = v4 + v5;
  [(CenteredCellUITableView *)self sectionFooterHeight];
  double v8 = v6 + v7;
  v9 = [(CenteredCellUITableView *)self window];
  [(CenteredCellUITableView *)self bounds];
  [v9 convertRect:self fromView:self];
  v37.origin.CGFloat x = v10;
  v37.origin.CGFloat y = v11;
  v37.size.CGFloat width = v12;
  v37.size.double height = v13;
  CGRect v35 = CGRectIntersection(self->_keyboardFrame, v37);
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  CGFloat width = v35.size.width;
  double height = v35.size.height;

  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.double height = height;
  IsEmptCGFloat y = CGRectIsEmpty(v36);
  double v19 = 20.0;
  if (!IsEmpty) {
    double v19 = height;
  }
  double v20 = v8 + v19;
  if (height <= 0.0) {
    double v21 = 0.0;
  }
  else {
    double v21 = v8;
  }
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  [(CenteredCellUITableView *)self bounds];
  float v26 = (v25 - v20) * 0.5 - v21;
  double v27 = floorf(v26);
  [(CenteredCellUITableView *)self contentInset];
  if (left != v31 || (v28 == v27 ? (BOOL v32 = right == v30) : (BOOL v32 = 0), v32 ? (v33 = bottom == v29) : (v33 = 0), !v33)) {
    -[CenteredCellUITableView setContentInset:](self, "setContentInset:", v27, left, bottom, right);
  }
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

@end