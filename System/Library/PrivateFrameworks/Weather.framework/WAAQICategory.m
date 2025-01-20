@interface WAAQICategory
- (UIColor)color;
- (WAAQICategory)initWithRange:(_NSRange)a3 color:(id)a4;
- (_NSRange)range;
@end

@implementation WAAQICategory

- (WAAQICategory)initWithRange:(_NSRange)a3 color:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WAAQICategory;
  v9 = [(WAAQICategory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_range.NSUInteger location = location;
    v9->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v9->_color, a4);
  }

  return v10;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end