@interface BCCardViewControllerViewState
- (BCCardViewControllerViewState)initWithContentOffset:(CGPoint)a3 contentScrollViewContentOffset:(CGPoint)a4 viewSize:(CGSize)a5;
- (CGPoint)cardScrollViewContentOffset;
- (CGPoint)contentScrollViewContentOffset;
- (CGSize)viewSize;
- (id)description;
@end

@implementation BCCardViewControllerViewState

- (BCCardViewControllerViewState)initWithContentOffset:(CGPoint)a3 contentScrollViewContentOffset:(CGPoint)a4 viewSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v9 = a3.y;
  CGFloat v10 = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)BCCardViewControllerViewState;
  result = [(BCCardViewControllerViewState *)&v12 init];
  if (result)
  {
    result->_cardScrollViewContentOffset.CGFloat x = v10;
    result->_cardScrollViewContentOffset.CGFloat y = v9;
    result->_contentScrollViewContentOffset.CGFloat x = x;
    result->_contentScrollViewContentOffset.CGFloat y = y;
    result->_viewSize.CGFloat width = width;
    result->_viewSize.CGFloat height = height;
  }
  return result;
}

- (id)description
{
  v3 = NSStringFromCGPoint(self->_cardScrollViewContentOffset);
  v4 = NSStringFromCGPoint(self->_contentScrollViewContentOffset);
  v5 = NSStringFromCGSize(self->_viewSize);
  v6 = +[NSString stringWithFormat:@"<BCCardViewControllerViewState: %p> contentOffset: %@, contentScrollViewContentOffset: %@, viewSize: %@", self, v3, v4, v5];

  return v6;
}

- (CGPoint)cardScrollViewContentOffset
{
  double x = self->_cardScrollViewContentOffset.x;
  double y = self->_cardScrollViewContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)contentScrollViewContentOffset
{
  double x = self->_contentScrollViewContentOffset.x;
  double y = self->_contentScrollViewContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end