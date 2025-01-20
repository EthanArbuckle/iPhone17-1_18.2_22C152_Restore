@interface TTRNLTextStructuredEventLocation
- (TTRNLTextStructuredEventLocation)initWithRange:(_NSRange)a3 locationType:(int64_t)a4 proximity:(int64_t)a5;
- (_NSRange)range;
- (id)description;
- (int64_t)locationType;
- (int64_t)proximity;
- (void)setLocationType:(int64_t)a3;
- (void)setProximity:(int64_t)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation TTRNLTextStructuredEventLocation

- (TTRNLTextStructuredEventLocation)initWithRange:(_NSRange)a3 locationType:(int64_t)a4 proximity:(int64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)TTRNLTextStructuredEventLocation;
  result = [(TTRNLTextStructuredEventLocation *)&v10 init];
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
    result->_locationType = a4;
    result->_proximity = a5;
  }
  return result;
}

- (id)description
{
  unint64_t v3 = [(TTRNLTextStructuredEventLocation *)self locationType];
  v4 = @"unknown";
  if (v3 <= 2) {
    v4 = off_1E5CC8CC0[v3];
  }
  int64_t v5 = [(TTRNLTextStructuredEventLocation *)self proximity];
  v6 = @"leave";
  if (v5 != 1) {
    v6 = @"unknown";
  }
  if (v5) {
    v7 = v6;
  }
  else {
    v7 = @"enter";
  }
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  objc_super v10 = NSStringFromClass(v9);
  v15.NSUInteger location = [(TTRNLTextStructuredEventLocation *)self range];
  v11 = NSStringFromRange(v15);
  v12 = [v8 stringWithFormat:@"<%@ range=%@, locationType=%@, proximity=%@>", v10, v11, v4, v7];

  return v12;
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

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

@end