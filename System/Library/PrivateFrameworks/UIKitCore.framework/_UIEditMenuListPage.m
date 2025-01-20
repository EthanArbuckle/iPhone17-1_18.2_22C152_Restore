@interface _UIEditMenuListPage
- (BOOL)isEqual:(id)a3;
- (_NSRange)range;
- (_UIEditMenuListPage)initWithStartIndex:(int64_t)a3;
- (double)itemSpacing;
- (double)overlapWidth;
- (double)width;
- (id)description;
- (int64_t)_resolvedNumberOfPagesForItemSpacing;
- (int64_t)numberOfItemsUsingItemSpacing;
- (void)appendItemWithWidth:(double)a3;
- (void)enforceMinimumWidth:(double)a3;
- (void)prependItemWithWidth:(double)a3;
- (void)removeLastItemWithWidth:(double)a3;
- (void)setItemSpacing:(double)a3;
- (void)setNumberOfItemsUsingItemSpacing:(int64_t)a3;
- (void)setOverlapWidth:(double)a3;
@end

@implementation _UIEditMenuListPage

- (_UIEditMenuListPage)initWithStartIndex:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuListPage;
  result = [(_UIEditMenuListPage *)&v5 init];
  if (result)
  {
    result->_range.location = a3;
    result->_range.length = 0;
    result->_width = 0.0;
    result->_itemSpacing = 0.0;
    result->_numberOfItemsUsingItemSpacing = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (double)width
{
  if (!self->_range.length) {
    return 0.0;
  }
  double width = self->_width;
  return width
       + self->_itemSpacing
       * (double)[(_UIEditMenuListPage *)self _resolvedNumberOfPagesForItemSpacing];
}

- (void)appendItemWithWidth:(double)a3
{
  self->_double width = self->_width + a3;
  ++self->_range.length;
}

- (void)prependItemWithWidth:(double)a3
{
}

- (void)removeLastItemWithWidth:(double)a3
{
  self->_double width = self->_width - a3;
  --self->_range.length;
}

- (void)enforceMinimumWidth:(double)a3
{
  self->_double width = fmax(a3, self->_width);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v11.location = [(_UIEditMenuListPage *)self range];
  v6 = NSStringFromRange(v11);
  [(_UIEditMenuListPage *)self width];
  v8 = [v3 stringWithFormat:@"<%@ %p: range: %@, page width %.2f>", v5, self, v6, v7];

  return v8;
}

- (int64_t)_resolvedNumberOfPagesForItemSpacing
{
  int64_t numberOfItemsUsingItemSpacing = self->_numberOfItemsUsingItemSpacing;
  if (numberOfItemsUsingItemSpacing == 0x7FFFFFFFFFFFFFFFLL) {
    return self->_range.length - 1;
  }
  if (numberOfItemsUsingItemSpacing <= 1) {
    int64_t numberOfItemsUsingItemSpacing = 1;
  }
  unint64_t v4 = numberOfItemsUsingItemSpacing - 1;
  if (v4 >= self->_range.length - 1) {
    return self->_range.length - 1;
  }
  else {
    return v4;
  }
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (_UIEditMenuListPage *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(_UIEditMenuListPage *)v4 range];
      uint64_t v7 = v6;
      BOOL v9 = 0;
      if (v5 == [(_UIEditMenuListPage *)self range] && v7 == v8)
      {
        [(_UIEditMenuListPage *)self width];
        double v11 = v10;
        [(_UIEditMenuListPage *)v4 width];
        BOOL v9 = v11 == v12;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)overlapWidth
{
  return self->_overlapWidth;
}

- (void)setOverlapWidth:(double)a3
{
  self->_overlapWidth = a3;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (int64_t)numberOfItemsUsingItemSpacing
{
  return self->_numberOfItemsUsingItemSpacing;
}

- (void)setNumberOfItemsUsingItemSpacing:(int64_t)a3
{
  self->_int64_t numberOfItemsUsingItemSpacing = a3;
}

@end