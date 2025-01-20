@interface TLKGridImageItem
- (CGRect)frame;
- (NSString)description;
- (NUISizeCache)sizeCache;
- (_NSRange)columnRange;
- (double)horizontalCompressionResistance;
- (double)horizontalHuggingPriority;
- (unint64_t)row;
- (void)setColumnRange:(_NSRange)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHorizontalCompressionResistance:(double)a3;
- (void)setHorizontalHuggingPriority:(double)a3;
- (void)setRow:(unint64_t)a3;
- (void)setSizeCache:(id)a3;
@end

@implementation TLKGridImageItem

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TLKGridImageItem;
  v4 = [(TLKGridImageItem *)&v8 description];
  [(TLKGridImageItem *)self frame];
  v5 = NSStringFromCGRect(v10);
  v6 = [v3 stringWithFormat:@"%@ frame - %@", v4, v5];

  return (NSString *)v6;
}

- (CGRect)frame
{
  double x = self->frame.origin.x;
  double y = self->frame.origin.y;
  double width = self->frame.size.width;
  double height = self->frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->frame = a3;
}

- (_NSRange)columnRange
{
  p_columnRange = &self->columnRange;
  NSUInteger location = self->columnRange.location;
  NSUInteger length = p_columnRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setColumnRange:(_NSRange)a3
{
  self->columnRange = a3;
}

- (unint64_t)row
{
  return self->row;
}

- (void)setRow:(unint64_t)a3
{
  self->row = a3;
}

- (double)horizontalHuggingPriority
{
  return self->horizontalHuggingPriority;
}

- (void)setHorizontalHuggingPriority:(double)a3
{
  self->horizontalHuggingPrioritdouble y = a3;
}

- (double)horizontalCompressionResistance
{
  return self->horizontalCompressionResistance;
}

- (void)setHorizontalCompressionResistance:(double)a3
{
  self->horizontalCompressionResistance = a3;
}

- (NUISizeCache)sizeCache
{
  return self->sizeCache;
}

- (void)setSizeCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end