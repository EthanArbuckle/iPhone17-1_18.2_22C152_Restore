@interface SUUIMutableIntegerValue
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)integerValue;
- (unint64_t)hash;
- (void)setIntegerValue:(int64_t)a3;
@end

@implementation SUUIMutableIntegerValue

- (unint64_t)hash
{
  return ~self->_integerValue;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUUIMutableIntegerValue *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_integerValue == self->_integerValue;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setIntegerValue:self->_integerValue];
  return v4;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (void)setIntegerValue:(int64_t)a3
{
  self->_integerValue = a3;
}

@end