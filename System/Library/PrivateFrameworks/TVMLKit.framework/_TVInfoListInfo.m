@interface _TVInfoListInfo
- (NSArray)dataViews;
- (NSString)group;
- (UIEdgeInsets)headerMargin;
- (UIEdgeInsets)headerPadding;
- (UIView)headerContentView;
- (double)lineSpacing;
- (double)width;
- (void)setDataViews:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHeaderContentView:(id)a3;
- (void)setHeaderMargin:(UIEdgeInsets)a3;
- (void)setHeaderPadding:(UIEdgeInsets)a3;
- (void)setLineSpacing:(double)a3;
- (void)setWidth:(double)a3;
@end

@implementation _TVInfoListInfo

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (UIEdgeInsets)headerMargin
{
  double top = self->_headerMargin.top;
  double left = self->_headerMargin.left;
  double bottom = self->_headerMargin.bottom;
  double right = self->_headerMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHeaderMargin:(UIEdgeInsets)a3
{
  self->_headerMargin = a3;
}

- (UIEdgeInsets)headerPadding
{
  double top = self->_headerPadding.top;
  double left = self->_headerPadding.left;
  double bottom = self->_headerPadding.bottom;
  double right = self->_headerPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHeaderPadding:(UIEdgeInsets)a3
{
  self->_headerPadding = a3;
}

- (UIView)headerContentView
{
  return self->_headerContentView;
}

- (void)setHeaderContentView:(id)a3
{
}

- (NSArray)dataViews
{
  return self->_dataViews;
}

- (void)setDataViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataViews, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end