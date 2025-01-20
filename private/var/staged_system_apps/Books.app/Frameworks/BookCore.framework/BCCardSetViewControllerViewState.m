@interface BCCardSetViewControllerViewState
- (BCCardSetViewControllerViewState)initWithIsExpanded:(BOOL)a3 viewSize:(CGSize)a4;
- (BOOL)isExpanded;
- (CGSize)viewSize;
- (id)description;
@end

@implementation BCCardSetViewControllerViewState

- (BCCardSetViewControllerViewState)initWithIsExpanded:(BOOL)a3 viewSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v8.receiver = self;
  v8.super_class = (Class)BCCardSetViewControllerViewState;
  result = [(BCCardSetViewControllerViewState *)&v8 init];
  if (result)
  {
    result->_isExpanded = a3;
    result->_viewSize.CGFloat width = width;
    result->_viewSize.CGFloat height = height;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<BCCardSetViewControllerViewState: %p> isExpanded: %d", self, self->_isExpanded];
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
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