@interface SBLineFragment
+ (id)fragmentWithIndex:(unint64_t)a3 length:(unint64_t)a4 lineWidth:(double)a5;
- (_NSRange)range;
- (double)lineWidth;
- (id)description;
- (unint64_t)index;
- (void)setIndex:(unint64_t)a3;
- (void)setLineWidth:(double)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation SBLineFragment

+ (id)fragmentWithIndex:(unint64_t)a3 length:(unint64_t)a4 lineWidth:(double)a5
{
  v8 = objc_alloc_init(SBLineFragment);
  [(SBLineFragment *)v8 setIndex:a3];
  -[SBLineFragment setRange:](v8, "setRange:", a3, a4);
  [(SBLineFragment *)v8 setLineWidth:a5];
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v10.location = [(SBLineFragment *)self range];
  v5 = NSStringFromRange(v10);
  [(SBLineFragment *)self lineWidth];
  v7 = [v3 stringWithFormat:@"<%@ %p; range: %@; lineWidth: %.1f>", v4, self, v5, v6];

  return v7;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

@end