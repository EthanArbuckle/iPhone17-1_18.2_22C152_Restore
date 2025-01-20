@interface SKUITemplatedBadgeImageConsumer
- (UIColor)templateColor;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
- (void)setTemplateColor:(id)a3;
@end

@implementation SKUITemplatedBadgeImageConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUITemplatedBadgeImageConsumer objectForData:response:error:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUITemplatedBadgeImageConsumer;
  uint64_t v10 = [(SKUIImageDataConsumer *)&v16 objectForData:v8 response:v9 error:a5];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [(SKUITemplatedBadgeImageConsumer *)self templateColor];

    if (v12)
    {
      uint64_t v13 = [(SKUITemplatedBadgeImageConsumer *)self templateColor];
      v14 = [v11 _flatImageWithColor:v13];

      v11 = (void *)v13;
    }
    else
    {
      v14 = [(SKUIImageDataConsumer *)self imageForImage:v11];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (UIColor)templateColor
{
  return self->_templateColor;
}

- (void)setTemplateColor:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)objectForData:response:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITemplatedBadgeImageConsumer objectForData:response:error:]";
}

@end