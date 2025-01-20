@interface AnchoredValuePair
+ (AnchoredValuePair)pairWithValue:(double)a3 size:(double)a4 layoutShift:(BOOL)a5;
- (AnchoredValuePair)initWithValue:(double)a3 size:(double)a4 layoutShift:(BOOL)a5;
- (BOOL)layoutShift;
- (double)size;
- (double)value;
- (id)description;
- (void)setLayoutShift:(BOOL)a3;
- (void)setSize:(double)a3;
- (void)setValue:(double)a3;
@end

@implementation AnchoredValuePair

- (double)size
{
  return self->_size;
}

+ (AnchoredValuePair)pairWithValue:(double)a3 size:(double)a4 layoutShift:(BOOL)a5
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithValue:a5 size:a3 layoutShift:a4];

  return (AnchoredValuePair *)v5;
}

- (AnchoredValuePair)initWithValue:(double)a3 size:(double)a4 layoutShift:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AnchoredValuePair;
  result = [(AnchoredValuePair *)&v9 init];
  if (result)
  {
    result->_value = a3;
    result->_size = a4;
    result->_layoutShift = a5;
  }
  return result;
}

- (double)value
{
  return self->_value;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = +[NSNumber numberWithDouble:self->_value];
  id v5 = +[NSNumber numberWithDouble:self->_size];
  v6 = +[NSNumber numberWithBool:self->_layoutShift];
  v7 = +[NSString stringWithFormat:@"<%@: %p\t Value: %@\t Size: %@\t LayoutShift: %@>", v3, self, v4, v5, v6];

  return v7;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (BOOL)layoutShift
{
  return self->_layoutShift;
}

- (void)setLayoutShift:(BOOL)a3
{
  self->_layoutShift = a3;
}

@end