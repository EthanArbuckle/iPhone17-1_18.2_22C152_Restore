@interface _UIFindNavigatorSearchFieldButton
- (BOOL)usesSquareIntrinsicSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (void)setUsesSquareIntrinsicSize:(BOOL)a3;
@end

@implementation _UIFindNavigatorSearchFieldButton

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  [(UIButton *)self intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;
  if ([(_UIFindNavigatorSearchFieldButton *)self usesSquareIntrinsicSize]) {
    double v10 = v9;
  }
  else {
    double v10 = v7;
  }
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)usesSquareIntrinsicSize
{
  return self->_usesSquareIntrinsicSize;
}

- (void)setUsesSquareIntrinsicSize:(BOOL)a3
{
  self->_usesSquareIntrinsicSize = a3;
}

@end