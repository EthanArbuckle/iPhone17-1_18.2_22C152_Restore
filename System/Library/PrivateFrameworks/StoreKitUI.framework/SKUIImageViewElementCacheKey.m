@interface SKUIImageViewElementCacheKey
- (BOOL)isEqual:(id)a3;
- (SKUIImageViewElementCacheKey)initWithURL:(id)a3 size:(CGSize)a4 imageTreatment:(id)a5;
- (unint64_t)hash;
@end

@implementation SKUIImageViewElementCacheKey

- (SKUIImageViewElementCacheKey)initWithURL:(id)a3 size:(CGSize)a4 imageTreatment:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v12) {
        -[SKUIImageViewElementCacheKey initWithURL:size:imageTreatment:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIImageViewElementCacheKey;
  v20 = [(SKUIImageViewElementCacheKey *)&v22 init];
  if (v20)
  {
    v20->_imageTreatment = SKUIImageTreatmentForString(v11);
    v20->_size.CGFloat width = width;
    v20->_size.CGFloat height = height;
    objc_storeStrong((id *)&v20->_url, a3);
  }

  return v20;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_url hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SKUIImageViewElementCacheKey *)a3;
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

- (void)initWithURL:(uint64_t)a3 size:(uint64_t)a4 imageTreatment:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end