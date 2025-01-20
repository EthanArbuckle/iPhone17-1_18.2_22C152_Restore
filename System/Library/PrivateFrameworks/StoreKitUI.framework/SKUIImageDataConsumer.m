@interface SKUIImageDataConsumer
- (BOOL)isImagePlaceholderAvailable;
- (id)imageForColor:(id)a3;
- (id)imageForColor:(id)a3 size:(CGSize)a4;
- (id)imageForImage:(id)a3;
- (id)imagePlaceholderForColor:(id)a3;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
- (void)isImagePlaceholderAvailable;
@end

@implementation SKUIImageDataConsumer

- (id)imageForColor:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUIImageDataConsumer imageForColor:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIImageDataConsumer imageForColor:size:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  return 0;
}

- (id)imageForImage:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIImageDataConsumer imageForImage:]();
  }

  return v3;
}

- (id)imagePlaceholderForColor:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUIImageDataConsumer imagePlaceholderForColor:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (BOOL)isImagePlaceholderAvailable
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIImageDataConsumer *)v2 isImagePlaceholderAvailable];
      }
    }
  }
  return 0;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIImageDataConsumer objectForData:response:error:]();
  }
  id v7 = objc_alloc(MEMORY[0x1E4FB1818]);
  uint64_t v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  uint64_t v9 = objc_msgSend(v7, "initWithData:scale:", v6);

  if (v9)
  {
    uint64_t v10 = [(SKUIImageDataConsumer *)self imageForImage:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)imageForColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageForColor:(uint64_t)a3 size:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageForImage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIImageDataConsumer imageForImage:]";
}

- (void)imagePlaceholderForColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isImagePlaceholderAvailable
{
}

- (void)objectForData:response:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIImageDataConsumer objectForData:response:error:]";
}

@end