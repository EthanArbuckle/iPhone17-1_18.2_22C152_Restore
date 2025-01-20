@interface _UIShadowViewImageCacheKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (_UIShadowViewImageCacheKey)initWithSize:(double)a3 scale:(double)a4 options:(unint64_t)a5;
- (unint64_t)hash;
@end

@implementation _UIShadowViewImageCacheKey

- (_UIShadowViewImageCacheKey)initWithSize:(double)a3 scale:(double)a4 options:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_UIShadowViewImageCacheKey;
  result = [(_UIShadowViewImageCacheKey *)&v9 init];
  if (result)
  {
    result->_scale = a4;
    result->_size = a3;
    result->_options = a5;
  }
  return result;
}

- (unint64_t)hash
{
  return (unint64_t)self->_scale ^ (unint64_t)self->_size ^ self->_options;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIShadowViewImageCacheKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_UIShadowViewImageCacheKey *)self isEqualToCacheKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  v4 = (double *)a3;
  BOOL v5 = v4 && self->_options == *((void *)v4 + 3) && self->_size == v4[2] && self->_scale == v4[1];

  return v5;
}

@end