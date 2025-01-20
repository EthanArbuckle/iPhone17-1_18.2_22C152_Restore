@interface SKUIPlaceholderIndexBarEntry
- (BOOL)isEqual:(id)a3;
- (CGSize)_calculatedContentSize;
- (CGSize)placeholderSize;
- (SKUIPlaceholderIndexBarEntry)initWithPlaceholderSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation SKUIPlaceholderIndexBarEntry

- (SKUIPlaceholderIndexBarEntry)initWithPlaceholderSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIPlaceholderIndexBarEntry initWithPlaceholderSize:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIPlaceholderIndexBarEntry;
  v14 = [(SKUIPlaceholderIndexBarEntry *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_placeholderSize.CGFloat width = width;
    v14->_placeholderSize.CGFloat height = height;
    [(SKUIIndexBarEntry *)v14 setEntryType:4];
  }
  return v15;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = NSStringFromCGSize(self->_placeholderSize);
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %p placeholderSize:%@>", v5, self, v6];

  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIPlaceholderIndexBarEntry;
  return [(SKUIIndexBarEntry *)&v3 hash] ^ (unint64_t)(self->_placeholderSize.width * 1000.0) ^ (unint64_t)(self->_placeholderSize.height * 10000.0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SKUIPlaceholderIndexBarEntry *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (v7.receiver = self,
          v7.super_class = (Class)SKUIPlaceholderIndexBarEntry,
          [(SKUIIndexBarEntry *)&v7 isEqual:v4])
      && v4->_placeholderSize.height == self->_placeholderSize.height
      && v4->_placeholderSize.width == self->_placeholderSize.width;
  }

  return v5;
}

- (CGSize)_calculatedContentSize
{
  double width = self->_placeholderSize.width;
  double height = self->_placeholderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)placeholderSize
{
  double width = self->_placeholderSize.width;
  double height = self->_placeholderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)initWithPlaceholderSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end