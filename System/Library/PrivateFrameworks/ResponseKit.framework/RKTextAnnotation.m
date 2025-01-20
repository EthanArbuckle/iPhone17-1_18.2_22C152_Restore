@interface RKTextAnnotation
- (BOOL)isEqual:(id)a3;
- (BOOL)machineGenerated;
- (RKTextAnnotation)init;
- (RKTextAnnotation)initWithRange:(_NSRange)a3 andType:(unint64_t)a4 machineGenerated:(BOOL)a5;
- (_NSRange)range;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setMachineGenerated:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation RKTextAnnotation

- (RKTextAnnotation)init
{
  return self;
}

- (RKTextAnnotation)initWithRange:(_NSRange)a3 andType:(unint64_t)a4 machineGenerated:(BOOL)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)RKTextAnnotation;
  result = [(RKTextAnnotation *)&v10 init];
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
    result->_type = a4;
    result->_machineGenerated = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(RKTextAnnotation *)self range];
    uint64_t v8 = v7;
    BOOL v10 = 0;
    if (v6 == [v5 range] && v8 == v9)
    {
      unint64_t v11 = [(RKTextAnnotation *)self type];
      BOOL v10 = v11 == [v5 type];
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(RKTextAnnotation *)self range];
  [(RKTextAnnotation *)self range];
  return v4 ^ v3 ^ [(RKTextAnnotation *)self type];
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)machineGenerated
{
  return self->_machineGenerated;
}

- (void)setMachineGenerated:(BOOL)a3
{
  self->_machineGenerated = a3;
}

@end