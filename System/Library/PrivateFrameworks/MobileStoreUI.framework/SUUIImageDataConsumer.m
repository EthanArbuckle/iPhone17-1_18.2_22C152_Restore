@interface SUUIImageDataConsumer
- (BOOL)isImagePlaceholderAvailable;
- (id)imageForColor:(id)a3;
- (id)imageForColor:(id)a3 size:(CGSize)a4;
- (id)imageForImage:(id)a3;
- (id)imagePlaceholderForColor:(id)a3;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SUUIImageDataConsumer

- (id)imageForColor:(id)a3
{
  return 0;
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  return 0;
}

- (id)imageForImage:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)imagePlaceholderForColor:(id)a3
{
  return 0;
}

- (BOOL)isImagePlaceholderAvailable
{
  return 0;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  v6 = (objc_class *)MEMORY[0x263F827E8];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  v10 = objc_msgSend(v8, "initWithData:scale:", v7);

  if (v10)
  {
    v11 = [(SUUIImageDataConsumer *)self imageForImage:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end