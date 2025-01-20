@interface UIKBSplitTraits
+ (id)traitsWithLeftFrame:(CGRect)a3 rightFrame:(CGRect)a4 corners:(unint64_t)a5;
- (CGRect)leftFrame;
- (CGRect)rightFrame;
- (UIKBSplitTraits)initWithLeftFrame:(CGRect)a3 rightFrame:(CGRect)a4 corners:(unint64_t)a5;
- (unint64_t)corners;
@end

@implementation UIKBSplitTraits

- (UIKBSplitTraits)initWithLeftFrame:(CGRect)a3 rightFrame:(CGRect)a4 corners:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)UIKBSplitTraits;
  v14 = [(UIKBSplitTraits *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_rightFrame.origin.CGFloat x = x;
    v14->_rightFrame.origin.CGFloat y = y;
    v14->_rightFrame.size.CGFloat width = width;
    v14->_rightFrame.size.CGFloat height = height;
    v14->_leftFrame.origin.CGFloat x = v13;
    v14->_leftFrame.origin.CGFloat y = v12;
    v14->_leftFrame.size.CGFloat width = v11;
    v14->_leftFrame.size.CGFloat height = v10;
    v14->_corners = a5;
    v16 = v14;
  }

  return v15;
}

+ (id)traitsWithLeftFrame:(CGRect)a3 rightFrame:(CGRect)a4 corners:(unint64_t)a5
{
  v5 = -[UIKBSplitTraits initWithLeftFrame:rightFrame:corners:]([UIKBSplitTraits alloc], "initWithLeftFrame:rightFrame:corners:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return v5;
}

- (CGRect)leftFrame
{
  double x = self->_leftFrame.origin.x;
  double y = self->_leftFrame.origin.y;
  double width = self->_leftFrame.size.width;
  double height = self->_leftFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)rightFrame
{
  double x = self->_rightFrame.origin.x;
  double y = self->_rightFrame.origin.y;
  double width = self->_rightFrame.size.width;
  double height = self->_rightFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)corners
{
  return self->_corners;
}

@end