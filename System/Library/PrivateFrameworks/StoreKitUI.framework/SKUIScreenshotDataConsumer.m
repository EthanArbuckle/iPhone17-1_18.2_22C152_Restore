@interface SKUIScreenshotDataConsumer
+ (id)consumer;
+ (id)consumerWithScreenshotSize:(CGSize)a3;
+ (void)consumer;
- (BOOL)forcesPortrait;
- (id)imageForColor:(id)a3 size:(CGSize)a4;
- (id)imageForImage:(id)a3;
- (void)setForcesPortrait:(BOOL)a3;
@end

@implementation SKUIScreenshotDataConsumer

+ (id)consumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIScreenshotDataConsumer consumer];
      }
    }
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___SKUIScreenshotDataConsumer;
  v11 = objc_msgSendSuper2(&v13, sel_consumer);

  return v11;
}

+ (id)consumerWithScreenshotSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        +[SKUIScreenshotDataConsumer consumerWithScreenshotSize:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v14 = [a1 consumer];
  objc_msgSend(v14, "setImageSize:", width, height);
  v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  [v14 setBorderColor:v15];

  objc_msgSend(v14, "setBorderWidths:", 1.0, 1.0, 1.0, 1.0);

  return v14;
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIScreenshotDataConsumer imageForColor:size:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  BOOL forcesPortrait = self->_forcesPortrait;
  BOOL v17 = width > height;
  if (forcesPortrait && v17) {
    double v18 = height;
  }
  else {
    double v18 = width;
  }
  if (forcesPortrait && v17) {
    double v19 = width;
  }
  else {
    double v19 = height;
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIScreenshotDataConsumer;
  v20 = -[SKUIStyledImageDataConsumer imageForColor:size:](&v22, sel_imageForColor_size_, v7, v18, v19);

  return v20;
}

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIScreenshotDataConsumer imageForImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_forcesPortrait)
  {
    [v4 size];
    double v14 = v13;
    [v4 size];
    if (v14 > v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4FB1818]);
      id v17 = v4;
      uint64_t v18 = [v17 CGImage];
      [v17 scale];
      id v4 = (id)objc_msgSend(v16, "initWithCGImage:scale:orientation:", v18, 2);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIScreenshotDataConsumer;
  double v19 = [(SKUIStyledImageDataConsumer *)&v21 imageForImage:v4];

  return v19;
}

- (BOOL)forcesPortrait
{
  return self->_forcesPortrait;
}

- (void)setForcesPortrait:(BOOL)a3
{
  self->_BOOL forcesPortrait = a3;
}

+ (void)consumer
{
}

+ (void)consumerWithScreenshotSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageForColor:(uint64_t)a3 size:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageForImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end