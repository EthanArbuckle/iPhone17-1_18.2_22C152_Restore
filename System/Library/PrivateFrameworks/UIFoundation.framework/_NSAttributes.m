@interface _NSAttributes
- (_NSAttributes)initWithAttributes:(id)a3 range:(_NSRange)a4;
- (void)dealloc;
- (void)setAttributesInTextStorage:(id)a3;
@end

@implementation _NSAttributes

- (_NSAttributes)initWithAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)_NSAttributes;
  v7 = [(_NSAttributes *)&v9 init];
  if (v7)
  {
    v7->_attributes = (NSDictionary *)a3;
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSAttributes;
  [(_NSAttributes *)&v3 dealloc];
}

- (void)setAttributesInTextStorage:(id)a3
{
}

@end