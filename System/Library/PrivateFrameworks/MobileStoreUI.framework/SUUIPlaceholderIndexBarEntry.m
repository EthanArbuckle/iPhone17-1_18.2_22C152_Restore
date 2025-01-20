@interface SUUIPlaceholderIndexBarEntry
- (BOOL)isEqual:(id)a3;
- (CGSize)_calculatedContentSize;
- (CGSize)placeholderSize;
- (SUUIPlaceholderIndexBarEntry)initWithPlaceholderSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation SUUIPlaceholderIndexBarEntry

- (SUUIPlaceholderIndexBarEntry)initWithPlaceholderSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)SUUIPlaceholderIndexBarEntry;
  v5 = [(SUUIPlaceholderIndexBarEntry *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_placeholderSize.CGFloat width = width;
    v5->_placeholderSize.CGFloat height = height;
    [(SUUIIndexBarEntry *)v5 setEntryType:4];
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromCGSize(self->_placeholderSize);
  v7 = [v3 stringWithFormat:@"<%@ %p placeholderSize:%@>", v5, self, v6];

  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIPlaceholderIndexBarEntry;
  return [(SUUIIndexBarEntry *)&v3 hash] ^ (unint64_t)(self->_placeholderSize.width * 1000.0) ^ (unint64_t)(self->_placeholderSize.height * 10000.0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUUIPlaceholderIndexBarEntry *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (v7.receiver = self,
          v7.super_class = (Class)SUUIPlaceholderIndexBarEntry,
          [(SUUIIndexBarEntry *)&v7 isEqual:v4])
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

@end