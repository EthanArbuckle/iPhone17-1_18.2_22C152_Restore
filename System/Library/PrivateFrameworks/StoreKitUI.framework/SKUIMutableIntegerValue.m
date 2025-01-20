@interface SKUIMutableIntegerValue
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)integerValue;
- (unint64_t)hash;
- (void)hash;
- (void)setIntegerValue:(int64_t)a3;
@end

@implementation SKUIMutableIntegerValue

- (unint64_t)hash
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIMutableIntegerValue *)v3 hash];
      }
    }
  }
  return ~self->_integerValue;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SKUIMutableIntegerValue *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMutableIntegerValue isEqual:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v13 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_integerValue == self->_integerValue;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMutableIntegerValue copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  BOOL v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v13 setIntegerValue:self->_integerValue];
  return v13;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (void)setIntegerValue:(int64_t)a3
{
  self->_integerValue = a3;
}

- (void)hash
{
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end