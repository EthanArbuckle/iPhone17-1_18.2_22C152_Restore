@interface TMLRange
+ (void)initializeJSContext:(id)a3;
- (TMLRange)initWithRange:(_NSRange)a3;
- (id)NSRangeValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)length;
- (unint64_t)location;
@end

@implementation TMLRange

- (TMLRange)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)TMLRange;
  result = [(TMLRange *)&v6 init];
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;
  return (id)objc_msgSend_initWithRange_(v8, v9, v10, location, length);
}

- (id)NSRangeValue
{
  return (id)objc_msgSend_valueWithRange_(MEMORY[0x263F08D40], a2, v2, self->_range.location, self->_range.length);
}

+ (void)initializeJSContext:(id)a3
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_239833DC4;
  v9[3] = &unk_264DAB868;
  v9[4] = a1;
  id v3 = a3;
  v4 = (void *)MEMORY[0x23ECA7DD0](v9);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, v6, v4, @"range");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, v8, v4, @"NSMakeRange");
}

- (id)description
{
  return NSStringFromRange(self->_range);
}

- (unint64_t)location
{
  return self->_range.location;
}

- (unint64_t)length
{
  return self->_range.length;
}

@end