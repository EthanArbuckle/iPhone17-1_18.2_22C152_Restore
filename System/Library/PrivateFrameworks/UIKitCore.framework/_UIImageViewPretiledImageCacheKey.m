@interface _UIImageViewPretiledImageCacheKey
+ (id)cacheKeyWithOriginalImage:(id)a3 pretiledSize:(CGSize)a4;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UIImageViewPretiledImageCacheKey

+ (id)cacheKeyWithOriginalImage:(id)a3 pretiledSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = a3;
  v7 = objc_alloc_init(_UIImageViewPretiledImageCacheKey);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_originalImage, v6);
    v8->_pretiledSize.CGFloat width = width;
    v8->_pretiledSize.CGFloat height = height;
    v9 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalImage);
  unint64_t v4 = (unint64_t)(self->_pretiledSize.height + self->_pretiledSize.width
                                                     + (double)(unint64_t)WeakRetained);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    id WeakRetained = objc_loadWeakRetained(v5 + 1);
    id v7 = objc_loadWeakRetained((id *)&self->_originalImage);
    BOOL v8 = WeakRetained == v7
      && *((double *)v5 + 3) == self->_pretiledSize.height
      && *((double *)v5 + 2) == self->_pretiledSize.width;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalImage);
  id v6 = NSStringFromCGSize(self->_pretiledSize);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; originalImage = %@; pretiledSize = %@>",
    v4,
    self,
    WeakRetained,
  id v7 = v6);

  return v7;
}

- (void).cxx_destruct
{
}

@end