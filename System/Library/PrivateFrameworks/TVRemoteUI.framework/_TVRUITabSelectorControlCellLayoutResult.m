@interface _TVRUITabSelectorControlCellLayoutResult
- (CGSize)resolvedLayoutSize;
- (_TVRUITabSelectorControlCellLayoutResult)initWithResolvedLayoutSize:(CGSize)a3;
@end

@implementation _TVRUITabSelectorControlCellLayoutResult

- (_TVRUITabSelectorControlCellLayoutResult)initWithResolvedLayoutSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)_TVRUITabSelectorControlCellLayoutResult;
  result = [(_TVRUITabSelectorControlCellLayoutResult *)&v6 init];
  if (result)
  {
    result->_resolvedLayoutSize.CGFloat width = width;
    result->_resolvedLayoutSize.CGFloat height = height;
  }
  return result;
}

- (CGSize)resolvedLayoutSize
{
  double width = self->_resolvedLayoutSize.width;
  double height = self->_resolvedLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end