@interface TYTextDirectionAnnotation
+ (id)initWithRange:(_NSRange)a3 textDirection:(unint64_t)a4;
- (_NSRange)range;
- (id)description;
- (unint64_t)textDirection;
- (void)setRange:(_NSRange)a3;
- (void)setTextDirection:(unint64_t)a3;
@end

@implementation TYTextDirectionAnnotation

+ (id)initWithRange:(_NSRange)a3 textDirection:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v7 = objc_alloc_init(TYTextDirectionAnnotation);
  -[TYTextDirectionAnnotation setRange:](v7, "setRange:", location, length);
  [(TYTextDirectionAnnotation *)v7 setTextDirection:a4];
  return v7;
}

- (id)description
{
  unint64_t v3 = [(TYTextDirectionAnnotation *)self textDirection];
  if (v3 - 1 > 3) {
    v4 = @"Unknown direction";
  }
  else {
    v4 = off_2655598D8[v3 - 1];
  }
  v5 = NSString;
  v10.NSUInteger location = [(TYTextDirectionAnnotation *)self range];
  v6 = NSStringFromRange(v10);
  v7 = [v5 stringWithFormat:@"%@: %@", v6, v4];

  return v7;
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

- (unint64_t)textDirection
{
  return self->_textDirection;
}

- (void)setTextDirection:(unint64_t)a3
{
  self->_textDirection = a3;
}

@end