@interface SKUIArtworkRequest
- (BOOL)cachesInMemory;
- (NSString)imageName;
- (NSURL)URL;
- (SKUIArtworkRequestDelegate)delegate;
- (SSVURLDataConsumer)dataConsumer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newLoadOperation;
- (void)cachesInMemory;
- (void)description;
- (void)finishWithResource:(id)a3;
- (void)newLoadOperation;
- (void)setDataConsumer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageName:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SKUIArtworkRequest

- (id)description
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIArtworkRequest description]();
  }
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(SKUIArtworkRequest *)self URL];
  v7 = [v3 stringWithFormat:@"<%@:%p URL = %@>", v5, self, v6];;

  return v7;
}

- (BOOL)cachesInMemory
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        [(SKUIArtworkRequest *)v2 cachesInMemory];
      }
    }
  }
  return 1;
}

- (void)finishWithResource:(id)a3
{
  uint64_t v4 = (UIImage *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIArtworkRequest finishWithResource:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained artworkRequest:self didLoadImage:v4];
  }
  else
  {
    v14 = [(SKUIArtworkRequest *)self URL];
    v15 = [v14 scheme];
    char v16 = [v15 isEqualToString:@"x-apple-identity-image"];

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E4FB1818];
      v18 = UIImagePNGRepresentation(v4);
      v19 = [v17 imageWithData:v18];
    }
    else
    {
      v19 = v4;
    }
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v19, @"SKUIArtworkRequestImageKey", 0);
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 postNotificationName:@"SKUIArtworkRequestDidLoadImageNotification" object:self userInfo:v20];
  }
}

- (id)newLoadOperation
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        [(SKUIArtworkRequest *)v3 newLoadOperation];
      }
    }
  }
  return [[SKUILoadArtworkResourceOperation alloc] initWithResourceRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIArtworkRequest copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIArtworkRequest;
  v13 = [(SKUIResourceRequest *)&v20 copyWithZone:a3];
  objc_storeStrong(v13 + 3, self->_dataConsumer);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak(v13 + 4, WeakRetained);

  uint64_t v15 = [(NSString *)self->_imageName copyWithZone:a3];
  id v16 = v13[5];
  v13[5] = (id)v15;

  uint64_t v17 = [(NSURL *)self->_url copyWithZone:a3];
  id v18 = v13[6];
  v13[6] = (id)v17;

  return v13;
}

- (SSVURLDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (void)setDataConsumer:(id)a3
{
}

- (SKUIArtworkRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIArtworkRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

- (void)description
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIArtworkRequest description]";
}

- (void)cachesInMemory
{
}

- (void)finishWithResource:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)newLoadOperation
{
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end