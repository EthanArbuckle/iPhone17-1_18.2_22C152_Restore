@interface SUUIScreenshotDataConsumer
+ (SUUIScreenshotDataConsumer)consumerWithScreenshotSize:(CGSize)a3;
+ (id)consumer;
- (BOOL)forcesPortrait;
- (id)imageForColor:(id)a3 size:(CGSize)a4;
- (id)imageForImage:(id)a3;
- (void)setForcesPortrait:(BOOL)a3;
@end

@implementation SUUIScreenshotDataConsumer

+ (id)consumer
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SUUIScreenshotDataConsumer;
  v2 = objc_msgSendSuper2(&v4, sel_consumer);
  return v2;
}

+ (SUUIScreenshotDataConsumer)consumerWithScreenshotSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [a1 consumer];
  objc_msgSend(v5, "setImageSize:", width, height);
  v6 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  [v5 setBorderColor:v6];

  objc_msgSend(v5, "setBorderWidths:", 1.0, 1.0, 1.0, 1.0);
  return (SUUIScreenshotDataConsumer *)v5;
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  BOOL forcesPortrait = self->_forcesPortrait;
  BOOL v5 = a4.width > a4.height;
  if (forcesPortrait && v5) {
    double height = a4.height;
  }
  else {
    double height = a4.width;
  }
  if (forcesPortrait && v5) {
    a4.double height = a4.width;
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIScreenshotDataConsumer;
  v7 = -[SUUIStyledImageDataConsumer imageForColor:size:](&v9, sel_imageForColor_size_, a3, height, a4.height);
  return v7;
}

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_forcesPortrait)
  {
    [v4 size];
    double v7 = v6;
    [v5 size];
    if (v7 > v8)
    {
      id v9 = objc_alloc(MEMORY[0x263F827E8]);
      id v10 = v5;
      uint64_t v11 = [v10 CGImage];
      [v10 scale];
      BOOL v5 = objc_msgSend(v9, "initWithCGImage:scale:orientation:", v11, 2);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SUUIScreenshotDataConsumer;
  v12 = [(SUUIStyledImageDataConsumer *)&v14 imageForImage:v5];

  return v12;
}

- (BOOL)forcesPortrait
{
  return self->_forcesPortrait;
}

- (void)setForcesPortrait:(BOOL)a3
{
  self->_BOOL forcesPortrait = a3;
}

@end