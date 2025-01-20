@interface SUUITemplatedBadgeImageConsumer
- (UIColor)templateColor;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
- (void)setTemplateColor:(id)a3;
@end

@implementation SUUITemplatedBadgeImageConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SUUITemplatedBadgeImageConsumer;
  uint64_t v6 = [(SUUIImageDataConsumer *)&v12 objectForData:a3 response:a4 error:a5];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(SUUITemplatedBadgeImageConsumer *)self templateColor];

    if (v8)
    {
      uint64_t v9 = [(SUUITemplatedBadgeImageConsumer *)self templateColor];
      v10 = [v7 _flatImageWithColor:v9];

      v7 = (void *)v9;
    }
    else
    {
      v10 = [(SUUIImageDataConsumer *)self imageForImage:v7];
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
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

@end