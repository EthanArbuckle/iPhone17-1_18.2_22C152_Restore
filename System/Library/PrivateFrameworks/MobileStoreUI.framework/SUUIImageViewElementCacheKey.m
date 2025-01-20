@interface SUUIImageViewElementCacheKey
- (BOOL)isEqual:(id)a3;
- (SUUIImageViewElementCacheKey)initWithURL:(id)a3 size:(CGSize)a4 imageTreatment:(id)a5;
- (unint64_t)hash;
@end

@implementation SUUIImageViewElementCacheKey

- (SUUIImageViewElementCacheKey)initWithURL:(id)a3 size:(CGSize)a4 imageTreatment:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SUUIImageViewElementCacheKey;
  v12 = [(SUUIImageViewElementCacheKey *)&v14 init];
  if (v12)
  {
    v12->_imageTreatment = SUUIImageTreatmentForString(v11);
    v12->_size.CGFloat width = width;
    v12->_size.CGFloat height = height;
    objc_storeStrong((id *)&v12->_url, a3);
  }

  return v12;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_url hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUUIImageViewElementCacheKey *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && *(uint64_t *)&self->_size.height == *(uint64_t *)&v4->_size.height
      && *(uint64_t *)&self->_size.width == *(uint64_t *)&v4->_size.width
      && self->_imageTreatment == v4->_imageTreatment)
    {
      char v6 = [(NSURL *)self->_url isEqual:v4->_url];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end